Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAEC399018
	for <llvm@lists.linux.dev>; Sat,  3 Oct 2026 09:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791020318; cv=none; b=imhAUcf4xqzppxQkQr+x2NMYfG3VSs3KT0oaZO6IE3cfanpoJAjITm16Z9zP//mcylSJF0iEKbxMsnJNfBxc22iPOBd7NNN9uxkBYWeJlOhJTwWTDRRn5Hr5yrkBAHssM0lNtlIoEEViMPVAdF2XQbVLfTCIjiYp8V6iwyTW5Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791020318; c=relaxed/simple;
	bh=uTYa46AOecaM3RDzRZ4DKoJ5GDtP/85SSs5HVTQp0vg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eLZpJMIHqAvubxmmegUJD1OhUwyuaWxm4ngGtvwjyxYwMc+sdkhyaYOOEI7pF9oDpDnWJT3wjIYrpdzXAjx3EARrrA1g/kmHo9qaBR5DYlVT0A/ixyHg65jmoWnixf3DnfeKFZthdJvWEujCDTBWRS7lorLAknybpedw9bMD6HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XUbIL2y+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XUbIL2y+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a003bd18e5so2929305e9.0
        for <llvm@lists.linux.dev>; Sat, 03 Oct 2026 02:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791020315; x=1791625115; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GrelwCgc63us5GOG6C+qGomuUs412KLBJjKZV/Gge/o=;
        b=XUbIL2y+m/313o6ni/1ofuy6Wsl/05xgBCQy9p6W08rAUG/zRdM6ea4XdyMoiEIPAG
         C/U/VF8rELZ3vX9hm+ZrTe49APKoEz+jYzaZboj+mPbddxsaF/qisKQPdLHL5sHzlLqw
         7HvSpZH7taUSJPYPcHaO+hCaTIBJDWXGWJ3PlhBINwDvjtraa8ehpFAq6d/hqwxM7nYN
         8bZtI6KlHe21XAbYAPEyVSQI/GT2JtSQnwX07abrldoHjIadKp3Qjhd+4XBOjXU+1STT
         P2nxn/zHNEku9XZLCXVGRwyCMrRFC5rbJiU3xCDERJUSePuBh1GVhciapBwfwMrW3ATy
         sF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791020315; x=1791625115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GrelwCgc63us5GOG6C+qGomuUs412KLBJjKZV/Gge/o=;
        b=v5Pq0pJy1iII0KB0cHy1BWoRqSS4m15Lw/vbQh2eM3zWbquZWFS0rfU4qzOSznAVAu
         ocohAjNWS0vSF/0DAfobKbrYgTYQnaVk/ufjt+RmFzQ5LcTwyUijvlfqJyUhZ6XK1eDV
         ssF+7h1Ots6akvo0sdax4axdj2IzKuR+EG1tiexWNULxgE1X00TjIo0rhc4uISv+6Z9l
         LkcU05zqjmlIJAI+g9ArFqgduozNVahnTym0OeojNeCOslk9Ag0lVoGhTXYB6IhaOXpG
         mV73BXEAakp7ItZ/zokoJ0HXCsiZ/JOXH6GZ08F3hKV9zh1rNwelGM8VfPU9gzOGEKrF
         ST9w==
X-Forwarded-Encrypted: i=1; AKwUvBzeyG8TaRGLpiPUGhwIOt5+My9538yEjmRUvVKsWrQCggp8TvSYuGPF0HOBrfBBcQ6k7/0v@lists.linux.dev
X-Gm-Message-State: AFuF++lYXW8iLq+ceQsjl6vB9Vjjxm3WHGH5oDC2GkE5Wz00gyCtLJw8
	bz7JnxS0XD3DuKbG/2cCf50jmY29iOt5iEphNQRTsRCX3auH0a5XrjTf
X-Gm-Gg: AYBFou1KIVWLQb9BU9zCmzO+UEI6cm7nwZgWUaYB+yNepu2jZpYuhATLEoUucu1+i9g
	+z43kaUYXusVSjyS6Ve+1dRgQClrXbYRY5GUaod9AOfY02eg5hUlz7OmrMj12lWd70ia5Y7L/9c
	1rd0sBVeNuovpIs9Rw2DgD4vKiVKid0Nrw1ahsLymEGge/GBghXQGdpjzb1ZgIQuh6td36Lu0VH
	ALFL3HipQDcQ1MpCdIMrD+Y/BBXoo/qSj6i9Gr5hg0YVmVzLumWff1gANlF6uKQpNP/htxGpKd7
	Ca7zGCt32ksz5gjDnZhQ1AKjiToMgCHqZD5Z41Dawrx9AXRsTmA8iMxwDt8H6Ai3zXpTy8RVmxF
	waFt0JANwJs9dyVFx1OyR+tu2YkPOXmpffSO/7zkzoWDDnBylXq3ByRCwLm6dveId7U+iAHzHuY
	nuykal4tZuiH/uCdQ0uZ56TyBqJ/448ID7cz0v99xXxIurtCpA8tQ5OpmXHotJaTKrr6lXOj/b/
	9ROlBJI5Jbr63cFtUT5FTLrcjbkrEORC8uposSf4TDxEeK8UalVTM6S+BeNazzYo4viYUaQCu67
	hLj5rpmryWs2btAQhYGF5sh2dO+8LebMdO4eW7QMcsXah633RXi8abjR54u/1LUZBHyc9WrKbbw
	dssILvTFs
X-Received: by 2002:a05:600c:8b88:b0:4a0:258a:b25c with SMTP id 5b1f17b1804b1-4a0276abde3mr84502655e9.29.1791020315095;
        Sat, 03 Oct 2026 02:38:35 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2e2-2001-c47f-5a89-3d9a-cd2d.310.pool.telefonica.de. [2a02:3100:b2e2:2001:c47f:5a89:3d9a:cd2d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02770e8f2sm136528375e9.6.2026.10.03.02.38.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 03 Oct 2026 02:38:34 -0700 (PDT)
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
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: cmpxchg: support 2-byte xchg() on pre-ARMv6 CPUs
Date: Sat,  3 Oct 2026 11:38:26 +0200
Message-Id: <20261003093827.77857-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261003093827.77857-1-kmehltretter@gmail.com>
References: <20261003093827.77857-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pre-ARMv6 CPUs have no halfword swp, so __arch_xchg() only handles 1-
and 4-byte exchanges there and turns any other size into a link error
via __bad_xchg().

No C code needs a 16-bit xchg() on these CPUs, but the Rust atomic
helpers in rust/helpers/atomic_ext.c provide xchg() for Atomic<i16>
unconditionally, so building with CONFIG_RUST=y for ARMv5 fails:

  ld.lld: error: undefined symbol: __bad_xchg
  >>> referenced by helpers.c
  >>>               rust/helpers/helpers.o:(rust_helper_atomic_i16_xchg)

Implement the 2-byte case with interrupts disabled, as the pre-ARMv6
atomic_t operations already do. This is safe because SMP requires
ARMv6K or later.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/include/asm/cmpxchg.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/cmpxchg.h b/arch/arm/include/asm/cmpxchg.h
index 9beb64d30586..3077f7d7f520 100644
--- a/arch/arm/include/asm/cmpxchg.h
+++ b/arch/arm/include/asm/cmpxchg.h
@@ -31,11 +31,10 @@ __arch_xchg(unsigned long x, volatile void *ptr, int size)
 {
 	extern void __bad_xchg(volatile void *, int);
 	unsigned long ret;
-#ifdef swp_is_buggy
-	unsigned long flags;
-#endif
 #if __LINUX_ARM_ARCH__ >= 6
 	unsigned int tmp;
+#else
+	unsigned long flags;
 #endif
 
 	prefetchw((const void *)ptr);
@@ -106,6 +105,15 @@ __arch_xchg(unsigned long x, volatile void *ptr, int size)
 			: "r" (x), "r" (ptr)
 			: "memory", "cc");
 		break;
+#endif
+#if __LINUX_ARM_ARCH__ < 6
+	case 2:
+		/* swp has no halfword form. Pre-ARMv6 is never SMP. */
+		raw_local_irq_save(flags);
+		ret = *(volatile unsigned short *)ptr;
+		*(volatile unsigned short *)ptr = x;
+		raw_local_irq_restore(flags);
+		break;
 #endif
 	default:
 		/* Cause a link-time error, the xchg() size is not supported */
-- 
2.39.5 (Apple Git-154)

