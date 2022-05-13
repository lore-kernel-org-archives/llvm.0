Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1257A
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 20:22:18 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id i12-20020a17090a64cc00b001dccafbd493so6690880pjm.3
        for <llvm@lists.linux.dev>; Fri, 13 May 2022 13:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=f+v85zCmompJWMzZo0Lo44MXyCG4blaViTEubU7Q5pk=;
        b=MESMouEFY2G4SFqcafmefQWoFCP7ps3QB1tZ46af/jtYe6cn5zcxOwxTwft4N8E1NQ
         +UuIHuj5VEcDhbnPdN1c0OsP0m7BBsr8MIip1QKYnYg6zeoMy088Pl9eVtEl5uK0saGo
         XtR42j6pIymFijnyo6XcDzAed95J3W7UJ8IviGf6zqWy//NvXfkBj+GJVwnuCt9lcOFH
         Z4nLVMl3mKjxxgvlkFCBZewyyE5+nMu5wsw21EWC3AA96x/4tIfvIZsY75Roh12akrho
         avQ626Wx3RZtmrx/IEAGQSI1UB2H2FZgt4JgCTLLjEpfu6Qdx7RMgQixkMV7q4jIt2ca
         yN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=f+v85zCmompJWMzZo0Lo44MXyCG4blaViTEubU7Q5pk=;
        b=FAtrFwd1UJ98IDhfBAScjOpjEnod1O2739dSlX/jcC5yliqgYBvbBTMUnzrkqmg86A
         VvE/8AMAr/EsRGVZ+J4r+SkTSGA1mfng/RIU3xe00GWg8+LARh+j3HuBw4OWTqdyr4QJ
         c9zuI9G6GUzHrtmWOZjKOVAGLE7WW3RVsvIlNTUc/71NWK7rtuGORA6qk8aARoSJ2RnJ
         7GAKLXEbr1/D4K+kUwy2e5CUTpveULbIruLY7vI24D0Bs9AUE8qy3vJjMBTBhweyBD2v
         19hDgJm/eGDcHbdGWAkh+bXdpvfUeAega098afa8GDQ1a7swsYLpOIaK7yKjxa5SQ7C/
         6IPQ==
X-Gm-Message-State: AOAM532Gx0rltcnhjOctH/0w5LOslXdroQ0oEHxXzJY9NHIigSOrk7wY
	wjHxgKEZpJVYbyOLTZs9JM73RwHBvpVetthzY1Y=
X-Google-Smtp-Source: ABdhPJwfcFjFJSZbXy4dFXWlYx0UTPoVmJGQDFAqlwZxMLFtphKEHH2VS3sWnVMuhcTFKwv+pj6ccI88tY8WuVvcx7E=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:e0:c17e:c2dc:13eb])
 (user=samitolvanen job=sendgmr) by 2002:aa7:88d1:0:b0:510:3ee2:3f25 with SMTP
 id k17-20020aa788d1000000b005103ee23f25mr6048858pff.41.1652473338024; Fri, 13
 May 2022 13:22:18 -0700 (PDT)
Date: Fri, 13 May 2022 13:21:45 -0700
In-Reply-To: <20220513202159.1550547-1-samitolvanen@google.com>
Message-Id: <20220513202159.1550547-8-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220513202159.1550547-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2369; h=from:subject;
 bh=TboG0ryIg4JgbMTsV2OXgx0SX/UFOnu1UldMJxVt8Po=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBifr3j4WY4BkbqYI6dC/ZfJbPOV8T4fFdqndEpsBM/
 hV5fbI2JAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYn694wAKCRBMtfaEi7xW7gMxC/
 4pxFRx4HmL+KUme/ZjGLLUnoT9FbQCcyon3/8qR0GI2jddZNW3zIDnAihW+p9AayVGcFBw/cucqeD6
 aXfUmw4i5Efc8tn7VJtIfgwBMJEeT97CO0koKO1cJfqhLgyPXQDEp5x3qbmJIPEvXkFbMwd9T0no37
 HPRxilpeC2rxuO4N07WfXvHHMyvz873twQyminhgkImNDn8LWrzNZD2TYLXYTmCSbYCFGu5tXSDEhw
 ZHK28QweaPZFMYbk0wN8AvV4LKrTN0/LJoOuYP485lixfm/DeCd/25TzV57VDBt4ZfW/VlEHh4RkgX
 cFHax638u12jlXDQHJK2SS7MLmlojw27IhKgnEszme11T0yFry4yEqhhcfa1m4PMtHA6DBWFAZjYwA
 CCw/0R+hbTncTA8X3SMH0fWDvX+13ZsaiGA+rH7eLAG+M6F+T6JF6K+96BK3G6xvoablbMV270wlb8
 +GZCYAV3P1rotvaWrcFV5saGNcr9RR12T6hfVDEQ+LtAA=
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [RFC PATCH v2 07/21] cfi: Add type helper macros
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

With CONFIG_CFI_CLANG, assembly functions called indirectly
from C code must be annotated with type identifiers to pass CFI
checking. The compiler emits a __kcfi_typeid_<function> symbol for
each address-taken function declaration in C, which contains the
expected type identifier. Add typed versions of SYM_FUNC_START and
SYM_FUNC_START_ALIAS, which emit the type identifier before the
function.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 include/linux/cfi_types.h | 57 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 include/linux/cfi_types.h

diff --git a/include/linux/cfi_types.h b/include/linux/cfi_types.h
new file mode 100644
index 000000000000..dd16e755a197
--- /dev/null
+++ b/include/linux/cfi_types.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Clang Control Flow Integrity (CFI) type definitions.
+ */
+#ifndef _LINUX_CFI_TYPES_H
+#define _LINUX_CFI_TYPES_H
+
+#ifdef CONFIG_CFI_CLANG
+#include <linux/linkage.h>
+
+#ifdef __ASSEMBLY__
+/*
+ * Use the __kcfi_typeid_<function> type identifier symbol to
+ * annotate indirectly called assembly functions. The compiler emits
+ * these symbols for all address-taken function declarations in C
+ * code.
+ */
+#ifndef __CFI_TYPE
+#define __CFI_TYPE(name)				\
+	.4byte __kcfi_typeid_##name
+#endif
+
+#define SYM_TYPED_ENTRY(name, fname, linkage, align...)	\
+	linkage(name) ASM_NL				\
+	align ASM_NL					\
+	__CFI_TYPE(fname) ASM_NL			\
+	name:
+
+#define __SYM_TYPED_FUNC_START_ALIAS(name, fname) \
+	SYM_TYPED_ENTRY(name, fname, SYM_L_GLOBAL, SYM_A_ALIGN)
+
+#define __SYM_TYPED_FUNC_START(name, fname) \
+	SYM_TYPED_ENTRY(name, fname, SYM_L_GLOBAL, SYM_A_ALIGN)
+
+#endif /* __ASSEMBLY__ */
+
+#else /* CONFIG_CFI_CLANG */
+
+#ifdef __ASSEMBLY__
+#define __SYM_TYPED_FUNC_START_ALIAS(name, fname) \
+	SYM_FUNC_START_ALIAS(name)
+
+#define __SYM_TYPED_FUNC_START(name, fname) \
+	SYM_FUNC_START(name)
+#endif /* __ASSEMBLY__ */
+
+#endif /* CONFIG_CFI_CLANG */
+
+#ifdef __ASSEMBLY__
+#define SYM_TYPED_FUNC_START_ALIAS(name) \
+	__SYM_TYPED_FUNC_START_ALIAS(name, name)
+
+#define SYM_TYPED_FUNC_START(name) \
+	__SYM_TYPED_FUNC_START(name, name)
+#endif /* __ASSEMBLY__ */
+
+#endif /* _LINUX_CFI_TYPES_H */
-- 
2.36.0.550.gb090851708-goog

