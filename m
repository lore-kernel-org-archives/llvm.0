Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793993934;
	b=sFEiGVekIn4SBkXTMdT5licnYb+poxa9EUOwzgsSJeXos7j8+JDDeAruUbBL7YVWGiQl
	 3XHiu4usRW5TW8O81+njaXiB9MJF4+DBQKTJCwF1AHUojsufOpehK4FlXM64dExzXKv8G
	 ItclD6TZPDdB5Um6uglK/vCpg3otFEZvJ3Iq96ohF6RowjnMrcFPtL9hYw/1Bh8ZslZ69
	 adOT77CQDV9OLygP7EQDOn87JtT7NoUSjQWaoGFmYrVGMbCEYVzUETaWimBB7Qo1njvnY
	 OASFDQNATbGXAvpuR/qXbcFj8KnzVs7496uUaboE2P0OhBv4P0JmRuglxE8Q1gMyoXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=iQl8YGiFsFcU441hb/5cUGvukVssclT4Jhbsc8PIwH8=;
	b=KPEqx8NMDDV9+Buz83ucI6aSG94d6AXEbjU3CKBo356Y6xyAjNc26wUq4Ggo45jsTGgu
	 +wz1mByJXNo4i4ubhtgc98BdLK7tSxLNWMxr3SOwR8l8tRbmpJrVYBmbkk3ChVrW+dc2T
	 KWN0y6cxCWfCof0jjfSbVecSLr9aUikao9E9IGYxZL/u6Y/5nSqGwas56FGHilpZRpjl2
	 sHjPxMC4zttFtRavL4beenLef8LqKmWmeNIXIdlTzU2LJ8S6rERWGK2/Nh/gH9BzRHST0
	 p4oe0cPm9cGYlunNzDR0TUCuTjxugyfl798PfiMkkYdGhZVwHo5LSGNqgXBKzzRNq5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=G+ne5g22;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D385606A329
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 19:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D385606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=G+ne5g22
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37071c0f42aso1075376eec.0
        for <llvm@lists.linux.dev>; Fri, 06 Nov 2026 11:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793993933; x=1794598733; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iQl8YGiFsFcU441hb/5cUGvukVssclT4Jhbsc8PIwH8=;
        b=G+ne5g22VOe5yQUlSvcgT+sT3JOVQetMhYUzk29qwQ4HiZSw48e6nGWsSbkRRz4iqI
         x0v87iQX7alBGmz2PY/BM6Q3n3kJijfqnQ3f1fRVv+9GeXAo0r07M/peUDtGKsl5oPlj
         HZP34o4ezjaaWKQjnjQA7Z65XQxuFUteYjhLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793993933; x=1794598733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iQl8YGiFsFcU441hb/5cUGvukVssclT4Jhbsc8PIwH8=;
        b=qRhTqRuCQeM/lV21+ylBVcrUQRmYFBxYxd64Zocghafaixoo1v5/WZdCMgMcmlyceW
         11oSxbc3vKVRbXSEljGqpp+O94wqth8W3kwWEHxBirMvX2KBSrllQsdZhG4Fz4lbHO52
         9sl/r7vNik1avsJUMiJHjWluZ1FY7FEIigDPH3pxyjmb7dhB+oaHPMGXtREVOxITkTV0
         YHTAlsl+9QbNhLKYbfAQFzjT8luzyVM8bJiiS331QgMUvCT4DRThLGXfJQYnqEdgFg5G
         tdI9kKwHX2s9pFM9G1XjykLpSMj1dXzuG0hEzvOFDTjxcPOi1hizUBbCtTapwz2uHSmx
         e0Rw==
X-Gm-Message-State: APuU4Z/8SEEuAi+75HFw94y1naLv+I2xNeMq9gTfDwQwWVGus98nA69U
	al7RGgVLv2rutuqZpJ+DMr79ZnlgMEt6DMSVnaoGHJM7tze+hf1mY81absWnGV254hGVZhbnpxK
	UeV19vwc+6YY=
X-Gm-Gg: AYBFou253/PEPl5dOGg4TtC0UVeOT+eGfAPC4vtr1lUJLBxpxhxF73sI1Fo9n1QOVAY
	eUaqvmSrY67JmzHzKO/rpHsBkUhGZTdDlO/41QGVGPUH4V7xQPQwP6jzhuKWt8xghBHOMz1M4o6
	+lezK8Jc5GSkVKwUmjPm8B4kUjsKj7BldINlG3n/zXmnbNrVKlf8cOwF7vxBK6oY/dSHm9/Nd9k
	gLTurQKItYtRfBwfbGuMJbzThYA4zCaI1XK+dhUlEcQVn09zoDR1gklwaBTrgvJs8xj85OMqIMm
	cxAp5Vm4fJVTApZkpjGypRbWAIP5eIKhvcy8FdY/R59RAK297TDbksGyxFDBu8kpDPhOLZKav2I
	+4xmSQEGzAgPa50TqT8g1i2lzvV1FxVo5ljokVka4dmw9Vskd3mIHbTABLufsfZTvjAELtGp7Cf
	id6BvGM+yjzQfrIQQKzB0Bd5zD6Ax4GONfsqwsV1BVYDUMaZPwfbM5Y8w56b+pvFwsK0ZisN/wg
	rOPulEXv1wQ5bku3rjqk6qoDXwm48HY6rEepoiuk0bqmKCT60u3cW9oGaTuH21Pejfohg59aXx/
	rQMTifgchyj1E/YnuMA1bCRxtcigLdxaXmdCenzA4zkTOtflj/gRPwFgdZ6FFWgogCuFAhXRzYo
	1OMlTTanU0+EFdA==
X-Received: by 2002:a05:7301:fc83:b0:36c:b1a9:542 with SMTP id 5a478bee46e88-36f75d21bd8mr4376444eec.29.1793993933018;
        Fri, 06 Nov 2026 11:38:53 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:57b2:a393:143e:afa7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651c57asm9045755eec.2.2026.11.06.11.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:38:52 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	Rong Xu <xur@google.com>,
	Han Shen <shenhan@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Yabin Cui <yabinc@google.com>,
	Han Wang <nesthanwang@google.com>,
	Nilanjana Basu <nilanjana.basu87@gmail.com>,
	Snehasish Kumar <snehasishk@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	stable@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	Bill Wendling <morbo@google.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
Date: Fri,  6 Nov 2026 11:38:01 -0800
Message-ID: <20261106113800.v2.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Starting in Clang 21 (LLVM commit 2fc4a4a9d3a8 ("[Driver][SamplePGO]
Enable -fsample-profile-use-profi (#146795)") [1]), the Clang driver
automatically passes -mllvm -sample-profile-use-profi whenever
-fprofile-sample-use is specified, enabling LLVM's flow-based profile
inference algorithm (Profi) by default.

However, as Rong Xu noted [2], the kernel's AutoFDO implementation uses
flow-sensitive discriminators (FS-AFDO), and Profi has known issues with
FS-AFDO that degrade runtime performance compared to LLVM's original
profile propagation algorithm. In addition, Profi's min-cost max-flow
solver (applyFlowInference) can hit pathological compile times (30+
minutes or hangs) on certain kernel control-flow graphs when profiles
drift slightly or when combined with GCOV [3].

Pass -fno-sample-profile-use-profi to disable Profi and restore the
original profile propagation behavior that kernel AutoFDO was tested
with. Guard the flag with clang-min-version 210000 since it was
introduced in Clang 21 alongside the default change, whereas
CONFIG_AUTOFDO_CLANG supports Clang 17+. Note that cc-option cannot be
used to probe for the flag because cc-option invokes Clang with -Werror
but without -fprofile-sample-use, causing Clang to fail the probe with
-Werror,-Wunused-command-line-argument.

Although SampleProfileUseProfi currently defaults to false in the LLVM
backend and is only enabled by the Clang driver, explicitly pass
-Cllvm-args=-sample-profile-use-profi=false in RUSTFLAGS_AUTOFDO_CLANG
and --mllvm=-sample-profile-use-profi=false in KBUILD_LDFLAGS as well so
that C, Rust, and ThinLTO flags remain consistent even if rustc or LLVM
defaults change in the future. Unlike the Clang driver flag
-fno-sample-profile-use-profi (added in Clang 21), the underlying LLVM
-sample-profile-use-profi option was introduced in LLVM 14, which
predates the LLVM 17+ requirement of CONFIG_AUTOFDO_CLANG, so no version
checks are needed for the Rust or linker flags.

Cc: stable@vger.kernel.org
Fixes: 315ad8780a12 ("kbuild: Add AutoFDO support for Clang build")
Suggested-by: Rong Xu <xur@google.com>
Reviewed-by: Rong Xu <xur@google.com>
Reviewed-by: Snehasish Kumar <snehasishk@google.com>
Link: https://github.com/llvm/llvm-project/commit/2fc4a4a9d3a87a9e11c48ef25522aa17c2a71003 [1]
Link: https://lore.kernel.org/r/CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com [2]
Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [3]
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
v1: https://lore.kernel.org/r/20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid

Changes in v2:
- Explicitly disable Profi in RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAGS
  as well (Rong Xu, Nick Desaulniers)

 scripts/Makefile.autofdo | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
index 57a3aba6ffc2..55fda66ad960 100644
--- a/scripts/Makefile.autofdo
+++ b/scripts/Makefile.autofdo
@@ -13,13 +13,16 @@ endif
 ifdef CLANG_AUTOFDO_PROFILE
   CFLAGS_AUTOFDO_CLANG += -fprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -ffunction-sections
   CFLAGS_AUTOFDO_CLANG += -fsplit-machine-functions
+  CFLAGS_AUTOFDO_CLANG += $(if $(call clang-min-version,210000),-fno-sample-profile-use-profi)
   RUSTFLAGS_AUTOFDO_CLANG += -Zprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -Zfunction-sections=y
   RUSTFLAGS_AUTOFDO_CLANG += -Cllvm-args=-split-machine-functions
+  RUSTFLAGS_AUTOFDO_CLANG += -Cllvm-args=-sample-profile-use-profi=false
 endif
 
 ifdef CONFIG_LTO_CLANG_THIN
   ifdef CLANG_AUTOFDO_PROFILE
     KBUILD_LDFLAGS += --lto-sample-profile=$(CLANG_AUTOFDO_PROFILE)
+    KBUILD_LDFLAGS += --mllvm=-sample-profile-use-profi=false
   endif
   KBUILD_LDFLAGS += --mllvm=-enable-fs-discriminator=true --mllvm=-improved-fs-discriminator=true -plugin-opt=thinlto
   KBUILD_LDFLAGS += $(call ld-option,-plugin-opt=-function-splitting=all,-plugin-opt=-split-machine-functions)
-- 
2.56.0.455.g6c5a503b38-goog

