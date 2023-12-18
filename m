Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF535D759
	for <llvm@lists.linux.dev>; Mon, 18 Dec 2023 18:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tanzirh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VunvSKzh"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5e744f7ca3bso7471207b3.2
        for <llvm@lists.linux.dev>; Mon, 18 Dec 2023 10:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702925094; x=1703529894; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tpo/c9r9EIu18GNZd0zUoly513OzCu9h8vUVs3exmy8=;
        b=VunvSKzh+gNuQopyStqz+LSBUCt04Q7C9vbQ+jPjHu7la3ANfxaJvfKwAc8/5pD2pv
         7Xj0vpxNPZM2LMWOUYnWn6Qfj6Nml9RqddpFWUmyVIGLpXdoTq4sYsuuBaSnZiJAfsQ9
         num4LiFds4zR7N04f4tSbrFx23SuHWjDTaC9YK3Lnn/ns+lOlxnnkL1IcCaXOykyw5Yg
         8mQ8+8gtnXG+gR5XBWgJhcsRJJaU8bV4PUXkAMK6pIAh8GiQ1dvKu0vq5FF2TCY3Yvyf
         vLjy2UV6IEGRIKRRRKUlaQ5jRUzAtitJccKJUmc3lC+GO+VyeTJXS72mSHvbKHBDO5hL
         tYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702925094; x=1703529894;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tpo/c9r9EIu18GNZd0zUoly513OzCu9h8vUVs3exmy8=;
        b=uFLzJ/TSGWEI3SgL7PsaEdkwkXYJ4AmPZRkqTcwWbDv90nNMbkkUh1oG6zexC/XI/j
         QTN65wp/VZyT38l1NTgAj1btGPfRjLRKPanf8fY7/VIDAHtpYqTIMbim6Jxf3I2uWAN0
         IckTCPJVi6Zlrhag2Cjdm9v1ydmG4ZsAW1F5T6hYrG3snGvYujBwVmYvslIp9H4rvPU8
         NYuN8tmFjdysuMb3hryT6wBQ/qli07mY5velVVjD0C/L04l9AgnxIYkVulYhWqD7lkix
         A1+rnuuTLegKiHZ+KoFAnUzvCQ0W3EEhfwJpfqoo065foOQAlujw1i+Gh2/kg7eGvr+G
         c0ew==
X-Gm-Message-State: AOJu0YxHvNo6pUJ5OjtVe/cSYeev7+17EX5HUCeMC1PRKTguTVGiWFRC
	Qyvcp5b+iGHDkZokWjrvddT9M6ilXlFE
X-Google-Smtp-Source: AGHT+IEL+Dx1RotMvLWMcY1+5+NuvVxZsWdNSosBAVYxXmnwighAQ9gxwlp64utMUoi9SVx3v+rGiCMwFKtq
X-Received: from tanz.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:c4a])
 (user=tanzirh job=sendgmr) by 2002:a05:690c:f09:b0:5e6:27ee:67fb with SMTP id
 dc9-20020a05690c0f0900b005e627ee67fbmr1094009ywb.4.1702925094663; Mon, 18 Dec
 2023 10:44:54 -0800 (PST)
Date: Mon, 18 Dec 2023 18:44:48 +0000
In-Reply-To: <20231218-libstringheader-v3-0-500bd58f0f75@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231218-libstringheader-v3-0-500bd58f0f75@google.com>
X-Developer-Key: i=tanzirh@google.com; a=ed25519; pk=UeRjcUcv5W9AeLGEbAe2+0LptQpcY+o1Zg0LHHo7VN4=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702925089; l=1465;
 i=tanzirh@google.com; s=20231204; h=from:subject:message-id;
 bh=gV26WBhHZ984rQ1se1KmnC1yaoC0r21Ttaqbp2LY4BY=; b=jxTx/p2T2Ohx/6qrHcl3jtgDOOmwmAwnPNqfbYw6tFl7hSTnsJb4wAi6wJ+SdIgs/+BwK8LRr
 GBsNJwdWCtgBkIP7kkNwrDxrAz71X+t1oXylc5I7LWotslSU7lJgd2K
X-Mailer: b4 0.12.3
Message-ID: <20231218-libstringheader-v3-2-500bd58f0f75@google.com>
Subject: [PATCH v3 2/2] lib/string: shrink lib/string.i via IWYU
From: tanzirh@google.com
To: Kees Cook <keescook@chromium.org>
Cc: Andy Shevchenko <andy@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick DeSaulniers <nnn@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev, 
	Tanzir Hasan <tanzirh@google.com>
Content-Type: text/plain; charset="utf-8"

This diff uses an open source tool include-what-you-use (IWYU) to modify
the include list changing indirect includes to direct includes.
IWYU is implemented using the IWYUScripts github repository which is a tool that is
currently undergoing development. These changes seek to improve build times.

This change to lib/string.c resulted in a preprocessed size of
lib/string.i from 26371 lines to 5263 lines (-80%) for the x86
defconfig.

Link: https://github.com/ClangBuiltLinux/IWYUScripts
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Tanzir Hasan <tanzirh@google.com>
---
 lib/string.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/lib/string.c b/lib/string.c
index be26623953d2..6e24a4967dd7 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -16,18 +16,18 @@
 
 #define __NO_FORTIFY
 #include <linux/types.h>
-#include <linux/string.h>
-#include <linux/ctype.h>
-#include <linux/kernel.h>
-#include <linux/export.h>
+#include <linux/bits.h>
 #include <linux/bug.h>
 #include <linux/errno.h>
-#include <linux/slab.h>
-
+#include <linux/linkage.h>
+#include <linux/stddef.h>
+#include <linux/string.h>
+#include <linux/ctype.h>
 #include <asm/unaligned.h>
-#include <asm/byteorder.h>
+#include <asm/rwonce.h>
 #include <asm/word-at-a-time.h>
 #include <asm/page.h>
+#include <vdso/limits.h>
 
 #ifndef __HAVE_ARCH_STRNCASECMP
 /**

-- 
2.43.0.472.g3155946c3a-goog

