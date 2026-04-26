Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6542B346FA0
	for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 11:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777204499; cv=none; b=QjzvJjZyaKl2ilZVdv/qPJkTVDQSMCKAEz2d/JPqXxCkwvw0aUtk53M74VRF+uP9Iwv1R88FybnCxx9FNAXEOhappquwCjUikcHH01mVuOJo0OUrPCOpCTAkjIgyFAJ9POb8jzQwO4FoDHBt0d/02OW9CFpVZStlbNqZtCn3CgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777204499; c=relaxed/simple;
	bh=s97TACo/hqmjQpYdb4vDFZoOWfwKihLA3tU+wy+H/4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4qwsFz5Z5+aS9vIokbFRt0Ns7XOceW9FqY73tOYv3oylf+BaoM+ojr2gVGVWvUPsM//HFpZNqjPRu3Ww4m4ufP80jVr2HQb6uXvZolWbj4OAr4bhZyDmd6IWMaWyAQyiuclAflTTGVLC8y7Q3cTMDAcKL9cPDRGva+kdTBf400=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMCAaWBr; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMCAaWBr"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82f4a53ae20so6787789b3a.3
        for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 04:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777204498; x=1777809298; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EOUGdGocvy3Me4myqdA0xbgNTAj2NUsoVcgMrrjsU4E=;
        b=TMCAaWBrzn+gmOqHWeufyglnHknDkcLYr8iOJ9t0+VTIkwj7zrFsd7p/RESmpmcmAR
         ne0ugCujvn1sPRKJPuto1sAlhyZzt6rRwbJORAvuJ81J8xQ51wn+prIkZyBjZg4Q4sfR
         ndsovbk4nul6jIPaatAVPLBjNyVdOLtMcfCG7sNtRrLKTP/NGO3SzJYOSVTH8SHTaSfR
         RGL3Rh2GLj0xgjGk7ABSfq+UspkEXSIaQSYZ3R3zukGd+i/HjR+hpzl/rMBJPPtNwuB4
         63QYcm5kzwKzRd7j2ke53exkNQRDp/vjh6eCSx/h2lFloBAyjr0V+pyp7dNTEg8E20yu
         dpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777204498; x=1777809298;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EOUGdGocvy3Me4myqdA0xbgNTAj2NUsoVcgMrrjsU4E=;
        b=Ar7O9vJL1J8NQoFofdELsFwI4dmXbu1CuQECzuWwUwqLzj61MujLY2NW903uvgv9Hh
         mBqZp+qiZGO1vYOjpoGMFLF8Vs2/zzYFZLTjL09A+oC5AP9dtk/6Qty1PoGzLWb++Ced
         cA6D+IUlfBTenH0e3lJIlgAhipU1sv9RlkGKKKYfdkmCNTY+lNIjQ5Lizuncx9t87Z3B
         EUhEqx9WKz1+uLzRotijNpWxcJ2GxaIdTjMfopriIr1wYY4lH4rgomBmTrpOvDDjTXXa
         47/KkeYWT8wbma4wgXa7xjvC/oRNTE0Y2UNEDnJbRMRD7E7orsL/pAQP4kHrXlfyIZJB
         i2og==
X-Forwarded-Encrypted: i=1; AFNElJ+QFCTOcZaBmvbHPlsMyFhrXUgIbTbuhouv4UG8LkGdcSRv5Wmku1RdTqpGR/XskG8XBQFM@lists.linux.dev
X-Gm-Message-State: AOJu0YyltYvVkdHta2HRNRXKGE4a2ndVGGN6z9puCD1ZVrLOTf7I4eBz
	Y+hnbAXWsTTZjv+mll5WO4mDGfsIZ6BUpbpdOJS+bUYJTCKycXQEigw2
X-Gm-Gg: AeBDievaIxVihJzwjJnfEAnAWNtU/Y8kHsT1KCtZoC+ZXxqdVr7uG333w10iSXRXWcI
	iBAXroxIWC7+XVzAUtFNzQeMvIvvC4EkyFavM3T+WQogEmx0i16228cxZqgF/84WpmDofxm1TCm
	nV+ChRCddFYLc6k14kYGiV1IVre04UJNfT8kboSTYHsHeO/7bMcDszBAtRWwFPJ5kS77bhRFMu0
	Fidd+NeeQeLLgs8/VYfoDImR3KrycVoCa7GQkVWAkdw0CUuUb8tLa9iq85khe7qSqhfGdFo2721
	uGWYDb2OQt7AHXHeWzQvpMTh6FwPlNI7WDDgOhNTP/k8aVZwxDZZEBy6k4i/0j32O0WbxrmsCJO
	8ASBjkgR1UDhlmCFGykD4zj2mJCH8M6yciyc/F5h+pBtwCTSF/QjeYcFQnAnG8L/VAQve/ivXdI
	pYuec9lpXtVHjICk+xLefAYDXcZcubXltGwDpYtXTef20HqEV/VNw22l2KE0JZAaQTktznsf4oI
	f5C5oYyAw==
X-Received: by 2002:a05:6a20:2591:b0:39f:3ca8:a331 with SMTP id adf61e73a8af0-3a08d7372b4mr44232635637.16.1777204497670;
        Sun, 26 Apr 2026 04:54:57 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797701d9bfsm21241887a12.16.2026.04.26.04.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:54:57 -0700 (PDT)
Date: Sun, 26 Apr 2026 17:24:42 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	daniel.almeida@collabora.com, fujita.tomonori@gmail.com, viresh.kumar@linaro.org, 
	prafulrai522@gmail.com, gregkh@linuxfoundation.org, arnd@arndb.de, tamird@kernel.org, 
	lyude@redhat.com, airlied@gmail.com, j@jannau.net, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Link Mauve <linkmauve@linkmauve.fr>
Subject: Re: [PATCH V14 5/7] rust: Make __udivdi3() and __umoddi3() panic
Message-ID: <ae38Eh_HgkJR0jTo@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260426085725.2090827-1-mkchauras@gmail.com>
 <20260426085725.2090827-6-mkchauras@gmail.com>
 <20260426124921.28eb433f@pumpkin>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260426124921.28eb433f@pumpkin>

On Sun, Apr 26, 2026 at 12:49:21PM +0100, David Laight wrote:
> On Sun, 26 Apr 2026 14:27:23 +0530
> "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com> wrote:
> 
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
> This needs resolving properly.
> 
Hey David,

Yeah I agree, we need to find a proper fix for this. This is under my
todo list. Currently we are enabling experimental support for powerpc
and we are trying to get the basic kernel to work as of now. panicking
kernel also doesn't seems like a good idea as of now to me, we are
working towards it, we'll come up with a solution soon. Meanwhile we
want atleast the build to work.

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
> > index f6369d121c50..9aa18cff2fae 100644
> > --- a/rust/Makefile
> > +++ b/rust/Makefile
> > @@ -615,6 +615,10 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(CONFIG_64BIT))),)
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
