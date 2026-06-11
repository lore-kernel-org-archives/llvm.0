Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A70D33031C
	for <llvm@lists.linux.dev>; Thu, 11 Jun 2026 03:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781149999; cv=none; b=CQMRE3Wz7s74u4ZoN7ni6CCYRbVzSU+A8+++XFYEiXZmLGRoElmHBov+WfnjQaQ8LXVVIscU8w77IlLtDcGKRLBfFx5zF16ZpwBPGlGz8GIBVN8ruLXPOuh8+BUO9mx9aay9hXpa6YbfZDzO2ncNDKkM9ifujnAuS4DNyHcFUww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781149999; c=relaxed/simple;
	bh=Q/PgZrUxr7JJJLlNJf1HKxpgmT9Z+J8tRDHEovzB8l0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lm/Vp2mIno1oQxG78/a93nbR9j/XwNSicXk+D/JjPHXU17nEPMkm4aJLOScqjQ9Jt2gqm4PstWfkELY8QiOQse9LmQt61n3iuz4D2KyEHX0XZ3NMFMpOuScZsatmnqnyAY43PFyIEdOw5W9Fn+u4fOfflPu0Q6XpeBlur2B9I0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQUDqKfL; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQUDqKfL"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36ba3ea5c46so4522940a91.1
        for <llvm@lists.linux.dev>; Wed, 10 Jun 2026 20:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781149992; x=1781754792; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHDaxjKNRdlH2zlMKhtRadxGEkWWwDYddu/hmn7v0eI=;
        b=QQUDqKfL6Vo8hFV3fYi1Ypd/VExT30LgBfsGK0cW+mo3csnuVJpZCy3dcGA87FEa3q
         wDwhgza1DMc4sIqFN2aMWH6TxU6ISXjwZLbcVdIwz0LP0cb03M3VWJ8wU3uHWDfkrbqy
         vbey3he8Y6fLqkvCSCuwTWLgQW31M+ZdB9jdHBlB7gRsHZnBnQMf4oSfyQvKODuOiM7C
         0u9oMRyj2ykvX7JK0thsw5QlZecC5IAxOSliU2EZfVm3TEk+JZwAfVHLC3ytm5bgCOGk
         AH7ojTM2n+tTcgIQYbxGwX+P91/DaP/xjCJH4MIM/nddVpwbEeueq0tvirCoQsk2swJI
         e4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781149992; x=1781754792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EHDaxjKNRdlH2zlMKhtRadxGEkWWwDYddu/hmn7v0eI=;
        b=LQwBEXS/y83qf14PDbtTGsywhoJVxlgGI+3uaFyvLE0X5h8isfvub4+ewEQr8MXkfB
         K8MXrPwDlr5YDNyrYnnHjYwKafq5+ViIOXYIL2uAov/TFpoIsqKH6XRerzFFlOGyy4CP
         S6rE1KbfzPH4ht61Ji2q7Y75iVuwvBXAKNld9l+zzzR1kqpS3/ckObTG+dXIf+e+jKiZ
         EdQuAtFLSQRLRoSroa/8hRnEbZNLsrxAK9ZC1jR9GrvagHIEpXziDNhLmhN/WXvksmDb
         cea9cEMmiRU/AbyAiS9szn4Kmeb5tvjK/IubPpf8/m9HbcGBL5oGeESwsJ6vaEt0h7DC
         7Q2g==
X-Forwarded-Encrypted: i=1; AFNElJ+ZlfFev0/k5R+gya5o+ilB0GVUlHrY03yt4r8GHcYnYLuI3banboPVT4hQVsDojC4GWB+Z@lists.linux.dev
X-Gm-Message-State: AOJu0YwLiuY/T4xkJhBksyePv8RCbFAG90VsSq5+ADpD+ldMw0PVm0JO
	arg0c+MUPG3p51mtdlK9heo6B2DdKulvB976fpO8/tPTXPcV4OMd2nTA
X-Gm-Gg: Acq92OEYOZXdHC0A07pbqbP72BHMrmTj5kNqcZ523gESnI2zU/nb4/nI8zs26PdL4cL
	ej04kkqNLJ3Ym2MKpxEucJvInXpmhfSMpOxDf0pJw69zmjb9xSLJC22k4wQOl/TAbA+NBVHmDcd
	Lohhw43B19RS7PKOZA4nbDpCPYa2smYiI1Iiu/lDxWwER2dX1Hp+HXXKelyrScMOyzBxCRfv8O7
	DNH9punoeKvg4RilzngZuEfsXy1Kwh7gM04APcopzGQlsTiVnk+Xjqo+D5+Fsk34LWWoD81+EVl
	dLfNIV2HyICYqhpDK6V6gc6/uhyhFcB99pPXSyoEKoqUtQcAPbvUTbXDnMOBBi4+fKeNAPXpZHw
	yPQ24slHFTeLLPNhQRXsLNcncNbcfGZ6xHniuxL0z9YS9ODh3m0iPJdhrfNeakaXIjGL6PCoUXx
	+27fNjTj6Dk1eJtwhWYbdpVVDAwInMEhQOXlqfwgoHSldRzSqEt4gcmo4FLIylLx8smDKb0IPmF
	m8b/xsyglbqgMhHJCVhPU8mp60rsQcprW+08+JKqGkJhg==
X-Received: by 2002:a17:90a:d004:b0:36d:5dbe:2a0d with SMTP id 98e67ed59e1d1-3779e231462mr1177515a91.7.1781149992546;
        Wed, 10 Jun 2026 20:53:12 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-377522a188asm910131a91.3.2026.06.10.20.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:53:12 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Zhang Wei <zw@zh-kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE DMA DRIVER),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv4 06/15] dmaengine: fsldma: fix probe error path not freeing IRQs
Date: Wed, 10 Jun 2026 20:52:36 -0700
Message-ID: <20260611035245.13439-7-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611035245.13439-1-rosenp@gmail.com>
References: <20260611035245.13439-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If dma_async_device_register() fails after fsldma_request_irqs()
succeeded, the error path jumped to out_free_fdev which only removed
channels but never freed the already-registered IRQs.  A subsequent
interrupt would access freed memory.

Fix by adding an out_free_irqs label that calls fsldma_free_irqs()
before falling through to the existing channel cleanup.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 3009e1531292..4475d50a94f5 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1306,10 +1306,12 @@ static int fsldma_of_probe(struct platform_device *op)
 	err = dma_async_device_register(&fdev->common);
 	if (err) {
 		dev_err(fdev->dev, "unable to register DMA device\n");
-		goto out_free_fdev;
+		goto out_free_irqs;
 	}
 	return 0;
 
+out_free_irqs:
+	fsldma_free_irqs(fdev);
 out_free_fdev:
 	for (i = 0; i < FSL_DMA_MAX_CHANS_PER_DEVICE; i++) {
 		if (fdev->chan[i])
-- 
2.54.0

