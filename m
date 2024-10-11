Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0ED820CCDC
	for <llvm@lists.linux.dev>; Fri, 11 Oct 2024 09:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728639651; cv=none; b=ERzquiWjOewCNSUR76/rzSJmIw6uF7/o6P7bc2q0p4ekm0/l32VSakDhf9NI+4b3D05qOPf7rSe0tFQRV6gHNJRaFvmh0m1rvFSdB7jKI0Z+OM3yUcf5uSBN/cX4xJaESH39qUv7qcK7/uCeLMOWf5CfRYE4bHANk9Or1JbuApE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728639651; c=relaxed/simple;
	bh=iQNhq+CQhhscdKGYDFLYkitEdQ89YDdaFMFypvyo1dU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fRdOglqVAtAE3Lw5vNNXvtvYPCcmr1JuFjHDhbOlRq7evdSLBHOx/ALuPihJTqIL3YOA5faJNKW/M9Z3hn173rl5CaqaS9GFPxcrCDurtiSgbrtUxz4rhDQiBYT6xfEv2pcLDBpt0bWxc+OsUjsHsmwbzd5Jq3joY5gWbK7yEcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lCCUEkBU; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lCCUEkBU"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7b10ed5e7cdso187277485a.3
        for <llvm@lists.linux.dev>; Fri, 11 Oct 2024 02:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728639649; x=1729244449; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O7AhjpOVVAnhOPJgZn0n/MxJSbqlC44iwzEWSMXLlrU=;
        b=lCCUEkBUUsrshd+aTnwGrKgtjW1HJ7QeNZW7qzX1i5U5w43M2ic5VpQt2GeX5kOByH
         x9pEAqZSKrTU1xb7OUaudBNQi0G+F3jMDRECXsPO/Ro4sMZCtFhOGrIrzlzkJOSJ/Yqf
         dKPrHDoy0PAP1irPDbLq9dROR4fffl/GBTVFwMeSbGadR9+Z7LrotpDdTwNvNzNpook9
         bQ3dh+0ofiPmRwzx7fAwAtWq63hA2iWaEsWzy4lJUFJLbCfuVBfiUaTPS7i0KRzRUUde
         KZZt8S/XZkVQ7BgpEhmbXPjDmpwagQrgPUeUTyO8Qt/3N0y8G3UBhHm+InYklFTDPgl/
         0uvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728639649; x=1729244449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O7AhjpOVVAnhOPJgZn0n/MxJSbqlC44iwzEWSMXLlrU=;
        b=O1bT7fqtekyfegiLci6BrXvSUtpfGUNuLgqKw5uwii/lrelSz7wP5lq3oYi8rcN4q8
         fUWGgHV8A27px9IxinwXlubfEYJnhQtO2QUvuHbeMofs3E7bdo9aau8D8oipjaYUn10G
         t+tFojnx6SIFI3U+65Ptp094uBsPXmBO2Z+TfqGBnaGXg4Xfa2mQjsqkg0PI9cNa4PHq
         HhO6MhUsgh71QEflLRReceSZAW7o32OFI722wv1+8RMbx1DDxm4Iue2nC/AnKVh01gJ1
         OyuzQBxRPxi0ErS6EYUfDey5QT8Pzns7FxskCVUkFMEdUcfVXftjxuD2grn7/a4nqJ8/
         Bklg==
X-Forwarded-Encrypted: i=1; AJvYcCWSAhE2wFju25btViJ1U518cOcc9hwitszbJYq/MUlMy6yTPa+HDk0Bz78V18qApttHu5cl@lists.linux.dev
X-Gm-Message-State: AOJu0YwUSre7VI8Ac4t9avObZjQbPiDEsMw/rFaZS+G8CODJCtsSntj6
	K5ZEQgD9+7/nJnJjM58/+J5CSH0be4ogItrsiHU2/fHsSLJ+NK/z
X-Google-Smtp-Source: AGHT+IG/+cAgSQ+5fGXIcN1uMcpXrVrmlk8jdj2JQFkFspeYwHXnn69GCnIs8Iu6eLdEN3k7633Y6A==
X-Received: by 2002:a05:6214:449b:b0:6cb:e770:f50b with SMTP id 6a1803df08f44-6cbeffc1ee7mr36700466d6.33.1728639648775;
        Fri, 11 Oct 2024 02:40:48 -0700 (PDT)
Received: from ernestox.. (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6cbe85a5b7fsm13855256d6.2.2024.10.11.02.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 02:40:48 -0700 (PDT)
From: "Yo-Jung (Leo) Lin" <0xff07@gmail.com>
To: 
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	ricardo@marliere.net,
	skhan@linuxfoundation.org,
	0xff07@gmail.com,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Vasileios Amoiridis <vassilisamir@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Angel Iglesias <ang.iglesiasg@gmail.com>,
	Adam Rizkalla <ajarizzo@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] iio: Fix uninitialized variable
Date: Fri, 11 Oct 2024 17:37:45 +0800
Message-ID: <20241011093752.30685-1-0xff07@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clang found that the "offset" in bmp580_trigger_handler doesn't get
initialized before access. Add proper initialization to this variable.

Signed-off-by: Yo-Jung (Leo) Lin <0xff07@gmail.com>
---
 drivers/iio/pressure/bmp280-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/pressure/bmp280-core.c b/drivers/iio/pressure/bmp280-core.c
index f4df222ed0c3..7d4151826b86 100644
--- a/drivers/iio/pressure/bmp280-core.c
+++ b/drivers/iio/pressure/bmp280-core.c
@@ -2210,7 +2210,7 @@ static irqreturn_t bmp580_trigger_handler(int irq, void *p)
 	struct iio_poll_func *pf = p;
 	struct iio_dev *indio_dev = pf->indio_dev;
 	struct bmp280_data *data = iio_priv(indio_dev);
-	int ret, offset;
+	int ret, offset = 0;
 
 	guard(mutex)(&data->lock);
 
-- 
2.43.0

