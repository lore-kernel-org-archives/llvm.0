Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E631148304
	for <llvm@lists.linux.dev>; Sat,  8 Feb 2025 03:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738984292; cv=none; b=WitSgFn+XCAePdoSbvj2LQVSSW1BDTIzNiSIoEFiIOeO1lZfwL+mi8F9+aJHwmvx4e3nbpv+a3+kMbTbgtzYeCiFgPR8/uC8aErPePGIlBFcqH597Hy5Js8viHpNxZs1JEhW0Yqiju0uIk1PY7PJlSGoVaAAmmFQjj5n1w03rD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738984292; c=relaxed/simple;
	bh=U7MePNbHBbsF0Tf3gXtTbtsNY1F9QWPQTgFfeDFWaZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UKPTiZhsjGwFCYD+SAqhsw6FuVlX3Z+IN58nEX4l+Ik/1Ad31u8G+5RY9BFGzi8LCNwtSelfj4ZYqMdewvQFO3jnpa3gH//76NYk861NowesZms3u6wc7QbIx9q9LybWy2JqV9YsjPYWa/gl68sS/xh2fVjV4ARztlTw4QwXPzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RcNf3Isw; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RcNf3Isw"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso449587166b.1
        for <llvm@lists.linux.dev>; Fri, 07 Feb 2025 19:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738984288; x=1739589088; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FOVpMJcaokY85KzmVoacEr/X/dlAvwuwsIku8cwRQIA=;
        b=RcNf3IswSE5mpzK/10nfvI6xEI2W8TWyuR2KZLUrj0WONLmVvy0Rp9mPwQT2pwE+H+
         za4XVvBVpO4qlKx3VuH8vhp7HDzxntppdyXBd+S+rqsjbGKqeKBC2MYLf4MtjT2y3nVm
         Y7C/I6KOmpveFfXYaVpj5E0xZNUS6CHy3QdpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738984288; x=1739589088;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FOVpMJcaokY85KzmVoacEr/X/dlAvwuwsIku8cwRQIA=;
        b=S5D+9z6kE94RHDfNfYXxE5FE3uMoj+WmVVYWivKbumDZ0/v6XMT0m0UiACKKRCevcm
         6c3RR7DcATw695TlZNn0xU52ObyzuLQhT68i1ZwBfbK0l4PgzUkwpp7BUSgGrVR0m6gR
         7NMXiKGuL9pjnBi8NmeXzIt9HkdiK2L5F+VWgUTqUtiup/zoyp+zCumJV6dviA0dQyi1
         v4nPcNaDGSBaAWJbsfIN6l0R9CErAMRLon+CIetqZteiZJuVky8aYKpguk4CNVe1/Lz2
         h0PKASwjHG+kBWQuibn/SGy8RAjpTSWyXhD5s+lYMEGwHrLZrtVdioIQJC4hkzdaOQ2e
         bCzA==
X-Forwarded-Encrypted: i=1; AJvYcCXlryOczmNdUUgc0oyuE98O6kiOXCCZ2CtroRAf3uEwJvr6iicWI7wyWvPp1JeT+6kREN0w@lists.linux.dev
X-Gm-Message-State: AOJu0YwNeRBI2tQTuqYS07Nk2g63rsAkwsbstUNhHo0edgMtlYQ4ZDA9
	v8rVj7QVKJC/yqgQw/HbM2M53Ac8kLAFknlxm+fWZWoFJ3lczCYceSFI3lVc9PO1y+stK9ctC+W
	6U/E=
X-Gm-Gg: ASbGncuBrovlZ2EoiuNPxhFeyqqa4Cu7naBC9/JbRcFVUmrYzcENpcTkpoDwOHhizN5
	lWhVEXxJJUiiuu6OzZmu6aD/++oqf2Oczkw8+3wBWHnCa/HUCFf3iFc59ZtMtE9ll5r7r8tqM4s
	7aBhMA821ca1dzugxK9D6PSgq5nNfi9TGXacfbYY5GrLTTRNwuXjflfK+7r51HuyTEwWr+KTc6Z
	MXgvf2OPHE11lWMx/wcHxUQsHllrqeC9eqvCD8dzirwRebz6IAUT8J7knyOe2iegbisc5ctuJjX
	V6oqehqLjq87+O3UJTQ//NbYDQpTOI0JWncDf8n9L2xuhx2qPP6NPCenBk3/jdx8mg==
X-Google-Smtp-Source: AGHT+IFBitXqoEAPFWhxTiPoHTNIZI36YPabtOG+PZVsdNrO9eSl4EQJgdC9CiF3p7L7viCJihgHMQ==
X-Received: by 2002:a17:907:6ea5:b0:ab7:9bf0:592 with SMTP id a640c23a62f3a-ab79bf006ecmr188324066b.13.1738984288071;
        Fri, 07 Feb 2025 19:11:28 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7736464c8sm378445166b.166.2025.02.07.19.11.24
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 19:11:25 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5de4d3bbc76so1960670a12.3
        for <llvm@lists.linux.dev>; Fri, 07 Feb 2025 19:11:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWFou18VFuC+giApiYoyuASAYUrrKoYU/C//3SRZ7tKIVa2t1S12iFW3QGqgISb9wmAFUqt@lists.linux.dev
X-Received: by 2002:a05:6402:5290:b0:5cf:e9d6:cc8a with SMTP id
 4fb4d7f45d1cf-5de4507350emr5770026a12.20.1738984284318; Fri, 07 Feb 2025
 19:11:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250131191231.1370466-1-bvanassche@acm.org> <20250207164926.6daeac77@kernel.org>
 <CAHk-=wiCJow8C+_fJvZ77taCf0oN0_X7NOR-BaECT2jV0Q-F9g@mail.gmail.com> <20250207173813.5081ba76@kernel.org>
In-Reply-To: <20250207173813.5081ba76@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 7 Feb 2025 19:11:08 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjMux0w49bTdSbC3DOoc9FRctDrRvaqFUS4KFTmkbtKWg@mail.gmail.com>
X-Gm-Features: AWEUYZlJV8s382PdRaDNGK_s-_jZj-Ua17NllqtZGBqSsW7wCeFl2fZwSDs96W8
Message-ID: <CAHk-=wjMux0w49bTdSbC3DOoc9FRctDrRvaqFUS4KFTmkbtKWg@mail.gmail.com>
Subject: Re: [PATCH] mm: Fix clang W=1 compiler warnings
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Bart Van Assche <bvanassche@acm.org>, linux-mm@kvack.org, 
	Ivan Shapovalov <intelfx@intelfx.name>, Vlastimil Babka <vbabka@suse.cz>, 
	David Laight <david.laight@aculab.com>, Nathan Chancellor <nathan@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, David Rientjes <rientjes@google.com>, 
	David Hildenbrand <david@redhat.com>, Kaiyang Zhao <kaiyang2@cs.cmu.edu>, 
	Joel Granados <joel.granados@kernel.org>, Sourav Panda <souravpanda@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 17:38, Jakub Kicinski <kuba@kernel.org> wrote:
>
> ../include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]

Ok.

So my gut feel is that this warning is simply bogus. We have
situations where we very intentionally use enumerations instead of a
list of #define constants.

That NR_VM_ZONE_STAT_ITEMS case really *does* look like it's a great
example of how code that doesn't care about the actual numbers, and
just wants the compiler to generate a sequence for us is supposed to
look.

Because sometimes we do enums just because it's a nice way to get
automatically incrementing values when we don't care exactly what the
values are.

And sometimes we do it for actual namespace reasons - see for example
commit 1a251f52cfdc ("minmax: make generic MIN() and MAX() macros
available everywhere") where in order to avoid clashes with the
"MIN()" macro, I made a couple of drivers that had a 'MIN' value (much
too generic a name, but it was what it was) use an enum instead.

See

   git show 1a251f52cfdc drivers/hwmon/adt7475.c

for details.

Now, at least in that case I don't think there was any arithmetic with
those values, so clang-19 wouldn't complain about it either, but I
mention that commit as a case of "it's actually very valid to use an
enum for actual real honest-to-goodness integer value enumeration".

Which really makes me feel like the new clang warning is seriously misguided.

In sparse I actually wanted to have integer types that don't silently
cast to other integer types. So sparse knows the concept of "bitwise"
and "nocast" attributes.  The "nocast" thing doesn't work well in
practice, but "bitwise" was a huge success and is how a lot of our
endianness problems were solved.

So the *concept* of an enum - or any other integer type - that "stays
in the type" is good, but I think it's a major mistake to think they
have to do so without any sane escape, and to only limit it to enums.

That said, we may not have *many* of those enum cases in the kernel
(and we do tend to have a history of using long series of '#define'
sequences to do these constants), so maybe the warning is acceptable
if it's a case of "this is literally the *only* one in the kernel".

But not having clang-19, I can't see if this is a case of "this is so
rare that let's just avoid it", or "this is the case that causes the
most noise for every file build, but there are lots of other cases of
this".

                  Linus
