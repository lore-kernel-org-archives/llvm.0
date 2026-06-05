Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A303DA7EC
	for <llvm@lists.linux.dev>; Fri,  5 Jun 2026 22:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780696928; cv=none; b=lMxCD4ngmItcpRtI7GAZxl+4WRqo5qu6QMIvfe0DqgX2RIn4xHA8WiAWdmty9wfqHa2wDLlMStEkaksphOBdndAaC7ujEVC3M3iLVJSXzVoU1A+W+wNHPj2LxVs86GlrM6AXdQU7/xaxZxT73qB2QQ/5n+J8SAPYPgsiiLeGj94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780696928; c=relaxed/simple;
	bh=jRckM7Q/DiYZgoe/UjgP6+oEblX3ejArkHyi4yqjIho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EdF+yvO9BXpcbid0nqPo7xRSTO57KvFN3WsJUUX9UWdtuyRXJFlqaoZSZfVyUbFXbPIvLbpjRkfulrh1mNL51Q55lY03M7aU09OnknGMvZXQzPRjjrwdcTyxooIw9Gc+JZlFAoMvm8b/f2M0u6aK5x363G8807+zCkaSGPi9qoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N7xEzFqz; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N7xEzFqz"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84236f9b638so1129422b3a.2
        for <llvm@lists.linux.dev>; Fri, 05 Jun 2026 15:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780696927; x=1781301727; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDWu5/hG//ENwpueDa3x2k+unyGwqq6tLB7KN2pYPhY=;
        b=N7xEzFqzgiUjx/NuZqp+oERGb1qvSeN2k73vmP7yqPAM8VViNNONjz933jWXUIM+UI
         7aGfwGO/9/QJaT4lonMZDyuopnwDDtkvzv9uvQRrp2Bk5pksS7hhsrltsu2pG3tUpGFo
         Q2olvUJ3Wfv+EIYqsrko3Vr6z3Z60IlW16XDeBkDNhUCqpUp0tmSTkaUxjPCx2CS47lV
         LcZTpTaFVRCp8S7wcXngFcP/OhjmGMIbSEnfq9mqenGi03kLqcKpjPReFp29wsQt4C8n
         o2k6LDlo+McMRm2xZlyzwD/Lt9d4d9/8Zlqy/9GfBrsFY+FriTLzWmUcz4ZsVbWfMNNs
         j7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780696927; x=1781301727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KDWu5/hG//ENwpueDa3x2k+unyGwqq6tLB7KN2pYPhY=;
        b=S0/JmMuU9NKghymSbnRwYskhxbe9+LHuBFanjJ98UYoZTNhmya+Ko+6UhxmZIhMbeY
         ATI0zq0L5bXCzZMuzRpGdu3KRMBohwmHn17uvvYX/KCt2W7hyn01CwstNzAJ1QK1Gd9F
         YEvBbvY7bAJAO+DZZ+QNapy1ZLbn7Vk49A/ec8zq/BXuUYopAu2PdDa6ZwyI73tnlCAG
         jmek0lqZ8l5JCZhdMHqcpUCyLziyk3cUT/c8pnaifwssIMKVAoWV529GUO3fFG+TZAu+
         5crsTNK9SAKkNmppk4vZcoWeocYKRfFL9xvxz7QLyJkbAnYSRMX3GsxPjsMZrx9+VlMv
         irkg==
X-Forwarded-Encrypted: i=1; AFNElJ+7DKiTv2rcnOhlcChxwbP2eVckxDkgEJieQv6NjG/SIHUtCjnHHWkOpcxGxnSLzUyhtEYe@lists.linux.dev
X-Gm-Message-State: AOJu0YzCXBMtCZN4FnJYUlPQikdBBdurlYkLkufrGJJ22WvFH9WJCp41
	dbDT4N/V0prC94YjT63WrrT6zRt7YKQL3h2fBxhcVwUdi/ZcInlnob/N
X-Gm-Gg: Acq92OF5bzdHJMyYN8XOPscRg/Ojkkg0ri/+8y2YsIRqCQqvq7yb5D1jbQ24ofS5rKh
	JTL2KaNE/0atjefq9uiF7M8acREuSv5YX8CKrNMqWDtLT0vhh7OPMWeRZbO0pPrc0H44v3pjN/+
	cg36n/HnwZ6bpfrmMQ7fxwKVQWBaB5X8x308CxmR4pYjKiTUhlJCzYpI9DDbZnu09HVsXraThP5
	6rrS2NL5/NDSoIuGEtGfw6lyutfEs52iRX9MNhXEYd2ZfdNCv+CQSG5jQBtNMJREwDWfetefCeP
	m0C4it8rQrL8aGq9gDULWE5NKrflfdBSAEyc7REDQA4ySKBTuJmBPuAf3xaKroFn69JP3jhBN/D
	qWlPcDMKRgdZBkKw8jEeb2NqW7sDLMhr3KaDFHw/rse6/C4lCA9M73nOTzG4+JSD8abwbzahv66
	2aZMn3/RIw0gQ69iGiodcNgDPultl46/QrOWkhzSb+yRKpZKVhWzM5/7Ku0CxkL7t4y65MwPo89
	mFpHOt9jw5Noadss5JbE2w9MXSpFrr3/Tzdy7zLY3Q8wQ==
X-Received: by 2002:a05:6a00:bc81:b0:842:2ae0:968d with SMTP id d2e1a72fcca58-842b0f6f508mr5278874b3a.32.1780696926573;
        Fri, 05 Jun 2026 15:02:06 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842824a1cb4sm12518883b3a.26.2026.06.05.15.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:02:05 -0700 (PDT)
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
Subject: [PATCH 08/10] dmaengine: fsldma: replace irq_of_parse_and_map with of_irq_get
Date: Fri,  5 Jun 2026 15:01:32 -0700
Message-ID: <20260605220134.43295-9-rosenp@gmail.com>
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

Use of_irq_get which returns a negative error code on failure
instead of silently returning 0. Update the IRQ validation checks
in fsldma_request_irqs from !chan->irq to chan->irq <= 0 to handle
both 0 and negative error returns correctly.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 0d73ce3dbfe6..79a268139b9f 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1067,7 +1067,7 @@ static int fsldma_request_irqs(struct fsldma_device *fdev)
 		if (!chan)
 			continue;
 
-		if (!chan->irq) {
+		if (chan->irq <= 0) {
 			chan_err(chan, "interrupts property missing in device tree\n");
 			ret = -ENODEV;
 			goto out_unwind;
@@ -1090,7 +1090,7 @@ static int fsldma_request_irqs(struct fsldma_device *fdev)
 		if (!chan)
 			continue;
 
-		if (!chan->irq)
+		if (chan->irq <= 0)
 			continue;
 
 		free_irq(chan->irq, chan);
@@ -1180,7 +1180,7 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 	dma_cookie_init(&chan->common);
 
 	/* find the IRQ line, if it exists in the device tree */
-	chan->irq = irq_of_parse_and_map(node, 0);
+	chan->irq = of_irq_get(node, 0);
 
 	/* Add the channel to DMA device channel list */
 	list_add_tail(&chan->common.device_node, &fdev->common.channels);
-- 
2.54.0

