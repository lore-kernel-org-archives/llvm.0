Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23E73D1CAD
	for <llvm@lists.linux.dev>; Fri,  5 Jun 2026 22:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780696919; cv=none; b=u2F0dY8JA/dW0fCGfz7PwLG+ap8Z9bWNzmL51KtYUkLmMQuDPuNHMhtOoinp+vofAI152BbDuneIwLRSYEHrIcqqyVnsMf9wAcJ1LzVPETVSAwFGQcmlS1IVSSrKgjogSOFN2dw+7Nij9x0KMoIQsx4cUttv7kqMXY7WW6NiCIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780696919; c=relaxed/simple;
	bh=YUwtzio7DjFibcYHK1xR/I3InEukDqXu3lwj6BvlnHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b8pqAh7vooRfsRSeMQTGV/usgTpixj3ni08emdmL6OK0TErkoKZfpWzrW8p4uurgOTIIHSlke4iqC064LX1kNfTFeyU9sEEM40VvVCKcvZ5R9jAyJQmeLpBkd2XrPA1yVpyxkd+9X/mwNyNilFDKZ408HbwgJxD9CEGiBXC4mEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhak0+7d; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhak0+7d"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8423efad617so1359758b3a.0
        for <llvm@lists.linux.dev>; Fri, 05 Jun 2026 15:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780696918; x=1781301718; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFsQX2lLtec69DeOnNMYpEwpbYN8i05xT/hHGIXIjWY=;
        b=nhak0+7d3N2nqqoPnUFGgEUU1q2ddDx6MnkTqO0KBZDFJHPqP9Fsol7+KObgi9w8jd
         7/sdOSH6WE6s91oOsekibpPqPYauxjMUDRPA9jQAf4iM8cthONet1KOY0VziJOt1AlmK
         4IDshaycaiq57M9HRvqR2T8BIy30WEJrQ5mxjZg/UjHHXEy8aYOa0NaJAI1hcKws3KtA
         H4NjcdlGFJXJydl8Hr3yvyO2wMt3DbKJ9fMeLZnXE4Crb/6Wkn2oe3OKPzgu6zPGye7H
         pgByq7cpIB4NiyB86flZk/51SbOC5ewtrX1hyRDodMYfL9j8ajJQC/1ccGmFAnL9IvG5
         Godw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780696918; x=1781301718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sFsQX2lLtec69DeOnNMYpEwpbYN8i05xT/hHGIXIjWY=;
        b=IsTS5HHXSdPWQugpD9nG+MZShP8MLXOPfIfKyKquY/YNKWfsl8xQ/ne8w8pUNzbP2S
         Im3sz+3UZf5xR20zO7e6IHYRH4wkq4GN59KDHJmbaN90bvNqxK5Zup93OBih01+tvy7G
         ukmrC4u1CVvPY/bhOb7RMqMnBo2vMTn5U5z4qUPA2kzc7eE03+RgmSC9er81UBbUxg52
         IJhAjVy+yX0YisXR/LCOr6R/Ixw7GZdMq7Hf73avOYSY18wfNt1FH9A2j5xNysR8eJtk
         xcLi42RG1i7FAwz7RE5jvJUpFYW8wqYXhwv96RnL0a+tGxRpP/kfjUCZjlTFE/49//LA
         vuQA==
X-Forwarded-Encrypted: i=1; AFNElJ8+LlkvpcFJ0TTq6B6xGtAAKKYoJc5tKs90OeN0o5zTwxPinSIJ3mrFtaskbfmcoIuw1Z4W@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7kUBrQRMkJsX3GTT3T50BABftQSiPo1RRbIAo6L4mN2u08/+1
	iF1XNd/1zAlGzwTVeu7EydTIURqWy5iBX1799enetZ1eDsuAWXgIW8T7
X-Gm-Gg: Acq92OG2qU89g5H5PHjHjJr2bTsC9TBbJMYW1hB9AeONvSzGfIImJ5y4gZh5rgLSgWx
	AT69NRBm85NvaMtv4fUh6gvD4hxJbDzL7HbSAwGZnHMx4PFDHEAeDLcnKfgrEzSATML4ilnqiiZ
	9hZkGAaxN+hcEEdfnZ5vIP/oNAUmyRp82d26r1WQn4N9Jc8NKGzv1CG6iFgYBKHgco2i/V2pur8
	XL93CuBb7oKDTJCnWUv1keInLeOx4Y9UKucuafooJ+H5MRSi7uIJVV1/aqONdEQXmjRNw3N4gJO
	49e9tiX6OIYN6HQHRqhYbF84xTk7RMUbjAeFH/iPj5yzdufAseBjEKxNpeMMY4kRWQkP2bcwNiG
	H7/NEf5AYiow/RCL6fgUmv6d2avV8EEt5oOUEwCgqCeAuzT5F7pYZWr9s3CNU2OGKPf0n2G28em
	3D3s+z5j9RWoWw+verb4fekE8QPgvo98HhQqPHAmwY8w2Nyt83dB6XzOb8MwyvcqhCxpLJmGlXb
	8pCr3k3RB2miKdYnCIc5zWdAiTfoqbLrl7hWo7b50UgPQ==
X-Received: by 2002:a05:6a00:4510:b0:842:8500:95f1 with SMTP id d2e1a72fcca58-842b0fb6d77mr5329246b3a.40.1780696917721;
        Fri, 05 Jun 2026 15:01:57 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842824a1cb4sm12518883b3a.26.2026.06.05.15.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:01:57 -0700 (PDT)
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
Subject: [PATCH 03/10] dmaengine: fsldma: convert to platform_get_irq_optional()
Date: Fri,  5 Jun 2026 15:01:27 -0700
Message-ID: <20260605220134.43295-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605220134.43295-1-rosenp@gmail.com>
References: <20260605220134.43295-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace the per-controller irq_of_parse_and_map() call with
platform_get_irq_optional(). The controller IRQ is optional — when
absent (-ENXIO) the driver falls back to per-channel IRQs. Any other
error is treated as fatal. The corresponding irq_dispose_mapping()
calls in the probe error path and remove function are removed.

The per-channel IRQ mapping in fsl_dma_chan_probe() uses a child
device_node rather than the platform device's of_node, so it is not
converted here.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 89b88447be1b..0d28f8299bf8 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1206,7 +1206,6 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 static void fsl_dma_chan_remove(struct fsldma_chan *chan)
 {
 	tasklet_kill(&chan->tasklet);
-	irq_dispose_mapping(chan->irq);
 	list_del(&chan->common.device_node);
 	iounmap(chan->regs);
 	kfree(chan);
@@ -1239,7 +1238,14 @@ static int fsldma_of_probe(struct platform_device *op)
 	}
 
 	/* map the channel IRQ if it exists, but don't hookup the handler yet */
-	fdev->irq = irq_of_parse_and_map(op->dev.of_node, 0);
+	fdev->irq = platform_get_irq_optional(op, 0);
+	if (fdev->irq < 0) {
+		if (fdev->irq != -ENXIO) {
+			err = fdev->irq;
+			goto out_iounmap;
+		}
+		fdev->irq = 0;
+	}
 
 	dma_cap_set(DMA_MEMCPY, fdev->common.cap_mask);
 	dma_cap_set(DMA_SLAVE, fdev->common.cap_mask);
@@ -1305,7 +1311,7 @@ static int fsldma_of_probe(struct platform_device *op)
 		if (fdev->chan[i])
 			fsl_dma_chan_remove(fdev->chan[i]);
 	}
-	irq_dispose_mapping(fdev->irq);
+out_iounmap:
 	iounmap(fdev->regs);
 out_free:
 	kfree(fdev);
@@ -1327,7 +1333,6 @@ static void fsldma_of_remove(struct platform_device *op)
 		if (fdev->chan[i])
 			fsl_dma_chan_remove(fdev->chan[i]);
 	}
-	irq_dispose_mapping(fdev->irq);
 
 	iounmap(fdev->regs);
 	kfree(fdev);
-- 
2.54.0

