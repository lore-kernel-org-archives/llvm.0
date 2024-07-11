Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A3C450FA
	for <llvm@lists.linux.dev>; Thu, 11 Jul 2024 17:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720717597; cv=none; b=Xy0xP6Xi7mhvf8oO3gPMl0GaJW8TPNHQN6i8BK9FqJyZq1YFlGkFKcgrcBCFOpRFGYE2CuFvuM8O+yvLdvVUV77IAvqusgXcdnZ9yXHxGAm2wv7uYj/2aasdWd8ZpGaAnrl0Z9Xpa1hcRewf7ANy+mAac7uvQEP13FFIqh9fz9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720717597; c=relaxed/simple;
	bh=fDkBPWeYQgsnESRoC4KC4O1cV67QHs0vDF8sT41VJVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=urUs4Z2eMxfPtxlDiwZVApFCFmmz4jjXQKOPfi4TUIqTCapSywdIh6ArSEzvtvgHbEoRU+mOu84HISo9CUmnAQusBkE2Q8n3BeyT+A8IoOFGzQGeiRIee9b/2DCMBneyOswyY8OSogDSem14usi3mleZzRjU26Lrxp6Aru1DI4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EkscpvO4; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EkscpvO4"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6512866fa87so12015937b3.2
        for <llvm@lists.linux.dev>; Thu, 11 Jul 2024 10:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720717594; x=1721322394; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djklYk9rWCjm2tsWgbZ32mQ8UgJBx4pRhVg9VXDIihA=;
        b=EkscpvO4ivXywgl6Dayy0vHxsJBj1rkOX8FtqPW/JTgriOSxZlgkG7ugZmhehllsoM
         NamL1T5TUF5jUrFIHUOsjqkeHtqZolR5CrUZF24nxnP4ppS5npvHwzc0SBsCzvlSkmwD
         p+o7VTmM3QxK28O5Ane1u/nc0ytjbK2nfGtXXxY+yb4pUlKf3Z/v8VlQKHaD+RFZxBI4
         ipOPl8v4bil3UzH8bmtHB9dyh6qBt8MDvR+gsrYU/WlQkIu0UbG61yZ8KLPu7uZGXViE
         temgwnpl9rDstuQuHeLwZ7pDzXUgiGtld7S+rbVQ9ekdVieeRIY2WAmAlXbLUk8fgK8l
         xvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720717594; x=1721322394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=djklYk9rWCjm2tsWgbZ32mQ8UgJBx4pRhVg9VXDIihA=;
        b=vSc3rkvfdB6eMv6vm+lIudfGq/INHYxlPZmj7ti9xEqkOEmcirkAq+nM005try0DfZ
         SpCfyWvsUJ2x8Sln8xjSvMjePZ82Kjvb9bZU70329kt6myfgXkKBGTXrjVqvJDMtSUIi
         /lkdOu832XhIOk5gsUGKTO2ItZaXfmZr0ANGRfYaMVCDrYmEb/Q1376mroCdybo6mbPg
         pneEZk4r01lnD8aPYn5J6dGHaC54y6dHdrWHRI7TDiTD3SQQbLEQLyB41TMpx5qP0XRB
         kJvqLldVQxq8L3lHl8AjIIFXVXKcSx8hnCZWQECxFo6EaLpwFJhEH+oCkO7Sx4LjZYmv
         RywA==
X-Forwarded-Encrypted: i=1; AJvYcCUxCZc/rcFn3i+qiPB2Erd1xbxYAQhS8iLGsZvD0LgC1A4Mqh88vlrCgN6CE6dDDxlvFq7DIx1zTzDSPFFEN8/0iueQ/A==
X-Gm-Message-State: AOJu0YwtNTiv55aw5HUda+a5QqaR/4N2ebyCKrPEsw5B3YaXFmBhxUrB
	BjiReaQdmS/0EkaPV30bwaIWGj3wX8vujL4OMxu83/mwRYuRYVvGFffL+/ew1p8OcwsRD37wTul
	sU67pS3b8srrbGMtl3ntYGe+5biTV/+OgOX2P
X-Google-Smtp-Source: AGHT+IEjLTuYW3rMjiWDPSDFo/eiUXPqxmY1jhWYiTkKdjmVVxgLDTfX3dkdkMaURNMZn39k8dgTfzzNTZOG6FO4Tuo=
X-Received: by 2002:a0d:ed45:0:b0:646:5ae1:b74d with SMTP id
 00721157ae682-658f0dc3243mr98784117b3.48.1720717593956; Thu, 11 Jul 2024
 10:06:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240710025418.394321-1-sxwjean@me.com> <Zo36BTqhzGkukyT_@casper.infradead.org>
 <20240710150154.GA1684801@thelio-3990X> <CAJuCfpFUawbMXf34YpUv_hrEvwOFX=CvPmyTS3CBOSZtC=c6Tg@mail.gmail.com>
 <4b533d6c-b2f3-49eb-a7fb-807af482def8@suse.cz> <CAJuCfpGoSMvPWTjoKDiN+yMMfiwz7XFmv-i71nvK14uJbCPmRA@mail.gmail.com>
In-Reply-To: <CAJuCfpGoSMvPWTjoKDiN+yMMfiwz7XFmv-i71nvK14uJbCPmRA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 11 Jul 2024 10:06:19 -0700
Message-ID: <CAJuCfpG08jmspY11dGej5Wdz2hT4iC=nr4V3HH-S4YfhXV7wyg@mail.gmail.com>
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

On Thu, Jul 11, 2024 at 6:56=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Thu, Jul 11, 2024 at 12:43=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz>=
 wrote:
> >
> > On 7/10/24 11:40 PM, Suren Baghdasaryan wrote:
> > > On Wed, Jul 10, 2024 at 8:02=E2=80=AFAM Nathan Chancellor <nathan@ker=
nel.org> wrote:
> > >>
> > >> On Wed, Jul 10, 2024 at 04:03:33AM +0100, Matthew Wilcox wrote:
> > >> > On Wed, Jul 10, 2024 at 10:54:18AM +0800, sxwjean@me.com wrote:
> > >> > > From: Xiongwei Song <xiongwei.song@linux.dev>
> > >> > >
> > >> > > The only user of prepare_slab_obj_exts_hook() is
> > >> > > alloc_tagging_slab_alloc_hook(), which can build with
> > >> > > CONFIG_MEM_ALLOC_PROFILING enabled. So, the warning was triggerr=
ed
> > >> > > when disabling CONFIG_MEM_ALLOC_PROFILING. Let's add "__maybe_un=
used"
> > >> > > for prepare_slab_obj_exts_hook().
> > >> >
> > >> > Perhaps instead clang can be fixed to match gcc's behaviour?
> > >>
> > >> Clang only differs from GCC on warning for unused static inline func=
tions in .c
> > >> files, not .h files. The kernel already handles this in
> > >> include/linux/compiler_types.h but it disables this workaround for W=
=3D1 to catch
> > >> unused functions like this as a result of commit 6863f5643dd7 ("kbui=
ld: allow
> > >> Clang to find unused static inline functions for W=3D1 build"):
> > >>
> > >> /*
> > >>  * GCC does not warn about unused static inline functions for -Wunus=
ed-function.
> > >>  * Suppress the warning in clang as well by using __maybe_unused, bu=
t enable it
> > >>  * for W=3D1 build. This will allow clang to find unused functions. =
Remove the
> > >>  * __inline_maybe_unused entirely after fixing most of -Wunused-func=
tion warnings.
> > >>  */
> > >> #ifdef KBUILD_EXTRA_WARN1
> > >> #define __inline_maybe_unused
> > >> #else
> > >> #define __inline_maybe_unused __maybe_unused
> > >> #endif
> > >>
> > >> So I don't really think there is much for clang to do here and I thi=
nk having
> > >> the ability to find unused static inline functions in .c files is us=
eful (you
> > >> might disagree, perhaps a revert could still be discussed). I guess
> > >> IS_ENABLED() can't be used there, so it seems like either taking thi=
s patch,
> > >> ignoring the warning, or refactoring the code in some other way are =
the only
> > >> options I see.
> > >
> > > I think this is the consequence of the recent refactoring I've done i=
n
> > > https://lore.kernel.org/all/20240704135941.1145038-1-surenb@google.co=
m/.
> > > There should be a cleaner way to fix this. I'll post it later today o=
r
> > > tomorrow morning.
> >
> > Yeah looks like the non-empty prepare_slab_obj_exts_hook() could move t=
o the
> > #ifdef CONFIG_MEM_ALLOC_PROFILING section above
> > alloc_tagging_slab_alloc_hook() and the empty one just removed.
>
> Exactly my plan. I'll post a patch once I reach the office.

Actually I was wrong and the problem exists even without my
refactoring in [1]. I posted the fix at [2] and I based it on
slab/for-next because that's the only branch that contains [1]. Not
because [2] requires [1] but because they are changing adjacent code,
so would create merge problems if merged separately.

[1] https://lore.kernel.org/all/20240704135941.1145038-1-surenb@google.com/
[2] https://lore.kernel.org/all/20240711170216.1149695-1-surenb@google.com/

>
> >
> > > Thanks,
> > > Suren.
> > >
> > >>
> > >> > > Reported-by: kernel test robot <lkp@intel.com>
> > >> > > Closes: https://lore.kernel.org/oe-kbuild-all/202407050845.zNONq=
auD-lkp@intel.com/
> > >> > > Signed-off-by: Xiongwei Song <xiongwei.song@linux.dev>
> > >> > > ---
> > >> > >  mm/slub.c | 4 ++--
> > >> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >> > >
> > >> > > diff --git a/mm/slub.c b/mm/slub.c
> > >> > > index ce39544acf7c..2e26f20759c0 100644
> > >> > > --- a/mm/slub.c
> > >> > > +++ b/mm/slub.c
> > >> > > @@ -2027,7 +2027,7 @@ static inline bool need_slab_obj_ext(void)
> > >> > >     return false;
> > >> > >  }
> > >> > >
> > >> > > -static inline struct slabobj_ext *
> > >> > > +static inline struct slabobj_ext * __maybe_unused
> > >> > >  prepare_slab_obj_exts_hook(struct kmem_cache *s, gfp_t flags, v=
oid *p)
> > >> > >  {
> > >> > >     struct slab *slab;
> > >> > > @@ -2068,7 +2068,7 @@ static inline bool need_slab_obj_ext(void)
> > >> > >     return false;
> > >> > >  }
> > >> > >
> > >> > > -static inline struct slabobj_ext *
> > >> > > +static inline struct slabobj_ext * __maybe_unused
> > >> > >  prepare_slab_obj_exts_hook(struct kmem_cache *s, gfp_t flags, v=
oid *p)
> > >> > >  {
> > >> > >     return NULL;
> > >> > > --
> > >> > > 2.34.1
> > >> > >
> > >> > >
> >
