Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F137630C361
	for <llvm@lists.linux.dev>; Tue,  6 Jan 2026 09:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690943; cv=none; b=m3+AX39RTztYNYgvM+cDVDdbC2ZVc+RrSPw3UX96rhzzjSKYfF8oKDhY1NZi1q9s+QXzpXf5DZwJHToB5RrPoPnFwDHCCmjsSWPWn+RvmiNklzohZBND0EKwVj+8v6h8bTDUF3ZCp5G6rdYCZAky4/02bpIjtBG+lMCjNs5qizU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690943; c=relaxed/simple;
	bh=CcL2dBoqkb70hXswIhn+u0x+0kkWxrj/nvOKr2gseQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yhi3ovOeoqASNVwb6kGikUG6u0+zozT45qs33fQCP/n9N7xzzBqXk0blawgpX3TueWQCnosbcnLJt2iQq+sBcxNIQi1DmzGkrXd3eV4JaotObXwVxPrl2I3umcSmWhkMoixKJ2MvRql6NSH7b13GQAOYaLRIQBz/9w5IY3S+/Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bt7QpBhU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NcwcsrPz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bt7QpBhU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NcwcsrPz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063Q95g2429868
	for <llvm@lists.linux.dev>; Tue, 6 Jan 2026 09:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jv9UX/vL1VNz1ktXt+fRG2Ciov2t8INtnqmx6plWOIw=; b=Bt7QpBhUM67lRrub
	XnhKKB/sVehI4YaGtZlLkz5hDTDM9DeNSWuXNh0C8tuEs66yE8SE4L2HFkIJ+1r4
	37crvmDEv9n6qX4w3BuxHFL3Dzasr21YsgYjE+V/lOyP1mM5Scr04D7q/OyJDFTv
	EgIvS3g/lGoT60ng1HhzWTJS6DRGyrrmnB8Za3UmCbpP9UHUSE8paeHp1Y1u0Wpb
	eecYByuk2JSYiUhBsTy77Gh0Q7rYypE+bGjOvukgMFk4k0ET/Cydzdfg+yIbvS7m
	X9gfda4OxOHA4zNrxIEzqQU0rjXq1NK8hIwBoXsSyKZJ5QxET8VpcSKtMXeNBNXd
	6H9o2Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgr7399un-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 06 Jan 2026 09:15:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a316ede50so16542656d6.0
        for <llvm@lists.linux.dev>; Tue, 06 Jan 2026 01:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690938; x=1768295738; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jv9UX/vL1VNz1ktXt+fRG2Ciov2t8INtnqmx6plWOIw=;
        b=NcwcsrPzN27zfIUNx6EUclVMmJ3ua4pIqZmysnRlb3XTrd9foD+Fs/IJsmRgBDQEvU
         w1kPKUfdkususKyIcnT6OT/hlLAtYSqbHp1SdMwTdDAT4IJ7S1lfc7sUHaV6yyUo2CTK
         xK8txPNmAD44PJ4Pli3JLehblO8gKjMpX0ZWdT7g7qs2rvctN8ZTikW0s26xJH4q2L14
         kTWrk7U93hrDmeVGUKirjPE+vckJrQs8vOYUegr6IpKEoHr30jkYMMvgWdob/eCpOp+2
         6VgcY8x8bg225SUiXfuzyIbwu/O4kspWwS31EjK/QStUbSYyE1unvpUOW1jdo0W9xs8+
         3XWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690938; x=1768295738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jv9UX/vL1VNz1ktXt+fRG2Ciov2t8INtnqmx6plWOIw=;
        b=jwok6ZQL767ozV52PAGmpIgxPbYYrJF9n7fMCvqggRvviQFNSJAekjaIVoXH1c3y6o
         y2l52dT0ZKDE6JGsGT47kPSV3MqlUT4lLpdFkt2WLFknQixtucdWpXHNmmBv5WhY6y4k
         xqQLJsj+0rwitNwluSKwiwBKRpFXMdiqWrh8ykYLzjrpLbiuGelpssX0bsYcX0QWV83l
         O/Gxp/yfB1S7GRwXLyDiyFXVvZzLG5IljtaKVzhb1sbPHm92gj/HUow5MRSeVUtogPFQ
         502rhWrAygNc/IQP9otoS4kl8GYMvkUwgwvyjVbcVU4ZAbLhyYBhfcPGR6bb4B9FFnyG
         HbtA==
X-Forwarded-Encrypted: i=1; AJvYcCWk024F4wtmq3ssP/GHfNp52LnRC9YzAyc1fVG4TdulDM/jgPDhHM+5pT1IhSoKPBRwlgVU@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6vLDyn1wH/4a/vDUqMeRTx1Yeo91KLFqPAmuc3SWUeIqieBu0
	xgxU9auI1c/OpjghlWErul3y6JuDTiwMFbNaZrsDim9Kv8vagheVmaBr5Tnh6stVGScP+pvujLI
	pCL7l2mq6kOf59RsJvadYLQ0saApDymQF3qriA0KnlpDxDSq5a85fej8T
X-Gm-Gg: AY/fxX5WudMEDY591Kt1xwuBU0zYnD+qolSuJJescJ6DPp1OYeHGOwwXsf4x/uBus6D
	n67eyyAFrfkdqoaTY9pjeTXZHXq08j3bGGI0gJUVlVC0H3oNNcJnkM50D5CYiPhkrcO72t7HPJT
	5O82enzyDIhENLpJWx8mOvdy5TlXD8BdsK/1mkLt0HUNNzHPzlOj9sOg2hwRJF9IQXOgkba3bMF
	anAO1TQI+DtvRyOKLRN9uBza9ftyhJl9fXA0e/9032KjE6kt8/aZZrE4aMyMK9EPIK/9XG8PnNt
	qNLfU619Uv/t2smR/j+tDxZeaKz59XRw6Dqub9k99OUzN9xmyMhA49RDr7ebM0a00I3GS1l8heP
	FY9DOkBQ8W/QS4Pr1A8wMrtieaUCP5biTVQ==
X-Received: by 2002:a05:622a:588c:b0:4eb:a6c9:e839 with SMTP id d75a77b69052e-4ffa77c0648mr26146721cf.47.1767690938058;
        Tue, 06 Jan 2026 01:15:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjHrSISO5W+RHtbFoxesZK1qbi3BFpaO3DUV/f+DVaCU9q3ACBvIruRc8VJXRXhXWn+bAw1g==
X-Received: by 2002:a05:622a:588c:b0:4eb:a6c9:e839 with SMTP id d75a77b69052e-4ffa77c0648mr26146461cf.47.1767690937572;
        Tue, 06 Jan 2026 01:15:37 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:15 +0100
Subject: [PATCH v2 05/11] powerpc/wii: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-of-for-each-compatible-scoped-v2-5-05eb948d91f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CcL2dBoqkb70hXswIhn+u0x+0kkWxrj/nvOKr2gseQs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKkBhQzmnu819Q1j3S59efOSUy8B8frf8Oif
 oFQAFjLyXuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSpAAKCRDBN2bmhouD
 1yFFD/oC2ftD9ryyYMAcCvww+JY1z1bD7uWaP5uh6DpPPH76O7rLf8NpHji9WYn3FS9/PeQRqh1
 QgLs2r7YAAG+nbEFuKlb8u5XWcJxalKZsThHBEhmMq/E9c49Zs2f/bm7Z8tGnb8CUbJp6v5TgEZ
 kPhDgH79CQWn8LfXHbXpRKW2xi6Iyg51k8KYVRB/YYRSIwG4mA0jujcBb8iSVPxSg/ScCoC3l4P
 nPn+xtmqDh9NSprtqdFkKQ0sPGNzjqXWy514od6NbTwrPip53myf/RgO2Y3Lo7E5O+UrwXtKBGy
 yPzGvp0MgPbX72kUDCy2i4FOh6PAKWTGD4eUNPkIQtLvIbcOAGrwhQHb2pXUbKTnr64CzSHWnru
 mtUFlUOtgbNGfzogdjslxK8HfRYdV+9YLLYWh5mZIr4i13LSlbSoUfTeECsZByZFXoWWmbI1zRV
 DBwB/2ler64x0rk/oYEBpDXQ0bZECG0Wx68RkRTnpkTQu9s0BdQCVihrXMNXoEF8pMGzMM8ylQT
 3nzvdbVOuIfPuyY+P7M78l2itk6VPF0jKsd5vJ7F49JOGmNFEBT2ceurCdOD0S1XC8uwPmYU6bZ
 +eR/9kV0Zn15DeBOjTgdU4qJKyy1mjkCFv9BD0TRdUDd9TSfgJCFWV72V7YLdumfeyPEDL4/RZd
 iAua0BTHZRiL5Ag==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=QrxTHFyd c=1 sm=1 tr=0 ts=695cd2bc cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=uffMIp6nSmQIayL3VFUA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 180LpAnQdDeWo-WcxJVlixrDq6rcc7pG
X-Proofpoint-GUID: 180LpAnQdDeWo-WcxJVlixrDq6rcc7pG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfX4t1B0w0iH7P3
 mChcieh3ogm3uERKouCG22BvmQFjpvA+4jDHS7CDyxFX1yacdoHOy++Id46RMY41/QjdML7R1qF
 SJstZyf4TkaXfkAOgAh3kbXnawkEcf9jj2iu2Z/fCijrbvDFff9TIdEQXDp3Os18KBcDeVZ8r1u
 EBs+UsF7tTCJ5L9luSzkCYyM9wn8inOnMrhtXB4iYdyisVtnJGbBVoXthFIk1nWIC+5hqJKbZy4
 7eRU1IYZofsc5BUTQlWgvRLR3Ong4GO67SfT96HVE9NOpgXiPxUu1LZMoR9ZHZdFB//6qbMMoIc
 poxg4jG3LjoSxKnOFUgKMRvfkBU1bliDzhdaVMF3VzQ3bxt5FruRdheFF77t6+0dTmRNn4ddAOa
 fwqw/zJVJIO3oKR5/iPl1DAgOmOnx7yTFlrKS9WM7xeWFPfA30aqHMUWsYjbMcv+5lRasd8VGsh
 aNVpZ/ka+YXdyNH+Fvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060077

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the first patch.
---
 arch/powerpc/platforms/embedded6xx/hlwd-pic.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
index b57e87b0b3ce..1522a8bece29 100644
--- a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
+++ b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
@@ -201,11 +201,10 @@ unsigned int hlwd_pic_get_irq(void)
 void __init hlwd_pic_probe(void)
 {
 	struct irq_domain *host;
-	struct device_node *np;
 	const u32 *interrupts;
 	int cascade_virq;
 
-	for_each_compatible_node(np, NULL, "nintendo,hollywood-pic") {
+	for_each_compatible_node_scoped(np, NULL, "nintendo,hollywood-pic") {
 		interrupts = of_get_property(np, "interrupts", NULL);
 		if (interrupts) {
 			host = hlwd_pic_init(np);
@@ -215,7 +214,6 @@ void __init hlwd_pic_probe(void)
 			irq_set_chained_handler(cascade_virq,
 						hlwd_pic_irq_cascade);
 			hlwd_irq_host = host;
-			of_node_put(np);
 			break;
 		}
 	}

-- 
2.51.0

