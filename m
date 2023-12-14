Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34CB54279
	for <llvm@lists.linux.dev>; Thu, 14 Dec 2023 21:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tanzirh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0TL7jh7U"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5cf4696e202so100765467b3.2
        for <llvm@lists.linux.dev>; Thu, 14 Dec 2023 13:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702588046; x=1703192846; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mvHrK2O7Pjqorqre2FxP3aimz1/5eGTahkzwWcaIuP8=;
        b=0TL7jh7Ug9vCCUFkn6ydjKx/7IGU9nnqX+WNI7vl51WXJ8k6tUk0WpGVfpKGBo3DRM
         TmttOHXN2B+q/G5JYDUyjs2oALiSWIVX+IsPHhauJijTCWt2/MShJ09G7ZyCywQCRHc9
         FMnT4iKHlrv32pvw1oXWFuGykaGOdroJIzQNnW786yrrDig0+yFGstjktlg+prxstcKE
         suqntLr38D5fLV9WIMAdffc/RllbvEyFQJQ7p2KlOIusG1waGZJKE9VCqakOMPrtYnQK
         K/eo9sgmFqTXHIKaBeYXAq2PmnNG4WOlO0tJCmzEyLDN8KNkc38e3HaSjOycx24sf2kd
         hBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702588046; x=1703192846;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mvHrK2O7Pjqorqre2FxP3aimz1/5eGTahkzwWcaIuP8=;
        b=OtxBmpGM6FL8Qd3L05utuOxaDb+dfIbBfe78OmM4gUBquGjdAW2braeB+sdSKlaw22
         IiEVoisDvQw1WRdbYcVCiUDiylxPUz8V+064I+Pfqp8QBjwYh0aVvgmH+rlV5xS1a9HH
         m5Rg6EOCdoKfgaoU1Nrfb8umBoJd1eFGm3/9DOK2YUD7ycgcI16k7i7l/gLAw0/WC712
         YEBl4RV9DUpBwooDf7gN2OIpux+xYsIO1JcPmZpb2oFMeh3zrQXHmsZ0NLAXwrTISk/a
         3/YK164kdIZMnjOWBLyr7I+DxBmfhdsLBsBP7FtI80R22AT0cyOSOIfe90icufsCl3m9
         G1gA==
X-Gm-Message-State: AOJu0Yww4gsqMdrBhdgmPOz94Kr7kjWS67QL0CSWpUwir7gXUG+5XGZQ
	U+d9D9jnt0yuT2DLd6FCmFrF4U2QLkag
X-Google-Smtp-Source: AGHT+IFi8YNAQ3xyc8K/sY7hjOazzHdUVZNGzoO2ZJiuSwVCb2AJazUd20DqytBNBjyv2QYzqs6581eY60+q
X-Received: from tanz.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:c4a])
 (user=tanzirh job=sendgmr) by 2002:a05:690c:c9c:b0:5e2:1d4d:bb78 with SMTP id
 cm28-20020a05690c0c9c00b005e21d4dbb78mr67840ywb.2.1702588045822; Thu, 14 Dec
 2023 13:07:25 -0800 (PST)
Date: Thu, 14 Dec 2023 21:06:13 +0000
In-Reply-To: <20231214-libstringheader-v2-0-0f195dcff204@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231214-libstringheader-v2-0-0f195dcff204@google.com>
X-Developer-Key: i=tanzirh@google.com; a=ed25519; pk=UeRjcUcv5W9AeLGEbAe2+0LptQpcY+o1Zg0LHHo7VN4=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702588040; l=1379;
 i=tanzirh@google.com; s=20231204; h=from:subject:message-id;
 bh=91dW9F9BO6/svU0lSPP0Jze6wT7/fMBiGl2CPin/YSo=; b=WmYdOEcw8kfyBDG2Wa2MRk8zfL5fW+W7stfIilOpCB+z9MN2lr2zZu4E1EXEZBuy7UDS85vqO
 7r94wjCSS35DlEuOxcBJPDigqi+vOS0OkFs34Ft/7vEMr23/ERvn2Wk
X-Mailer: b4 0.12.3
Message-ID: <20231214-libstringheader-v2-2-0f195dcff204@google.com>
Subject: [PATCH v2 2/2] lib/string: shrink lib/string.i via IWYU
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
lib/string.i from 26371 lines to 5259 lines (-80%) for the x86
defconfig.

Link: https://github.com/ClangBuiltLinux/IWYUScripts

Signed-off-by: Tanzir Hasan <tanzirh@google.com>
---
 lib/string.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/lib/string.c b/lib/string.c
index be26623953d2..7fe1acefb1a1 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -16,16 +16,16 @@
 
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
+#include <asm/rwonce.h>
+#include <linux/linkage.h>
+#include <linux/stddef.h>
+#include <vdso/limits.h>
+#include <linux/string.h>
+#include <linux/ctype.h>
 #include <asm/unaligned.h>
-#include <asm/byteorder.h>
 #include <asm/word-at-a-time.h>
 #include <asm/page.h>
 

-- 
2.43.0.472.g3155946c3a-goog

