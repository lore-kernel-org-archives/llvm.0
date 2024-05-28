Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DDC16C69D
	for <llvm@lists.linux.dev>; Tue, 28 May 2024 11:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716896216; cv=none; b=n6Gx0nIjqEvytHVyJsA7y5bMsikUSnMI+j9QLYz0ik6bo/n23OiwGMWMOh1uJMCwO4EpEmTLKPVZCxyFGebGUWMfE+ot93xFSTanom+xGvzSJxRA3V65WVzAPvJbYX/AxFOJhJYGOjofBdJgKQgy6dxDi2AZfFXXQxbg0Cb/qTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716896216; c=relaxed/simple;
	bh=M0MaGrmyVgPDZ5O+a4ObngblY3U7Ng60oW1EiVKZdNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q/BasvKL58nGe9nXntA6I3Y3g+A3waQkGyK3zrAmYHlm08goUwRBrmlxPbiTHv9PfFBtqHykPNa8X5HKyAY1fu9TKbsqXdLkQ16REjsj/eoZvymgSjYn+vYUgOpaJqeta0wOrEg3d6cBcWlWZxIALeh3/5kQz1vrWUbyqus1qvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b/MsObQF; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b/MsObQF"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6ab9d01cb11so4202186d6.1
        for <llvm@lists.linux.dev>; Tue, 28 May 2024 04:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716896213; x=1717501013; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+fy7bxhmTSYRqmL4m3IRHCvKHkrSDKxVpOHKJ74CWc=;
        b=b/MsObQFkdrbRx0ZLwlvRjm9fed6r7jLudt9nQMMHLizpoBWXeO4brVYCURUImnUYk
         CDm00EaKM9kmgZUwkkzx1s3gnfoalQdn6otl2BqCgM6GBgp4Yi8qp0l2VPelIQOKnZlL
         Ih9S+dmoFOXb0asx+u5kAoD1X+kgZRZAysh8kUWNZoFFokFG2VVnEmCohgfNRgdxnfo4
         VTln6ZjAdHukbi43C5JBV79Vs03HEB2cBaj47yrNqQSMYTO6Jv3YegT90E5UBbpdW6tU
         qnDe/szEEfTaUnbsu/szqsuc/JZykF3ZuSWBE1yVyRU3Wc0b/C/LDwxROrqYNbc91t0B
         x1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716896213; x=1717501013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5+fy7bxhmTSYRqmL4m3IRHCvKHkrSDKxVpOHKJ74CWc=;
        b=Pbm46GSaueNPl+KzSWI0e1sGkuUsspjx9ZAKzm5ZaQXtBNzJgpq6p9b9tYI9zxEl9o
         HXLD+ZAWGfEbTWpmLRHme7lhEq2FNX+NHce4BVN8rmWJJrFUtiaJeZZWMRe09fxC4onc
         Gz7Slci37AzhAqV7aSEbhl0v6EdBBPbBtwz/g8F1S8ubnDwnpllHFMkceVI0MtxY7aAy
         Pp+AFxrk62RpLB6Nj1LVgKZFTCroNLEbB4U01PkOF0yC3D7LRu2hqrlBj/x36GYAPwt8
         j3E27wzyDPDKlq6m3/x9BEbuOu7xdLuCMaU5dJHcd2wJhz91fRo+h4pEbz5HAvrynuq6
         osoA==
X-Forwarded-Encrypted: i=1; AJvYcCUqFVYum05N+4s/cMWeLMK5lfX9e9B6rWfJ1ZzkKa1PCZIz7JutFTYbm3Gmapl682b3ILWpWiJ8/2C6CbSy12My1Frw9w==
X-Gm-Message-State: AOJu0YwNBNawMo+ptejoc89cRG2WA+NI/FzMA5wrTSIPfxGbp7YksQ6g
	DZ06knCPP4EOx9Zv2wDa1Vkalbo8sX63MHY84G/xu2wxJF/I//WhpI6NYM5y3LJ7s0ykhrD40Wr
	3FrYabOdRXZLk10sRxNs/vE2D3gMgcE/hqePM
X-Google-Smtp-Source: AGHT+IEg6PbfYyP0aS02Mv0srCCx6EfAtwyybRhD4r3hX01VAgUGGxblt8OUbvO4llpryD8LyAH3/0ceqAYcq/6J4a4=
X-Received: by 2002:a05:6214:4602:b0:6ab:92b7:5903 with SMTP id
 6a1803df08f44-6abbbcb0b35mr137433736d6.21.1716896213239; Tue, 28 May 2024
 04:36:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <986294ee-8bb1-4bf4-9f23-2bc25dbad561@efficios.com>
 <vu7w6if47tv3kwnbbbsdchu3wpsbkqlvlkvewtvjx5hkq57fya@rgl6bp33eizt>
 <944d79b5-177d-43ea-a130-25bd62fc787f@efficios.com> <7236a148-c513-4053-9778-0bce6657e358@efficios.com>
 <jqj6do7lodrrvpjmk6vlhasdigs23jkyvznniudhebcizstsn7@6cetkluh4ehl>
In-Reply-To: <jqj6do7lodrrvpjmk6vlhasdigs23jkyvznniudhebcizstsn7@6cetkluh4ehl>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 28 May 2024 13:36:11 +0200
Message-ID: <CAG_fn=Vp+WoxWw_aA9vr9yf_4qRvu1zqfLDWafR8J41Zd9tX5g@mail.gmail.com>
Subject: Re: Use of zero-length arrays in bcachefs structures inner fields
To: Kent Overstreet <kent.overstreet@linux.dev>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Brian Foster <bfoster@redhat.com>, Kees Cook <keescook@chromium.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, linux-bcachefs@vger.kernel.org, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2024 at 7:30=E2=80=AFPM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Fri, May 24, 2024 at 12:04:11PM -0400, Mathieu Desnoyers wrote:
> > On 2024-05-24 11:35, Mathieu Desnoyers wrote:
> > > [ Adding clang/llvm and KMSAN maintainers/reviewers in CC. ]
> > >
> > > On 2024-05-24 11:28, Kent Overstreet wrote:
> > > > On Thu, May 23, 2024 at 01:53:42PM -0400, Mathieu Desnoyers wrote:
> > > > > Hi Kent,
> > > > >
> > > > > Looking around in the bcachefs code for possible causes of this K=
MSAN
> > > > > bug report:
> > > > >
> > > > > https://lore.kernel.org/lkml/000000000000fd5e7006191f78dc@google.=
com/
> > > > >
> > > > > I notice the following pattern in the bcachefs structures: zero-l=
ength
> > > > > arrays members are inserted in structures (not always at the end)=
,
> > > > > seemingly to achieve a result similar to what could be done with =
a
> > > > > union:
> > > > >
> > > > > fs/bcachefs/bcachefs_format.h:
> > > > >
> > > > > struct bkey_packed {
> > > > >          __u64           _data[0];
> > > > >
> > > > >          /* Size of combined key and value, in u64s */
> > > > >          __u8            u64s;
> > > > > [...]
> > > > > };
> > > > >
> > > > > likewise:
> > > > >
> > > > > struct bkey_i {
> > > > >          __u64                   _data[0];
> > > > >
> > > > >          struct bkey     k;
> > > > >          struct bch_val  v;
> > > > > };

I took a glance at the LLVM IR for fs/bcachefs/bset.c, and it defines
struct bkey_packed and bkey_i as:

    %struct.bkey_packed =3D type { [0 x i64], i8, i8, i8, [0 x i8], [37 x i=
8] }
    %struct.bkey_i =3D type { [0 x i64], %struct.bkey, %struct.bch_val }

, which more or less looks as expected, so I don't think it could be
causing problems with KMSAN right now.
Moreover, there are cases in e.g. include/linux/skbuff.h where
zero-length arrays are used for the same purpose, and KMSAN handles
them just fine.

Yet I want to point out that even GCC discourages the use of
zero-length arrays in the middle of a struct:
https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html, so Clang is not
unique here.

Regarding the original KMSAN bug, as noted in
https://lore.kernel.org/all/0000000000009f9447061833d477@google.com/T/,
we might be missing the event of copying data from the disk to
bcachefs structs.
I'd appreciate help from someone knowledgeable about how disk I/O is
implemented in the kernel.
