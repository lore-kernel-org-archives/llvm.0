Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FCF377EB9
	for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 16:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776789426; cv=none; b=VqFMIfUdQaYFXMWkuW7nVxU6XcATWUihPfz9nryc9xnvxPlIb1iRnu7YXRI/kz7LQ+tIEBL2H6/ZnWt8VgkwvO+R475VDz9hACZVTP5mM8vwd2/0CUDJYa5Sl6YyKuTPV358lrqGR2OYatzNOh4aEBVisGaZSJfBDeeXTYvYcqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776789426; c=relaxed/simple;
	bh=hcCgqzD2ddkKIML+Zi/f5sSmvWE7gwvErQ5Qiv54OkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7Mvewp8EVue8OJO5ImzqOxMqQckLQla21Iq+FicV0fsAAkFYT1vajYzeqLEBbn7LxxcjExshH/N8JPK5OanWcWgJFmrcUrQJR8zOfPH2vEHPI7tIX5UYZqNJyPSRu1zYlfio1oCVcDyUqmvQmmIB5U3LzL/IR0uokY+HexB638=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id CAA00F40852; Tue, 21 Apr 2026 18:36:58 +0200 (CEST)
Date: Tue, 21 Apr 2026 18:36:58 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: Gary Guo <gary@garyguo.net>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com,
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org,
	ojeda@kernel.org, boqun@kernel.org, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
	dakr@kernel.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
	morbo@google.com, justinstitt@google.com,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V11 1/4] rust: Fix "multiple candidates for rmeta
 dependency core" error
Message-ID: <aeenqoV-dWWW3tZv@luna>
References: <20260417152253.2312961-1-mkchauras@gmail.com>
 <20260417152253.2312961-2-mkchauras@gmail.com>
 <aedFgEicDW6LAcuq@luna>
 <aedJGuF9P2V1lOCZ@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aedQ629D0x-5KuKw@luna>
 <DHYYH903GZVW.EU2UKXD2ET0S@garyguo.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="J+r4kPV/yKTiBgTB"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DHYYH903GZVW.EU2UKXD2ET0S@garyguo.net>
Jabber-ID: linkmauve@linkmauve.fr


--J+r4kPV/yKTiBgTB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

On Tue, Apr 21, 2026 at 04:59:11PM +0100, Gary Guo wrote:
> On Tue Apr 21, 2026 at 11:26 AM BST, Link Mauve wrote:
> > From 2c0a3ec3da6fa1f0151225c05159f7a812317d32 Mon Sep 17 00:00:00 2001
> > From: Link Mauve <linkmauve@linkmauve.fr>
> > Date: Fri, 10 Apr 2026 13:51:24 +0200
> > Subject: [PATCH 3/3] XXX: Workaround for __udivdi3() and __umoddi3()
> > MIME-Version: 1.0
> > Content-Type: text/plain; charset=UTF-8
> > Content-Transfer-Encoding: 8bit
> >
> > The core crate currently depends on these two functions for i64/u64/
> > i128/u128/core::time::Duration formatting, but we shouldn’t use that in
> > the kernel so let’s panic if they are ever called.
> > ---
> >  rust/exports.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/rust/exports.c b/rust/exports.c
> > index 587f0e776aba..5f1cdf13882e 100644
> > --- a/rust/exports.c
> > +++ b/rust/exports.c
> > @@ -12,6 +12,7 @@
> >   */
> >  
> >  #include <linux/export.h>
> > +#include <linux/panic.h>
> >  
> >  #define EXPORT_SYMBOL_RUST_GPL(sym) extern int sym; EXPORT_SYMBOL_GPL(sym)
> >  
> > @@ -20,6 +21,14 @@
> >  #include "exports_bindings_generated.h"
> >  #include "exports_kernel_generated.h"
> >  
> > +void __udivdi3(void) {
> > +	panic("__udivdi3() called but shouldn’t be made available on this architecture!\n");
> > +}
> > +
> > +void __umoddi3(void) {
> > +	panic("__umoddi3() called but shouldn’t be made available on this architecture!\n");
> > +}
> > +
> 
> This should be added to compiler_builtins.rs and gated for PPC32.

Thanks for the suggestion, this already seems like a much better
location for that!

This works fine for the core crate, but now panic_qr also gets the same
issue, here it is with V=1:
```
+ powerpc-linux-musl-ld -EB -m elf32ppc -z noexecstack --no-warn-rwx-segments -Bstatic --build-id=sha1 --orphan-handling=warn --script=./arch/powerpc/kernel/vmlinux.lds --strip-debug -o .tmp_vmlinux1 --whole-archive vmlinux.a .vmlinux.export.o init/version-timestamp.o --no-whole-archive --start-group --end-group .tmp_vmlinux0.kallsyms.o
powerpc-linux-musl-ld: drivers/gpu/drm/drm_panic_qr.o: in function `<drm_panic_qr::SegmentIterator as core::iter::traits::iterator::Iterator>::next':
drm_panic_qr.f39a15fa3c72e9fe-cgu.0:(.text+0x200c): undefined reference to `__udivdi3'
```

From a cursory look at the SegmentIterator::next() function I don’t
understand where the division could come up, but it’s actually nice to
get an error when operations which shouldn’t happen happen anyway, it
makes it more likely to get them fixed.

> 
> Best,
> Gary
> 
> >  // For modules using `rust/build_error.rs`.
> >  #ifdef CONFIG_RUST_BUILD_ASSERT_ALLOW
> >  EXPORT_SYMBOL_RUST_GPL(rust_build_error);
> 

-- 
Link Mauve

--J+r4kPV/yKTiBgTB
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment;
	filename=0001-rust-Make-__udivdi3-and-__umoddi3-panic.patch
Content-Transfer-Encoding: 8bit

From c938984c5974ba636699ce0e2cfabeb45a8d861d Mon Sep 17 00:00:00 2001
From: Link Mauve <linkmauve@linkmauve.fr>
Date: Fri, 10 Apr 2026 13:51:24 +0200
Subject: [PATCH] rust: Make __udivdi3() and __umoddi3() panic
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The core crate currently depends on these two functions for i64/u64/
i128/u128/core::time::Duration formatting, but we shouldn’t use that in
the kernel so let’s panic if they are ever called.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
---
 rust/Makefile             | 4 ++++
 rust/compiler_builtins.rs | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index 99537c2c55ee..568f241a21a7 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -626,6 +626,10 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(CONFIG_64BIT))),)
 		__ashrti3 \
 		__ashlti3 __lshrti3
 endif
+ifdef CONFIG_PPC32
+	redirect-intrinsics += \
+		__udivdi3 __umoddi3
+endif
 
 ifdef CONFIG_MODVERSIONS
 cmd_gendwarfksyms = $(if $(skip_gendwarfksyms),, \
diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
index dd16c1dc899c..fc6b54636dd5 100644
--- a/rust/compiler_builtins.rs
+++ b/rust/compiler_builtins.rs
@@ -97,5 +97,11 @@ pub extern "C" fn $ident() {
     __aeabi_uldivmod,
 });
 
+#[cfg(target_arch = "powerpc")]
+define_panicking_intrinsics!("`u64` division/modulo should not be used", {
+    __udivdi3,
+    __umoddi3,
+});
+
 // NOTE: if you are adding a new intrinsic here, you should also add it to
 // `redirect-intrinsics` in `rust/Makefile`.
-- 
2.54.0


--J+r4kPV/yKTiBgTB--
