Received: from mail-qt1-f201.google.com (mail-qt1-f201.google.com [209.85.160.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E5A72
	for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 18:17:37 +0000 (UTC)
Received: by mail-qt1-f201.google.com with SMTP id 100-20020aed30ed000000b002a6b3dc6465so2682777qtf.13
        for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 11:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=odWUCzELK8O06v4rgAnqn7QfSrw6bcxGsZOkEiE3yxs=;
        b=T8mfk6a/BVjhAIm+TTzj9BsOJLGtqn7Xmh6TnxguTLqc5eksMPiI1rRsouAKOAZZEv
         9IZexIvnVbZIwtmssMcG4cUdKaEQK4iU7BoaedaOfRdSlfaCmRCCk9okijggE4F8VMIo
         iyhu6MKyD0MAOFapZirwpCKCsp8VCuZ2s5BwOjxQhhAEQRaSEVl0cBQzQGlWNzcMujGd
         h+Ji+J4E/uyxkjWTn+nroxa7yw+WIUlT286H0tkblGSlnVtIIughgHwoNOyjDqYArutp
         uJye0tk9chLAQBr2hXgjiwWYlTVFnFjzh9vatF0kyYiDs+ikusjXkJFaeBxyH/ZZ5z0V
         ewkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=odWUCzELK8O06v4rgAnqn7QfSrw6bcxGsZOkEiE3yxs=;
        b=DVyI5wJ2IvaCwla+iSz0Tt/GX7/UsDPJ5fw8cI0lnkWxm4HKW+MGrzh5qdgi4FO5HJ
         SXxDJk09yZoFmW/QrA9Hahc4RNUsOkd3+IVnLR2MaGwAwc/dOT98DZ7zEcOUv+hU2tfJ
         QhDUoSYwV6IVVy0NmbUHW14/qdnR8ZOzp34+6mUI2q1tHTXVfV336xYxkepaoJXdEDk1
         +gTL9H2WiNFW8Q0ZhQ7MxOMbtnAZOj17sLm+AEYt9olLyaNs/rpLjryO+ccNjREe8VbJ
         owYUv+/yVTG34lUiKlKK43Bp5MPRVJ74HaWVx624S/dY/MCnBD4SlI4IGu+yZ4+8Bpyt
         AV7A==
X-Gm-Message-State: AOAM533OB/fpHfRZNf016flWWMrvkSOOnw1CSUSQZ93s7BpPaOqtLW16
	yrPcYd0+UKYGQzRmsj7AEF8UEeilDOli3Zp2DZQ=
X-Google-Smtp-Source: ABdhPJzoBvz9uRB/5XtKrSVxidJedwzVIrcBFBa2Xmp+3T3pEjgWjxcC5FxihILY6d8dZXKASllMZp5d/IDEIRTFg/8=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:9ea6:6c27:1876:926c])
 (user=samitolvanen job=sendgmr) by 2002:ac8:5ac9:: with SMTP id
 d9mr1078571qtd.136.1634149056447; Wed, 13 Oct 2021 11:17:36 -0700 (PDT)
Date: Wed, 13 Oct 2021 11:16:58 -0700
In-Reply-To: <20211013181658.1020262-1-samitolvanen@google.com>
Message-Id: <20211013181658.1020262-16-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20211013181658.1020262-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=864; h=from:subject;
 bh=0yCPcS9wePai6S+o7jrbmHmxOFPxYhJtUyM9GzzoYQQ=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBhZyKaXaEzVzl9BeZkACcM57288N9ZbVGe2BZJRDPU
 Dg0io0SJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYWcimgAKCRBMtfaEi7xW7j7KC/
 0cVPke3fQulMZ2+Xd7Hy7IH1S8JKE4lOZ14lgY15tXviG/OPlovK/8knZaeX+9fpJluEu+X805OC9S
 RB9Mbe7PAvEkNZ6Wtc/I9OGTusZBobuUUjGGfap8/s0OiJA2zfUyP54CgTZ12Z7+F3BFt6kmSdihAx
 oySFFednh0yF/kOba641U3nLXqhI0kJdEDwnFI4VGyI5GmxOMq0P+mVDZpAXeu6k6NxllhDEfVfOvm
 0RqjG15tpRa9o3LdldCMr7GDseLTw5M6CT2TF2QxG3H5/oKK9uz2CEpUtIKlG0RIP5yqMfD//q8Whs
 g5fviSHDDVj1SCrVMFrcuamfjQ3ETPl7qAaLNpMxLrwLxkI6RpvBLKGCfMCg6YPWNNHA4KkgyuZwpS
 yO04Vpf7/oKpl8qqa8GhsadQYiUIqGrfbaI2sR/UKedwHvk2TG00yjDXzyh1TeRTDMT4HuKd5SAqKJ
 mNL8WdNDtpbAzwMhrXNK3DAFjvNLS9TnVIFw7FpLjOlIA=
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v5 15/15] x86, build: Allow CONFIG_CFI_CLANG to be selected
From: Sami Tolvanen <samitolvanen@google.com>
To: x86@kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Select ARCH_SUPPORTS_CFI_CLANG to allow CFI to be enabled with
Clang >= 13.

Link: https://bugs.llvm.org/show_bug.cgi?id=51588
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
---
 arch/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 47023166fb7b..1f310cc4e344 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -107,6 +107,7 @@ config X86
 	select ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP	if NR_CPUS <= 4096
 	select ARCH_SUPPORTS_LTO_CLANG
 	select ARCH_SUPPORTS_LTO_CLANG_THIN
+	select ARCH_SUPPORTS_CFI_CLANG		if X86_64 && CLANG_VERSION >= 130000
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
-- 
2.33.0.1079.g6e70778dc9-goog

