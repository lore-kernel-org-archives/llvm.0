Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3004EA52
	for <llvm@lists.linux.dev>; Sun, 10 Jul 2022 07:11:21 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-31cb93cadf2so23047697b3.11
        for <llvm@lists.linux.dev>; Sun, 10 Jul 2022 00:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=yAMjD7bFyIwsVP6jYrt8xQond+JqwS9zkIdAHuIkxN4=;
        b=liUn+rKXpXfrSoXvO27l9hLOj7oo5CX3m8yhnF3O8Uo0ba67YaoDhrup80Hbcz/pZt
         3kEuSGbXJ20Wjh0GYHTqFpZtKEZTJfIOo6ThgYoOEp2lTm2OD1kiiQOE5AlkPCIb7FhR
         Tgr1uBsd4QNXfMDjRN98RrNJXH2RxHP4DsVvOShzHxsugmZFmGMPWkmfqWEUF6RLrBlh
         cvl2b5KOOrsYKyDUTpPB8jei5OI4Mvz7jOa92WwuRm+EyFtKNtzWbal3Xi9gB2ZoXySc
         /UwtJaMhzidFnMAMzLeSU447Q7mJxgTTUU8bSkvqarH+A4jBk0DqFjmT0m4eHC3F5Kka
         kbrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=yAMjD7bFyIwsVP6jYrt8xQond+JqwS9zkIdAHuIkxN4=;
        b=25+8n1w8NHDIdvlYtOajui2mu2ZIuMfvLqAbgMfa0iQH4gWx71afZmT3osx0xjmDBk
         2vnFkFekqxB6HLSw0Z11vu/KuDIefAF915GTGoCTuEmidB8vbZpZdeZ3/TWzmOIAWqCW
         oai1zdZX/n3hFJ4bZBT3DJ4q07LXpf0QoyxWy2o0xamOhK6oT1YusHU/+Od8PhqC5oiG
         f0/0P287bxo/eHBIbb6ib2hQpLCJGVXC9UyF1OXZR/eiOpLzqFu32LMr5D+yLXJzFbTt
         PrUGm1b9U9t6+qpA3UelTaVVfpp7YAfWdKbQq0IWVceKzCZ1uTdQ8VO6llluc0mdsk2+
         51aQ==
X-Gm-Message-State: AJIora+xC3DPg0gDu+kQnqcnu6cAymXa4zackADhifWN9ygGtQG176M2
	M+KeuZONTRkUthOKWdSJtJX3Iir3/9FR
X-Google-Smtp-Source: AGRyM1uY19WwEDO1WCIR2j0jrtOz0gxs4GLwPuef+3yW0ZQEqrwPS8ucUN0ZHVTBtuSCTsnBGf4HM4ONI3cb
X-Received: from maskray1.svl.corp.google.com ([2620:15c:2ce:200:1844:d82b:e1a:5303])
 (user=maskray job=sendgmr) by 2002:a05:6902:706:b0:66e:ef10:1f7 with SMTP id
 k6-20020a056902070600b0066eef1001f7mr5952684ybt.610.1657437080152; Sun, 10
 Jul 2022 00:11:20 -0700 (PDT)
Date: Sun, 10 Jul 2022 00:11:17 -0700
Message-Id: <20220710071117.446112-1-maskray@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Subject: [PATCH] riscv: Pass -mno-relax only on lld < 15.0.0
From: Fangrui Song <maskray@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: Khem Raj <raj.khem@gmail.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"

lld since
https://github.com/llvm/llvm-project/commit/6611d58f5bbcbec77262d392e2923e1d680f6985
(milestone: 15.0.0) has implemented some RISC-V linker relaxation.
-mno-relax is no longer needed in KBUILD_CFLAGS/KBUILD_AFLAGS to
suppress R_RISCV_ALIGN which older lld can not handle:

ld.lld: error: capability.c:(.fixup+0x0): relocation R_RISCV_ALIGN requires unimplemented linker relaxation; recompile with -mno-relax but the .o is already compiled with -mno-relax

Signed-off-by: Fangrui Song <maskray@google.com>
---
 arch/riscv/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 34cf8a598617..7e4ceb2a0981 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -37,6 +37,7 @@ else
 endif
 
 ifeq ($(CONFIG_LD_IS_LLD),y)
+ifeq ($(shell test $(CONFIG_LLD_VERSION) -lt 150000; echo $$?),0)
 	KBUILD_CFLAGS += -mno-relax
 	KBUILD_AFLAGS += -mno-relax
 ifndef CONFIG_AS_IS_LLVM
@@ -44,6 +45,7 @@ ifndef CONFIG_AS_IS_LLVM
 	KBUILD_AFLAGS += -Wa,-mno-relax
 endif
 endif
+endif
 
 # ISA string setting
 riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
-- 
2.37.0.144.g8ac04bfd2-goog

