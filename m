Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F172F80
	for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 23:41:03 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id j4-20020a258b84000000b005a203c5e066so4527851ybl.19
        for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 16:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=YcybJ36BhVQqnQ/Zp3BgBUwuPlp4Dytcf9sCPFcMjQI=;
        b=YgJpLsayXI0kRA30Qyay/Kq/6VBc852ZzPTDo9EzTjJTNtF9D0UVBAUgqY/mnDPOl+
         pGTUFD61EqoICDCAXs//AXw0PdPDQ06DEbrW0h4xmAfxhA1egiPkgqeuA7aKa8DqjerJ
         PkrJtScmhKJbvHhlEWfI0lnnSj1rsD/G/nSp5hmtW+wkXtRhBg9B1Pr1u9QjmvKsjABP
         4t5hd33qwRgzZ8nO7gWCYz+rmQJH3tPDL9uozMFUhmmG0u0lAtZvjl2tiHD4Tt+my1V7
         m0LFoef1gwGQFGCuSx+R+cF4s5MbzwcLeEGELfhig5F8S/YsXDwM6cw+dQEFKnbIgIYN
         tP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=YcybJ36BhVQqnQ/Zp3BgBUwuPlp4Dytcf9sCPFcMjQI=;
        b=JSvo7Td+YuXA1v6hH5vGSu5PiqO3aK6ZD/muWQ6HppVinmZwxbFQNPzTaFcWch2uGI
         7aqPrrodNLmVDpqLEP3YSmDw7GRa5NPB2KuZbj+Zgj9WgKtKyvMlApI4WmqEueeVAjEu
         YZLaQBxB/uDfJip4nm0CDkhsK2phO9/7G3u6pfm2NnSDoVU0leKT9qappFso7H54Cq6f
         3CCmZt4yhA+BJMgmClBlicNq6HvVDcSmLyjmBvQqk6rFVuH5aDcg0NhgL7wK6/zv4zWx
         B8uHPXK5eoep2oWQUB3jhFatN03K7luyYhxMKY6PJ4kqiQz8CmWrW34dLN+wS341kkwL
         HD2w==
X-Gm-Message-State: AOAM531y71SnrXqK1ZpBNqhDyZ/9OUcjQlvxLrqa2tSd47u/Va0udgc1
	7pN7GTqeuTOQXIxrSqgjD8p4Xn0Vf1LL9Xg1sg4=
X-Google-Smtp-Source: ABdhPJw0Jp3nHTv3ruhAHm4RkeseXcb8gI25D2fzseDBVW5d8S8nqZvDZTYEl37UNWxcGpM+JEUlWwmPxuiXFe7eVe0=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:2b76:71d3:b5fb:3734])
 (user=ndesaulniers job=sendgmr) by 2002:a25:2302:: with SMTP id
 j2mr315979ybj.507.1631317263067; Fri, 10 Sep 2021 16:41:03 -0700 (PDT)
Date: Fri, 10 Sep 2021 16:40:42 -0700
In-Reply-To: <20210910234047.1019925-1-ndesaulniers@google.com>
Message-Id: <20210910234047.1019925-6-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20210910234047.1019925-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: [PATCH 05/10] riscv: remove Kconfig check for GCC version for ARCH_RV64I
From: Nick Desaulniers <ndesaulniers@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Nathan Chancellor <nathan@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

The minimum supported version of GCC is now 5.1. The check wasn't
correct as written anyways since GCC_VERSION is 0 when CC=clang.

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c79955655fa4..5fc1d0cc82e1 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -235,7 +235,7 @@ config ARCH_RV32I
 config ARCH_RV64I
 	bool "RV64I"
 	select 64BIT
-	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128 && GCC_VERSION >= 50000
+	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
 	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatchable-function-entry=8)
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
 	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
-- 
2.33.0.309.g3052b89438-goog

