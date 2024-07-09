Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB4515886B
	for <llvm@lists.linux.dev>; Tue,  9 Jul 2024 17:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720546782; cv=none; b=SS6fcxOo29UwzLb4TMSCE8YJR4LYhveNfIllFex32VPovPv5peNveoSi+f/821ZW/ogfqAiQLbI3NXTf7O4LdTY+/mPsz5OSxeNYdnA10T9w35ngkKTrUbWn/bC6aL2TVS5fCXDaGKNsoXRQKRfUK7on0gFx3G9HPPnEmEggV4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720546782; c=relaxed/simple;
	bh=IeOtPKogez48r2P3oAafPf7mWpdrIEUVTbXKWkBu+s4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pauIwZ8MaDIylhZvEbu3xYUsGpsctvgatu1Kz4YvZF+0k1Qko7FQnzy10aKygxVrO92beX2Vpj+nKLe/VH3h2+xgSqKEMO/CNI5gQFrZ90S6X3dwyXfieuvgTfegYmnyolFqiNn8QXKWq/Os9OK5XR4bjZ4K9ExDeOLph8UiNjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=0Ea4Cc0K; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="0Ea4Cc0K"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-79f178e6225so108819185a.2
        for <llvm@lists.linux.dev>; Tue, 09 Jul 2024 10:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720546780; x=1721151580; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIkiZ+EC0cy3qQspr3kP3SqSJopsA9NQAjKMM+c2r1A=;
        b=0Ea4Cc0K83c/o528j+ggUdJUQf520Th8b7BMbAEQnwlAr/cHKpn1NCU1gMi1vkm0pG
         a+SUe/KYC4rldaDD6v1rsk67l7oOzNLIB3aaS32MY9F5J5OwXJDpE5fTHy459SkR7Giw
         A/71gQtgeJZXky/CjX3RFIkSNzdyaHYDfyVDXHW/+87RZN7u9WA5pxo7wIvD30sI3wVA
         4IDHiPKRD/EnnLXlA76kCx+VLRFwklib8HSvJdnzPPBZlVhApuUTGbrxKlYiH1yBkM6i
         McO5IlIC26n7F1PPs2jm1B2rm9uqLv/2OfCZINF9cf9ybnjk48gnVcEMhaRVPYCg4nTg
         zj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720546780; x=1721151580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gIkiZ+EC0cy3qQspr3kP3SqSJopsA9NQAjKMM+c2r1A=;
        b=lXhQQh/OUhD/xVyPVz7gZCg3MPIHSvGc7sbxH+qr3nc3FGJZiU5YTQN+gSe3hnnXZe
         SfTT11C3uAi//Ch4mgyMv5VEjQRzHeItZaEXM5tOY56r5jyvbwwnaarO8bvl+FBbrvoX
         QAqhQvMtpMyd0R57BRGEIf89P/HH/+nvyMOI5fhHfe+GAIYRR3sn6jWi6eDV9VYh5KBf
         6M/n8pbfzNOkJpgs0SHbvnj30Zuuxs8LX8MXv35jexnefeEjHGS8GbspNfZoKp0zDzLb
         VTXHgPFkx5o0hZMS38dB3se4bWnLSccgEi6m9JMlh5C8KFBPoLcKNSKX6xvS2cZdjiyd
         wJMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLwYXafxNrDfbB4m3k4n+ExropXuX0O0P7iQKXYKqZoDoC2W+udfpn0E+ax+G7RXuNv2HrsYgtjlzjzFJKfVVL79Zn5A==
X-Gm-Message-State: AOJu0YwvFyct8M3+KTgF+DmC2mlbx9u/Iy87wIDZ4kAn1KKsPZpq/rM7
	1+6K6rHtRhi6VO3A6un/crJyLn8dTBoZjNOHG20sQQko7nMmBNc8o8jTZpl3ALA=
X-Google-Smtp-Source: AGHT+IFqf9MGCcfZzUZn5e2OPi31BYIsZtdOvyOYSAfI80AmjeHPmXW5Hh4FPbdEJB+RjrwEI5CSIg==
X-Received: by 2002:ae9:e017:0:b0:79c:f0e:f7ac with SMTP id af79cd13be357-79f19a1f8a5mr329303185a.28.1720546779837;
        Tue, 09 Jul 2024 10:39:39 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79f18ff6762sm117547785a.10.2024.07.09.10.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 10:39:39 -0700 (PDT)
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
Subject: [PATCH v4 1/4] RISC-V: pi: Force hidden visibility for all symbol references
Date: Tue,  9 Jul 2024 13:39:34 -0400
Message-ID: <20240709173937.510084-2-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240709173937.510084-1-jesse@rivosinc.com>
References: <20240709173937.510084-1-jesse@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Eliminate all GOT entries in the .pi section, by forcing hidden
visibility for all symbol references, which informs the compiler that
such references will be resolved at link time without the need for
allocating GOT entries.

Include linux/hidden.h in Makefile, like arm64, for the
hidden visibility attribute.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
V1 -> V2:
 - New patch
V2 -> V3:
 - No changes
V3 -> V4:
 - No changes
---
 arch/riscv/kernel/pi/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/pi/Makefile b/arch/riscv/kernel/pi/Makefile
index 50bc5ef7dd2f..1ef7584be0c3 100644
--- a/arch/riscv/kernel/pi/Makefile
+++ b/arch/riscv/kernel/pi/Makefile
@@ -5,6 +5,7 @@ KBUILD_CFLAGS	:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) -fpie \
 		   -Os -DDISABLE_BRANCH_PROFILING $(DISABLE_STACKLEAK_PLUGIN) \
 		   $(call cc-option,-mbranch-protection=none) \
 		   -I$(srctree)/scripts/dtc/libfdt -fno-stack-protector \
+		   -include $(srctree)/include/linux/hidden.h \
 		   -D__DISABLE_EXPORTS -ffreestanding \
 		   -fno-asynchronous-unwind-tables -fno-unwind-tables \
 		   $(call cc-option,-fno-addrsig)
-- 
2.45.2

