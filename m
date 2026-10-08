Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA8C4C10E1
	for <llvm@lists.linux.dev>; Thu,  8 Oct 2026 15:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791472898; cv=none; b=Cz1bKWiawK7PPv2jZHNq/Do42Aq7U0EGAou2SCryZGTWdGaQnBX0cjmFjeWsUpP9YZjPOzvU4oPKieOYcGzXlmzRKJUuD8xcDY3rawm8tIeiEB4ZRfDHlDUu4FlODoOmEoFOSwJkz1DZEc3PDl6GcHUuEvDWf2LBmc4oS/5UGYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791472898; c=relaxed/simple;
	bh=nwD9UJJcQf/I3uCj4G6DesPKqOSQnRqeOvO2oJEDD/c=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=HyJduaW/W4VTkr7+7YhHb16VWR6rZsImDkvJa8N7m5x/1o9GR32+S22Z7YMDgcIBUE/c+eHO/dYmQrQ15l3I/PzA9huTb7C5tT6MhXbbTl6PfAzKNcMkje4dFpp1vQ++QDRKmpTuc9hauhn+TpFptFU0cCiRsCOZecGkjsL6+4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.helo=mail.mainlining.org; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.helo=mail.mainlining.org
Date: Thu, 08 Oct 2026 16:20:54 +0100
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
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/6=5D_ARM=3A_cmpxchg=3A_alway?=
 =?US-ASCII?Q?s_inline_=5F=5Farch=5Fxchg=28=29_and_=5F=5Fcmpxchg=28=29?=
In-Reply-To: <20261008053746.49631-2-kmehltretter@gmail.com>
References: <20261008053746.49631-1-kmehltretter@gmail.com> <20261008053746.49631-2-kmehltretter@gmail.com>
Message-ID: <C3287647-5059-432B-A621-EF428A0B1A15@mainlining.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 8 October 2026 06:37:41 BST, Karl Mehltretter <kmehltretter@gmail.com>
wrote:
>__arch_xchg(), __cmpxchg() and __cmpxchg_local() end in a default case
>that calls an undefined function. That turns an unsupported size into a
>link error. It relies on the functions being inlined, so that the
>compiler can drop the default case for a constant size.
>
>They are only marked inline. gcc 8.1.0 with CC_OPTIMIZE_FOR_SIZE does
>not inline them in rust/helpers/helpers.c, which calls xchg() and
>cmpxchg() from many small helpers. The out-of-line copies keep the
>default case and the link fails.
>
>  helpers.c:(.text+0x424): undefined reference to `__bad_xchg'
>  helpers.c:(.text+0x4ac): undefined reference to `__bad_cmpxchg'
>
>Seen with bcm2835_defconfig and CONFIG_RUST=y on v7.3-rc1. The same
>config links with CONFIG_RUST=n. It also links with gcc 15.2.0 and
>with clang.
>
>v6.19 links. Commit ab717dd98bee ("rust: helpers: Add i8/i16 atomic
>xchg_acquire helpers") in v7.0 triggers __bad_xchg. Commit
>ac8f06ade38a ("rust: sync: atomic: Add Atomic<*{mut,const} T> support")
>in v7.1 also triggers __bad_cmpxchg.
>
>Mark the functions __always_inline.
>
>Fixes: ab717dd98bee ("rust: helpers: Add i8/i16 atomic xchg_acquire helpers")
>Fixes: ac8f06ade38a ("rust: sync: atomic: Add Atomic<*{mut,const} T> support")
>Cc: stable@vger.kernel.org
>Assisted-by: LLM

Looks fine cmpxchg ended 

Reviewed-by: Bradley Morgan <brads@mainlining.org>


>Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
>---
> arch/arm/include/asm/cmpxchg.h | 12 ++++++------
> 1 file changed, 6 insertions(+), 6 deletions(-)
>
>diff --git a/arch/arm/include/asm/cmpxchg.h b/arch/arm/include/asm/cmpxchg.h
>index 9beb64d30586..0ce5225af442 100644
>--- a/arch/arm/include/asm/cmpxchg.h
>+++ b/arch/arm/include/asm/cmpxchg.h
>@@ -26,7 +26,7 @@
> #define swp_is_buggy
> #endif
> 
>-static inline unsigned long
>+static __always_inline unsigned long
> __arch_xchg(unsigned long x, volatile void *ptr, int size)
> {
> 	extern void __bad_xchg(volatile void *, int);
>@@ -155,8 +155,8 @@ extern void __bad_cmpxchg(volatile void *ptr, int size);
>  * cmpxchg only support 32-bits operands on ARMv6.
>  */
> 
>-static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
>-				      unsigned long new, int size)
>+static __always_inline unsigned long
>+__cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size)
> {
> 	unsigned long oldval, res;
> 
>@@ -220,9 +220,9 @@ static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
> 				      sizeof(*(ptr)));			\
> })
> 
>-static inline unsigned long __cmpxchg_local(volatile void *ptr,
>-					    unsigned long old,
>-					    unsigned long new, int size)
>+static __always_inline unsigned long
>+__cmpxchg_local(volatile void *ptr, unsigned long old, unsigned long new,
>+		int size)
> {
> 	unsigned long ret;
> 
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
