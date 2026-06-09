Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DE948A2DF
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 22:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043598; cv=none; b=Y6va9Qx9GT65dIg8mjffebDN6WDC/rBqhwD/v7ISw8GsrILDEeZFQ8RuSAiE8sVpM0tKI1VkjCNLgp6nnARa/bwZL4UoY8neG2zbZ8RkWowt7aS/nHGyFcN3V4Fja9PgEKzXZ52F/pFzSyx9q+YYXnL21fCv8BtwFREE+cSNKro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043598; c=relaxed/simple;
	bh=lyTXMgabiZFV1r5MchNd6Qy8eKJqo3LxCHLLSTQ8EzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xa5N9TNLX/lTdez3B6BJ9AVGcHaCIDjZbjUuXP/YeWpW9IsFcE9HTpUOIL9MLqhjrLIMUvsktu6WC6ftQvAuLHMhVptK+nqrIrnMmN58HvOt2REAr5kBDhOlWDF4pobkLPGGqE678TWOgDAPlu7IzeocYvdFuwWkdvkBCbj//cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/ZOFaqk; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/ZOFaqk"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c8587427468so2450256a12.1
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 15:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043596; x=1781648396; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Axf2i08FEMNQcDQLuzX7KUZnp7l0NF95o4nFAH7q5yc=;
        b=Y/ZOFaqk43px5WyvaMdwC1/SfmDrpeSW3UyALRZ8lsSj42x/qdB9UFCwTmqJ2dcLqB
         EVkVvUKnI8Tnu/qjJ4J42hrFvtIz3DRgyo9UUWF6bSq1JNe0V3/NMZhA+3De6nOVVmOy
         mXG1gQzQ8lNYLLDwULd9hW05NI/NJzOsZEw/IbbGsn8zIUwurbUQIHfLRIpt2rnkQCT7
         +6BDvEGmNvTroiwrYII75tFXT24fyG8Yq6ca8Jxj+MOCOMqxRCiHJLiWlCcg8JxDJIE2
         pKp7hI4HAsDj86Mp/R3QyBQVZTEwcWTIk0t/YrAar9Ra4NwJaS25bcdBBtKGWaHTiF5f
         kLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043596; x=1781648396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Axf2i08FEMNQcDQLuzX7KUZnp7l0NF95o4nFAH7q5yc=;
        b=ZmCVcSCiMwLZCd76IZFcBfxzlhScvjnpwS69wuTeoRy8OyuFaTf5JW9P9KdLx7aHTS
         /hVQIEJCFeqgv0N3m9Z7Bj3YTIePyoTf6DY/4NaCmbYuY+lnQx45blEmmjiCXCA3ABbD
         iPRFpXCL/1DPvc3B3v4XNyymuKH7967BD7C03er+mt+Qlmjdxj7tbKnG0OeO0djsBAfn
         R0lGxJm1aepPLJpToVedDP+aslk1v+zkqyesV3yBOKTfrEr6o/KrzKKJFveHBA7DzFfh
         CV5lGThIO4TMfoTzHepYjyXxsENjYpvJ0HXcKfL0UCEnF6w06XfY+fEzh8OnT6+/Uk3c
         WLmA==
X-Forwarded-Encrypted: i=1; AFNElJ+6KdRO14C26evzKpJV5A29OsSd8zXKkuHIaW1vrkewqmw/sGf3OPYCbSczwxz90WIAQ9yW@lists.linux.dev
X-Gm-Message-State: AOJu0YxcvMbibbk1R3tfWwltpUAsdVs9ZpOTcNq71ogyqMFDymaYAQYx
	tDxEjsYXiE4aPi9vD4O4bNw5C3FxS9AABrv/EfggbMYAB4IDjZY5GEbO
X-Gm-Gg: Acq92OGcbYjoG+PUbWLbTTV70cq37WFiW1J/hkMAuznpr1ovyFxQUcmjqOUlpnUMKFx
	XkApzEoNIBniuOvc9eMWAma0AnCtV97w0Z9nw35F53p6jJDmVo3CJJcuKkULx9T7H4VQJhUT4u7
	GUJsU9CM4ksFDk1eSjR3/2rW4rTvdh+I4iNEmnJ8ujteJ4Y4XL/fouoid3DBpt/tjNM6+np5XDb
	7ZfT2dncadCxPZ9CiLQ9RoVR60oD4CZUM9f+aRCHw9RfRY9SlEyqSfniQe9fOFqDSdDZ8Q0DOAY
	hdqSHgYkVotFPqpR82Lg09/Nr/bR2t2mE5DFcRdPM4wtb0mAhtLglEkdcC0Ie4d/jrQKwNw0nyd
	U98szNQvQ+i4N4lD09X49zCDZhQSpthcd2TywFUuMM0YUC5IxpN+qGodqhPQG/8CT816FUbXtoJ
	+4KuWaV/QWFlasIs+l/f2SSoBEFM5mCG6aW3YUoW3NU5HPZkZihTzX2mneUYwePsP2CgRnv+2uj
	fVea529HBch23f5XKLZrqrRA1OcB62VQfEnI4rPeLaHqg==
X-Received: by 2002:a05:6a21:7a82:b0:3b4:85db:1bea with SMTP id adf61e73a8af0-3b4ccd1b486mr26738313637.5.1781043596210;
        Tue, 09 Jun 2026 15:19:56 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm19661834a12.14.2026.06.09.15.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:19:55 -0700 (PDT)
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
Subject: [PATCHv3 05/15] dmaengine: fsldma: check dma_async_device_register() return value
Date: Tue,  9 Jun 2026 15:19:16 -0700
Message-ID: <20260609221926.35538-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609221926.35538-1-rosenp@gmail.com>
References: <20260609221926.35538-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check the return value of dma_async_device_register() in the probe
path and propagate errors instead of silently returning success.
Previously, a registration failure would cause a NULL pointer
dereference in list_del_rcu() during remove when
dma_async_device_unregister() tried to remove the device's
global_node from a list it was never added to.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 43d817f6ded1..3009e1531292 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1303,7 +1303,11 @@ static int fsldma_of_probe(struct platform_device *op)
 		goto out_free_fdev;
 	}
 
-	dma_async_device_register(&fdev->common);
+	err = dma_async_device_register(&fdev->common);
+	if (err) {
+		dev_err(fdev->dev, "unable to register DMA device\n");
+		goto out_free_fdev;
+	}
 	return 0;
 
 out_free_fdev:
-- 
2.54.0

