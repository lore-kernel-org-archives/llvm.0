Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2D333031C
	for <llvm@lists.linux.dev>; Thu, 11 Jun 2026 03:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781150008; cv=none; b=uXDmjr6PPrjj237mhNCmLoSCyrerUDWHCi+A+D3RJ5V218i1mXY5Z8C6TtJWHTph81QPSZ1xWVLYF73rTHGK8DRNRTm+s6u14pV/yhwpMr1lcM+sbHiY+5eUAIGU2GnNwAjkp0eKbO+/0Ffq56QwxaWLobf6uH1H6F3XcsxTeHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781150008; c=relaxed/simple;
	bh=d1dwl51R0SVH7jP5sjbK9oDfm/F9UhJ8pLa3jSft4To=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t9qnIzehHigTikjx5vS0Eec3QMC7O1rls4F7HwUpffGb8x6/jSMe0382zwd/Vs7ufuhn5oSW90r715xhz+LGwhUf6pVAs6iqfgu2Xr4rG+8nyXtFpYA0PzIMb7tJmisXQXmFLVj1Ef1KHMcPQT7JFxWfSM6MQ7nTc5NPzoIoQPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MtPozxJ9; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MtPozxJ9"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36d5b11201aso4816700a91.2
        for <llvm@lists.linux.dev>; Wed, 10 Jun 2026 20:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781150003; x=1781754803; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sSyqeaLlyNKBtKqq9I2lY6bL8Oe5QRX1qiD3SyWg9M8=;
        b=MtPozxJ9E5/qpo9jzgUYDyJkzxG4HEWHbwugEE/tb/1FMCsVzi0ppZ8/u59rvw21JF
         5IdZ/djz73LWAyxBM7rQmFMYJpLf/HxKFFmTy8zdBmtBOz0gR/ZQTrr9K2fBvwkLBIDF
         AGz/iT+wWnjXg6bD/JFzFKurVJw/Ctm8eeIW7qaNzVwY+lkp1/IJw9pQfGApyirccYLd
         YlVRMcK9Xg8c9f8i4TRIMP0n/TgRRtm6QRWNF1mWBm9E0fwGMaMhY0IdYpK0lG9LES7I
         YDlsgfkHhtjY9zlUnClRm1Brp7En83uU4L7fe1ehWHStu12qTmKY7gDZhs0Hl31nN8OE
         HfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781150003; x=1781754803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sSyqeaLlyNKBtKqq9I2lY6bL8Oe5QRX1qiD3SyWg9M8=;
        b=q6mekr04lpOeIlOTdmEetPB8QB98g1wvzGRSQhBWiIQ2I0zsOB8NmV4oP/9vr4b9Sa
         e6QuarQDoSwxVwi+numqzcciftvTnd/qmW9J1aKIIdNsEEuH6gOzCunLsLtMUM5/MSlS
         uIjFtjTZ3Q/rORqXlqE5GVg07aHrzedBm6njTmssDMs80eASvQyxB7QaqqvO0z37UjX6
         T4XhydZBoal12kcSeHMuLTTNUFftiEH1mkb/170w2pAuFqa/42yQw0vNvnHnUX9TfJ8o
         u78/uubeJptHkJvQr89fsz8TmyW0Cb6DXYtmexOorXMaECr8EfQOglYIxZZIib0ZxLgP
         OdLg==
X-Forwarded-Encrypted: i=1; AFNElJ/Ap23BX+bqDjPSoiBV61wp/UCGCUtMAfm7pV/ICoGWIkVo1t22Q+p6l+Gj9qL8z4jIsanO@lists.linux.dev
X-Gm-Message-State: AOJu0YwhkJVQ+MhI+lRW7TihqVuXXrHDzPINUcFq3DKGsUg2cEtcWron
	jIawIKQpNn4GorOzbt87zjWNOvytST+XFZlhUDKQOlF2yh8TCcFj5UtS
X-Gm-Gg: Acq92OG7lfOvny1lcD4OglrXw3SJayRx4/9WkMOvESbo/NqLG/HC+HePWisYPFWjFU8
	cf/W/hX+0cXgUEh0RqPvApo7N6QYu9RTvkXv8NJByBLULJgl8oitsR39TMCl8B6GioYH+y2JBMo
	R6UzvqnV6lp7JJvnvUFsR1v76PrIRMTaEBx+tjvqUEHfcmdbjpzpzGz2Lbgfq72VYU24/CXfTcy
	a5xMgU+jZHFBdak18bFRzXxCEyFVsj9I7WKZ1l1tu3TuRAr/AiP/TTh416uN3dB3ADFC14sosg+
	voP66DfYiYYyGi2JXU1SE95telc1rdTfW4iMW0/TcVOeshkhjbpo5JuCpxgk54npG+2GO3KH0yE
	NCnzwbOWJQRH0rDB/e55mQ7LFk8oHBMja8up8nEItn0jelGYN/G7OFmgtWGqLgycvNr1XHC9GHi
	MzcW1WYSXkpJ544yyO5jpd8RgfW/kt8yIODDqnierMUViQ/1MM6GASVMxZMGZbK4zFiGqtlDtR/
	79j06VDSYsPaK96DlXoCvZZ0QMat1ss0weZfvuY6d4hOw==
X-Received: by 2002:a17:90b:4acb:b0:368:7c0f:ebf7 with SMTP id 98e67ed59e1d1-377a73e2750mr1300085a91.16.1781150002966;
        Wed, 10 Jun 2026 20:53:22 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-377522a188asm910131a91.3.2026.06.10.20.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:53:22 -0700 (PDT)
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
Subject: [PATCHv4 13/15] dmaengine: fsldma: replace irq_of_parse_and_map with of_irq_get
Date: Wed, 10 Jun 2026 20:52:43 -0700
Message-ID: <20260611035245.13439-14-rosenp@gmail.com>
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

Use of_irq_get() which returns a negative error code on failure
instead of silently returning 0. Split the IRQ validation check
in fsldma_request_irqs to handle three cases:

  - chan->irq < 0: propagate the error (e.g. -EPROBE_DEFER)
  - chan->irq == 0: IRQ not found, return -ENODEV
  - chan->irq > 0: valid IRQ, proceed

The fsldma_free_irqs() function's !chan->irq check is unchanged
since both 0 and negative values mean no IRQ to free.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index dc70a6bf5723..0ee3d719ae95 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1070,6 +1070,12 @@ static int fsldma_request_irqs(struct fsldma_device *fdev)
 		if (!chan)
 			continue;
 
+		if (chan->irq < 0) {
+			if (chan->irq != -EPROBE_DEFER)
+				chan_err(chan, "interrupts property missing in device tree\n");
+			ret = chan->irq;
+			goto out_unwind;
+		}
 		if (!chan->irq) {
 			chan_err(chan, "interrupts property missing in device tree\n");
 			ret = -ENODEV;
@@ -1093,7 +1099,7 @@ static int fsldma_request_irqs(struct fsldma_device *fdev)
 		if (!chan)
 			continue;
 
-		if (!chan->irq)
+		if (chan->irq <= 0)
 			continue;
 
 		free_irq(chan->irq, chan);
@@ -1178,7 +1184,7 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 	dma_cookie_init(&chan->common);
 
 	/* find the IRQ line, if it exists in the device tree */
-	chan->irq = irq_of_parse_and_map(node, 0);
+	chan->irq = of_irq_get(node, 0);
 
 	/* Add the channel to DMA device channel list */
 	list_add_tail(&chan->common.device_node, &fdev->common.channels);
-- 
2.54.0

