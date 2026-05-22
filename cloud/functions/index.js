/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const { setGlobalOptions } = require("firebase-functions");
const { onRequest } = require("firebase-functions/https");
const logger = require("firebase-functions/logger");

// For cost control, you can set the maximum number of containers that can be
// running at the same time. This helps mitigate the impact of unexpected
// traffic spikes by instead downgrading performance. This limit is a
// per-function limit. You can override the limit for each function using the
// `maxInstances` option in the function's options, e.g.
// `onRequest({ maxInstances: 5 }, (req, res) => { ... })`.
// NOTE: setGlobalOptions does not apply to functions using the v1 API. V1
// functions should each use functions.runWith({ maxInstances: 10 }) instead.
// In the v1 API, each function can only serve one request per container, so
// this will be the maximum concurrent request count.
setGlobalOptions({ maxInstances: 10 });

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

const { defineSecret } = require("firebase-functions/params");

const openaiKey = defineSecret("OPENAI_API_KEY");

exports.analyzeDiary = onRequest(
  { region: "asia-northeast3", secrets: [openaiKey] },
  async (req, res) => {
    // CORS 헤더
    res.set("Access-Control-Allow-Origin", "*");
    res.set("Access-Control-Allow-Methods", "POST, OPTIONS");
    res.set("Access-Control-Allow-Headers", "Content-Type");

    // OPTIONS 사전 요청 처리
    if (req.method === "OPTIONS") {
      res.status(204).send("");
      return;
    }

    try {
      const diary = req.body.diary || "";

      if (!diary) {
        res.status(400).send({ error: "diary 필드가 비어있어요" });
        return;
      }

      // OpenAI 호출 — 강사 키는 Secret으로 안전 주입
      const openaiRes = await fetch(
        "https://api.openai.com/v1/chat/completions",
        {
          method: "POST",
          headers: {
            Authorization: `Bearer ${process.env.OPENAI_API_KEY}`,
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            model: "gpt-4o-mini",
            messages: [
              {
                role: "user",
                content: `다음 일기의 감정을 한 단어로 답해줘 (예: 기쁨·슬픔·분노·평온·설렘): ${diary}`,
              },
            ],
          }),
        }
      );

      const data = await openaiRes.json();
      const emotion =
        data.choices?.[0]?.message?.content?.trim() || "분석 실패";

      res.send({ emotion });
    } catch (error) {
      console.error("GPT 호출 실패:", error);
      res.status(500).send({ error: error.message });
    }
  }
);

// Register Firebase Secret
// firebase functions:secrets:set OPENAI_API_KEY
