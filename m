Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C5D296BC8
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 08:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776844920; cv=none; b=oHPJBnVDS3f4ipzbmHh3ogIBoyYr7R1Nv9fAJvuuJH5cLJu2/jMOpw68IzeIzaLNwdVFr/4tF9ddAsuznJfr37pSZ56Teh9oABTipnXn+am5xb6Dx+KGUNi4Sjgu1StUfGr4xGKokZNnu90k08GDE4rgi2emtJ+508FBZg9JRhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776844920; c=relaxed/simple;
	bh=7TXn8btK10VB9tz5E4zhdd98l/0tyOSQZnCpHkRMRvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+anitXROL2emkbCReI2D9VJRjlrJ3wQVXhohiqS2+h9xMSr8gyYdk9rBDvOCinnaYIv4PZ2w45q+h4ztD0Dn8hm14EYUtsw51ZMnN3ioN6brtVD+TAB/VSC3AWhtxJEQE4dhwfl37d27z/gyyAzGZ+9BXKqAuyObRFIahby2Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id E06ACF404CC; Wed, 22 Apr 2026 10:01:55 +0200 (CEST)
Date: Wed, 22 Apr 2026 10:01:55 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Gary Guo <gary@garyguo.net>, Link Mauve <linkmauve@linkmauve.fr>,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org,
	jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org,
	ardb@kernel.org, ojeda@kernel.org, boqun@kernel.org,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, morbo@google.com,
	justinstitt@google.com, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH V11 1/4] rust: Fix "multiple candidates for rmeta
 dependency core" error
Message-ID: <aeiAc8vfaR33tLr6@luna>
References: <aedFgEicDW6LAcuq@luna>
 <aedJGuF9P2V1lOCZ@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aedQ629D0x-5KuKw@luna>
 <aedpk1iaeYyKPSOI@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aeds6_8Mr_w38oYI@luna>
 <aeec_IzVJwlfarN5@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <DHYYG7A745M5.VQY4GMDJNC1Y@garyguo.net>
 <aee3ivM9VkbqdQby@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72k7HXYE+1hhbT8xfL+pwhBwVqCQaN=1xXUuTnMhH0J7QQ@mail.gmail.com>
 <aeh-QhEGO7ZiwQZ7@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3Ye2Bg1oCXFzfOAa"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aeh-QhEGO7ZiwQZ7@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Jabber-ID: linkmauve@linkmauve.fr


--3Ye2Bg1oCXFzfOAa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Apr 22, 2026 at 01:23:41PM +0530, Mukesh Kumar Chaurasiya wrote:
> On Tue, Apr 21, 2026 at 08:16:06PM +0200, Miguel Ojeda wrote:
> > On Tue, Apr 21, 2026 at 7:47 PM Mukesh Kumar Chaurasiya
> > <mkchauras@gmail.com> wrote:
> > >
> > > There are some other build errors apart from this on 1.85. So few months
> > > back in the meeting with LLVM team we concluded that for sometime
> > > powerpc will be ahead of other archs at 1.95 till others catch up.
> > 
> > In that case you may want to modify `scripts/min-tool-version.sh` in
> > this series too.
> > 
> > I hope that helps!
> > 
> Yeah this helps, Thanks :) 
> 
> Will post out a new series soon.

Great thanks!

For your new series you might want to incorporate the attached patch,
which makes the core crate build on PowerPC.

> 
> Regards,
> Mukesh
> > Cheers,
> > Miguel

-- 
Link Mauve

--3Ye2Bg1oCXFzfOAa
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment;
	filename=0001-rust-Make-__udivdi3-and-__umoddi3-panic.patch
Content-Transfer-Encoding: 8bit

From 120e1283d1e49d73df483496ffc669328511657c Mon Sep 17 00:00:00 2001
From: Link Mauve <linkmauve@linkmauve.fr>
Date: Fri, 10 Apr 2026 13:51:24 +0200
Subject: [PATCH] rust: Make __udivdi3() and __umoddi3() panic
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The core crate currently depends on these two functions for i64/u64/
i128/u128/core::time::Duration formatting, but we shouldn’t use that in
the kernel so let’s panic if they are ever called.

This doesn’t yet fix drm_panic_qr.rs, which also uses __udivdi3 when
CONFIG_CC_OPTIMIZE_FOR_SIZE=y, but at least makes the rest of the kernel
build on PPC32.

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


--3Ye2Bg1oCXFzfOAa--
