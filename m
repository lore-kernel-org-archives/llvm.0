Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C5F51C31
	for <llvm@lists.linux.dev>; Tue, 26 Dec 2023 18:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tanzirh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tHRdyQDy"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dbdb46770d7so5562074276.1
        for <llvm@lists.linux.dev>; Tue, 26 Dec 2023 10:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703613652; x=1704218452; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GQnopqwXCPJwf1o31D0QkbeUw9iOW+EHq9+aREsG9fw=;
        b=tHRdyQDyEMRKJT/bWdJlc+kjw0O2LMLqe8kjsofPARbGZvquCukQVrJWo0HR+FYxH3
         /TSg1pXu2xoDUl72ivfeUXQ7eYuAENACQWat0tjpxdhDgCwu9VaVRFN0g3jx+L72M0B4
         9W5ffDNuVcGZGF8M8h8/IDUb+e8uDu3M5XXS2hK/2iQgmOkNM3ukMHOdhMtA+EXBTlFX
         UKQOQAd3FXD3f64aXG0jfZuJj6iJX50FzlS3MD5s2kAGhnLg9Tjb2pVBnZF76CbiUgkL
         MMG1uULc+ZPgTNuj7wbmPOowy3zQrGZZjafx5zhCqtmKOoOa9IunS5miTTEnqLeYFDVI
         njQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703613652; x=1704218452;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GQnopqwXCPJwf1o31D0QkbeUw9iOW+EHq9+aREsG9fw=;
        b=FTYz9dHjxu+DL6UFSrQXlBb9ScobXl/itW+2NS32Bc2LzEzS2ma3X/lBeQgsCGR/l9
         ZQTy3kWhluUi6dpO9NdspnenOGtCI0x1dsIbFRxGpb1x0+Vmvfsm0RKQkey1fbw2qrNc
         +UzxSS4ZDF3NUj2a3phcmORaT5Iop1Gh+sQqEu8WuwrIZeEgXYVgq1HeksQarUlMXYLZ
         oSa/+iGd554rP/+s5TBc3InJWmU/zhvva+mo7426HDqi8DeMtr8cEzB0rIrpJtqoB0Pj
         gNp09O8dPCVXnox6lc7Na3Ce/xlIZphnJbo/DQzF1z2fYPRl7g3X6BvW2Uh0FIzuaNEq
         uYGA==
X-Gm-Message-State: AOJu0Yw+yuOPnICV9VeAiGIRnIDqtM8LMaQ3IH09etvR2Fcyc5EzmcbY
	Bjqz5VLJwrAceFGplBqjUG3t1Li8RUvuZ8Js9Mo=
X-Google-Smtp-Source: AGHT+IFnQX1XkxS5gH/MspqNzbGruimeDM9Y6sSzYazzjx6BG39h+lL/hwfcAIIYMQak4etQSIZs9fP7PwkI
X-Received: from tanz.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:c4a])
 (user=tanzirh job=sendgmr) by 2002:a05:6902:1369:b0:db5:4692:3ab7 with SMTP
 id bt9-20020a056902136900b00db546923ab7mr2904081ybb.8.1703613652544; Tue, 26
 Dec 2023 10:00:52 -0800 (PST)
Date: Tue, 26 Dec 2023 18:00:01 +0000
In-Reply-To: <20231226-libstringheader-v6-0-80aa08c7652c@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231226-libstringheader-v6-0-80aa08c7652c@google.com>
X-Developer-Key: i=tanzirh@google.com; a=ed25519; pk=UeRjcUcv5W9AeLGEbAe2+0LptQpcY+o1Zg0LHHo7VN4=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703613647; l=1528;
 i=tanzirh@google.com; s=20231204; h=from:subject:message-id;
 bh=kLkju4pFci+nx2b0Vi+mSe3j1L2n+dGn+lmNlbPb2hw=; b=mnCi82pkDQhlhIICzaZ9DKF5LW8Zyzd5r/uBAp0bJK6KM0spwTVgAqlizK/vym/fbXNq9suqF
 X+rsoO7J6/2AhGVmTzCIFtKYKnxLFv7kczzhqPaEYO9mne7MtTmJCDp
X-Mailer: b4 0.12.4
Message-ID: <20231226-libstringheader-v6-2-80aa08c7652c@google.com>
Subject: [PATCH v6 2/2] lib/string: shrink lib/string.i via IWYU
From: Tanzir Hasan <tanzirh@google.com>
To: Kees Cook <keescook@chromium.org>, Nick Desaulniers <nnn@google.com>
Cc: Andy Shevchenko <andy@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Greg KH <gregkh@linuxfoundation.org>, llvm@lists.linux.dev, 
	Tanzir Hasan <tanzirh@google.com>
Content-Type: text/plain; charset="utf-8"

This diff uses an open source tool include-what-you-use (IWYU) to modify
the include list, changing indirect includes to direct includes. IWYU is
implemented using the IWYUScripts github repository which is a tool that
is currently undergoing development. These changes seek to improve build
times.

This change to lib/string.c resulted in a preprocessed size of
lib/string.i from 26371 lines to 5321 lines (-80%) for the x86
defconfig.

Link: https://github.com/ClangBuiltLinux/IWYUScripts
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Tanzir Hasan <tanzirh@google.com>
---
 lib/string.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/lib/string.c b/lib/string.c
index be26623953d2..06d9b46875ef 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -15,19 +15,20 @@
  */
 
 #define __NO_FORTIFY
-#include <linux/types.h>
-#include <linux/string.h>
-#include <linux/ctype.h>
-#include <linux/kernel.h>
-#include <linux/export.h>
+#include <linux/bits.h>
 #include <linux/bug.h>
+#include <linux/ctype.h>
 #include <linux/errno.h>
-#include <linux/slab.h>
+#include <linux/limits.h>
+#include <linux/linkage.h>
+#include <linux/stddef.h>
+#include <linux/string.h>
+#include <linux/types.h>
 
+#include <asm/page.h>
+#include <asm/rwonce.h>
 #include <asm/unaligned.h>
-#include <asm/byteorder.h>
 #include <asm/word-at-a-time.h>
-#include <asm/page.h>
 
 #ifndef __HAVE_ARCH_STRNCASECMP
 /**

-- 
2.43.0.472.g3155946c3a-goog

