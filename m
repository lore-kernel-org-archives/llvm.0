Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6954BC02C
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 22:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043603; cv=none; b=C6rZ4EFw5LuX9Hs/O9GmDOZnJ+8zSIIFdPAAhfIhLywRi2FBTyGveQusfd6xCGZntU5+8KB5qpTBnV1cklNzedui6dm+7fidZrYJLlslSeMNjR3hSKZhnirJ914asMOeuVktvbbDSnOCd6c8F5kypFbF6b8kC3XHtQNSrtAGag8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043603; c=relaxed/simple;
	bh=Q/PgZrUxr7JJJLlNJf1HKxpgmT9Z+J8tRDHEovzB8l0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZcJV2Oyv/15g2q9/v5CLONHXDssZ4o11x0ZqOEEPwWL8Vv2tNo+Y3voS7mXsALpo0IJctY1gHAjS2oL5zBdqmvNWZKCVNQPrWpNJKtUIkzpe0izfLxYYDQT6q5qf2PwASL+6ZxYdjBzZE2Ywl50VIWq/s3Hy3bGofNJgpCxoDHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSZnBJRY; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSZnBJRY"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c858b392697so2922792a12.3
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 15:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043598; x=1781648398; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHDaxjKNRdlH2zlMKhtRadxGEkWWwDYddu/hmn7v0eI=;
        b=VSZnBJRYydcRPuViX2kWeNdGMFeS3+0V/I3jhRG+Pz4Js0BsIsor2INYj+pXxLchv9
         I349Po5lDT/OcSDG9mHBf7IfhGIYNrDkzpNvfX3Wtdie5KcmFZenZYHkqGqjrtnq+NBu
         ANYUm12TUqcIGQrVSEfW0VP9jpJb0ZJIXrV06GyWv8icVRNCzak9gUIihgw6a7TNayDf
         agE5Ym1ijL9VV6yqIk/k6M3sQnlKRNBtRhPleoOatbu+z+8VjBvrLjpwbfwRPbF473MW
         c730vsWs1tIGM8FXT2LRHcWPxOPXSB4EL3H0KgPOcZDZ/dJQPkcqU9jwqWeiW7jvxYKu
         df7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043598; x=1781648398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EHDaxjKNRdlH2zlMKhtRadxGEkWWwDYddu/hmn7v0eI=;
        b=SLm8G731jlMAhrCcRaAtnSWy2SuaxnMXN1mNqueqhUyx7qpsvwEtm2bj/4N2UIJlnW
         gnc22qQoTAmxsjgfszRYWQn7ghfQnCg0ueH1GUIqyAUeLq+aDIx8wD5NZQrHguzWxAtG
         pe9CP5FAHr2OhlBNfeeif240ywiNiU5cN3Lw/68snfYXCKp4a7B+/0BN/PCCbVUM3NB4
         ulb0rv/LyCoSi2nLAhzL9CWhzHdbkHTqP41nNeY+gE62Xn/UcmhZeqDHtUoJj0HkAlYv
         e1QmK3BJI+i6GEVAUnK9Fu7xOJqcQT7o3hinaVNyXRKbDHj8Z4vOeHK2trImveRYGRmR
         Og9w==
X-Forwarded-Encrypted: i=1; AFNElJ/pdt70MtqqjVQkqjQg4pk4zHii7jYUhfozZIRBl6ZlOpM22u7lsu0pVHt/9jGEqw/Y/6MN@lists.linux.dev
X-Gm-Message-State: AOJu0Ywn+STtfj5dCGmNXt99D//nzcY291YDw0uIa/Ytkfh3k++uqeWc
	AgOCvUD9YIOK3ip6qt0Add+TgfVmHEyM9opihNHHRYMKp1ghzcqEM2bu
X-Gm-Gg: Acq92OFRxThiD4Ir9kL1LgxnfA2JFbppl4Tivq67EZE4O2UexXBKuzumox642ZPa8qb
	9G6ba4F4LBBkkrgkbDTGCXf9VbzQ1HGL0he1+lammOIq+mozL5zWVArdY1rjqBT+pcdbHttRXPN
	WkpA9hAGDNpG2PJdCieEl3TE2cIT17iuefePTDukMDb/XOkkZXseyt1p5Nc2iiekKwPBozUZMlm
	MvXkbY2CqECXJxeyTU80zr20QoQWqNk7zk/SHMG1+9MaocJK+YC+SxYDDvQZI9mkIJZnZ6ljcfR
	S1sXbacGzu423UrpJ8ge7AawihJTEnMlS6rpN7XHX+OrzlnBpVFnanZvf6qoSB9ZXCcl0XRRwp0
	VUFOj/xNaDPuSIzf68aK2nNHcJJP/GqKyM4bjqngbCrkxXbkgAvcGkOohe1TfYip5hGdRHifNF5
	DqBX/0dXyYN7GZ+TRLk7Mwfkpv5ZRJnoFPAdW/Xp56YILvcyJNIA9zQ57YwO0c5kU4+afNVzS5g
	folgpaXOdU6AFDFgSdgKWWkn4CVW0kG2VIa3lk1IJvmUA==
X-Received: by 2002:a05:6a20:2cf:b0:3b4:b216:2b26 with SMTP id adf61e73a8af0-3b4ccd77495mr28317102637.5.1781043597716;
        Tue, 09 Jun 2026 15:19:57 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm19661834a12.14.2026.06.09.15.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:19:57 -0700 (PDT)
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
Subject: [PATCHv3 06/15] dmaengine: fsldma: fix probe error path not freeing IRQs
Date: Tue,  9 Jun 2026 15:19:17 -0700
Message-ID: <20260609221926.35538-7-rosenp@gmail.com>
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

If dma_async_device_register() fails after fsldma_request_irqs()
succeeded, the error path jumped to out_free_fdev which only removed
channels but never freed the already-registered IRQs.  A subsequent
interrupt would access freed memory.

Fix by adding an out_free_irqs label that calls fsldma_free_irqs()
before falling through to the existing channel cleanup.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 3009e1531292..4475d50a94f5 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1306,10 +1306,12 @@ static int fsldma_of_probe(struct platform_device *op)
 	err = dma_async_device_register(&fdev->common);
 	if (err) {
 		dev_err(fdev->dev, "unable to register DMA device\n");
-		goto out_free_fdev;
+		goto out_free_irqs;
 	}
 	return 0;
 
+out_free_irqs:
+	fsldma_free_irqs(fdev);
 out_free_fdev:
 	for (i = 0; i < FSL_DMA_MAX_CHANS_PER_DEVICE; i++) {
 		if (fdev->chan[i])
-- 
2.54.0

