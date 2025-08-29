Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF2A31B123
	for <llvm@lists.linux.dev>; Fri, 29 Aug 2025 13:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756473241; cv=none; b=NnrlXkR6/aagB65SBPRJ05xKE+7eaZATZPYzHSMrHd6XEVNfhLmYj7pYSRrINqlWpp4y8da9p1RhTFelQL/KIF9HsLBPKQr9r77EGyrnW0664BoKCrGhvXZCwqKNpX2edGTMrvsKWfwYYo/diPoLbLiaGdokH5ay74/xmpM4+68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756473241; c=relaxed/simple;
	bh=jEDrWRqVtKULrTucTSLr0n/DeF/H+SMQdH2t6erHpwA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YhRU8QsIACtFAqYcSoB967Ir+FSmhfkBgJvrozeRutU+6fLFBjKRU28LHxGvKi5CUWBgSR66y8jvuVw29K2QoQu7FdXbcNpjSkwaos2Wc9xqMyE+vbRIg1HhQOODE0uGa5LaPos3urojMAhEGs/6PUScCPyB90RwR3KFvtGF+Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hSgX7HYz; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hSgX7HYz"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55f6d7a2a09so8868e87.1
        for <llvm@lists.linux.dev>; Fri, 29 Aug 2025 06:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756473237; x=1757078037; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FE9Jl8MLsGFXC4bdNsn+0eHbgCcJaZ4UJYq9PxJ9Nrw=;
        b=hSgX7HYzPANQ3NlhZwNxNpjgWGRV3IGY+MaEfzPfTjtf18xm/PxcIQ67RyiX01i9I9
         qDa7dh7jrddKpAsS2bTLKT+hRdIn0mYgsEdPJuJeK8SKhSt57nqv9ectcExMGU5hJCYa
         poUSpm5SYAnx2yCv439vfoeTIht9mUaUOa8hKDB+quDTpVIhJ+8bVseideNn8VVxsyQ+
         6sHdOQnNfp1d5mzy0x00u2+gk0RxCvunOjFpFy0LLwWrLmdcw6Dr6F37WdPbchPlEawR
         saubQaRynSCUPTJYm4ImXrhv3aylzjLHILZWniw8THtTNFpQp4erT7z+qI1Tp5lE246S
         QTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756473237; x=1757078037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FE9Jl8MLsGFXC4bdNsn+0eHbgCcJaZ4UJYq9PxJ9Nrw=;
        b=WOTbR3WcmH3DnTNyZqnkVGPilKQ4qTy9sPbSShhwMtze8MKqVMvxM5eB7T8uyGUqv9
         nDRqrwaMkSphulM2TATgAzG1ZkevAD5Gge1Hu5Cr+3NRPCwlExWtA3wWMUslZD6vL1gu
         KamFt+FU6M/wLZhYnXqfjwRoG9Bb27gMHvl1YyVkpcUVM0fhramYZYqXY/WTaMNRVwbU
         U7ZGph86NlTuqAfynHGALI8TI+Fm4n/TwI5YH6GpjuhM7OtqQbiyZypW5yGw8AOgiICK
         7NZQKJfaOyCTAtpOpfXMzQDymB0VZE4h4Z/z9AM02gh76nwl6Ol+91uZ9kWrX1Wjw2hH
         6Xfw==
X-Forwarded-Encrypted: i=1; AJvYcCVwrfz4sWgoA+MFm6DbxtKTzHftX/CWVvcpA2Qd9MPk/vNfMCWcLfINh7DIMgRxXlyv4Az1@lists.linux.dev
X-Gm-Message-State: AOJu0YwM2EVGrp8lRZKXB/NaJkJXQqm46Fod9EVkI4jaeX8CnUzyuWxq
	iX3Mux6fI4KVAJlgnHnPmJGfexk4nBrKP133P6byYSm5tl+FtuY0q2Ml4i6ijtvyafQ=
X-Gm-Gg: ASbGncvMifzGI9DYTv7Sit7h9vOHIZMyPBFJT/Z6/7J+U5UaxkgfF76u78vU+IAbaw9
	ccdn71FTDcLHmLe8gq2vImRkpCOCXYHYgZsCCNTv4ZSi0fYR6Vk/06AmRo/l1JeTvvNkQxUAM6w
	aesVd+btBUGZ9VqDL4EMUEG+XGmZ/VOPP+mezYd0wYBWAVPEdg3BongrJmkLSV5lYmR9Qwc8weT
	4lo9zCz83SUqcE095mtQFDubigs6KxoPz9Jl1mYTz0y8yzFutDwCvhhwPd2YGA34J/7DaCH26dH
	5SloS5ckUcSHhmUKRGTSK9JL/j21xgrrd4OYXLKnxAUVrvXfgfhgS3QP5eEil8NY6XnKcgPE96m
	UcWFAr+sJ/T9tO8P15YQTuUtpm0E5uMyTjYhsLW60e3zV1dPS4gKDCNm9x/WUrnsjHjGu
X-Google-Smtp-Source: AGHT+IG/8Xqj716iiBt/qchOr1OFGqPi5/74id2OSt/hQJFdA0DdakhT+OcqxRtL9E/IhDxB0ZX1Dg==
X-Received: by 2002:a05:651c:2121:b0:336:a73b:b605 with SMTP id 38308e7fff4ca-336b8da6293mr2896991fa.5.1756473236831;
        Fri, 29 Aug 2025 06:13:56 -0700 (PDT)
Received: from localhost (c-85-229-7-191.bbcust.telenor.se. [85.229.7.191])
        by smtp.gmail.com with UTF8SMTPSA id 38308e7fff4ca-336b489c487sm4641041fa.49.2025.08.29.06.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 06:13:56 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: peter.ujfalusi@gmail.com,
	vkoul@kernel.org,
	nathan@kernel.org
Cc: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	dan.carpenter@linaro.org,
	arnd@arndb.de,
	benjamin.copeland@linaro.org,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] dmaengine: ti: edma: Fix memory allocation size for queue_priority_map
Date: Fri, 29 Aug 2025 15:13:46 +0200
Message-ID: <20250829131346.3697633-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a critical memory allocation bug in edma_setup_from_hw() where
queue_priority_map was allocated with insufficient memory. The code
declared queue_priority_map as s8 (*)[2] (pointer to array of 2 s8), but
allocated memory using sizeof(s8) instead of sizeof(s8[2]).

This caused out-of-bounds memory writes when accessing:
  queue_priority_map[i][0] = i;
  queue_priority_map[i][1] = i;

The bug manifested as kernel crashes with "Oops - undefined instruction"
on ARM platforms (BeagleBoard-X15) during EDMA driver probe, as the
memory corruption triggered kernel hardening features on Clang.

Change the allocation from:
  devm_kcalloc(dev, ecc->num_tc + 1, sizeof(s8), GFP_KERNEL)
to this:
  devm_kcalloc(dev, ecc->num_tc + 1, sizeof(s8[2]), GFP_KERNEL)

This ensures proper allocation of (ecc->num_tc + 1) * 2 bytes to match
the expected 2D array structure.

Fixes: 2b6b3b742019 ("ARM/dmaengine: edma: Merge the two drivers under drivers/dma/")
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/dma/ti/edma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
index 3ed406f08c44..8f9b65e4bc87 100644
--- a/drivers/dma/ti/edma.c
+++ b/drivers/dma/ti/edma.c
@@ -2064,7 +2064,7 @@ static int edma_setup_from_hw(struct device *dev, struct edma_soc_info *pdata,
 	 * priority. So Q0 is the highest priority queue and the last queue has
 	 * the lowest priority.
 	 */
-	queue_priority_map = devm_kcalloc(dev, ecc->num_tc + 1, sizeof(s8),
+	queue_priority_map = devm_kcalloc(dev, ecc->num_tc + 1, sizeof(s8[2]),
 					  GFP_KERNEL);
 	if (!queue_priority_map)
 		return -ENOMEM;
-- 
2.50.1

