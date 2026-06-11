Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AF5331A63
	for <llvm@lists.linux.dev>; Thu, 11 Jun 2026 03:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781149986; cv=none; b=hq9GrzvuRs9zrp2APGkXdmN2d/GaF6UdFfNa2aXBNA3POUyu2nKbBYsAcnyS75hpbg+aXcESkPPj0yT5DJ9M/JbLQS0StIpjK6Ygt2L9LMsnjJE8RqJBJwCrr8IO3Aolpeb92VYnhE5EjKwfesFaBMh+L7u27x6TNTBxAiHqyHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781149986; c=relaxed/simple;
	bh=aPbMoowg2EuPBMdzYXozwY+p7f4ETcRMlcmaGgXeXec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tQGmpinqnS9AMesSJh3Yo/2lqsq1dNpKbjJG0icw0SFLO0FenSlPbk8tgv6Eu05fk5LCbaI5yr0be403fzll9ERHYGEB8WyFMammpE8Ez5vxtvHtlMro9dQ/P5Rz+EK9ppSxXiZHEHQ4PLamvhY+AWZP0chxW5/AF3DXJ3ZKviU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q1jISsDG; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q1jISsDG"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36d98c9b596so4733805a91.3
        for <llvm@lists.linux.dev>; Wed, 10 Jun 2026 20:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781149985; x=1781754785; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kn+zKrxqRiv/1m18H+iH3XPWY8WSKvkkOnHkQbRgV6Y=;
        b=q1jISsDG9ti9iT79909GbAj8E73rKr4OfnGGP4TAOAON/pYDRORRaMho7KmW11LgEr
         vxQ7kKIc0hnwJ047teG5lYhj60DN9tQ6XM4aaCvNozzBesO3OGHmuJtJP7sE2qtKV94u
         +WrRSHsexuSs/HnOdjdxmGYNM9M5K9k9tHFvW3IsmwIpWVfcR1NiXSJszl9kBnsUV5iQ
         bABgcnMOslpnBQFOHLIpgH9BEEfjDYdwSGm95LKfgIMb63q00QFYlT3VUx4mCRZfHn9a
         HFaC+gksDFwwfCIaREIyGnC7zDKUtPW0+khb17nkaFGjJxQgn3HxbBd5ezaKGyHeheo1
         +K8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781149985; x=1781754785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kn+zKrxqRiv/1m18H+iH3XPWY8WSKvkkOnHkQbRgV6Y=;
        b=XsSlXf+wIPe7L0wdYM+7/bQdLXf/qhANVD1UsHSByu9kxeSLAWs3Bc0GvX3rNH0xed
         cI9M+/GhMxWT8MZea67VYwUAQ9EL9jfoNPo8t1EwxgtOqhUEMAM4O8+S6FpIXdwSoEwc
         cqmgVf7hM7iV5HBvtGjibQb9dF72vy6On6l5kawTlKRF30LdkqqxfWgcP2YsDM8unmZm
         c11RC994wUfp30LjNGEsPMXsqAEViRDFQEE/tkTekrNO30Dhr+9VBa07czq1zWrD4GyE
         tK4NMiUmLToswHVDAXVHKgHTue1qQLb60G4/VoZSEzIGguFaawZfSUg004n0bvPiqNIG
         uiYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+45FAFnT/LO9+sCwSyX/gdvEXhtKo4J24Kc4iU1+oqwbqa8SoajCBUO4osXKDJGkfF8SnX@lists.linux.dev
X-Gm-Message-State: AOJu0Ywoc3U+xjMDqgfWX5wx7MCuX8Eir3SB4m3vE5iGT993txgYP0cx
	WFewNvI7gyFwrrOYy3hIg9rfBH0DHOpeNreS4+kB0z6FP4Z1kFqPaQpQ3kum5g==
X-Gm-Gg: Acq92OH9yS+h00i6iF6dvmcKD+VOWQqf7yrxRENKrJn8cqXAxOPdFtdRAniUBe/YwEg
	TI9CM4tTNJ/vSBCjL9oq8fueb/C9cAFFjscO0g30f3jQvGSmWfkf0bxgDiTlR/ERgn1M3xqkv61
	JNMFLr1xJVVhZi/Zq06Ekv4vFAijENbMtiBa8luSCbvMtc/8jLLr36wHK43ETImHFplvZoSEqDu
	RUD3llqcHttSs8GLofgGEh3W2w8QKsHN4AJBLoZwz3wttD5fk1Kr7FTWVoLwNixwwLiutg+rSQT
	5MyhtCTZ4f1jYNlHJNDBddVAvnurVGMX9PLerUPUYGXCjXb60FMOK6MfUmOBGDxHkH+fSFaqFo8
	yW3FLcoBJ8Ucj7sIS+U+TU68NHIwelU7uxPrCRtvldOSyV2ioHxNRr/BrA7kaaXGIs0sMRZVtcf
	KgZa+Fg3q89YkAcyNiqpHU3yvd+AzpvvyAecWkkc9YDa2yc5Gs3q3o+/1+cyhcm05LbD+5ifbHg
	cpILL8t5cXwyUBq1WMl2DTBYT/+MpPqV3s0pAGRKqVjiQ==
X-Received: by 2002:a17:90b:5867:b0:36a:4074:9aa6 with SMTP id 98e67ed59e1d1-3779d2d7c32mr1202152a91.6.1781149985147;
        Wed, 10 Jun 2026 20:53:05 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-377522a188asm910131a91.3.2026.06.10.20.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:53:04 -0700 (PDT)
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
Subject: [PATCHv4 01/15] dmaengine: fsldma: kill tasklet before removing channel
Date: Wed, 10 Jun 2026 20:52:31 -0700
Message-ID: <20260611035245.13439-2-rosenp@gmail.com>
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

Add tasklet_kill() in fsl_dma_chan_remove() to prevent a race where the
tasklet is scheduled by the IRQ handler and runs after the channel has been
freed.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/fsldma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 22d62d958abd..0e2f84862261 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1205,6 +1205,7 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 
 static void fsl_dma_chan_remove(struct fsldma_chan *chan)
 {
+	tasklet_kill(&chan->tasklet);
 	irq_dispose_mapping(chan->irq);
 	list_del(&chan->common.device_node);
 	iounmap(chan->regs);
-- 
2.54.0

