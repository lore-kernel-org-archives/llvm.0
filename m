Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA3517B023
	for <llvm@lists.linux.dev>; Tue,  9 Jul 2024 17:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720546783; cv=none; b=d5ik7VkatZ7eZ8y5ggyx81+zxiVrfqWHIrkUh55gbe+B1ni7BmsfyxrMAw1pPCKOzTJ7aN+0eQ5Wmwyim4eNxpJ/p3JS9DYTngsCLh9P/d5c2HEkMd0ti5Z1TxJRBLKPi1K+4WyiYvN2wuC1Un2abO6rYiN6aYRlNxHUaervYVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720546783; c=relaxed/simple;
	bh=MjG0wx0U38uUII74AFjua/T8NeFZTe9VZSo8JReQo/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kpt9j/7MZMBBapijLeRWuIEa8ogvI4iepQdGjYkYRiRaZcHGW3oewbjgpp4JUkJrsYsZTuZRpKei5fS4Mj9cmKJl3M/qBIr06ollzOmDZRANdi+lOphJyDYZNCabDK7Ujo+7JllGFxybTcROneSQAio/XoVbKbB71w0RrLb7z6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=oqweYM9Q; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="oqweYM9Q"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-79f1828ed64so103346085a.1
        for <llvm@lists.linux.dev>; Tue, 09 Jul 2024 10:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720546781; x=1721151581; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bs+9F/AX0q+LBs1CELfWwb/nqSLPDtCG32+ZAsR7dQo=;
        b=oqweYM9QlB31YKoMLX7CuK9bccfTl7SOGsfIIBxYzriC8K/Q2C58yiYumSpvcQwkdr
         nIy9LSO9Ufngic7Rnlzrg4juTpOFnEkiSb3NswTnhdtus434IDtGtqjqVbPCTuN7mycq
         Hj+H4FDY1HWQhNzuwPr81/0mx9DW/p/See0Mj2xYrSY1JpRMlo//3MbhpuVaBR5mulU1
         3LR6ddeZ3SMxl21oLpVG3FgUK6uPXXdqBDSUCpxX03lKlDOqHWQyKvwGr/Bfy+P1vy/E
         xAQtDu1XAEhLt8qeceYYpvvj5Vcks35gbN4H7S9JEXVRbys0PzvVbUnG3l/xlFNoyvNR
         DezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720546781; x=1721151581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bs+9F/AX0q+LBs1CELfWwb/nqSLPDtCG32+ZAsR7dQo=;
        b=T2M/Tlk58lgg0watFR/fQv8D/kZJL/XCGZ4XIO6i27SQa0RRV4ib3KtMH4yh30O9c7
         fYMFcTqa4Clln/Iw3Z9j4MmmY2q+QWsAmRkTgWTRdus9ne3845Dj7hTPB22eMzmdcJqV
         /n5iGHx9rQiipW5nORbfDHXMsRIJF+WlIfHKys8p91gNB2ZnR+Vp+VdBqrPmd9aQheEC
         DAaLLI2ld7XJUHWP5gYBMSOPmcJ6S8jnrYWZmc9nmbhk72/fs1FrUqY/73ppjPVrzYc5
         8wxLJvPVRx5Vg/anVcIUu7S8Owqg/nQnU7rjtqQfBzFFAPUwc2HR/gC4h3Bi4gf0PAsi
         TaBA==
X-Forwarded-Encrypted: i=1; AJvYcCUO5EOhDHVAxZ8NwCKCsa5baEH7H7WtOzfB4nkfdoyePN1mBrcS1VdZ71NYc4KCzDUO40T4LDVgSwGkx3nrTGOzx+sUfg==
X-Gm-Message-State: AOJu0Yw+bdUGcxQkJgJ8a05kg4gDiFCRD5xIMUoXkIVydzSC9aTFmIAy
	gnZrky+dyDGy7hJVgXGQ28ojadiEZlmNuzfuWC8za8+iGnxkVG69hR82dkKtXYM=
X-Google-Smtp-Source: AGHT+IF5vRwH3MAJLaUEo4+iqmQHIG8YR3UCz6IbvA0rf0+v0uyHD1q0n/vo2ks9owSgX2DYVwobqQ==
X-Received: by 2002:a05:620a:3b89:b0:79e:f7ea:2df4 with SMTP id af79cd13be357-79f19a5fd69mr325013085a.19.1720546780865;
        Tue, 09 Jul 2024 10:39:40 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79f18ff6762sm117547785a.10.2024.07.09.10.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 10:39:40 -0700 (PDT)
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
	llvm@lists.linux.dev,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v4 2/4] RISC-V: lib: Add pi aliases for string functions
Date: Tue,  9 Jul 2024 13:39:35 -0400
Message-ID: <20240709173937.510084-3-jesse@rivosinc.com>
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

memset, strcmp, and strncmp are all used in the __pi_ section,
add SYM_FUNC_ALIAS for them.

When KASAN is enabled in <asm/string.h> __pi___memset is also needed.

Suggested-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
V2 -> V3:
 - New patch
V3 -> V4:
 - Fix duplicate the in commit message
---
 arch/riscv/lib/memset.S  | 2 ++
 arch/riscv/lib/strcmp.S  | 1 +
 arch/riscv/lib/strncmp.S | 1 +
 3 files changed, 4 insertions(+)

diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
index 35f358e70bdb..da23b8347e2d 100644
--- a/arch/riscv/lib/memset.S
+++ b/arch/riscv/lib/memset.S
@@ -111,3 +111,5 @@ SYM_FUNC_START(__memset)
 	ret
 SYM_FUNC_END(__memset)
 SYM_FUNC_ALIAS_WEAK(memset, __memset)
+SYM_FUNC_ALIAS(__pi_memset, __memset)
+SYM_FUNC_ALIAS(__pi___memset, __memset)
diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
index 687b2bea5c43..bc73325b2fd1 100644
--- a/arch/riscv/lib/strcmp.S
+++ b/arch/riscv/lib/strcmp.S
@@ -120,3 +120,4 @@ strcmp_zbb:
 .option pop
 #endif
 SYM_FUNC_END(strcmp)
+SYM_FUNC_ALIAS(__pi_strcmp, strcmp)
diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
index aba5b3148621..b36325a57f6a 100644
--- a/arch/riscv/lib/strncmp.S
+++ b/arch/riscv/lib/strncmp.S
@@ -136,3 +136,4 @@ strncmp_zbb:
 .option pop
 #endif
 SYM_FUNC_END(strncmp)
+SYM_FUNC_ALIAS(__pi_strncmp, strncmp)
-- 
2.45.2

