Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BC3480DEC
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 22:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043612; cv=none; b=oueJrKqfI+qP7+AVpALpbEdGflQZWQ6cRkI1diyc9itgF4k6Dik7OwqGmHOCACRYgEFh1t3ZjU7JfNWIGKlTVkBA/P5nkR/Z7tavLp0cBf02cbgfCzgmx0r41M9ENUu8N49k9pSt8/9vPafkxajfbJEMrkMzCrOL1ISMzDFVkys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043612; c=relaxed/simple;
	bh=xaWrr2fdsZgTd0OCkKwIZ+Wux7+r+wiMWqymMs4IDvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DWCbEjw8DIXWWpOs9TgmNcnE8JLB7sUV6TxoSYLVbqm2SKvYxizQ/bFtqS4I5+xRgYB1oFQKYWe8mryfeJ1rKPfm5EshY77XdfXp6BIn0UwOqb0ijFQYQot53xrnCWxQFnPspA9UoR6gJiydfi+9ODMlmESrcjv220Iyys+T1Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3yQsycr; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3yQsycr"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c85822059d8so3799360a12.1
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 15:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043611; x=1781648411; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpnKWjXftKVnMmEr+XvL/qwRK2/ShAzH1rSpA9h79n8=;
        b=J3yQsycrV1MaSiHMBWD7vpV1CrjDSJ4y9baCaiUmBuVdbjy7oZRTHChGu1SX/n7RtR
         aa73hT3xR4ypN2LzpUGe4uvWCnLkAVOPp0vOwo3pr/ORKn9F7vaXCJn3Nk57S4LhAPt5
         4+iD3OAlgsgxjX3rtBOgfk4S3CKBOTyjV91lFLIse9ytqHTH6bwHpEOCZwVEZtZitkX/
         3uMkx7E6KUYxoLiNEDz9wZxbkrrQGFvtg+DyR+JnQZwCyQ5vFF5zbzwYibnNg4LvUjlo
         w/JnQizdkJkjfsaVkzlJQD+pmVAOUD1NcHLCx3aXlNqS5R5S6OnhE4Bn+rs+GDrb9LQ5
         dWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043611; x=1781648411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SpnKWjXftKVnMmEr+XvL/qwRK2/ShAzH1rSpA9h79n8=;
        b=A0iprkXkToi87mM5mS4uD10+11NGAXoI5IdJipcNN8DzKkw7qiWEIzQNejPpYqMaGR
         m9PDKbOccSTEKDxLiH6ko2dns9lmkWGtps+VcBbISWBko8ilZVPsraVqLNADkGUhrKgQ
         1z/FczIO4MyCrsfJQVSBQQmfUtyaA3mOdmOTv5415dFhDo8nY+IZQPgjwNbqSye/glPp
         trvhBqiUKEZj2IxePoEQGGX9SCDW4fCHFSY4xgsUN/wdcYWC8Dp3heBD/3B+Fa+L2zTI
         pInxvpZKyQw3Zn0VK8zk219/Sbr15T2kC02Tdy3My6O+64z4CQGKNimuxvsfmWjKpOBN
         QSbA==
X-Forwarded-Encrypted: i=1; AFNElJ9GpjGTG0msAOIu1m7jBu0Cc1A1i/8cj7yuXKZEAF7VqjgqFM7wEgMr6paFzMASuhSDfH9o@lists.linux.dev
X-Gm-Message-State: AOJu0YywuwkyphXR7mSihcvlEtXDBX3pqcM6dT5hV4pr/wIRhiw6nxzx
	axnu/Swpf4wuX6A6x29St2peUBUXl/ugY8IZvGwjZIKurnlKuK1iUj1E
X-Gm-Gg: Acq92OE4g7R6o0/1EBLclcvSe9Ghz7Mt6xnBRx8MAWRNw7A7vSuZ/Ulp3KkUMB4eeOf
	XecYuSMjqVaC24Btmjwcmq/1vAuOjjag0aTVZDDMi7qpzdh5TBOpWzluGNeRJ0gHCyOgRcbqVdw
	Tp7kxmRGIMFX+Lnwjv6lcTQznupXJ3G0W1ZuPHSuJ8+ojVafWHtxL9Nj8cEXT5lDBhjW9YnH4tU
	YBq+eYwZQpMJUD24mTbYIxYXVXBed6rgHHVdTQVBUR5pLGAz8GuP3PqDimclSPvl73SWhNGCJBp
	5JVQe4MLNuo6YEBJU+HYbtkNli2YJBezBexd1fRNKxM7XN8bEeoKh/DaYP8CFZWBmit0/q4jsN4
	efxj7Aq7TRt47GKMOaMcgHY5DdqoRble02tA88OpB+ZcSEziRncqmyMFKaqmlk5UqvSUDziwYTe
	y1k8HHj3HZS6Y2JppUtM9k5f3MjcKrDzlBlWa0f9daryM02Qc0qZhBq+vYYuulqY5ryTx8m4lAQ
	SqMfdjVMYCkrGcM9eBT2X0zXNkYFdwpqO36iCuinlJU5Q==
X-Received: by 2002:a05:6a21:62c8:b0:3b4:93b9:2b91 with SMTP id adf61e73a8af0-3b4ccd45993mr24628603637.12.1781043610661;
        Tue, 09 Jun 2026 15:20:10 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm19661834a12.14.2026.06.09.15.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:20:10 -0700 (PDT)
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
Subject: [PATCHv3 13/15] dmaengine: fsldma: replace irq_of_parse_and_map with of_irq_get
Date: Tue,  9 Jun 2026 15:19:24 -0700
Message-ID: <20260609221926.35538-14-rosenp@gmail.com>
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
index a3792864f02a..7d0c80121aa4 100644
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
@@ -1181,7 +1187,7 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 	dma_cookie_init(&chan->common);
 
 	/* find the IRQ line, if it exists in the device tree */
-	chan->irq = irq_of_parse_and_map(node, 0);
+	chan->irq = of_irq_get(node, 0);
 
 	/* Add the channel to DMA device channel list */
 	list_add_tail(&chan->common.device_node, &fdev->common.channels);
-- 
2.54.0

