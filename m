Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F089D3F0744
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 22:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043595; cv=none; b=IONTFK/5HBd4AbJalVdELayWNeoysIBDyPp4Hc8vNsvV6LBUCMc4ENHjyz47ullH7dJTlC015P+Ft1R4X8CBvor11KKQpqfOzV8khemYkoliF0tQBIU8JREHjIhak4SJjfYjSWMLWVH+ogGGBIBfJtJm3D1pGYIU0nbfm1af0M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043595; c=relaxed/simple;
	bh=RhXIYqhBSB+K4Y9o4QC7TbeT9dbJgsSR8y4PjJxpvyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lz5IHwu6E/yt0igY4KlesXV1i5FdnYDV+SF7Sp43QOFmuqF8Fl/z6CKPhsH+37p8Zq0kn2cFMM/K8h2l+I6v9h1RkUV9ur2weLPSNWZeupfiV0WgQ5X3HTC+ILQGF2XaxdJHZmLS+Tq4zT6RE0oYneqevdJpMx9CcUZQKeV7ZKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGBa9+kt; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGBa9+kt"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c85b73ffb52so2565385a12.3
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 15:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043593; x=1781648393; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tNx4Xy1KooduVSVGOlll8hTxHBnljmtg7WB5wHO3xtI=;
        b=jGBa9+kt9hyClxO/s1IyXQ439BxwKWffGsgGJD8H4VKxHwMoQ88foQFu255hXaKjoF
         6Bg9gwqaNOYyRsghtV8HNbBluNgxLXv5t7B3F2HDD9K0J6SEDPhqjy38F1ZXLCDmKH4O
         fwF9xYbLbEO1o7IOaNGkoatPzfSXDKgvUxTafC6sUimQlLs8xz9oZsKdP92A5qaX/NK+
         CaIxlG+AsQB4l2p0H6Y7bskO8UZe5MQJSemS+M+pZOIE2eBxreZXK8vMveaDt6qM69bv
         9kTZp3mSLk0mwsPilirG3v7QfYNlv90ol/vpwkZvbbxQaXpibBSYATOeX0oHX6XTyMBe
         OxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043593; x=1781648393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tNx4Xy1KooduVSVGOlll8hTxHBnljmtg7WB5wHO3xtI=;
        b=saW+GuWDekoWz+m7fslYaA+AcAd8DYLIrceoky8Qe8nCC8lcHiG+pkcY6vLl08y6ny
         9UkTyG6JkvCHZ9z39jna+kVKBubI1aZzezuNxoN6wWPagCcHm2M0SyUb2+V4V31veM7M
         P/8XcGh+4c4xGd1dbI7hEdC65Wq/Bh+Rsbb/qiRMsoi/q9xQXenGvegPVUpamGNFCUb5
         YdR8SMAb128Yk9fCpgibzEZVnkoyaCcBrKCFYKXzrh1rZGvMVVqQe5eJt9SOV9tX38O8
         TeudAKjZmP8iM7dPlUoWKEC52PnbB6dzjN73PU8jckGSEqBLCfEVU6kJE4VXn/PDazQV
         Q6wQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Pw8zL9qnI3g6O8FCojt9b7GKvoj4dgCnG8yYP1KJoaawCl8F80yR+ItFOouyyQvuy9EpK@lists.linux.dev
X-Gm-Message-State: AOJu0YzWbq/qodQTxVW6QfdMkQ0fSp9WDBN94y0MhDkcJWEWZSVRPhqb
	DDAggjWQjDu8GLrjpk8twI6yrw1+mNkKpn+tl1d+RAJvEUJin9lZ91U+
X-Gm-Gg: Acq92OHvr29QwM+inOjloAJyobu3b8W01ATyye05V0s+Je5NztPToKbxsnLZ3l0+bvI
	uwZoO0PklLnBuDE9UOzwsOSTzDhJgln5jEbWARja0JX2rza5tSOzRaxmdFVq8n5q0Cd/VIXFwH+
	ZOPr3vp6N7OFhSKLfBejNQ6dkiXYRwowB0i03Q4BWk1SZAOBFYD8LDUIH+tlT6ifcdS8lOtegtE
	XutwUBRZe8R7VKzku9Fd4/+YY+0A7+M7HyJd8laxZwb/dYpwPreLyaAv4IF3J46gADSqeQV1yUQ
	DHUyQLIldTA3Fhj7vUqs5c0YTbDyqv+fntqQAUZBBc0Htpwg9zMe5ddTuTscWngAxRVy9OmQd5a
	yrf3f0IJLCuYCmazzBM2VMh11iMeDXcyXFmZsd/G8khGCoPzvaQI019cdizi5QMU8RVBZ1UFOcn
	ta0Mjh38dyLO7qRguwaDN23yrTIiefisrl2bq6RTogqW2I26ZQHO9bZ2eEq/omZdE2HBcrcfkUi
	5Zb+Qw9oPru4bcCSjLzUvafj58ZGq8NCp/K7rXS2ZX/WQ==
X-Received: by 2002:a05:6a21:6113:b0:3b3:65c4:c680 with SMTP id adf61e73a8af0-3b4ccf7f2b8mr29078053637.25.1781043593166;
        Tue, 09 Jun 2026 15:19:53 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm19661834a12.14.2026.06.09.15.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:19:52 -0700 (PDT)
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
Subject: [PATCHv3 03/15] dmaengine: fsldma: halt DMA engine before freeing resources
Date: Tue,  9 Jun 2026 15:19:14 -0700
Message-ID: <20260609221926.35538-4-rosenp@gmail.com>
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

When a channel is released (fsl_dma_free_chan_resources) or the driver is
unbound (fsl_dma_chan_remove), the descriptor pool and channel resources
are freed without stopping the DMA hardware first.  An active transfer
could continue executing in the background, fetching descriptors or
writing data to physical memory pages that have already been freed.

Fix by calling dma_halt() in both paths before cleaning up, matching
the pattern already used in fsl_dma_device_terminate_all().

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
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

