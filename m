Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56A2366557
	for <llvm@lists.linux.dev>; Fri,  9 Jan 2026 16:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767977924; cv=none; b=AXXJGQUZVjbe4c/oYSal5+Z4IIFJvwNiW+2xj1JRmI776KkG6mRbgt8gQb4NNjaNRzLNuOR73KCMjZ5QHaR6013vt90stDWclEvNgP0V8WvBE4JPZs0fvV8I+QhYsHvzRXH1g29f5fFrZF5y9ga7xrLZRxot5+UnA60XkDp+3Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767977924; c=relaxed/simple;
	bh=46+dN1Wr2iW0/BK6fG/zPk6hr7jUd2kTZ1jgEalx+Y8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gtkV36xmsem4PIWNdbSMBZQoKYY7LAfbniLNQ0PI0bHlwX5Uyz4hDeUPh/7HfGejxlzWE4ZamsjegLjwKEwDKs86lKwjOgAXmzjef2XtQk6CzcS3VTarn483TNY4IStouOri+MfeXM5RLsQjVTszsXxn1MzkTKGkFPpdRSy/k7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pSOEp4FN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQNJTcY/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pSOEp4FN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQNJTcY/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099jGu5007882
	for <llvm@lists.linux.dev>; Fri, 9 Jan 2026 16:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ms6tRibMZn/vZL9r+qf7/fS0pNW7QVbS6EPzdsel7IY=; b=pSOEp4FNvNGihwit
	ifEoYbdVK9KNCWJHNFjGj4HSDMB0kqe14DD7PZBtal9hywH9N/t9TeCZzLggsMPE
	8nAih9mBcRGHGGZpImSouDQOK8+CAt3Ia2cjY9FkKaSRypGnhO48lWNFFoP9yBnx
	G5JNfUvzgcwtdh9VewMhUVNWZHg9D78gO8rGwImgVcgieqFotWx7aOiCRYdLOb04
	mZm1Ni/HADOBx2Zjgo6DHWCiiOZBXljnGJlvHa6P+M95dTsjLA+HNy+KcSi1qDOs
	Uwj71sgo65zs/u9S82UoD5o2O6nbC6pis1eh8wzAm5l0Zym1459LRbLRlymzIEso
	BX24FA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjyaqh77t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Fri, 09 Jan 2026 16:58:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b259f0da04so1111308385a.0
        for <llvm@lists.linux.dev>; Fri, 09 Jan 2026 08:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977919; x=1768582719; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ms6tRibMZn/vZL9r+qf7/fS0pNW7QVbS6EPzdsel7IY=;
        b=DQNJTcY/36Nyj/puuoxp1aDMGKQpMDz5qVAdmUMI9UUilun/gz9/VKg88J9hvrJtbe
         kyyykTSJfNGUT1rLhubXQZy/KY/Rj+I9kCMlYMeam6eSQjL3Ux5Wlg3JPjCMk31AaIJT
         njdpRYiIm1UG+wp2DhgoV/wtSgbNi9nbIXjS4IPj3efh4176zhhrXwj+UA2ZAdbTi4s0
         5CzByojKCJIoP6j7XBqYGTzVEG3KTJ1WMOt4w1Zlhl+jsFtoVLFwqIRx+fewvwXMFXas
         z5jms8XKpAUEbIgQkyy+lLKcigqV3LDLIq4mZPp8Ygr6kLKlvpZHzVtHSjtKL08+GIJa
         hgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977919; x=1768582719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ms6tRibMZn/vZL9r+qf7/fS0pNW7QVbS6EPzdsel7IY=;
        b=PVk8CTQH1cv5p7CuYzVyRdixCpLX4KSgU5TSyuYGh9vF2fGi/rB9obWf7mGJyfThUa
         dAt9VHM/l89WaZpDcAKfCWz1Ouosz+uyJbKJp51dLOC0aeJnAHVPMyVSe+7T5FO7iMo6
         G1W57zo++7G9B7Zc11B0p6NeRu9uImU4av1a6e9dcN4Lp9rThG8molukuvr/RTWmbzeF
         vhaOAGtIW0gklmOGLOJewAFv2j2afbjbqrZEZqunEb8NeUwokrvy1Q+Q8Eq4yiSnZd/5
         Cc6otqDiBsaGKOXBUPGJ+NV/3MkVoZq91P7ILS7aF5ecr3XZyzD2ponVMCcdebBVk1Ux
         QYfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGopI8Rv+LBQLngxd/HX26vhBYizDKhBkNt15FYrt0WccbDCdBgYtfV1pe2UoUYCofjJ3k@lists.linux.dev
X-Gm-Message-State: AOJu0YwjosWWr640/dsUh1IuCr3C5160bPWKJwLNQhXVN1gEWqCy3DBq
	FG1JXMM9kdOywo6JsloNzRxlKtinHACU/MNNd3oQqF3nZo1u5lReVaeIbxk1hCMm9hAd13a0A1q
	1Z0wNe/Hotmdd70aOdb4Hm0c2OIWt8u5KCbDWZbPibrZsQv3yBekcmuH8
X-Gm-Gg: AY/fxX7LbBtTN+X272TOREg0IESJGVvLPrXVlkZ9CgMSHA7cF04yKqZ4fCCc1W8M6Df
	3SyfQfD+9h9SNLSd2MOFUk9Bq0cfLnJKJ1v9KNCJ5RInqk6g0q7j8y7LICqRZgbPkX1hUXBvGVS
	nkM1oL22Rz+2RMeK05HlwLEZD52G7e2qLt2hWkVoeW/uchPRWWqXSbLD+2JUSRRB7XSkoo7fHJJ
	24z8ON7WIqRD6JUUiB5hF2X+n2/m0KOgripgKXy5CUT2GMo1VWBVQgnLMNrPVvHHNjHx8k8WOeC
	pTpMAQSaYZDxHmF6lfIJ8K+F3hGGZyO2kq9EedZNS6dNiMnW4ZPVaQouw/H2DrFO18IskFQ1qFm
	DYl93KHmXCW3q9RwqKqc1IOpXtb7KU1kYDg==
X-Received: by 2002:a05:620a:410e:b0:8b2:e9d2:9c69 with SMTP id af79cd13be357-8c389392416mr1382475285a.22.1767977919138;
        Fri, 09 Jan 2026 08:58:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwg753kf5uZPuL/ts3/1VM0NbhxSNDo5KXXx8Nlx3hwU9BTSSZmTTpcwzS9dlUqhVQ3PB/Ug==
X-Received: by 2002:a05:620a:410e:b0:8b2:e9d2:9c69 with SMTP id af79cd13be357-8c389392416mr1382467785a.22.1767977918488;
        Fri, 09 Jan 2026 08:58:38 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:56 +0100
Subject: [PATCH v3 12/12] media: samsung: exynos4-is: Simplify with scoped
 for each OF child loop
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-of-for-each-compatible-scoped-v3-12-c22fa2c0749a@oss.qualcomm.com>
References: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
In-Reply-To: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
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
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1568;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=46+dN1Wr2iW0/BK6fG/zPk6hr7jUd2kTZ1jgEalx+Y8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpYTOaXjxvTt/ySukjArTvuXv0saPpVyuR5oc3G
 Bq6+PS/Rd6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWEzmgAKCRDBN2bmhouD
 11AHD/43uD+XZcx4LF4NkQnOa9Yvx0EAGD+NHIwK5BMG2xh/33lfGTAvbYPAoBQJNjzwRJ6JVbq
 FRbVqXrKSCuIx23a7i5XeOKdUk0ztOsgM/Tw0rHVz7Tzb2dBHVMvhGD8fa8pulvSCwlEcBmcmOQ
 6yJ6YEBd6dCgCJaSSBVJyYxgKyQh9W0ti47PLPQuXlvxj+L1bcd5V8jWs5oIxrDZ5oDHzKtkyzM
 oSmvu5pl08Lzx8YtTlr/mFnscu9VJ7H1RrRVvS0vnXXCBKb9aGjOsse0VhzamJSO4iVjCOEJgB7
 pUCe/pX1YrxgSpphl6c79yovha3c+H0ywy63/9Baptla7q2QlSQAmh9Ki/hcnWcrsmoiRLknL2j
 UbzhioQQFfU9661sn9HXpMJiqRcpPqWKjWZ8hhnJ+otzp24g1576RS4q6mfFZH85nXd8KV5fNmj
 okEbo+acC1XOnnJ9mm5dIa2DxxIyPdRwno6ntvIPDeZXVUlwgfQWbQnPxF5MGaqkI58Y/52z4La
 dpT4NWWyI/PDm8q8a0iyYkMTG/awTyRAsMpMKcfQqb/qhi2J9GfDi1dgeAAT/lS3ZugrLhDtHhL
 YdmfOJh4JzvbmTNjwM03w8eHgw2xZHAXdy9QTgaZlaMW9No0RFEU0jQiSaPB2S5FCrctBttK2oa
 mjpJLQG4T1vyVew==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfXyRU7G501NK7e
 EUNZfCcJO3LFTaaqGE2JLgVyNqNHoLcW9eEqt8A1er6iNG1YM3oylLUm6chCNr0m8FHHv7MKu9k
 /v27eTFCuMr6jI2OjET0+0vE70fcxG1w0JhRFe1WTjbAWaTzG5WWewD1WSfHwjLJ1W19BIJJH+/
 EsMRE6tLay/ftpXxUVD9jWZmcMpfSBn2a5zlOu+I2v2MgJ981zFSbGVpaKNJVWg2v/UoH+oyKrK
 qdGDF2H3q9FUBm8aAWWu91+rwO2PR4YhvCtomPr68GVFAsLdvgp0dGSxLFnfPXpv4jKvBR9buTD
 8R/wH4IJZvZcDNH/Sm/9kjkKoGCmITZbAMExUIsU+di3sB+DL1WAOxsnBV2R72ZazIheX339BPL
 8wRSofUFO5IDMHSRVorUH2+RfZMmFpmz3FCXk0UCGsOVliHYH4jLcCasiwxweUMqhjqmpHyJ+ty
 RORzAMMXihm5IqxvIgA==
X-Proofpoint-GUID: _6B2ybJPJplvH4tEZWu7x05tP4_W9y49
X-Authority-Analysis: v=2.4 cv=IKUPywvG c=1 sm=1 tr=0 ts=696133bf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i0EeH86SAAAA:8
 a=2mm1MoeH4kfNTzOWiPUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: _6B2ybJPJplvH4tEZWu7x05tP4_W9y49
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090128

Use scoped for_each_compatible_node_scoped() loop when iterating over
device nodes to make code a bit simpler.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on the first patch and on:
https://lore.kernel.org/all/20260102124955.64904-2-krzysztof.kozlowski@oss.qualcomm.com/
---
 drivers/media/platform/samsung/exynos4-is/fimc-is.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
index 14d84cc96831..b7d9bfedd590 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
@@ -200,21 +200,19 @@ static int fimc_is_parse_sensor_config(struct fimc_is *is, unsigned int index,
 
 static int fimc_is_register_subdevs(struct fimc_is *is)
 {
-	struct device_node *i2c_bus;
 	int ret, index = 0;
 
 	ret = fimc_isp_subdev_create(&is->isp);
 	if (ret < 0)
 		return ret;
 
-	for_each_compatible_node(i2c_bus, NULL, "samsung,exynos4212-i2c-isp") {
+	for_each_compatible_node_scoped(i2c_bus, NULL, "samsung,exynos4212-i2c-isp") {
 		for_each_available_child_of_node_scoped(i2c_bus, child) {
 			ret = fimc_is_parse_sensor_config(is, index, child);
 
-			if (ret < 0 || index >= FIMC_IS_SENSORS_NUM) {
-				of_node_put(i2c_bus);
+			if (ret < 0 || index >= FIMC_IS_SENSORS_NUM)
 				return ret;
-			}
+
 			index++;
 		}
 	}

-- 
2.51.0

