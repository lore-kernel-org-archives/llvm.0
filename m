Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F2338B15B
	for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 09:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777023803; cv=none; b=lTQESYhg9ERMdA8EO+MENa2mrZHIwvFXGHxle1p3cdjMK2QkYORG+6jYkVwjPLR0SQVz/jB9PpUpYrAk5VH7u+aDf3dVoVUlImR4VX4R0sN+hQeJUJtwUay4bQTqh97eDzf9Kr6TwsYqrHWTeP7Zgf1rhbSTxG+7WSSzTLWSeRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777023803; c=relaxed/simple;
	bh=IsGbTLFDAywlt/HWtr2yPyilDNXaKH3sPmY5qGpj5h0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WFw9lU4lKECx6uAYqgB4ymxGmQsAnD5IfC1VsPsiZv9uA6X0O4ngFiZa9vZlzHhUegeJMqPYsxbbo48XxD7IE6hGtvfk7G2ryvdnDjWqNZo7aeUTLeJveK5Mi87EuTvI5v3sXnE/8sdYKis+ntbo/V9FlZWYnkdTkdJJ6ZMK05g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id AD74AF4089F; Fri, 24 Apr 2026 11:43:11 +0200 (CEST)
Date: Fri, 24 Apr 2026 11:43:11 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: David Laight <david.laight.linux@gmail.com>
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org,
	jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org,
	ardb@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, morbo@google.com,
	justinstitt@google.com, tamird@kernel.org, arnd@arndb.de,
	nsc@kernel.org, simona.vetter@ffwll.ch,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev, Link Mauve <linkmauve@linkmauve.fr>
Subject: Re: [PATCH V13 5/7] rust: Make __udivdi3() and __umoddi3() panic
Message-ID: <aes7L3M1d_LvvGKa@luna>
References: <20260424054742.45832-1-mkchauras@gmail.com>
 <20260424054742.45832-6-mkchauras@gmail.com>
 <20260424101425.6bde0e17@pumpkin>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260424101425.6bde0e17@pumpkin>
Jabber-ID: linkmauve@linkmauve.fr

On Fri, Apr 24, 2026 at 10:14:25AM +0100, David Laight wrote:
> On Fri, 24 Apr 2026 11:17:40 +0530
> "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com> wrote:
> 
> > From: Link Mauve <linkmauve@linkmauve.fr>
> > 
> > The core crate currently depends on these two functions for i64/u64/
> > i128/u128/core::time::Duration formatting, but we shouldn’t use that in
> > the kernel so let’s panic if they are ever called.
> 
> Ugg.
> Surely you can make it a link-time failure?
> Or change the underlying code to avoid the divide.

This is currently a link-time failure, which means if any of the core
crate or drm_panic_qr are linked in, the kernel will fail to link.

And since we rely on core, that means no kernel can be built on PowerPC
without this patch.

A possible solution would be to change the core crate to not divide
u64s, but the last time I tried to do that I couldn’t quite figure out
how to do formatting without it, maybe I will just open an issue against
Rust.

> 
> 	David
> 
> > 
> > This doesn’t yet fix drm_panic_qr.rs, which also uses __udivdi3 when
> > CONFIG_CC_OPTIMIZE_FOR_SIZE=y, but at least makes the rest of the kernel
> > build on PPC32.
> > 
> > Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
> > Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> > ---
> >  rust/Makefile             | 4 ++++
> >  rust/compiler_builtins.rs | 6 ++++++
> >  2 files changed, 10 insertions(+)
> > 
> > diff --git a/rust/Makefile b/rust/Makefile
> > index 2a5428a5503d..ee11fba7a03d 100644
> > --- a/rust/Makefile
> > +++ b/rust/Makefile
> > @@ -616,6 +616,10 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(CONFIG_64BIT))),)
> >  		__ashrti3 \
> >  		__ashlti3 __lshrti3
> >  endif
> > +ifdef CONFIG_PPC32
> > +	redirect-intrinsics += \
> > +		__udivdi3 __umoddi3
> > +endif
> >  
> >  ifdef CONFIG_MODVERSIONS
> >  cmd_gendwarfksyms = $(if $(skip_gendwarfksyms),, \
> > diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
> > index dd16c1dc899c..fc6b54636dd5 100644
> > --- a/rust/compiler_builtins.rs
> > +++ b/rust/compiler_builtins.rs
> > @@ -97,5 +97,11 @@ pub extern "C" fn $ident() {
> >      __aeabi_uldivmod,
> >  });
> >  
> > +#[cfg(target_arch = "powerpc")]
> > +define_panicking_intrinsics!("`u64` division/modulo should not be used", {
> > +    __udivdi3,
> > +    __umoddi3,
> > +});
> > +
> >  // NOTE: if you are adding a new intrinsic here, you should also add it to
> >  // `redirect-intrinsics` in `rust/Makefile`.
> 
> 

-- 
Link Mauve
