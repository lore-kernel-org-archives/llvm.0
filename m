Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E7C2BE7A6
	for <llvm@lists.linux.dev>; Tue, 14 Oct 2025 19:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760469121; cv=none; b=h/Bgnbg3Et56IOYHzTfsptMMscHo/c9t6dyafOVjoA0EEFNekinxOkmbMeTt9+ThUhWMSvRuj4sSsusW1IWmkav3WHmvdVEsBc1xy9eORW8hFtKtd95YwVMIR7G9qaus8npC1t9isGZBz6hVPIxuD/0JpfOJdXdJvnpueu8Zdr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760469121; c=relaxed/simple;
	bh=UQnXFdfx5dWAH9sx3W0jjTCJ0moJLOzBU+mWcv09QMo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=V062geknahA6jNxDvGvIKeYq43uwTteaON9Q0d0ZwMHAvCRos5b8g6kMiNfZR2ZV9QiEmZK9neeny/QkmBHayJg+e3lit9FtOakdlKqHrXv49TERt+VIsK2sjdO2pmktzIFGLQxyxNBVaO8x1Vo2IofI96oa2oX2JiKQ6oUO04k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uMfxdHQi; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uMfxdHQi"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-78104c8c8ddso8356649b3a.2
        for <llvm@lists.linux.dev>; Tue, 14 Oct 2025 12:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760469120; x=1761073920; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HetZVCC/q2AyiLAEyoUW1UONBOG5swbtHLMRVYpsp5s=;
        b=uMfxdHQiuaH2se5u3s4XhDBkblj+My+L1r9p8NAFmpDMbgMiB7QmY/RYz1xihMrfvr
         bVPw5vtcPCI6VHsM9+JFKJtoXdyt3llbm1hfdYGG+KtCCkGlMlQKlUOwbPfK3hdc7R4o
         Ug9FitPMnzeq6vmtpH1Lwitnxs6cp64TFkx42gypJIy+uYubhalMzYgz/FZpnSjPk/gR
         QxrsEIPOiMGbPWaxv86g+br9TmYTncXrPyRBd/dQf/KZciQAq3jVxkr+ZbDsNEM8hFxx
         j7kNoTsajRoib1igvJO/gOy5wMzYBdK4EqBpyT4sqEj8giZXjPQs/pBamSgrzb4aSCDG
         +aUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760469120; x=1761073920;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HetZVCC/q2AyiLAEyoUW1UONBOG5swbtHLMRVYpsp5s=;
        b=LsjnkUuc00f3HFnw0yRxP1A3kwkx5cSnaA2DLi88pg1hCtq/LTF7s6FrZAcFJIRJdN
         vPm885XDU7W6Sih6n7Byb4JgLlF9LMV9Rg+wNcF80o9/JlPfHg5yoagYlWalWe5Z7jY2
         N4Z7exeC3d29pa10QoA5o/jMIQcp9QD77N+JspreCqueNsgOjpx1TR8y2p413lwy/s0h
         mNAkPsOY3dklvpzDuj/BPqCoLysPb9Gdxee5/eMoZsnKq6TDTFddQ6zGXLRy0WC+ALWP
         VAVJfCOsbwlALfpez637o9KcT2gd1obrT27AOTY/4O9rVaYJJ8FdexeSXRi/VH7e50nA
         7WGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUYZNljc89ptaaqlL3woeY/9IsL9nxftA+NaB5sJFKVVuWrHGGGaWgO6q4EkdDeOY/c55M@lists.linux.dev
X-Gm-Message-State: AOJu0Yx18SOpsxwE0B9l0/b8cUAr/DxJ/cJfQ5ka0eV7Qz2UiaAMCUbg
	0c23g6chsHntHMIf7v3aWMFtTbQa36BcE73hHxYl8IJudyKfjGLagLJab4t2lfy8DdkGWQ==
X-Google-Smtp-Source: AGHT+IGqxn8ztfvetOUDjhKisKtCGCDVJ4GZc/Y5aNTZgsAPMD/o+pkKchgR04YWi9BC/7CxTDwJF9c=
X-Received: from pga19.prod.google.com ([2002:a05:6a02:4f93:b0:b55:1aa:d75c])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:218d:b0:32a:ce3e:fb9b
 with SMTP id adf61e73a8af0-32da84649eemr35608986637.59.1760469119535; Tue, 14
 Oct 2025 12:11:59 -0700 (PDT)
Date: Tue, 14 Oct 2025 19:11:52 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.788.g6d19910ace-goog
Message-ID: <20251014191156.3836703-1-xur@google.com>
Subject: [PATCH v2 0/4] kbuild: Fixes for AutoFDO and Propeller builds
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

ChangeLog:
  V2: filter-out -pie in scripts/Makefile.vmlinux_o
      This fixed the failure reported by kernel test robot.
      https://lore.kernel.org/r/202510120709.Wx3q4Ppg-lkp@intel.com/

Rong Xu (4):
  kbuild: Fix Propeller flags
  kbuild: Disable AutoFDO and Propeller flags for kernel modules
  kbuild: Remove MFS flags from Propeller profile generate builds
  kbuild: Add config to assert profile accuracy for aggressive
    optimization

 Makefile                   |  9 +++++----
 arch/Kconfig               | 11 +++++++++++
 scripts/Makefile.autofdo   | 12 +++++++++---
 scripts/Makefile.lib       |  9 ++++++---
 scripts/Makefile.propeller | 20 ++++++++++++++++----
 scripts/Makefile.vmlinux_o |  3 ++-
 6 files changed, 49 insertions(+), 15 deletions(-)


base-commit: 9b332cece987ee1790b2ed4c989e28162fa47860
-- 
2.51.0.788.g6d19910ace-goog

