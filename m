Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33EF3BE178
	for <llvm@lists.linux.dev>; Thu,  8 Oct 2026 05:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791437882; cv=none; b=QDWA8UJlKh5u+ciOY1WHT/98P7p/nkempK49H69RlExnd5IXKbfS/qg+JfK+3Vmchc3fM6gtRHT9j63Z+RZGprVm10aZnV2kLyr+RXmkhOE/rxOHixWAE/63KK5RAmAxGoQt8reJ1UZoUOBGwnRJuQ37LNSpPTTjlC84kZ3A4SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791437882; c=relaxed/simple;
	bh=rvDjT6+rkk/VmCiFIRydEcSy1yOMxPWIRLLIGRibt+E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RFidmNI0jGCwAX1jEp74vyoOcUnfz3Q2MCBxf5VJJN/FF6fGLH19dmDDakysNNvBjrQMnZjUAWDw7DMEtGepJWJOEEv0MIQQMrEKF9sbDwdCsqS789rkVb8XXD8odIkXM7S1bR0D5Q+cdiDjFySUI58hQeYp54M9hmJ//byfmsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kw56Gewz; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kw56Gewz"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso2090726f8f.1
        for <llvm@lists.linux.dev>; Wed, 07 Oct 2026 22:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791437879; x=1792042679; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FsH0cWn1LlvsmNG6WCJYq22XE9O6pVl1IRSuRFpVGDU=;
        b=kw56GewzvaciKihjng39XNR+hSRLoL6UkEYf48s/XIS/27z6eA4LVajKLJEZrruQZU
         ksB3o3RsOXt11C24h/s5bSCj7SXR4bzTgWkiXorGsjW/Z+W1fEofSYwWkabFEh5kQOuE
         GjCtO4jQKsGqt0OgNUoKsTGhWbpHy4IxUIZqsyukgU7W/4WDnajs9DHpREH0SOzk9DpD
         B8LE6XrHxHhuVGCzjBHTtPKCGRSvXyySzb7zIcEHDz+sWCvh3YdCSlhQuclXOAKZKc/f
         N8lmZej1UGBc+YAIWv+hxdcdxSZ6qN8hdz2q0SfK84gbVgfF1lATx/w+lZwh7InYuOAE
         9oow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791437879; x=1792042679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FsH0cWn1LlvsmNG6WCJYq22XE9O6pVl1IRSuRFpVGDU=;
        b=ScXojFYJOLtAvXOsGPzFqv8z4wI1WU5Jppu2uCHODjOajdmTbA4w9FsSJmYXzlScqO
         uJnHjJHAaDpxtPCOa6NRgBYem18K08ymvwldo5R5psVDmXNqMdxRmeSUNuLavuDzJAMp
         R/4TEmLsPPQrOA2hutAipEW4XyEl1dL7oXSurJVwQXJ/vo0Z9nip/A5Dmyb0aEhiwEEa
         VVy3CCbEPXmSwoM5fOMLDaIfM7XoJSyjVb9DtbW+8p0nF5ZkNmWm5sdTs1lPBtWut4kG
         9+JF4Kg4eQwHgnHVjztT+Eie4WBGCvpOsB8gtXPXsGYGZcplbbq2YZKPiQTYXVMJQnUJ
         acXA==
X-Forwarded-Encrypted: i=1; AKwUvBxv7MoarGKT4H+sZkpm2yorze4TZht7YYpO6J+4CAbEj7GbIzfcQpgWc0iHMH5Ia9hQ9oj2@lists.linux.dev
X-Gm-Message-State: AFq9FYLt5mJnDVeqBXRhOYCu13Qhwcqd3y0BKd1suKp+ly3QMuOY6TwF
	2XlEa5fA5EjpE297QaFjyC2XAkBz/ItdRo24wOr332cn6UApiSg6Je/Q
X-Gm-Gg: AYBFou24A9SqwXZ9OoMhCsybtsl7+M1/7WEIC0v8TPkiCsT0B+2RlrShHb51ngX4L52
	QsGe6EAEj63o7JpDOKmEZhjhn/HP/nJ8buWp1BfQyWJna5hZu3q9MtCTMygtocAe6t53DokI+lm
	EuSfPHkY85sT7TLzb2xC89a7zMtjIUKLjRr4Vr0Y7vX17X2K4mMP3EDbuhTZlTCee3+TuA2zZyz
	ZdfJOVvgRZUap/Nvap7aF2IiLdtNeHoOgQJRABqHakFvV1uzDIIWiETjYWxljt54cBk0D75Kdnn
	a125y0vITvpsxppl7sg9FuJiFyoCwHw2nzMfaP1gANRTnPBSl/fCHaQP5WTOqEnh1Qeg5iXVI2w
	t0QhT047FK4HE1SzY4LHfW0nsAdhoUkY8MQxoagcI1E4SCxoAq6JajLz3ixba7Foi9AhDFNE67O
	Gs8ctEr6K/sm0gGBDvM4jBU0RUm+w7VbURuWQpQfL+szXEwnI9/cPAOW5/QgJSNzcbWUYMt1VkO
	gLvS7RfsNoN97vulNTfaDKAYuvzasastjbi+ZhsYqfy5xlvC+1kQcVbEODRjOZH4EI2f/eSS/r8
	K8Z9k5Lj/5r42eHBVhZTQAsOvvFmmZrI1Kb80dCvLu7bH5IRgwGlzH9BMWZMlf+o/2xuGECHVoF
	wbRoVP8I=
X-Received: by 2002:a05:6000:2407:b0:48a:fcf9:aca5 with SMTP id ffacd0b85a97d-48c72779796mr7901474f8f.11.1791437878835;
        Wed, 07 Oct 2026 22:37:58 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f8fbsm8458219f8f.33.2026.10.07.22.37.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 22:37:58 -0700 (PDT)
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
Subject: [PATCH v2 2/6] ARM: cmpxchg: support 2-byte xchg() on pre-ARMv6 CPUs
Date: Thu,  8 Oct 2026 07:37:42 +0200
Message-Id: <20261008053746.49631-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261008053746.49631-1-kmehltretter@gmail.com>
References: <20261008053746.49631-1-kmehltretter@gmail.com>
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
atomic_t operations already do. This is safe because a kernel built
for ARMv5 or older is never SMP.

ARMv6 before ARMv6K (ARM1136r0) has no 16-bit exclusive access either.
It is not handled here. Rust stays disabled for those kernels, and
they cannot be SMP since commit d70242427110 ("ARM: rework ARM11 CPU
selection logic").

Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Bradley Morgan <brads@mainlining.org>
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/include/asm/cmpxchg.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/cmpxchg.h b/arch/arm/include/asm/cmpxchg.h
index 0ce5225af442..18555ae22893 100644
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

