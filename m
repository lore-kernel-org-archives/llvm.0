Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F63A36BCDA
	for <llvm@lists.linux.dev>; Wed,  8 Apr 2026 08:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775637151; cv=none; b=btAHaakdAem/JFD7u79xOW44Rpbpa4ssxdNasGEF+f9+WsOmnxehqREY28UtY+1W3C9sb3wiBODcRHuO9ND00HbVB4cnQh/XxifB0uIysb9bCdiQ4Da3DNKFSTFZMvdpslM8tUFTDGJ7yDeEECUYCI4PMKYGX2PvT2R54QIEWVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775637151; c=relaxed/simple;
	bh=tk6y7TOYIWgQW/FpQmv39FCi1vkOuWkk3oQ6GYLat74=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Hp4PNcixlQqqUF5RJMAwkG2s3RmqsTQtQK8zqzUWATE+o+85YLPzAVUh4J3ejLFMoIFadpIeAbgqzx+kC6kTHGrnJBFgBnO5XzWhO6zyAl7oPDmBi0ToQ/C/tGvAuSx6oQ4QZelc5UDTNH2uC9PtDpRyKQcfRim5GjvkDHOhxiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pMXKv3Nl; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pMXKv3Nl"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-66ee01292c2so3088735a12.3
        for <llvm@lists.linux.dev>; Wed, 08 Apr 2026 01:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775637148; x=1776241948; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cb2UcNuzPdKbHPpFl5h3svrVmsdCd+TIp33nVOmo8A8=;
        b=pMXKv3Nl6vsvmVmBbokR/3GtrQk1bz4UZ+GDFvfFf8IWIccCUOWufU5rguksSBGrC7
         ppEFfQspE+Xe2RLFG5tc/2b7WLbV/V+cZ4a/fIWbQWDAvKXF2u6+FGLXscyO+mAjLgD5
         jIcJE9BUSYDTdqQI6z++77FcgAhX44R0D9Um69UDKVga3HnpVuRFdmfb4IyZzP1KMpKV
         adw3Pr9mYz15AvlMqS8yo5agGqd6UD9hPvfvMm/rr2XmUXMvUERe6umiGdOqqKyRnWbf
         9J+NMwnHwVfmiABgOnlpNkkdOkpyk1l7+RqVI8M1z6cwsuxps0fnWN8A/2EGk4ZfhftA
         PP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775637148; x=1776241948;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cb2UcNuzPdKbHPpFl5h3svrVmsdCd+TIp33nVOmo8A8=;
        b=mYe+ktS/Ej+CGN/tCgHtRJ3o+abHk0zShW0x3dBH/l30t14txm0vDAq3i0mo5u9O8t
         9gUmyj2gaahFxzJDXelpV8SCjv7r1ZjbtfdzaoV3onDca6HDxHsiavtUd7RyNqCGENKz
         2xb59hyX1ixp+HuYedUzePzYwDLV2Vw0xsDFRMSsjFzEJSXTinupZIWQHwImBvvIuavq
         lzdc0DYWvOohfbt3VE3IyApXaYyW4kSwHdm2GxulxNsov222rHRmtkIn/lgFpkqTOm6O
         zKgnjHyOyFB3h5pbTljQF+6Ua1zjg0QaCXyZ1l+/YhNjE1xtHA7msyEEXpKAkeyoY66c
         Ra5w==
X-Forwarded-Encrypted: i=1; AJvYcCXUP/mMxoPCVpvizwQ7pMXuQGjG4somV2SLLN+DWcpg/UfxjHbJ/GK6fbHoKerJVoftFjO/@lists.linux.dev
X-Gm-Message-State: AOJu0YyiTqtiuG5aIYSCXongSCgBu8SB+sM8KHcZ67B4Ya+bODo8JSwS
	tZH+glM+YOuEbvrZLu3zls0D1BNztCCRR0wEYDGrTZrYpQ3RuYZ2Ynv+OUU4RRiyRIZGdv0alq+
	E4iBPXY+gQwjA6kArDw==
X-Received: from edxi26.prod.google.com ([2002:a05:6402:55a:b0:66f:7148:b18d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:a0c6:b0:66f:2fff:683a with SMTP id 4fb4d7f45d1cf-66f2fff699cmr3538857a12.4.1775637148233;
 Wed, 08 Apr 2026 01:32:28 -0700 (PDT)
Date: Wed, 08 Apr 2026 08:32:17 +0000
In-Reply-To: <20260408-kasan-rust-sw-tags-v3-0-e07964d14363@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260408-kasan-rust-sw-tags-v3-0-e07964d14363@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1912; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=tk6y7TOYIWgQW/FpQmv39FCi1vkOuWkk3oQ6GYLat74=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBp1hKWBPurIEDd6Tqbcel2S/jJm3uXAXZVnBj1G
 6dZYyL7LSmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCadYSlgAKCRAEWL7uWMY5
 RlexD/926trzJjwCHzQ2mRKzubMdpJQy51hNXt0AgxdrcM9hImFJUya1SAz+v2uLxSpCBAECHd9
 6CBekT9oWOAlW5SIq5rTjRd1SlFpdnuHn2gOsQBf6C/yPogtZelp9CpzyoefAp1cvg6wbtUw8Q/
 opVkOeAGQk+QNknhWNkuM4D6AMs7Ff2sLNDRzefwbI5JennszZX7QAsXghyG2e7c3GmTUrlcikn
 GT3qqtQJQtGvmCxjFYR+wkoLRXWhQTSZ6U+Oiy062BQ7rk3KC1C9mPFO9y+6aGyu+VgY2b9U7YE
 fbwzzPXUN5BAr32HPosw3DUgdxJ3+IyPJJo4ieGqO3GLE60FaXaihUl/ZNzvtd+2kuditKsF8nx
 zWTuirIQL2ibKlS7ALpHTLTOQ3gMRfdt543PddhOQYSaUHM1Cme7m8CJ07iNWZt0rNsA1dLF5BA
 u5pPhrR76opAqAlfkM8XEE8uz52nWe6iRi03ISyJFTurJk+LRAZVHjAzBwBJeKcosGgek9oiIw8
 +7dMzdErbr47x6AC1LHYvAKWme2syt1C1mj4TM29UR+68B/hHfwNkIiqaUS2PqFdRovkD0a1eSh
 xIRfTPgDQOpWihhAbB14V0rpr+1LpSlofseFiUeWfeXSfnTns+aoGSezhvsk3+x+nlDta9yLFLh jqrpEzJmCbr6USQ==
X-Mailer: b4 0.14.3
Message-ID: <20260408-kasan-rust-sw-tags-v3-2-e07964d14363@google.com>
Subject: [PATCH v3 2/2] rust: kasan: add support for Software Tag-Based KASAN
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

The kasan makefile uses different names for the flags depending on
whether CC is clang or gcc, but as we require that CC is clang when
using KASAN, we do not need to try to handle mixed gcc/llvm builds when
Rust is enabled.

Link: https://github.com/rust-lang/rust/pull/153049 [1]
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 init/Kconfig           | 2 +-
 scripts/Makefile.kasan | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index 1d41c7c5e986..d2edb1dbd2f2 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2180,7 +2180,7 @@ config RUST
 	select CFI_ICALL_NORMALIZE_INTEGERS if CFI
 	depends on !CALL_PADDING || RUSTC_VERSION >= 108100
 	depends on !KASAN || CC_IS_CLANG
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
 

-- 
2.53.0.1213.gd9a14994de-goog

