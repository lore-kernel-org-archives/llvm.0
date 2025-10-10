Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C48223DCE
	for <llvm@lists.linux.dev>; Fri, 10 Oct 2025 21:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760130104; cv=none; b=k1A7eNhJVu5QZlMDPvjKDI5oZOkemCE0uJCH2LiXD4AU28Tvt/1BLhfr3TZQfhwfiCdznneaok87p+ocVMT4vCjCqqkD9WuG6vjf4x1jK33BED76IYmmzY2jN8jqaWyYE6VQq5mc0t046K+MZCkAAT4CsWsqyL75vcODAjoFCRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760130104; c=relaxed/simple;
	bh=pNzMSoChkEhBW+/X5G6uJEBZN8r8OfLg2tfWvU2mwmc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LCugZie8093ir+HXoK4W325DuAwPyU//kEex6Xdjt7jZBvNQ1lS9ogazxZX8QAhrrP6UeW78Z/r+AzgMsnrG2TBJ7v4tKKcVP0zMcWAv0KaGL4fL/c5ksi1tj3M4wHzI/Rd5zRX335WCdpdTCeIWZ9p7oVFU/yMzfC1+HS13Lnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qVFBZ88M; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qVFBZ88M"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-782063922ceso4143017b3a.0
        for <llvm@lists.linux.dev>; Fri, 10 Oct 2025 14:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760130102; x=1760734902; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PsuLBV0OmF371x/EIPOn0emYjgD84JXkkOIG5F90Bro=;
        b=qVFBZ88MrUijBHTPo71Ox7ASEW45o/7VF7yGvIiMvv4+Fi35TgyzI7GVAXixHTtHLj
         GBQtpxP42R7RNCBcJwXkLl1auwm6h95zmrB2vYQgc3+k2FRZj39mN8u9VeJHOH2DK7mM
         iKj8OBBEMcPTvjVmAXMR3yuD36sTp1qf7EPNCcBiD8kC+Hf4i9z1e1vJLTL7Z0M1VSyz
         KjZyk3Ny+inB/3qscUsAabHf+CL7y1OBrvhFmIOmqTaoA/UsLRHmcn6ILmXihdWYvdGv
         uJXbKabP10xK//O9qEctpo7hq0RF5sQPZuvoqz8eLncseE0ekOSh+4uCv+pAG/FsNVgp
         KnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760130102; x=1760734902;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PsuLBV0OmF371x/EIPOn0emYjgD84JXkkOIG5F90Bro=;
        b=u+ubFaETlOWx0bBT34reTEqGrZTavu2usUl0jsquayvuQgfNGeNUe62jlnEusYgFiZ
         TIQ2aK6irMHy4l8TLzKUt+3VeRDufP4G+8UAkkTXez7E0H/kg09u5nN+VhwGVhmOjL+q
         PuobCnt4Z9ZkI38BLtqA/o8tL+CcLnExGMdJ6D7uEw5arttlFnpUXKgkOqh7Ji/Ar2gk
         T2JiZEZ06357yE+855ozxr+31ZPbW0gBKnPugbDgIA+ldzl+QS6HuawwJFkijDOYzoI0
         bf2C2lKNDxyvymI+6OT2etDoSBIXxX5/2ufDzABpu/qHSRy2keoDqxyOYjg5G0M1Jv6n
         lDZw==
X-Forwarded-Encrypted: i=1; AJvYcCWHK831P/iOxwfZlFOmq+/NvHRsTVNA+odgA4CnvInCNqQqZQGe/SK85wuQIVcu+P2lNBzQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yzx1JnZhNMxpoKdBollE/YIWQLWjAzgFKlWWgWz17Q94lLL3IRp
	hjg64Kvu7n/LrFFaDgejw834gpuhcC9PhD0V+mEsTG6f388D+MbHaPV8DqNVw/zjiJ80uA==
X-Google-Smtp-Source: AGHT+IHz67BmbDRz7vaXdynm75bczZlJMUZRCdI88KE42hQdLfMx12/LTYPHuhem6rl8rxKh1lPnTUw=
X-Received: from pga9.prod.google.com ([2002:a05:6a02:4f89:b0:b65:2c4c:b5ae])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:72a2:b0:32b:6e33:7cf8
 with SMTP id adf61e73a8af0-32da83e0614mr18673280637.42.1760130101786; Fri, 10
 Oct 2025 14:01:41 -0700 (PDT)
Date: Fri, 10 Oct 2025 21:01:31 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.740.g6adb054d12-goog
Message-ID: <20251010210134.2066321-1-xur@google.com>
Subject: [PATCH 1/4] kbuild: Fix Propeller flags
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
2.51.0.740.g6adb054d12-goog

