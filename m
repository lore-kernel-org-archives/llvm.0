Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5FA54EEA5
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 20:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923523; cv=none; b=gKwRtTYxSRYutU89Y2iuKzmZzlu5GdHWIQTJq1OjygnjqpfYwN4R9t6+vuwmgBGy5cr1gg8t9OlffLU3JvaDBltfhC/DQsGwj8baEEAd3wfbSxiW2rp68UX8t8pfUmO+cptkNBiAnLJt0CqV18QM+kT7Jn7MBcXo4WZir91byP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923523; c=relaxed/simple;
	bh=rvDjT6+rkk/VmCiFIRydEcSy1yOMxPWIRLLIGRibt+E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QXcRgc6jC/w+cmZ94N4ELREIgjC0XKeWZb06hDRxyeqdNyvg6rsUQ9V6jwvuNaJoidK2QCrZ/bF9CpjXpd3jjEUDlwSxRvnksO9NLYxD7+l1zMEjgJTsV/1DNkNeFDZsd7E+YqyYffU/PIsMrJuEodGtEK+0BoSEPys9s0GuAao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QN/nz8UB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QN/nz8UB"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so27078595e9.1
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 13:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923519; x=1792528319; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FsH0cWn1LlvsmNG6WCJYq22XE9O6pVl1IRSuRFpVGDU=;
        b=QN/nz8UB7Ey97HrOHujywTaWlKS4gppZtmpPKvgkwbqZK8LpeO2x4cNl6sG51ls0Xw
         N6VyaxUjJTdXEvRdshrW5/8jjw8fS24MgFz4kQCXRUKis8E6tfXKRCk0Vgn5bjFq01Av
         03ourP41TnrTRBfishrhFG+6KG0NjyXVaDR1xV/crZdn4/gjzY8rn1ELmmCbF/1xzFXa
         PT4y/1GEfwUZh+YWnhb56bWqsAZbxlxE2cBfyvdj68jsdhij/SAu2sK3qTQTv/GGl6yk
         nSEseT/+sIVQbU1Q7zs6pnwxBKA6Bq3vVob4kxiHsGGh8WJaZjXA3fdsOgOCWDD2tBl4
         rrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923519; x=1792528319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FsH0cWn1LlvsmNG6WCJYq22XE9O6pVl1IRSuRFpVGDU=;
        b=RMorlpbtJb5C0fefe6ag4KEhSPRvP918X5i7eBcHBNkACdOo55SB4yQM6MtouaZZB9
         /o99kefS6mIwW3RmxXTqvA7F7LQ0m1v9w1djB6syjDI9fx0Nx5pvYqbsHRF8FPOw7ALz
         RfqH/n+NOn7wy6ua6Qp7BNj/aAyLGBt1WDaYinuw5wNkdEFzDQXayoGSUmZauPFuNDPE
         l2fJqzH+sGd22bTjPVPKFoJWsPjYuqwnj+1ncewd1V2Xv9la94yM6hrIGJNMU/1UdF2Z
         vXOgPVzYQ/DNPDqO+/83c8exUBgxe66gpt38hI9A7eaNH9YfI6cwtn61+Lnn84k1oLT0
         BmNQ==
X-Forwarded-Encrypted: i=1; AKwUvByKsTiKcxes4ig3lI6RAAbbByfVVIquZscHoEZPlj9WKoHgu8SGpVdV9yGyJLMfgUZBK6u8@lists.linux.dev
X-Gm-Message-State: AFq9FYL4QTIB6ckIBZpIlRBMgU0AYKSKjOKkqEWUn8i47fyfgijw6MDX
	h2oiWumXomiFyp8l5KAXI79NpC1CzRwb9DXfdo1L/qHqCuXr//rudAOk
X-Gm-Gg: AYBFou0XlMP1f3oKlPuhan6mMdLKo4ZdKbtVPBrMvwbJGhpz1cfucPNY24Bptpj28wB
	FkoUVQe7Sq1pM5KzHbPzRMc0kLdqLKcKqgTCW4vJvrmnIgtTbLDQnR14YO33/TkxoAZUUwQq8mC
	l8SH5xRt6NnD1PQlM6Q1mFQ6rWoL4KS91OjLJNGNbP4MVOjYauj6+5q4gV8E6Sd6hl1vFmAt0JZ
	yaCplz6A0t3up65ybsz2832gGLd0CYjNkBvBlc5T+1jKUk5mAUfZJNmivBaWyNv9Awe3iaVH9i8
	pScOanW/V625ycrcDc9dQOkb/Ek+k5qteqiAksiuXojGCVSyNBugX39Vut/iii03KNwp0iCu6zQ
	bNkwO8UIeG48e6V4d+kIEaIbXzu1y8UlLhd34N/aJltxqMgEXIKvAthWbwp6bQCg783m/iRYgLV
	keyROmEGuA59Fqp8dhLcOT6ZonssICG1Y7Fi33pKH5ym9/wLxcB8LLtYUDXqvh4zo19Md03HiEL
	rsDWzYMJkCq3unQWwKXkHsuerCdkk7hZWkb8maVaGcijtMljQByD+bcOQCjVbxwrVKROLZjhhxG
	IzdXNdGcJ5fATGi+PiLNacxANsNUXMJXiiZMf27bf2CvOcV+zFd4i/Cu5Sd+DIqgIxGtpYGhhkT
	6BX4hew==
X-Received: by 2002:a05:600c:4ecb:b0:4a0:c01:1902 with SMTP id 5b1f17b1804b1-4a18e43a29fmr276884405e9.2.1791923518889;
        Tue, 13 Oct 2026 13:31:58 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a189-2701-8c58-155a-0279-7389.310.pool.telefonica.de. [2a02:3100:a189:2701:8c58:155a:279:7389])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm5237345e9.3.2026.10.13.13.31.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 13:31:58 -0700 (PDT)
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
Subject: [PATCH v3 2/6] ARM: cmpxchg: support 2-byte xchg() on pre-ARMv6 CPUs
Date: Tue, 13 Oct 2026 22:31:36 +0200
Message-Id: <20261013203140.31741-3-kmehltretter@gmail.com>
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

