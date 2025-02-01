Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BFD7DA95
	for <llvm@lists.linux.dev>; Sat,  1 Feb 2025 19:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738437710; cv=none; b=UrK5gYWG3evCPnfXOaz7rV0Hh7wD3zGebcysJVQD6vv5tzmPaxACSKe+S47uPHIO9+rYkZJv9MLUS7J8/LLavQ0Et2Tc8xEjYEoeEm+onctDHHyVIW2ALIiI2Vlj0GxOBBZujs7sBiXaib4NV4WtZnKWHsXgDyG8UdEldnjeVZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738437710; c=relaxed/simple;
	bh=KP7BAj4tnKV75Qb0cyvNolqU2y3N1iuyZnblnUzgyZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bf+N3Y2qdRjfbQ/g9DIRqq7FclBmWuVHgyfqwSOiPYcF6mGNT5o5VvGIY49m4F3yrj5ms+MKkubOlZ3eBhSWbgVhzLIno266oFSVxKwdKZD8vvahUqsF/anl4kbVdNCbjo4Id3JYcvPUR5rGVeJl4LMqj7+G2iRRsy8Ufa20lG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y3hQ9tSX; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y3hQ9tSX"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4678c9310afso169691cf.1
        for <llvm@lists.linux.dev>; Sat, 01 Feb 2025 11:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738437706; x=1739042506; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Q4abMtFigScZcn+bs2Q2T1g/EWKhoP7a7r42KNczLk=;
        b=y3hQ9tSXLIfIg/AJ7P1uSh5lrTlzb8uCyVY+cDaE+bat76v4XmJrew2Dntd3aO+571
         srWndWjKPHvjeKYIkGbgjFD+E3eXoMbUJKTv3Gdf/8RRCivBbJfmx60ZykPJw0htaHtb
         3oy1qgWhCKQO4QibEAaKUvg53EdDgWlzpJlUlLgtyPxCYbWS4vnS+C96zxt6VoV5lwSo
         y+E8TpFx/qGw0M9v/iPobjYUSEljlbVb4PdozIWMK74asEqVBdvvky37JxUkda2+9AMm
         e/+FskXD35LasQk4ACEAT2g875GkG9f0CQRgbkQLGnEsiG39ftyDCQ0a+5PuAvSG+1jU
         w9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738437706; x=1739042506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Q4abMtFigScZcn+bs2Q2T1g/EWKhoP7a7r42KNczLk=;
        b=srkwJnofjUTi/wdk4nc0OVMRLmtcOgk8uyWOE8t1nRE4jP9gNxXLnkCHfVT20aWRsa
         Dnux3a7diAkW5/AcxRl6j9qinK6jtASN4FjH6BZCpbv4IeJWWfzUUvRaVbXkx8bw0oAi
         gcxJAuKvpOnL8/fYlbYkCju2NVxfuZkZ7K/iY04bayNbsiUPWPbqiDpOMO24t1WQLNKN
         7NhYsvipQkWT9yd1l+fhe5O6CtfcNboZYCWv7upkytzuPnrreh6DLTe9Pugd5P8fCHwl
         oBHeJC2yj5fhDDacLCZaUaAHiRCFB/ma3h+DD0jkgvOrxJDKHGdBB8s48fYtW1OuDIFJ
         Oq5g==
X-Forwarded-Encrypted: i=1; AJvYcCWdWkjV0D6tfBz2V+b+hBeIzlTmvFQSYPUzXHi6ndegz2M9Smeo8Y6LkiGjSSuvj7RF/eeC@lists.linux.dev
X-Gm-Message-State: AOJu0YwZM0+VVKHZtQB7boho9Kh6XVXZDJHeX9b9lqL6wdWMRLZfmHyu
	eBcgGeqQ6533ks+C9HdvcIVWpnVyDNfILWHXo7R8DoSujNh3m2TZY2NzRNo5exb8nmBCAzJRr55
	ubfnQJgpD0NwZxqr/7gJz05Ual44l+hwunGnj
X-Gm-Gg: ASbGncteXFQMsFMUvRcSEfg9tBPDtJj9TaSYE4VZ0FbC1UKp/1l8SEHxicUo8tuBs0Z
	HP9JQR7XDVrq9ldbq52f2mui3LCKCiW97e4k0MTLGBQXqc/1r4MChXOu9xkHW616HeNAN+zo1
X-Google-Smtp-Source: AGHT+IH6iU7oK11joDMO6qr0cc+4zoE84MbudCftX0eHkm9Wab8JGiZzC5yRPPAaY3LrkBPoh9sQJsZJldHWbFL5a1g=
X-Received: by 2002:a05:622a:6098:b0:46c:7d66:557f with SMTP id
 d75a77b69052e-46ff8713f96mr1834641cf.8.1738437705448; Sat, 01 Feb 2025
 11:21:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501310832.kiAeOt2z-lkp@intel.com> <CAJuCfpGrtTK=reeVPrS+GQngs=WS-cZvy_YU9-JGyRgVFdofAw@mail.gmail.com>
 <CAJuCfpF56btBuHKn6j2SzY8KRUbjQ_oHCYtj5oqP88HBBBQ_3A@mail.gmail.com>
In-Reply-To: <CAJuCfpF56btBuHKn6j2SzY8KRUbjQ_oHCYtj5oqP88HBBBQ_3A@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 1 Feb 2025 11:21:34 -0800
X-Gm-Features: AWEUYZnHN5eMAAaN6d5V0pKMqCk98IC6fVNOKYum3DnDnjgJPVRAT21sISprZro
Message-ID: <CAJuCfpExBhWxWdj3G-uQXA8HA-+ES6y=sz2H4eeze4xw4snYZg@mail.gmail.com>
Subject: Re: drivers/auxdisplay/panel.c:1454:2: error: call to
 __compiletime_assert_309 declared with 'error' attribute: BUILD_BUG_ON
 failed: !__builtin_constant_p(_dest_len) || _dest_len == (size_t)-1
To: kernel test robot <lkp@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Linux Memory Management List <linux-mm@kvack.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Kees Cook <keescook@chromium.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 2:51=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Fri, Jan 31, 2025 at 8:55=E2=80=AFAM Suren Baghdasaryan <surenb@google=
.com> wrote:
> >
> > On Thu, Jan 30, 2025 at 4:06=E2=80=AFPM kernel test robot <lkp@intel.co=
m> wrote:
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git master
> > > head:   b4b0881156fb8209bf5ef6cb63211bb0ad6e1a6b
> > > commit: 07438779313caafe52ac1a1a6958d735a5938988 alloc_tag: avoid cur=
rent->alloc_tag manipulations when profiling is disabled
> > > date:   5 days ago
> > > config: hexagon-randconfig-r133-20250131 (https://download.01.org/0da=
y-ci/archive/20250131/202501310832.kiAeOt2z-lkp@intel.com/config)
> > > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project =
f28c006a5895fc0e329fe15fead81e37457cb1d1)
> > > reproduce: (https://download.01.org/0day-ci/archive/20250131/20250131=
0832.kiAeOt2z-lkp@intel.com/reproduce)
> >
> > Just saw this report (was on vacation). Will try to figure out what's g=
oing on.
>
> I confirmed that my change at
> https://lore.kernel.org/all/20241226211639.1357704-1-surenb@google.com
> indeed causes this.
> Looks like due to the additional mem_alloc_profiling_enabled() check,
> the compiler considers allocation size as unknown at compile time
> (__builtin_object_size(obj) returns -1) even though both branches of
> that condition make the same exact allocation.
> I tried changing it to:
>
> #define alloc_hooks_tag(_tag, _do_alloc) \
> ({ \
>         typeof(_do_alloc) _res; \
>         struct alloc_tag * __maybe_unused _old; \
>          if (mem_alloc_profiling_enabled()) \
>                 _old =3D alloc_tag_save(_tag); \
>         _res =3D _do_alloc; \
>          if (mem_alloc_profiling_enabled()) \
>                  alloc_tag_restore(_tag, _old); \
>         _res; \
> })
>
> and that fixes the problem, however this would require two static key
> checks... I wonder if there is a way to tell the compiler that both
> branches cause the same result. Let me dig around.

CC'ing Nathan Chancellor, Nick Desaulniers and llvm@lists.linux.dev

Looks like this error happens only with clang version 14 (more
specifically CONFIG_CLANG_VERSION=3D140006). I tested with clang-13,
clang-15 and clang-17 and all of them build this code fine. Same thing
for other archs (clang-14 fails, others don't). I tried hexagon, x86
and arm64.

To fix the build I can add:

#if defined(CONFIG_CC_IS_CLANG) && CONFIG_CLANG_VERSION >=3D 140000 &&
CONFIG_CLANG_VERSION < 150000
// do this the old way
#else
// do this the new way
#endif

but I'm not sure if that's the right fix.

Andrew, while compiler folks investigate this issue, I'll post the
above fix in case we need to deal with this build error urgently.
Thanks,
Suren.

>
> >
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202501310832.kiAeOt2z=
-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > > >> drivers/auxdisplay/panel.c:1454:2: error: call to __compiletime_as=
sert_309 declared with 'error' attribute: BUILD_BUG_ON failed: !__builtin_c=
onstant_p(_dest_len) || _dest_len =3D=3D (size_t)-1
> > >            strtomem_pad(key->u.kbd.release_str, release, '\0');
> > >            ^
> > >    include/linux/string.h:417:2: note: expanded from macro 'strtomem_=
pad'
> > >            BUILD_BUG_ON(!__builtin_constant_p(_dest_len) ||          =
      \
> > >            ^
> > >    include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_B=
UG_ON'
> > >            BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condi=
tion)
> > >            ^
> > >    include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_=
BUG_ON_MSG'
> > >    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), ms=
g)
> > >                                        ^
> > >    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-l=
imit=3D0 to see all)
> > >    include/linux/compiler_types.h:530:2: note: expanded from macro '_=
compiletime_assert'
> > >            __compiletime_assert(condition, msg, prefix, suffix)
> > >            ^
> > >    include/linux/compiler_types.h:523:4: note: expanded from macro '_=
_compiletime_assert'
> > >                            prefix ## suffix();                       =
      \
> > >                            ^
> > >    <scratch space>:127:1: note: expanded from here
> > >    __compiletime_assert_309
> > >    ^
> > >    1 error generated.
> > >
> > >
> > > vim +/error +1454 drivers/auxdisplay/panel.c
> > >
> > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau           =
 2008-11-13  1426
> > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau           =
 2008-11-13  1427  /* tries to bind a key to the signal name <name>. The ke=
y will send the
> > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau           =
 2008-11-13  1428   * strings <press>, <repeat>, <release> for these respec=
tive events.
> > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau           =
 2008-11-13  1429   * Returns the pointer to the new key if ok, NULL if the=
 key could not be bound.
> > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau           =
 2008-11-13  1430   */
> > > 36d2041a3d57b9 drivers/staging/panel/panel.c Peter Huewe             =
 2013-02-15  1431  static struct logical_input *panel_bind_key(const char *=
name, const char *press,
> > > 36d2041a3d57b9 drivers/staging/panel/panel.c Peter Huewe             =
 2013-02-15  1432                                              const char *=
repeat,
> > > 36d2041a3d57b9 drivers/staging/panel/panel.c Peter Huewe             =
 2013-02-15  1433                                              const char *=
release)
> > > 698b1515f03914 drivers/staging/panel/panel.c Willy Tarreau           =
 2008-11-22  1434  {
> > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau           =
 2008-11-13  1435          struct logical_input *key;
> > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau           =
 2008-11-13  1436
> > > fdf4a4948ca8a1 drivers/staging/panel/panel.c Dominique van den Broeck=
 2014-05-21  1437          key =3D kzalloc(sizeof(*key), GFP_KERNEL);
> > > eb073a9bf2b6ed drivers/staging/panel/panel.c Toshiaki Yamane         =
 2012-07-12  1438          if (!key)
> > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau           =
 2008-11-13  1439                  return NULL;
> > > eb073a9bf2b6ed drivers/staging/panel/panel.c Toshiaki Yamane         =
 2012-07-12  1440
> > > 698b1515f03914 drivers/staging/panel/panel.c Willy Tarreau           =
 2008-11-22  1441          if (!input_name2mask(name, &key->mask, &key->val=
ue, &scan_mask_i,
> > > cb46f472cbb08c drivers/staging/panel/panel.c Kulikov Vasiliy         =
 2010-07-12  1442                               &scan_mask_o)) {
> > > cb46f472cbb08c drivers/staging/panel/panel.c Kulikov Vasiliy         =
 2010-07-12  1443                  kfree(key);
> > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau           =
 2008-11-13  1444                  return NULL;
> > > cb46f472cbb08c drivers/staging/panel/panel.c Kulikov Vasiliy         =
 2010-07-12  1445          }
> > > 698b1515f03914 drivers/staging/panel/panel.c Willy Tarreau           =
 2008-11-22  1446
> > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau           =
 2008-11-13  1447          key->type =3D INPUT_TYPE_KBD;
> > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau           =
 2008-11-13  1448          key->state =3D INPUT_ST_LOW;
> > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau           =
 2008-11-13  1449          key->rise_time =3D 1;
> > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau           =
 2008-11-13  1450          key->fall_time =3D 1;
> > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau           =
 2008-11-13  1451
> > > a952abcdaa2211 drivers/auxdisplay/panel.c    Justin Stitt            =
 2023-09-11  1452          strtomem_pad(key->u.kbd.press_str, press, '\0');
> > > a952abcdaa2211 drivers/auxdisplay/panel.c    Justin Stitt            =
 2023-09-11  1453          strtomem_pad(key->u.kbd.repeat_str, repeat, '\0'=
);
> > > a952abcdaa2211 drivers/auxdisplay/panel.c    Justin Stitt            =
 2023-09-11 @1454          strtomem_pad(key->u.kbd.release_str, release, '\=
0');
> > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau           =
 2008-11-13  1455          list_add(&key->list, &logical_inputs);
> > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau           =
 2008-11-13  1456          return key;
> > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau           =
 2008-11-13  1457  }
> > > 7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau           =
 2008-11-13  1458
> > >
> > > :::::: The code at line 1454 was first introduced by commit
> > > :::::: a952abcdaa22116d940ca9cb9253caad1622ae93 auxdisplay: panel: Re=
place deprecated strncpy() with strtomem_pad()
> > >
> > > :::::: TO: Justin Stitt <justinstitt@google.com>
> > > :::::: CC: Kees Cook <keescook@chromium.org>
> > >
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
