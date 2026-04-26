Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7634C2D73A0
	for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 07:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777189960; cv=none; b=MWY9ENm9jgwyjFSGLdBmbY5oNEYc+pyGcst96o9G1t1zY9ZN/08EpJchduOsm/qMaWYCc9kS+2dkfwbtkQK1d1ztvEEkeBBFEEKk1KjG/AkBQ8l597RXv8PDFVlC3gh0QQTaH0h4hudoyA5fJ5nB+Y5OiOtT0vEBCZn8erdx+Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777189960; c=relaxed/simple;
	bh=DXQYJ4tGTxVmhBiqN0e9ilWp/OFflVfJWy26XX2xBKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmZfBSMpdfoilJS/pCchkFIQTZBorcgSUW+AJyWR8zqoPJkdJBba9FW3LU24CcUP8xdwY6EiDE1v320ll8nRTziXgZCe6uOoqysWcj3Et0WeY9zNVdWWVhlQNoVq5xah6uCIoPAPuaeYpkAw8MgZT3n/eJX83/gQ8UObfsQTg3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eH2AyusT; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eH2AyusT"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c736261ee8dso3340450a12.1
        for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 00:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777189959; x=1777794759; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8zTG+Dw6oqSR8kg/1RMP0Ayk7RcQFqZXb8XQS8VS+9A=;
        b=eH2AyusT1cCqYSMVt4A2TDNFVYv/Eps/lzl6/NVzXZinDwGFO3cDX5K/rD7LPeDoh3
         sY6vcoQTk4MJ/wFPxn8a2IptfoBM+W/ZwQOn6FJDG5KtVsKv7muY0l9rFYARatqkm3iF
         TNFSvDqhL3UtccAGmXloDjGx56atDfHFc0FwDrStfRynS2F6uPvxSpqWGVThSfjzMjFS
         aqV9Sn5YA2nwO535fGkebv/l62E8kksj35VtWRGvL4xU9xrh+DP+q/OF55wHf0FJtiR7
         mzXqfGeDC5c6ca1zz3kijyL5JHjZsl8AaXbWFFIPrkxfhAub3M6aG4np97fvNYmnqjOI
         R+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777189959; x=1777794759;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8zTG+Dw6oqSR8kg/1RMP0Ayk7RcQFqZXb8XQS8VS+9A=;
        b=BVAsL1i8g0r3vhmTECExbA85bcvgVvc1gx6gNN+D3T/5VRhhtHVl+ZBfS6L+isDW8N
         tTME71fc3v3e4ynaikIQZ3R56hXH6CkLPkDNWz+qgvraUcosbG6Ui3DYYkQ7REx92DZY
         sXcdWrBlR3sckrPO45cllAkqSz6U5Zymx+VjcAxjR7dEJTKdR/U4Tf1z0c5TzRSI9tWW
         FcsF9E+8EFxXc6lAaJTglq768adggBocx5fW2lIuFYc/NaJLfuxCk2DuZLi9tGWn1Qt7
         JMxIjoa5Xo37BzyaapKQMXmckk5jHHyGDa0xgUzUm6A+Jm6zXhQXfg9uJ9ryt/lx2qTA
         VeGw==
X-Forwarded-Encrypted: i=1; AFNElJ+WBznx9thaUTYqEM/tg7Dm2B2rCd5utbAA5Uh5N7tce0wnDWmoliM+eogyzxN7Pvz8JJ+/@lists.linux.dev
X-Gm-Message-State: AOJu0YxPjA85tA0aaxuvNSL+I/4g1dxQ/64KogUojRHhe4AvutehYP3D
	zWnL4mIh0dlhWGYm3Jm9KhkJIDMPk0IO2okWbxcTg7UOzFp8l4SuRvvO
X-Gm-Gg: AeBDietMjmpqm9OXbWY32/e11QlAlNErfW4gPYDPcfjwV6Q5WAMzbqXtmU9eXftuhVx
	KAYe7LMmMZZjAoU1IUEzeJ8wx+CeEZgh9fa3/n6zcuWz31zL80eiBcomvHcVKA+QZqnsrQfIrLT
	/7UMhrX9+P9UIgDuQUzGtBRfTNEk4TiH7jyTs1ZYxsHr2McB4QDqVHdPUBS4bGmyjcfgicSXWe2
	yYbP6YYBm6caBSsBAdyIhgQtgK1Yxwxo8pkCa8gSX0DmepO62CVLdl4f1k3J8z1czXY0lglAgdu
	MBn19tGSRN9FGCiyIHe2biUziGWhaoQ1MS7A9M6PZenuYsRJ8m7LyGhI0lxshuDG85HTu9JTtqw
	UP0f6I6enF+4g0j//a/WUdjP6+prfFklgc3VWrkSefadezX/Zepw5R34QyAgosBpQKwDXWVzBYj
	ofDH2HatjGwSWgDqwzZ50aoIhVGusDeHARzAtJnWIY50kGoetTM52v+HLGPE5vf3AeN77afsC+1
	nicO1J8zQ==
X-Received: by 2002:a17:90b:52cf:b0:35e:577c:c9f with SMTP id 98e67ed59e1d1-361403fb305mr37768192a91.9.1777189958672;
        Sun, 26 Apr 2026 00:52:38 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613fba1436sm10396034a91.11.2026.04.26.00.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 00:52:38 -0700 (PDT)
Date: Sun, 26 Apr 2026 13:22:24 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, ojeda@kernel.org, boqun@kernel.org, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com, 
	justinstitt@google.com, tamird@kernel.org, arnd@arndb.de, nsc@kernel.org, 
	simona.vetter@ffwll.ch, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, Link Mauve <linkmauve@linkmauve.fr>
Subject: Re: [PATCH V13 5/7] rust: Make __udivdi3() and __umoddi3() panic
Message-ID: <ae3C2gqzoVaovY-h@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260424054742.45832-1-mkchauras@gmail.com>
 <20260424054742.45832-6-mkchauras@gmail.com>
 <DI1E781QPU8F.1C28PL0089NP6@garyguo.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DI1E781QPU8F.1C28PL0089NP6@garyguo.net>

On Fri, Apr 24, 2026 at 01:43:43PM +0100, Gary Guo wrote:
> On Fri Apr 24, 2026 at 6:47 AM BST, Mukesh Kumar Chaurasiya (IBM) wrote:
> > From: Link Mauve <linkmauve@linkmauve.fr>
> >
> > The core crate currently depends on these two functions for i64/u64/
> > i128/u128/core::time::Duration formatting, but we shouldn’t use that in
> > the kernel so let’s panic if they are ever called.
> >
> > This doesn’t yet fix drm_panic_qr.rs, which also uses __udivdi3 when
> > CONFIG_CC_OPTIMIZE_FOR_SIZE=y, but at least makes the rest of the kernel
> > build on PPC32.
> 
> Can we always build libcore with `-C opt-level=2` even if
> `CONFIG_CC_OPTIMIZE_FOR_SIZE` is specified? It feels like a better fix than
> stubbing things out.
> 
> Best,
> Gary
> 
The issue is not coming from libcore itself. It's the driver that's
causing this.

Regards,
Mukesh
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
