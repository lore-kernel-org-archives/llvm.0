Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2F87263B
	for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 05:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786426986; cv=none; b=dxGBf84Ba58vdMY8WwsjNCr60/gP9WVXLKkc/kx9roRAsiMDp8DYkIAQskwSxG4xiAeFo9wej8Wki5HQ3yOwXUJN7FJ/OyK5g5lNwHr0sQH3/kmHWDtf8CTjWHR9Ssc56bvdN4EjTC8bHUwoUYXiRI8jeDrtWEajoN6q4qqEgeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786426986; c=relaxed/simple;
	bh=jen/KcC3hJEwLywdx6gJec70M4mKp+4HASXJz53zBQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUCQ7ejxN9K1z8Bgk2jUj57E5mLsYc0tQ3xn/MbrtIch9TSCmMqFdGE0xp5UTrUtNF9OF/ipX8Vy/wt5u6iM6Oi+O1+qlB4F6uNfAmCICvKqsorsRHL2u3Z7PairL6WF3JbCKtzduaqC4TCdQkVockg2NFhaDjNxiD6lIg7GABU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYnBKXMm; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYnBKXMm"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4997581cdc1so2826515e9.3
        for <llvm@lists.linux.dev>; Mon, 10 Aug 2026 22:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786426983; x=1787031783; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hwYASxEZOdWoj37YH1RdRjVEdz25n+52dFAwjvk67KQ=;
        b=XYnBKXMmlWRZp7vaY8omBe3ud9cesJsQ10hhJ7ir41loYu9VPtN/iWM+DLkUn+P1qj
         ATkKpt3hZXmLjptGNDDvgJQJ2IimMdoC8LNBMu3u51Ny9s9j+zuoVTdbI74p0R/BGCbL
         YYWWW/+TdR9WbGRI6bG7i3+k+6hMp9Z2kD9Uo1/00dutdQXwlNpmRc95JnDknUP243qk
         iPfqRvLC53tXNTrgN2MwKFNc+UHGK3Dad2SM7X1WmN1fSa0neKHud2g7DxjKKm1XlwIl
         I/MC2lgKDXWMRuGH40r14RsahdhAcH38Cvfk12aEZA143imqWq6WFeOFbegf+EMZQ3fq
         okZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786426983; x=1787031783;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hwYASxEZOdWoj37YH1RdRjVEdz25n+52dFAwjvk67KQ=;
        b=nmkQDLe0EU2YtWUTSEUNV0qxs9MSYyVtMYTnbbOHVNDGBUkCZ2qJbOUEJuOOC40Vc7
         n11AONzDFtk0vD4JSCUvZ7unvrHOG5s0JdtN5FJrXvYQoxwQmY1zF3JOw2qB98CEZ5PD
         GOdP6+mmvW6fJ1SmgV18rmjPOfIHtunsLzEtc0fi2+bUMirGaP6bLzJVp91KHOzfIvuq
         DvQwi/XOA6aS3wKWwJNs+ENmF2fxicS84aIv4piYh2Zf7vyODvruA036E06pdqKVPrn4
         faazV73taH9ZH+YAbC1RCYoRwyQBDF7Udvkst3in7xLNxgf5+/09aRvtxnn1zEwBbmZQ
         VO0w==
X-Forwarded-Encrypted: i=1; AHgh+Rp+/a4Tx7AQVUwSdAsaZRNsQ2i2j3kmgTSWhrfp/2lYcKsduKzECTm1WlPBQfIJPlXkYBfy@lists.linux.dev
X-Gm-Message-State: AOJu0Yz939IM1uZlagME+1/j8AGnzwePdPFtHDlSRdRFr7J0TLrF8WLN
	7ZDDVtiLjJpsJOHYX+Y41rajw2KG7luAw21xhKRMMSWQf09OHf2VVlwo
X-Gm-Gg: AR+sD10Dgx7DASzb7DpdsXvJ6GugcOFhFSOVyFs3xEDSRlXQ+3QIitcc0x/uPHj5+lX
	DuD+Dws0lMsJZlfJRdhA4GhRxRJrdis4lSeuhps7v3U7LBrcfK6OjAOx7jMN6sf+QQ37m4UT6aI
	uLu6O9iQl1UHfPuQH8lnjADnVF9H15sc7eSK5PDiKTnY1CsqHohXJ5fx96dlLfmrqnaRDUUIxJN
	ObTB+Ahg+7hdlEFjPF3CpVC18Xjk3Es1tVzJJuk5pkHy/G+IKzIjO1SnhwqQtfMw1H64BSMAoGe
	REe8fThI/KiWl3mZvjOzTBj3zZXzKnyjHqCgOJQfUFjnn7kjIkIcR2BYB7lAxUqvJ1nF4BWQ3Rv
	aE+p/0fHBG4aGlxhF4iQp0WtmAZjdUwzUdg//R9xvR1l7VnObvQxRqcWEo07UgFoM4V0PhSHoL1
	NQedlF4f1MKuyrFB/OQpXYvC6UEA+Q0zO9S+VZv7O1zynSkgL8959TJ7Pa58qktQ/NHhzg01Tqo
	8JTuwhQh2lWnx3LAemDk7e4eTtwUAVmoLFTkT6VIUS3/D/acuCPNWMYYkUNCG/ZTNnQSVEom34t
	IMxoYaLxpjo5SKOpIRWQmy72g9ArsvMCXv3sUGeGmNmwovbKOjzLod8M+8zcWFZC5u2mYcXyEMV
	6C+ww7PY=
X-Received: by 2002:a05:600c:3553:b0:499:7312:2d5f with SMTP id 5b1f17b1804b1-49978494c8cmr10369445e9.19.1786426982735;
        Mon, 10 Aug 2026 22:43:02 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-2a02-3100-a133-e401-bc8e-d36c-2d08-c5e0.310.pool.telefonica.de. [2a02:3100:a133:e401:bc8e:d36c:2d08:c5e0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499740c46efsm39080525e9.4.2026.08.10.22.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 22:43:02 -0700 (PDT)
Date: Tue, 11 Aug 2026 07:43:00 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] slab: align ZERO_SIZE_PTR to ARCH_KMALLOC_MINALIGN
Message-ID: <anq18FjtFR8KqxyM@gmail.com>
References: <20260808105622.62026-1-kmehltretter@gmail.com>
 <annfnXskDJuyzMKD@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <annfnXskDJuyzMKD@arm.com>

On Mon, Aug 10, 2026 at 03:26:37PM +0100, Catalin Marinas wrote:
> On Sat, Aug 08, 2026 at 12:56:22PM +0200, Karl Mehltretter wrote:
> > diff --git a/include/linux/slab.h b/include/linux/slab.h
> > index 32c9f8ed7ae20..0798a714da87f 100644
> > --- a/include/linux/slab.h
> > +++ b/include/linux/slab.h
> > @@ -259,13 +259,16 @@ enum _slab_flag_bits {
> >  
> >  /*
> >   * ZERO_SIZE_PTR will be returned for zero sized kmalloc requests.
> > + * It satisfies the alignment promised by __assume_kmalloc_alignment
> > + * and keeps the historic value 16 where that is already aligned.
> >   *
> >   * Dereferencing ZERO_SIZE_PTR will lead to a distinct access fault.
> >   *
> >   * ZERO_SIZE_PTR can be passed to kfree though in the same way that NULL can.
> >   * Both make kfree a no-op.
> >   */
> > -#define ZERO_SIZE_PTR ((void *)16)
> > +#define ZERO_SIZE_PTR ((void *)(ARCH_KMALLOC_MINALIGN > 16 ? \
> > +				ARCH_KMALLOC_MINALIGN : 16))
> >  
> >  #define ZERO_OR_NULL_PTR(x) ((unsigned long)(x) <= \
> >  				(unsigned long)ZERO_SIZE_PTR)
> > @@ -622,6 +625,12 @@ static inline bool kmem_dump_obj(void *object) { return false; }
> >  #define KMALLOC_SHIFT_LOW ilog2(KMALLOC_MIN_SIZE)
> >  #endif
> >  
> > +/*
> > + * Keep ZERO_SIZE_PTR below PAGE_SIZE and the low pointer poison values.
> > + * 128 is the largest in-tree ARCH_KMALLOC_MINALIGN.
> > + */
> > +static_assert(ARCH_KMALLOC_MINALIGN <= 128);
> 
> I'm not sure we should bother with this, or at least make it strictly
> less than PAGE_SIZE since 128 doesn't have any meaning for the slab
> allocator.
> 

Thanks for the review!

The case I had in mind when choosing 128 was POISON_POINTER_DELTA == 0,
where LIST_POISON1 is 256 (0x100). With the current range check, an
architecture with non-coherent DMA and 256-byte cache lines would make
kfree(LIST_POISON1) a silent no-op.

Looking at this again, I think ZERO_OR_NULL_PTR() should match only NULL
and ZERO_SIZE_PTR, rather than the whole range below the sentinel. This
would also stop unrelated low pointer values from being silently
accepted. I'll include that change in v2.

Thanks,
Karl
