Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8124E38FA8
	for <llvm@lists.linux.dev>; Tue, 19 Dec 2023 18:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tanzirh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B2yuM0pl"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dbd45ac8019so1658040276.3
        for <llvm@lists.linux.dev>; Tue, 19 Dec 2023 10:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703011687; x=1703616487; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GQnopqwXCPJwf1o31D0QkbeUw9iOW+EHq9+aREsG9fw=;
        b=B2yuM0pl+D1U04nFidRi+5mZ74KRs5CsQFWNzL4TBjj09f6s1zq1perKUvRy+A/qoI
         7jpX3iEynYbzGpn35gUE0ZQISZ2NzHV6+pOtsMApMDqPj0BtNNME4+6Q0CHHyWGaexxI
         tIR1H6CllKQwVtSESH2B1RNxG+RxoK/hibu4A7fWobJJNIwRwKseF2ggZFgZRLsVrEfy
         fpoJFuX+8Hhs0Ma4ik7MA3I4Ym9yYq2gW/KRO9UNihdD3WoO8qwCW5LKblOdGgMWnLAI
         EvLKzfK7g2zhmoNDrWDXlFFG2YV4ax7czl7Yc6Oc/fiYsIorncX6cnQzcVNmC4FJhjyM
         NDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703011687; x=1703616487;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GQnopqwXCPJwf1o31D0QkbeUw9iOW+EHq9+aREsG9fw=;
        b=VhCEYYg9/yBHtqGYie+VXqGA/qTeFNDjSKBsSed4h0s4ogM0qbwTTurAB+ZcfcdEL/
         eRS2J+gVD6Q45wgUbb1Xzq33AVac9zkZEpt8JpdKMCf3h96mMkEkLjzFqRxZZMKL9EFe
         UhtlaA9/dHj/Pkbyv+DZNkzl52Qpo0qHrhGodqw+GfH5xYmxaLyUu1+fh60toMZlRgKs
         3BXHqViM/WPmdLVBc5JrAH0P1XDtecJgu0t8016IgpuoMvnW6T7pFEFFvQcyciNfyyuj
         EIzAX4mb87j/NjFpgSDB8IFI0ejU6rJ9es18sXOiaK9TPkYgnzk5UgF9SNt5uYpwkKGc
         cgOw==
X-Gm-Message-State: AOJu0YzIY/BLHWxDRNwFuixYW2/wsAPE0IOxqJrbupWu5+ypPC783Hi/
	g3ThPOt0Ty3dA2ROfsIEpkRM3ubHQEWb
X-Google-Smtp-Source: AGHT+IHBA+KH6ttcAcCFFF4DpkEvaI+VOlFNhCHPim/Q48y/kMnBB99Abloesqsd9Mz74KHJnLFXqzFVhpxC
X-Received: from tanz.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:c4a])
 (user=tanzirh job=sendgmr) by 2002:a25:ef0c:0:b0:dbc:d4c9:bbcc with SMTP id
 g12-20020a25ef0c000000b00dbcd4c9bbccmr173651ybd.8.1703011687539; Tue, 19 Dec
 2023 10:48:07 -0800 (PST)
Date: Tue, 19 Dec 2023 18:47:54 +0000
In-Reply-To: <20231219-libstringheader-v5-0-206d4afd309a@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231219-libstringheader-v5-0-206d4afd309a@google.com>
X-Developer-Key: i=tanzirh@google.com; a=ed25519; pk=UeRjcUcv5W9AeLGEbAe2+0LptQpcY+o1Zg0LHHo7VN4=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703011682; l=1528;
 i=tanzirh@google.com; s=20231204; h=from:subject:message-id;
 bh=kLkju4pFci+nx2b0Vi+mSe3j1L2n+dGn+lmNlbPb2hw=; b=b0jsU9dP77fa4yf1ZBmjDzAgZG7P8A4zLkwrshRlIytJsSBs6DmwQmw8P9xNcLRozgOVkFZKB
 c9540TlKe4QDsPqQQGaAoMFGfuUGIw9TqLNSGRIYgTfRJd1i6ynudEf
X-Mailer: b4 0.12.4
Message-ID: <20231219-libstringheader-v5-2-206d4afd309a@google.com>
Subject: [PATCH v5 2/2] lib/string: shrink lib/string.i via IWYU
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

