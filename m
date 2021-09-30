Received: from mail-qk1-f201.google.com (mail-qk1-f201.google.com [209.85.222.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA67572
	for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 18:06:06 +0000 (UTC)
Received: by mail-qk1-f201.google.com with SMTP id q10-20020a05620a0d8a00b0045de482ae16so14259110qkl.12
        for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 11:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=QXcVEtkl1ttQdqJQ36Mmw2BuBwRi/4y7WfQWoHeDQYQ=;
        b=YIvuqa4diHL/KOdonWT+XrXNn6ejbmYGrxpcq6tHonqWDd9wLeV2kwwd7/MnZkZe+o
         s2KOkSSO2fNwJF71waRq3eGAH4t/zuBbUl+XNk9E9a6TngigsVIeZe5yIU42XiSqwlo8
         HQ9xPg9wLyxcZETOfRH6ThiR7EGl9OmCGOW0Fy7NxiJTbRGoINKW6TqXqmjsD6Gjlfn/
         1A8wRMJIuH+s8jB6UrBBIYr1tJxFMfIp51clrm1Ltlh5lxhL31MVFlV8m5jJB1qsC5Bz
         y30kNX8VS2C21viJCJ3iLc/AywLzChE7HO7BQ8g0EW657HJlc44Icfo9Td2j2D5Ps4vu
         t4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=QXcVEtkl1ttQdqJQ36Mmw2BuBwRi/4y7WfQWoHeDQYQ=;
        b=FAQ+vohBi2C4h8ujiA1SWriFtRiugbIVDGoCTCatGE44cIMbsF0MvJBR+kjQxskdyK
         y+6IBa5CaM9QZdh24LRa3L14AzAVGiL6/8ZURG0QbwUZvXPkvD8qHUTPo5DoqukM79XA
         O2EyeigM4FMyqX4nIupuDDXsQDh7tHDQPygsF/esuheSKm0xrnfC5lKTShOo0pNy/jTW
         M1tSRxnpQB/pHKXfZFpLWApysr6iWf3LE3hm8KnYFxMwkqzJx19/DfRR9ydleEBbYzyT
         EglHagqIaaiWjPWfmnj4C6H+GEp71tXZbEXrlbfxNXqZhQJqcg7n/AjhDEvU7SLkjjnK
         RaOQ==
X-Gm-Message-State: AOAM530NmQkw6lHEvO2X08/PylWmvFg1b/pzYlJdyNI0Ar9buMKGdJfq
	IJ44Ni3IIDgbV2p3ojVL1BWNAuQnvbCm+c4hilc=
X-Google-Smtp-Source: ABdhPJwOEaXh89+R/H7MBRz5M9c3ZhPc6Z/jeTX/U7qPBoq+FlxU6J4n+Dxg9mzNIkwXfswiN5kgdhWujNpQQLRVsnA=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:ce43:4366:95ca:d6e9])
 (user=samitolvanen job=sendgmr) by 2002:a05:6214:122e:: with SMTP id
 p14mr6685928qvv.37.1633025165880; Thu, 30 Sep 2021 11:06:05 -0700 (PDT)
Date: Thu, 30 Sep 2021 11:05:29 -0700
In-Reply-To: <20210930180531.1190642-1-samitolvanen@google.com>
Message-Id: <20210930180531.1190642-14-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20210930180531.1190642-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [PATCH v4 13/15] x86, cpu: Use LTO for cpu.c with CFI
From: Sami Tolvanen <samitolvanen@google.com>
To: x86@kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Allow LTO to be used for cpu.c when CONFIG_CFI_CLANG is enabled to avoid
indirect call failures. CFI requires Clang >= 13, which doesn't have the
stack protector inlining bug.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
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
2.33.0.800.g4c38ced690-goog

