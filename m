Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFDF38DD8
	for <llvm@lists.linux.dev>; Mon, 24 Nov 2025 00:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763943809; cv=none; b=BV3beH3SeeR9aMpf0V2abDqkYAUYuguUFXBA1ODl+8Ng5wj7JM9gxGr2BL1Nbio5PXDNltbXqgjla2I3u/lrcB/F1BZL4U8VlcyubZEhJ921UC9mMLEfuqeV7dzVRoP4B9wBT/vj/5bZfKvuG898D78w4TQzf1CkPoeOuflHkUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763943809; c=relaxed/simple;
	bh=UBNCi+JwEpdLbNq63Kw6zv29wcmJRW5azpG7favyCqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m+5AgMXNr/k4o4pTguhkMGk63J4u6UPEvkcnuJ3h8lG/cqvzxVWE1cloNVVKoMrliM+Egg0h0WfQw2lbKk9+7jUAWjxcDH0kcG/2C5vpiuk8CNK7/GH4Ck4mJDt/Y93Q5n9AVNASJXWGkBq7rcCiJjLPGt5zIcMeVXaJSPEPpkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUZEVJAS; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUZEVJAS"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5942b58ac81so2624464e87.2
        for <llvm@lists.linux.dev>; Sun, 23 Nov 2025 16:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763943805; x=1764548605; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmO7WeRHELfWemd3T0oTKOnUWLtTpQSTMpH/BoQx1+w=;
        b=cUZEVJAS8tTf472ekE+6pFq3nQJ4saxx519sEGUHLOj97aVOwJoZ6NhkktZUog4Z0c
         QbAtV0QZXOQcHs2pNOOd3gjx1eexVAxKxIojuzP7fq+qwmQjW3jxBWxAQ5rSK1iiEPCz
         Luyt25PBsVRWFxLuYbtO+JvM+vEqIRCbtimlIPxO74ERy15ooJKIIcAA3uxgZ0j/h2kw
         G924xuYfjpMtucmoFbtk326XVJX1Y/2jmA2c02Puo8LQJi0aq8NGty8WlNbM3QPuMm+F
         NDrShfdKLUu1qTk9SGKJsB11w2vtrfHWAVyCTHgkdqcNOWWBxkIas/fVYRHSNs3isM++
         TwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763943805; x=1764548605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VmO7WeRHELfWemd3T0oTKOnUWLtTpQSTMpH/BoQx1+w=;
        b=rsvqzeMx34htfmfNRpfaZN6ES472Fls2oZ1xZE0lFErrevU+/RhRer/zOMWV05e/z9
         TsDMMP3ybq/ncL+a27K2jjBPcbIw1hhNrpDE/IHB6qT90ygpUvQXhZWxDFjn8iaq8IWV
         qoXiaOgQd/C5k5q1awg1VGnzwfZtIKn2CyhTgDO2NGtvzH1+Zx3SmLTEcDGym7CxSJJQ
         0e/rKUnOF8vugP0HY5pIm1sllADJhYcdFuLYKTn3JAdiiNLkfb4N74k8yowNpLi8/D/q
         Wt0tP0r6ceQaBa9vF4B+PKrD2d2MynUdbbBCtM2H0dExqdhrbK1IAfiHwxpp5ZfimVq+
         k/JA==
X-Forwarded-Encrypted: i=1; AJvYcCUYL5f/0PpeNTZDMqdClKSHkxluGaBtUa9EH7DQtM2mpA8xZnKraRnKOcdcGtnLeSyLDTVD@lists.linux.dev
X-Gm-Message-State: AOJu0YwKIwgSwP5NDRz/s5DiZn5cOPh9V82AkIUldNWRIGra7HBfLsqK
	6XSIxEgvxba/p1hyE1S+bKeiW3dyMGIjl6JNOg8SKjTk+2CdMeakMeuh
X-Gm-Gg: ASbGncsbbv3cvn4B2Q7Ccxl9Ol5HmA4sjrduG78VFdznitD8fut5+weAPt8yZxA2UyS
	Aw8vRUoicqaZA2qoqxsMIs5GQgR/SPPPDlX6LHAeP5aalogIpvv7cdebqOzn55jAdOtTMiAdj/r
	xOl9YOc+/j/hj9eDXYcZaZtxFUiGzHXKdrAdRPXgL8iD+yADJi53TXCXVsPkhoUvY+5pd6C5rWu
	LmJeaE0mEmJpU9tHzs4bwRnPwt/KoyfDy6UvxbONbojE4THxnHRHTe2Skpbgw4A5zjMCGbw6x5d
	VXkUHiQxXq8XwE5u6Qy4RPXgxrF6scRf3egdOIG+wSdhOEGTsGofcBUgQRzMpQvLzE0HBxByWYE
	pLmRh0eCa0pGNo2kMTpnFxrr3GTo6ztLqb3RsLHRDQuIXDUsQk9qWmoq6uTAZH7IzN6emRg==
X-Google-Smtp-Source: AGHT+IF4aoVvhwlxQOs8/bE5W87pZdLvSLg96T0R9i+b0fAYQSrBsEEdwuQJf/Z42sWlhlDPankRDg==
X-Received: by 2002:a05:6512:3b29:b0:571:8fad:ecee with SMTP id 2adb3069b0e04-596a3eb3235mr3529623e87.21.1763943804905;
        Sun, 23 Nov 2025 16:23:24 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5969dbd095dsm3708266e87.97.2025.11.23.16.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 16:23:24 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Date: Mon, 24 Nov 2025 01:23:21 +0100
Subject: [PATCH v4 1/4] rust: export BINDGEN_TARGET from a separate
 Makefile
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-gcc-rust-v4-v4-1-4e06e07421ae@gmail.com>
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
In-Reply-To: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
 Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Asuna Yang <SpriteOvO@gmail.com>
X-Mailer: b4 0.14.3

A subsequent commit will add a new function `rust-bindgen-option` to
`scripts/Kconfig.include`. The bindgen backend requires the `--target`
option for cross compiling, but variable `BINDGEN_TARGET` in
`rust/Makefile` cannot be exported to `scripts/Kconfig.include`.

Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
 Makefile              | 2 ++
 rust/Makefile         | 8 --------
 scripts/Makefile.rust | 9 +++++++++
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index fb4389aa5d5f..e4fcae38cc13 100644
--- a/Makefile
+++ b/Makefile
@@ -718,6 +718,8 @@ ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
 include $(srctree)/scripts/Makefile.clang
 endif
 
+include $(srctree)/scripts/Makefile.rust
+
 # Include this also for config targets because some architectures need
 # cc-cross-prefix to determine CROSS_COMPILE.
 ifdef need-compiler
diff --git a/rust/Makefile b/rust/Makefile
index 7842ad0a4ea7..ae7cbbd89da3 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -300,14 +300,6 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fzero-init-padding-bits=% -mno-fdpic \
 	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
 
-# Derived from `scripts/Makefile.clang`.
-BINDGEN_TARGET_x86	:= x86_64-linux-gnu
-BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
-BINDGEN_TARGET_arm	:= arm-linux-gnueabi
-BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
-BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
-BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
-
 # All warnings are inhibited since GCC builds are very experimental,
 # many GCC warnings are not supported by Clang, they may only appear in
 # some configurations, with new GCC versions, etc.
diff --git a/scripts/Makefile.rust b/scripts/Makefile.rust
new file mode 100644
index 000000000000..5c12b4b8c8b6
--- /dev/null
+++ b/scripts/Makefile.rust
@@ -0,0 +1,9 @@
+# Derived from `scripts/Makefile.clang`.
+BINDGEN_TARGET_x86	:= x86_64-linux-gnu
+BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
+BINDGEN_TARGET_arm	:= arm-linux-gnueabi
+BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
+BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
+
+export BINDGEN_TARGET

-- 
2.51.1

