Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1A832C957
	for <llvm@lists.linux.dev>; Thu, 11 Jun 2026 03:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781149985; cv=none; b=YEC57AbvfXuTSLTvqPnPn/ioqE7STfVeefIDaSTTbihS/NAwGUgvhjUlLg+5pihlr8BZcXzqPyWA9BHUSKD9yL01NGa9mt8xVzRcGpLI9WW5SRvFv034Q7IQ0lOSQ3qouGPZgfdJrhQczX82oiQWtnyUdMToKZ9+F354gkIUsDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781149985; c=relaxed/simple;
	bh=RHxXzobTNxLOuRQySHEzFJkDtz+/dee3kZtQg5Fy0Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m2n4s2NYnNuZL7/sguNq5+9o/BkUeNBf5a8XRaejpCN1V5QClGHkfQgm20+vVNCuSizkio559ayOF1aqgx801sHTIvmudERqD1SmBqs432LEAwDAZrBQNP+kCvZLqr6Dk6lrzpPpS5siojlY6LqIn2aXocH9YvNdR3PB4+pQ0n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EiL7N7Sb; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EiL7N7Sb"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-37474afe908so1865024a91.1
        for <llvm@lists.linux.dev>; Wed, 10 Jun 2026 20:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781149984; x=1781754784; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sw1Cja1RhTfP4kS/GYb7UquNtVaGdBSxdFT1BKiN0hY=;
        b=EiL7N7SbSmIiEjJZUaqQRbsWRDjJ3tv/tKZmcnrbqzv64rSJ+MDok7NyQCpleiGRPH
         JqaoAtCNnmtxI2HCDQ/9adG3b/2JQbLK1zKKd00t+WVVvUnx1MsPvuyRS/mjFcDDax3S
         MBDS64trFb8extq8wqs26R3b4HNxRbLDF9bFZ8cnNupZEOY+dIfbFDdkER3yIrqcVQKM
         0taPuAGpOsrg7emndPRdrRSJuIVy919e7douy3Kbelk509bczMo/S8dT7P5HnTAm0syf
         vJ0dAILqD/Ql0kdWFPrPNka0ELBa/EFjpBZ2XCeVXnVg3cqtutSy6hrILyc/o/jzNUh/
         fgnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781149984; x=1781754784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sw1Cja1RhTfP4kS/GYb7UquNtVaGdBSxdFT1BKiN0hY=;
        b=fWzlwDl0+XuvvoAM+O3lvIadreiFs9J4TutBU6+D2Ycws0+VihcyPst0eeuY9annGy
         fciDOv64hWwL82rhzkpQbr/wVxwDjVKVOoXsAus21t4u90b1xfdA0270CLmLnOjDarsh
         i2+yllLpPUKkpvUni4u+gcR6aejaZcOaMjcvlJYi/wSY3/ycHlyWGDA/raPodwnCOg2u
         JY44Kw7b2FHDc2IO7KT1Y8NkZpgTxhUKUU8zBPOty0bSIwIEBtNdM7Qu9YpiBoMp4U85
         q0Zv6YmJjTsLtezC7qCyxeZpPY4fbKK79zYkxsqluo8uqQ30oMKOVxoHh2UyCa5sGlq6
         EG6w==
X-Forwarded-Encrypted: i=1; AFNElJ/jM1d1maJNvKC60PI4JgfSyiWr4fuUbyujTaugVR6hvzmIzyVWHOmu/RNA6BemkccQ7e8c@lists.linux.dev
X-Gm-Message-State: AOJu0YwvByrkPKfcT4Rfb0uNKuhlznUOlY620X7FJjY5oJi00NJPVtWY
	RUcH5LnYlaEjYYq3mJ8AWATiWFBAk3kSWaQEnpBv2teWPoSdM62kHxIA
X-Gm-Gg: Acq92OEP9t0Ty3GljJp3FTA55BJ1IcILgf5hcy4/KoF8ETXYn23wzpGR2cDEd0YEhX1
	FcEOCz6WpGhsPUDKbcuIHVAByWCuQvguMF9XJal1Cch1Q3jRo8u11Zw+yCmKq1wfSc8Wa3l42IY
	Mjhuv9AhltQ0exogZqcf1aMvkzK5b1IXtQYavpdm0VJhVAq/UiED387P7064RkGu+mzjS39awHN
	PSZ5Dvgssp3ZC1oea424Fb9PnQog/5uaMKbHykYAYsT8Xy+cCOhKrhoCAddBnhEzNg1Ab3yLbBt
	vOACz5k0wt3+hkwFeBSEmHw0sxZT3YXxiKQh0SuWevX9cNeEJ/c7aA0D3tYdAtNmEfTfjPqC+jT
	DyjiBULtTlSEUXTF32iLpNQkz4fgnOMd7KWx4NjCpNM5Q3P6PUMJOil+fR2rAKN1Z8guyjoJDug
	tKg4+CsSdVOsaTr69/LE2uUvyeOa9adF9GhRvwHLBHNDcCJgZYHtUn0UPEzhS8+h9fxIBysFWx+
	z2wrC2amxwzme11N1rVQ7GiTOYiXQbkGgmE04Hc5r5ndw==
X-Received: by 2002:a17:90b:3808:b0:36b:b06c:30a1 with SMTP id 98e67ed59e1d1-3779bdbe7e8mr1273257a91.1.1781149983868;
        Wed, 10 Jun 2026 20:53:03 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-377522a188asm910131a91.3.2026.06.10.20.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:53:03 -0700 (PDT)
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
Subject: [PATCHv4 00/15] dmaengine: fsldma: devm conversion, fixups, and cleanups
Date: Wed, 10 Jun 2026 20:52:30 -0700
Message-ID: <20260611035245.13439-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Kill the channel tasklet before removal to prevent a race with
  the IRQ handler.
- Check the return value of dma_async_device_register() instead
  of silently returning success.
- Replace the powerpc-specific I/O accessors with portable
  generic ones so the driver can be built on non-powerpc
  architectures.

Build-tested with LLVM=1 ARCH=powerpc allmodconfig

v4: address review comments
v3: even more sashiko fixes
v2: add extra fixes to satisfy sashiko

Rosen Penev (15):
  dmaengine: fsldma: kill tasklet before removing channel
  dmaengine: fsldma: drop desc_lock before invoking client callback
  dmaengine: fsldma: halt DMA engine before freeing resources
  dmaengine: fsldma: provide device_release callback
  dmaengine: fsldma: check dma_async_device_register() return value
  dmaengine: fsldma: fix probe error path not freeing IRQs
  dmaengine: fsldma: fix request_irqs unwind freeing unregistered IRQ
  dmaengine: fsldma: convert to platform_get_irq_optional()
  dmaengine: fsldma: use devm_kzalloc() to simplify code
  dmaengine: fsldma: use devm_platform_ioremap_resource()
  dmaengine: fsldma: convert channel allocation to devm_kzalloc()
  dmaengine: fsldma: use devm_of_iomap() to simplify code
  dmaengine: fsldma: replace irq_of_parse_and_map with of_irq_get
  dmaengine: fsldma: replace ppc-specific accessors with portable
    generic ones
  dmaengine: fsldma: fix kernel-doc param names to match function
    signatures

 drivers/dma/Kconfig  |   2 +-
 drivers/dma/fsldma.c | 258 ++++++++++++++++++++++---------------------
 drivers/dma/fsldma.h |  35 +++++-
 3 files changed, 168 insertions(+), 127 deletions(-)

--
2.54.0

