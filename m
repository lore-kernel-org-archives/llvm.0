Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A0D1392
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 21:10:10 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-2fedd52e3c7so47022957b3.15
        for <llvm@lists.linux.dev>; Mon, 16 May 2022 14:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=gJH2vNlNQIo9Al56TVOkq6UollYkHvbAT4XCJVkzPlo=;
        b=q8K57O1NPaavHFGg8uevoHd8vdNfGOvgh5pa5KLXfjH6qslBYym5QnuEHVweXdP12g
         z6txr4GPWzThnSCbUR1Orzix+VGdmbg0HPNmI2AuqbeGHQX7Z0AkjtITu67cNr1l+0jC
         XkhOp95c5xWDmHOByjvnElyeG9S5e4uHfneDqEY8KNrD3QDyEZE34jzN/5MiJxTf+Qmb
         7NulqRHaMKEATCJL4wIHfiBsXD7osQCwMOrqbtPOK2maO8352MdpFqyf8uLLu9iYXjAC
         YsKgZ+iz4mWWqQfSBbQH8PkBBmd1FA0Xgc5Se+YF86Ca9/poFTbVnlz1hqbkifIXWyr0
         rVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=gJH2vNlNQIo9Al56TVOkq6UollYkHvbAT4XCJVkzPlo=;
        b=CZ3kSRvmHYQiyrcmRA2bcdeCKxldpXE18t/Gj8HWp4DAM+b0IsYBJyloXJiqijCjtI
         Uc2CxkyoflUNDeSjHjjykywagubREQTymrkAKhK8aSyUXQJVjHhVdNdhhL8srGcNGvvb
         LZYe/u/XYbwymaU4gfWHc5kviqX7sbKMm4TQ4xG9muVxEUYc4p8gC/KWeWehrI4ywPHn
         8GcNOcFzQPy9FDX/I0Dnd6Lyt6DYNNcCE4mmQt554f41Nk+wk5CotNjOnf9dDL1Lgx4w
         QjFnPLZ7L8t//2VoZw5wVAq0VWtwh2wbuXC9f+rlR1i9MIskLebIP732MHChpYifXCQl
         X03Q==
X-Gm-Message-State: AOAM531gdXZimD6ZZ2SrOKKqj698EWYd9o+B+96o1v0Hujtkv5Ys+Wvx
	2RGGM8/Usd2dROAmfGAIpKFwr9Iw9QDj19m+ilY=
X-Google-Smtp-Source: ABdhPJyCTvkarlEdqOvsqNv4kNm1LQOPAQvPW5Wh+33cc828J7QmhJc760oZpsnGrmxMB0MDS1kB3BoYZFYpEhJuP8U=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:2ef0:b8de:b9c8:da45])
 (user=ndesaulniers job=sendgmr) by 2002:a25:54c:0:b0:64d:69bb:e090 with SMTP
 id 73-20020a25054c000000b0064d69bbe090mr12087349ybf.429.1652735409881; Mon,
 16 May 2022 14:10:09 -0700 (PDT)
Date: Mon, 16 May 2022 14:09:53 -0700
In-Reply-To: <20220516210954.1660716-1-ndesaulniers@google.com>
Message-Id: <20220516210954.1660716-4-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220516210954.1660716-1-ndesaulniers@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1652735394; l=938; s=20211004;
 h=from:subject; bh=T9BSmoUTZZ/l/4cKzU/17oPppOyCGzetEds5NOZIrWQ=;
 b=8FrOhkyvfC7vArFsPvAnd24amfcR4JlfF0QbPfyYrJ5dNOBuwKcXRFBPcYEjIvovyC8NaU6XW8kg
 0rstkQerBW6KdT7Rc+cTUyjdSir5seoBM0spKRrjhKOvZ+34H6kG
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [PATCH v3 3/4] ARM: only use -mtp=cp15 for the compiler
From: Nick Desaulniers <ndesaulniers@google.com>
To: Arnd Bergmann <arnd@arndb.de>, Ard@google.com, Biesheuvel@google.com
Cc: Russell King <rmk+kernel@armlinux.org.uk>, Masahiro Yamada <masahiroy@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

Avoids an error from the assembler for CONFIG_THUMB2 kernels:

clang-15: error: hardware TLS register is not supported for the thumbv4t
sub-architecture

This flag only makes sense to pass to the compiler, not the assembler.

Perhaps CFLAGS_ABI can be renamed to CPPFLAGS_ABI to reflect that they
will be passed to both the compiler and assembler for sources that
require pre-processing.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/arm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 99a7ed7e9f09..1029c2503aef 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -108,7 +108,7 @@ CFLAGS_ABI	+= -meabi gnu
 endif
 
 ifeq ($(CONFIG_CURRENT_POINTER_IN_TPIDRURO),y)
-CFLAGS_ABI	+= -mtp=cp15
+KBUILD_CFLAGS	+= -mtp=cp15
 endif
 
 # Accept old syntax despite ".syntax unified"
-- 
2.36.0.550.gb090851708-goog

