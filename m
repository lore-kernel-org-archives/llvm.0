Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A877E
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 20:56:57 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-31cd7ade3d6so24389037b3.3
        for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 13:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=QUqpeU8M4eT15MSqD/BnartlfIY7kCYtJMFstSRxuF8=;
        b=NyEeYk2hC69eFMaSk0Josx4oxWR1Fw4LfEAYWwZxyp575imGZDYXhsKWYy50e9F+Bo
         YGPxB9QU2iqkEiA6h7gMhlOK8fFpLRXEijEBPs9FQPw7rG1KQvyXn4LMsrSlfjCrNlIl
         2xgTGZfmTH0qM41NM9B2AujqAAzkK5KughTx8Aaxh/IJ8kDoLigS5lb4bVYCEaHmjb0V
         y0HTyc71eCPL3GlhFvxZ5CvHY88UH3w9Lv4+lGItJEUhk/2QcAbUhJ2sex6rz5Q6oxgH
         ZqrqciQ8psIEwofly+ywHyNrweQKgL9dgQ7LRsKFe/wm2cHmJkhw/TQCRCSUYm49RrEQ
         M7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=QUqpeU8M4eT15MSqD/BnartlfIY7kCYtJMFstSRxuF8=;
        b=bLttTCBEnmoXGoV4yP8Mt7hfv1hrltiLP+h3VmRK/Blr+7HBHe36HG2AkSaOnEfg6C
         ufYLiV1VetOhmSm+sAzHCfdgTycndqjpXnsH78tggpasz+DcTI1PnTRGyyz0MQJLLwF+
         nsS5CIW0hJRaMQGcvo+h+gWJ1FZ762hmctzQyC422CxGRRIiRlMzAekjzXicujERwBnH
         biIIUTAkpJc0M3z5nDHChFidZIPs5NxNnuN28iPzO3nczpAK0NqUwroCsafRboOXBB80
         DI1+5PQRldhE9Sqcck6PDh2owTD3/y5dTL+n12JPzg6On8OpD8i+GjXAe3PIUdDOpCM4
         PEhA==
X-Gm-Message-State: AJIora81sL8UIl4zEX39UM4CTiRLceQrBQZ940bXh2ovkJb996XvB5hK
	HzznvQ2NZ+S0yZghnxASF3DK3EyEgMVpv8FAEY4=
X-Google-Smtp-Source: AGRyM1vmKTM1FaMh8eU2urAb2+GraZv12lCqQp6YihgU9kbN0pGejEVllwkey8v+ez9pXys1HIiTU3tYEB6dltut3lA=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:4bc2:7a2b:c53a:2dfb])
 (user=ndesaulniers job=sendgmr) by 2002:a81:4a0b:0:b0:31d:b645:84e8 with SMTP
 id x11-20020a814a0b000000b0031db64584e8mr12085251ywa.239.1657832216295; Thu,
 14 Jul 2022 13:56:56 -0700 (PDT)
Date: Thu, 14 Jul 2022 13:56:43 -0700
Message-Id: <20220714205646.4023495-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1657832203; l=1877;
 i=ndesaulniers@google.com; s=20211004; h=from:subject; bh=Y4sBF3AutOxiL+SHsVeEMPpQpIermTXH5kEyp1GPq6s=;
 b=xAaXgfs85FDQXD5OVaEIdThMCupKgeKa7r1xcwZp0TJeZ/wzFgnNld9VUOf2smHAxawT1Tl+RB0i
 41zv0RrbCoTKsJJu944BR/UI3/BuEGBX+ihO/SpLluzyQ46i8YUm
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH] ubsan: disable UBSAN_DIV_ZERO for clang
From: Nick Desaulniers <ndesaulniers@google.com>
To: Kees Cook <keescook@chromium.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>, Marco Elver <elver@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Building with UBSAN_DIV_ZERO with clang produces numerous fallthrough
warnings from objtool.

In the case of uncheck division, UBSAN_DIV_ZERO may introduce new
control flow to check for division by zero. Because the result of the
division is undefined, LLVM may optimize the control flow such that
after the call to __ubsan_handle_divrem_overflow doesn't matter. If
panic_on_warn was set, __ubsan_handle_divrem_overflow would panic. The
problem is is that panic_on_warn is run time configurable. If it's
disabled, then we cannot guarantee that we will be able to recover
safely.  Disable this config for clang until we can come up with a
solution in LLVM.

Link: https://github.com/ClangBuiltLinux/linux/issues/1657
Link: https://github.com/llvm/llvm-project/issues/56289
Link: https://lore.kernel.org/lkml/CAHk-=wj1qhf7y3VNACEexyp5EbkNpdcu_542k-xZpzmYLOjiCg@mail.gmail.com/
Reported-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Linus,
I still think we should add explicit checks to gaurd against divide by
zero.

 lib/Kconfig.ubsan | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
index a9f7eb047768..fd15230a703b 100644
--- a/lib/Kconfig.ubsan
+++ b/lib/Kconfig.ubsan
@@ -84,6 +84,9 @@ config UBSAN_SHIFT
 config UBSAN_DIV_ZERO
 	bool "Perform checking for integer divide-by-zero"
 	depends on $(cc-option,-fsanitize=integer-divide-by-zero)
+	# https://github.com/ClangBuiltLinux/linux/issues/1657
+	# https://github.com/llvm/llvm-project/issues/56289
+	depends on !CC_IS_CLANG
 	help
 	  This option enables -fsanitize=integer-divide-by-zero which checks
 	  for integer division by zero. This is effectively redundant with the
-- 
2.37.0.170.g444d1eabd0-goog

