Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331F9219A81;
	Sat, 26 Jul 2025 07:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753516409; cv=none; b=JnFElVdbCksDHq8XUFabk58Xr3I1zcpuI0VFusXnHMY6aOVK0KlhODR23keWpdjxvo73+ktc+IHFPsa+vNlxhPNTDcor06Mdf8Bs85+cDQVsv0aSLk3m5BJbTTPBoQokU8JPUnEAf8uDxABm4BbCewDeblJ1X6VJyL7fv1r6t0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753516409; c=relaxed/simple;
	bh=752J59Up9Dkl2wk6wtFop0+RMo2J7LXtlEHlg3GiSyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fDfsYQSa9brkO/tPOtolL6622zxIgKWZDmBF72ax8rXL4DTbP/JgqHPVZZ3zm8kDgvmeT/JbdMbgMAeEIArW71d8v0XX2XSAZMGIZUx87wc/4wgg3GrO6aZm2KnGFZv0Tb9Btmtpq6Fekv97aT+Q99f27d5cd+Xw3WeVi2jLrlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+Vk3KH5; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+Vk3KH5"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-31e7e3dc5d2so906194a91.1;
        Sat, 26 Jul 2025 00:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753516407; x=1754121207; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1A/xIfVprRRXxQtXJqBwfAOsQMkFGtKU8TZczTnKVAc=;
        b=A+Vk3KH5IU7Pu1HWHnVF+CgRwuPhxsvghyS25XWHNuQLhzrG9CIavqT2amfHjlUHUW
         /+AoWn9sf5yqT0RwhcA7/AMXnFxA3LIOn9amSit+Am8NTujZjAEHvMf7yHQUPhsM1tEx
         MVLpAVqJssq6jtme0GsV7/sOROEi/ii9/IAX+Hpj9VCzLlx1nqaa3TyYfVqNylkWwQ9G
         pFLYEM6RWeLHaBC9TFVx0nA4uDYXspP4G47a2QihBlTJa5Z7MvBxivvswT7c+bK6S1jn
         nmYjzpLbRlyVLLrbt6Bo+Q8eVKe6W7v9O6JDdn8KXapZVMBkLKiONkBHnnumIwtj/JEO
         N7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753516407; x=1754121207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1A/xIfVprRRXxQtXJqBwfAOsQMkFGtKU8TZczTnKVAc=;
        b=bB6c1e2V+oxtlzZr/LYPASI2FUYLRUFlDO1tnLGt970KxR8EmxMhAR4DGIQ4MOyc8H
         UOJ3Zq9zZ7K0VCU74o7Wgc7NJNqspZKyZjmEA0A3VPxC0NNdiRQRk2/gTDH0iTefzsbz
         Rjt7X3+nRo75/Hh5dZCZnEapaHmjJZXEkKYyvAuyZQ+cEkl+NPkN4u8WJC7VFvptebwB
         Tx5sJQPikqnYTcDKNN+8Y997EK269m1sO9yLCKNnvFUO3YJZsaFkzwm8It57xYkLPpqt
         uqRGWT2bza3Q8qRjShympPboboySp6b2s/rLW3h1yASQQm16wrfkJt8psCTNu1ggobu4
         P2lg==
X-Forwarded-Encrypted: i=1; AJvYcCWuuhPMbVwv9ftvNNeOC97sHXeKr3jMOZi8coyzYhzKQMfmeL5PBQlvZ84EXqU8D1WukIDqFQ==@lists.linux.dev, AJvYcCXgvqEADyUGa8wdJPtd5w6hws0m6WAOcUeDOG/Mz4oJjeomYdcqRbbuFbfF/Pfu/bgAp2vio8wg0c/AMLkk@lists.linux.dev
X-Gm-Message-State: AOJu0YySynb7CcDcMVwfJ0AO+W4H2isRk0UmDAEb4Ih+rZ6VZlLVkAlE
	StXje0OPl9ySRy++jmFXhi4hzeL6lOxps+b1n7HUoXnN8F6Bs3tzdUeL
X-Gm-Gg: ASbGncti9eGveE+tkqBuAt6mUO6CPUfQKDsV/LT1TeRwPilqPZcoINzkuGtoqLmsGY+
	L4KotMq0knNZ79ANlaXTcGStksz+U0pys8yxx6ufOgHH9jnViuEf+H/eMirJ5pY8zR6sXXEtQPa
	8iKnQoSn+HjdKkdnLPUwnmBReggblfGuOrgVgeNLZntqNUW4r01qseiuX9DAk+MbsaYi2Jq/rTH
	8ReQIPrxY2tC34UFCKNlx9Ah7nQXvLerznD9pb5LQwf6/8Jg1ys9wKaeGVneAURiD89tyxWj+iL
	pJFkuZuKB2o3s/VjIqTUgUFkdm6qFlWDvwe0WOTfcVWGbzUeQ9JMeZTX6F27/TeBjDzp/mQ7wGq
	3Np4dGy/2rGM+GCfjLVzPmHAea+0DjxXS65FbyxtIW6mHYz909ggZMQShH2lxxdJtX8Vg1sYa67
	0ISjQJfDJwRQ==
X-Google-Smtp-Source: AGHT+IHjJRq6VZqcLgvT1R+VegR+hAxpAKInrmmF7hw2IZT0ZDQ+i27BRZuow8t2ibBfElLrXNoKKA==
X-Received: by 2002:a17:90b:3851:b0:311:e8cc:425d with SMTP id 98e67ed59e1d1-31e7787c9f8mr7661418a91.10.1753516407356;
        Sat, 26 Jul 2025 00:53:27 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm1234979a91.1.2025.07.26.00.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 00:53:26 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Sat, 26 Jul 2025 15:53:13 +0800
Subject: [PATCH v11 3/4] staging: media: atomisp: use designated
 initializer in anr config
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250726-new_atomisp-v11-3-46eba1953fba@gmail.com>
References: <20250726-new_atomisp-v11-0-46eba1953fba@gmail.com>
In-Reply-To: <20250726-new_atomisp-v11-0-46eba1953fba@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, llvm@lists.linux.dev, 
 LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753516395; l=1203;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=752J59Up9Dkl2wk6wtFop0+RMo2J7LXtlEHlg3GiSyM=;
 b=AUGGt6oYO1sWmd//49PfvQNrepM5uFn981+eaeQb9PLeVD4BVuaum0VF6BbmkScjGyt4ki+fj
 WoLMdm+dumWCFgq52gQ3wGy32R6D1kMBqA5957XtYjkV+WInBzQrMyQ
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

Improve readability by using designated initializer for
default_anr_config.

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
 .../media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
index 49c22a68ec552ed163e3268db2b823fc4ea73b36..f4dd3ca03d75c32a0ac3798af031c6a3423a73fc 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
@@ -11,14 +11,14 @@
 #include "ia_css_anr.host.h"
 
 const struct ia_css_anr_config default_anr_config = {
-	10,
-	{
+	.threshold = 10,
+	.thresholds = {
 		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
 		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
 		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
 		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4
 	},
-	{10, 20, 30}
+	.factors = {10, 20, 30},
 };
 
 void ia_css_anr_encode(struct sh_css_isp_anr_params *to,

-- 
2.43.0

