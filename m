Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CA833BBBD
	for <llvm@lists.linux.dev>; Thu, 11 Jun 2026 03:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781149998; cv=none; b=tJhOZshVuNM/WFnhrd/gsxEXida09MRfUoq1bqABw7qUhKufflFpPUaJTgZ9rD+9yAHqQm6jAaRr5bOyztGHGnASk9nTCboUGGEfrUeKYoPcQXpfnTm7gD8ivMvr1eDCxep0OdBK+0JFuSaWa+II1CTXu0z4zz+bBO3bD1qTUeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781149998; c=relaxed/simple;
	bh=QNstBAc1L91v28F1oF1V1UBDhakUFuGDQ4mwwDQaYVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=flh5iyHeKCi3GLYNLnbCmq4solJg54b54SjrbQw4D3zj1ceSlK0+3+OUfwCiac6qAzOzOpjc2XiUB2SRZktTeLWUgZZWTIB3qZHV6rzhaCyIEzhgXru4xZ3oj+ktywHVR9/Qmy0LLpoqY9voSSnCMbErrrjTIAsTi+YNnkrDaRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ov3M4PzH; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ov3M4PzH"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36bcbd7821fso3346910a91.2
        for <llvm@lists.linux.dev>; Wed, 10 Jun 2026 20:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781149994; x=1781754794; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tT9xKJ0Z4ILZqTxJ8ZpiwY1jbcqBK/pYbLAZ3NF4IQ=;
        b=Ov3M4PzHvC/8cKUkhI8nMLnC0BBjaokS1Kvw8VP/R1Vi3DC6YZTTvuRa9UBWpcR885
         UyhinfEI57hdQsffdA7D9rx+GHYT8h10d+pJzS1u9VqVJQnmCBmM42gQXUUPeW7VjyOE
         TJ4g/Yyh+fthMttSERXSEnx3OTCIr9v//ekzE17bpRQzqtnXh6lepE7FbnFaq1oNImVF
         WKryZmd7D5dspGQEeOrV6eVYRIik7ejKckvhbPT6WgW2nkg23Y3bXVriyaghD/RiIkK/
         Rb39pxqAur6nkuoWsy73hkK+7eGZZPdEaKetirbA//9sXJ4yCcCCxTosm1B9uZF50F9c
         8wSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781149994; x=1781754794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1tT9xKJ0Z4ILZqTxJ8ZpiwY1jbcqBK/pYbLAZ3NF4IQ=;
        b=TR5G8qw65gQfcBanee6LTpAh9+zchVUslPUTXickd6/wu7dnq48V64lMBadoRcaQz3
         wPYq6eGhWUqQMFzPtzGGJc8/pHaP/s3onaxpi/F5FMQ9sbE+7wYdXsao6ImdDNvf/ftF
         o8CwBysMAGlgJTQxEzpZOKUXalYSgzLbCUfmvE+l7qaZApfdqjLGPgN7uU0L6IlD6ND+
         ydzUCl4aN6nao+lNiZNF8/xNoxRYFtyYtEH182TKM5YI2HJ5KJuv5Ng0m6PkgbTAssoN
         PlqD/3x/2xg+x6kSvTAZtyTfVa60Fr7gHvVdizpXIhJx//DbWjMrQxhIpWgRdW2T06Hh
         andg==
X-Forwarded-Encrypted: i=1; AFNElJ9JPAG8GjDwaVUhGsF7Dca8eOnq0+U/gpzkD6jecomePwDrC8vqSn0nzMtaNdzYXgYqjV72@lists.linux.dev
X-Gm-Message-State: AOJu0Yxf65QBxYnw47oH6MJbjjK/fgTy9Qdj1M3Wa4qkW1Nvo7I5n2X2
	s3fJf/0SAy3O1cljY1BiX4jQ7A5JU9TV+xnH7dbHduqfQ3kJkTOp3uVS
X-Gm-Gg: Acq92OGjHwWk+8a7DSUKpU1cgO1rbxk4sFRjuZlx7GbEOE45X15sy2qTSdkrmabWqIo
	71d6uqSDnfDQz67EPVaKs+P/Ld6fzWn/dT++EYiKCCbPQM5mPveBouvlsDwZKvSHxBlFhxuah/L
	mgoRH0lSlJKgWD49OGPPcNfB8jt0rQyfJhiARSC83HevaE8MCYldXnXmTbwo2ICIxZjyW4A7No0
	1GGp0qYkw/t+z0FSTTDsEuCFpR3QHd2g2wMpYCIVGX8HoBMpNNT+4go5uDhjwbZobR4C+VmVPNB
	YQBH072C/FfG4tTsoF2/GjoN/lJUdfwEDfmpapR8v52BS+IUO6HxneXqM00ATyezj8GS2VKUfpI
	fvCDXwT04P9VdM8Ie36mWROw18ksP7+WPz3FFizpwMF5g/KOaFDUkLuiUB1ItTxSCzHiJtq2zva
	2dZ6Y19n7spWq3VcnHtgLXXhIG/mhvZ0u96/9TFE+wh9RU2/ZEwyhAlVhOrNuZYjFRUdbYUXZra
	WJaojo1ovHFmNYzSU2RafMtIRkbnnZidPbAdF25+ndnfA==
X-Received: by 2002:a17:90b:4d84:b0:367:b819:2214 with SMTP id 98e67ed59e1d1-377a4ab6f54mr1274422a91.13.1781149993882;
        Wed, 10 Jun 2026 20:53:13 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-377522a188asm910131a91.3.2026.06.10.20.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:53:13 -0700 (PDT)
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
Subject: [PATCHv4 07/15] dmaengine: fsldma: fix request_irqs unwind freeing unregistered IRQ
Date: Wed, 10 Jun 2026 20:52:37 -0700
Message-ID: <20260611035245.13439-8-rosenp@gmail.com>
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

When fsldma_request_irqs() fails on a per-channel IRQ, the unwind
loop starts at the current index i, which calls free_irq() on the
IRQ that request_irq() just failed to register.  Decrement i before
the loop to skip the failed channel.

Bug introduced by commit 586f54672b33 ("dmaengine: fsldma: convert
to platform_get_irq_optional()").

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 4475d50a94f5..c04a7fbd2ed0 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1088,7 +1088,7 @@ static int fsldma_request_irqs(struct fsldma_device *fdev)
 	return 0;
 
 out_unwind:
-	for (/* none */; i >= 0; i--) {
+	for (i--; i >= 0; i--) {
 		chan = fdev->chan[i];
 		if (!chan)
 			continue;
-- 
2.54.0

