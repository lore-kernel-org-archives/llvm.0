Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687453CE0AE
	for <llvm@lists.linux.dev>; Fri,  5 Jun 2026 22:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780696916; cv=none; b=EFU8NZHNjnhQ3+7TZcuVh/BSmA7PFZUughN0H/yvMGD6GsMyUJ7CLan7fLgi6s1WruKp2hJRVA19HDsbV1Hq4WD3CpSxVHeS1KFpiu1V60euxanJAxUbwBHIjOmZ7fsgTwF67JsHd/jniChmCjVb+HT4XlQ4cGZ+zZRIb8A6LkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780696916; c=relaxed/simple;
	bh=Bg1Ph+IpxoVLkz/WKf4vXKiBL9F/M23vAU1d0u4X7c4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pfL+7/6oCi0TQfsqHooKL2ZpW+Z1bNxz0b8T/7oI2izeGT2UN2etOEswBtf+7L00i/MhGNPoObJbUnPlutrgkqVV22BBd70CVsbSoDpYiimWU6m8XPe6AAsYLbnALy8KuxYrbXmkn/JGb4i4bujAGo72Du1BunYv78ohCZTaboQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YgUCL2Mk; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YgUCL2Mk"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84236f9b638so1129358b3a.2
        for <llvm@lists.linux.dev>; Fri, 05 Jun 2026 15:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780696915; x=1781301715; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3mpU00CFRN4T3ZBRPTrtzwzlNmgP77kODqdYKCW0Ak=;
        b=YgUCL2MkM+mEsMi2FlMuupiPK7WYwV0xIsfXhiEuXPbdI9U9p6Oy2TEoZnevl+UQZJ
         jVpagdDVhicrZxu2yXlTPxKuaPhyDxleae/lkmBrjKUK84whBAvvxq6rPtjrHGsvEaM+
         bEm6BZNo0B+TWuZr/AKnOaVqFIY/SjwQXBII6EA33VcQQIV0yUvkD08zB+HOy1cFhczo
         8qYSJyYvglgf+sZL986wPMyl2suClPBgOP8xuoTwXC+LgvqdMuFk7h9pQjRqH48RYa5n
         tnUdQh1Kv7lIoWMhz/0w8eLsNJrLm8shqv9ykmwHUhtg0DUf2QY3QRV7tB0zFJkEqqeQ
         b2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780696915; x=1781301715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W3mpU00CFRN4T3ZBRPTrtzwzlNmgP77kODqdYKCW0Ak=;
        b=QIEPO5ZJjdx7Pf5Ty7cumC28T0P04jVFhYm+nZAZ4tu6OIroH10NmfPRVLdm20BLGi
         yylFX+j1AeQiKSOFjreoGsOPvrYQfyJHnkeVx8GPG4tmMuMBRm/cl8QTUROSXaISo8g9
         4NWEob2ATP2tUvKq8YmdlNo2OgjMliFEG5v7cqCBUK0WEgpDvhzvKEqScqeEsPz20Z8c
         Axf0xCkea955baJ9LXd+z6U5nzI9LvQal8CjNLvILT2ybqYN8Bt1kKmcND25soz3XfV+
         oV/dQMeSqqCpBcEzbFtFfg+DTHelp1kMGJaBpEFi/Xitzs0ZVJxl+ixXUHcH8jrDyyyJ
         7oug==
X-Forwarded-Encrypted: i=1; AFNElJ8c5Ql8sY+xY1NF7PNkbJVKTJb5B4ynA+toZYWhVpkOKuBGmVCCLf42rRRvNPjgDBm1r828@lists.linux.dev
X-Gm-Message-State: AOJu0Yyh0XoiQhNLBwMfpsQAaNh63fgUlSLu2pvHv8HnzCc24v2pzl1f
	7ZxD8Uu34VTkpwy+x2qim5keMDJXKY0j6ucMxq5JPdaR1/I70zqHj1eJ
X-Gm-Gg: Acq92OGCdMJfi064nP4rCCy6BmFMUEiMCJuB5uqea0dJYSuLVHwBnTcz8IeHjuM4Rtm
	AlFw6d2WRQ+yNcbfX7vK19Le9PYNBaIyvAFm9GdlxCs6DJ0WWuWPN0T9n5820N24lxfqyNjHeTW
	TkNwbUxBE8NYnmEmGGpOwa6NxKiFIcv0E+NZeQlEbMlm38iIX39QlnTo/o/KfD2gR6bc7VrX18m
	LQinrEvh+IyqxKZteFAUNysbhsxPxOYUqDuzxYq1EF/iID0bbSb/Lsiu8vkI4VOqmxxWT/FYpqs
	VEuKoHrrZa4bux4sdDtOmEk+aRT385FlEfmTyVM69PVItlK6kkfUtep2yAVC7SRZYW/QAATf+Kk
	60XpVm2COXRyXQ9I+xYq72eMXipFbr2sQb3Wu9a079E92fuDUfxMBRsSul3d7oCV75HZ5nLj4g7
	2PvgPEeD9zqH2GWF2oDCBDXTMHzPSoi1tlSSZalWrj04vw1iMsiqIhZkpZe7kBg8ihljlU9zjps
	fmyVYW8syFFyRUXLRk6zNdU1w8FJGKMwH9dRkoRJhYAFQ==
X-Received: by 2002:a05:6a00:32c7:b0:842:422b:259f with SMTP id d2e1a72fcca58-842b0e30c6dmr5022742b3a.10.1780696914650;
        Fri, 05 Jun 2026 15:01:54 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842824a1cb4sm12518883b3a.26.2026.06.05.15.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:01:53 -0700 (PDT)
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
Subject: [PATCH 01/10] dmaengine: fsldma: kill tasklet before removing channel
Date: Fri,  5 Jun 2026 15:01:25 -0700
Message-ID: <20260605220134.43295-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605220134.43295-1-rosenp@gmail.com>
References: <20260605220134.43295-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tasklet_kill() in fsl_dma_chan_remove() to prevent a race
where the tasklet, scheduled by the IRQ handler, runs after
the channel has been torn down. With the recent devm conversions
the channel struct is no longer freed in the remove path, so
this is not a use-after-free crash fix, but rather correct
shutdown sequencing to avoid the tasklet operating on a
logically-removed channel.

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

