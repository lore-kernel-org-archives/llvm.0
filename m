Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FA110F9
	for <llvm@lists.linux.dev>; Mon,  1 Jul 2024 18:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719859910; cv=none; b=tJWsr6KnXmXPr0bYcj/kXpELTiGhjj4J2H/QI8TNaGCAQMFp8a+RwdJHRau++itOw7+P9Tuu9hzAuZS8+sijqrW9wUz6I1ivv26Owlw1fWZuv7iQ28rYYrjsCshswx9NT7JMNZRQ+rV1XGYDmowXGexbO6UeewmXLEGM8V7Rg9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719859910; c=relaxed/simple;
	bh=ooGpiLMdOUHx9iLz4koldab/tmycHJSpp5+5KE1OqLk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UHIIFyilgNPIq9F8S828uC+hHpseMcPm5OYuvmKWu2cFWFIsO+PH5WxwzahunazA6ZRZAR7mpP1oLLb5/FyFJ+Xyc+qCv6VnPwLZRmP2/ME/uh5B0qfbpr28+A7cCfLWuxmIuiuEIqHzN1/UY1dv6R4ZK3dFbuzVQHLgCyS2+Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=z/WaH5hf; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="z/WaH5hf"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1fa75f53f42so15865985ad.0
        for <llvm@lists.linux.dev>; Mon, 01 Jul 2024 11:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719859907; x=1720464707; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9BR+n8cp6lBjZjGDk+mYOf3wt+diD2m02XG7xJApEuY=;
        b=z/WaH5hf8ZfyHTSY/LbMYfAanaGjD1/l0nG4C2wYjOZlWAl1O3Vtm2FVLYJsebqj0u
         K0SpQkrZ/l2ZLo1/d3EVfBFLCAXnkw4YeT8JS6x7BxYAXg8FhgiNZR0AU3EZG8fmupsC
         4n/51VUy29d0rlEKY5NPYG+1qiutCHdIZ2kfyfMTaehhWIqbRdm618I7W+buS73mP+ie
         T5boA6XmmbgGGLvyT67xKoLeLjbgzvL3NTVw2hkJepvaWh/klm2rm4vmVgJ1a+kJiHnm
         B7RICpZM9unt87e43lC5mzSi8dmzAnqK3FEyZTQLqVxCtUHB7HtXYY77d3DDnxWDgPqB
         2d3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719859907; x=1720464707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9BR+n8cp6lBjZjGDk+mYOf3wt+diD2m02XG7xJApEuY=;
        b=FwGhRZkgT1/07p7dQbljvq3CPYP1sUknL7TEf02mT5s0z6Ojfsk2XRKK6OnyBeZNm/
         zRl0C0ZP7q13xkvai8a9cr8M721vE9sYLrjR1CoJFZryoaNz1vgQJzes3JbolGdQUutJ
         AObV7NUQllhRPHllxs4m0dT10QkyhRHoDeCgqWFe5z8WBzCwLBXsd722apiycr34dTrQ
         x0KXB9BrzBTiKU9Zm09fmpmiGeX1qS1RmujFcr1bc26I1+8xVWB+QkjlRZNnewz3mnfZ
         ogTFMkS446H6Te+tj3KiKt4HbUrf7rrN2jtuJCKcheU/UN4wMBVD74dTbMGooLB8NqpP
         gfXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNThfc2Iy7cEISvk7UYu0D/BWl7EYSgwRmrpRR+pf9jERYWQ9tsAEHCFgfgyPNDeQv7Fq7nS6EoEuCrNdFDqT6gjxaqw==
X-Gm-Message-State: AOJu0Yz6yCIiY9YGQtp42RbxDy1eJcrbXdXm+ur2W3ZJaaRsxCt94PUD
	4Lqkz6/FYx4iFrSiqQ0EtMUp/pxxcH48hk4nTT8RuINV/r+rmZzvk8XcHcL19a8=
X-Google-Smtp-Source: AGHT+IGIhR4q2ffdDOA70LUc/qAQrNnvQG1rQn60lll7aXKMs5f7a9ja1/d5Jnpik/LL3vg+/X9cqg==
X-Received: by 2002:a17:902:ccd2:b0:1f6:1780:f7b1 with SMTP id d9443c01a7336-1fadbc73cdfmr44672915ad.17.1719859907340;
        Mon, 01 Jul 2024 11:51:47 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10d1ccesm69883375ad.20.2024.07.01.11.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 11:51:47 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Wende Tan <twd2.me@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Sami Tolvanen <samitolvanen@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3 0/4] RISC-V: Parse DT for Zkr to seed KASLR
Date: Mon,  1 Jul 2024 14:51:28 -0400
Message-ID: <20240701185132.319995-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add functions to pi/fdt_early.c to help parse the FDT to check if
the isa string has the Zkr extension. Then use the Zkr extension to
seed the KASLR base address.

The first two patches fix the visibility of symbols.

V1 -> V2:
 - Add RISC-V: pi: Force hidden visibility for all symbol references
 - Add RISC-V: pi: Add kernel/pi/pi.h
 - Rewrite archrandom_early.c to parse DT over checking the csr
V2 -> V3:
 - Add RISC-V: lib: Add pi aliases for string functions
 - Rewrite isa_string_contains in third patch

Jesse Taube (4):
  RISC-V: pi: Force hidden visibility for all symbol references
  RISC-V: lib: Add pi aliases for string functions
  RISC-V: pi: Add kernel/pi/pi.h
  RISC-V: Use Zkr to seed KASLR base address

 arch/riscv/kernel/pi/Makefile           |   3 +-
 arch/riscv/kernel/pi/archrandom_early.c |  30 +++++
 arch/riscv/kernel/pi/cmdline_early.c    |  10 +-
 arch/riscv/kernel/pi/fdt_early.c        | 167 +++++++++++++++++++++++-
 arch/riscv/kernel/pi/pi.h               |  20 +++
 arch/riscv/lib/memset.S                 |   2 +
 arch/riscv/lib/strcmp.S                 |   1 +
 arch/riscv/lib/strncmp.S                |   1 +
 arch/riscv/mm/init.c                    |   5 +-
 9 files changed, 223 insertions(+), 16 deletions(-)
 create mode 100644 arch/riscv/kernel/pi/archrandom_early.c
 create mode 100644 arch/riscv/kernel/pi/pi.h

-- 
2.45.2

