Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12621225CF
	for <llvm@lists.linux.dev>; Tue, 19 Dec 2023 16:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vWh5naqU"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-336746a545fso471632f8f.0
        for <llvm@lists.linux.dev>; Tue, 19 Dec 2023 08:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703004435; x=1703609235; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5zHcx7dkVEiF/efxCTuNtIR7mWk9m/p2X8vD2feHuM=;
        b=vWh5naqUuapFD6Uyh13Yllafx50nEjYo51vhIx7Av+eezLqTiwpWT9k+JKBI5vJjIk
         0pltlAnH+F2kLhiXbSr7xMddhYyX0pv+gjKQumHRLJuhwKC8rhRAVYm6SZat5B6n/LRj
         +LcHlLoFFdjP8UkNa3Cg2rmqAz5JlRUbfPUJsmosH4fqY96SXCZ7+YCywe7ixTpGpKyY
         itfCE5blDM6ffyZFN1tlSh+JWCD0zoXXlIP60hYwJ1zIQdrcMCCrWrlLRYRaKgNzdqGL
         ED6vtW1S0sC/uIE4fwvxWV4O5wpBfgMnuXGOiG5EbKc9JvsTsvWLZeQYt33bhTvMvgVl
         yT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703004435; x=1703609235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5zHcx7dkVEiF/efxCTuNtIR7mWk9m/p2X8vD2feHuM=;
        b=l1+/00qHgU03WHSqlEIsxR9zSS4USiutaAlGFs6OuokLHdmnkNZboY6NsmLlyxu3cm
         j2K+vrOdRFhzBgIFsI8xD187nzbKTSbuK7IuqtqZZK/SuFJgMlChDjT8EuV6PJ0AQlV5
         7EqOZ9Vblj+Wyfs5EL4XHH1nHL+r+KJvmmoyiQXEzxRi/2+H0UrsK/QQRSAPWT+7AqjS
         yWtu70LH/2VYwU76R1Bppz/D+qoXTnEcFSnFlPWTfPfGGZi7lPIvYc5yAREr438VxhbY
         8VMv/tzxp00Nqu1llNzdKv+K/qmlUBcTC7gu5pfJFGrGXhum0cc6B5Wzdq173ecAZYlL
         POoA==
X-Gm-Message-State: AOJu0YwOoaX0kPfBSOFn2fjWxiNSoHP245XPfs8k7rJjpW4vdE9Hm2rv
	HnVcgOfRoU0BTMwONpF1r5u65s/hPU76SvtD8tCYZdV9OtsqhUlCzc4=
X-Google-Smtp-Source: AGHT+IEB6Q2g8LHRFKTeYXCUcUVzYrIbfCS0SaIJo6WAyCg8owfEAy5KCGFincyZ4n7AKX4y6E2NV7fA48BKrHj3w+E=
X-Received: by 2002:a5d:564c:0:b0:336:1d85:a87 with SMTP id
 j12-20020a5d564c000000b003361d850a87mr657452wrw.12.1703004434990; Tue, 19 Dec
 2023 08:47:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202312190546.yhWbDA8A-lkp@intel.com> <20231219021954.105864-1-sj@kernel.org>
In-Reply-To: <20231219021954.105864-1-sj@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 19 Dec 2023 08:47:03 -0800
Message-ID: <CAKwvOdkvGTGiWzqEFq=kzqvxSYP5vUj3g9Z-=MZSQROzzSa_dg@mail.gmail.com>
Subject: Re: [sj:damon/next 18/24] mm/damon/sysfs.c:96:30: error: 'counted_by'
 only applies to C99 flexible array members
To: SeongJae Park <sj@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	damon@lists.linux.dev, Kees Cook <keescook@chromium.org>, 
	Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2023 at 6:20=E2=80=AFPM SeongJae Park <sj@kernel.org> wrote=
:
>
> Hello,
>
> On Tue, 19 Dec 2023 05:30:54 +0800 kernel test robot <lkp@intel.com> wrot=
e:
>
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git da=
mon/next
> > head:   04cc9f72453632bf9e13e06f85c11147583e5d5d
> > commit: 375af4a6e206c1aeb2edb1d80cbb42fd3349b287 [18/24] mm/damon/sysfs=
: add __counted_by() annotation
> > config: arm-randconfig-001-20231219 (https://download.01.org/0day-ci/ar=
chive/20231219/202312190546.yhWbDA8A-lkp@intel.com/config)
> > compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project=
 5ac12951b4e9bbfcc5791282d0961ec2b65575e9)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20231219/202312190546.yhWbDA8A-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202312190546.yhWbDA8A-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> mm/damon/sysfs.c:96:30: error: 'counted_by' only applies to C99 flex=
ible array members
> >       96 |         struct damon_sysfs_region **regions_arr __counted_by=
(nr);
> >          |                                     ^~~~~~~~~~~
> >    mm/damon/sysfs.c:292:30: error: 'counted_by' only applies to C99 fle=
xible array members
> >      292 |         struct damon_sysfs_target **targets_arr __counted_by=
(nr);
> >          |                                     ^~~~~~~~~~~
> >    mm/damon/sysfs.c:815:31: error: 'counted_by' only applies to C99 fle=
xible array members
> >      815 |         struct damon_sysfs_context **contexts_arr __counted_=
by(nr);
> >          |                                      ^~~~~~~~~~~~
> >    mm/damon/sysfs.c:1666:31: error: 'counted_by' only applies to C99 fl=
exible array members
> >     1666 |         struct damon_sysfs_kdamond **kdamonds_arr __counted_=
by(nr);
> >          |                                      ^~~~~~~~~~~~
> >    4 errors generated.
> >
> >
> > vim +/counted_by +96 mm/damon/sysfs.c
> >
> >     89
> >     90        /*
> >     91         * init_regions directory
> >     92         */
> >     93
> >     94        struct damon_sysfs_regions {
> >     95                struct kobject kobj;
> >   > 96                struct damon_sysfs_region **regions_arr __counted=
_by(nr);
> >     97                int nr;
> >     98        };
> >     99
>
> Thank you for this report.  I will remove the commit from the tree.

Being able to annotate pointers with this attribute is in the works
(but is not ready yet). Thanks for thinking of this and trying it out
though! Consider adding a todo to add such attribute in the future!


--=20
Thanks,
~Nick Desaulniers
