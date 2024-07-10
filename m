Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315CF83CCB
	for <llvm@lists.linux.dev>; Wed, 10 Jul 2024 21:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720647659; cv=none; b=WmVXgqScKv/rvYSQdjWjmhsbo6seIy8eOClGoajq7SPF0xLi/lZF7chjk2VROxc7ND26mBaDRnrtDd9btOPl7jsT2dGwf/cn7hKuIasjlHb79o7kVsp5qVHuM3WKtW6HowGzo6N/fArQNevcdUitfHrI7mtgXWMLF+hDBBFr1dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720647659; c=relaxed/simple;
	bh=x0c0iBYcvD/rDFCSBzWak3CbeopcLqST+3WdVzu/Ge4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b4a/GlZ5XPLOF0Yuxm8naUWybsZBpzwlXNkRPkfheFitbGTucfhU4YudT7krt615PW3JWCu1Z+JAk4M9oz7U5nlTLT2uAyJ4tkGUzC9WXUkJa0EBSeBgAWrdmiM4XSO7al2U+0Vp1Uw0L4yvnj0Xap1XxeKom66MqRM4vLsXHVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i8f4Fc0F; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i8f4Fc0F"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6519528f44fso2183017b3.1
        for <llvm@lists.linux.dev>; Wed, 10 Jul 2024 14:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720647657; x=1721252457; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XBOBObJaAEK1M46KNmNvsVNBPngWj8fU0d2YVNpK0Q=;
        b=i8f4Fc0F5hW0qCRiZaBNyeKke7uIg4oc8IFd0go5Zd4GBI/ngbWN3L+NcnEKJMJhru
         GX7eSo86sDOkqhWULpW8ajUeGa5O9Iqyqtqqb/TkJ6/6kSzKb3lq1LNie8kfrFy+C+ds
         uHPgs1bmo5n27MH2v/8oh79Ne7nNQ6G7iTGaLiqGnUcac2050upR1ipRWJclXh6LSsZc
         m4LmQwvWzSuZ47jfkNlitCMeac7q1x6L8GYfMoIAo86K+KsTWKNA6Pz2FBGFhGy0/0j4
         IKJTLD333i10plA/eq1foT0eGCo7r/CaRa/AZKtK6/r3/RItDIBtOQdwtN7jFmdB3RKU
         LhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720647657; x=1721252457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5XBOBObJaAEK1M46KNmNvsVNBPngWj8fU0d2YVNpK0Q=;
        b=GL6cmR7hQITtPKmNJU7jolk2/DkVtcpkKXjpb/xMyMCkoszIh59zYp50r9rDbh1O0k
         Xtd1VyNO734zo0c9j7ZLaf0X+FW/7fc7NuFxvJK5nrsA7tKpSquU4c6s7uylYx16WY9V
         MZQuafPzpzKXLldpS3UAj9kk1U6dKKEDnOyG3J4UnsyNBclhzhOMsRBlh3kPeNw5f5zS
         yOCk0DGrzumNpYtmBN3J4u1ED9PGnbu1ga1VqJLIGpW5x+xIDaQ4HdaRWjgg0lxacSJH
         oNSIMU3J9UL68abiD1qKCynOoWB3ShDJgcjFu7GSlGgrcVRGf72tqFpJRZL5mHBBV/Gd
         /xqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWj5J80OyivbTTKBNRSsSWPT28HvtLySP0JNKUoWNmn2DSyBAC0D1C71DU1nDRGlnwRuLfqerJADqOk74+xqSHDzSi0zQ==
X-Gm-Message-State: AOJu0YxcFRVweIxw973pYYB/SIvkGS3O5XKrLQhQWbxu2tJkPYYVinNg
	lKdkWMJjzdiOdh57Y6+COMSVPBWeI7BYcDjuO6Ff2Vkt6mKOMRcXQ3uzphhl1nVGE/VbbSdS8Iz
	tCpY0U1qGw7WeZGbewZfan47D/ZgGMIusucGW
X-Google-Smtp-Source: AGHT+IE9LwO7snLlHt6fREw7Kb3flbhkA09QJ9tqIVaUo48iiu8//3dVR54mhZCPewECzH/0QpeEaLObv4Du7/1Ag88=
X-Received: by 2002:a05:690c:c0b:b0:64a:4728:ef4 with SMTP id
 00721157ae682-658f09c2d41mr82527977b3.47.1720647656845; Wed, 10 Jul 2024
 14:40:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240710025418.394321-1-sxwjean@me.com> <Zo36BTqhzGkukyT_@casper.infradead.org>
 <20240710150154.GA1684801@thelio-3990X>
In-Reply-To: <20240710150154.GA1684801@thelio-3990X>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 10 Jul 2024 14:40:45 -0700
Message-ID: <CAJuCfpFUawbMXf34YpUv_hrEvwOFX=CvPmyTS3CBOSZtC=c6Tg@mail.gmail.com>
Subject: Re: [PATCH] mm/slub: quiet the clang warning with -Wunused-function enabled
To: Nathan Chancellor <nathan@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, sxwjean@me.com, vbabka@suse.cz, cl@linux.co, 
	penberg@kernel.org, rientjes@google.com, iamjoonsoo.kim@lge.com, 
	akpm@linux-foundation.org, roman.gushchin@linux.dev, 42.hyeyoo@gmail.com, 
	xiongwei.song@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 8:02=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Wed, Jul 10, 2024 at 04:03:33AM +0100, Matthew Wilcox wrote:
> > On Wed, Jul 10, 2024 at 10:54:18AM +0800, sxwjean@me.com wrote:
> > > From: Xiongwei Song <xiongwei.song@linux.dev>
> > >
> > > The only user of prepare_slab_obj_exts_hook() is
> > > alloc_tagging_slab_alloc_hook(), which can build with
> > > CONFIG_MEM_ALLOC_PROFILING enabled. So, the warning was triggerred
> > > when disabling CONFIG_MEM_ALLOC_PROFILING. Let's add "__maybe_unused"
> > > for prepare_slab_obj_exts_hook().
> >
> > Perhaps instead clang can be fixed to match gcc's behaviour?
>
> Clang only differs from GCC on warning for unused static inline functions=
 in .c
> files, not .h files. The kernel already handles this in
> include/linux/compiler_types.h but it disables this workaround for W=3D1 =
to catch
> unused functions like this as a result of commit 6863f5643dd7 ("kbuild: a=
llow
> Clang to find unused static inline functions for W=3D1 build"):
>
> /*
>  * GCC does not warn about unused static inline functions for -Wunused-fu=
nction.
>  * Suppress the warning in clang as well by using __maybe_unused, but ena=
ble it
>  * for W=3D1 build. This will allow clang to find unused functions. Remov=
e the
>  * __inline_maybe_unused entirely after fixing most of -Wunused-function =
warnings.
>  */
> #ifdef KBUILD_EXTRA_WARN1
> #define __inline_maybe_unused
> #else
> #define __inline_maybe_unused __maybe_unused
> #endif
>
> So I don't really think there is much for clang to do here and I think ha=
ving
> the ability to find unused static inline functions in .c files is useful =
(you
> might disagree, perhaps a revert could still be discussed). I guess
> IS_ENABLED() can't be used there, so it seems like either taking this pat=
ch,
> ignoring the warning, or refactoring the code in some other way are the o=
nly
> options I see.

I think this is the consequence of the recent refactoring I've done in
https://lore.kernel.org/all/20240704135941.1145038-1-surenb@google.com/.
There should be a cleaner way to fix this. I'll post it later today or
tomorrow morning.
Thanks,
Suren.

>
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202407050845.zNONqauD-l=
kp@intel.com/
> > > Signed-off-by: Xiongwei Song <xiongwei.song@linux.dev>
> > > ---
> > >  mm/slub.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/mm/slub.c b/mm/slub.c
> > > index ce39544acf7c..2e26f20759c0 100644
> > > --- a/mm/slub.c
> > > +++ b/mm/slub.c
> > > @@ -2027,7 +2027,7 @@ static inline bool need_slab_obj_ext(void)
> > >     return false;
> > >  }
> > >
> > > -static inline struct slabobj_ext *
> > > +static inline struct slabobj_ext * __maybe_unused
> > >  prepare_slab_obj_exts_hook(struct kmem_cache *s, gfp_t flags, void *=
p)
> > >  {
> > >     struct slab *slab;
> > > @@ -2068,7 +2068,7 @@ static inline bool need_slab_obj_ext(void)
> > >     return false;
> > >  }
> > >
> > > -static inline struct slabobj_ext *
> > > +static inline struct slabobj_ext * __maybe_unused
> > >  prepare_slab_obj_exts_hook(struct kmem_cache *s, gfp_t flags, void *=
p)
> > >  {
> > >     return NULL;
> > > --
> > > 2.34.1
> > >
> > >
