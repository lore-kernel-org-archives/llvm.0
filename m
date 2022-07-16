Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C2C362
	for <llvm@lists.linux.dev>; Sat, 16 Jul 2022 00:16:26 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-31cd7ade3d6so50371057b3.3
        for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 17:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:cc;
        bh=K1u/08k1kHvQ8RIYk0HRaqbL2NYdWoYTw1DMyhtc5Cw=;
        b=ho4U6QwUwXhpx81KMHiBsPWFgJd29KTWTUHZtpCpwKlYMTwBhoeXodak0kOIHbZ2ir
         BpGSx7gVS1PPG+NQ2aAFqq0AgMA50X8mXFaW1ql992pf9L3w8vLyF+bdZIWnGJW/YoLX
         AbeXy+d/mGyc7jUiCNNruhVn6Jf2pqOxbsHLu73faBNIGntKz8usvZy4DSJg/H3MKTUn
         JhBVt3Rq48h/YgiVHWle7KeEFSaA643KcJxCmU6VsNG8YnWxYm/mkeKg77U6RANWhbUj
         /xj0aGtFI6Y3ga4QKFY/czxZXcottGTH5osym5cpiBTDhHQmr1mlaIAwSvBJTThmUSRB
         /LNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:cc;
        bh=K1u/08k1kHvQ8RIYk0HRaqbL2NYdWoYTw1DMyhtc5Cw=;
        b=SH1ntL62T3Wtp+K4zTdkEHMo8kEDN+fgeHr00R98Nx/+VCIv6a28tQq8IO6+1a/Vz2
         DvravFKjkMRkSYXPWy9TYRk1Urqr/vgU/XBvHV1gDk8QZ9Fm/kf74QQ5ETfns7uj88Vp
         PAgVboaNXRcBVg7IU8D8hfxPQKap1jtL5cIj6tiy+nrsBy23vyTJurKtUyslButpXITp
         bp7rnHfCGWUZQGcS55WKRJA9zLbMiZ4/4FW2XGJjYcDotTPmbkVsPlt7HRYtEk+AL4W2
         hz2KdjBWpVuZ6ZDtdACUsI+/iap8xZDXBdwfIa4DBbyUMC3dXbIYS2DIrrPPA2QdbNmo
         0y5Q==
X-Gm-Message-State: AJIora9f+e1ojW6RC03ixzR/z3AiBPLw0dR0MfX1EIKjLu2oNDkiNsmQ
	n43lmt0viT2d0p4+UqsXA29C3SAh0/yn2nPbTl3wSKJHpDJ23y6luscDcxns66hQHp+mXlbzYbQ
	uNJ3lPKQ5AF4m33xbnI5vKeIytU/CTbNgGA6roIhHX/p5OZ3ZbDzDDD++nKjXglVFg0XtLuOLLF
	A=
X-Google-Smtp-Source: AGRyM1sIdHPQVqAztkcQa3o63z7bs2yVKH4jL3uicRwyLHqvXlO1IHuc1+cZsIt5Hj1UM8MMx63bfZSooMS6oiNnaDU=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:a3e6:c68c:2c0c:ebf6])
 (user=ndesaulniers job=sendgmr) by 2002:a5b:ecc:0:b0:66e:da0a:7736 with SMTP
 id a12-20020a5b0ecc000000b0066eda0a7736mr15615949ybs.587.1657930585734; Fri,
 15 Jul 2022 17:16:25 -0700 (PDT)
Date: Fri, 15 Jul 2022 17:16:07 -0700
Message-Id: <20220716001616.4052225-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1657930566; l=1743;
 i=ndesaulniers@google.com; s=20211004; h=from:subject; bh=QIu9o/mxb9btODsh6DZRIF2F1BpZvwkAJQhLHDs2c4Y=;
 b=QdWV52FzNZq1EiGz28q4F2oq+2dQcFXBgbMNZYK/TVuExNteLEHksMhp5aGDF1c1JydpYzq8AL8R
 O+7hwHWKAJsuMWHDosqLDtYAeYA9XElDWzKsyB0obqe7JCPyMRWB
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH] arm: lib: implement aeabi_uldivmod via div64_u64_rem
From: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Ard Biesheuval <ardb@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Gary Guo <gary@garyguo.net>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Compilers frequently need to defer 64b division to a libcall with this
symbol name. It essentially is div64_u64_rem, just with a different
signature. Kernel developers know to call div64_u64_rem, but compilers
don't.

Link: https://lore.kernel.org/lkml/20220524004156.0000790e@garyguo.net/
Suggested-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/arm/lib/Makefile         |  1 +
 arch/arm/lib/aeabi_uldivmod.c | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 arch/arm/lib/aeabi_uldivmod.c

diff --git a/arch/arm/lib/Makefile b/arch/arm/lib/Makefile
index 6d2ba454f25b..3fa273219312 100644
--- a/arch/arm/lib/Makefile
+++ b/arch/arm/lib/Makefile
@@ -29,6 +29,7 @@ endif
 obj-$(CONFIG_UACCESS_WITH_MEMCPY) += uaccess_with_memcpy.o
 
 lib-$(CONFIG_MMU) += $(mmu-y)
+lib-$(CONFIG_AEABI) += aeabi_uldivmod.o
 
 ifeq ($(CONFIG_CPU_32v3),y)
   lib-y	+= io-readsw-armv3.o io-writesw-armv3.o
diff --git a/arch/arm/lib/aeabi_uldivmod.c b/arch/arm/lib/aeabi_uldivmod.c
new file mode 100644
index 000000000000..310427893195
--- /dev/null
+++ b/arch/arm/lib/aeabi_uldivmod.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Unsigned 64b division with remainder, as is typically provided by libgcc or
+ * compiler-rt.
+ *
+ * Copyright (C) 2023 Google, LLC.
+ *
+ * Author: Nick Desaulniers <ndesaulniers@google.com>
+ */
+
+#include <linux/math64.h>
+
+struct result {
+	u64 quot, rem;
+};
+
+struct result __aeabi_uldivmod(u64 numerator, u64 denominator)
+{
+	struct result res;
+
+	res.quot = div64_u64_rem(numerator, denominator, &res.rem);
+	return res;
+}
-- 
2.37.0.170.g444d1eabd0-goog

