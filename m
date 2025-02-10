Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF151DF24F
	for <llvm@lists.linux.dev>; Mon, 10 Feb 2025 10:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739184855; cv=none; b=OqAgkynctTrrFTJuEkiZw8fZq4brAucOgvCqt4BR00wWroqXDFINnCJIyZzvWqZsa72pz+qU2Fety4fbcK5NZiBCDbvfmurdNPYqBv2DSrzXGtuMsxOqIPaJEzj4p/Y2uB54db9ud1Tum5t/RNw0KVXdQkMmQDs1tqmrxRGiF+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739184855; c=relaxed/simple;
	bh=veCMq7QlYZI6eCz684E6F779luK4tlDIm37dAlIWBM4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=E6P0224FyOZhzwae5PXaYOa5x0oc4YqOqlqfzbecLCxAFPj1eQfS+RsjEMs2LeZW2zEW0whYjppJds3acqmktA2uA9SLmXRyokMbDwDjDbReg9Zz6zxBEYyuPhqii4Q6vjoCZ1BSFLhkiDVo6TyB6uePpyERHsu1P/QuRwiVIcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yi2rXpJe; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yi2rXpJe"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2f9c02f54f2so8874425a91.3
        for <llvm@lists.linux.dev>; Mon, 10 Feb 2025 02:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739184853; x=1739789653; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LQhJyhQWjxv+Zy6zdPYkWUMUnHGtnz45HWDSo6oMzGY=;
        b=yi2rXpJeZSpop/D+WNEh6UVQ1jp90f/bvTF9MyWC9Ho3ZsmRStSfZUDWsNZyFBC0VH
         HaV2o0aRG5QAKaaB8arXx6SpSLVj8V49qhSpuQsEncATXELD29TWYBiRMRSeU6pNz+XO
         Dec2DgOD+C8Q41aetEGB1vtWG6G0LKyILn6wWqWvKM4xGe7uoDKJ5h1CnBskT1QaPILG
         l8grFRHSB9r3pc51z+zqzBdd1zOaCPe5ZgPyumeVXT5nAGw51nxpH9vUd6QKr4UglpaP
         /tlkdxamkITzxhpWqhvEMVHzMBl/aUo5reiqmGmvph09RUyBeEK649nYZS5QrOmq9pB1
         rQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739184853; x=1739789653;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LQhJyhQWjxv+Zy6zdPYkWUMUnHGtnz45HWDSo6oMzGY=;
        b=tqQXX/ILa+h5CDqu5/BGiujirGwc0gt0NYiDsZ8ZzTGyFrT7rjE6APE/SQjIvyGTBq
         v1BBRUDXdjQZw19YfysRQZ8ZEgIrvQqxQz28lOBLP0KNWIbfVo7i7B6jHf9r0RQoQk5B
         SOvJmHa1KuHoY5JznAHjZPc7yRINED4qDSNdvro+LTnk5jLgj2ioEGpAXH0rysJOeQQu
         hXAeZHcnwARxdXs7iI7q5ON6pc5wRWcfhw1XLUe5ziYzMlwiU7wzATRB13zv9FwZyjIS
         MfbWT/uByZ7c3gtg3++HSTWQWJ0w78vLIKLYpdJkSYlNiOQErmAXxP5va/10a7ZWr4LZ
         qAoA==
X-Forwarded-Encrypted: i=1; AJvYcCXmYn7qnRKd0jZaE6JQgUZo++zrR1qxA075W+buynftvFV8uCoA0QBUkz9LMwybiwREFdX0@lists.linux.dev
X-Gm-Message-State: AOJu0Yy84lui1tbEdrZTJsTHpRRZDXJ6HUs0egspRxYoN95l0PGH80Cf
	5+x2GqIY+uuDWmiSym+wiRRQbAiBsBTQsgCMitEbTTJsUBBxzbDank40egLVR+rlf3dXD8aH3EQ
	6tnXbFN0amw==
X-Google-Smtp-Source: AGHT+IEvW+/sOqnBG/VAtH/2gdqFYMC0pJvpIBft12t8qfeTZRUBDUmiUgXHCCq/urY4SSKI4OrQQQksWUjU5Q==
X-Received: from pjboi14.prod.google.com ([2002:a17:90b:3a0e:b0:2ef:d283:5089])
 (user=davidgow job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4b0b:b0:2f4:49d8:e718 with SMTP id 98e67ed59e1d1-2fa23f6d51cmr20575597a91.9.1739184852968;
 Mon, 10 Feb 2025 02:54:12 -0800 (PST)
Date: Mon, 10 Feb 2025 18:53:51 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250210105353.2238769-2-davidgow@google.com>
Subject: [PATCH] arch: um: Pass the correct Rust target and options with gcc
From: David Gow <davidgow@google.com>
To: "=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?=" <linux@weissschuh.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Johannes Berg <johannes@sipsolutions.net>, 
	Roberto Sassu <roberto.sassu@huaweicloud.com>, 
	Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Cc: David Gow <davidgow@google.com>, x86@kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	linux-um@lists.infradead.org, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In order to work around some issues with disabling SSE on older versions
of gcc (compilation would fail upon seeing a function declaration
containing a float, even if it was never called or defined), the
corresponding CFLAGS and RUSTFLAGS were only set when using clang.

However, this led to two problems:
- Newer gcc versions also wouldn't get the correct flags, despite not
  having the bug.
- The RUSTFLAGS for setting the rust target definition were not set,
  despite being unrelated. This works by chance for x86_64, as the
  built-in default target is close enough, but not for 32-bit x86.

Move the target definition outside the conditional block, and update the
condition to take into account the gcc version.

Fixes: a3046a618a28 ("um: Only disable SSE on clang to work around old GCC bugs")
Signed-off-by: David Gow <davidgow@google.com>
---

When combined with Thomas' patch [1], this gets Rust/UML building
correctly with gcc. (Indeed, Thomas' patch works fine by itself for the
64-bit case, and the 32-bit build is broken anyway due to the Rust block
driver not supporting 64-bit atomics on 32-bit systems.)

Given the other patches will probably go in via the rust-for-linux tree,
I'd be happy for this to do so as well (given it mostly affects Rust),
but it's not a disaster if they go in independently: there shouldn't be
any merge conflicts, and they work independently.

Note also that I don't actually have an old enough gcc nearby, so
haven't actually tested this on gcc < 11. So please let me know if this
breaks for you.

Cheers,
-- David

[1]: https://lore.kernel.org/rust-for-linux/20250208-rust-kunit-v1-1-94a026be6d72@weissschuh.net/

---
 arch/x86/Makefile.um | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/x86/Makefile.um b/arch/x86/Makefile.um
index a46b1397ad01..c86cbd9cbba3 100644
--- a/arch/x86/Makefile.um
+++ b/arch/x86/Makefile.um
@@ -7,12 +7,13 @@ core-y += arch/x86/crypto/
 # GCC versions < 11. See:
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99652
 #
-ifeq ($(CONFIG_CC_IS_CLANG),y)
-KBUILD_CFLAGS += -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
-KBUILD_RUSTFLAGS += --target=$(objtree)/scripts/target.json
+ifeq ($(call gcc-min-version, 110000)$(CONFIG_CC_IS_CLANG),y)
+KBUILD_CFLAGS +=  -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
 KBUILD_RUSTFLAGS += -Ctarget-feature=-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-avx,-avx2
 endif
 
+KBUILD_RUSTFLAGS += --target=$(objtree)/scripts/target.json
+
 ifeq ($(CONFIG_X86_32),y)
 START := 0x8048000
 
-- 
2.48.1.502.g6dc24dfdaf-goog

