Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007364;
	b=snBtciCLvwrETTGEIOq+ivN7vuc9ZUhIlaEflFwtBYp0ROjzcbHdMSt7fxdzCR4Ru78E
	 //EbS4t4sDP55c36JKyNx2ddiY7WdovnGGiWTqFdiQDdUHz7HSKDkz9DRBWtyUjtGu8rX
	 K+N3S2rK5XUDP5W72w2pqIwBuvjydxApP2hkDdjM9Ppmutu4rfiAxW94Tdc++R89wSwtw
	 nSUD9SeKVSfxB1za4aw465QX3bo91q2hR8GYRv49n3R+DqoGYGriw0S3HBHgTFMJYk1yT
	 FxwVGjI4fzUJsY5IcaOA2hP96Na2qsCvueM3UXildLgO+wwJYfw97uwE/aFWLRWu+lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-B4-Tracking:X-Change-Id:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=8XqsJBCy3LgGuVcdZnn1AgUSdezItKIAUZq3HUhg82k=;
	b=hUEaZVTFNXkWl5dEPT5Hj9PA8vMerPWo/umXAjf25323x0MuUidq7RXaS0BD7EQjVT/t
	 v8X8ql7bb5xbp7EYwbet270Ozva62Gg+tQu+RaHaApOQlRZwUx/Bk229SnIQFb/mcR/s8
	 tkQmreGzdb+dk+ReQDvczxDYrh1lB/kdg47Own7QfsFWVtude1tQhPzk6WtpWIaMZ9TKw
	 4f68KhkI5AY++wY0c9CY6sYa4iTKy010y9ebND8WXLO7/mpPaLH8/E1GhMVVSq9Se4EwJ
	 WTfJ373sqDRON5XnB7ZqKSlcVVYCdMs28R2v0oVJX7xI9M9N3ZeclZEJJn+lP5OHYdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l2XdjOD5;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1560606A31C
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 13:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1560606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l2XdjOD5
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a17741243eso5726285e9.0
        for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 05:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795007362; x=1795612162; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8XqsJBCy3LgGuVcdZnn1AgUSdezItKIAUZq3HUhg82k=;
        b=l2XdjOD5NONmwZHPQtQTaFo3nMWhDmNdHGS02P4FBpWaRcyzf+NQ0/jG97U0boNKx9
         ibBMdbRMCZuQwBXgB+eGgkPONkChOK3G5zCoDg3rcIk1eQynd7dj+Yg1MvWODAIRUhEE
         Ey+iFmLQr76irCEeujaVbk3oRQeirnxY0L6zgcFBNPMQXjUDKeBA5/9Ya9bgF71m3aLF
         4Na3jODXdP5faUmr3VjaWvL5swtLqwY6kLINfjAhzgNG15md2M9z5vxwKVipztUZol5g
         UWJj9hTzGt6yPjVvN4kYEqoIqg8MXhJLhOkRyKVBZKwRP/O/jGtxwj9rit8mdiNoVL1+
         M11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795007362; x=1795612162;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8XqsJBCy3LgGuVcdZnn1AgUSdezItKIAUZq3HUhg82k=;
        b=VmEtCDICRk90r3vEp3r0/g3rPFEDwJO1bcIE7DZYGFkdWUa1DZVJ/Cj6BkeGpN2oqv
         iMLMKPhb+e4cUkRmGhyMasc3h+wgEjet9udgND4SA0d50FuPqfYNwjDq9M7R7ruevOIA
         zlp+6tsQCTbFcVv9gQLC3kgiTRnW+L7iYN2EacrIbXXeduFmumzcMn3Oa40TEUsgE62Q
         jfx0YbZeFhQOpxhL4r7GbLhxpBv7hDGlSBVCIJwNtDi63QaO9tfjnJOdzLIVQpcwkMB2
         dbY+zrNcj4udD82kgSqM+naAeS51qPHzX+M7X0F8VrDOcl8gQHAD5aWIUMYNIl2RjEK4
         FXiA==
X-Forwarded-Encrypted: i=1; AL+hErHjjaeHtRjMIWoccJZByiDxoqXXjSY2FrDDzFTSRr+OGyQbS+jNn+0rIvjLDgNgytR1YHQK@lists.linux.dev
X-Gm-Message-State: APuU4Z+gPs+k2h9IlBw1ivuMVKe2h2+gZlKFdfQBrKHMnCJZC32jG4pp
	RVofW9+GB2kJ0LMdnR0gAYS0bh0GKPf26Iu8A38AfJuQVgsZFMbiO0Z5i8YMhVG/EqYIc5gnozu
	btbIkuru7bjrqD9MGVA==
X-Received: from wmcq6.prod.google.com ([2002:a05:600c:c106:b0:4a1:b721:2a42])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b8a:b0:4bb:6687:5394 with SMTP id 5b1f17b1804b1-4bb7da13abemr52303665e9.9.1795007361512;
 Wed, 18 Nov 2026 05:09:21 -0800 (PST)
Date: Wed, 18 Nov 2026 13:09:18 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAH2j/WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Nz3aLS4hLd3NQioExaaV5yCVB9sa5lcnJSsoGpoVlKmqkSUGtBUWp aZgXY2OjY2loAQj74VGYAAAA=
X-Change-Id: 20261117-rust-merge-functions-9ccbc0516df5
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2098; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=tVfSyhjcztmSSxfmenaNsWCKesbHq9usuWxfMF/g4mA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq/aOAN7wTksfRJhYvTT7pqJDf338iJai21scbg
 0vUYym7VCWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCav2jgAAKCRAEWL7uWMY5
 RlzaD/91J+a8g8dl/Kov07Q3+d3A1sHPlOTB0kLyl3AX27lULux87Km19pgAMPxxJNKxEQ5J4vv
 XGKJqC+UOAo9dMl2o29NCqagkTejsVLitDYxUL5o7uTvMeqqT+iQlAf9r6Qrdb2Ycw8ElgYkRo2
 T2g8FFeZ/vieOEtEHM83c5P4IIvzZW2zSgGjqo6P8w5az+m5/MKxeQvRFsH+hL1H6CNN2E34agf
 /FyrgFdn02PbRTK0Ec0ZaAD/m5F+zTjKvndBMxK/ghN9ptnt2uT4eeOoLt9aLBSr2q9PKLbWWuZ
 Q4BxuEJUC1rG9FbMHhpbpRyn3NPcpZQMlus5eD8VfyBm5udnLb2y0WqoQfRB6CT15UQGfHjZgt3
 ypLAFsmtpWpKbFE6tE6QGwkNKVr6yYHjPojXZdccwCc7VkcKES5eqHzAdslkXNrphBB2Q8Npiak
 hp5isyKL+UE49dnz9bYz++A2jts662hku2eAcU+IcIQY7KhEHOniA2yfdxmonm+p+U/eDLwuLb0
 OJjm9z1jelpQhg7aAiams/2FLFAM7ani7LFCX9Sb5nMcxxY5VEpktsFcBIF3ja30ZysHON0/OMa
 ZFDLJapU9iirToguu9KJ3eUizTI7W4jB973AsTBKQp2tF6ojmbnnbzfdAD+Y2OAVVZfZXAP+qUO jVVTivH5vuaRU9A==
X-Mailer: b4 0.14.3
Message-ID: <20261118-rust-merge-functions-v1-1-fe86126522b9@google.com>
Subject: [PATCH] kbuild: rust: disable function merging unconditionally
From: Alice Ryhl <aliceryhl@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Function merging causes various different issues:

* For CONFIG_CFI there's an LLVM bug causing functions with different
  CFI hashes to get merged. This can lead to crashes at runtime.
* For gendwarfksyms it causes functions with different CRCs to get
  merged. This leads to broken MODVERSIONS information if the function
  changes in the future so that it can no longer be merged.
* Wrong backtraces when a crash occurs in a merged function.
* Possibly also issues with pahole/BTF as the merged function's debug
  info is lost.

These issues are new to Rust because in clang, function merging is off
by default, so these things have never come up before. Because of this,
turn this option off for all configurations.

Link: https://lore.kernel.org/all/avy_9SPRaPSKD8b4@google.com/
Fixes: ac61506bf2d1 ("rust: Use gendwarfksyms + extended modversions for CONFIG_MODVERSIONS")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 5aac6f1b011e..17b7ac3afbc4 100644
--- a/Makefile
+++ b/Makefile
@@ -622,6 +622,7 @@ KBUILD_RUSTFLAGS := $(rust_common_flags) \
 		    -Csymbol-mangling-version=v0 \
 		    -Crelocation-model=static \
 		    -Zfunction-sections=n \
+		    -Zmerge-functions=disabled \
 		    -Wclippy::float_arithmetic
 KBUILD_RUSTFLAGS_OPTION_CHKS :=
 
@@ -1136,8 +1137,7 @@ endif
 ifdef CONFIG_RUST
 	# Always pass -Zsanitizer-cfi-normalize-integers as CONFIG_RUST selects
 	# CONFIG_CFI_ICALL_NORMALIZE_INTEGERS.
-	# Disable function merging as LLVM incorrectly merges functions with different KCFI types.
-	RUSTC_FLAGS_CFI   := -Zsanitizer=kcfi -Zsanitizer-cfi-normalize-integers -Zmerge-functions=disabled
+	RUSTC_FLAGS_CFI   := -Zsanitizer=kcfi -Zsanitizer-cfi-normalize-integers
 	KBUILD_RUSTFLAGS += $(RUSTC_FLAGS_CFI)
 	export RUSTC_FLAGS_CFI
 endif

---
base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
change-id: 20261117-rust-merge-functions-9ccbc0516df5

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

