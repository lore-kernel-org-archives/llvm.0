Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B392C11F9
	for <llvm@lists.linux.dev>; Tue, 14 Oct 2025 19:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760469123; cv=none; b=a0uJb+BZEKplJFfS+8VPcQy9mjOIYZbYbGYhIQ4CqV6IrPDFcbclRddnMmVSN8ialCN5ZD07pyZKeigkXSx4kUC2/i6lOy76AuRVmZJ1xXoAN0d57/gI99W5d77R27hYOWaidqIE58R9tiOLdHahVJ14uhH5Il8LwKf8/E9HnNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760469123; c=relaxed/simple;
	bh=Z9yUVxIkowXTHwcyq+ZT+xotxWpz/KTmbCCNOsZzoq8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VsSPGGR+JTJ7x6bB2XkoyJOwZoNF/CrOzRdNSq4fKND0BhOG3wzcGzfrogGYuA8Vr/j/nvPBnkVpVrm84Xu05GBC51lDqaLBU+2jd6jp+QDMRh4SGWf3PRmalLp/mxpwzAJjQCwd/uy03jOsGk+c8BPVqWafNq2AxFBmm+BrJUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AaG8it4z; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AaG8it4z"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-28e538b5f23so104058495ad.3
        for <llvm@lists.linux.dev>; Tue, 14 Oct 2025 12:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760469121; x=1761073921; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=M3lFnKz/buX8A7hzo0yPwqvqVkIBT1MLx/6+Tb3hA3A=;
        b=AaG8it4zRSShxA/RuDJg5YwHvxjXcBDdW4tfvfFh2kGuNhu/pVzIRjG8r9jYnb0prr
         A4YBMj3HRr2Zq6ZONABXictr+iGV32Jk3lxH4LOYMViir47GwRBkjGfO5RTtxVkjNKsL
         6ZXGOA9AfzpTnW/tSAJNSZXuYW9x30ziBMEMYSM7G3BWj3VuRSCIaJNpxYf3CNrH4PVj
         MaQR4UNNQld1MpSVRzLpvsOpNGXLLzWVKwodePHxnFTA7ijHIe72rLUhih7hls3iPZRu
         AtgjOxnhhEFhPz8LV4QErZsFiSMCe1Ub8i8EXkrMXUuQkGgnzrfmOKdYCDgil3arXo+E
         pNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760469121; x=1761073921;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M3lFnKz/buX8A7hzo0yPwqvqVkIBT1MLx/6+Tb3hA3A=;
        b=pm/bOJLFyj77qBVyVB01ZMSZ3IMDsiMBvNCCWn9ZDdMVfTy/7GHlxdpUJB7EfeQkZc
         7X3ncYmENkTEbvkiD/vH0OYWqK7YHnGuONhHgiwJZlS+9A7v1rw8dPB9RnNM0k1JWMzy
         jRQpCRPyIZXrgwnqKLmJB39my2o1GPOMqD4sYtMYewdCFANdRCrZb9RXVCt8XnB41RBD
         i/5PN+PaeClZ8n+w7P/Qd5Bp23fWTPF1HHtlX/AjR4Pw8J8QUeZOxffMRtlJFQuHYS3G
         iz5eJLN4LkgJaE8RX+E9MHCId4eUqMgtF9MyKP3KjbDsV00VMD3WVfqSPICr1wxzFXHQ
         ya9w==
X-Forwarded-Encrypted: i=1; AJvYcCVujUAaXx8w/lajCAUhHl1UR9HuN1cgazY/NwVNpA7EhWIy1NwEhq7cIJarbYUeR7k7rd76@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3vi82y9xyXV9cXU8LeRc1YnaOC6FkfNA/7Q/KW7VRJ8TYD98Q
	c5lOuXD0v0tM4xqNEaZ8m1f9axyB3SNX3FYGAYBrA2pVzvXNf71VpIoaQ6yIK3r+9aJN3g==
X-Google-Smtp-Source: AGHT+IGhtudmZk2HkKUXkkd19MrqCMSvGqxz7BKn42nJ882EUoEPCOxNGbxtd22yRlb577G1ZSIkw08=
X-Received: from plrf4.prod.google.com ([2002:a17:902:ab84:b0:267:e559:12b])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ef10:b0:27e:eabd:4b41
 with SMTP id d9443c01a7336-29027216505mr361986115ad.7.1760469121238; Tue, 14
 Oct 2025 12:12:01 -0700 (PDT)
Date: Tue, 14 Oct 2025 19:11:53 +0000
In-Reply-To: <20251014191156.3836703-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251014191156.3836703-1-xur@google.com>
X-Mailer: git-send-email 2.51.0.788.g6d19910ace-goog
Message-ID: <20251014191156.3836703-2-xur@google.com>
Subject: [PATCH v2 1/4] kbuild: Fix Propeller flags
From: xur@google.com
To: Alexey Gladkov <legion@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Bill Wendling <morbo@google.com>, Han Shen <shenhan@google.com>, 
	Ingo Molnar <mingo@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Tamir Duberstein <tamird@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, 
	"=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?=" <thomas.weissschuh@linutronix.de>, Yabin Cui <yabinc@google.com>, 
	Sriraman Tallam <tmsriram@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Rong Xu <xur@google.com>

Fix the code to enable/disable Propeller build flags to be
consistent with the documentation.

Change-Id: I992c6dbb4f25c80e7d983a17f4a798bb000d53df
Signed-off-by: Rong Xu <xur@google.com>
---
 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 1d581ba5df66f..53c02fc3b348a 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -121,7 +121,7 @@ endif
 #
 ifdef CONFIG_PROPELLER_CLANG
 _c_flags += $(if $(patsubst n%,, \
-	$(AUTOFDO_PROFILE_$(target-stem).o)$(AUTOFDO_PROFILE)$(PROPELLER_PROFILE))$(is-kernel-object), \
+	$(PROPELLER_PROFILE_$(target-stem).o)$(PROPELLER_PROFILE)$(is-kernel-object)), \
 	$(CFLAGS_PROPELLER_CLANG))
 endif
 
-- 
2.51.0.788.g6d19910ace-goog

