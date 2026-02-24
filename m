Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFF737A49C
	for <llvm@lists.linux.dev>; Tue, 24 Feb 2026 11:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771931516; cv=none; b=ImOThdSt3HTDLjTr8847306i1hEcfpuhhmbP/SLEAF8rNhAvmvvA3BxBCrsCAmZhmpOBr+Eb3TbRPp5/knDTtmz/VDIoKdzyA0cPcGmL8BLj3LzB0c+bgl94Hnfx6xmPRHLJ80A5YyNSwTE/1d/7cVcz4wYhcJBc5wDm4CHZAfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771931516; c=relaxed/simple;
	bh=wTNPYvldKqT8E/99ZE7dTEJbH62XG1KG1J6bDFSPh+U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uOFMv4bS1qpkrMk1hg1lhGXnU9nsIpnNoapSEwfHavcWI6ugkSlChacS5YqAs6LEE7HmtiXJrJCIGcZD5QOwmPBXOmqnCbTSu73kEd+Ogmz/eCyaIDGhJcba09as0NP02BTC/yroWB0NxuQHP5WMsTUL8fvEPsqY3iwm7yGqDOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BT9vtcOX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BT9vtcOX"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4837634de51so23863045e9.1
        for <llvm@lists.linux.dev>; Tue, 24 Feb 2026 03:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771931514; x=1772536314; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwqR4mogOeV02cqzMt1+tF/fnlUYylAA5gPYZ8oxqZQ=;
        b=BT9vtcOXCZrcXfKTn58Qmg/1x2IxnYxZwyrDb32KuHs3cRnpRH+rOXrOcpG/GKSxD9
         A0D9gDRCjgEFt2XDyhIaJXl7Wtu8UVH8obvK+fAJHRTIYZmvvPrUdyy5Kpy+UvOLRKz5
         KAh4xxXD/oULD2nNXD0Dj2TWEbj0BYNv0zaaypY/GadvcBFbfrf95g/nnXT8/3ARrLiX
         2frA+MXRo52dhzLGgL93f2eCQAQu3Gf2DwU7lIJrqWYYuYErpmt7YvdhPbuiimc0H1lq
         oKX8isd8ZQrwRNj6vq7iXaNH0EFOEw8NmNJezyju9PXFMiierS4qSVUxMRLpA0IF/tUg
         S4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771931514; x=1772536314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UwqR4mogOeV02cqzMt1+tF/fnlUYylAA5gPYZ8oxqZQ=;
        b=p7tD4LoRc074sBF0ZYgKups+JIAl6jf1fXe7QTEhEXcly+7JbTj/XhkzSMwcioL9Zt
         9aChOBbr8UA83VCq0tP/9RMGgKHtN/FKRcIVDTaUtu/rQeG/oJkjnqq9jwCpgXUPzpe2
         DQb9mXpPA7C1XXV+FvIcUemCSTqfNgAgTQnHlIWZKDQbW8Vc0ywGAbzGtLFGpIlMC5Kc
         M5WpYYFalYjoSz3LFnYLk87x0+0z/5sz85L4qcZRblb4TGIO02YaGip8DOtQ4x6mcAsj
         ggndehVEXC74+p8laHsFUzuhmBb/ycml+d+HCAR7198aruI8hSJwmN7/70BL4oSn3bDW
         QCKA==
X-Forwarded-Encrypted: i=1; AJvYcCUMw19vRIXWpL/aZt43DzvVSQJO1WX+DkR9j0Ro1rzcopNawbv4o7Bu92HwlZTEFr7LwwJy@lists.linux.dev
X-Gm-Message-State: AOJu0YxY49V9sKuild4daXHAPKZRREquDkLTENn9KVpkxLpwUsosjpoJ
	MhE8tzeYV/V/1+/AvvLpcDaJaS/OvYMJ9/bRrg+HTQLzbDjhvWV4Ili1
X-Gm-Gg: AZuq6aLWCek9LiRaX9XouUVSwGXXp0TXcS9lWQtmU0hCeuDd1DKmv+ezRNAw1n/eaKO
	izq9d2eXDjYQrypKjjxBx51CQy+9IMrcqPdPtfC4kbLul7TWJhr5BvUUD8OP72xGwwvMNChV3CT
	8eft318LSuUyA+Ei7FyUzWwPWYPdYlex4c9dOln4CXZqll3wzyL9Q1WNYaR/ag1OqCiGyDmxORz
	gvpizL6srNP6zx6+/teFYVrjXKqcITIae2NqBkFqRRoDEAZDWoxFbI3AdHndrf+l7KUYauUJa5o
	6v2fGpgBX3PyXZZogez+ehIcNFWmMNB7FpPDASh+1RoL9AR9OgTvzWxRG/gjECW/XpQnIMD8Mrr
	a0YEt1YCIbO3jzcxY/aHdzxFM7/QmKy/9zE2P9Fo0A0c5lE2ULhCBnH1Lz7a5eKIH6qlmE9GNoU
	fgFpxr1Gt9v1Qd7VoTpGugUGJER9CQsbbzmik0Ni3iw2f/SyYv9Bx2ya4Kw1F9gpQm
X-Received: by 2002:a05:600c:8b16:b0:480:68ed:1e70 with SMTP id 5b1f17b1804b1-483a963de73mr263902315e9.35.1771931513686;
        Tue, 24 Feb 2026 03:11:53 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9caadedsm216756765e9.10.2026.02.24.03.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 03:11:53 -0800 (PST)
Date: Tue, 24 Feb 2026 11:11:51 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Kees Cook <kees@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Jonathan
 Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo
 <harry.yoo@oracle.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org,
 linux-hardening@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Miguel Ojeda <ojeda@kernel.org>, Przemek Kitszel
 <przemyslaw.kitszel@intel.com>, Matthew Wilcox <willy@infradead.org>, John
 Hubbard <jhubbard@nvidia.com>, Joe Perches <joe@perches.com>, Christoph
 Lameter <cl@linux.com>, Marco Elver <elver@google.com>, Vegard Nossum
 <vegard.nossum@oracle.com>, Pekka Enberg <penberg@kernel.org>, Joonsoo Kim
 <iamjoonsoo.kim@lge.com>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>, Jann Horn <jannh@google.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>, Jakub Kicinski
 <kuba@kernel.org>, Yafang Shao <laoar.shao@gmail.com>, Tony Ambardar
 <tony.ambardar@gmail.com>, Alexander Lobakin
 <aleksander.lobakin@intel.com>, Jan Hendrik Farr <kernel@jfarr.cc>,
 Alexander Potapenko <glider@google.com>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH v6 4/5] slab: Introduce kmalloc_flex() and family
Message-ID: <20260224111151.6154ce59@pumpkin>
In-Reply-To: <675ec547-dac8-465f-b3c9-a0f97c5bdef7@lucifer.local>
References: <20251203233029.it.641-kees@kernel.org>
	<20251203233036.3212363-4-kees@kernel.org>
	<675ec547-dac8-465f-b3c9-a0f97c5bdef7@lucifer.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 24 Feb 2026 10:26:36 +0000
Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> On Wed, Dec 03, 2025 at 03:30:34PM -0800, Kees Cook wrote:
...
> > +/**
> > + * __alloc_flex - Allocate an object that has a trailing flexible array
> > + * @KMALLOC: kmalloc wrapper function to use for allocation.
> > + * @GFP: GFP flags for the allocation.
> > + * @TYPE: type of structure to allocate space for.
> > + * @FAM: The name of the flexible array member of @TYPE structure.
> > + * @COUNT: how many @FAM elements to allocate space for.
> > + *
> > + * Returns: Newly allocated pointer to @TYPE with @COUNT-many trailing
> > + * @FAM elements, or NULL on failure or if @COUNT cannot be represented
> > + * by the member of @TYPE that counts the @FAM elements (annotated via
> > + * __counted_by()).
> > + */
> > +#define __alloc_flex(KMALLOC, GFP, TYPE, FAM, COUNT)			\
> > +({									\
> > +	const size_t __count = (COUNT);					\
> > +	const size_t __obj_size = struct_size_t(TYPE, FAM, __count);	\
> > +	TYPE *__obj_ptr;						\
> > +	if (WARN_ON_ONCE(overflows_flex_counter_type(TYPE, FAM,	__count))) \
> > +		__obj_ptr = NULL;					\  
...
> Annnd now I typed that I realise that Linus fixed this up in mainline and I was
> working with a stale version of this file :))

I think someone else mentioned it, but having a WARN_ON_ONCE() is there
is really a bad idea.
The code bloat must be stunning.

I won't ask why the #define parameters are all UPPER CASE.

	David


