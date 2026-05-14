Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB7238D40A
	for <llvm@lists.linux.dev>; Thu, 14 May 2026 23:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778799722; cv=pass; b=mOjmqDJpeYS3GVlNpNZr3XFyASWE6XdeOXQWYMlemGlvHzkwHxA9Ea5j5leTHiaNDfQqmmXcPg0gDgAt5fsUmpD1ybZZOZNwz+NcxCasBBSm/zkXLFfL30dR3LT7Qo1mBPEv3KmJ95aqmLwn9JXH5D78wFIGZHy/AJn7LI02S5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778799722; c=relaxed/simple;
	bh=7QFhaA6pSrhwd4uOqqlwxlj6dluPgywqjbPxOzXuY54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S1nqRzalHPPD7l1ht73vchY9NS0quLb+JeevXYvZMhbQw9bsd07u8skKf9euj+oJySIet8cnltlBkO2ZH+Lza691Zf08eLMcnD0eXRD827yGPHDxmOwX7WJFGORA3DmHbfmoZCyM7fKmrvVIv5av+X0SpATs4kE6iFINH4wChnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ulR3NZuu; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ulR3NZuu"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12c8f9846c8so12827481c88.0
        for <llvm@lists.linux.dev>; Thu, 14 May 2026 16:02:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778799720; cv=none;
        d=google.com; s=arc-20240605;
        b=B64/d0N5OUY0ufaSeZag37S4sk1Is9B1TivqmHHH64jcl896eOpHTrQJDmnuLM9qx+
         Vz2ihPKj8lCc24iX7W0sTJ96jPPhM73vHLlnuHUdfCBuDOgvo7/wZY1F/4bWh9meOViu
         7zVsW5s9eh4hwhY1sgmCriOOt1K5MiCGztqnd8veKmF4uoUi3Hgdy4wuN02tr5klQZaX
         JQZsd2ZuLej/vkLjheOW7U08V24Bk3ZLtIsjBTDPiz8mwzyUP0spqJI/r24rn2j0DKx0
         Q1snfUSpdLzafzsDi06JPIF7iIj14GhrplqyLfeLFBSyC3DsREU+P1z/A82dNVhwkHkA
         M5+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=X7wmE2rJCxinroXPaQBQ40WUqrEBuO0hmw6nHwl8iRM=;
        fh=xMj9qnZetxrawvMo1FggLH2JPzVrTraCru5sQYjIyCI=;
        b=DZvsVkqbS0Uik/8+YXFDFnU33gfH9Jalc2DofVhs6ZQLDjw5450oyUdoRSp2+JozqZ
         XsmLaP/oVl2e7zmeEuxWy4jDjjR3ow7IRU+4Mh6gp3jWbOhqrCHqqQuiEoC/6mJSs5LI
         SSgX7WiPu00LVEw75vgTEkglkwX5ssvDV+4BFRliMZ9rCUTEi/d0cbFycMlpgWGhHwB7
         kiVqruknUcJ33Lh7zA5fFVq7yHR95tuCrZgpZ1gfII0Cup/ytP62P+9oVVt8no52DydU
         zHiCfR0ix46tUCWoWTO82JYPHEDq9MWQZkRBd5dmnLb7b/vV8WqPO98yeJerU56cwnOm
         2Q6A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778799720; x=1779404520; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X7wmE2rJCxinroXPaQBQ40WUqrEBuO0hmw6nHwl8iRM=;
        b=ulR3NZuuxWEwm8UiBWC1681L+IK+qb+XY8f4bLg29j45He5OZVGwYqo+1YG2yaUr7X
         UHDNvJNO7Ga22dMTGpyWSrqk7MlfUwI1PSEa3FoEWCSc8P4Gt6qIwaZrpp9zD2zxPybS
         P1uIqrcF+l+8nHGqaJ0VIC96tNjZeeRDpm5eIyafm2NuU99JBbrbqf4mNXMIsQGcMCGe
         gZPB1KIjGE6YMWqRUCsOwRQ8GXQjrLBUNw5bevcGDRNsC6TrQZR7aPyH5XZ096kZvZId
         JaDB8g3dMC1/FNGVc5fFL6JUXptaD4rzcQzAGP1UDasff1nqFefCJTXVgJJAuHgp78Pz
         PmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778799720; x=1779404520;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7wmE2rJCxinroXPaQBQ40WUqrEBuO0hmw6nHwl8iRM=;
        b=frIArOqYatcp6Owrqjtcz6CEFLC/pto4Z73HIREY40Vs55HDdxLU4pXHUiNiu3ONp1
         2vJYcszj/DmY3+GZK1itcUpfYgL+4yRqIe7v5qOomDbNqrpsgUlBP2pfF2pwTxK8CJDW
         5tLGOZfWRb+wZqdC7wYQYpgtPTjabkEJN6XE9+Nmmhy7prGsXsMRufOFWRRGth5KSo4I
         pRcLdX43/VE10Cyl3pwHklh386x5h27Hbf9EBXOC1c5Nr2c0pHAk1yR/nm6ho7EQyZqP
         i0rsb5qS0Z1vwi5UpRjFr6kBPuK6sgtYqz68w3CGhebxvrt103FSuJPlotLB9udU23V6
         JeyQ==
X-Forwarded-Encrypted: i=1; AFNElJ+a5+2v++p8cMsZxOZSHvVwBPwsh3c8nXRxsFnqL84s8m8UeNgbM650dvsMBSxTEPRxUwQ2@lists.linux.dev
X-Gm-Message-State: AOJu0YwPElHIhoUwowYuTCWwtPQpKzw6BwEh2XRH5K3po3+hdO8Ye0Hm
	KXHzhQex7lFOxrrhkqWe+CeG99cV0pl72zTCpGZQrtLh2sIBFBGC2YGtNTv6q5ijP23uL5Z25px
	xjGTHnknpqIl62dwquOEkNpcwMSatX/TocGAwFdcd
X-Gm-Gg: Acq92OEI6Us/G7YtsyzbsVUfEFrR7mqZ/xK9ak48OmP75Uj00DSIqJ1aCju8CGPB+iL
	6Mq2zk1tK5Y9j7li9y7zrJ7equ2RzN0HCEZQVUi2+t65nr3DErclLBBpeQj2WSVehMUzBBldf1D
	KFcECMzeM4iSWrNyDS9Bb3aYkOafwpmhsQq0D21MXmY+2xOobUPnZOTreWQV5g6unRgMY//IVt/
	ZGKoVuqgB+vg1L1n8NIJzIWz0PLtQqhzogaMlwGvSBTJHxbifBeFwHwhwitdr0YQziSJWpcdwej
	1uJ64M98Qfs/4o6eJ65HFcDyhx+Z8625C3eQo7wLUs5SLk4hJJefSj6Ifh4u
X-Received: by 2002:a05:7022:6627:b0:128:bae0:e043 with SMTP id
 a92af1059eb24-13504943020mr671741c88.31.1778799719313; Thu, 14 May 2026
 16:01:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260511200136.3201646-1-elver@google.com> <20260511200136.3201646-2-elver@google.com>
 <20260514092246.12b7d1ee@pumpkin>
In-Reply-To: <20260514092246.12b7d1ee@pumpkin>
From: Marco Elver <elver@google.com>
Date: Fri, 15 May 2026 01:01:21 +0200
X-Gm-Features: AVHnY4L7Nz8QfeqrI3wCl3GtxJUpEhFvuQuDcZR7x-mFmRFeRPBj-Sj8PlxOnt0
Message-ID: <CANpmjNP96_pOrH1SPTL105e9ObXY2q7V8KwFM3sKqvX9ZWYH9w@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] slab: improve KMALLOC_PARTITION_RANDOM randomness
To: David Laight <david.laight.linux@gmail.com>
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
	linux-mm@kvack.org, kasan-dev@googlegroups.com, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 May 2026 at 10:22, David Laight <david.laight.linux@gmail.com> wrote:
>
> On Mon, 11 May 2026 22:00:49 +0200
> Marco Elver <elver@google.com> wrote:
>
> > When using CONFIG_KMALLOC_PARTITION_RANDOM, _RET_IP_ was previously used
> > to identify the allocation site. _RET_IP_, however, evaluates to the
> > caller's parent's instruction pointer rather than the actual allocation
> > site; this would lead to collisions where a function performs multiple
> > allocations.
> >
> > With the generalization to kmalloc_token_t, we now generate the token at
> > the outermost macro, and using _THIS_IP_ would fix this for all cases.
> >
> > Unfortunately, the generic implementation of _THIS_IP_ relies on taking
> > the address of a local label, which is considered broken by both GCC [1]
> > and Clang [2] because label addresses are only expected to be used with
> > computed gotos. While the generic version more or less works today, it
> > is known to be brittle. For example, Clang -O2 always returns 1 when
> > this function is inlined:
> >
> >         static inline unsigned long get_ip(void)
> >         { return ({ __label__ __here; __here: (unsigned long)&&__here; }); }
> >
> > To provide a reliable unique identifier without breaking architectures
> > relying on the generic _THIS_IP_, introduce _CODE_LOCATION_: it resolves
> > to _THIS_IP_ where architectures provide a safe implementation, and
> > falls back to a zero-cost static marker where _THIS_IP_ is broken.
>
> Doesn't that mean that all the other uses of _THIS_IP_ (which seem to mostly
> be tracking lock requests) are basically broken on everything except x86-64.

It seems to mostly work, but yeah, it's probably broken in some places.

> Would it be better to actually fit that?
> It isn't as though it is hard asm, you just need to look at how gcc generates
> PIC references to static data.

Yeah, I have patches waiting to be sent - I sent one for arm64:
https://lore.kernel.org/all/20260511201711.3249121-2-elver@google.com/

The rest of my patches are to-be-sent, when I get around to testing -
which I didn't yet for most of them since setting up test environments
for all of them is a PITA. Though I can send and let arch maintainers
review them - this would be the tentative list:
https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git/log/?h=alloc-token
