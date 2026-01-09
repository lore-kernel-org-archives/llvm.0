Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34CA3659F0
	for <llvm@lists.linux.dev>; Fri,  9 Jan 2026 16:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767977924; cv=none; b=gITKEAc57DcrS5SZwxevk0M2uj9B64RKzxOTKE8WlXyS9RKM7+u9tAJQef+qpWa/nthcFB3kkmaSLiEtxQ2JsKzY3SKVJISZimN8ySGFaHz1RD+Zd/jaqPaJo6aviGnEykiEnOAiakgcUOdgLiM0NJUP9VDPfZ9U5Hwhc1XmdEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767977924; c=relaxed/simple;
	bh=ZI+U3HmKVnYXK5v86o6BF2VX3RPpNT6lnizYwOme37Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZQnenec32VmfmeTLRDY+6/DvLhUxQ4xwIUTIaQb9DQglEfs0R5uh+QUw3PziDDiibahsLJdxWA7vZDOjdGxdqQ9iXTQuud19VPcwooBrTf3/Tziryf/hxwlzHMdu+jxAZ6+sv45XwvtAoPzaIXQYIcDwCeGYk/CGQT2yVQ5Bj4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dQn7M62x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DKaoJhl7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dQn7M62x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DKaoJhl7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609CUCQO3542137
	for <llvm@lists.linux.dev>; Fri, 9 Jan 2026 16:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+I8jwqy4Opw465RbZcdpAwGMhKJVBMH0ODZ/RSDpWxw=; b=dQn7M62xwk8e+vNJ
	km3ZDzKgeMpElhOQ7VlCfu1EkC3EZlWesVsRt8YvavaRiK2Oh4uehTIytdz2xppJ
	Iyy+s9spONZ9DYOyEkoY66e7PiFmlpU1CXUnddzZGY1RjfELy/UHuRFMAEJgsPgP
	P/EdQsCM4nKf/S4jDfkO57/Vs7hVo8Ntry6c+wnUBoLLSMk3UZHWj7HLBE+6SuRR
	wFtL4KLvVB9g+QdPfjeZnqGlwG9KjbUqB7yLq/oUimvXre2cvxIdBg7YO/Sn4FYa
	DU305n0KJGTQ4/sI9gSI8Qrio2VOpXIj0RT8i3A4YmYEvOeoBnJh/2J8lH9SK/J7
	DKuwrA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bju6b212r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Fri, 09 Jan 2026 16:58:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb0ae16a63so513533585a.3
        for <llvm@lists.linux.dev>; Fri, 09 Jan 2026 08:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977917; x=1768582717; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+I8jwqy4Opw465RbZcdpAwGMhKJVBMH0ODZ/RSDpWxw=;
        b=DKaoJhl7E+Sk1ARBmGgQZMa1LK5BJ8Z46raPl2EA4zVVUX8iTgsxOz0150K4jT9hWr
         6tj8M+Jq9kXg1DZ1ECTHF1ArXJ7tnMcRa9GDyV7g+q7bIJ3NpgyZ6IxH/fXIt+DPjo2M
         +y/9S9O2fr7LDlXmUdPiRLgr0KTq550pxdui4W3AvafoOFkgBUwISkYAfuqRexQOOhuC
         ifRavVNmT/abT0os+U59fdRvXpXH8CkPwFVCMwQjzO9DGJUk+D1rHKYczEomZBF5mKn2
         fQiWKXoVsgyBbC83+U77b4IUNmboddmSC8625rcbO+HXnqCXB8yTEMHa/aveFKYWp6Fl
         cxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977917; x=1768582717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+I8jwqy4Opw465RbZcdpAwGMhKJVBMH0ODZ/RSDpWxw=;
        b=TD+ULiVFyi9SSU2l53aT2c5dLli+UhsQe5M8QXpUOMEOQMoZiF+rPAmPzNNMUrSG46
         GzMYgMm6WVnl9TYsTjtliTSALgcDAzLqP2AX0CLq4IpviTt1qBaleXvy+4MVLSOrXyzR
         hgG8zYvUUoclPDg3i+zQmkzKJ1I6XZHdNxCDCARlNOCXCMH/ZO5Liz9oY6xfTrnZ7lni
         nEEvZ5dpmq033wqWUxdPUoyh//qXqLetfuo8sxCmXMJVLbji7PGz0NCL3PS1W46BAwQ/
         Z2S6fjdKISzuDtyo1pgyaF/rUiszCIzJR66shGo1G35a7cbCzDHJfe93lsm/B6MsIrsA
         HzHA==
X-Forwarded-Encrypted: i=1; AJvYcCUM7/hUb9i1vGz7t611Hh9IcLNpUYbvEhc5UoKzQ0l+mygkfgIX5mzD47jqUmKo7GzbxwZl@lists.linux.dev
X-Gm-Message-State: AOJu0YwpzhKzBJtMTQodYeX4SaZGObBVNrF6sfS493/pEVn1vcTrpYKI
	9UEENG5E1kJGH5WInUPfKP8UoxodOeXj/6j/l/8apnQ86BeHfDtTX9UTZxsXvsN6W2W+P7/6npd
	m6Z7sMQFcMkTKAN32rRybr6ntaERusFqmbWrGdlKcHnC2YJrLsO5jtsT5
X-Gm-Gg: AY/fxX4jX/V00oNES5lb22MsEJQQyn78PlNfQjDfk9AxT9CJqOOLv9qhQFb/2r/nySD
	SxQM548a35oN6VFnpIar4h5bijtg0RUvpD2QhWebpn2VXpusBxsTdeLXTnzH0wmEWaid8vhfvu1
	Zepo03HG6oiriGZkGO1S5aJYHW6LYkvUqatB4h1BOSUtMmuJ5RXK+OTRr4oyPAMRZ3YJCUbEQX2
	oVEe/YG+V5UVtO7/LdG+sEewupyvO9WklKh8DL+LjeSyvZyeiAB3whqSYFu9/b52pPbsRb/itDt
	kx/yilh/C+ZWJGMQH/l3a0haqAgleibNLlmlFog0PJ/PEL3cjjYp0N2i9zJEYwu+8FcMvyaUXiS
	6W2WLXn6GA54L14dn2V3qR2W1OOEnNdOgaw==
X-Received: by 2002:a05:620a:31a5:b0:8b2:dd7b:cc9a with SMTP id af79cd13be357-8c389356fa4mr1505590085a.15.1767977916493;
        Fri, 09 Jan 2026 08:58:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEd4P+5i2nj0W/9D5U3nva30jkEMvCOqGEW0JV4KjhLClEVL20MybHymtF7r1Ior1sMlVhTjg==
X-Received: by 2002:a05:620a:31a5:b0:8b2:dd7b:cc9a with SMTP id af79cd13be357-8c389356fa4mr1505586785a.15.1767977915936;
        Fri, 09 Jan 2026 08:58:35 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:55 +0100
Subject: [PATCH v3 11/12] cpufreq: s5pv210: Simplify with scoped for each
 OF child loop
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-of-for-each-compatible-scoped-v3-11-c22fa2c0749a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1550;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZI+U3HmKVnYXK5v86o6BF2VX3RPpNT6lnizYwOme37Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpYTOaHPCFJwqx8kUNMe9/c9hODDZ118FgBLWzN
 4NPPXItbLKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWEzmgAKCRDBN2bmhouD
 1x5UD/wIUofhuCPuz6KtYqBTpPHzfpb3k9H0kKP02mFOxVsmacf2tW4ugehZIzMEOAFrRCg69/T
 bpBYb5nzmtE4qoUsuEWplgSxGZTDB4Gdn95AMnaweOKPn1iS5Jxq2nTOllLZgk2GBhZMfLBaN6A
 UP6JIiWtRHck6Z0zeI+y0dYY85j8pPkIe1eGxLXOkEt1OH+w2XfpLcyND7AS3ebn5EKQkhRDuuM
 UNbnryClXYpJvCWN14v7GeJWGOEIoiYuPA/IHFDR1QXJktpvcrarhz/RV7XX7vQRn6bpMcoz7Ns
 oUmEU8RZxVnKJgQnbFVSo3O19t66Gat5ptNkHsCHSlgctdvYmdbbA8089qF0bUcJt1fhSfH/nrg
 PFf0GrMkkU9gKyQkya+XtRumPmR5ILU4hlSzr08U7zvVsXbXDFzrQQD/wYiNCsqboDFYRd1yMCN
 nI2rfHPDynmX9I5crfgivb5TocSSs/z3DOfFipO2C0BKy677q/yqv32s/HMLZsQ+pQ0kiQbXDPQ
 i0WZFOEyvAtB5Omv0zwdgjtz/+91q+VEPF/stD3F/vxR+WlKR6Qik32yBohmUgP49IXOIckAC6I
 Kck558AnhkygKMsybi2gIqSFH+tTfYSY0MLZZeTK8SiqwkkLj/jWtG0+kInNZiIbvNyDmPpOUIl
 Hv88Jx2/oaTAUSQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfX3Zi7pFFWSOV2
 WSjreF0MVwTSjVAgdaU5BjtutgNyF6l5dPhQAiT4IvhElVALUBfuP0HwQWt3zJVyf7kdIBypr/t
 dIMS2o66l9H84H9F9ky11uy3B2tlLloKVXwDXAHbSYO2IYv5XXKtZzhJLrItJX+MqNUTd4Yy7iY
 9WHawxrJNzFWJ6yhqFU8jPWKzSls6vhQhUfE+uLOeoHhQebu6Zuv8TFnW2XnW3CvX5Bn6MWIsbC
 Psps1MYIPKjzWudADUeLXTmPAECzc78OpFlV1q9I3yXvAumftO8PktFjpQFAcguIqkpwOSKfQT3
 zPTjcDfc8fQGj6qfDaIH1+JHIeT0pcyGpKja3ris8MloQzkip2wYLJki7Q2p9+sXiJbDZ6j77iX
 5iALUan7Dw0dsrK7nflI0Bf6AI/tQGVJ7+GlE4HtVXV7wL6t+vU7s31a2Q7S/zeV1wnJ6/6pgyF
 hPh2lNQe9Z4a5UgrS4g==
X-Proofpoint-ORIG-GUID: 7uRBoZ_HhUyBH6aCfUnAUG_TDlkzfFQb
X-Authority-Analysis: v=2.4 cv=V+5wEOni c=1 sm=1 tr=0 ts=696133bd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8
 a=8YWg2ve-cigzn2S1SOoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7uRBoZ_HhUyBH6aCfUnAUG_TDlkzfFQb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090128

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.  Note that there is another part of code using "np"
variable, so scoped loop should not shadow it.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on the first patch.
---
 drivers/cpufreq/s5pv210-cpufreq.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
index ba8a1c96427a..e64e84e1ee79 100644
--- a/drivers/cpufreq/s5pv210-cpufreq.c
+++ b/drivers/cpufreq/s5pv210-cpufreq.c
@@ -629,19 +629,17 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
 		goto err_clock;
 	}
 
-	for_each_compatible_node(np, NULL, "samsung,s5pv210-dmc") {
-		id = of_alias_get_id(np, "dmc");
+	for_each_compatible_node_scoped(dmc, NULL, "samsung,s5pv210-dmc") {
+		id = of_alias_get_id(dmc, "dmc");
 		if (id < 0 || id >= ARRAY_SIZE(dmc_base)) {
-			dev_err(dev, "failed to get alias of dmc node '%pOFn'\n", np);
-			of_node_put(np);
+			dev_err(dev, "failed to get alias of dmc node '%pOFn'\n", dmc);
 			result = id;
 			goto err_clk_base;
 		}
 
-		dmc_base[id] = of_iomap(np, 0);
+		dmc_base[id] = of_iomap(dmc, 0);
 		if (!dmc_base[id]) {
 			dev_err(dev, "failed to map dmc%d registers\n", id);
-			of_node_put(np);
 			result = -EFAULT;
 			goto err_dmc;
 		}

-- 
2.51.0

