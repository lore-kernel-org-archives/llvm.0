Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8226A038
	for <llvm@lists.linux.dev>; Tue,  5 Dec 2023 20:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tanzirh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OcFGXP8+"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5ca2a6f07b6so98704907b3.2
        for <llvm@lists.linux.dev>; Tue, 05 Dec 2023 12:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701809951; x=1702414751; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W7RafG7nAWDAAGrW/jUsNIHCRJDj/ZzkUDLX/nKv/hI=;
        b=OcFGXP8+68oAlfIT0mEoyR9VJge/yG1ZxD6ZsJrHdx3A4KuPyBViS/2vvT4yXF58eU
         mgM5Johj2oH2u/O0f9hAiCg9t3gqJFU1yd+luY3LjQldUmwQ16xdgBEymhiW2MKYlu9X
         jKzLSm14EDhqQTqhHwGSA3fuYyuYXaknkOgggspU7ad27+kb7MWJj0YGe84NinGtv7TY
         FECyxbx+GYUTYhYH6zF1PfsSLYAZpDjPocIjPeanOrSJo/8Ozn8/sJdldq/TU9t+OVKV
         wrghlyB4nMdDl9fxu4wj/rO/TG4ikmQxGI7jETe4yg5aFBc6zYZwFVPxfQDrTYuPW7B1
         3yzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701809951; x=1702414751;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W7RafG7nAWDAAGrW/jUsNIHCRJDj/ZzkUDLX/nKv/hI=;
        b=rpeto8TnZVcREcUIUpyntu6AZHGBJUVu43BTb7tfx/PqtfCLVeYgx6fuo8dcViA1gK
         HQZmZX45Nga3sA8bmomi6Sw/9kjA4dDLG1yvwSPgJxJ02W/K7j5/5h542cgc4ZddOc5b
         Ve6sZCYDKkaw9QNu/D47cKXZgidft9svAc7DnMR8042VLaSQ6189ePHG6W8HGwuP7Tyy
         gQa3vSmrbJQO+eYgfdRxEVF6qem2XqO3M42Jk+9lLrxoBlvZgLm+45Qeg/powTXuSx4p
         u7D4TfCVqU0vt1qY9l0yNETpVDCMRo4hSOHm7n44ZCnlJdP636QNZKdK6licCUxDkd8X
         gt3g==
X-Gm-Message-State: AOJu0Yybq0Zkn+rKKjicatRMFVizTzodS6InlzXFto3vBCjSrQlLxVSo
	3JX/nZwoCgUejrwGTU6XaroHJ9SSHkMF
X-Google-Smtp-Source: AGHT+IEOHHHkQHCm04ytFMnKqd50M5Z2PyFwnofksHuvbSlF0wfs0twpe2H4x1KbIfv/MfMzuensmACLCWaX
X-Received: from tanz.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:c4a])
 (user=tanzirh job=sendgmr) by 2002:a81:6d91:0:b0:5d8:39ca:4824 with SMTP id
 i139-20020a816d91000000b005d839ca4824mr138285ywc.4.1701809950939; Tue, 05 Dec
 2023 12:59:10 -0800 (PST)
Date: Tue, 05 Dec 2023 20:58:53 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAyPb2UC/4XSS2rDMBCA4asEreuiGT2nq9yjdGFJI0eQxMEOp
 iXk7pWzaetQtBzB9wsNuomZp8KzeNvdxMRLmct4rgO87EQ89OeBu5LqLFCiApS6O5YwX6dyHg7
 cJ546RuUZ+2yYo6jqMnEun4/i+0edD2W+jtPX44IF1tP/Wwt00EWblLY9BnK0H8ZxOPJrHE9ij
 S3YCOAaCFm5iBqk0fvh1Jfjj1cNr6rXxjvpU/YUzNbrhterzwF0BHI689abhjfV5wyeNAUL2m6
 9/e3Ns7erR8uYQWYfaetdw7vq2UoEZcFzTFvvG95Xj30kip4gxKf3U8NT9VJlhLo7pSluPchGA GQtkO0JrbSerX8qQKuwfkLrTWDjZEjpzw7u9/s33ZJMGjMDAAA=
X-Developer-Key: i=tanzirhasanhasan@gmail.com; a=ed25519; pk=UeRjcUcv5W9AeLGEbAe2+0LptQpcY+o1Zg0LHHo7VN4=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701809949; l=1597;
 i=tanzirhasanhasan@gmail.com; s=20231204; h=from:subject:message-id;
 bh=OpBF4JO9qEH0eFq9aQn9Qy1e2TtS+Dvl+rfyupEM/hU=; b=G2C30+8JBiyLP+brqVYCFRKKsEOwWYcODMl+8oBzBX4I1wKHBpcIzqzsZmbtSf8ei4tm2bXDd
 3Pj/70/QYYoBhZTVzJcLoI/enQ4fP7Pa/1o5uPYJUjjXNAO3gnbLJiY
X-Mailer: b4 0.12.3
Message-ID: <20231205-libstringheader-v1-1-7f9c573053a7@gmail.com>
Subject: [PATCH] lib/string: shrink lib/string.i via IWYU
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
lib/string.i from 26371 lines to 5232 lines (-80%).

If there are any problems with the output of the tool please raise an
issue on the github.

Link: https://github.com/ClangBuiltLinux/IWYUScripts

Signed-off-by: Tanzir Hasan <tanzirh@google.com>
---

---
 lib/string.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/lib/string.c b/lib/string.c
index be26623953d2..aff066e9da9f 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -16,16 +16,16 @@
 
 #define __NO_FORTIFY
 #include <linux/types.h>
+#include <asm/bitsperlong.h>
+#include <asm/bug.h>
+#include <asm/errno.h>
+#include <asm/rwonce.h>
+#include <linux/linkage.h>
+#include <linux/stddef.h>
+#include <vdso/limits.h>
 #include <linux/string.h>
 #include <linux/ctype.h>
-#include <linux/kernel.h>
-#include <linux/export.h>
-#include <linux/bug.h>
-#include <linux/errno.h>
-#include <linux/slab.h>
-
 #include <asm/unaligned.h>
-#include <asm/byteorder.h>
 #include <asm/word-at-a-time.h>
 #include <asm/page.h>
 

---
base-commit: 33cc938e65a98f1d29d0a18403dbbee050dcad9a
change-id: 20231204-libstringheader-e238e2af5eec

Best regards,
-- 
Tanzir Hasan <tanzirhasanhasan@gmail.com>

