import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
    vus: Number(__ENV.VUS) || 10,        // usuários virtuais
    duration: __ENV.DURATION || '30s',   // duração do teste
};

// ⚠ X-Custom-ID: MD5("20219015426 alisson")
const CUSTOM_ID = "5e3235a224a70568075f95517ba2a536";

export default function () {
    const baseUrl = __ENV.TARGET_URL || "http://nginx:80";
    const path = __ENV.TARGET_PATH || "/small.html";

    const url = `${baseUrl}${path}`;

    const params = {
        headers: {
            "X-Custom-ID": CUSTOM_ID,
        },
    };

    http.get(url, params);
    sleep(1);
}
