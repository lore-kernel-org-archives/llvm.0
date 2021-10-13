Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A48572
	for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 18:17:21 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id p8-20020a056902114800b005bad2571fbeso3991293ybu.23
        for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 11:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=zmv8JzbzBTLA62LcosQrTnF8inM4/ujL1RSgZDP29E8=;
        b=jXXnBJxv0b07/cGFqpGevnT1fh+20ZZCm23uU34BS+ygdeR3x+1nkPRE0KVCt2jR68
         /sfFg0nXNzG7XAGbrJWaOVvFrygpeVVr0RpLo3kGyx3yNpLk9zTOrzyxhs1F9uC4I9CW
         6q3ZZigb34tCL9VSIdGW/lRR/LRAoqEwzNVhPfd78Il8WS6seGvPUse7ePzREuFbMCWx
         ekEMjQxIoq55uKC1aaCKRhR8H9CY0a5x0Gxb9CVkgqVHzsL7FUAeUULOC1Mwh7gQzfCD
         /DcgpfktUC7ykZsfB4D62XngGhv6U4CmQ7j2C5rF3EbiQUsib8zrxHGdD/F0SUA/l7l0
         LZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=zmv8JzbzBTLA62LcosQrTnF8inM4/ujL1RSgZDP29E8=;
        b=sU7MHAh3e48nStQP45cwkD29oyST5Bq6VlGWemlH8DKjiB74/goyv+BGLpqu6qBUUg
         2KcKvMAEDNP/VaQ7N2GfJsxluyEjTM9Ge6WSgaYARJX1Jy/a+jxmT2/cB0tmlUYgz8iK
         dhUZ1D5BddSZuniIwIfxZdwfXiHVZ7XjEs5Ftse5OvgERpk9aijt3irvuqGjEvqPc/f+
         gZA1WI2guiXCLUeW40O8ySMmCf2WNO2y4qrU21FBMqxRnnGbcFxfJCyHOY3dtmZZNmpZ
         4JfNC5ZystvlamW0VDzlyAia+oIG/34OxcsGi+BL50UYDeW4/PzPqyz7AiIdL6TePB1P
         vm+Q==
X-Gm-Message-State: AOAM533tjyojpmvYDpVMmPNXCl4YCbto2ALMKG7Z1YFElQ8qcQRa5Uii
	MZK/HTR5muUlvgVtmX2HXS8b/y2PcOXsuhQYGio=
X-Google-Smtp-Source: ABdhPJwLTd5lpAUz47nTkqm8bIbmDw/6IEtZGq5BpovbEhi49oVmzIhQGeNKQ41jXqONzZubk/hG/YlyOkmKEICkhYo=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:9ea6:6c27:1876:926c])
 (user=samitolvanen job=sendgmr) by 2002:a25:1a07:: with SMTP id
 a7mr1138062yba.30.1634149040163; Wed, 13 Oct 2021 11:17:20 -0700 (PDT)
Date: Wed, 13 Oct 2021 11:16:51 -0700
In-Reply-To: <20211013181658.1020262-1-samitolvanen@google.com>
Message-Id: <20211013181658.1020262-9-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20211013181658.1020262-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1880; h=from:subject;
 bh=aJOu8QEazc9wzBvdGokAB4Q+ctVZ+8OLAvbNqeZO6o0=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBhZyKZXRzLEq7R5KD47cFm8izK9OsGJlkTRUagHLJP
 Bc7BxViJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYWcimQAKCRBMtfaEi7xW7p1JC/
 4m/cUeByxF1jvj7RvWifYnVRReGToai8pyoAp0lJDh9RMTkI/4i7Ngbg+JpNKihPwE0DDQCX0B5m1J
 kultTTxkwkJD8me5ETr7WDcgA6pZVObTc43irlPQzfWRF1F/K8rjDhOZmDV2EL2lPyE2ha/NCoZJaD
 4e6RkyMaHolk3yoKbg0Svz4sjEG5Ps/1uIB2UTOPxOe6BX7G4zZyrf+U+6kWHRIIV6Qm43Oe1R0x4v
 3PqgxY+IAF5GJGNMrzQVIQyXkDflEdBnWDKB3olfp6zbboJLvep7CpZQpyCwjWnbFfX8K3jpcUrpwD
 HZSJqi34gmVWbntJszdl75zGrSchbbe6T+MMb/yconZwPY5QXxE4xbToCoVXFx/7/FU2+DSUz4K7wn
 8NZ4eRbNb+jGv1NiL3Ix0iBsdee7Ep62U2B7khisjmNOO537rtsBg9U4wCXauiKYv0ZbkO2leRG6Ma
 e17h4J4Z868U9gqju5DLF8kMu6/5gSKYYPvX89GRK8VJg=
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v5 08/15] lkdtm: Use an opaque type for lkdtm_rodata_do_nothing
From: Sami Tolvanen <samitolvanen@google.com>
To: x86@kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Use an opaque type for lkdtm_rodata_do_nothing to stop the compiler
from generating a CFI jump table entry that jumps to .rodata.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Kees Cook <keescook@chromium.org>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
---
 drivers/misc/lkdtm/lkdtm.h  | 2 +-
 drivers/misc/lkdtm/perms.c  | 2 +-
 drivers/misc/lkdtm/rodata.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/lkdtm/lkdtm.h b/drivers/misc/lkdtm/lkdtm.h
index c212a253edde..35535c422939 100644
--- a/drivers/misc/lkdtm/lkdtm.h
+++ b/drivers/misc/lkdtm/lkdtm.h
@@ -137,7 +137,7 @@ void lkdtm_REFCOUNT_TIMING(void);
 void lkdtm_ATOMIC_TIMING(void);
 
 /* rodata.c */
-void lkdtm_rodata_do_nothing(void);
+DECLARE_NOT_CALLED_FROM_C(lkdtm_rodata_do_nothing);
 
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
2.33.0.1079.g6e70778dc9-goog

