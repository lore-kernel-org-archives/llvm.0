Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5449157470
	for <llvm@lists.linux.dev>; Tue,  9 Jul 2024 17:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720546781; cv=none; b=rJjSpjeQqoOm0WuYzvBB2KGQ9iqOib2ZiOObJ7Bx+DlZuEL2E5HUKHMFnyLFMrizXx0wNLBKiVW7MPZJBX2+Ac5lj2o+pB1cb39M2h92HNR6tLDEp6t/aEsWbgq1VYxZCy8eWaUK1Y1fY0XDYU3uzQkIlBeyT8fd8cfU2Ap7jXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720546781; c=relaxed/simple;
	bh=d0K/xZYfkfM7LYdV9v3IX6Evpj3aZ/O5jBSxXMFfgHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U9QNYxFrN8uSJ0S1Wh74fua8CX2912GW+K+qiDrlEiSk7XbLwx8y1xShcSy35UNHrr8pM0tKsQJdILtnwgJ0Z31J+H7kNTRW2JWs/eBgP4jfO1Zwl9r6XnQoLyFXBXA2F0CIJPFmiiiJSl1ABiNIEvUaqwfOhgWjlEh9jP59bJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=hnZcOuBR; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="hnZcOuBR"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-79ef8e0c294so275823385a.1
        for <llvm@lists.linux.dev>; Tue, 09 Jul 2024 10:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720546779; x=1721151579; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4MkRq9pJZdtUmCqu5iT1gqMbhpvrDb9DS4nLumIGatQ=;
        b=hnZcOuBR+j4XKHoZ/4owKK4+d59kZUJcfnPyhm653nQmjj2mDX4jYPVqv/bEUOTAJY
         3K8iMbiMXlFwTtE/xDxollrlRX/kuVh6m9yDOZeiGStnUSX9EPFyVf9akea+Cx28oKsT
         XHRDxL9HUEqhHYm37hL1GmJ5qY3PIpfsdUEg3ifcinpuoAQcZP6QIgQt6gbACFMIF/41
         qgKIXnLLmiuCUBq35hm7zoolSBy4Q9JaKcfk7Me2fPMKoDeE4X+sheAWn0N1OR1CILzh
         yZEeSpM82zLeju/1wCIanbi8RoLjoAcj5r04RvSz5nYEms8VSLgEievAf9YNAxXltzjn
         hBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720546779; x=1721151579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MkRq9pJZdtUmCqu5iT1gqMbhpvrDb9DS4nLumIGatQ=;
        b=uCk/kkV9HfsSGu/Q4oJ4xH793IP5a5BbqTqhh7/JLLJtDLcu1Lee8oA6739ZZtCFN+
         l34oJ4gGgTF/JNv4Wjji7mE9ned2Y7k/2UDnae4jJ/uq7YvYHoewqRY9yf1UEA3ihSci
         ql9WKXT0lpCo6f+83xqgeFl9OHntEAUW1Q+No2T0v/GImhGViXHS0uEriqLQ5RmUvyMy
         hxv4zsCY9nU6JphnCV6+1O9WlzFIBvevlfoYkojk4My+OvfqObxLCpBco2lb5fObgLo5
         ZiEaD7xWooegykldf1MsAqNYOle+IBPWJGOq3meVtRrLs/1jcmH+F8SOHMR+b9jvEzM3
         XF0w==
X-Forwarded-Encrypted: i=1; AJvYcCWV+0Fp0e8sxjrs93DSeBivOrKGNR3qWK8KRi2Gdj4ED8dTO9ATvdSK2Oey6GJp3aGk3To4ccpETRYqJFVo01X6fheJ7w==
X-Gm-Message-State: AOJu0Yzi5PLMgtGpEDuzmmSkFMW4areLzgVL2wvQ6J3GrzE6YC9DwZLc
	Jkhn6faUPru6O7WDcb3XmUDvkke8RmDYJEi0VkcbUVuY9MV2TjuPRsDn5ftbGA8=
X-Google-Smtp-Source: AGHT+IGVttz6ocCRARNPeKFY4qZPLhSqhYKVAK3N9nGYjiO1emaTxC7eUVnojkoDW25ZMQuH4lzesw==
X-Received: by 2002:a05:620a:816:b0:79e:fec7:d6e9 with SMTP id af79cd13be357-79f1b5da34amr487803585a.32.1720546778885;
        Tue, 09 Jul 2024 10:39:38 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79f18ff6762sm117547785a.10.2024.07.09.10.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 10:39:38 -0700 (PDT)
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
Subject: [PATCH v4 0/4] RISC-V: Parse DT for Zkr to seed KASLR
Date: Tue,  9 Jul 2024 13:39:33 -0400
Message-ID: <20240709173937.510084-1-jesse@rivosinc.com>
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

 arch/riscv/kernel/pi/Makefile           |   4 +-
 arch/riscv/kernel/pi/archrandom_early.c |  30 +++++
 arch/riscv/kernel/pi/cmdline_early.c    |  10 +-
 arch/riscv/kernel/pi/fdt_early.c        | 167 +++++++++++++++++++++++-
 arch/riscv/kernel/pi/pi.h               |  20 +++
 arch/riscv/lib/memset.S                 |   2 +
 arch/riscv/lib/strcmp.S                 |   1 +
 arch/riscv/lib/strncmp.S                |   1 +
 arch/riscv/mm/init.c                    |   5 +-
 9 files changed, 224 insertions(+), 16 deletions(-)
 create mode 100644 arch/riscv/kernel/pi/archrandom_early.c
 create mode 100644 arch/riscv/kernel/pi/pi.h

-- 
2.45.2

