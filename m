Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8107A
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 20:22:21 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id x79-20020a25ce52000000b006497f075e7dso8207420ybe.15
        for <llvm@lists.linux.dev>; Fri, 13 May 2022 13:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=bOpzM5rX2l4ip7yxSBZMEDJLuv66hWELCctweBJJHks=;
        b=rL/hL6OntTIlT6+vghCQAiZfUmoZf+JKLSwkZf+IrrsNgssVEJVawitmFaYY55jmBe
         amD7Eq+wsfiNCduzWZ9qsgP4L4Eaoz5WdsbalKIQn6dmzQtZSjg5Ws94G9xU2GMA3379
         ptYLd/GCT/HZYVruQu1ULOS8r60MhY8tYFWaQkLiwx/jHZy3Hv8nqZJGcbTTlO61CRHO
         Ui5viFE1OPI2iQTd8ZFgpeNNg8UIf9lxq/5l0yMHnkI4aHbNASnhtiPtCkKN6ow4/8Gy
         Buw+p+M5hlwFYUt71jzAT461tK+NYI45ChnwXdq3pjmdEybkufp0sSLOl8jFCSlKjOtr
         c9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=bOpzM5rX2l4ip7yxSBZMEDJLuv66hWELCctweBJJHks=;
        b=2exJKu8LGI0uF5ECmZ3B0KclPx1X/xm8RxvXl5qf3k2ndRM2W2LuL0NJN4Jcgl3T3s
         Bg1p5qKEGJz5Yea2xYErsmRff5hhrC8qAapUbgsFomBYQKOE6Gcd3AzIPs6qA9hVN9ac
         ElvykNRysWB/xyvBpYRQMEKzmhT7emGYvfQJhAeF7uS8TmbB+n6wfdgWQm6JYo1ZLJai
         q24rPPKmILU2OANmnXnaV3ZQCkYIXTLOW237srFH8pRZnB2dLz76xxf9Tjn1r5ipnq0u
         Gbiy/yAmwzsORQr7onP+5+k9GofU3XEGLLo6khl5HSqSo4x/NPGiLnRzvMmp4qX/aJEL
         cT4A==
X-Gm-Message-State: AOAM531IImVJVM+7I9MIyOsUfcO3hZMJhNGVsV33RQYiSNQmDOeAyE5a
	LOntwTxlpn1vBt4I9JUX2qqX0PRFJL6xQsHXOXo=
X-Google-Smtp-Source: ABdhPJwWzw5BAhCv70kXSSaCh7PhBQVVl4ghLTYlA0W/0QO97ijY+sTWmPSKw5zlsA+je25PPHFJReZCMSvJtqlJTmo=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:e0:c17e:c2dc:13eb])
 (user=samitolvanen job=sendgmr) by 2002:a25:b320:0:b0:645:6969:52f4 with SMTP
 id l32-20020a25b320000000b00645696952f4mr6410598ybj.466.1652473340628; Fri,
 13 May 2022 13:22:20 -0700 (PDT)
Date: Fri, 13 May 2022 13:21:46 -0700
In-Reply-To: <20220513202159.1550547-1-samitolvanen@google.com>
Message-Id: <20220513202159.1550547-9-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220513202159.1550547-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=835; h=from:subject;
 bh=HH1ZoZ4U7IrTG0qT02hkMGqwA8ikkqMw52ht6iNCIe8=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBifr3j/HnryEij1/HDUc2sbZLQyYN7d6556HPZq1qT
 l1xSJNOJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYn694wAKCRBMtfaEi7xW7ktXDA
 CU67UkQ9+rP6BZrl4m0BX4xUiwzSmmKPLl9nByQ7yxpXu6x9cOxvsh7U+Y+kdEvD+wXiJX/83jCg88
 viRNpRYeMvJXxI1DPEyJhK+E2GSrC8RfNlnOKOCBWyBm9pDr7/akIxQSKPItAZ9NR9hoZDzYxImk2b
 kFlY7+tt3abbniKqgwD2SlAe9ab1jJeTDp1b8ijpK85f3dEHhJtGWHn4ijrJQWlimUHtN4amn+DJmV
 I7Ti8ClmSh7Lky12ga65DmJQ3s1WHHj5ZrZGalNG25evyzYj+FTwpvEv/D9IRDB2+brvZ/pidt0x7N
 F1EQbzuYgZCDrr4PNCycx1HLCBZ4pC1q+96fvrsjj4UyPP6hEiyzGaqhTM211QovCAKh8N5YyyY8Kq
 cgmRTA/+rmphPKNrl6e434tN7thBoUXXn9pnTlR1B7tNq5ZAio1MvLBno+7zYk2Lthd97TwEgrcjPV
 xYOFqJC1W7SajhbCnMeZUuTW5HZSIq64lZnTLiQXLJKfU=
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [RFC PATCH v2 08/21] psci: Fix the function type for psci_initcall_t
From: Sami Tolvanen <samitolvanen@google.com>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Joao Moreira <joao@overdrivepizza.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Functions called through a psci_initcall_t pointer all have
non-const arguments. Fix the type definition to avoid tripping
indirect call checks with CFI_CLANG.

Reported-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 drivers/firmware/psci/psci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index cfb448eabdaa..6554bf4b8c99 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -521,7 +521,7 @@ static int __init psci_probe(void)
 	return 0;
 }
 
-typedef int (*psci_initcall_t)(const struct device_node *);
+typedef int (*psci_initcall_t)(struct device_node *);
 
 /*
  * PSCI init function for PSCI versions >=0.2
-- 
2.36.0.550.gb090851708-goog

