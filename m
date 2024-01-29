Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6225615AABB
	for <llvm@lists.linux.dev>; Mon, 29 Jan 2024 18:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706551564; cv=none; b=UywJQqpvQ2TXQHXpjtitsY3/agIO1NxnTwA6lhsoxbf8gFzu2ef2qV3YKX8sX4qEC5YJMk0os/U7ig8uRDoCfRKmt1VIRV6w1ItAAm0bDLRP/5KBtvXheCIrX5RzCDqxSPAfKJcw6tARk0trikYPjMDJGh5S9WH90zIUj8/66Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706551564; c=relaxed/simple;
	bh=2tkXbI4kkP7Bg5PktzWdMGd8q8tWspLGt7tFV60fDKM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gxnYA98Qq9BGlb6TJ64/Q7ZJn42elTGMQCwo9MRl/lEfPyIaNPDdV33mPLfAym8jX9MM/xDa92RsWGf8Q14cVf3cfD2Mt/qimYPD7h7SJZcfEgKS7wvx0ZV8nQ5oxLREMCKr1G5pzDSU1yQje0P47fKcqUuGPdRO0JB4MPA/HSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=01WbiQ+N; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="01WbiQ+N"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dc6533e4274so5235288276.2
        for <llvm@lists.linux.dev>; Mon, 29 Jan 2024 10:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706551562; x=1707156362; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6DdM1fA2/BUC7ScxyUb41JZesEtpKP4YlIE0jOqBF4A=;
        b=01WbiQ+NraoUe5P4sYM0vbctSDlhmc7PBtfSlPMXpXeJKpZoAMQ3K6YTvITszcYDGe
         HjKPsqxEcEsfWBfI4dyuJ4a3K9NlrEBVYMg2Bs7VmpY/kL8rM8GJ6F1D/J8SG9Q1Yckf
         vOzuuCkvzAb3xyaRHxSQEigGESWxzn0rK9dZ5LbcCCVqv/vIfgJrpHWlADXJ8nlT0HB2
         tw8xMUx3c6XwP5XofEMA0GuO2H1eClApcC72fk+586oqF/EoZu9UobvFbHoA49qkaxz0
         zFHFQ/GylZPdwxba7iiv6FZM6Y+3IcGWgHZyjpovYFDu612Xs8c/ZwqPXQcKcMTY+qn9
         Wtog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706551562; x=1707156362;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6DdM1fA2/BUC7ScxyUb41JZesEtpKP4YlIE0jOqBF4A=;
        b=FusFPdTcOqMmjgcIMHCOiKw+eE3OLX7dD7pcjQxt7Q3Alz99gitgdt2DahSzGPviSj
         VGVKh2T2bU1dfz7EzQZkH7dZbbsGw79cDfOJXVdtusESs9+i4fQQajkKKXIYkF9UXquy
         4zOWWnenTUB1pUAuxcm9wepkw7zJ7Ti65Hi5U7WuZfz4pDB7BtxdJsIIZpDR0LXZJREf
         khOzsBizyMPhOdzkECOldGYphawrZXQthz3PaCDYCMn0/4+pZNIg4qG+PZ7YesVEXRrQ
         PIuuSmNdf7P9jk9YqgC6ozrltiPNOX1xlDgxB8kInLzrIthmhMTw43sXPA3idR4FK6t0
         ECdQ==
X-Gm-Message-State: AOJu0Yzfk//iJEdyzSniEsHMinwWjt0mOxoGbm7hQxvOpgkuD/0D+i2a
	aRysq4vclDj31iUQgxpD/UuFfjToPT5OgcsiiRZget2DGmKG3xDgNcXg3olEXfdaqKPVPA==
X-Google-Smtp-Source: AGHT+IEtY0wHG6Bv+Cfuwk98fDoP1mB4rkr70PowOvdhb/HTma9T9dk4Ph+McoAi3VylYPwwX4+//SgC
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a05:6902:e0d:b0:dc3:721f:7a4e with SMTP id
 df13-20020a0569020e0d00b00dc3721f7a4emr2254113ybb.12.1706551562591; Mon, 29
 Jan 2024 10:06:02 -0800 (PST)
Date: Mon, 29 Jan 2024 19:05:17 +0100
In-Reply-To: <20240129180502.4069817-21-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240129180502.4069817-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516; i=ardb@kernel.org;
 h=from:subject; bh=XIt7BesiIe5Ouf8eLT5Jk6gT3ML8ZNdNuPHWU+248+Y=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIXX7i3sXJ3YtNZs6V0Vn46sNwfPVvywvyvumoxTpaWPlJ
 Nz4QT6mo5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExk7QxGhtn/Pbk3KEkWcd6X
 n8erVbj74eH4N1o8/57WlE5hkr1zU4XhN8vqb2tihGJOxm3c8mZjeq3tTemlor/sxaf2e0qmZ2w +wAoA
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240129180502.4069817-35-ardb+git@google.com>
Subject: [PATCH v3 14/19] x86/coco: Make cc_set_mask() static inline
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Kevin Loughlin <kevinloughlin@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Dionna Glaze <dionnaglaze@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <keescook@chromium.org>, Brian Gerst <brgerst@gmail.com>, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev
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

