Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE102F5A01
	for <llvm@lists.linux.dev>; Mon,  5 Jan 2026 13:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767620053; cv=none; b=KrqN3U7C1GHCNzAkeGleBbgz/LyfJft1OvEmYzpS8Py8bqMqWMPKPL8XnD8/ggzagipwepy4BISAD3BoaNQHUbMcfuWLItFAkk1cHdlILcbuB3cufx/+tsZUy9oZTBYZuFdp0+qQVJ7gDDJqh48zRBFDMQmxOD9GxgW2OyINyY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767620053; c=relaxed/simple;
	bh=JLd+YJVelW7DAYz5I5oq+Bq5OMySRygwF3/FHKcXlRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YfCZ9zqn8AMAc7PxSYE5kW8ZluLDUW50VPMXqibbY4aYZhdUDFCWlHtApQ2hxqWLgfNKgAqzyR6OFTK1u7rTWr1HgtxpkhrunLnrbJVw1Dtigq1a5+W3R+sYigfTmtg8Su+7+g39ZVk8nZ4UgQtomEwp3jAKFBNdhXw7liqeJlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZTtcHlQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QsmtbcWy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZTtcHlQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QsmtbcWy"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605BTTE31814924
	for <llvm@lists.linux.dev>; Mon, 5 Jan 2026 13:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	apBQxo7qSrwo1nwoLIpfGQYjycgRUvqMuCwBV3g5lLc=; b=ZZTtcHlQNrsTzjLh
	QSr7zfF8N7pHuS//wC9rxrFLzRwLboR0uCAkHp5eH7Vw+IDC2rMxtArb5nn1gNwH
	6N5r+iiSIIVRxY/OkCw55fcjm/PSXGURJB266yofdElUACg/sbqaHMeg+4v/tDKR
	r+JcB9Ihorh+NlFmYLKq9sjRFhKLR+ScWF4dh8v45tc2ddyppRRJFBbglWBcj+ty
	Wh79bhCQ2g81as2nOX+2+tWhNwvvtTi/W9SHzVNUW1Tf1IYhsGpcdgdfXqDy8TrZ
	pdE6b1z1AIT976TA2inhM8ZblQtmAJEGN8iDWA9lXRByd8iU1Z/xrTYGNW8GDOB9
	G1JMsQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beuvd4k8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 05 Jan 2026 13:34:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f4a5dba954so373724961cf.0
        for <llvm@lists.linux.dev>; Mon, 05 Jan 2026 05:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767620043; x=1768224843; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apBQxo7qSrwo1nwoLIpfGQYjycgRUvqMuCwBV3g5lLc=;
        b=QsmtbcWyO2T16b63Ql7298fpJpStrni2B8Qbny7b0d4yqg8zUMa4ILHsChNsdmSWh7
         eUREEYND6yk6r9VSaEQW1/KlwH5VEaixfVzVS+JyFUq5wBNTF27Rb9u7BE+xf4rs+7nC
         47If+ZRUZnL5tqd3vYgXE7JFPHKCgx4zEPJ91jXA4HBVqQXvpH+XgHhssQcRXiAWG66i
         FT9LQ4tJhkG7qZ6bPoUhZSw4YR11NCPDO8uFX0KGyEG1jn9s94DaukJxmlvIV6i73QUW
         Q6PjRhkEXhLCHKsyoEfthxBOOnv6WJq1ocf9avtwBA502OXTrX9xQLghBV2vPDnciYbl
         AyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767620043; x=1768224843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=apBQxo7qSrwo1nwoLIpfGQYjycgRUvqMuCwBV3g5lLc=;
        b=Ds0470Tpk3boz0vIRaAKPBK8lXfKe6HVo08cCIrckzold+zpb4oS9PjJvFcWPr5WeW
         TMPHDKBsdROO1k8lPrxQRwyL/esR3C8tsmUqDhe1jEHSOCNdnGyWQj7I6W3/aXZfZPZI
         YEZzT5J0yVd2p6EHHJseZDooAzpbqFVoMDwWJXW575xMAPiFiejNq28+4xQKAryaU0Pn
         IeCJMNLaN3+LJ865bxA/35qj0W62pR7e6eKLMSzwSnhlE7bj5TT9NB2Uk8sSnfHHPn/P
         i4n7a5Dz9YCrieSRg4j/P+czjiAZg1+Kttqlk+8dkyr3KF0SSMbudC9VQ2rvKAal3y3s
         RKGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ84hUnx0OsOCD9jnsoj3B7JGBICtJYut07EJp7TB2BoY+eblI152JKHxYiPAxvLFAJvkv@lists.linux.dev
X-Gm-Message-State: AOJu0YwcaN6U+ExaELog4QU9BKAyCBOdMwRhZ4R+vZUVQy++xI+OzRVT
	TM5SFRkfySKYgkrg5bi2y+T/xRnXJjH9mh/KfGfg/uo7R4lyX9AR3dOWr6Ug1kEkEO39LoPCfjN
	tahldG0W8fPkZw40Y9dH85fxzkVjGuf+wAwmVm+l6RnWGG0Y8n7c+lXbj
X-Gm-Gg: AY/fxX745D9TqO0TrYr4HF0SbE6TIDdYQFwBewNDxs3Iupixk9APxVdMj3T3CAZdLYy
	8gWIduXnn6K2BVZd37PqVEYmm7C0HqRzSFFl7fmeO6QJG9b+dKmDNVu+a2P0HQ/2aPWVSaMR83Z
	z8kbHSpTJfOG8mu4KZGPVZ5ieAWfqAC/mzV5bJ3tqaSv8p2vQqGcbsk+tklnQvLGfwm+HcuptFK
	1ZSwDFW09KruJhmngG+iXwggDBD6OIIxnGlQ18vfOYvzWnDujHoU4o2GcK43QOZ3j7jrGP/riB7
	kg2Oz8ca6CVMM1D4edPjAJFwmzhOve7E5vcbkYoUdZBGiH+JbGl1EpF6oSR7+Oxe73dDb6OcSvg
	3i9NR0gGhHprHeNevpKLN9ueehxeNCNf5rA==
X-Received: by 2002:ac8:5851:0:b0:4ed:b82b:19a3 with SMTP id d75a77b69052e-4f4abd03104mr752216901cf.32.1767620042646;
        Mon, 05 Jan 2026 05:34:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGL073c62Hd/WRutx99PIMM2D7+ut3zs1jMfjpXqo8+y09Dd4UVpcHVCw4KVlqpW3z5E7iWsQ==
X-Received: by 2002:ac8:5851:0:b0:4ed:b82b:19a3 with SMTP id d75a77b69052e-4f4abd03104mr752216391cf.32.1767620042172;
        Mon, 05 Jan 2026 05:34:02 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d143f75sm147211015e9.5.2026.01.05.05.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:34:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 14:33:41 +0100
Subject: [PATCH 03/11] ARM: exynos: Simplify with scoped for each OF child
 loop
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-of-for-each-compatible-scoped-v1-3-24e99c177164@oss.qualcomm.com>
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1404;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JLd+YJVelW7DAYz5I5oq+Bq5OMySRygwF3/FHKcXlRE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW724uhqQJQeP4Vg/SI4D4SjbbtLmMEMQDRC5I
 un3PEi6+/aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVu9uAAKCRDBN2bmhouD
 13GOD/42JM6vglHCZIWxqXZXSDiZEKiNaq8l/k7h7Llh56nvuYIx3nbUDCR+0D5+3U1tYFCtovP
 KMPVAvqckUrgBJWsNEmhJNZFinrNc193abWGWdNS8PReyJxR2paW+PZRxPmIyHN6T9+4ClyKJYT
 orO/UFCcHSnr7VL3wA39p+weE0sJ30fO5hcgn7qMiATvRULDU+h9Rp2WdTMvMTec8zzJ7Mp7LGe
 Uvr6DKnbkGRq2LJqAjrH37R4v+mHWcm8bu2BiJAngB9hPMEiCwtFmvrvuP/FT8iOXa5Z/7K4L0j
 4yOz0FbvSemXetVtuW+50hYj6yzKhUtTXIMF8EruhLmquMUDS7Qva+XpabcbvgKMYHEcPbxotjV
 VA5P9H5hZcbnYb1cfw8Ab6IhT/bMrAtvhoDXpItPkBGfOv9woUFjvXNCBC3x6AEeQwH2+QNyDuu
 LJEmqLiwzse1GyN8YizPcFsZ3LBzvdQbvCbqupZ7783pewZPJRfbLYDaZ1I+/eAU0qlMFLmQti9
 8IRok6H212gxfCEHN1G/jibO//9cyPAmiQp8tpC5DVfBddLCvveHc8aOxAC0bbKTIvAAWNuZ9a5
 aa1uQKAhQw7ow82uEju+DJFlO5RrIBHE6W86AiOFG0xEKIu6/nKbVfSIvX/cjn3Iku1poulaIxV
 J5gu1QgYIhtkx0g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: ZoQybAZjmV2TqFm_NJwe14epj2TTukX8
X-Proofpoint-GUID: ZoQybAZjmV2TqFm_NJwe14epj2TTukX8
X-Authority-Analysis: v=2.4 cv=OuhCCi/t c=1 sm=1 tr=0 ts=695bbdcb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kVq6N5mEIK0mURhpU1kA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExOCBTYWx0ZWRfX7np0HEatdvHQ
 R++t2d+SC9TzOIhfw8a82jiU0AUhfRtB/ZSB1CtjZf88evQyvv8/JV709MIqDWZkAKlDq9PgBgm
 LTWO882vBNiV9bTflj9RLNP6j0qbeswazCQghk+kkmyLeW2/4yyYSaL5xJFAyt8UJJretqX7jPf
 COqPCvBzfqPcv5XDCq8le9/WoKASU0r0prSvX4FBFkwZNo8dkaFG2K0cDcrffpTzEBHZyP2SuvD
 N6DCdh+slW85lflFRjFYEOyXQmL3F/Yuha3asnlTx6UtqIWWIj0usFrxJ8IvyHMzbq29g3dzzA2
 lektuJNxCNEfQr3VGhgfaL/uIixZhBLejoYHiF/9DJORRwDGMo+8hc3gDPyEv4+0OnBP+Wp1kLG
 B+aRe6U7B0Wjz2KEzN+3FuVypFHc/hkPFenJogm1Z22wzc8yPiG3L4iRJuqBKSoZ9wXvfM811OW
 FA00AC6uv/Set9tkBtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050118

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the first patch.
---
 arch/arm/mach-exynos/exynos.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 2e8099479ffa..18695076c34e 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -47,9 +47,7 @@ unsigned int exynos_rev(void)
 
 void __init exynos_sysram_init(void)
 {
-	struct device_node *node;
-
-	for_each_compatible_node(node, NULL, "samsung,exynos4210-sysram") {
+	for_each_compatible_node_scoped(node, NULL, "samsung,exynos4210-sysram") {
 		struct resource res;
 		if (!of_device_is_available(node))
 			continue;
@@ -57,15 +55,13 @@ void __init exynos_sysram_init(void)
 		of_address_to_resource(node, 0, &res);
 		sysram_base_addr = ioremap(res.start, resource_size(&res));
 		sysram_base_phys = res.start;
-		of_node_put(node);
 		break;
 	}
 
-	for_each_compatible_node(node, NULL, "samsung,exynos4210-sysram-ns") {
+	for_each_compatible_node_scoped(node, NULL, "samsung,exynos4210-sysram-ns") {
 		if (!of_device_is_available(node))
 			continue;
 		sysram_ns_base_addr = of_iomap(node, 0);
-		of_node_put(node);
 		break;
 	}
 }

-- 
2.51.0

