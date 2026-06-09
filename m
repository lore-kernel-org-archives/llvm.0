Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178F7361DD0
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 22:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043586; cv=none; b=hzZvwRG/sKBg3Ic9YVQih7gj7dtzCBAUwJWBKPMFQ8NCqf/Eq1SsEeX+GNXeukM6dMnfpyqqZ+HBJ56o4Kzc1V2fm6o5f/0wqdIivdE8JPkYTjCLTw2n4WY9qQplitP8zQjlRqTf6A6NzcvetYglrAKCZNE954RFQy80xWykmTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043586; c=relaxed/simple;
	bh=4/M/Z2Yw+2EJSZ+xE69ERPp/09jQ6db4A4lE0jGTRKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P2TyQJnNr7+v0NDpvlEmyP0ykcLVn1TT91PyugCbEXYKopIA8l7DR0lW6OjkFj+m5yNUN5mesABVPd3kvID2bq1GCGoE1jCFdTZTbTz87tvxvCB4ggpsfvJXb3xbadBp2QTztTMkOohAbeTula9nAouL9s+85MXNiDPCtoYxvqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XHv4G4jX; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHv4G4jX"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c8585ecdd71so2180443a12.0
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 15:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043584; x=1781648384; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u+enzAQ5tSvqZYMQTM27Sa9xGue4NUeyFXwU532vPXo=;
        b=XHv4G4jXZFCwRQxW7RcouONwoCCix3Ox+r+Xd7LXEXhfJCaY0dY0KCvC/9/3CVnmhE
         Yl+kH0F7Ql6LPW4iFGAnYNHMnXlLJd/MIh8LpNxiPVUpDcYs1cHhuE4elOSlntqeJW/s
         SwVXU3kNRfWiVgocmyyC+lz4i7lF3KgztRdp91Kfv4I5seyZ1wjwVHvzSorVE3cCIQMu
         WJzc6nJbv9nfMuHoQxcjdcn5HXAGeuYg92KqsQbjDbZP7cRFdiRFTQJ4hXSMMMzS61x+
         v2FsDZG/mZUo1G461xvyJX9gT7NuZg9nRWSgYhg2GSDvOAufezsbS5c3TDHdK3aQSE2u
         vsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043584; x=1781648384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+enzAQ5tSvqZYMQTM27Sa9xGue4NUeyFXwU532vPXo=;
        b=oZNoNp0XKOmP1/jR6hR7Dcoct6bHb9hwUdQAfoc0BYWk9js4HIHFZOKQsx6TgNKAQl
         BbHBArv7IUXvwQkuLNUKdPIsxYR9wq+AmSKS8+I6vB78g4NJi1zcRsAYnxrdhYQJczsk
         LsgwMhcV4Aii5JeHxaixiplwr0z7nfDaMLzInM7PtMVewQogffhk4o0PEIpfGTEx7uAc
         lRU7nw+Ol+PYE+uiREhogdtsmzke0dQG9bAGOVJxYcpsZamtxLx1r1cmWIpAsBP+Kfqx
         iRCHnZXQdnD0hqB7w++pGPgfzOiSp9myRDokDA2ivwlF2hyNJRTi3r1RHwov1EyfKDmw
         JkZg==
X-Forwarded-Encrypted: i=1; AFNElJ81F7lMi9qMVSoIgOKX7NkwZOPwIKWjuwuVXarnTpjv45NM+0eaSyJY/VNoDUgyTaAtMFfj@lists.linux.dev
X-Gm-Message-State: AOJu0YwbjcFscvuPoiVzvpgDFq7qhI8ScwbHmlTY4JBSJWsXoLtdEbvd
	Shnuqta3c5NpKUqFS+b5snrgKjiMxXn2WaOyMjAG/bljyPwSlQ1I13g0
X-Gm-Gg: Acq92OGq5fBfOBNgqbs/BMquzoWG65KfEIke36YRC5GP1VjsevWK04/5gos0kVcxgxo
	AVnBKnfnkP8pCsOU4PXU4NBkDZknBNZRUOr+uKiOU0Numh0knjXYp8e0ujjUjH4HwWt+n+J7J5X
	N4XC8Zq5Dldzyn46Y+xqPRI40UELT1PuNPCy10avwjotZQhyp3r1MW7ry/R6ru7Xba9fF7TcwLc
	FXXQT5tKPtrByRycy9Scwu35oqrlCbey+KQejXzKxpw+bC5HkLR8d02X7YMYhdVxR/HyGlaiSpo
	1tAcT6HbLtyhNWdox5pEvhMv++HexUgC/KRecFRrVZYi7T/h2LZPxR+HkHedgXPswSNpS27MK+M
	VS9SgHPGUMGDr7Bsg9N/adVIM8vHhvxFH5Rq10TAbfkP9tIQmRjF79cq15i0oYXRMhu+EwZB1Pd
	sbtBd7ETBFFsrFRtoISFJVMusXh2K1fOebqjgJQXvTiFMrCOUqWQTShe5dotCriTLAhoaOv7zcw
	+40QC0q6nUKJ7PzAnXnGuKnQP1AvlAoKy/OpOAxlMbKRg==
X-Received: by 2002:a05:6a20:158c:b0:3a2:d838:bfca with SMTP id adf61e73a8af0-3b4cccfdeb8mr26870997637.3.1781043584305;
        Tue, 09 Jun 2026 15:19:44 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm19661834a12.14.2026.06.09.15.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:19:43 -0700 (PDT)
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
Subject: [PATCHv3 00/15] dmaengine: fsldma: devm conversion, fixups, and cleanups
Date: Tue,  9 Jun 2026 15:19:11 -0700
Message-ID: <20260609221926.35538-1-rosenp@gmail.com>
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
  dmaengine: fsldma: use devm for kzalloc()
  dmaengine: fsldma: use devm_platform_ioremap_resource()
  dmaengine: fsldma: convert channel allocation to devm_kzalloc()
  dmaengine: fsldma: use devm for of_iomap()
  dmaengine: fsldma: replace irq_of_parse_and_map with of_irq_get
  dmaengine: fsldma: replace ppc-specific accessors with portable
    generic ones
  dmaengine: fsldma: fix kernel-doc param names to match function
    signatures

 drivers/dma/Kconfig  |   2 +-
 drivers/dma/fsldma.c | 253 +++++++++++++++++++++++--------------------
 drivers/dma/fsldma.h |  35 +++++-
 3 files changed, 167 insertions(+), 123 deletions(-)

--
2.54.0

