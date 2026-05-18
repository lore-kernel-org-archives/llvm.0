Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5015371063
	for <llvm@lists.linux.dev>; Mon, 18 May 2026 14:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113378; cv=pass; b=WWiShugpPgDI8PuyVrP0nfJxzVVHRrv7158BWk2Q0gr6KwBLq0JHkgMoElllKhPRLpuDjwH3YDGCRRZd6mwtKL3hBiJfxZTwKZccOEXbpXS3Rb6Z4B4EsqKB8POXZdk5PNwNT+ljJA+JY3rUA3dH/Bsi+7juSMfc4Ln9gWw1qtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113378; c=relaxed/simple;
	bh=HhOB63VsXgJe0fuiBA7xxTI2UH22ig0EY/B2rVrPImo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CUoEKVw5rv67ak2uLVDYyGrDNNoCrvh3A4MfpyO3blRu3uWFCX567bTroT8fNwQxo7XEZCHTY82p9HJsNNHoRWTAB7Ji55siOj6Cwc7UuUWUSzA3Z+SQ1N+CcpQD8JenNOC5bwHfOquogkUb4Py+Qpk2n3WyOqzeLStDEe0Rr3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=btvYflSS; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="btvYflSS"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1357c851a48so1641505c88.1
        for <llvm@lists.linux.dev>; Mon, 18 May 2026 07:09:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779113376; cv=none;
        d=google.com; s=arc-20240605;
        b=bF7yKMOq028TyUs6pImfIUqa0i4prZbCZePERkkiaw677qDafEcbqqd9vyxQmVMChY
         6g4I00ZRgNYGDA1bINewruZqmecQHneMTHuhyTuiHYsat/6YhbMzWJ/rQh90kREQo8nF
         u3FRSAC1dp6Ari2i2LHEokHdH3oI7mMb81LGuEqtyiErYpCHejSSnaJ3JWcb7gcin4vT
         GauB6bpFAuZY+3aNUe51UIcZicsAluoFpGd0G5Zy9v7isK3FG5ss30ZcAcpFffyE06tk
         cn3nxrWjPC4/pMDzGicJsJlP94PotihE0VhaZV4DVE1Eu3BlVvRDGlVo+SVXVxEnvIjl
         PpWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nVNeIyEFEYH1knjNU1H5DLQ8NJ8o0Em1AHL69lK30IY=;
        fh=xcR1eTSB2YbpSAHxgFWNBuxmhj8wfV1bGs20NoCmVvI=;
        b=CXJTFns857mE3x4BfGMKe/lfBN3GMZVZcvdVqPYKmzJrYkr2ZREVeB29UZEHf/Z8zH
         dx7o0BDMJ6vmOqabuSKOZQnD/9dx4/kwEcFdwC2gpRkWx7U9XFip2WJMWqNDamZ8lI0x
         CunfUse4soYCOsiFbY/c/77ZJ4eyrlrh/3Lq91Xj4HamBqWLVV9d3WAHydWWu0HkpOIG
         oA73PO/SBMiV9FoZSxo36Et79zGAyw129vaalA4IRQkqjbkrXT4VdO5iMW4Xly5s67D7
         wzUWIJL4myPyIWo4tlIfvh5wz4xe21GMQf37mBJXpMFMCkCJiCLZK9YSq75GjdYXNf9l
         NzRg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779113376; x=1779718176; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nVNeIyEFEYH1knjNU1H5DLQ8NJ8o0Em1AHL69lK30IY=;
        b=btvYflSS2JNuHZxh4uyeO7M8RB1TRKlrj8jDkOBlY+J0DxnXCIlWxNneYUFv1TACPX
         l7aotFcHC10i9ygIhg1zdYSdoQ150pHBiE09iGN3tRBKpbKm8GMiQNYfOS90gFqDOVwK
         f7sFH1ZUZGGGqWOu2FF3BUfQ46aku89UHzlPRTebeXUO2eiCICHyF6i1nv7DY+BqdJnr
         xguEUMS7vOF7+RLSBOUCzpemUZN5k+5nqN7ekOpwuhgMBDlwhVcFyMcyuQJFhieQnLlK
         J/2zCiNHqcrb2sB7lRzGAmPSeMCsirCXFxWrNmns3U3poHvFBtTuPieeiXmnS8yraA59
         BNgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779113376; x=1779718176;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVNeIyEFEYH1knjNU1H5DLQ8NJ8o0Em1AHL69lK30IY=;
        b=AAcXI4AqK8GvGNtIbuhLU+KRNN/jRfgpy95ssYvYv1VWnAgrTnisYoOHby+yV7FVvW
         tKGG6XCxSqqdh4qzlo1v4TKwol4L1qYzNxHyi6q5+xcmDQfvBxRtSP8Y6S634yfXj39p
         Qkyb1ERXJEH90e6kXozzvMLVQfiLKqSZzL9LbjkfcPFkxQ8s5eur2MFIAWBtqeqLiuyS
         xN6+2K3ETze8ypGXzfriW9J4oRGiS7TaPr8lebrht+ELSXDAT6GwXkE1kgsACtj1ehXe
         wYN5z6Cs+wsj3NhJO2IZesWBIL+uF46mTMNrT6cAxFN6/ij80BC2YcUcZz0kU06ye+TC
         ++3w==
X-Forwarded-Encrypted: i=1; AFNElJ8SkHLpZ/oA8VEE9euY3CEDHu/qRnS9ZkF97+0IiSHvcasraAXRtV4CP0lNtF7oJzZj6pG5@lists.linux.dev
X-Gm-Message-State: AOJu0YynhKaxNpTaSowDwem4l2FPobgFW2ys8rIBtR7OjogV51Px+DHl
	xSJelThrLVn+ffSpCq6o6OSf/2w/eRZQEIblmSeEPef6RzOhjIpHTAGybiyOY5t+qIm+u5zmk2D
	Uj3bunUX0asHJGLgnTxbrRQFKO/KWARG/cHpXFGlh
X-Gm-Gg: Acq92OGmiF2k08chaEGDqet6NXLnKZBtNaqa33vfmUlBAX+z1XmX0bzc1oNRxFq3eXD
	cwgso1ZrZfUOgg+maG6j8KxaegUsa4vD04bV1afKKv6hCZ01utEC/syyzjQ8XTrLAh3b2doVzf9
	q8QGCqBN6ntXTj8k47rwsp/ysqxNO+935bbNuerL8UZLuonVRviq3o3aFhKtRZ65iqgc9nk4RD+
	N0ot0K8X+JpA6LIeSs6yF2H/ve8cI4bjmvShyN2d3SfB1KZV1UIKLOQ4bq2JhLBN9pjcJ0HDWo0
	b0pqKI1x4T3MjJTnp4kaYPASeid4j8+uHemjrSbfJ/xAk0Mi
X-Received: by 2002:a05:7022:660e:b0:130:6c8f:5aa3 with SMTP id
 a92af1059eb24-13504418706mr7462281c88.12.1779113375348; Mon, 18 May 2026
 07:09:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260511200136.3201646-1-elver@google.com> <agcsMgfKjGTasJ5n@pedro-suse>
In-Reply-To: <agcsMgfKjGTasJ5n@pedro-suse>
From: Marco Elver <elver@google.com>
Date: Mon, 18 May 2026 16:08:58 +0200
X-Gm-Features: AVHnY4KwxhkHo10jEIBm11GIDEKZZU-LpYTl6pFHzoIdWDT8Gwo4IdHMoFpgtk4
Message-ID: <CANpmjNOYd9RnJARZ7qUDifsftwWOhhakaWSu926PKA6-SepTwQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] slab: support for compiler-assisted type-based
 slab cache partitioning
To: Pedro Falcato <pfalcato@suse.de>
Cc: Vlastimil Babka <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Bill Wendling <morbo@google.com>, 
	David Hildenbrand <david@kernel.org>, David Rientjes <rientjes@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Jann Horn <jannh@google.com>, 
	Justin Stitt <justinstitt@google.com>, KP Singh <kpsingh@kernel.org>, Kees Cook <kees@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Matteo Rizzo <matteorizzo@google.com>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Suren Baghdasaryan <surenb@google.com>, linux-hardening@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>, 
	"Liam R. Howlett" <liam@infradead.org>, Alexander Potapenko <glider@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kasan-dev@googlegroups.com, llvm@lists.linux.dev, 
	GONG Ruiqi <gongruiqi1@huawei.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 May 2026 at 16:28, Pedro Falcato <pfalcato@suse.de> wrote:
>
> On Mon, May 11, 2026 at 10:00:48PM +0200, Marco Elver wrote:
> > Rework the general infrastructure around RANDOM_KMALLOC_CACHES into more
> > flexible KMALLOC_PARTITION_CACHES, with the former being a partitioning
> > mode of the latter.
> >
> > Introduce a new mode, KMALLOC_PARTITION_TYPED, which leverages a feature
> > available in Clang 22 and later, called "allocation tokens" via
> > __builtin_infer_alloc_token() [1]. Unlike KMALLOC_PARTITION_RANDOM
> > (formerly RANDOM_KMALLOC_CACHES), this mode deterministically assigns a
> > slab cache to an allocation of type T, regardless of allocation site.
> >
> > The builtin __builtin_infer_alloc_token(<malloc-args>, ...) instructs
> > the compiler to infer an allocation type from arguments commonly passed
> > to memory-allocating functions and returns a type-derived token ID. The
> > implementation passes kmalloc-args to the builtin: the compiler performs
> > best-effort type inference, and then recognizes common patterns such as
> > `kmalloc(sizeof(T), ...)`, `kmalloc(sizeof(T) * n, ...)`, but also
> > `(T *)kmalloc(...)`. Where the compiler fails to infer a type the
> > fallback token (default: 0) is chosen.
> >
> > Note: kmalloc_obj(..) APIs fix the pattern how size and result type are
> > expressed, and therefore ensures there's not much drift in which
> > patterns the compiler needs to recognize. Specifically, kmalloc_obj()
> > and friends expand to `(TYPE *)KMALLOC(__obj_size, GFP)`, which the
> > compiler recognizes via the cast to TYPE*.
> >
> > Clang's default token ID calculation is described as [1]:
> >
> >    typehashpointersplit: This mode assigns a token ID based on the hash
> >    of the allocated type's name, where the top half ID-space is reserved
> >    for types that contain pointers and the bottom half for types that do
> >    not contain pointers.
> >
> > Separating pointer-containing objects from pointerless objects and data
> > allocations can help mitigate certain classes of memory corruption
> > exploits [2]: attackers who gains a buffer overflow on a primitive
> > buffer cannot use it to directly corrupt pointers or other critical
> > metadata in an object residing in a different, isolated heap region.
> >
> > It is important to note that heap isolation strategies offer a
> > best-effort approach, and do not provide a 100% security guarantee,
> > albeit achievable at relatively low performance cost. Note that this
> > also does not prevent cross-cache attacks: while waiting for future
> > features like SLAB_VIRTUAL [3] to provide physical page isolation, this
> > feature should be deployed alongside SHUFFLE_PAGE_ALLOCATOR and
> > init_on_free=1 to mitigate cross-cache attacks and page-reuse attacks as
> > much as possible today.
> >
> > With all that, my kernel (x86 defconfig) shows me a histogram of slab
> > cache object distribution per /proc/slabinfo (after boot):
> >
> >   <slab cache>      <objs> <hist>
> >   kmalloc-part-15    1465  ++++++++++++++
> >   kmalloc-part-14    2988  +++++++++++++++++++++++++++++
> >   kmalloc-part-13    1656  ++++++++++++++++
> >   kmalloc-part-12    1045  ++++++++++
> >   kmalloc-part-11    1697  ++++++++++++++++
> >   kmalloc-part-10    1489  ++++++++++++++
> >   kmalloc-part-09     965  +++++++++
> >   kmalloc-part-08     710  +++++++
> >   kmalloc-part-07     100  +
> >   kmalloc-part-06     217  ++
> >   kmalloc-part-05     105  +
> >   kmalloc-part-04    4047  ++++++++++++++++++++++++++++++++++++++++
> >   kmalloc-part-03     183  +
> >   kmalloc-part-02     283  ++
> >   kmalloc-part-01     316  +++
> >   kmalloc            1422  ++++++++++++++
>
> Hi,
>
> A couple of questions (I apologise if this was asked before, I wasn't involved
> in this thread):
>
> 1) What's the object behind kmalloc-part-04? I imagine it's a single type
> getting allocated a lot?

That's from __kmemdup_nul().

> 2) The bucketing looks quite skewed. Do you have plans to implement something
> more similar to what's in the original Apple blog post (with the smaller
> granularity and all)? I'm asking because most of our types have pointers in
> some way.

Having a scheme more tailored towards kernel data structures would be nice.

But we first need to build experience with this, and get more data. I
think I agree with you that a smaller granularty scheme that tries to
bucket similarly-shaped objects (e.g. with a pointer bitmap) will work
better for the kernel, but I have no evidence of that yet. We need an
analysis of "this scheme would have stopped X out of Y exploit
chains". There are plans to look into that. But if an improvement
comes out of it, it's just a compiler-flag flip away for the kernel,
once the compiler supports it.

There's also what Kees had proposed:
https://lore.kernel.org/lkml/20240809072532.work.266-kees@kernel.org/
.. but that trades memory and performance for stronger partitioning.
Probably should become another KMALLOC_PARTITION variant.

But if performance and memory usage are a concern (which is the case
for environments where I'd like to enable this), we need a smarter
token calculation scheme (if the current one is not good enough after
some analysis).

> 3) Obligatory "how about GCC?" :) I quite like the idea behind this feature,
> and it would be awesome if it could be more broadly deployed!

+cc linux-toolchains

We'd need __builtin_infer_alloc_token + -falloc-token-max= for kernel
support (-fsanitize=alloc-token is not needed if kernel support is all
you'd care about):
https://clang.llvm.org/docs/AllocToken.html#querying-token-ids-with-builtin-infer-alloc-token

Thanks,
-- Marco
