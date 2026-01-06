Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9A330FF25
	for <llvm@lists.linux.dev>; Tue,  6 Jan 2026 09:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690947; cv=none; b=Uh9Rrz93e2Zb6NqLIUpjU98u1iA1vjtDP72hG1FMz3aGmzHL17vOs65F2tE0sfHe05CF+TEkadYcIakJ3NJW1wMu/BtDB77BN+cLbNmW9EeQ/D5KKNAzh4hbMNYYIbMBbNIUDO9B22jivjaCrQp36hFAH+7xL/8A5iTfvuftXtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690947; c=relaxed/simple;
	bh=KN3KRjm/oDtXh/DCN2KUrl2ZPSM8F0ypALb9+d3CNrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SF1LNJvzXDUErD+whg3EjstVQnzoi8SSAOyU8X43DxHB36Qsz7BIDgiAhqWuk5tRxl62Fu4TBc/kjpJpRKexDP0qO9yqYlDcAmWfQSmwfH9CwH+H1faO8VpdKL2/wtVcEpOV/wz3qYSwwegFOCIGLF+uL9gRwooqY2Ngy4OJes8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UNssgyvH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=COomzn45; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UNssgyvH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="COomzn45"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063wLea2684117
	for <llvm@lists.linux.dev>; Tue, 6 Jan 2026 09:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RUqp4Iv9+wUxLp5PK1JfIBFWlyQtuLekkwcSh0GtSIY=; b=UNssgyvHFOsSoRhz
	hOzHNq2+BwVowQQTIUH3/4CGt1LOpBwuf2jIfcMKVipTU4rvfDxDeMCKH3Rt9ABW
	ijX6rFSRM3IESx2ytEd/9vo8eeL+cU6IhhNRYE12Y2cNq012BRnOBPEj2eXZqhkS
	5qFWVlUWtGUjOIxBCAbbZL1PLIFvwpre1KlwZI552q72amNuXpIL957aBowCCxEb
	1IHJKVQKN1XjLIMSZn+gtQaTyej1nMcO8w9Tzn4HDaO7yvvxdLSKqPmr4U0chZyz
	vW8i/4Xtc10bvN83JL15y3h0P4XERWPcxhEFGs+B0V00P/QeK/JbNJ4yz0OM8gVo
	EI8h5w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgty5gv1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 06 Jan 2026 09:15:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b259f0da04so186585185a.0
        for <llvm@lists.linux.dev>; Tue, 06 Jan 2026 01:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690943; x=1768295743; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUqp4Iv9+wUxLp5PK1JfIBFWlyQtuLekkwcSh0GtSIY=;
        b=COomzn45GcAYHDoJWJwFlitx8YcIB4a1RTgFCVD2mzW0bvbn6AyEWlLDgqF/vxwlLI
         XrUWwIU3xpjb/jZgxEfYk7DEbv5AXi6teMjropaW9gsGiFIjoRdsE6laLNNL1O6A0ik/
         0EaBUxWvU2yx+EibI9FnxsicPlusNCmW7ebSO03N2gC5ae09vFZT5b7OecT0cgYZSdzH
         p+8YrPaHj3XO8uoJxGdALPO1V1vo7MtRVpz36EcrrGyM66JS6rwyWAE2LULX4sdJ2k/1
         Zj4EY/6fQfV5Nz6IjhSguopAa5EcVJBV7hCB+LOeMd1vjrdVLCLUuGuYlm/lhCBeO6rW
         t/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690943; x=1768295743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RUqp4Iv9+wUxLp5PK1JfIBFWlyQtuLekkwcSh0GtSIY=;
        b=XVuwBaGNKH/zAz9kLuQ/XDJjHHPE6rLX17L1iOeoEKRiIMu1ux6mzxvNEKH1lYl4sj
         tYRytoCX2BtnHsQzvrz8QJ8uYdCInmmm6uSU80F0kB/XJbGpAHWhwNtK2RJKlzQANKHp
         k+klgPVm4RqV8xngClymJDLadaNszZX2OZ1+itFH3iaf7v0rIt+hh8MfvSfT+4J/K/yj
         zNPMsZ4uvXpSwksTTajlWdjXqfW9jhAmRQYiqRisd6GTbWJccy6W9yzeajOttCxg9Ho1
         IyiuECNQ+H+pZCY7gMVqPw4rwy/8MltcxtJVYSefWKomLO1c8LR0ZkEb552zrG7neJlW
         ej4w==
X-Forwarded-Encrypted: i=1; AJvYcCWWg8Q8nEnGu81j/zZy3VFGMEkJkv9syFRwJIT0QWFWCi9I9QKUNe3I5xRiiYlNgBl3X2wJ@lists.linux.dev
X-Gm-Message-State: AOJu0YwAC1RPlWE0ADg8YD55FOVoZhCnikrEReP87QGizqEboTMoeBmD
	oCNC8c9FWttDEpgkgMG1NICjAOk+wsD7c3OSw1n8tkRZy0cKJUk8k5+UkRro0DZ5CIBL/hqCiJx
	jpr8uZL32AoH99BRbbIEnpEED57PzMPy8+1Qj/3aUgs9bbwu2KcJL6nSO
X-Gm-Gg: AY/fxX6OBEZAubwa7u1MwoL7WmMGCKbLLOYtUz6SRCi50Q0Fc1rJrUZ2A7fPjW7eVFq
	lvshqUMMBnLydvCXePNxKO8Yl1A6wDHR25/3+kaKfUDTXeeZ4x/mKsuNjIHFlBlOFH1lGQoufnK
	H4l6y9fLtI1lT8WLUpFT27wHLM2McE1TJlwfj3bxjuMqTCt3LYKcWh5Yh8ImTXXwbCWsCXvAcxS
	WJ65Kz8qcRPx0aEZpJoezhr8m20SQzRzCuGGQYAmZ3rMJh6aeTtpxkDiLzKFIwpxO4APrSpzfTg
	l9W4Oz6l7xanfu9WgjBpGn1PlEdZcz6TCj6B2v6xdoo2MH6H+amrJ5eS5MtiUOFPEKidTMdc7Ej
	GHJ0t6r9mXwAMmd5J4XjHy4uHdUyJrFlg8g==
X-Received: by 2002:a05:622a:2b45:b0:4f1:e46b:9dc0 with SMTP id d75a77b69052e-4ffa781fd69mr24540291cf.76.1767690943142;
        Tue, 06 Jan 2026 01:15:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDeuNCrhajN4w2pa9axdtue2qax6nwJTvnc5Cls39nE/xZiXkUxIgLPcpsnvdWju8KVH6lSw==
X-Received: by 2002:a05:622a:2b45:b0:4f1:e46b:9dc0 with SMTP id d75a77b69052e-4ffa781fd69mr24539871cf.76.1767690942649;
        Tue, 06 Jan 2026 01:15:42 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:17 +0100
Subject: [PATCH v2 07/11] clk: imx: imx27: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-of-for-each-compatible-scoped-v2-7-05eb948d91f2@oss.qualcomm.com>
References: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
In-Reply-To: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
To: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1166;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KN3KRjm/oDtXh/DCN2KUrl2ZPSM8F0ypALb9+d3CNrY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKmZXsuC2g+Xb1baVzgLGhhR7Rrcrdg1gFaJ
 ezTFD7yVUmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSpgAKCRDBN2bmhouD
 1z7jD/9kNeKktB5dvv1Vao6f1rBEkvNEL+y0aGnFILkw+fFKcXIFMwxxYzzlQfUksNYfJyOdK8O
 BzBik3cMNTqxSDXOVNd8Ijzd3DEfi8jW+J5PLcEpz7riNnuqwBaJkXRAGKiaxYuEFhSTmp8ICqw
 IA3pRZc2+nUuNYEntoIyQa8N4540M6T9RloRrgx8KA/AcupxDC//I6Cnupv+Pd20xe5DweyVTkL
 rH2B84HPtNXAPqy213xQXzfSNeddPtb1NG64d1aT1mDRyu0GX5lvaZBfoaJd++RukRLmTaNjIXz
 n+mK/Udfsktb5JzVUCENVmlt2iBhLG3eXRTcxRyBYn6ela1urPy/DLLyJfRVAcKLGDB5hj7kR5i
 LM8pl9ZOC8Vy19Pvs0obJ2CD9NKLcL64c4V+ol/46prYOEIctwq0WflPChe5Z/BidWm/rfncPLc
 VyFnW86N5SwGO4QUL3MForM/G7H7qgy3Pwha0smSE3OGOxIbISUBhCw6k5YvVfWG3mbQS9ivvJb
 +dumTJQYrMdyXwOlfy3D1qzf8aomhc6kqmB395QwwcwOFVjxeR4gm9QgipV9wsvcA9aRwOq6cHo
 qEWskUhBBGlAzjTlSUE+Op/O0zRyKACK4ToDJ4MefQdIut8sKN/ADiSTOc8+wgCcD0DJBDVmCsD
 /+ZKdT0xUuqOBng==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfX4PS41c1zwEuc
 nzr4t/HSF6hJ6QusnzgpdFM041esT9Kdzwof1LE0cG0wV6MrpZFZFwjjJe7WJ0slPUbR2Bg9UTK
 k1CoR7uITrxKH0vWqu6P1DLWYHqGq9kWh6+fVM94oyCDdbfoydWshc+goOEByZoyVRWc2oPtKHL
 6SssHoNxE2l0Rj5fzIl0T4kv+1HUGQsx0js4SZ40mpm1cqLdOAeBP5+oC0KZ6pb1w2DbvgWwUtk
 5v4WzWGFIYd9y965toYYUN0XLc5sOoXmvUTT0Y+RR6uHdgXZrA8teTa/G6YdebhNpQoSPfPg39n
 8aOr4DzbiuDH9zc9aq7TTYiYiBBTtzFZA/xcowOeQpsjelZngDKW7VonGhSTwHVz33dV0ODHWDP
 w07A7xPH9mWPGqSr8y/5rHf11VXoqp0el2I/URD0vPNTw66YDLovE937Q2jjEApD9BJ533L4mzk
 TRYkODEQgE5qCtM/k3w==
X-Authority-Analysis: v=2.4 cv=Rfidyltv c=1 sm=1 tr=0 ts=695cd2bf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=ZKLgdMRimQxpfTQYzWgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: AYyijymWr6iJEHySMIAPlE2u0gxSQKBN
X-Proofpoint-ORIG-GUID: AYyijymWr6iJEHySMIAPlE2u0gxSQKBN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060077

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on first patch.
---
 drivers/clk/imx/clk-imx27.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/imx/clk-imx27.c b/drivers/clk/imx/clk-imx27.c
index 99618ded0939..f2f0d3fe5c52 100644
--- a/drivers/clk/imx/clk-imx27.c
+++ b/drivers/clk/imx/clk-imx27.c
@@ -171,17 +171,14 @@ static void __init _mx27_clocks_init(unsigned long fref)
 
 static void __init mx27_clocks_init_dt(struct device_node *np)
 {
-	struct device_node *refnp;
 	u32 fref = 26000000; /* default */
 
-	for_each_compatible_node(refnp, NULL, "fixed-clock") {
+	for_each_compatible_node_scoped(refnp, NULL, "fixed-clock") {
 		if (!of_device_is_compatible(refnp, "fsl,imx-osc26m"))
 			continue;
 
-		if (!of_property_read_u32(refnp, "clock-frequency", &fref)) {
-			of_node_put(refnp);
+		if (!of_property_read_u32(refnp, "clock-frequency", &fref))
 			break;
-		}
 	}
 
 	ccm = of_iomap(np, 0);

-- 
2.51.0

