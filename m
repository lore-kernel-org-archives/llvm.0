Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E2B22D781
	for <llvm@lists.linux.dev>; Sun, 24 May 2026 02:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779590608; cv=none; b=XcMt/WcMo80lq3Fi9H8ytatiXnNp2rPW7XXRDMRCOQaVRlqvmvF0ipAbW75/DLRxZr9yW9HD6ju/vrntT9V+IAwsRYtClkc6y4LX2ydQxOw6fZQMD7bNPn7HvEozaZAWz01DdAUx2UNUTRk9N6YzLq2xC/kqc7SPfxkHqTmjQMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779590608; c=relaxed/simple;
	bh=eOAhUb4StqW0LTJELpjCzMzIP8Xi+emvII4kiJKsSYo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WZIS0fPPZs8ptON+5CwfXHWpESNMLTjpxK11eAn5douoiN7kRY0ESKPdbDu4+xCKjwo0/q+Pk+PWl/CgdHDBgOfe1Xmv27I1n7BlXovTGjYD/4gn2FBM6fZSr12tucSf6UfcrEYy5iadHA6AO/5dLlofpjxNvcp31kY7ZDJqPF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJpKbQuC; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJpKbQuC"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82fa8d6425bso3921276b3a.0
        for <llvm@lists.linux.dev>; Sat, 23 May 2026 19:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779590605; x=1780195405; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bYPU5BRO43oVkm1oDn9VG3+6AXXKThoy75aC+MplqHo=;
        b=FJpKbQuCkiqXK2d9WgDegR1t/Yd71/iK2jK7+fdycyRDS/ZPqM9gBmqvj3Q4TEtFt1
         KsfnPqRVYNPo6oCbTNCLuFv2yyZNn5WbicVBqrYETbc4bDkWhudNUj+9FySyuXsRECBV
         sCjSeV7D7ix1NsDJUO/b+W0ZQFfZqpRk34DnsOvmSDM1uASNBMMn8VQFZgcMoe6ehdtY
         m1oVf1KTK04mVPr/Goga81702AqDcp41q2ogCPu8YS8++apMO6z2INXozqIFZr/QAZAG
         9SjD2Zc71zlZUrNMLR60qfHZf3MPd05gFFrnOPo+Aupsw+C1gY7TTime3eErsCIP2C/a
         VdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779590605; x=1780195405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYPU5BRO43oVkm1oDn9VG3+6AXXKThoy75aC+MplqHo=;
        b=ZhLqPwCyOXZ+XIyOIfqczHrQjnAxuGrLm3VH63xkF9XNg6PFXbADUUY1T9g4HoM/5i
         1Ds46dOcPI5KMbf9l7P9GoRY42MYuFtnYSnURBNt4CuzZcUg3fTLIAA/J50ZREOZyJEF
         CrKbXA+rtPn+TcP3+W3tLoEAwaD0fVQ2H3m8Nzw9xJSdJJiI8drUUnwAterpcWKy1wJ8
         23omHEDAnmvZ2mFN7Tof57K8SWRVhfyYId1bv5dwlJk2/BrFvqRMskQfcC4orxuKx6qW
         HHhiw8c5j3tkrgQ/aTChj1cjyEmvP3sPEkQ0ee9C6hbxf9pajSRr9pglZ/muNI+lc9Pb
         I6oQ==
X-Forwarded-Encrypted: i=1; AFNElJ/LPPSv+qiSUeGTozm7lHHKqNL+8FiGqLozfJluvo0c1Gg6ek2k1+4KXkitXJq46KnSI1On@lists.linux.dev
X-Gm-Message-State: AOJu0YzAojUa1KXt9AeIh+QPGpoRz18NwYTFI94smxjC5HOkv22vEr3G
	eFPwjUnC41QwKjR9X5bm5SKf/exxVXl0SAUah1MmBK+zgB1FCJ9d233B
X-Gm-Gg: Acq92OGmurE+Tg9kdHLGuod5KTPEvFsZyxmEve8K7aZIjELmWTIPaMcVZftQJS63Vd2
	HoUry4hp/Szv9P5rZxFWPEsQ1lP0EWue4Q9GeGh1UjWnh7fDKu9McTAnr5P2Uta2ciwXPZTcbyH
	OQBxtZQvVP3V8UDXhlj37PPtMHUmqBGlctcUHn3c5SPmibT3InrHtaBHzZvPhPzeLsxoZKxhG18
	ZDiDV7X64jhxuNSiqgYrVky0OMjoXEFo1lrfs+8T4HKCCUc20MR+o22NRDVlC3NFIcAQCQ+vgEj
	jzMSkcUe8YPn7XlQlf2NyS7GBVOLb0lUXRbK9gYS4EyTiLYrgd+t/yYAB/1gsUIrUM7xni57r0e
	zJ0/NkkCvIBartg9pxxnY4du7xsnhT41s0ZRt8/cYzVD2lVBQS7o9P728OUgl7RgHHtfUBUzWap
	SmwqyYcvSMtgwQ/tFrfHs5A2nNmEnriDw0S0dzpGs2B6mTH4MNjRoQEzLRHEICqxNcUD4I1V9C/
	020AivYM9MjHRrQ25+lsUs9hMLoomJkcpPBcNXx0FSI2w==
X-Received: by 2002:a05:6a00:2ea7:b0:83c:928:6e5a with SMTP id d2e1a72fcca58-8415f32318emr8923998b3a.13.1779590605102;
        Sat, 23 May 2026 19:43:25 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ff7d80sm6418984b3a.56.2026.05.23.19.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 19:43:24 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	linusw@kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] dmaengine: bestcomm: ata: drop unused inc local
Date: Sat, 23 May 2026 19:43:07 -0700
Message-ID: <20260524024307.181634-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bcom_ata_init() declared and assigned a struct bcom_ata_inc *inc that
was never read, tripping clang -Wunused-but-set-variable:

  drivers/dma/bestcomm/ata.c:58:23: error: variable 'inc' set but not
  used [-Werror,-Wunused-but-set-variable]
     58 |         struct bcom_ata_inc *inc;
        |                              ^

Drop the declaration and the bcom_task_inc() call that fed it.

Assisted-by: Claude:Opus-4.7
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/bestcomm/ata.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/dma/bestcomm/ata.c b/drivers/dma/bestcomm/ata.c
index 502a45d76adc..40126f3f189e 100644
--- a/drivers/dma/bestcomm/ata.c
+++ b/drivers/dma/bestcomm/ata.c
@@ -55,7 +55,6 @@ bcom_ata_init(int queue_len, int maxbufsize)
 {
 	struct bcom_task *tsk;
 	struct bcom_ata_var *var;
-	struct bcom_ata_inc *inc;

 	/* Prefetch breaks ATA DMA.  Turn it off for ATA DMA */
 	bcom_disable_prefetch();
@@ -69,7 +68,6 @@ bcom_ata_init(int queue_len, int maxbufsize)
 	bcom_ata_reset_bd(tsk);

 	var = (struct bcom_ata_var *) bcom_task_var(tsk->tasknum);
-	inc = (struct bcom_ata_inc *) bcom_task_inc(tsk->tasknum);

 	if (bcom_load_image(tsk->tasknum, bcom_ata_task)) {
 		bcom_task_free(tsk);
--
2.54.0

