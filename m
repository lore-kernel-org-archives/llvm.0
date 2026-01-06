Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165A7313E38
	for <llvm@lists.linux.dev>; Tue,  6 Jan 2026 09:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690945; cv=none; b=SVft3ZiKdyCg1b4/khORDFYaoC0LKzeFsCJ1Lw44FNtKG66OrSOi0oIDiQXwFgyboiRjkdbzkdJwKxO6qCeDmERp8AvF9dHVTZsu3hYAgjICJwgwNHMdByVBNNGw2GJ54IWcVmP1dyhcadaOVT38zY+23aoJmCaFxHERIsX1sK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690945; c=relaxed/simple;
	bh=etPrXIm2DbWPr0yBMZ1LGq97W5bne6RQqRx/65G5X9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ed+G2v5soTuEvlTsVtvRtoKq8XqiC2XCaS+ITws9xWo1rV9zD5S9kvw31fkMJ0WvzY3GqvgxEDpCgiotgMf1nRFReyMHLQa5gk5iRntv7J0e5N/JWb8il7Jz7BmqOY0LpxIHo+lul3bg1z6PNqoxtYaYteBY0a41OCXnLTehCDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eyH1dS+O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OTYDW/me; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eyH1dS+O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OTYDW/me"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QAgY3073053
	for <llvm@lists.linux.dev>; Tue, 6 Jan 2026 09:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TVJbv/lv1mJxKEXbFe7HFa6qKPqOIW0YhqRLM00SXEM=; b=eyH1dS+OWuLPBbeG
	s6hOZ3gPsINaPKOrfyjBZOYXLnvlD7li5rlELpB7ldxLd9kQ2KYk2Z+zYUHfK5gW
	e5GPW6fTyqXI0escRoH94iGB1zGtMjBZnbRnFOMMvZi47Qd9wlpf0yJWAitw5Eyn
	ylirZ737//9kxEzncgjqxzmIvOcACfLle6eg1DiI+Nuvnp/abfn2Cp+7VMtqibYw
	T+a1EWqQjq5TSHQfZw6x4HRDjrYUVxeJHF9wb8M+Uzwo0TnANx7YEcDmYoDxmk8N
	6w58V4ZY2xDwbsa4QYVIkMT+IWa86zpFI99Q4K2JShlug2NVO3Ww04Shpg4Z64WB
	eJOHuw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgrf7h8bc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 06 Jan 2026 09:15:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed782d4c7dso12546261cf.2
        for <llvm@lists.linux.dev>; Tue, 06 Jan 2026 01:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690940; x=1768295740; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TVJbv/lv1mJxKEXbFe7HFa6qKPqOIW0YhqRLM00SXEM=;
        b=OTYDW/mehHac0jrwylmz7sa7yXxnv/gptYsk1ftkSA2qqWMj6CFkeA9sqMr6aW/s/S
         yHNoz1UlNsIVSfpVV/G8BfhSVHjaEJ00LHVm0jBC/+yvBGZFBabw4ByTk75PB8rxVv9b
         jB3gsWYqDCOL9apwbSQFUMTq+R3AilHgPe9r7k/LLMrrSZOgzkC9XBLzf5m+rB++4c5y
         F3bmKqz42ok1x9rpYf3HDhn2BzV+xz8FLzIyv08rgH67xZXAehoAIOD40UVzU98yr1jz
         QEQDZsjYNq8NPwr3KzCDIdgWyyYfUIqSMjfVMNFz8vFa8nq1XRlw3QB1zOCl+QiGeeIq
         l0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690940; x=1768295740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TVJbv/lv1mJxKEXbFe7HFa6qKPqOIW0YhqRLM00SXEM=;
        b=L+xLyQHnP9VdzYgCL0SIoYfmg35pD/e9cmsDOJgMffhbNN3Ks2mqJcgjvDF0kcKARD
         7ekVB7zxuGhKeb1/JkT/lgXQ/k6bgQwvN4B1/TYXXxUjlvMlLlt+LsD+KhpxKIgSmWXg
         H4iFCRqxEVl1YUN6j1PCmJG6Q4MMgDchXvNac9QwCtr5JiZfw6Rc7F75npxfcj6DvgoO
         YFbmyxhmO7pOMb3f6rqdplti30XH3Z0GclKa8yKPipYUZ5X2zTZ5GcXLBjH3yBVcnTLU
         yrqOMM8pMo48Jiumegw+ZZgHk6UFWbmh+2BYKpIu1sA5IF3c9ZDENw/nfJo6Kg2QW2zv
         /2bA==
X-Forwarded-Encrypted: i=1; AJvYcCWVaW95IbCJlpjgcOTDCG3tQm1qZfXpXh2Tgo5cgi8UgPpYvgqr4KvxT+TpSjXiLQpFjZ3K@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/sz3lIWLcjp+WXnQeYIAuSsDTNQZaJm3vBDiTVpU2s/TuOHlz
	BNhO4sk3Y4dND4XDzOYLszMY1/8UtVe7PpSxQ3o72uegjY+MUJC9Endbape80H/QJbM35SVw12+
	2ITX5c+8o+Rj05Z0omwPlB8LZleB1LijzO4ixH8DqBAiy6qa/6XH+DP5p
X-Gm-Gg: AY/fxX4I13ech9A0zhzD7myEZglIMDX0Sf2RXlt3/R1BoJd1pu7WWS1X7nHWc49g61y
	9JpCqL6c2bkc0uCg6eSugRXtYwVUHHSKtH26F99hvfOTESbvzgf/2lg9Hko7O7GoryGW91aGGUK
	U5bcfBjKIbB268l8w3Bt6gOp86zp5xChkZKt35+s+iEgfUMeCEopZHO6GqugFzKmDL4PHNxP0fm
	aVPqyPz5U7NPEt6FgU+9/lcCGLyrN74ztZlGjV46e2PY4/j+POR1vjy/8w66m2jz7wQmRYw/LFv
	ValBKPPxGJwCb511AAksM89mjUTYrdvj+l8P4d1JT85zb2WwFMnFzRJuBwQ+bYWL8Y3gZjVpU36
	UNCMsTOCm6Jg8Ne6yAjGZVpWmKvEDHM9qvw==
X-Received: by 2002:a05:622a:5808:b0:4f1:b5ec:dab3 with SMTP id d75a77b69052e-4ffa76be5acmr30003851cf.18.1767690940507;
        Tue, 06 Jan 2026 01:15:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEn9FxKXGa2KHpYz+ZQQB4vTjxpZoVrkeL0JR870oJdg4LQQUiHW7/3aZHLy6E81IxKYYFXcA==
X-Received: by 2002:a05:622a:5808:b0:4f1:b5ec:dab3 with SMTP id d75a77b69052e-4ffa76be5acmr30003321cf.18.1767690940057;
        Tue, 06 Jan 2026 01:15:40 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:16 +0100
Subject: [PATCH v2 06/11] cdx: Simplify with scoped for each OF child loop
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-of-for-each-compatible-scoped-v2-6-05eb948d91f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1064;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=etPrXIm2DbWPr0yBMZ1LGq97W5bne6RQqRx/65G5X9g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKlGprAVyAJUtewyF+XMt0Npi5Nw3QQowqDq
 LDolXwelDiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSpQAKCRDBN2bmhouD
 1x2bD/9ffIJpL4ZbW/U/j7/3q3tt0Sx4jOdt9UJON5xtLy+81KBOaJWv9oTsWblixcG54IEdSDb
 ky7CLtrOVRm2nsU+I+NZsivbLdkjDaUUYYJ81APzHmE8NPDhiTh1Zl6G+lqyRBDAciyuQmWRs7E
 ba/15aAWk7sWBXMnoydUPhZ15VDFbuKdoCVhGGh89+SlpzqvH93ZbAfMKTExQ6AJ0Bayl24XUcL
 FbEJPOpqJtUYHuZHEkGiAX4yAD53c/uHVRFnAWjHNNeZ64IowWM1AFsZRN2iOWJdR7k7DJ3ds+6
 2Qb+bTqYFQHlnXnreN+NqCM3//8G1U3N70mQbcHVtFHdky/nIN7AbCjrIOupaGoxj7F1vYXeiVJ
 kM2BSyYeiztbDN5XccMSa7lqvsMOIhrgV/6k1j2cxdn3adot66K95rAS0SFrBfPlg/fIrbtTeFK
 rT+cX64PbBE3jYVR5Flq8Q2Dj0SdVyluiX9dsS55YjBMOEGp6nsElIsWQulojsCkVMAlpuW/Y8F
 E1A7pherppgI/uQw8ZNgElbPB3AlJ/xlc9SXmU2OcQwTKB+UoVOn6RBNt9D+MpE5bWw8IhXUt/t
 cgiUVpMoOd1sWskTwc5hQT4lNJafHtAoK7gy8E/OPOx5MlQXiuNUnDTrRv0EZK79EeHYlEtXJBj
 iUssT4/AzCEIFfQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: wqTLTtR748Q1FD7oBHVAeC8P-d2gOqZn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfX5hlURCG7uOak
 ltnzXp5/KdWzuNlZTU3MPhFhBAkdmuqxmcenNIU4q5laxkAHeZEPJknYPTTqjHMk6kPsxCVlRqL
 wC93nw1BYSIJXKv2iTSaCYXled5Bx7strrZ8BnAe8ht5+UkacsaI4zFtjAkz1143PrRxt4pHzAK
 VgO7vFEXUsuQ6tRDE3P46jF+GDLFn/XTFhLbqPZMFOda2pnFhHb8L0MTniDKX8OR6EjxNvrj4Aq
 FGYA1oBjjJODwtmHhZdbvRSGLMnOtv6ezX+qsL4+anmv00WctFbcsWuvo2hZ5iSkwbXcJZnr1O3
 EHwSKpcLr2cwT7vS1F5w3a/6kaVjuuFngXqMfNfX9hdlQaLVy6WrswAZIG7kKu8BnHgVr5SeTYk
 Qjz5gYtfrLfycYHbB1MkFOznJ3aEYFnMrqUjiyhgfqqv2St+6+zNJPwAlajS/aWvQaS9sUFrEYS
 xPFNtnlCJuSf5E83SSQ==
X-Proofpoint-GUID: wqTLTtR748Q1FD7oBHVAeC8P-d2gOqZn
X-Authority-Analysis: v=2.4 cv=FK0WBuos c=1 sm=1 tr=0 ts=695cd2bd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lBFd75AfmJVjEZM8J80A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060077

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the first patch.
---
 drivers/cdx/cdx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/cdx/cdx.c b/drivers/cdx/cdx.c
index b39af2f1937f..bbde529aaa93 100644
--- a/drivers/cdx/cdx.c
+++ b/drivers/cdx/cdx.c
@@ -608,7 +608,6 @@ static ssize_t rescan_store(const struct bus_type *bus,
 {
 	struct cdx_controller *cdx;
 	struct platform_device *pd;
-	struct device_node *np;
 	bool val;
 
 	if (kstrtobool(buf, &val) < 0)
@@ -623,10 +622,9 @@ static ssize_t rescan_store(const struct bus_type *bus,
 	cdx_unregister_devices(&cdx_bus_type);
 
 	/* Rescan all the devices */
-	for_each_compatible_node(np, NULL, compat_node_name) {
+	for_each_compatible_node_scoped(np, NULL, compat_node_name) {
 		pd = of_find_device_by_node(np);
 		if (!pd) {
-			of_node_put(np);
 			count = -EINVAL;
 			goto unlock;
 		}

-- 
2.51.0

