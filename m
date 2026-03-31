Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4658E29DB86
	for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 12:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774958980; cv=none; b=BtyuR3jhmHOCZ8WNUs9Wy119p8TGVoY+AbLAlnwld+pRM+Fvfz+mG2eaGV23I1YLH9s9VkEC5utKWTsqOgyvnZOl+UtEenCYW6JIv4aJA+H41uHJl02dfr9wFrxz5FI7817XokYh0j8j0HRgtF3l2QgbTD0tQdbgw0vn/SnmfH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774958980; c=relaxed/simple;
	bh=wV4enVuhg3e84+4NenFbA40n2JgAal9ACwmd/KfHdgg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=IjyyOnXr0M3u+nR+GJNerLYQThgWrfg2X0/xiTijZ4qkwP8OuVEQZ0xMJ5YIxAWzlz2tLW/X9hIQmX2ioWprhp1Z3kyi8HR2wY1LWoUkEu+3237VI84Ty8oGDvcj4Smvb34NzY1HSR0TjQpiimMWTvBdw8tm/COSWmbnOvJQ/Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p5VWbBaG; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p5VWbBaG"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4837b6f6b93so51631185e9.3
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 05:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774958978; x=1775563778; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cke73iuOs7NesM44ZZUjsyGg5Z47ORqSakwVW7CmRSQ=;
        b=p5VWbBaG5mHPnnSL+QmlkXU/up21ReFTFyEtCOyCcire8GAd+uXc21YY93rDmcMNFj
         hXE5A0EPMSJf98g5jgNd1MIhuGrwXzMVMouPzYeqq6mCSzFM/Asurf2o5jHs4t4ONpz9
         KIpbWzsRoJ/65MaYuwC5gP+t70ON6PkG13DRspFDD5wr7NVtmZEgEUoFoR2WGsPvVxkI
         tE8SwOWThW7tSGtOMlfPDHJhNxPKRMTiD5L7QJEqmbd7VVDje1SCdqoJp3P4gpXcDO/Y
         WcCqLCD6X2M6hBqlZNxVN95dw/f6dFpsOJnvdbqSY77iDOjOLzyLQilz416v9Hfjkv4h
         yDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774958978; x=1775563778;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cke73iuOs7NesM44ZZUjsyGg5Z47ORqSakwVW7CmRSQ=;
        b=F2kKMps4tTGTVz/rX11PCVeloasDF61ENu09emL5RoMnwkJceb+HAQOy8oiuc+R6iq
         PEy9WrsGKTKnpF7+vbZZFp3EAZLDxf4oQgLdZlbcKr0v/LjzNBcnEvvuDPm3rnxUBq4V
         9bQZkKp93rTVE1r77qw9e8ByEFeR8OF/K73RBI1Odz9EG5RO4lRhFuJhpdMvT63vwwMa
         F3XbpPF3oUMdd363c1LSzpKitsmtHF2tv1+tPDRxedF2amo3QWNsFM0YoJz0o66O6aED
         c8rToLRyMTJ6IbphrnDewu0PjUghY7foUETqx4lPw6UltNVLRd+IyjGlArTld5T6Qj/J
         duDg==
X-Forwarded-Encrypted: i=1; AJvYcCWhihgh/537EDBUnlLvBYK86pLiF7yGq238iza+2qUDH9MQ+0j2UxQ5GO2FaRVXpll3YiiP@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/+5c1Aj+vdl7lxBQHEKTL/djn/VQON2TiqFyq4qcTKHUBPpvT
	pX0+ZSdNOOz3M8nFbT7vdnYw1v4VOHVjPW7re2aFGmri9lF7pNt48Xo6p+VxKscx1Zv1H4WHGMd
	4A1cQK2HbLjjZbDCp+A==
X-Received: from wmri9-n1.prod.google.com ([2002:a05:600c:8a09:10b0:487:3881:c015])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4744:b0:486:af22:4a2a with SMTP id 5b1f17b1804b1-48727d5a2e4mr269041575e9.7.1774958977458;
 Tue, 31 Mar 2026 05:09:37 -0700 (PDT)
Date: Tue, 31 Mar 2026 12:09:29 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHi5y2kC/32Nyw6CMBBFf4XM2jG1DZC48j8Mi7FMS31Q0ymoI
 fy7gHuXJzn33AmEU2CBYzFB4jFIiP0CeleA7aj3jKFdGLTSlTK6xBsJ9ZgGySgvzOQFbUnOOaO
 4MgTL8JnYhfcWPTc/luFyZZvX0mp0QXJMn+11PKze34PxgArr1lBdlVRropOP0d95b+MDmnmev +wocw3HAAAA
X-Change-Id: 20260325-kasan-rust-sw-tags-c5afff30e63a
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2086; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=wV4enVuhg3e84+4NenFbA40n2JgAal9ACwmd/KfHdgg=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpy7l8gkHzzw0C5zlq6/o1yTp6OvHyYxyITfBSp
 3Mx3fxF3miJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCacu5fAAKCRAEWL7uWMY5
 RtQTD/9E4XgE76LxRFvnnbVAxdxxiM1b2x5Rc9fMvssYagCgOu8J/ljfnb/mhbuotjCDMvJgjg5
 ctqh6i7cZ9EH3yO+gEdLCVeLVUrXgW4Sz69mpcBqIVc6zJkKdmAebXyMU3jctMecANvUPfTgg4C
 2h5asg58AjfWiyUJeXN5GWaaqocfzVdcL4/6R+d73UxXpzu6gSbsZzyU6QEbY1iTfgY0XMDJzoS
 6gZmY3bLAgt0YzytA2Y89HtbFwZgt7GED9jrrWkIz4eDpNOgUY8eu/VBmLmP9shlMK0wNwh/uFT
 MxaVLUtIvYBGv2AF9Gmjk4bHKPE7AWrAGK/r+Z11NL509o4VRK4IWOop+Gk2S/JyEq9FPIq5GLZ
 GtGP1zG0zCGsblZKBwWV6U09JxOt7tJlQ5RkNqepV4kDya/+mkD0jAiyQZAniydedd6LN1DXSNs
 oiFPU7i4UB+S6+54dOtdRolMSc9FTY7nNAf3DGk+a5eT8TJe/G9rjq1DNYsvpT8HTffw4yRO8Vv
 DGSqYyKVDJhIeLWHepSzgWOj+HE/DsEd3AGXCuLC/Eh3MQIL+QmB2PO1oh+4xoempps66VIH+hz
 CnXWvI/O1GlJB6K5AQ7BhOJ2aRKgFqPHEgdTWQvxoNEI98JmTcWBgGU0W+FmyRPgionenS7dwTX hDqp63RhbLPjSJA==
X-Mailer: b4 0.14.3
Message-ID: <20260331-kasan-rust-sw-tags-v2-1-f6765e3e1a2f@google.com>
Subject: [PATCH v2] rust: kasan: add support for Software Tag-Based KASAN
From: Alice Ryhl <aliceryhl@google.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This adds support for Software Tag-Based KASAN (KASAN_SW_TAGS) when
CONFIG_RUST is enabled. This requires that rustc includes support for
the kernel-hwaddress sanitizer, which is available since 1.96.0 [1].

Unlike with clang, we need to pass -Zsanitizer-recover in addition to
-Zsanitizer because the option is not implied automatically.

Link: https://github.com/rust-lang/rust/pull/153049 [1]
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Drop the first patch for -Zsanitizer-recover, and mention why in
  commit message for remaining patch.
- Pick up tags.
- Link to v1: https://lore.kernel.org/r/20260325-kasan-rust-sw-tags-v1-0-7d3a765a72aa@google.com
---
 init/Kconfig           | 2 +-
 scripts/Makefile.kasan | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index 444ce811ea67..545cbe889a52 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2179,7 +2179,7 @@ config RUST
 	depends on !CFI || HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
 	select CFI_ICALL_NORMALIZE_INTEGERS if CFI
 	depends on !CALL_PADDING || RUSTC_VERSION >= 108100
-	depends on !KASAN_SW_TAGS
+	depends on !KASAN_SW_TAGS || RUSTC_VERSION >= 109600
 	depends on !(MITIGATION_RETHUNK && KASAN) || RUSTC_VERSION >= 108300
 	help
 	  Enables Rust support in the kernel.
diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index 0ba2aac3b8dc..91504e81247a 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -71,8 +71,6 @@ ifdef CONFIG_KASAN_SW_TAGS
 
 CFLAGS_KASAN := -fsanitize=kernel-hwaddress
 
-# This sets flags that will enable SW_TAGS KASAN once enabled in Rust. These
-# will not work today, and is guarded against in dependencies for CONFIG_RUST.
 RUSTFLAGS_KASAN := -Zsanitizer=kernel-hwaddress \
 		   -Zsanitizer-recover=kernel-hwaddress
 

---
base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
change-id: 20260325-kasan-rust-sw-tags-c5afff30e63a

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

