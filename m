Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8878C3D4137
	for <llvm@lists.linux.dev>; Fri, 26 Jun 2026 06:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782456629; cv=none; b=NB56mxt84MJc2taQoHUIWIisaFU7yVCtbRZAjHq4AwGXvUnALSVb3byqDt/BOYdRz+L128hUFkMZl0YUs1SYer9nIZdyyYOEP2CuUkfwgui5wRfvSoLst08i1dAsbgff0Vcpv/KQ5IMY0Vmokf0j2YwvkWbujgU0gfIKqgPdH48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782456629; c=relaxed/simple;
	bh=9qlvLTNPPsGGqeXnLIbL2glNyTP3E/9dVfxeXOSkHIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttv9ZKdnxuJvhD27oL/MeNRAWKRZX8gzjHNu449pAgLC1nR4RCTdgRC+Tu32vCzYZk3o0S7+25cxj1BcddWqmEtd4Zu23gdIpty0svmVymOeBARVL4dFYVDycVQ//t+WGm0vCZWSHEjCz5H2mrHk8clsj9og88j25Qy7OPj9IXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RbI4nK+G; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RbI4nK+G"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30bc871ecdfso864298eec.1
        for <llvm@lists.linux.dev>; Thu, 25 Jun 2026 23:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782456628; x=1783061428; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Aba3H/t6EYUlyXlaVKq50Xkb65xKw4DsCtr12qP1nzs=;
        b=RbI4nK+GjG5Q+RnJK8241Z9mDHJU1mn0E0Ys+haX1PKdGSDNbn/q//IKsQtxWlPuA8
         z0Sffig5WMXrEJDPjAxcNUhSiDy22bRlLAJwrMitogu5do1S7LF5B9HVGptah8ZBsDe7
         fOZGBicEBMWbKTSSrss+UQgmlwmAuTyS+U1MHfL2X2XArLq8o3JHiKh3L17jvd4/ma9n
         /frb/P8sE3X1q5cSK5Om73O5I0EBc3uY6X5JouwQjmO4OLWL3/IfvrVQPclgEHCyF705
         usdIOYadkfRtdc1easuZBOk3NZp/npbgV6C3wjm8OlNVHHBNx5lgfPu4ozmsDx/p5jsa
         iXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782456628; x=1783061428;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aba3H/t6EYUlyXlaVKq50Xkb65xKw4DsCtr12qP1nzs=;
        b=PAhZdsUIb48qgA2oq4hQLQ5Gipgac0/0/QmWoXBfEQuoaxn98wqXaOLpTdaWzbXBmo
         uDzYbODqf7VPAnU+mVIJtLTETWVM0Cw4ap2gJhODOJVv9R8rLlCE2HQPv9ZWSO3x5/jH
         ekt+pj6vOxsQHCGW44fT8JZnl9Q0+gBgYojkhA9IePQwKvjIZmH7lEZYOvIqRjXXHpNI
         OUrqdbtVjSCnudwZYMD1/eV8HRCHY+ofPimMyrh4eAfyDkLfdQ/RRxa9Prc+GWluR9Iv
         UYtARqIXAVUk9bs0bOhxd4vlh/Pl7/LlUCkesuveqF7Zke3w9rH5y7BjLOWJdOw8Z7aJ
         hMLQ==
X-Forwarded-Encrypted: i=1; AHgh+RqbxqwL5TwdHf0/c3lnr4pWUeuPMFaZesxd6DFFUqAIFl5FxEnbkCnPvJrfBg4+m/uxwhWc@lists.linux.dev
X-Gm-Message-State: AOJu0YzAkVolT17euLWD9Cj/ypJc6fEMYx6aWyQrH8s68e+/qu8VUPGi
	2aEvGY6XNxntCeReCxP38weT34Zd+KiaNI8XUqqcQ2D9woo4KXmz1gpY
X-Gm-Gg: AfdE7clx8ITiNqr/I5UxVZrJc0vcTj3oNH2Mi6WUjLvHgtB1a+xSyzq+7sGwxCfaDld
	VgG0fmTRrjUBPy7NmvzGbXQTwh3VSRMliH9c8VVEDde5SBUzTPgapnZGPJBHuXv5gJZaLVUFKkx
	DNHEXX1+qbnMBMGg/nqcIAJtTpuO2bIi8sW7nFW3LR7Jg4pBS4z61eopJxzKJ2sLT8Z4TiUgYBy
	8W3Za8UTJSo5kfYl1nUtUGjhDbhNkPzFdWYEit4892+qf8duIFTZ2/7vB0tfpZEzNWyKiPW6UHE
	88ma99PBc9ys+ygggyXonUQgBuYdbzcGkcR0v4DZyc8fzraQ3JpmHJfwmtwQpPH/dyZ/mPs4sXc
	ffrUAzR01+Ud8PoHMbCA70F6+nfP5RluchLUpyQFnHwQYic4ZofaUt3jCm1J4Cd2kqx86XRa97q
	1MwdEr9cRnCHau5vySjU1opi1rqR2RPnQEXYGaiEJgLt0hl1+NLAzpISYM6pl1
X-Received: by 2002:a05:7300:8c15:b0:30c:1147:ccc3 with SMTP id 5a478bee46e88-30c84fdbbaemr6195163eec.33.1782456627484;
        Thu, 25 Jun 2026 23:50:27 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c9faab3casm2579526eec.1.2026.06.25.23.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:50:26 -0700 (PDT)
Date: Fri, 26 Jun 2026 12:20:11 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	daniel.almeida@collabora.com, acourbot@nvidia.com, fujita.tomonori@gmail.com, 
	gregkh@linuxfoundation.org, prafulrai522@gmail.com, tamird@kernel.org, kees@kernel.org, 
	lyude@redhat.com, airlied@gmail.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V16 4/7] rust/powerpc: Set min rustc version for powerpc
Message-ID: <aj4gAdy2siBxONpo@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260520064630.1785283-1-mkchauras@gmail.com>
 <20260520064630.1785283-5-mkchauras@gmail.com>
 <CANiq72nPOMkZXpMpwTLFg4xjFfmyf_O_x2FN_nrNBsxeNu178Q@mail.gmail.com>
 <ahVb4k-2rC4EYZF9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ahVb4k-2rC4EYZF9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>

On Tue, May 26, 2026 at 02:22:49PM +0530, Mukesh Kumar Chaurasiya wrote:
> On Mon, May 25, 2026 at 08:16:53PM +0200, Miguel Ojeda wrote:
> > On Wed, May 20, 2026 at 8:48 AM Mukesh Kumar Chaurasiya (IBM)
> > <mkchauras@gmail.com> wrote:
> > >
> > > Minimum `rustc` version required for powerpc is 1.95 as some critical
> > > features required for compiling rust code for kernel are not there.
> > 
> > Which critical features?
> Hey Miguel,
> 
> Right now i can only think of inline asm. I can rerun the whole thing
> with 1.85 and figure out the issues with 1.85. I'll get back on this.
> 
> >
> > > For example Stable inline asm support which got merged in 1.95.
> > 
> > It is not needed that the support is stable, but rather that
> > everything you may need works.
> > 
> I wanted inline asm be stable, I was skeptical about inline asm to be
> unstable and potentially messing up the whole system. That's the reason
> I waited for the stable support to get merged before sending out this
> patch series.
> 
> > From a quick test (with a dummy example that may not be
> > representative), ppc64 inline assembly seems to work for a long time,
> > way before Rust 1.95.
> > 
> > So, which is the actual version that it is needed? i.e. 1.95.0 doesn't
> > seem to be required at least due to that.
> > 
> Yeah it may be true. I'll test out the 1.85 rustc and come back with the
> results.
> 
> > That is why I am asking about the critical features above, because it
> > may be that this works since earlier versions.
> > 
> > (I wonder if this patch and s390's similar one influenced each other?)
> >
> I am not aware of s390x way of approaching support for rust so can't say
> anything about that.
> 
> > Thanks!
> > 
> > Cheers,
> > Miguel
> 
> Regards,
> Mukesh
> 

Hey Miguel,

Sorry about delayed response on this.
I ran it with rustc 1.85.1.
CONFIG_RUSTC_VERSION_TEXT="rustc 1.85.1 (4eb161250 2025-03-15)"

I got a linker error with this.
ld.lld: error: undefined symbol: __subsf3
>>> referenced by core.7dc3da321ed68c1f-cgu.0
>>>               rust/core.o:(<core::core_arch::powerpc::altivec::vector_float as core::ops::arith::Neg>::neg) in archive vmlinux.a
>>> referenced by core.7dc3da321ed68c1f-cgu.0
>>>               rust/core.o:(<core::core_arch::powerpc::altivec::vector_float as core::ops::arith::Neg>::neg) in archive vmlinux.a
>>> referenced by core.7dc3da321ed68c1f-cgu.0
>>>               rust/core.o:(<core::core_arch::powerpc::altivec::vector_float as core::ops::arith::Neg>::neg) in archive vmlinux.a
>>> referenced 1 more times
make[2]: *** [scripts/Makefile.vmlinux:72: vmlinux.unstripped] Error 1
make[1]: *** [/home/mkchauras/src/linux/Makefile:1367: vmlinux] Error 2
make: *** [Makefile:248: __sub-make] Error 2

This corresponds to a floating point instruction. Although we have
disabled fpu, vsx and altivec we are still generating these. Seems like
we have some issue with the rustc here. I didn't dive deeper into this.

Is it ok if we keep 1.95 as base for powerpc64le?

Regards,
Mukesh


