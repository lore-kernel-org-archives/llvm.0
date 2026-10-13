Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF49954B1DD
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 20:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923521; cv=none; b=EcjQT1sD1q43aXs9oL3nEWiR0fghGOaEjAy8ZsYdvzsocw4Yo+fQ86O7EtI0XPrjxzlPOnUfUKcHJFAuz91W3+OA7oPvUiQhy7SNftmYcyJV7HLpQPPgAIYioTz9zTKHUeqaMYi9+VV77JUwW16SobIh1rRCqPikr7QMQ1Npfow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923521; c=relaxed/simple;
	bh=f9EkJkO0/YdEpyV9iZEvDv1BUADI4zTrdrfFh5OACE4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VUPZLWM3jA87LqSnXY+fkHDo3fhMb1oahKjtYHG5mkU93Z5K2+nWmCCcVMOLB4YdCMR2sfnUKEXYaEEpwwGo7GfaTlDH/2vmFO621lsQPw4rbXkI0HMUO4GHse66pzGJ0oXlw/AZtmK77gevFDwQXRo1nNdwluLuFUEPB3r/imQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jh8/cJH4; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jh8/cJH4"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso18757285e9.3
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 13:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923517; x=1792528317; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dSRlsCJ/5tvpWWe5VR84qQBeBhF4B6Pki9zDFnj6lNc=;
        b=jh8/cJH4pHdcJfBMd2Ks8RlUxCtGh10e50Iy7KpdI5l3pOTrjnCSL5J5r5e8d2FG6U
         Tuids/NoLKHU6l0Biy4c7r9dxRtzYwj/icPTo5KNtUVjRi7DBHzOXbG0BR4ZQoiYFT4p
         yb7AOgu4IyoVdtimFLDNZKXllssafHuu2peE8gRJecbCfNqcNHp7bDcQ9SeZFa5b3P8J
         O5z9F13oGXYnSJllRDmAS0ghkKZvjCRzOG+JgsEOTcMAy+B1nHR6AG9RP+JDVrrbp/jR
         AW1Ar0ASyh8DFcvkxcwcCGfww7/GVzV0vJEYZD1ACehAWct7dNkwkZWsYoxgZmmOyCkA
         jADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923517; x=1792528317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dSRlsCJ/5tvpWWe5VR84qQBeBhF4B6Pki9zDFnj6lNc=;
        b=a+pWFsXOUfEDLmCzstkCQWIfR6pstnaMVmMy2zVk+baz5Hm5GCqdUVg7Ls5fOwsft/
         xY/AGkpAZXH+FEQsfXwKnHOX0anNRgQ2tFzxVDw28an8H2rzzS35fIusgNN4FIhN6pNu
         ZRIqiGePNevM0Qqda3HLtKgqitVwTU8cxmdLI1QOeU6Nb6VHIAWyJPH3aSUmDZekFPaN
         PniRPadwpd+KQQ499bCazrEq524ImAlj/Ezh0Re42M+M1CoF1vQY7r3VwhcKbDQt6FuY
         25N7ydlcvT85W0tk8yr0lgWEVQXYjHJkBoE859QtWN0FHJpiEZ57PYw5v2xryvMhJJs1
         dAkg==
X-Forwarded-Encrypted: i=1; AKwUvBwftxmOyS6TTMBMIQuqi1k2RS8lGwubzHYvLqwO+qUlm5Y7DKO4OvIEQEPBNxfhIa7649kQ@lists.linux.dev
X-Gm-Message-State: AFq9FYL2rEvUP+VNosmddtb/5uc0MS6V1bwVOgfkND8GBre8sjgQjgVP
	zeb/NTCoDEzgnP3bhwL5vVKPkPJDntMdoyAKqrTyH906rhocCR6aA+0N
X-Gm-Gg: AYBFou1cLKgmcBOQ0DN2ZuvyMhonI4VhCPabpnQqs3X67xXwbj7zaBc1IYkH51wd6Zv
	Su7mf0L2kKT/K3iClWbaBuA1YjKnM+xF2A4vwgFOaEK+sCgD0bL8fBH5FBSyTONnCUPPHy6Zz+J
	LkdOb8UfpuGMSwgC6Bns9PC0VlTGyRXzte4BAnbDjDLX3K5vBvgNKecc/YLyt/Aaow9EBwvxN2L
	TFAixD1t5THV7LZIxcB71GH8Cakxtg42c3r7mMj2dSYZ1K0a1e/3BAPvrwPYx03So/MT45OJUWU
	wWROEsBpksxcGNL0bZJgD7nRs1HdYRUGnoVWD3/cO1nkZeKEieSQkDBg+xJQ4NMK6mRQxo8ztLq
	3hZIyJZZaXxPy+WjzDGg7O6n/RaqEmUrdqHeazIC+dlLTHsn8RLlCNuiO4n8N/nNBtxJAGC3ctq
	WLeySpTCVIIeqTGeWSC5GwigAfS0Hs8UgVbqk0PkWcsMlQ+ZvsJ+XOIBtdvw9/3hImauIsTlYG3
	7jk9bSdlV6OBDpwErz3YrEhj7bGDFOB5hRZ/6PLWiUPwqnnTC79duv2odf9QuOWweMpa7P5SLga
	ootguGNH2FERUkhWncyvIkGxw4c26H1XdOXejxmGnSs5NW6hjc8igfZguQmfp+lap563I2wNfqn
	1eqKf61LdnPYg7k56
X-Received: by 2002:a05:600c:34d4:b0:4a0:108:3b54 with SMTP id 5b1f17b1804b1-4a18e4d67d6mr260625985e9.32.1791923516977;
        Tue, 13 Oct 2026 13:31:56 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a189-2701-8c58-155a-0279-7389.310.pool.telefonica.de. [2a02:3100:a189:2701:8c58:155a:279:7389])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm5237345e9.3.2026.10.13.13.31.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 13:31:52 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] ARM: cmpxchg: always inline __arch_xchg() and __cmpxchg()
Date: Tue, 13 Oct 2026 22:31:35 +0200
Message-Id: <20261013203140.31741-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261013203140.31741-1-kmehltretter@gmail.com>
References: <20261013203140.31741-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__arch_xchg(), __cmpxchg() and __cmpxchg_local() rely on inlining to
remove their undefined-function calls for unsupported sizes.

With gcc 8.1.0 and CC_OPTIMIZE_FOR_SIZE, bcm2835_defconfig with RUST=y
fails to link. The compiler emits out-of-line copies for the many
callers in rust/helpers/helpers.c, retaining those calls:

  helpers.c:(.text+0x424): undefined reference to `__bad_xchg'
  helpers.c:(.text+0x4ac): undefined reference to `__bad_cmpxchg'

Mark the functions __always_inline so the compiler can remove the
unsupported-size path for each caller's constant size.

Fixes: ab717dd98bee ("rust: helpers: Add i8/i16 atomic xchg_acquire helpers")
Fixes: ac8f06ade38a ("rust: sync: atomic: Add Atomic<*{mut,const} T> support")
Cc: stable@vger.kernel.org
Reviewed-by: Bradley Morgan <brads@mainlining.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/include/asm/cmpxchg.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/include/asm/cmpxchg.h b/arch/arm/include/asm/cmpxchg.h
index 9beb64d30586..0ce5225af442 100644
--- a/arch/arm/include/asm/cmpxchg.h
+++ b/arch/arm/include/asm/cmpxchg.h
@@ -26,7 +26,7 @@
 #define swp_is_buggy
 #endif
 
-static inline unsigned long
+static __always_inline unsigned long
 __arch_xchg(unsigned long x, volatile void *ptr, int size)
 {
 	extern void __bad_xchg(volatile void *, int);
@@ -155,8 +155,8 @@ extern void __bad_cmpxchg(volatile void *ptr, int size);
  * cmpxchg only support 32-bits operands on ARMv6.
  */
 
-static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
-				      unsigned long new, int size)
+static __always_inline unsigned long
+__cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size)
 {
 	unsigned long oldval, res;
 
@@ -220,9 +220,9 @@ static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
 				      sizeof(*(ptr)));			\
 })
 
-static inline unsigned long __cmpxchg_local(volatile void *ptr,
-					    unsigned long old,
-					    unsigned long new, int size)
+static __always_inline unsigned long
+__cmpxchg_local(volatile void *ptr, unsigned long old, unsigned long new,
+		int size)
 {
 	unsigned long ret;
 
-- 
2.39.5 (Apple Git-154)

