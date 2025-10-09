Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0142C0279
	for <llvm@lists.linux.dev>; Thu,  9 Oct 2025 12:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760011670; cv=none; b=sgHJeTsXHyGV71QSVH+/8iTO25uSRoI2AD9nIAODYC+yLQJD+X1tNitphTCJ0GgokvPVZR0F0IpBaG2hu3utansKSCphH78Ob0ebbur6rKQ9yyA70CHVG1UY+NKXpkD2Wn2qV9xk1foowcHbjGbrBhgCieL0FUpN1kh+okPd4IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760011670; c=relaxed/simple;
	bh=+p3lQzk+If+FfstGkjdjKHCQavXIY1wiQDGCM90CDQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TDwjHZTz7wg4pZTy72ShgVpKiLpPipWf00Hg5pNe2dT1vSiymyE8cFLR7zg/b0BWPT1gXTHB5iYerYNeHMQ4DQRL/HNowXHDu9/+hJhs1C/nQ54sFj+LgnH5CRKaAG1iXxx8eOVG0g7YqgU142BtE/nhEGUm+0CQ24wV04b5r28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CQSwYTjw; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CQSwYTjw"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b553412a19bso536358a12.1
        for <llvm@lists.linux.dev>; Thu, 09 Oct 2025 05:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760011668; x=1760616468; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+p3lQzk+If+FfstGkjdjKHCQavXIY1wiQDGCM90CDQo=;
        b=CQSwYTjwzZ1FNDu+PuLSTovmmkcIUUwP8jlo3iWBBvpX8kWkvQ8WUwAMwzw/s39Nsg
         vIiR+vgj07dFs3J+LKiO/ZH3E/09L41cx+VILZfvxWKaJ5yjTexFuB75h6QBpm0+ZlXF
         RCqFjJZNnYJxOy7jOdEfEHb02dh65iNEi/uUkvRxN53Mf/A2oOyWvGMHkeP1pwEnC0WH
         lD76cwyxsO6uS0Npm05MbuJWP2N29XcBlHRWSx1oeooravONECAWRHBcxG32XMjPmKqR
         YUuExfgHZl+DNoOQUPJGFtYxbT4yapQBzphNlj/Vevlab/llqj0yt1JjA8bTbUsFJAmf
         fyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760011668; x=1760616468;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+p3lQzk+If+FfstGkjdjKHCQavXIY1wiQDGCM90CDQo=;
        b=Ua8HRFfl0XT9bs8LnPqZ2xH/re5j8v6kqHg+nX92CsTm8qiiSnLmsmLz2qtHwfybm+
         DEFejexF02fLL9rpbY6q/U37He8PJ/kKe8A7ijhtm/d5OiQ8fonFEwl5shPpJUyMW72j
         EDJa0NEPE1u2ntvYaNBVFYBG5AciuPgJGgAw4dxvIJeBeosGNwqjK2H/JdU+QlSt5Sji
         DDIFpa1jWnhM4Z3gdidQgh3apE5FJ0Q98zrHibg951/0qc0HkOgzHzBVK1zIq8UG7WbW
         wdT25e+l7GTwSZBhWKYxd6g0gTz2NktwmyXK50iVaqMGrDeBq957u8xaXAI02iyL3OE2
         /4Ww==
X-Forwarded-Encrypted: i=1; AJvYcCU9p8uFU1BvcFEWEYj152qDd2/kpN4KS2shucyRQ94UyeehH33AXr9xyw29rLGcxfyFNkA1@lists.linux.dev
X-Gm-Message-State: AOJu0YyRg/9Z9N50BMaspG9yTE1MwUZuujqdjCHAKpwunyGUtudkRf3D
	JaZ32ujZYrgX/GCnlSwYyPp8Zw+u7p62CXV/2/tMZ08TeJVLnVrrhKHUypyDN5LwPRn/sCDNFvf
	MMg36jG/k4RW83ZCxkxfqiQ3xvu4aTCY4mba1UQ8/
X-Gm-Gg: ASbGncv3/nh1ZZ3shVxr8/yqxEBwzfsI5J2nUKuEfDCP41xbjHXKZT3/0ThrkQM01xU
	VR3fWJRox+i8MGb0BY/4C1sWihm3ZathDzHhuiLRGtsRcpepbrez3iifn8D/8eByJomt+q14M3L
	BAcHsVl2HNe59BVSpb8V4njTisPgSHxEDDbdqyzrAmRBLWfN8rRAObyM3KxPPzj/OGq9i4ypQIw
	lBpG2gVga5HXdGpGSudIpqWsc2dna3H0TFhilqlbM6tQzV8H/ne2PRe+Hgi/3ATeR7c
X-Google-Smtp-Source: AGHT+IGK2999Kxnf1WRLkrVBgJlG2sfTe8NQQmLvAYHDshQ3OJDYVTnqzxr7Hq0u+SA2CL8Dip3ynt4DcSFfDVGoOE8=
X-Received: by 2002:a17:903:2350:b0:27e:ef96:c153 with SMTP id
 d9443c01a7336-29027379a5cmr98765325ad.19.1760011667351; Thu, 09 Oct 2025
 05:07:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250315025852.it.568-kees@kernel.org> <20250315031550.473587-2-kees@kernel.org>
 <aOR15Xb6DfolYM0z@casper.infradead.org> <202510071001.11497F6708@keescook>
 <e019c59a-ba8b-ec04-dc5b-923cf9dd9d9c@gentwo.org> <CANpmjNMsSGY+QEn=GV8S2sXuuQsioikPR+OhGa3+6EoTqYPkHQ@mail.gmail.com>
 <202510072114.52B93ED736@keescook> <b17ab23a-b0fb-4fab-afa9-41dfce65675a@oracle.com>
In-Reply-To: <b17ab23a-b0fb-4fab-afa9-41dfce65675a@oracle.com>
From: Marco Elver <elver@google.com>
Date: Thu, 9 Oct 2025 14:07:09 +0200
X-Gm-Features: AS18NWBVVE-SSQe4ScCSB1Ze0NxTS0A8p2TAsqA4RTj9KK9B9ZbDa15oefynRbc
Message-ID: <CANpmjNN3UH9vL6x4P29MjSg5L7p3aBScGv5tY9ex7N-xYmqrPw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] slab: Introduce kmalloc_obj() and family
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Kees Cook <kees@kernel.org>, "Christoph Lameter (Ampere)" <cl@gentwo.org>, Matthew Wilcox <willy@infradead.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Pekka Enberg <penberg@kernel.org>, 
	David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Jann Horn <jannh@google.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, linux-mm@kvack.org, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Jakub Kicinski <kuba@kernel.org>, Yafang Shao <laoar.shao@gmail.com>, 
	Tony Ambardar <tony.ambardar@gmail.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Jan Hendrik Farr <kernel@jfarr.cc>, Alexander Potapenko <glider@google.com>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev, Matteo Rizzo <matteorizzo@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Oct 2025 at 09:49, Vegard Nossum <vegard.nossum@oracle.com> wrote:
>
>
> On 08/10/2025 06:20, Kees Cook wrote:
> > On Tue, Oct 07, 2025 at 08:18:28PM +0200, Marco Elver wrote:
> >> On Tue, 7 Oct 2025 at 19:47, Christoph Lameter (Ampere) <cl@gentwo.org> wrote:
> >>> On Tue, 7 Oct 2025, Kees Cook wrote:
> >>> iOS did go the path of creating basically one slab cache for each
> >>> "type" of kmalloc for security reasons.
> >>>
> >>> See https://security.apple.com/blog/towards-the-next-generation-of-xnu-memory-safety/
> >
> >> We can get something similar to that with:
> >> https://lore.kernel.org/all/20250825154505.1558444-1-elver@google.com/
> >> Pending compiler support which is going to become available in a few
> >> months (probably).
> >> That version used the existing RANDOM_KMALLOC_CACHES choice of 16 slab
> >> caches, but there's no fundamental limitation to go higher.
> >
> > Right -- having compiler support for dealing with types at compile time
> > means we can create the slab caches statically (instead of any particular
> > fixed number, even the 16 from RANDOM_KMALLOC_CACHES).
>
> Maybe I'm missing the point here, but I think we can already do per-
> callsite static caches without specific new compiler support:

What we want is not per-callsite but per-type caches, possibly with
some smarter cache organization based on the properties of that type
(does type contain/is pointer), where the latter is required if we
cannot have as many caches as there are types. Per-callsite caches
could be stronger than per-type caches (with the exception where a
single callsite can allocate multiple types), but neither per-callsite
and full per-type caches are likely feasible due to performance
reasons. So we need some scheme that allows bounding the number of
caches, and letting the compiler help us out with type introspection
is probably the most reasonable approach.
