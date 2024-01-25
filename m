Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA235465E
	for <llvm@lists.linux.dev>; Thu, 25 Jan 2024 11:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706182391; cv=none; b=Y7OC1Pa712Er+ZFi7YLxF+1s0zzs9i6PtRXAnX+x/JsIvv+ke6URGAdCnOb5pkAUsloGLQXiJf1lfzPZSVYNHs5+nP/hqQq7ABsnR9jDQT+B4tkPnKg5Wz4/g+MMiF0PipdrJVCpKIL5SZL7Z/z5vv7xvOwnGX/MScWW69z6S7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706182391; c=relaxed/simple;
	bh=2tkXbI4kkP7Bg5PktzWdMGd8q8tWspLGt7tFV60fDKM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WzqQqAzyXez8pgSl10DYNpxQtt16mc5MhFfnek2OTj0P/KKroJLLADXgzO8kWXG4S8+xTEm3lG+hdWEDDZUIGCY2X5LUeauTaFBok+80BwD7SyS01RKozSKIWrhNLKYleGP7KzQ7hOMYxNsYBTg5e/ZP2O17Vh5AVSa9hdmOKz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IrixQKFI; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IrixQKFI"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-40e4478a3afso2717455e9.1
        for <llvm@lists.linux.dev>; Thu, 25 Jan 2024 03:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706182385; x=1706787185; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6DdM1fA2/BUC7ScxyUb41JZesEtpKP4YlIE0jOqBF4A=;
        b=IrixQKFInvSomxxAMBV1f3NbcWpoe35WoYacHhdAcuEVx/semmk9Iu/J0XYEUHuebX
         K9EUpwcfkvi71U5+1BSDgJWf7EdaZvw5k6m7vaIsTVryuwuHqxjSvz98oV1ZrQ//3TGQ
         l+E2sgCIZG75qoNaTJ30DxnFe5eJ7Hp4qwZk52+TyJSa0LRYBNg7jSCcJVggLZkyt+ar
         Ot9FG2vsX0Fpl5ce/n7jYygzjup8e4zM4v27twwCLQFtTICQNbEl+uhjMwSYLZ3s9THU
         AEX4okTsW6WHI4zLSlvwKbhkuPP4zj4VsTOURwgBuykphVmzANqfM6nnUh+9ZthEQM5F
         00vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706182385; x=1706787185;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6DdM1fA2/BUC7ScxyUb41JZesEtpKP4YlIE0jOqBF4A=;
        b=OqCZdIcpTaw+qv6wU5XjdWsLWXtna7FOk3i4F2XOpMepDX1idkXBD6VZss1as2Naq8
         PSmmLKvpphlXJyQFdyjMsHAiOjL154nrRmd9cOegRGSZXJf6w412DFIQnOCJm8HV30Ur
         cyzTAnBN+k+GgFNzblnXGhB7g8uLWlp79LOhgA9bwy5nPY6F6oCVhfe+5XmrtTtNurek
         oV/zcOlCgJFBTLxoKusI41oAmtJFZXzjTOHYn2BuCoJVYVBj/4UGsCQZI6ceWL/q2ke9
         QLCTJU0rE9T81hCgXPUzV/k/9lns4EsUQo76z+NMmRQKlToHWjYAshAo1VKf2egTpY5Y
         REqw==
X-Gm-Message-State: AOJu0Yzl5TVpfGmU5gXndyJXvwlRyGC5bDFgTa0dn7CnIsffA2pagXaV
	5qipLXOCv8lOAEQm1QV0qY5uFqSxiMke4MR1SvZWfxA7sfU7GNh4vomf6hS5DRYDBfDpKA==
X-Google-Smtp-Source: AGHT+IHwAYKcaMhJLNwywm/Tve5NxG3vi6LLLb9sVcfy2uySRff3UA3thP9CMDCN1Ce+5DrXbz3/AitZ
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a05:600c:3c8f:b0:40e:541d:dd64 with SMTP id
 bg15-20020a05600c3c8f00b0040e541ddd64mr40221wmb.4.1706182385129; Thu, 25 Jan
 2024 03:33:05 -0800 (PST)
Date: Thu, 25 Jan 2024 12:28:31 +0100
In-Reply-To: <20240125112818.2016733-19-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240125112818.2016733-19-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516; i=ardb@kernel.org;
 h=from:subject; bh=XIt7BesiIe5Ouf8eLT5Jk6gT3ML8ZNdNuPHWU+248+Y=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIXWT65eLE7uWmk2dq6Kz8dWG4PnqX5YX5X3TUYr0tLFyE
 m78IB/TUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACZiEczI8LglN+rBwh+LaxmN
 ne73hRUuFn7LcdbD44WH1g6pXXLRfowMa/fpH3z+e/YjJ4esjoxCpfbczZOmiv4Of7fe3k3Zd6Y dDwA=
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240125112818.2016733-31-ardb+git@google.com>
Subject: [PATCH v2 12/17] x86/coco: Make cc_set_mask() static inline
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Kevin Loughlin <kevinloughlin@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Dionna Glaze <dionnaglaze@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Brian Gerst <brgerst@gmail.com>, linux-arch@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Setting the cc_mask global variable may be done early in the boot while
running fromm a 1:1 translation. This code is built with -fPIC in order
to support this.

Make cc_set_mask() static inline so it can execute safely in this
context as well.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/coco/core.c        | 7 +------
 arch/x86/include/asm/coco.h | 8 +++++++-
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/x86/coco/core.c b/arch/x86/coco/core.c
index eeec9986570e..d07be9d05cd0 100644
--- a/arch/x86/coco/core.c
+++ b/arch/x86/coco/core.c
@@ -14,7 +14,7 @@
 #include <asm/processor.h>
 
 enum cc_vendor cc_vendor __ro_after_init = CC_VENDOR_NONE;
-static u64 cc_mask __ro_after_init;
+u64 cc_mask __ro_after_init;
 
 static bool noinstr intel_cc_platform_has(enum cc_attr attr)
 {
@@ -148,8 +148,3 @@ u64 cc_mkdec(u64 val)
 	}
 }
 EXPORT_SYMBOL_GPL(cc_mkdec);
-
-__init void cc_set_mask(u64 mask)
-{
-	cc_mask = mask;
-}
diff --git a/arch/x86/include/asm/coco.h b/arch/x86/include/asm/coco.h
index 6ae2d16a7613..ecc29d6136ad 100644
--- a/arch/x86/include/asm/coco.h
+++ b/arch/x86/include/asm/coco.h
@@ -13,7 +13,13 @@ enum cc_vendor {
 extern enum cc_vendor cc_vendor;
 
 #ifdef CONFIG_ARCH_HAS_CC_PLATFORM
-void cc_set_mask(u64 mask);
+static inline void cc_set_mask(u64 mask)
+{
+	extern u64 cc_mask;
+
+	cc_mask = mask;
+}
+
 u64 cc_mkenc(u64 val);
 u64 cc_mkdec(u64 val);
 #else
-- 
2.43.0.429.g432eaa2c6b-goog

