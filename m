Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575A38472
	for <llvm@lists.linux.dev>; Wed,  8 Apr 2026 08:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775637149; cv=none; b=LdjKgSmS6OGL1Hy2Y9kANofdIglf4AXu1UatgfiezNJIHTcuvcCUGIebjUEBVKoGUY4rr/qlTqb+3BOyDaYPgzo3fMVtYMnX5UxsSTJ31j1wBxXsjEQBl/XZYAX1qdrwuZ0j8u8vGmuz0QKjJwfKvk5DjA/Fd3BNjXFtHd5NfCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775637149; c=relaxed/simple;
	bh=wci7le9h1LpQXNgtXZg4XVYpmfUBKH6BCtl+hz78Lfw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GE9xywX3z2A1g7f/YLUPWPuSPvYl13rw8sqsjuBBGNRSy21K17VmQ6Llk2gwYJlVSdo0JH6gOqQKZmiBaf33fuKNiUvY1i+N2uqM4zeqf+RPznTcdHwKduWa8Qk5U34FCz/DZMJ2uMOyQp7VNtR94SniCf1gXe66Wjh1BGBUPNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uuhYz/D0; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uuhYz/D0"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43d00dd913cso7039342f8f.1
        for <llvm@lists.linux.dev>; Wed, 08 Apr 2026 01:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775637147; x=1776241947; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=b9Uj72E/5HEbuzpRNlEo97Kbz1MHWubhYMw6Gvh/728=;
        b=uuhYz/D0V47H2Z/bKi05JNIXAfo54qhJLnd9vQ5tebZ3ogcs4RIbNlTfl+aqNLeaZl
         cZssS8eRcJVnjwYXHwKXYEguwjIexIvY/xRdcTnSPHX/rjo0fm/DFHP1tp4ZyeKlMZMC
         BuCr2U9zPPgnKIJq0Havg/7mViex35LTUjDgzda1H3qj2WLBjOhJKo6fGByvT8WxdtoL
         9cH2zjsFM8/Vq31cWY7eESprJjPMjJURaw73floqAlDAXIttmsDfdMbqTxELCqzatsHS
         S+c1oabWpWXrBHCScjzJFVBFMtTE+wMXDMthhT34lCGJeQHchy+oMySlkPg2i5kMQR5g
         9LYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775637147; x=1776241947;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b9Uj72E/5HEbuzpRNlEo97Kbz1MHWubhYMw6Gvh/728=;
        b=XRunqI+ShMPqbImQFQdqQdtrnRsFb/GFYa/tQ1U4F/1qYpEUhqV8R08kqBbm+R4vGq
         ZcFEn15BsOJnD86359oE4DgZn32mkCVjqnDT8G9br3YPj8urYs8bSSdrEbLifa8iRsLJ
         LFuJc+cNRYpLYD35azt8QUqxsEZge3d55RwYM4ozW5mvh58Bn39z0Gist68J+xK9UswM
         AtDU2ZH/30Tso2mZXh0xXFLOxafsRqNn1JmjHro+TNrdvcuQ4zRd1oLZ8aDdFn1EDQIp
         1wQ5eR4GKVM4179GJTY/vJ3He7SZVPOC0gcrjtQN+H3PLQ+3AMgBaWlDs/qw/5E1DpPW
         BSQg==
X-Forwarded-Encrypted: i=1; AJvYcCU8gmepDhz9OsqN4E/6gRXNefZ0T63/oFOOrypg9DkvGjYN8XUBxqptdzZYlt3N4xcwq43Y@lists.linux.dev
X-Gm-Message-State: AOJu0YxEOD46NtGgWNmJr/NikPXH792jWTzXxK1o5jFHkecRhQT/l0qf
	hyW26TDSKhhEtZPRKO63GM/XHDFcOK0IylW9OBFTjhgizjaDuNPjBwL11K+1z4i2wrRHL1QCgum
	8eKeJoJRk/MkUdLwKeg==
X-Received: from wroz12.prod.google.com ([2002:adf:f1cc:0:b0:439:b9ad:6599])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64e6:0:b0:43d:740:fb37 with SMTP id ffacd0b85a97d-43d292cd110mr29402509f8f.24.1775637146677;
 Wed, 08 Apr 2026 01:32:26 -0700 (PDT)
Date: Wed, 08 Apr 2026 08:32:16 +0000
In-Reply-To: <20260408-kasan-rust-sw-tags-v3-0-e07964d14363@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260408-kasan-rust-sw-tags-v3-0-e07964d14363@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=846; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=wci7le9h1LpQXNgtXZg4XVYpmfUBKH6BCtl+hz78Lfw=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBp1hKWD5EjhG46W626xQ0DsRPJfdbtTLMTOQPst
 JQBJO27wEWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCadYSlgAKCRAEWL7uWMY5
 RncCD/4+9/eYG4RUgoLUxawTtLG28tjzL4U3sNr55odfflRChLodXfskJk8q/nWrws0Sx6FIfJZ
 Mec3cMW9K5S8ES71aiEhUh0phU/CILz63L4NboyQTxbN7+A5JRoOFNvg26SBqqGmy58Gx/pRFIS
 wodt75Fpt0aMTG2JK85WdhKXRs77Hemp5upqMbTTxsH/Kfwi0T9Hnn+GgCTedDVBhG4ydVUKgoV
 /+BuKyw73IIz0ZJMCaUcAhoRS/tM1n4IJipmQlV6F6pSNi6UdhQsAZONMYzZ4vLZaedy1OjE2m5
 BzeAKHUsiqOfog8IbHTB8FXmjDqawmhA+yD/v1XaVUFUJEyPNZPH4mC2m6JlxFqCpmK7w5DwSRy
 NDvnu0TLs3b3YRitQjAclC61vZTNsJcL8sfVeOj0frpqZPZ+yERyGFFWHtIN0K1IQ95HflAAgQ0
 DBa2u2mLiEotwCb9HcOdU6dQktBlu76PKxQi/SLp3S5ivtxbgNpg/Vmb/eodMEbpagl36VEMmT5
 OZtEBwuc9vGiNE4ugyEQsiOQctDaxnw6zxV4s5lxUuh2VIMhxK0cdw7TEvBZIiJ5ImKvhqVLSvo
 kBaDFAhXN1YIwExsDTI3Cr5YyuRjltAfivoS6KJzRYOek7oiqg9tQDOtmM4YGLimMZU93H5vaux IWMQUVBDgSic9vw==
X-Mailer: b4 0.14.3
Message-ID: <20260408-kasan-rust-sw-tags-v3-1-e07964d14363@google.com>
Subject: [PATCH v3 1/2] rust: kasan: KASAN+RUST requires clang
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

Kernel KASAN involves passing various llvm/gcc specific arguments to
the C and Rust compiler. Since these arguments differ between llvm and
gcc, it's not safe to mix an llvm-based rustc with a gcc build when
kasan is enabled.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 init/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/init/Kconfig b/init/Kconfig
index 444ce811ea67..1d41c7c5e986 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2179,6 +2179,7 @@ config RUST
 	depends on !CFI || HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
 	select CFI_ICALL_NORMALIZE_INTEGERS if CFI
 	depends on !CALL_PADDING || RUSTC_VERSION >= 108100
+	depends on !KASAN || CC_IS_CLANG
 	depends on !KASAN_SW_TAGS
 	depends on !(MITIGATION_RETHUNK && KASAN) || RUSTC_VERSION >= 108300
 	help

-- 
2.53.0.1213.gd9a14994de-goog

