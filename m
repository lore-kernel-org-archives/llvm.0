Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3848E15F3E0
	for <llvm@lists.linux.dev>; Thu, 11 Jul 2024 13:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720706175; cv=none; b=M2/hLiI/LSaDPCwqxHVAtw74sKbh3k/Qkpo21xHKHi2MK9x4E8oez/x1ltN7my0qRC+92f+I+1wZr2CMP15jYiODFTVlbhbexQMVZc8ESFWCO5utyqGRlX1ouR9lN+NVbbXsjwOm1MQzOaLO97gC/373a4TGXJEeQB/tNX5gH6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720706175; c=relaxed/simple;
	bh=dSJz3wgsOhXykIynBdcFU1pclFWJ6/TuglMyzc9Bh5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hKIj4VDyUPOgoU6jc6cHdGYThjmi27n+TIv+TV7N4/kQrr7L79ZXJqKF5Pyb6RqB3WKjHZBU2xSE/51ATV1k6SV0S71EQn1uDMlVq2ReCtxyum8A749AN7ekbUE3PifZwX5jUaMx26GLGbk83jQ2lLwUFiIf8aqNKXKCL1odkrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d6+NdBmd; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d6+NdBmd"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dfef5980a69so950588276.3
        for <llvm@lists.linux.dev>; Thu, 11 Jul 2024 06:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720706172; x=1721310972; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFTrnAbyX8vf3QQjlC5h5C0zllrIIeWFeKDzU5Qbf8s=;
        b=d6+NdBmdUZ/fnMxnwD451GH3COV++VcnfKvTLWIiQO+7pkW7cVX3C+vojyE3WL1u4s
         mxfYfQaH81/LHKD+haJ5k7Hd7JAidXWKvn6OeUMru/XAaqFFP+Jog0YpZilfXX4hsXj1
         BFHmpkdHLjXoE2VxpH0n8f6a4gMMLfKrDqkQbQLQpHnBoIi6ck1QbRC3QZdHI54YlbaZ
         t048lli18TomEnusy/b/oypslx6Idom1yThENhU1sxiK0UTNFg5khQTjScKAyZmCyaSi
         8UHgog84sq7Jev4VB30c2LW18uGcGWtQGoaUZEx9LPp2O3tBkpdL6WCV4JTnQ5+BC5e0
         obpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720706172; x=1721310972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFTrnAbyX8vf3QQjlC5h5C0zllrIIeWFeKDzU5Qbf8s=;
        b=Sbl/YDCMEkm64YF3EZ4IRiCMTyA5P2LdccSjXGtOEdl6LMAQBOUJzxHXyeSAyloCyj
         ZO0SGktD4e9pLQWwDZNQlYeJ9oNjBUujPx1jyvmzYNU9Q9Jxnnsl3N24d+VMItA7BeMf
         LfGxH2o4VcUZnZPuRt4pFci9b4e2XyjCEmXAE6tquvXXpKwU/u0kDndALfjrZA3r49iM
         Uq8FhIbaUR+T2MlX0LmvQbjqTDKPadPNla2L3hWnowe8gfpe8sYC5zB4djJpTnedwghn
         5jhLPRP8SjnraZoYzaIPfTw0YMNGEfhTbwoiD9Sj4f7nGBIGa43d6JeyaGBz41sIn2Qd
         nVuw==
X-Forwarded-Encrypted: i=1; AJvYcCVIgf1R6QSfpjsVo5tpW0dXwsw9gd3Jay4v//69AKB6GFtUvs9jReiE/iayDbsSOBCi9xVbJ6v18xYdKuIugYULJPKdyg==
X-Gm-Message-State: AOJu0YzsKrnh/hy1T/pyzBbG8aoaE2/fRRn4LZqOv8mU1OrFWb0c+582
	B2o6aXVD2ABx4HB0sGrddUHfab7sE8EVk1yb9n21XY9+ZHppx0INXuWLQGCtaqWXQGZLddVc+/s
	ArDgIneLeOPvi3nJJw24jXKTngQb5cwheEpA7
X-Google-Smtp-Source: AGHT+IEzi2i3Lqz/5TdUvZHvPNb77C6MfS8NebUNLgPcBjgz6y6o+pM85oFGLgCJRIc8PuJgLqURHYqx/2OM1Q5xKhU=
X-Received: by 2002:a25:b2a1:0:b0:e02:8ab0:c940 with SMTP id
 3f1490d57ef6-e041b1e9795mr9335860276.47.1720706171781; Thu, 11 Jul 2024
 06:56:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240710025418.394321-1-sxwjean@me.com> <Zo36BTqhzGkukyT_@casper.infradead.org>
 <20240710150154.GA1684801@thelio-3990X> <CAJuCfpFUawbMXf34YpUv_hrEvwOFX=CvPmyTS3CBOSZtC=c6Tg@mail.gmail.com>
 <4b533d6c-b2f3-49eb-a7fb-807af482def8@suse.cz>
In-Reply-To: <4b533d6c-b2f3-49eb-a7fb-807af482def8@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 11 Jul 2024 06:56:00 -0700
Message-ID: <CAJuCfpGoSMvPWTjoKDiN+yMMfiwz7XFmv-i71nvK14uJbCPmRA@mail.gmail.com>
Subject: Re: [PATCH] mm/slub: quiet the clang warning with -Wunused-function enabled
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Nathan Chancellor <nathan@kernel.org>, Matthew Wilcox <willy@infradead.org>, sxwjean@me.com, cl@linux.co, 
	penberg@kernel.org, rientjes@google.com, iamjoonsoo.kim@lge.com, 
	akpm@linux-foundation.org, roman.gushchin@linux.dev, 42.hyeyoo@gmail.com, 
	xiongwei.song@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2024 at 12:43=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> w=
rote:
>
> On 7/10/24 11:40 PM, Suren Baghdasaryan wrote:
> > On Wed, Jul 10, 2024 at 8:02=E2=80=AFAM Nathan Chancellor <nathan@kerne=
l.org> wrote:
> >>
> >> On Wed, Jul 10, 2024 at 04:03:33AM +0100, Matthew Wilcox wrote:
> >> > On Wed, Jul 10, 2024 at 10:54:18AM +0800, sxwjean@me.com wrote:
> >> > > From: Xiongwei Song <xiongwei.song@linux.dev>
> >> > >
> >> > > The only user of prepare_slab_obj_exts_hook() is
> >> > > alloc_tagging_slab_alloc_hook(), which can build with
> >> > > CONFIG_MEM_ALLOC_PROFILING enabled. So, the warning was triggerred
> >> > > when disabling CONFIG_MEM_ALLOC_PROFILING. Let's add "__maybe_unus=
ed"
> >> > > for prepare_slab_obj_exts_hook().
> >> >
> >> > Perhaps instead clang can be fixed to match gcc's behaviour?
> >>
> >> Clang only differs from GCC on warning for unused static inline functi=
ons in .c
> >> files, not .h files. The kernel already handles this in
> >> include/linux/compiler_types.h but it disables this workaround for W=
=3D1 to catch
> >> unused functions like this as a result of commit 6863f5643dd7 ("kbuild=
: allow
> >> Clang to find unused static inline functions for W=3D1 build"):
> >>
> >> /*
> >>  * GCC does not warn about unused static inline functions for -Wunused=
-function.
> >>  * Suppress the warning in clang as well by using __maybe_unused, but =
enable it
> >>  * for W=3D1 build. This will allow clang to find unused functions. Re=
move the
> >>  * __inline_maybe_unused entirely after fixing most of -Wunused-functi=
on warnings.
> >>  */
> >> #ifdef KBUILD_EXTRA_WARN1
> >> #define __inline_maybe_unused
> >> #else
> >> #define __inline_maybe_unused __maybe_unused
> >> #endif
> >>
> >> So I don't really think there is much for clang to do here and I think=
 having
> >> the ability to find unused static inline functions in .c files is usef=
ul (you
> >> might disagree, perhaps a revert could still be discussed). I guess
> >> IS_ENABLED() can't be used there, so it seems like either taking this =
patch,
> >> ignoring the warning, or refactoring the code in some other way are th=
e only
> >> options I see.
> >
> > I think this is the consequence of the recent refactoring I've done in
> > https://lore.kernel.org/all/20240704135941.1145038-1-surenb@google.com/=
.
> > There should be a cleaner way to fix this. I'll post it later today or
> > tomorrow morning.
>
> Yeah looks like the non-empty prepare_slab_obj_exts_hook() could move to =
the
> #ifdef CONFIG_MEM_ALLOC_PROFILING section above
> alloc_tagging_slab_alloc_hook() and the empty one just removed.

Exactly my plan. I'll post a patch once I reach the office.

>
> > Thanks,
> > Suren.
> >
> >>
> >> > > Reported-by: kernel test robot <lkp@intel.com>
> >> > > Closes: https://lore.kernel.org/oe-kbuild-all/202407050845.zNONqau=
D-lkp@intel.com/
> >> > > Signed-off-by: Xiongwei Song <xiongwei.song@linux.dev>
> >> > > ---
> >> > >  mm/slub.c | 4 ++--
> >> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> >> > >
> >> > > diff --git a/mm/slub.c b/mm/slub.c
> >> > > index ce39544acf7c..2e26f20759c0 100644
> >> > > --- a/mm/slub.c
> >> > > +++ b/mm/slub.c
> >> > > @@ -2027,7 +2027,7 @@ static inline bool need_slab_obj_ext(void)
> >> > >     return false;
> >> > >  }
> >> > >
> >> > > -static inline struct slabobj_ext *
> >> > > +static inline struct slabobj_ext * __maybe_unused
> >> > >  prepare_slab_obj_exts_hook(struct kmem_cache *s, gfp_t flags, voi=
d *p)
> >> > >  {
> >> > >     struct slab *slab;
> >> > > @@ -2068,7 +2068,7 @@ static inline bool need_slab_obj_ext(void)
> >> > >     return false;
> >> > >  }
> >> > >
> >> > > -static inline struct slabobj_ext *
> >> > > +static inline struct slabobj_ext * __maybe_unused
> >> > >  prepare_slab_obj_exts_hook(struct kmem_cache *s, gfp_t flags, voi=
d *p)
> >> > >  {
> >> > >     return NULL;
> >> > > --
> >> > > 2.34.1
> >> > >
> >> > >
>
