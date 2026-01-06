Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB7430E847
	for <llvm@lists.linux.dev>; Tue,  6 Jan 2026 09:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690940; cv=none; b=hTbiogWr4EW3L7w2mLHh9pBD4d8LE4I3pml81cwtunI+2xDM8BcXV51sy9y5JSsUGflQ2kna5Eeod1Bik7FnJohXxm6I3mx97DQz66olCEOl5I5foRj+E0pska5UMDz/hibjzM/tJkfB2Jf8nYsGG9sHEjZHBPxLfXNSyrhAtL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690940; c=relaxed/simple;
	bh=LVLzy0PUtWV8BS2tmtolxGrxYJ3Rutx30xWjiFUNeE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GG+c9jkAGDgEuTOLbg+SpoRoQe0/nga1DVokaDoFFVXjoCOWAMoOj+sN90R7x1yY3EKxc2bpiiTEbtMUGGK0frkEUKPcpoF3Vwkl77ekO/H4jkjYIHg8Ke9FNfIujUePmCLhqrtATQevXBLVdPzhiKzepthTQW75gf+7mqCYlzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AzdlmuaF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dg55J60H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AzdlmuaF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dg55J60H"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QFJI3214179
	for <llvm@lists.linux.dev>; Tue, 6 Jan 2026 09:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oArkW0LARboCK7gb4mMn0LYpSg410D5nG+SDjMvZOYk=; b=AzdlmuaFqTDxLjwR
	lohgu46V+FUulxlb/1omdPCuQmuu7RqLlas8Etshz19artC/z6uv+dXK2JRYKQcX
	7HgPUw/LiSgZBfdQGZw1RSZBTHqHZJ2D6a0HhKa/4fXnE0y96Qf1h8vMgzoXtCGS
	Gq321I5RXI1D6J+M/ViyEYGaXnSxVGGfUC6thBoyAjA4mbnYaJ217F0lJuOwCug6
	d2HwfWpJOBXjws/GSKKkjQWlm4GfhKzYyZ1j4QO0QuGg20lLODZalEBtYszTnn3a
	nyYokqu4Mnx3NPYdmn1PyjW1dwSiZrWp9lvMntSgpzILBEc1n1xEmPeVTW0dqCow
	dRy6OQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgpnd9he4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 06 Jan 2026 09:15:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b6a9c80038so87868685a.2
        for <llvm@lists.linux.dev>; Tue, 06 Jan 2026 01:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690936; x=1768295736; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oArkW0LARboCK7gb4mMn0LYpSg410D5nG+SDjMvZOYk=;
        b=Dg55J60HsQgz2t9BM3pMGfMYXtHVGap9u9DY6RZo5DDVbytvfc+sLAcoYLQFMyulQZ
         b4iPVUJSB3H0M7SHsSne3mqzJAvxgdfwMSLyogXAW6FGDxKpza6+e2zm6b20HYNY0BhC
         IRElUFTok0cECIc1N+TUNlGgYUYugBcg7/iAYKNLtUsdJNglYyUp7Z4VqTYQF/7AppvQ
         hrXYTQ0N3s8HIEYvWzQjzmynJ87ngdxOea+1IUod38oF1lg6zpDC9C8EJ7SUQrM/IVp2
         iESqwasn04wnUnQTYjOuk/InIVmSKJkRt2gJE7+HhrUbDjiQlEyG94T+dcYdnceRsa3O
         laNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690936; x=1768295736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oArkW0LARboCK7gb4mMn0LYpSg410D5nG+SDjMvZOYk=;
        b=qHbQO6Hi8xV5pJUXYc21IpMv5mqXOb5/cHa6DxTFUiMHlpuTd6HFTsj/biet0xedGZ
         LehLsMaVJQ6bccUEUCl8z7Xy+YrE8YhURl58dPFLln5prEpPNEzN7RkItHfFH2XNF2v8
         1VXjZQLvROvvm+t5IMNfnyMu+Aywg8yU/UMP0IssjHHhC7VzwkkZnVlwdMV2PITIJZ+d
         aJBzhOYdM7IfO3Qvvj1JLWqizxe//caFUshFPR4mMIc6SllsnQlwfHiIPsT/pD9ldqny
         BR9rdNasXxNUhSGw8LS0ZgksTlVLzp7Ra4wl4+QtQH/r0e5AW4ZT9r8AXD0gsttvwCN2
         xvzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwRmbhpY+gg5MFCGi/0LmbgpjFCnU4/aezcxe/pu9tEJFyepxVQ4WZ8dMkR5X4zKHUF+Vk@lists.linux.dev
X-Gm-Message-State: AOJu0Yx83T4Pkl1IX7uJCs5z33BAs0tuovuN2IwqO5wUHHBBIGQU8bFm
	1BjZeauoFThA4IsGW+XkCN/S07hTZl3MiPb8uZM/hBkCKGQzIGuuWjtFaqT65OIvVZXhFEciDKy
	dVLdf0bqSHIbzttrVEb/7YEbMoIjhN7XX+Booq7q4VkNUEBRDvLM27Fgh
X-Gm-Gg: AY/fxX44px/kmdejQf0T4W5t+l/ReHn9nC1nydxibgFe2KfoHSWmpM6Y9SNWfkFg707
	2D9Npgek7X0tbaE+URG1hvqjiJCUSKCfgaglf6ukTPPd76lr+5noIE9/54GfS9pk3xhl/LE4tzH
	A6SvkrxktNA+CDkUdy7s5Z4SHIyIsf7Sbb20kbRiMk/rkSl3qwTR6ectb+Cfawpzzxav4WlT0f6
	lugn3OlBX5GQzDvJxXxZstiXxrWDSdceNgiaMvNz+ip2rV0bkQnlHV4R5EUqV1yWpYsa/Vla1tq
	CAMGJjB6+C2NgLc24FEd50w3vHG9hgg+AkyRBWjOaWyyIvOp8MjpJzSLlXuT7NJWHB4Vvnx0Wpl
	KYWhaBmYCYAikxWCkoQWD2vHqXvFov0vfoQ==
X-Received: by 2002:a05:622a:2597:b0:4ee:2984:7d95 with SMTP id d75a77b69052e-4ffa76a1fa9mr33065271cf.13.1767690935589;
        Tue, 06 Jan 2026 01:15:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHj9n34M+nvJtisn5mDYy5RePHoeuMJd4vqGss8fg8pD102xLm7ehjQZBfXUwHbXo0PbhYlFw==
X-Received: by 2002:a05:622a:2597:b0:4ee:2984:7d95 with SMTP id d75a77b69052e-4ffa76a1fa9mr33065011cf.13.1767690935131;
        Tue, 06 Jan 2026 01:15:35 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:34 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:14 +0100
Subject: [PATCH v2 04/11] powerpc/fsp2: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-of-for-each-compatible-scoped-v2-4-05eb948d91f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1293;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LVLzy0PUtWV8BS2tmtolxGrxYJ3Rutx30xWjiFUNeE4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKjqMnHKZ6rh4xskjSorjbJanJtC5Td5QsTN
 mTpfCmhXxKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSowAKCRDBN2bmhouD
 107BEACFykt16DYNP4MhZ9/yYnB06mL7kkZ7VawN7JLM4VGMbZZnQCVky8Sgq0r62VsJD7jf76u
 qQdVNf/zRIeD/kvN9orKScdeDbI/QjucKwW4mh/7f5YQqherhONZveQt0LkbZtiaGFFT6JHpkHR
 zsuoQFMOCWk/R7xs6w4VpqX0vdPQT4m6hAUXWffthiPETAIPGsF1iw7xGlbmtSSOW5mjZbLJ3Oy
 06ZGo/2BVMN119RDQ1dIJpY1nYxwtLZfbaw6M33xnCcfOuM/vxzuwdRCIyW0eiMTlx2+iZOsZlr
 J+Q6NXbGc3QflgeCXkWowuJJzY7ntyXDg/TQmawr65rpzUnCSt24pjKYW3/WMuwj7yZR92AIAk1
 aottxgCA2w0R6uE3O57KbXDZuLEmXQK4cQZksQCm9IYD3T74JGOqlM6ecCJXdrSexAi7nEWjFJQ
 AI9w7ljNyiUl7kE80EV+AX7c4lOx7VQAj8rPZA6QYFHWkkCjOG75QvJX95xOJwQ0iw/5ACcqeKc
 SmTVGMdug9kP9wgBvtuKVW2HQ2Ff3sYSB8cJYSk0djxI/1uBo88xMl+pixFyFzGIJ613VXDvt6H
 KG7HY0sbmwXgL3R6lyid/9TFFYZLCTfvKMG+4Br99v52e9mbxnkCTzR/x1pVmzsgLGquiz4dr8S
 40GfezA/xzLZtiQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: oxzbrovD3GV0Mhh9UucxqKIEokrLjvcw
X-Proofpoint-GUID: oxzbrovD3GV0Mhh9UucxqKIEokrLjvcw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfX8NX1QhMDBHPH
 AGTx1gbs8EibrdHwokaQDielKjIPlzewo1Q5LlJYMkXhLzkTYOe60/5+CwJVq1IZmOcZJywHoPw
 r0OeyLbp8bkgColdytdJo1xoQVVWFdXOPFkg5VbwEiqPmUrepyncmZRY7oArk3dmLYabJ5KVPES
 o4nGqbmQAZHNn1xrlWEa2ItBmxVi/pWBpNcO9WkJXgAqlvL//4rvzkSmL3KzI1A1OQfiGtBewyD
 NgZtC5I4+5n1PCO3njOjtWC0PBT1OElfUgYx4pm0TH74LdX5qkw5iWYb73CInzSTiMDCkxQaPFu
 OGygtc623CjdhD4tSwH4FckoUO5jir9VRViX86Wi1SgHj/gf6GfyjVXeUWK2UwxczN8N1K8Z34O
 /aSNFKJXjMmaKzH+awHNK+9VsH8DbUj+x+goqS3D0OqqSy2cZW1GoKxsAhN4FDEJKAqaePyaMmM
 wLxhaxdYdKCAhmfoW1w==
X-Authority-Analysis: v=2.4 cv=Jpz8bc4C c=1 sm=1 tr=0 ts=695cd2b8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bRA1xQHzFO3ZoMUYUbgA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060077

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the first patch.
---
 arch/powerpc/platforms/44x/fsp2.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/44x/fsp2.c b/arch/powerpc/platforms/44x/fsp2.c
index f6b8d02e08b0..b06d9220844c 100644
--- a/arch/powerpc/platforms/44x/fsp2.c
+++ b/arch/powerpc/platforms/44x/fsp2.c
@@ -199,16 +199,14 @@ static irqreturn_t rst_wrn_handler(int irq, void *data) {
 
 static void __init node_irq_request(const char *compat, irq_handler_t errirq_handler)
 {
-	struct device_node *np;
 	unsigned int irq;
 	int32_t rc;
 
-	for_each_compatible_node(np, NULL, compat) {
+	for_each_compatible_node_scoped(np, NULL, compat) {
 		irq = irq_of_parse_and_map(np, 0);
 		if (!irq) {
 			pr_err("device tree node %pOFn is missing a interrupt",
 			      np);
-			of_node_put(np);
 			return;
 		}
 
@@ -216,7 +214,6 @@ static void __init node_irq_request(const char *compat, irq_handler_t errirq_han
 		if (rc) {
 			pr_err("fsp_of_probe: request_irq failed: np=%pOF rc=%d",
 			      np, rc);
-			of_node_put(np);
 			return;
 		}
 	}

-- 
2.51.0

