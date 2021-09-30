Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FE172
	for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 18:05:55 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id w4-20020a056902100400b005b6b29d9a27so9563830ybt.20
        for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 11:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=fPre9riEtsWDn3nT/Sr4LcMmmeeCRXoVSu1AIB6M7IQ=;
        b=WOqKG4pCG4OG7NbKOjdPUlyrET1QwyjhNoXM+aIOZw4h0mqTSFrygPNgZWNl3rJbMt
         ML1pg1BjoWcbeGwL9iWhIBhRu94ny8XE0YqMSBcYge2bqQCuYxe6MX874k7SY90mzw3Y
         jII4mgP4SW+9kJcE8r5WwgwTH67+Na/lflvYaG9d2yMhYIbQaWYy6157X3WkK+fwEAeZ
         TFeIKl7Bl19j1EM4wzKjC/hLn/0dDGGmOKStF0nzGx5lrmYtksNqbTpx4hRMh8ikb6g3
         3QNQuzIAKHhNiAI9PEpmiGHCmsLVSSCwkoYoAnvMyKiyBHS8WVu1OkICCZv4IWS8SnCI
         rNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=fPre9riEtsWDn3nT/Sr4LcMmmeeCRXoVSu1AIB6M7IQ=;
        b=fqlJI3nVyN7dgOhK7PRAi22gl19YUI7gXTSCuha5GfPiNOqT7dk9cE9v6t0qRi7Ptl
         Z0I/DXn6/OKom1DQloMtjtDJH0XenYposdRYrf1YgaTq60Dam+vmxgGrF5tocIkLZeFo
         FNRosKvNATklZAlrRrnauUNE/fXSeYTL4qOBOYxIbRrMKLFxkZ5OD/sVOZOVFspQ+2tO
         jsQKh9GUUCFUHTawEnevCtPhaRgOJxGCfHaP9p5jCZzgikDo3qKpfxVExGohqVxvECYV
         hZh9+9oLYluLyYGK0O9zb7cz/cBTSr/JiMh6CJsO28qBzuYyhLDEm2gn6gysYgGjVVoF
         kqyg==
X-Gm-Message-State: AOAM531BwTHMwuJcUXyx6CU02hDpc9kqdpVqEeeSh/WHIKJnZT24spXE
	fP83b8QTi7WB0jUMTuLZYQ8yVVxmANW9FtCsLNs=
X-Google-Smtp-Source: ABdhPJxSAVWIMsARi3nfwWxlFk7SoNUuPOxAnFKLyn/tb5cb4kWVXe1gudHXrJc1oNAyYUvYK7dAfI4tbix6w58R9is=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:ce43:4366:95ca:d6e9])
 (user=samitolvanen job=sendgmr) by 2002:a25:d48f:: with SMTP id
 m137mr655048ybf.109.1633025154238; Thu, 30 Sep 2021 11:05:54 -0700 (PDT)
Date: Thu, 30 Sep 2021 11:05:24 -0700
In-Reply-To: <20210930180531.1190642-1-samitolvanen@google.com>
Message-Id: <20210930180531.1190642-9-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20210930180531.1190642-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [PATCH v4 08/15] lkdtm: Use an opaque type for lkdtm_rodata_do_nothing
From: Sami Tolvanen <samitolvanen@google.com>
To: x86@kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Use an opaque type for lkdtm_rodata_do_nothing to stop the compiler
from generating a CFI jump table entry that jumps to .rodata.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Kees Cook <keescook@chromium.org>
---
 drivers/misc/lkdtm/lkdtm.h  | 2 +-
 drivers/misc/lkdtm/perms.c  | 2 +-
 drivers/misc/lkdtm/rodata.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/lkdtm/lkdtm.h b/drivers/misc/lkdtm/lkdtm.h
index c212a253edde..2da74236c005 100644
--- a/drivers/misc/lkdtm/lkdtm.h
+++ b/drivers/misc/lkdtm/lkdtm.h
@@ -137,7 +137,7 @@ void lkdtm_REFCOUNT_TIMING(void);
 void lkdtm_ATOMIC_TIMING(void);
 
 /* rodata.c */
-void lkdtm_rodata_do_nothing(void);
+DECLARE_ASM_FUNC_SYMBOL(lkdtm_rodata_do_nothing);
 
 /* usercopy.c */
 void __init lkdtm_usercopy_init(void);
diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
index 2dede2ef658f..fa2bd90bd8ee 100644
--- a/drivers/misc/lkdtm/perms.c
+++ b/drivers/misc/lkdtm/perms.c
@@ -151,7 +151,7 @@ void lkdtm_EXEC_VMALLOC(void)
 
 void lkdtm_EXEC_RODATA(void)
 {
-	execute_location(lkdtm_rodata_do_nothing, CODE_AS_IS);
+	execute_location((void *)lkdtm_rodata_do_nothing, CODE_AS_IS);
 }
 
 void lkdtm_EXEC_USERSPACE(void)
diff --git a/drivers/misc/lkdtm/rodata.c b/drivers/misc/lkdtm/rodata.c
index baacb876d1d9..17ed0ad4e6ae 100644
--- a/drivers/misc/lkdtm/rodata.c
+++ b/drivers/misc/lkdtm/rodata.c
@@ -3,7 +3,7 @@
  * This includes functions that are meant to live entirely in .rodata
  * (via objcopy tricks), to validate the non-executability of .rodata.
  */
-#include "lkdtm.h"
+void lkdtm_rodata_do_nothing(void);
 
 void noinstr lkdtm_rodata_do_nothing(void)
 {
-- 
2.33.0.800.g4c38ced690-goog

