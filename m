Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8739337D133
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 22:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043589; cv=none; b=uyCtIapGsDwJWmu+9xvWh3ti+JIkbISFxAUwOom6vwOckwaxwv2cz4S/20X8CXybm7w0HOOnFJQXckqMmzjaHvKY/vEKBQX9R8dW+Ru/MWBEumxr38za64UreTSJERuxBYjOuxImGbTnUvZqBUk89AJq/PfhZ27jwCnSxuDMWd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043589; c=relaxed/simple;
	bh=OOgwhv43ry+5h77HNuIbZvCTH1xVVupSRztczl681xs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aWEjzE3D0tU4xSyoUv3ylbH9KJcJ9+6O63xUJ8fMh7i9xfFwf3Yas/ruqX1InYthzQjloaYYeQMZ1/6N2hL8N+EiMsS/MD0ZvVkwgcTN2KMODw8+iIbVUPXIpz7wOLkdsg3Oh7IbS4Ue39iYl+O7KB1kWgQIP0LdihHuo2XBtTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rHu2Tmy8; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rHu2Tmy8"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36d630c0e35so6607770a91.3
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 15:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043588; x=1781648388; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VabrJGQKyMUS5+LwCSzuBvRxZba7atk/VeVHPvy/VCE=;
        b=rHu2Tmy8nSlFOCVLI5QONwafDpMDK9tIPpTqgsowfVa66cM4Y7cwB7fkUJvBsF6AaT
         QUobuPIFHcpFZU9ZKtHO/9squzOV2jKIgY1ySjOkLrm6A9BJOWhUb8+7uT9MMTiqUDct
         QnBVKKXqYfCDbF/AHoA2vSLfi6O7FxNfbyZx/qdW9PSWQxIT8Z00t3ME0pUY3XaDzsNg
         2sv+bGKgLDIxPhEfFsfJ1qdjAEAq5vdizRE9+uBGBupVzUq7X+3hmQVeBzNZK9o7I1pr
         86zjCG0vx8BsTixcnUTyzG4LztUVX7cmeRp9G+kD/T34azU+Kh6x5RKDyCOEEjiNc5xK
         TjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043588; x=1781648388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VabrJGQKyMUS5+LwCSzuBvRxZba7atk/VeVHPvy/VCE=;
        b=VpwF2BY6fLqzTLcT42UI3G6p4qHR5ka/cocPgRbXjwmYxY/JOEWkO3BC8qzGdVPOeb
         JcVj/zSUaD3iiqdgv2j6twOayJKJ1IeALIhJdYj0Ia8JyTHvWWroAuf2rG7+Buf2g5gb
         JXlVOXww9efOm8h9/10c45AyP2FLmErPfb7jYscI/vnYDymSkJNjpoYQptbZMqNshkQU
         7W3jxsWI5PkO/7+AzFmg4BfHVyVvV+k+54I1a0zWHHLlDuS2J9BACy5VAWxeJlSNpl32
         4C9NnjLsYaLM+Bil6uYgIjh2ISEEyIryR4SRuL3ykNnnHS5DzdeWfrs31GBQxhz63ZMk
         xyGw==
X-Forwarded-Encrypted: i=1; AFNElJ/CyL96qihtnJdhC2+kPZBR1We/UmvTR15YfDzsrnY4Gnb0ysl0BXs+Sk8WCH87hKzOgM3K@lists.linux.dev
X-Gm-Message-State: AOJu0YyavI2VpEwu4siQy9a/7BKUgdSqfGzHHPrG50Eie/rQhk/l4lzh
	zG5YZheWTVs9y/TqedDRPEDLMuMMrXt8Ww3mAapnUrFTCcqjl2jtlHSP
X-Gm-Gg: Acq92OFn/zwELFLJCGLWHwRtm12I2Rj8tAW7cAtji1M5xwTBxF3tYGxm8xwPXTXYkoF
	L9UZFZWIdmS75qGIadB+tB11KMZS9JQkursyy9f2RL5RxVWn8Y+W84s88/MXOz7//P4rBuOlrDO
	ANbfcmY1PZ8IlaKcYkBXCU+RNq1i3ljmxWHq689so+yt+DcGTPuti0HOPySUN5coher68Dorpdo
	68Wt/Wx16I0LGx3ZjMaFQsAlnCWkYHOLhwRhJLZkEKo3umoLs4E4O+YKhqtSLVdpxF/HWEizk/h
	1nD6h9kg8V0JSySzShM6g5cza+c8mCm3r6HztnbCYPfpMblpo7P40m1VVXbDJkugslGK24qps1E
	FDqrmfwGyrsqWtMhxSm4pchrPf3b52iKyM6dM049Fq5uptMrpn1ICC7BY3lBE0koOBYWyY9SvrC
	BX3jZEMcoNxrcpzmJNH3FD++Vy3tOyYHLdo13zrX76iBB0/j5Ri97ny9AB4K8PfyfN4c+ilvus8
	H0hJRIkTrVYc+29OrJNJz2O/u/x+tB/UUIypnxWhbyk8Q==
X-Received: by 2002:a05:6a21:a07:b0:3b4:85db:1bdb with SMTP id adf61e73a8af0-3b4cd0801bfmr27114883637.44.1781043587709;
        Tue, 09 Jun 2026 15:19:47 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm19661834a12.14.2026.06.09.15.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:19:46 -0700 (PDT)
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
Subject: [PATCHv3 01/15] dmaengine: fsldma: kill tasklet before removing channel
Date: Tue,  9 Jun 2026 15:19:12 -0700
Message-ID: <20260609221926.35538-2-rosenp@gmail.com>
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

Add tasklet_kill() in fsl_dma_chan_remove() to prevent a race
where the tasklet, scheduled by the IRQ handler, runs after
the channel has been freed.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
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

