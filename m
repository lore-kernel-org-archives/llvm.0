Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE9A2F6569
	for <llvm@lists.linux.dev>; Fri, 10 Oct 2025 21:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760130109; cv=none; b=H9VWL9k13srvlvMdrUpQnQM39PuznEJEyAABbnOuk2T9Bc4Ofa/MLqRPWcbWkAFi8/326kOP94ZYNDLvPEiiSLhCr0kx5x7aI/01Ng7QBg62N0VZgS9blp9128rmdUmk8/Ouwy6BLsfApaXa8gFEr+UakQo9XO9JuakMFOxVN/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760130109; c=relaxed/simple;
	bh=A36UU5cjawCFn9zg3EVWTgnlfdvC+WA6eTuKIyjz598=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tw51C6moJ7e0xWrrTdLNC8ah+A/iV3eJHhJ/ujqK6hIAr2N0/oo7xcG+0qeg2h+t7GVgTjEfM9vrRJnuckpWBevSRWCbL8F9wQWmm/VHKCA+ah0WoZcC3fqNx2os0FHzvcWtfK669vrFT5QlwGsiMEs2T66qho9b3RRFCRY3NlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M4hXaFWz; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M4hXaFWz"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-781171fe1c5so4737051b3a.0
        for <llvm@lists.linux.dev>; Fri, 10 Oct 2025 14:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760130108; x=1760734908; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=F4/DIS19FEQXbD2as28eCi3gphWED48d1Ubr/xwVaHs=;
        b=M4hXaFWzZG3u2KHZpNM6rRvyPW2FlZMRvMj9zpvYMgLnK25t/pleaMv0qB5UL4fCU9
         tkrJDbw5DFCNW0ylVE1+6EwTrjAs0U4MVUD2avQ+wlCUxwrhlIQxwBlvJp15L77o8pkX
         73tWKx34FMOkCzCz6m44wBhCJ8Gb6ZImkhemUOT2smobFEEBnKWUYf3/DczMVXRlclLz
         GGI8PX59mb+Ysv4Yr42sqc3ji4l1KnQKZfU2viyVgANl91yOUrfT0PEpB8+FZ/gfvmbW
         VCcOVgWI4UHTtIEbsd/QTKCP5tUCAXFbmRRZPorknGO1fk7lTWkW7Hx1kam2pTJDc7B3
         mD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760130108; x=1760734908;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F4/DIS19FEQXbD2as28eCi3gphWED48d1Ubr/xwVaHs=;
        b=GQHbQz587z813AxrMRW38cpP3abMK2O2j8GCp9t4Eaq6xYDzuVa/JDhwk/VCvSu9BU
         Es1oAqOEdfJ0f2Pf9auhny6/ErCBveggWRWtqn8feuSjyT25+ZSt77F34FvmHBxYWk3K
         md+2sXzfuVwKu5vMDPZXKe+RQP55ORoSaBZfZdD5A8YIdaZdoYLMBkWTYuaFGovzHGiz
         XJStf8zLjmTHp3X7OlTQeaC24Dwe8SU0xkyZ9QCNB6uk/HhpR1JwwvLH7nQAZQS4fBW5
         80GwO70KLVvIUUVMV3U2p0n2moOgUEez/r130MuAR/8qVgNoq/BC784XRlbmxnMXUXtL
         6lDA==
X-Forwarded-Encrypted: i=1; AJvYcCUdLMVLP5479PVM3Y3M3ZamXGm821grd7qjuSsPBSSRI+ZGKxvsT2IBSFsvCl3awvQD9boT@lists.linux.dev
X-Gm-Message-State: AOJu0YzyHFMcedkWo/tfKAUv7pOmGJH/BXLkFUISevKcfuNaCQ+MLZJq
	o7l3IcaXj7LjGMqDzMXNjI+6kbIeJsaTNkBzGXVjx7/MTygy3j45TYGpmhiYV4s7ff6eMw==
X-Google-Smtp-Source: AGHT+IEtMBLg0Ov+r6OYaa4ihcCMD48GJCeyOSHqGaacD/e1SfaXFjuFV7CxscQBzB2FYKZBslyQNH4=
X-Received: from pge21.prod.google.com ([2002:a05:6a02:2d15:b0:b55:a4b:fe47])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3386:b0:251:43f5:cad4
 with SMTP id adf61e73a8af0-32da80bb8f5mr17111428637.10.1760130107536; Fri, 10
 Oct 2025 14:01:47 -0700 (PDT)
Date: Fri, 10 Oct 2025 21:01:34 +0000
In-Reply-To: <20251010210134.2066321-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251010210134.2066321-1-xur@google.com>
X-Mailer: git-send-email 2.51.0.740.g6adb054d12-goog
Message-ID: <20251010210134.2066321-4-xur@google.com>
Subject: [PATCH 4/4] kbuild: Add config to assert profile accuracy for
 aggressive optimization
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

Adds a build config to AutoFDO to assert that the generated profile
accurately represents the intended workload. This enables Clang to
perform more aggressive optimizations.

Signed-off-by: Rong Xu <xur@google.com>
---
 arch/Kconfig             | 11 +++++++++++
 scripts/Makefile.autofdo |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index ebe08b9186adc..6fdc676cb0fe4 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -886,6 +886,17 @@ config AUTOFDO_CLANG
 
 	  If unsure, say N.
 
+config AUTOFDO_PROFILE_ACCURATE
+	bool "Assert AutoFDO profile is accurate (EXPERIMENTAL)"
+	depends on AUTOFDO_CLANG
+	help
+	  This option asserts that the AutoFDO profile (specified
+	  in CLANG_AUTOFDO_PROFILE) is collected from a representative
+	  workload, allowing the Clang compiler to perform more
+	  aggressive optimizations.
+
+	  If unsure, say N.
+
 config ARCH_SUPPORTS_PROPELLER_CLANG
 	bool
 
diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
index 5bcfcef273745..36abeae2accdc 100644
--- a/scripts/Makefile.autofdo
+++ b/scripts/Makefile.autofdo
@@ -11,6 +11,9 @@ endif
 ifdef CLANG_AUTOFDO_PROFILE
   CFLAGS_AUTOFDO_CLANG += -fprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -ffunction-sections
   CFLAGS_AUTOFDO_CLANG += -fsplit-machine-functions
+ifdef CONFIG_AUTOFDO_PROFILE_ACCURATE
+  CFLAGS_AUTOFDO_CLANG += -fprofile-sample-accurate
+endif
 endif
 
 ifdef CONFIG_LTO_CLANG_THIN
-- 
2.51.0.740.g6adb054d12-goog

