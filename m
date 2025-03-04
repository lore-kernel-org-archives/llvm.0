Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75B628629B
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 17:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107940; cv=none; b=UEqPD6ENRl3PSHbEv0Xe8P04SgYXRmkio9KO9viDrhRYB25a46sT0YkGaU2DWsbzQ1xpPZ8OQa5BKaNzsFyrPLjpgf90yma7Yo/Sw5ohMhkxISlG+kGtVv4CsulZucR2OsDmI7nNXb16ZkIZd/t+iYt1S4k+eaRTeyfW+d2Mk+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107940; c=relaxed/simple;
	bh=96lokglM16xoW0bhDeFwQgKQck5a27ZC3KAyN/gWBFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NVqn+Qcoa04coRk8LDAK35Fyzaoecky5ubXfs59NtV1K7g6jMXllBVWQpke+I0haOY1g6RJRLYt3jVKCL5AcvKzmbxN7xLMQ6H4JcOXppKXvyPC/0GER/NRWqNmojwQC5sKKsYJM5+gXF2ju+IyUF+i9xgJJGDPqPc0j8OcwWSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QFgoj+Ml; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QFgoj+Ml"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac202264f9cso95917366b.0
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 09:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107936; x=1741712736; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgG/ZB1ufhyJ5LLnH+TbRO+Ff9QR7sb5p8sH4cYGYcE=;
        b=QFgoj+MlxbNbwYvuJqmv9vsqiKzDklSeDH7TefHcisZJDy9zp+ViKI/9DoyLZImQIm
         b1/Wj8vvh9DH193f8jc4pshqT+T6Ss0NUoWiyjdP84LdYbLldvD7n7bIHxxEVUpbyzjK
         cxjQoCekThkHh+2HTFXRL6369joyzOAH2Cp1MHmdtfuWf2JECq1VnvoY7omrVRgTvUf9
         1NHtheKtiTB7UUPZzLfIBUk2P7kY5GG0ue+w3TwXtdaxstmpuBhl8XoE9OajG6UlmDsB
         9uYFezfeQLexBxFhkDz0NJfDfaiypgRC2KeCeIlSYPKq8qs7WZ2x6tRshFRqZHiSWCOB
         hSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107936; x=1741712736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgG/ZB1ufhyJ5LLnH+TbRO+Ff9QR7sb5p8sH4cYGYcE=;
        b=JL56pwbRqlpfg7/NVSbjm7H+i9BWMC0n+coF0WO2HwX8c3Q6N00d46h6gUDp4P+pj5
         4Vu0mjKP1ykn6X9sGfUW0DtKLtdfroCeXjtQF8QkO3+Jt6t1vACCpp9UTCxP4w91HPSA
         yqgVc99lG36viJH1HfC83G9ADEtpnwLr+uNF0PF+VI+Tp0zi7wzbXah02jFEN6zKBU8M
         cdHh1vaUxY0QCe25wcwHFlZhO6ilfbnvKvJuGKqNOXRNgj6Pz1mi2YBWEJ3mPLZ7Drm0
         dofTEWBlyOrXjp+YN87L/KXoYY0VjlPxy36+SOTFWI3Di3TzFSLZmnX/y54pwV7Yg3tF
         om7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtJqvTzV+NHeSQ42rrJQRYeNDnWoGc8cXwsl4cplmVrPYZ+sSE4czu+GrFbpTuGb8C21f8@lists.linux.dev
X-Gm-Message-State: AOJu0YxgxRAIUSvD/Axh/V6VESVsD1H9pcyyfGhqLlequMgrd8sgBVy4
	9hGGPtP3NPRkbV7EVi2KFCcFS+GVx4XBNIPefIuqugFnqsVA3MlrV9vS7j+C3zg=
X-Gm-Gg: ASbGnctjcwDRiUwxyiCodbhcz8FdkcRoQZB/B5we9aCKHs3gG3S4Eq7yqOnMJ53bipK
	31msk4iELRhsl+jqsKbMBJfnVPlgL0+JfvA7SlaGyi04aQv6gb6u04q63gWJzhOEtTKCDQWCeTy
	kJ3b1UhW55NUpMo4sFTJkt5bd4RfmT/yNi9pqqBkJHTidSisgaiFu+Crcv1u0IX4MCIoOrWdOK4
	qKYJCfu8moJUeRgfnvjHODJMlYiq1PMocEgM9WRFf+NC+hkdxtsQxsbTCO/3GAhvdXDa7nLGZl1
	TfvzblkILM1tQXNTRwZinQbO0xqx3tLzb4p14x+6G5zUWzwPWGR6w3ZnOG3wa5yi6jKRDssLlHZ
	78wHJExkkgkU83eblhyk4SaEjX3B7
X-Google-Smtp-Source: AGHT+IEZSM7e60umftuoTA+5yHKxOw5bEfyTXKI9tFiIm+4qyPCIhcf70tbw/wLp28VjnQQVfyBtmQ==
X-Received: by 2002:a17:907:c2a:b0:abf:6b30:7a94 with SMTP id a640c23a62f3a-abf6b58f60cmr1276559166b.45.1741107935884;
        Tue, 04 Mar 2025 09:05:35 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:35 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:35 +0000
Subject: [PATCH v2 07/16] rtc: m48t86: drop needless struct
 m48t86_rtc_info::rtc member
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-7-d4689a71668c@linaro.org>
References: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
In-Reply-To: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 Dianlong Li <long17.cool@163.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The memory pointed to by the ::rtc member is managed via devres, and
no code in this driver uses it past _probe().

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-m48t86.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-m48t86.c b/drivers/rtc/rtc-m48t86.c
index dd4a62e2d39c73b1c8c3f50a59fd4fffc0b45105..10cd054fe86f9e6be74eb282222b2751dd91cc7e 100644
--- a/drivers/rtc/rtc-m48t86.c
+++ b/drivers/rtc/rtc-m48t86.c
@@ -41,7 +41,6 @@
 struct m48t86_rtc_info {
 	void __iomem *index_reg;
 	void __iomem *data_reg;
-	struct rtc_device *rtc;
 };
 
 static unsigned char m48t86_readb(struct device *dev, unsigned long addr)
@@ -219,6 +218,7 @@ static bool m48t86_verify_chip(struct platform_device *pdev)
 static int m48t86_rtc_probe(struct platform_device *pdev)
 {
 	struct m48t86_rtc_info *info;
+	struct rtc_device *rtc;
 	unsigned char reg;
 	int err;
 	struct nvmem_config m48t86_nvmem_cfg = {
@@ -250,17 +250,17 @@ static int m48t86_rtc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	info->rtc = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(info->rtc))
-		return PTR_ERR(info->rtc);
+	rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
-	info->rtc->ops = &m48t86_rtc_ops;
+	rtc->ops = &m48t86_rtc_ops;
 
-	err = devm_rtc_register_device(info->rtc);
+	err = devm_rtc_register_device(rtc);
 	if (err)
 		return err;
 
-	devm_rtc_nvmem_register(info->rtc, &m48t86_nvmem_cfg);
+	devm_rtc_nvmem_register(rtc, &m48t86_nvmem_cfg);
 
 	/* read battery status */
 	reg = m48t86_readb(&pdev->dev, M48T86_D);

-- 
2.48.1.711.g2feabab25a-goog

