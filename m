Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689A9336EE1
	for <llvm@lists.linux.dev>; Thu,  9 Apr 2026 20:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765988; cv=pass; b=EICsZjAGNHvzdFQIJVkZqyKn1BZWSTVsVWpGtcMBPvMhy8mMidQbZybkkV7gA6K4R/YSNESmsODM7X/QO/F8r34nuBL5NmLkZRVH43KoQDOhF+wloZOWSgCZWskYcrkWXoVCjZcaK02J7izX1VFAJ8VywnhTJyCOwBR9QJY+2Ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765988; c=relaxed/simple;
	bh=RDN1p6W4IQhH95WIO0SfwAGjMDMJiLF3yAuqpAlJwVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WSblpApiNv80r5k+TbTS/TIgssyFGpEmfaA3IYKiD8KOdzvlyQ/fZOdPrCNZ4t3MEWC2ICAPJEOYQa0BqnOJ90F0IzpUdvr8/4UhPetDVrfaziqRxaDdrIxHcMCGvz6YYDB0gVfxr1UoH4b5NhcGl0cGQBq5BDVXcqQ701uHN+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bnQNjg09; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bnQNjg09"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12c0433a4b9so3690870c88.1
        for <llvm@lists.linux.dev>; Thu, 09 Apr 2026 13:19:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775765986; cv=none;
        d=google.com; s=arc-20240605;
        b=c1vyBs9hMPqV4lL3mU1gyAByHI0Z2gvmUOD2nbMB9L1P2Q0WYrxgL4fqOLBx6xq0UW
         j2tUm+Da6vMiZjgWwdiKAHetPPlsGuvoAfWBVnOS/B5FZBwqFcNaYgfqWywK5YPsWb1w
         7PE+VpgCKZMgAxcQR89wZTKU5BEBHueuFk1qO2xKslrzueJcc+5Ur6GFN6+kPPIqkKxw
         HmAVLaTRAfh47samnvUjZwDSnMJ0xD1jcmRgUJSwbfqa/p5gB/CkXYQ8aaiDEEqrgvLb
         osl/BobT3JGI2f4uS2+Umrt1waZ4RCXCMhELKSQnL0S1hC8twyHoDBuJQzxw+AGaEqmZ
         SyZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=G8yxp814R8LsOCbjv5Tx3ImzbZaJM5uPFtadcPgr4Gc=;
        fh=MEauK6p1RBGQEAeb1gOObG6g86zlnhsu2THjaifGaHM=;
        b=aIYVGNtXdXxpuLKKw1CeJ1FbEpISkBovCA83sVtVHEMpY0Xm26IRR54sdZyyjvFTDv
         mkffnpzgvn9+RlKI1+fjwePLSvsvYXDbIwRKKlrpyoaCuQyCw7Ly1GyPyDZnmcX1G1cv
         UfE2rd5Chgxruah6L50kEvhM5hhqGoFm7KHa25M8aFUUzMEOpE7o8q/UHvp3UPZcvr4z
         2yV3NTdA2TwKhmHgxw6QaUD0Dorh7eiXG56dtD3YjqKPLF+wTQ9CZ8bacD9GkVsJGQ2A
         NXpsncne9AXUUYHKcvq+TtNEP0Jv8rwKWlKBRXB1b3bA5Y55VqqINZ4EmcmBcH9N/AQ7
         mGTw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775765986; x=1776370786; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G8yxp814R8LsOCbjv5Tx3ImzbZaJM5uPFtadcPgr4Gc=;
        b=bnQNjg091VKUPdIaaJ9VUXooVOMIM4bIVGhujkuD8bAbMv9YeWzhkWDxl5jJrVnWjt
         X9SJqW2sCAZgdxX2P13+vIYTEsFkYXEQ7dh++TiUN2EAawVNiIbMP+2TK8lWpS9vm0dY
         AHJUsy/+nYg4NQIslonKWRZWJ7TDiJCeKEglhU9XMJM8dmFqx9GOnhmUPPy/77ANC06Z
         /RCFJG3Hhl+RigXTx7uqmug6fUOCV/vUNfigIaGx06RS5h+MYzIJ834UWsu989TEsiqH
         yke9MMUtawnGkbbkSppT00zMiaVZhaMqaHwjFHnlYJep79SjazDyWl+Usirq8nZ3RIod
         uAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775765986; x=1776370786;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8yxp814R8LsOCbjv5Tx3ImzbZaJM5uPFtadcPgr4Gc=;
        b=Ag2ebODa6QrJ3o/dLpErXjdq7DMH4v+aPJx5PNWvHEZL3HISw0FLC5Pa1voiCGOM8m
         43lQKMMUbZKE2t/Xkm/2d/fr/8H/L/TnDzZ9btFUlRigqFwa/ErZjomnkLgTHd9J/Nx6
         M3Jbkq375iWLysm3W7Ub9+9uJZTupzqY2+mTe0kuEOu3/mrL3WP74Xvp4jUEOGzFop//
         O9vQWR85TkAXIwhyBJaH8CTDWTsowf/u+wr4Q/MnpFQUKl7emKUC5rtGzB3x7zJAVXUE
         zprEN9DcXk5dUn/B2lyyco2H+FR2IIz62AfbgLrmA4aXsQSF0ox8i/lkgnZm3ROt+6ah
         uAHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDsh/I34B5tNj0aHupwH/gdsq27DMwvP4UcjDhwWe/acXT8inhx9NE6nB+q6R2MfKw72sI@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9P//AUO20RbTcX674wSVnM3MLc2fBjQUHzDhfOUqQB/fPgRSR
	aAo2M2BOBJrQ9aPeEbFVRW30PrDLh/NS7KD767jklBDeXGiwzheKVtO73NfCqPhtQuIB83H67US
	2DhEFzjTl97MutRLBLIk4TITnfyJFS123sBOYBTXB
X-Gm-Gg: AeBDievLQrdMQje2xPmzoNYga0Z0gUzF7GC1bzcjNif4Ih8dA+rN0RlKL49r5Xvw9D9
	E1ReVGpojdGthzKMbzci5dXsjyJYu7sHbLJQ5GjXVe56b98GOkzXVCjsT0t7mEOti8HRI9giM3u
	Ca1bIlwoJxcnyVVvGXSkz7TskCQJJTXdzuaVoyzy5sXLBwdAPwpzuoUv7LQH085TgYTlud8l5kF
	1cNixgKpgXVhbk/jngwqzdz571i/ySTAsr1ipTCHFfloL7Qzo7RrGcmPEzVp0PHLh4ERRh2o8MC
	Oo2bkFrnnX8irmONLtCqjUolDzS6HC0ufdDse8RNujI/iK+0
X-Received: by 2002:a05:7022:ff43:b0:128:d1c9:3633 with SMTP id
 a92af1059eb24-12c34ea93bamr326968c88.13.1775765985689; Thu, 09 Apr 2026
 13:19:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331111240.153913-1-elver@google.com> <ac9d5O5XehnXRc5A@hyeyoo>
 <d0fe363c-2e8f-44a4-9b64-3fa3ba9a5773@kernel.org> <adM2XVZf1DekahlY@hyeyoo>
 <CANpmjNMeaWWuDMAj_n38U9XRqgZQz30ca82Vy10Bg=NoDfZ5ng@mail.gmail.com> <adT-gkVmVDDXR1h_@hyeyoo>
In-Reply-To: <adT-gkVmVDDXR1h_@hyeyoo>
From: Marco Elver <elver@google.com>
Date: Thu, 9 Apr 2026 22:19:09 +0200
X-Gm-Features: AQROBzARAi5e7VBJC9ZT2jVCPDAMFQKWBBwNXJCnP3Ii1ddqjsxmVTwsC-HQUUI
Message-ID: <CANpmjNO1aNm3mKphDGWasK_NUfVY8q4K9GCjyREZFqrOu9WLcw@mail.gmail.com>
Subject: Re: [PATCH v1] slab: support for compiler-assisted type-based slab
 cache partitioning
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, Hao Li <hao.li@linux.dev>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Andrey Konovalov <andreyknvl@gmail.com>, 
	Florent Revest <revest@google.com>, GONG Ruiqi <gongruiqi@huaweicloud.com>, 
	Jann Horn <jannh@google.com>, KP Singh <kpsingh@kernel.org>, 
	Matteo Rizzo <matteorizzo@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Apr 2026 at 14:54, 'Harry Yoo (Oracle)' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> On Tue, Apr 07, 2026 at 01:17:14PM +0200, Marco Elver wrote:
> > On Mon, 6 Apr 2026 at 06:28, 'Harry Yoo (Oracle)' via kasan-dev
> > <kasan-dev@googlegroups.com> wrote:
> > > On Fri, Apr 03, 2026 at 08:29:22PM +0200, Vlastimil Babka (SUSE) wrote:
> > > > On 4/3/26 08:27, Harry Yoo (Oracle) wrote:
> > > > >> diff --git a/include/linux/slab.h b/include/linux/slab.h
> > > > >> index 15a60b501b95..c0bf00ee6025 100644
> > > > >> --- a/include/linux/slab.h
> > > > >> +++ b/include/linux/slab.h
> > > > >> @@ -864,10 +877,10 @@ unsigned int kmem_cache_sheaf_size(struct slab_sheaf *sheaf);
> > > > >>   * with the exception of kunit tests
> > > > >>   */
> > > > >>
> > > > >> -void *__kmalloc_noprof(size_t size, gfp_t flags)
> > > > >> +void *__kmalloc_noprof(size_t size, gfp_t flags, kmalloc_token_t token)
> > > > >>                            __assume_kmalloc_alignment __alloc_size(1);
> > > > >>
> > > > >> -void *__kmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node)
> > > > >> +void *__kmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node, kmalloc_token_t token)
> > > > >>                            __assume_kmalloc_alignment __alloc_size(1);
> > > > >
> > > > > So the @token parameter is unused when CONFIG_PARTITION_KMALLOC_CACHES is
> > > > > disabled but still increases the kernel size by a few kilobytes...
> > > > > but yeah I'm not sure if we can get avoid it without hurting readability.
> > > > >
> > > > > Just saying. (does anybody care?)
> > > >
> > > > Well we did care enough with CONFIG_SLAB_BUCKETS to hide the unused param
> > > > using DECL_BUCKET_PARAMS(),
> > >
> > > Hmm yeah.
> > >
> > > I wasn't sure if we could do this without hurting readability,
> > > but perhaps we could...
> > >
> > > > so maybe extend that idea?
> > > > I think it's not just kernel size, but increased register pressure etc.
> >
> > I'll take a closer look at generated code.
>
> > In some cases the compiler ought to omit zero-sized arguments,
>
> Oh, didn't know that was a thing.

So I checked with Clang and GCC. Looks like Clang does omit the
zero-sized struct argument, i.e. generated code is identical to
before. Whereas GCC wastes a few bytes of stack space at callsites.

Which is sad, because that means we need the macro workaround.

Do you want to be credited with Co-authored-by - in which case I need
your Signed-off-by.

> Not sure if it's safe to do that for exported functions though (since
> modules can be built w/ a different compiler).

Kernel modules built with a different config (implicit if different
compiler) are not supported, and never have been. If it works, it's
just luck (I know people do this, but it's just a disaster waiting to
happen).

Thanks,
-- Marco
