Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBFC3DDDDD
	for <llvm@lists.linux.dev>; Tue,  6 Oct 2026 14:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791298144; cv=none; b=F7rBIx0Rcr2EM6gIprxl4Moukxor/0I2UNcrksb51XKBNEJd6JGKeJ652AV4sjeCP40GcR1wrSoCnompjQ6VHGDscYUE/IMj/z0ZKcEaLB5fdghoeNQ4OxL/RxFo5beTXFr9crhPxIuXNFCOwSp7NHrRumuK1SsVluoXRfoJN9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791298144; c=relaxed/simple;
	bh=4X1Vvp5rp+7dv6kgDluoOVz7aVwaiJATABVivOetwjw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=l2cjSU9TOqUcVRKkIpDV7TOwbKHq4NdxrNvNDbK/S3TR6VS2mbUjf3wFKBbzILh2gWwNFQnc8I02lC2z2Frvg6kB55dzOF9W+h5DlAPz2d7x4VqZIlfp+hjeswv8UfkPkq8JSSkZJi55IZXgKXFInr3PkjKV7di7TRXenl98s+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.helo=mail.mainlining.org; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.helo=mail.mainlining.org
Date: Tue, 06 Oct 2026 15:48:59 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>
CC: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?ISO-8859-1?Q?Bj=F6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 =?ISO-8859-1?Q?Onur_=D6zkan?= <work@onurozkan.dev>,
 Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
 Christian Schrefl <chrisi.schrefl@gmail.com>,
 "Paul E . McKenney" <paulmck@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: cmpxchg: support 2-byte xchg() on pre-ARMv6 CPUs
In-Reply-To: <20261003093827.77857-2-kmehltretter@gmail.com>
References: <20261003093827.77857-1-kmehltretter@gmail.com> <20261003093827.77857-2-kmehltretter@gmail.com>
Message-ID: <61F2A44F-8A05-41FA-8A9A-8483A229E607@mainlining.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 3 October 2026 10:38:26 BST, Karl Mehltretter <kmehltretter@gmail.com>
wrote:
>Pre-ARMv6 CPUs have no halfword swp, so __arch_xchg() only handles 1-
>and 4-byte exchanges there and turns any other size into a link error
>via __bad_xchg().
>
>No C code needs a 16-bit xchg() on these CPUs, but the Rust atomic
>helpers in rust/helpers/atomic_ext.c provide xchg() for Atomic<i16>
>unconditionally, so building with CONFIG_RUST=y for ARMv5 fails:
>
>  ld.lld: error: undefined symbol: __bad_xchg
>  >>> referenced by helpers.c
>  >>>               rust/helpers/helpers.o:(rust_helper_atomic_i16_xchg)
>
>Implement the 2-byte case with interrupts disabled, as the pre-ARMv6
>atomic_t operations already do. This is safe because SMP requires
>ARMv6K or later.
>
>Assisted-by: LLM

Reviewed-by: Bradley Morgan <brads@mainlining.org>


>Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
>---
> arch/arm/include/asm/cmpxchg.h | 14 +++++++++++---
> 1 file changed, 11 insertions(+), 3 deletions(-)
>
>diff --git a/arch/arm/include/asm/cmpxchg.h b/arch/arm/include/asm/cmpxchg.h
>index 9beb64d30586..3077f7d7f520 100644
>--- a/arch/arm/include/asm/cmpxchg.h
>+++ b/arch/arm/include/asm/cmpxchg.h
>@@ -31,11 +31,10 @@ __arch_xchg(unsigned long x, volatile void *ptr, int size)
> {
> 	extern void __bad_xchg(volatile void *, int);
> 	unsigned long ret;
>-#ifdef swp_is_buggy
>-	unsigned long flags;
>-#endif
> #if __LINUX_ARM_ARCH__ >= 6
> 	unsigned int tmp;
>+#else
>+	unsigned long flags;
> #endif
> 
> 	prefetchw((const void *)ptr);
>@@ -106,6 +105,15 @@ __arch_xchg(unsigned long x, volatile void *ptr, int size)
> 			: "r" (x), "r" (ptr)
> 			: "memory", "cc");
> 		break;
>+#endif
>+#if __LINUX_ARM_ARCH__ < 6
>+	case 2:
>+		/* swp has no halfword form. Pre-ARMv6 is never SMP. */
>+		raw_local_irq_save(flags);
>+		ret = *(volatile unsigned short *)ptr;
>+		*(volatile unsigned short *)ptr = x;
>+		raw_local_irq_restore(flags);
>+		break;
> #endif
> 	default:
> 		/* Cause a link-time error, the xchg() size is not supported */
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
