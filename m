Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADA23C37
	for <llvm@lists.linux.dev>; Tue,  8 Aug 2023 16:15:47 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-d4cbf6b593bso3519991276.0
        for <llvm@lists.linux.dev>; Tue, 08 Aug 2023 09:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691511346; x=1692116146;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TnSrdQhDNrVuprB4dmCAsDjMsMYddVJX219Lp3rcDA4=;
        b=lGb2f/YOrRiylaHa5jpIHSBS+5gA5f9jpHu3Fs4EZiccyfbMg/CaCeE8DhUynu/rGT
         VmYeHn49llYsaiyBEQqQe1dUMWxGuFckQm3kWv4vkbsrJGQsMz3Ckdy2t8B0Dh/pRS43
         fgbcCCuWrmqm9uSfgb1zVZnFO7ngzgx5nghrRNrw/wDWXnwzuX/V11XAG0oL81XBChlS
         G544+98xi7aoiiJ9ERzUMnbOLMoKHWJxE6Wkp9O9EvLLGzNPrSAOCAef1/OkHzzokV3m
         JEmo3u28Mb16KgtXBmMVtSfYOj0kq5TWmKNz3I0fGc6qdVkeueXO1Dg9P+ZoF0WTHQQp
         aWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691511346; x=1692116146;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TnSrdQhDNrVuprB4dmCAsDjMsMYddVJX219Lp3rcDA4=;
        b=CAWxy7yCTkrgCtsYfqrS4heEryFO79l2QKn0wZl6ujBv/Thzsnis4eTafGJ2Ve6y5f
         lRNjdGPVokA9+nycdyz7JimcymzST2ckbxvolhEd3+26+wxC2nb2ZOPwcvHZdgs0ZtIh
         D5ChhW1PRZ//HteH9EOLLiw5HMUIL4mZOxWNj19UwV5iFsyvPgqmmjYYtN0euygycpIc
         3WRpH+sbJeYUT8s7fAmJVas96UUB3Ly8/jRBYoY2pb94M7W6pT3peNLzQlbDkbjz7x/Z
         EkMnIA5gR9mlvayeqqBxEpkZwwmJdoJKCv1oyZwCJD2uFCZqLSAoRRbmP08ZoFUP6+7K
         v/MA==
X-Gm-Message-State: AOJu0Yyc9JQHpeLA1JOGXXHSMmhP6rlMkzA/Q3EqssQTKy82/X1PO4R7
	wpM3H2pPiE0G2vwGdlT/MfWI/0TCGV96RR8garU=
X-Google-Smtp-Source: AGHT+IFzw3XfVup6/Nd5arFwnbPOQFKanM9ycSejCqWWghCoNzZ/FVOGcmzxLFgWJCmUx1XSz2nnLAETGykiQrk7mo8=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:cc03:38d0:9718:e90b])
 (user=ndesaulniers job=sendgmr) by 2002:a25:ad22:0:b0:d47:5cc3:9917 with SMTP
 id y34-20020a25ad22000000b00d475cc39917mr583ybi.9.1691511346524; Tue, 08 Aug
 2023 09:15:46 -0700 (PDT)
Date: Tue, 08 Aug 2023 09:15:41 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACxq0mQC/x3MQQqAIBBA0avIrBMso6SrRIToVLOxcEQC8e5Jy
 7f4vwBjJGRYRIGImZju0NB3Atxlw4mSfDMMatDKKCMjscs7J5vIST0apSf0zuIMLXkiHvT+u3W r9QNYoC3/XgAAAA==
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691511345; l=2795;
 i=ndesaulniers@google.com; s=20220923; h=from:subject:message-id;
 bh=OcqNn5LCQ+EeTr3I1uAMbj9TNMj6ZOz+MyHLIDJSuyg=; b=2dRkXEmD8MwFmG9EeCYKF4DvAZZlYRfD+3DQ4f7W/a7WckgZ1aqSRxlVlqw5pfqOnsKxPKS2t
 TioJDco+hDfD3CACC3aD1jROlwVSW5FX65NkMx9sSTL+J3KoJQpam3O
X-Mailer: b4 0.12.3
Message-ID: <20230808-riscv_static-v1-1-9f3dc99dafe8@google.com>
Subject: [PATCH] riscv: mm: fix 2 instances of -Wmissing-variable-declarations
From: Nick Desaulniers <ndesaulniers@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="utf-8"

I'm looking to enable -Wmissing-variable-declarations behind W=1. 0day
bot spotted the following instance in ARCH=riscv builds:

  arch/riscv/mm/init.c:276:7: warning: no previous extern declaration
  for non-static variable 'trampoline_pg_dir'
  [-Wmissing-variable-declarations]
  276 | pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
      |       ^
  arch/riscv/mm/init.c:276:1: note: declare 'static' if the variable is
  not intended to be used outside of this translation unit
  276 | pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
      | ^
  arch/riscv/mm/init.c:279:7: warning: no previous extern declaration
  for non-static variable 'early_pg_dir'
  [-Wmissing-variable-declarations]
  279 | pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
      |       ^
  arch/riscv/mm/init.c:279:1: note: declare 'static' if the variable is
  not intended to be used outside of this translation unit
  279 | pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
      | ^

These symbols are referenced by more than one translation unit, so make
sure they're both declared and include the correct header for their
declarations. Finally, sort the list of includes to help keep them tidy.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/llvm/202308081000.tTL1ElTr-lkp@intel.com/
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/riscv/include/asm/pgtable.h | 1 +
 arch/riscv/mm/init.c             | 9 +++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 75970ee2bda2..4c8c0f83a974 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -188,6 +188,7 @@ extern struct pt_alloc_ops pt_ops __initdata;
 #define PAGE_KERNEL_IO		__pgprot(_PAGE_IOREMAP)
 
 extern pgd_t swapper_pg_dir[];
+extern pgd_t trampoline_pg_dir[];
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static inline int pmd_present(pmd_t pmd)
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 9ce504737d18..cc0e06b4f223 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -26,12 +26,13 @@
 #include <linux/kfence.h>
 
 #include <asm/fixmap.h>
-#include <asm/tlbflush.h>
-#include <asm/sections.h>
-#include <asm/soc.h>
 #include <asm/io.h>
-#include <asm/ptdump.h>
 #include <asm/numa.h>
+#include <asm/pgtable.h>
+#include <asm/ptdump.h>
+#include <asm/sections.h>
+#include <asm/soc.h>
+#include <asm/tlbflush.h>
 
 #include "../kernel/head.h"
 

---
base-commit: 14f9643dc90adea074a0ffb7a17d337eafc6a5cc
change-id: 20230808-riscv_static-348036edcae7

Best regards,
-- 
Nick Desaulniers <ndesaulniers@google.com>

