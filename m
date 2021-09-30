Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1830B72
	for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 18:05:53 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id s6-20020a254506000000b005b6b6434cd6so9555483yba.9
        for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 11:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=tPhQgqpAKPBQUxwOrEtJBlsTaM2q8Clcy13gCpSQvzI=;
        b=DArh49XlDsWw110GeI4zxBAHoJ8q7ew7MQMlgVAwRtWh7bUKmPZfZ7aXH7ujHia2uw
         HEnHzF6kVSmrR7TmAje3meeaPs7TWUj5rVnFZwTdr25/8j+pGDf59ZYj+3roFewtIGs/
         cB5pd1eXeFShrPHnoMPzs7oGq46vacp6Lw7jmxzPenkQ3SB55sqHk5fgT1qFUDzsDYio
         XUK86TrTKe8WETWjwDLexToijeo42Ji0hwIOCJ00XTXo43J4d2Pzfw/nC/bPLCih+7td
         Zh9jihr7INO9ZOmeUJsTe4QKzPECqLF9Tyi0ml0jLQFMF2QaRwgvYHM+V5QM1iKFjZP6
         A3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=tPhQgqpAKPBQUxwOrEtJBlsTaM2q8Clcy13gCpSQvzI=;
        b=f89LXBekeTwKET5xSWl1x5ndSMaTioRFKgH9YXyypkdJ47Wf5T2wOanhiF51DY3kZW
         DVZUOp035cm3se5dHOOLG2s0DO7Isrqi3MsN6kAn19j12nXrkaoIY6TSpoys3tZwpwnL
         8XVpLEtZkZa897qqVlOJP4CAcIcIgyhIn7qi0CvtdFM2O5leqD8Wd4NrB2z8Sw8VcJ2f
         JmvT4r3qJ+pu+Ouj12ljhLV4IgSzcK6RxbfV5sVEpbYI+G+EkdGnkywfyjuuWzZIg36X
         vsdR8CplMOup3cn9COmAciyRNppIjkcCAQjG5xLXmWjR4X+T9ulxIjwH6Bv/I4M/4EkU
         Uv9w==
X-Gm-Message-State: AOAM531inae2F0SUentqvXx5jbwHZCBXKPNWMYqZlEyr0pTuGc8XSjAL
	F2xkl6xV3yNETL05Rd12NvV23Mwx1aupDN057L8=
X-Google-Smtp-Source: ABdhPJzd8xBuekl5w0YEWpM/wXNrKDJYF8cvGNaiEGRWRb966n+l0RkGQPKD+VnEBRebQwkRbBbjmfvH313kcdqx/Zw=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:ce43:4366:95ca:d6e9])
 (user=samitolvanen job=sendgmr) by 2002:a25:5093:: with SMTP id
 e141mr690151ybb.171.1633025152132; Thu, 30 Sep 2021 11:05:52 -0700 (PDT)
Date: Thu, 30 Sep 2021 11:05:23 -0700
In-Reply-To: <20210930180531.1190642-1-samitolvanen@google.com>
Message-Id: <20210930180531.1190642-8-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20210930180531.1190642-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [PATCH v4 07/15] lkdtm: Disable UNSET_SMEP with CFI
From: Sami Tolvanen <samitolvanen@google.com>
To: x86@kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Disable the UNSET_SMEP test when CONFIG_CFI_CLANG is enabled as
jumping to a call gadget would always trip CFI instead.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Kees Cook <keescook@chromium.org>
---
 drivers/misc/lkdtm/bugs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
index 4282b625200f..6e8677852262 100644
--- a/drivers/misc/lkdtm/bugs.c
+++ b/drivers/misc/lkdtm/bugs.c
@@ -367,7 +367,7 @@ void lkdtm_STACK_GUARD_PAGE_TRAILING(void)
 
 void lkdtm_UNSET_SMEP(void)
 {
-#if IS_ENABLED(CONFIG_X86_64) && !IS_ENABLED(CONFIG_UML)
+#if IS_ENABLED(CONFIG_X86_64) && !IS_ENABLED(CONFIG_UML) && !IS_ENABLED(CONFIG_CFI_CLANG)
 #define MOV_CR4_DEPTH	64
 	void (*direct_write_cr4)(unsigned long val);
 	unsigned char *insn;
-- 
2.33.0.800.g4c38ced690-goog

