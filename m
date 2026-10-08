Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DB23BBA09
	for <llvm@lists.linux.dev>; Thu,  8 Oct 2026 05:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791437880; cv=none; b=mZN+n6FRZ2jzp5p/ICr+DkjwZx0X3zkWgbCRCER9t/iaDrvLJL3GNSi+s2isf1w1Ems7QD4kScyLwKWKVfSqHeSA17T6PcEs8YTbcscGvH1yZwB70FAZI4LB7yro3kJeYtRvhMnGu5nBNrBIsjMlcdPS3sm8E1Ov8AaXMU/VndU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791437880; c=relaxed/simple;
	bh=1Es+O5gUAfmFViPOKvPNBGlel3oVhwqYtDml3CwM+Lo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i1Thza5VbKnjEmOKJ6hZuRo9DG7ozakyTcjskWPfhIqeHc/oLSgcawf0Yz9I9IAvnmmnoHz97UOXRgLMy7qfM2yGqIMvaMo8a79fy4GbLy3nhAbpX9lj4jvK6KA3SbczuLkAPHzt8WMOLtn8cFZlLnM0sKWbCsx3HGERzSXCVXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E00QdHoR; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E00QdHoR"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1619144f8f.2
        for <llvm@lists.linux.dev>; Wed, 07 Oct 2026 22:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791437877; x=1792042677; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RrJHqVEE809VPtPoK85AUD6Bvdktoej0RW32RmBaNCM=;
        b=E00QdHoRmGW7+TZ/iyaBtBnRrFsOdjgaw3QKK7ZgkFOpTM4q8EPEdrhpma5SD+AizX
         eyzo1AIBgv4w8ASIEYT4MjkWm2smHn7ZWkNEM2PQCrFdmSF0g54I4C2lqLBkOlHS4nb3
         0kTVNM51J9pEGxuecYZByMxQiiOqXCQoGzwtNssng8iAeWLUP40t/ZC3/17iCVl1yvuQ
         1Xgxf9QN6JumMRajXAQi6Ctkt2ypKQeTLGJK84DHXEXo7RumEKT5+jHg4WH5dVZKPca7
         WjjI8l8Xjnlx8nxmkLVCqztyXCNPv58JLoauC5+w3cjnXWQfwTMd/swpxPyZMpJumbVD
         KUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791437877; x=1792042677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RrJHqVEE809VPtPoK85AUD6Bvdktoej0RW32RmBaNCM=;
        b=kMqLaGoRteeRfaylfND48NV+6dshX93l4g4EOUaX7yqPJigoV8ITQJYvLaXRFflQYw
         TfzUO6/C3pUx5vjxfycYzfYj4CHI2egVE8XNL0cydpuO4q/KlaewX9R8IV+9NjV3H+Vr
         Q6U5je1/EWBq1upNekt9ue9+6W81OzsH6QVVYH/1kdJswmduXwTBfGBhZ2MSQNASJ2Fj
         qPbHttQC3fEpQijPYZqtMAwrDkMh0EzRNUt5qmFDnfOc+ISdU4rD5aKAlVOV0XJUKghd
         wEwrfAcEFsEutht9jv7FWTTjKYcHv2fCuS162gSTu463Ecobt/9nqcnxLX7b1nVTcgHU
         pdmQ==
X-Forwarded-Encrypted: i=1; AKwUvByt9iQ4hxkCKOgY3zN2Gzi83MMRAGB/rB4QbrD7euU4HLxd6U0wQ4j1I/ANDHkSJJuYAdJO@lists.linux.dev
X-Gm-Message-State: AFq9FYIJAjnc9PizxoF5HPs5ycayE2PEKPSB7d5dwQKZQf6cCyOL3lT7
	hzozBsBL/2/bpfCXL6UEC49GY4QaL9uYGxlEMGU6USkL3evLsVNKVToK
X-Gm-Gg: AYBFou0CtDUv8fKSM8pfyJea85x1uTjBiEAdch0aZFANaEQ4chjoNH3CFn/fFIaFmQ/
	NB3NANy6zkpZ0exQynqofyvJIAjmadl9bwp2gnjwfBRSulyS+jnALwY/93mjsniJysZ2MluOVcR
	5dQO4+qsMz4g9Q53LqqsOonbB8by8BzAAdHhoVU6rVaYF7P4XkupaoFpZTyPUoWBUQpC2rsFnwH
	WXv6ha9NWcQg+2QcAzePJ55WZzO7FXx8XuPxh59GTOtzIWJ2VFlXH7A+ijiJbEZObOFQQmBbzJa
	OT1z617CuVxLZwHFBrks85Hdq9+EJY7Ld6s7sD7l7Q0VvTubpL9LwK355UgA6nzbkTB1r04Y4dk
	dYsvuskWc8q0Iy7FVkeOy0i1V+HblobRK5iUZKSNL5BEzWrNxZHwFOH1tp15q/mPgDG/vdf4xr5
	f8YnMgU+OuUV482G1EFjnVH0E+cyGB0I4aSE322aRhvwAT2C56jQqM8G0A3tlnCiDb2vppam4B7
	M1Adc2+ChhFdGTTWtnqGOJFYzQENmXztGrTfluLt+WLzcbWSNUHf2Sz7M036w3hKyrCn3h7s8cN
	Y7aWP2tUeSUVqMWveP0Tq9f4NobXH888GBKm7fie1jwvhTJYHnv3Tv11edwmC1hzVCruu3bnln8
	vBg/K8ro=
X-Received: by 2002:a05:6000:2281:b0:488:89c7:31aa with SMTP id ffacd0b85a97d-48c728852dfmr8353187f8f.39.1791437876591;
        Wed, 07 Oct 2026 22:37:56 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f8fbsm8458219f8f.33.2026.10.07.22.37.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 22:37:55 -0700 (PDT)
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
Subject: [PATCH v2 1/6] ARM: cmpxchg: always inline __arch_xchg() and __cmpxchg()
Date: Thu,  8 Oct 2026 07:37:41 +0200
Message-Id: <20261008053746.49631-2-kmehltretter@gmail.com>
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

__arch_xchg(), __cmpxchg() and __cmpxchg_local() end in a default case
that calls an undefined function. That turns an unsupported size into a
link error. It relies on the functions being inlined, so that the
compiler can drop the default case for a constant size.

They are only marked inline. gcc 8.1.0 with CC_OPTIMIZE_FOR_SIZE does
not inline them in rust/helpers/helpers.c, which calls xchg() and
cmpxchg() from many small helpers. The out-of-line copies keep the
default case and the link fails.

  helpers.c:(.text+0x424): undefined reference to `__bad_xchg'
  helpers.c:(.text+0x4ac): undefined reference to `__bad_cmpxchg'

Seen with bcm2835_defconfig and CONFIG_RUST=y on v7.3-rc1. The same
config links with CONFIG_RUST=n. It also links with gcc 15.2.0 and
with clang.

v6.19 links. Commit ab717dd98bee ("rust: helpers: Add i8/i16 atomic
xchg_acquire helpers") in v7.0 triggers __bad_xchg. Commit
ac8f06ade38a ("rust: sync: atomic: Add Atomic<*{mut,const} T> support")
in v7.1 also triggers __bad_cmpxchg.

Mark the functions __always_inline.

Fixes: ab717dd98bee ("rust: helpers: Add i8/i16 atomic xchg_acquire helpers")
Fixes: ac8f06ade38a ("rust: sync: atomic: Add Atomic<*{mut,const} T> support")
Cc: stable@vger.kernel.org
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

