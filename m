Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D7672
	for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 18:17:33 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id s66-20020a252c45000000b005ba35261459so4102449ybs.7
        for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 11:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=NLRoIZHIP07xVaQxZ/Th6ra9+3RRZlDKsNZoVY8HRkw=;
        b=sQ9nG9JWWa9Mn97zg9W9ZToGFaIJ+2096eP72oFROHBdWmdU++QLmNkakZgzAhGzJI
         l6VU4DnehIZi61j+bqVrQp6NIU4IOVz+4lFXgddoeQjjJSQZaY4Edt+/4VnpBIfo5p2z
         ij1YdPs5vzTPQbblRpk/dLZ3/7es3995ybY4KCiZyqsh1kcsvvqK9dJudhqjOG/NESe0
         AkhoTR8IwyxPR3LhIcRE1AfA4c0IjmquY9kD0B25IuAhnttXbEHgTDC5vlogLV0M93AM
         4xOJeVFJN8JWaglbFKxv5w7Ttx8GMWD/b9W/6V14TuRAWP7OiNnlijLg0oXPHz3Tpnsi
         Wu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=NLRoIZHIP07xVaQxZ/Th6ra9+3RRZlDKsNZoVY8HRkw=;
        b=QmGUJFwnDR6ZX8yKSPqKCxYxc2LldkSkIQ1I0jTRwtS8Hi33QDtFJ+qAimXfuJ/myi
         ikr3QC5VE/9uwh3Vfd8tusIkf2jTZJUxBauWQGm0Py5UG0fvInO7xUlu12dahVb3CiFM
         CUYTCPuzOfskEtyhNFPp0+oYnB0dByWQilj9+XWeqGvjRyOh66xP5VYalaz6mJ6qXS/b
         Cudpve2Wzp1jwOpkAQ9AVJe1s7ROvapYs4uYB3VBpjcX8N+q0W8GJPj5n80CKmoQAqhu
         L8zGN3ME4oUvBbYZGzrjbikBnuv+9Ac6Yt+hq5P0YHl2Rh1cj3DE8j/6iG8geN3slIzq
         J/OA==
X-Gm-Message-State: AOAM530WkoIEo4HtWG9yTVcKjS3k/rEo8nScpQ9AqMvqSiE+VjHByQAj
	PFCIhDUyygf3i7KZiamLrHQ71NYINR7IfuERP1w=
X-Google-Smtp-Source: ABdhPJxxwA0QAFoSJFmxMJVo9O5lXkV6PkXGEUhUNY0e3KZZDPZAgK5Eup8ThmkRmda4JlzpF43HiVY2FVug05najQ8=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:9ea6:6c27:1876:926c])
 (user=samitolvanen job=sendgmr) by 2002:a25:b790:: with SMTP id
 n16mr917302ybh.395.1634149052151; Wed, 13 Oct 2021 11:17:32 -0700 (PDT)
Date: Wed, 13 Oct 2021 11:16:56 -0700
In-Reply-To: <20211013181658.1020262-1-samitolvanen@google.com>
Message-Id: <20211013181658.1020262-14-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20211013181658.1020262-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1165; h=from:subject;
 bh=cWgW7c++4rTsWL5fNfmGI8mvplNIrZThQL76GT9fg04=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBhZyKaCYCUH7T+fWoNdx2QCDRdr+KfWhTjVE/9EB9M
 oD6hwNCJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYWcimgAKCRBMtfaEi7xW7qhXDA
 Cc8MvkJ9dETn63gZb8T2sHkjmWGrk7/WGznHUsqwmQG+VZA5JcCeAh9+c5wesuJXP9BqacwjdRKKSj
 56XBWu4BovM5i7dniaLFJq179rRY9/YlknjUBgAR1sMDvpHbQM0wYBlTSTsSwqXgM2rUulhLu2H9+c
 TbjBHDXtalxCYUpP/wQgDOFX7J0PwRpHUb4hGKfFuf51FaLAOQzNscIT0JPD9DZ8KMS4tVwR1Ulziv
 xPJQ1REeLX96kOtZq5doOqPR6h6EWpCs2SnCiTdFCuFNnfwxJoLpFZlL3JGQTDhy8SlIZygC/SN5rD
 6FASRz6UJdPQ21fZNHoRizyKcPIE0Iec9NimvjSTAkOv6N/h/+WUTc5Bcgr/hM/8uJzEuIuf0iCGUO
 5PVAb8WHGpPCH/GhTfKy9a1qeufVESBFH+hf3G3l4PqhLaM0H6ee1eXG92/lQ8gmBuDVYuqmenjL+R
 UNmMhCzNAsGzLX49wnTGk7jqkHv93ooYfVDgfgySqKF5A=
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v5 13/15] x86, cpu: Use LTO for cpu.c with CFI
From: Sami Tolvanen <samitolvanen@google.com>
To: x86@kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Allow LTO to be used for cpu.c when CONFIG_CFI_CLANG is enabled to avoid
indirect call failures. CFI requires Clang >= 13, which doesn't have the
stack protector inlining bug.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
---
 arch/x86/power/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/power/Makefile b/arch/x86/power/Makefile
index 379777572bc9..a0532851fed7 100644
--- a/arch/x86/power/Makefile
+++ b/arch/x86/power/Makefile
@@ -4,9 +4,11 @@
 # itself be stack-protected
 CFLAGS_cpu.o	:= -fno-stack-protector
 
+ifndef CONFIG_CFI_CLANG
 # Clang may incorrectly inline functions with stack protector enabled into
 # __restore_processor_state(): https://bugs.llvm.org/show_bug.cgi?id=47479
 CFLAGS_REMOVE_cpu.o := $(CC_FLAGS_LTO)
+endif
 
 obj-$(CONFIG_PM_SLEEP)		+= cpu.o
 obj-$(CONFIG_HIBERNATION)	+= hibernate_$(BITS).o hibernate_asm_$(BITS).o hibernate.o
-- 
2.33.0.1079.g6e70778dc9-goog

