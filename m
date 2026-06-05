Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF8A3451B0
	for <llvm@lists.linux.dev>; Fri,  5 Jun 2026 22:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780696915; cv=none; b=KVJMTtw24uCNd3VnQuZdnqSPaSa5QzedmqQRbxA2ZgEYkbw8aGEj3qXqg96Q1fJgc6CNuE/roMJtXsn5150K+fU4NSaKTcVibIHBQwZ7SXdWtQjJAWTFiKd+rKiexrXnoXIObvgx0V4qqHRozCAv3rrQMaXN1jjiF5uIRtXggPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780696915; c=relaxed/simple;
	bh=ngmjTppZ4R8OgX4SoxvBD/WHaDhJUoUg0fzo0m51EWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=biiTmWn1U/FX+qaVDkK7LCVk0M+vGSkSisaJjHNHrPYZ6s/xxFpyTXO9zfRYeOkKjp+5NZxs9LqqZO1miZafxSv6Hko5j2xSqV0NxcsNFBEa3Rg6sBrGSGseBKVMd8Mc5BA8jUXEdzxPZu7tOu8jWfmKAyjCUJkBcTpDbvhUWOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRR4qRkg; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRR4qRkg"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84232e83ca9so1129086b3a.2
        for <llvm@lists.linux.dev>; Fri, 05 Jun 2026 15:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780696913; x=1781301713; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jPyXiBEaDClQK0uMOGkx+P1/d3TAmzFQ5qeaXXNxnLk=;
        b=jRR4qRkgwz8WSyQWc9hQ2sb6GSbyg+pz/52nBUQi9QHjynPEwbmNnHa2FkQosUIUZO
         t4smn9EdzjZ5zFPkK1wA0rlb08oysibzYEWmf+iuWky4QpFDqjqJ+IToBHxwYNOCkKoW
         y/4s92/6T4dNmAsQhd3n8Iey1cIAjQpgmtwsvFzH9ioAIH/Ml2/D5JwHEIfS0ask3YI3
         z/MkP7kD+oUMkL/S31tZphRj7M28zX+ThFPMnvGZ71TxHuKprKjlA16f2qYa2raylgnp
         Pum10M8yTbYLRZDn40hY+hIkq4c3oTJ7v6jlwg0kliKyDn8N48fLXZOrb8ZlGL1MO067
         avFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780696913; x=1781301713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPyXiBEaDClQK0uMOGkx+P1/d3TAmzFQ5qeaXXNxnLk=;
        b=lQVKJJAgwIifC9GgG5Rd+FHNe3hetpnZKmAyvnXIcpEaQnS5IK74TWVuPJjvVrKkzv
         jvWqQiPUc5EmfwpxrclImwVTuZPX7TxrwlBrJyFaTEcyVpvyHFKQgV1FKhsWoUOWSsUI
         2DMB4bbtaedT9WcEXfpI68UOAKQPx8P1d+6g+2w8EQk/QiFBtLDqluYs+RjHoor4npas
         V4GoIgRhMXqs+rZyP6ZH+IpsbarInKBQJTxCDephAUj4vov9su/gdqODZipYiJ5IVDLb
         MlUDlnmntXOKRo73foHEEU+0IDnUnRhwvdoiwuhjcFtsySV99xxoKS5aBLPrsW8Uxxuq
         bIfg==
X-Forwarded-Encrypted: i=1; AFNElJ+L7QT3DEGT56Tx8EUtoKKrPtwbGv1udJKeX3HifDoNywGpDiLv8QvsxkkWwa7/lgUvEp8N@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7p67C/bHW/kiadfnxiP2X+P/dehHKEeASbqt+JzVDQYU6gCaZ
	7V6qOsW7npK0cnx3lZUuShRfQgpuS0KqVmP+neOA7JONZXgYMhmb/sY9
X-Gm-Gg: Acq92OFfn86zfP3xTjuQS/60M/iTHNY7vJu5qQPlkm9a0qqpX/ko2/gFaFpzbsVUvM5
	JwfWjb42L5gxW69RoHNNP31srcA9n04ql4xGw75/6M7dMsUFYgReFwZvtywb4GQbkpcdwvluxgb
	xH6WsTpjiTYZ3dcc/Y/Bj4jtNYv+CyWhE1ZRFge5zwrisJ2rzJi2vS9af4eP6UNh0AerMs4T7BF
	H7AU2OroH9GkJDAy6+6byOCaGmNGXXux3VyGTOcPBSjr74hkgI7Dan5mFKf2kPrEaAKsPpoblNs
	8VyKW+N5ZxCP+9LJZycjaP4FpiEzzO9UokVao2cwqueYIm4qgSLTcc9XOOFYNLqjkCAfXrmisWB
	mEr2FXDeUElfwUUveSRIVTreBznUb3IXDl/20hFUWnpONB202jkSqZPTWTy5KTlzRj5sNrCgiTH
	Lcd4XiM1RCp9g66OlecnypVg+v4wdZipY/Tky5wCPTDu8TeXKCY8r7fpesBe/U63hCEoSZcJ041
	lzYgx3DB75/Py+y38tK6R7YQWBEzUV4bccTQi9Csa50BC76Njv8qLVb
X-Received: by 2002:a05:6a00:6c9c:b0:842:5b63:6118 with SMTP id d2e1a72fcca58-842b0f1f43emr5730143b3a.3.1780696912990;
        Fri, 05 Jun 2026 15:01:52 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842824a1cb4sm12518883b3a.26.2026.06.05.15.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:01:50 -0700 (PDT)
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
Subject: [PATCH 00/10] dmaengine: fsldma: devm conversion, fixups, and cleanups
Date: Fri,  5 Jun 2026 15:01:24 -0700
Message-ID: <20260605220134.43295-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Convert the Freescale Elo DMA driver to use managed device resources
(devm), simplifying probe error handling and the remove path by
dropping explicit iounmap, kfree, and free_irq calls.

While doing so, fix a few issues uncovered along the way:

  - Kill the channel tasklet before removal to prevent a race with
    the IRQ handler.
  - Check the return value of dma_async_device_register() instead
    of silently returning success.
  - Replace the powerpc-specific I/O accessors with portable
    generic ones so the driver can be built on non-powerpc
    architectures.

Build-tested with LLVM=1 ARCH=powerpc allmodconfig.

Rosen Penev (10):
  dmaengine: fsldma: kill tasklet before removing channel
  dmaengine: fsldma: check dma_async_device_register() return value
  dmaengine: fsldma: convert to platform_get_irq_optional()
  dmaengine: fsldma: convert to devm_kzalloc and fix error path
  dmaengine: fsldma: convert ioremap to devm_platform_ioremap_resource
  dmaengine: fsldma: convert channel allocation to devm_kzalloc
  dmaengine: fsldma: convert channel ioremap to devm_of_iomap
  dmaengine: fsldma: replace irq_of_parse_and_map with of_irq_get
  dmaengine: fsldma: convert to devm_request_irq
  dmaengine: fsldma: replace ppc-specific accessors with portable
    generic ones

 drivers/dma/Kconfig  |   2 +-
 drivers/dma/fsldma.c | 139 +++++++++++++------------------------------
 drivers/dma/fsldma.h |  35 ++++++++++-
 3 files changed, 76 insertions(+), 100 deletions(-)

-- 
2.54.0

