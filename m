Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F48C335562
	for <llvm@lists.linux.dev>; Thu, 11 Jun 2026 03:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781149994; cv=none; b=QbQNohJ5ks72zoCRYXbtd11uIkcpkCs+13vpO+TIZoNSzjrrnJArDWytTAC3r48gmyRMCdqlo9oJ55Y4ZpEwgDti+cEiaAx9E0SqnYFV9RsVho8iXaD95ySDr8eHtsX+RC/9qQ7DeiiA5AgphLhojr05lUlxOBrJgCuXwZx66dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781149994; c=relaxed/simple;
	bh=hpFYqVe6ysg9za0CJbNVYYOl7z3o1IuEZ7WBoGNTegg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I7LsNUh8lqHUq+8wh5F2lsgMSS9cDJulD7p3oWxYRXYNyahct6FUARVAOZAwlnuk1hg6uHb4E8C9Pl383tnhdgBk0WQLKtwNjMKoM09HxIandpTqRr4DBdqo9Url9ALh1MRhEbTQxESUdVLETLohOcQ4d016y17wQ3mQMhxpeGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XcSYDQhO; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XcSYDQhO"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36c68964315so3719831a91.2
        for <llvm@lists.linux.dev>; Wed, 10 Jun 2026 20:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781149988; x=1781754788; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/U4fRir7cY7WmN1QFR3JHwmFXZxM36Et4Gv4EjzBgmY=;
        b=XcSYDQhOGF7Y8HEnthvPvJCBT7hn3mVhdAXwbw0agToAYC219cEFhXziEg/b+CPhO2
         Q1EFfeRzuxZI88kHUiwNekxmTQ14STxz05Q33i/xRW6uNeoKEXVxQ69xiL74gei5egtg
         Hpeh/xaF41ZuNQITY8kkhM0ZfM4k/ZbofC3NKNurhvYNmC1NQQg131TcbvZ/RV/uyE+u
         YknuMzFQorWDrcZsNebVrQMmAawerYDLTSvwxvhKfZ8CTyZKsFYa6VwOwiOyL2jdkJL7
         du86caBMFZO8Lk9CmBtsd82zLeQpvvW4rnCN6cL53fG0UH186jT9cjYolM50TP6WNrcD
         Wlug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781149988; x=1781754788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/U4fRir7cY7WmN1QFR3JHwmFXZxM36Et4Gv4EjzBgmY=;
        b=Eh+wmL+Qw3Ql48yIXaTFkPgABpoNmF7kWm/3mMeEMxrtlyIxvZwzYXP5k1UT7BXWex
         cMdICzfOVaiN1c7SmaTUYcW5iGiMtVTc/vXMOCTTqpbeLoAgM834lCSjvrEcEwPaDjUr
         CGHJ+bgzvlq8uVweQ6vVqAhUJbZOCXu54Uw27OGfA65rd6QQ9dewWXvCcRjTdEfSCMKw
         ncP5H4W+D0XRGk0I20gfsunpOWJllTMOI0Nq6NWxk3VDac2NF38dC+/HokwMx21KFxNf
         bBM/f0HZ5yrwFqxZKnfRXRuxs0rRMzcuGnHzLhLZ6IHFGsXIzAtrkPkawzLmtBKMsObY
         MOhg==
X-Forwarded-Encrypted: i=1; AFNElJ8n1457j/0UFfrYWb8KirV614IDP4VDrjrqja4Mkpu7q4cybPuAbkp5iSnlJRP7L8Pbg/nL@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7VjqlEv7rQ9VnUbJXhsY2iLvOAzu6tKwByN5a8y3+Yd46Ejn+
	j5fzMa1Vwlm9504rkYaIO93MLh+u9VWnIPQfdm2NVALtzKU0KjTqnJTM
X-Gm-Gg: Acq92OGfoy5scV8QHZCjgUvh0wDUSwejgkhy5pMc5OtiU/zubAi7vPh26GO+Q8xnTSN
	nEAd9Y/nTEkMsOr9f01IrU/648oG9o4qhFEyuLJyU13RYWQm6uKi+9lZS1NuXaODIUdlCBs4KTM
	EFyLbzOZ5NXAbQ/iLFeC7oaGn4zUhJLKQaCOfzz951PyKDNpUlLtvEWAfWyC6omBP3pnkJUvsXv
	FEio4ng/bFXOg1lEYEkss7aJ+9aJMWKEOSnb0yqA4kqStvwvS+4lV+GrVDUPjcJwfLEa7K703Hz
	MRhHFKzlU1c8QEMYwA8Q5MAnNMJA32H8NaVy8EzlpOADUg6S0Uba2y3ZEcpMmTEZMq/dvSt3UYi
	mbD5I/e7mFoPU1n9gIB+3LeRuFm4tjiVhBXMSHaoF9GLsNzDicIdleNLzh/Uzm4fAZ2dFHxPD8X
	Uf5vMueCyQKkbbE5zEVTssLnRfjjsEmAEpoAEx8eicG7pki05F1u2BQ+iJ57TDLxFo0US4FfFyn
	8wJgKC2PdXIAnpA4QnKcnu2s/HLqX8FwmDniQKc5CU5eg==
X-Received: by 2002:a17:90b:3f50:b0:369:c5f4:9681 with SMTP id 98e67ed59e1d1-377a870982emr1259378a91.22.1781149988448;
        Wed, 10 Jun 2026 20:53:08 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-377522a188asm910131a91.3.2026.06.10.20.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:53:07 -0700 (PDT)
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
Subject: [PATCHv4 03/15] dmaengine: fsldma: halt DMA engine before freeing resources
Date: Wed, 10 Jun 2026 20:52:33 -0700
Message-ID: <20260611035245.13439-4-rosenp@gmail.com>
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

When a channel is released (fsl_dma_free_chan_resources) or the driver is
unbound (fsl_dma_chan_remove), the descriptor pool and channel resources
are freed without stopping the DMA hardware first.  An active transfer
could continue executing in the background, fetching descriptors or
writing data to physical memory pages that have already been freed.

Fix by calling dma_halt() in both paths before cleaning up, matching
the pattern already used in fsl_dma_device_terminate_all().

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/fsldma.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 455d21d738de..1ba10d065278 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -748,6 +748,7 @@ static void fsl_dma_free_chan_resources(struct dma_chan *dchan)
 
 	chan_dbg(chan, "free all channel resources\n");
 	spin_lock_bh(&chan->desc_lock);
+	dma_halt(chan);
 	fsldma_cleanup_descriptors(chan);
 	fsldma_free_desc_list(chan, &chan->ld_pending);
 	fsldma_free_desc_list(chan, &chan->ld_running);
@@ -1207,6 +1208,10 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 
 static void fsl_dma_chan_remove(struct fsldma_chan *chan)
 {
+	spin_lock_bh(&chan->desc_lock);
+	dma_halt(chan);
+	spin_unlock_bh(&chan->desc_lock);
+
 	tasklet_kill(&chan->tasklet);
 	irq_dispose_mapping(chan->irq);
 	list_del(&chan->common.device_node);
-- 
2.54.0

