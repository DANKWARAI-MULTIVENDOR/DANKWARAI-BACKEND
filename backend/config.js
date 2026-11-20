/* ==============
   API CONFIG 
================ */
const API_BASE = "https://dankwarai-backend-production.up.railway.app/api";

/* =========================
   OPTIONAL HELPERS
========================= */
function getAPI(url) {
  return `${API_BASE}${url}`;
}
