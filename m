Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D682581;
	Fri, 12 Apr 2024 02:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712890603; cv=none; b=W0Wdp1xZrvfyKqI4a32udGJmOu4d/rafryWIDUj2iUZDFfQOphmGnWQrnKv/jFm2M7uazALC5KViV7/YuQtO5gKYA1Xxd3isMGhFiVT5yNE4TE69LBmaFk8RqquQr8NfC0/7sBvR+CoMD35mNrnhXwVMRY59M56dQA2VN9ExTuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712890603; c=relaxed/simple;
	bh=EuDvzHqrqGddsM82Gi7I4zj4/4ancDK6s+w3NpsAzC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IDPq7mEZASzs4jM9+j7CcKaD5etNJF2YATkv22QdArIlbgJ/9sXznk9bvUsU2AdUkhfBGYCgUdqxc/pRDc9jHAD2Y5NHUcGnqMaPrfgbTcuaEwuq8uO3EX5HMVFdt4tMD/osv1pD+vG6zSfecqf1HlwS731yW+WlMYn4tYhgKtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIQ911QH; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIQ911QH"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d6ff0422a2so4716481fa.2;
        Thu, 11 Apr 2024 19:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712890600; x=1713495400; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=os7JmNRruZW2MDodBO9syk7Nro2BYIrH265H1PxptGU=;
        b=jIQ911QHw/epOJkPhgFLuEY0B/slpRis4D7xXgdHc8Mh6ob98Jj7eDg8Eo7dKTZQxN
         9IwM733kimk8K4wsKL9dbikJ/2Hf6nIzTK4F2+FHjEwVF9rP8oTOw5/Rq/K7inOHcw2y
         U8+sNAkMSc/toVyCPXV+eJXifb/VgQjEonRT6WFDfNl3QgGtDILdVO02fOC0jbmtTydC
         jQlEsQ9CgsqG8o4f2llWTaiQxRNxrL+d9Gy7I668LZyEOBEpDqH+ZCo/yVGjpGSafrYD
         MUP/kjDnhoaxjJyMKtribr10Stgh60Wj7YEr+PU7Q75U5A0scbCW5ghpNcoDH5xP4G2R
         s3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712890600; x=1713495400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=os7JmNRruZW2MDodBO9syk7Nro2BYIrH265H1PxptGU=;
        b=lm253ZgNKitp5y1ErrWnZLXL3X8f5toNyRrpkmBlJ7N9shPiQB/IiJ5U3KL/dDG+aL
         RHkEgMnLTrUnrnFwAkbh+GulXjZBJ782o0hdYRrJS2QZ/DuA/HYbVsawBt79cMj9R8zo
         ie2JHxS/ucEhC+D0qN367VeGhsMKVduvysOm3/aDvIVK3bfxCAdNvOaV7R17qag+t4FC
         vA9sjz/tn1frYbmpJsmwBCNs89Y1gycGamwcmXr2Ju8FIxB6EIgdSd8oDMIpxiSUZ/rX
         LkjfU9brqVaTX7tOtAot4oLqoIpPwU9fhB21jGooDQnFlcEfYBH+mwlNffvQW0gLa3fQ
         e9oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJE06R/2TdLbtai0R+B0BOxlasPqoMdS1/GDPiAe3WR8PB4ygg+okzZGdKX7XX1Aw8+oxzmhSKho8qPJB1mbeGLIznMrd7WJmvavVB/50QitgpWGSu/9Ybq/mlWmg68xF5Ea0=
X-Gm-Message-State: AOJu0YwNF0lAo4RqVA7cXnjInu94B4FpKKEkfJoqqkhzHdVIz7lIO/Hk
	Hr1eaGvxdc3AGV6THEXbvN99ITjP0MCeD2iQQa5SNVhdS5I6DX8utO4R7DHBQXyPgZostJpvNcr
	cW0hhDDm2Hahys8/GTagtxkQsi7s=
X-Google-Smtp-Source: AGHT+IGxTJSBMGowKB1UBWmE9rdPrxWRzsUa7S1R/JtB2fw2EKYZU3T3AD9I5kE5VROwkw/SBJ4JXUCq/zeOOnmOvQ4=
X-Received: by 2002:a2e:b608:0:b0:2d6:a5f6:c8d3 with SMTP id
 r8-20020a2eb608000000b002d6a5f6c8d3mr588194ljn.27.1712890599785; Thu, 11 Apr
 2024 19:56:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202404111834.XUWxYckr-lkp@intel.com> <CANzGp4+M2LewamPmpdYNng4QOL3=PDHY9APwwexRLAHY0npe8w@mail.gmail.com>
 <aabc4a544ca716166b956810dd164b870ad756df.camel@intel.com>
In-Reply-To: <aabc4a544ca716166b956810dd164b870ad756df.camel@intel.com>
From: Chuanhua Han <chuanhuahan@gmail.com>
Date: Fri, 12 Apr 2024 10:56:28 +0800
Message-ID: <CANzGp4LUBMt0A7VMh2thb++m3xenh3Ma73KKWcZd1KFJ1cvTyg@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable 360/372] ld.lld: error: duplicate symbol: swap_free_nr
To: "Liu, Yujie" <yujie.liu@intel.com>
Cc: lkp <lkp@intel.com>, "v-songbaohua@oppo.com" <v-songbaohua@oppo.com>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "hanchuanhua@oppo.com" <hanchuanhua@oppo.com>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Liu, Yujie <yujie.liu@intel.com> =E4=BA=8E2024=E5=B9=B44=E6=9C=8812=E6=97=
=A5=E5=91=A8=E4=BA=94 10:48=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 2024-04-11 at 19:11 +0800, Chuanhua Han wrote:
> > kernel test robot <lkp@intel.com> =E4=BA=8E2024=E5=B9=B44=E6=9C=8811=E6=
=97=A5=E5=91=A8=E5=9B=9B 18:32=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git m=
m-unstable
> > > head:   de14d5f2a9ff2df737a01575ee95bc5a35f5853d
> > > commit: ca23b4d4cae5d32a9d22fb3c39550dcf43df83f9 [360/372] mm: swap: =
introduce swap_free_nr() for batched swap_free()
> > > config: arm-allnoconfig (https://download.01.org/0day-ci/archive/2024=
0411/202404111834.XUWxYckr-lkp@intel.com/config)
> > > compiler: clang version 19.0.0git (https://github.com/llvm/llvm-proje=
ct 8b3b4a92adee40483c27f26c478a384cd69c6f05)
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20240411/202404111834.XUWxYckr-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Closes: https://lore.kernel.org/oe-kbuild-all/202404111834.XUWxYckr=
-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > > > > ld.lld: error: duplicate symbol: swap_free_nr
> > >    >>> defined at main.c
> > >    >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
> > >    >>> defined at vsprintf.c
> > >    >>>            vsprintf.o:(.text+0x1) in archive lib/lib.a
> > > --
> > > > > ld.lld: error: duplicate symbol: swap_free_nr
> > >    >>> defined at main.c
> > >    >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
> > >    >>> defined at platform.c
> > >    >>>            drivers/of/platform.o:(.text+0x1) in archive vmlinu=
x.a
> > > --
> > > > > ld.lld: error: duplicate symbol: swap_free_nr
> > >    >>> defined at main.c
> > >    >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
> > >    >>> defined at bdev.c
> > >    >>>            block/bdev.o:(.text+0x1) in archive vmlinux.a
> > > --
> > > > > ld.lld: error: duplicate symbol: swap_free_nr
> > >    >>> defined at main.c
> > >    >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
> > >    >>> defined at commoncap.c
> > >    >>>            security/commoncap.o:(.text+0x1) in archive vmlinux=
.a
> > > --
> > > > > ld.lld: error: duplicate symbol: swap_free_nr
> > >    >>> defined at main.c
> > >    >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
> > >    >>> defined at meminfo.c
> > >    >>>            fs/proc/meminfo.o:(.text+0x1) in archive vmlinux.a
> > > --
> > > > > ld.lld: error: duplicate symbol: swap_free_nr
> > >    >>> defined at main.c
> > >    >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
> > >    >>> defined at array.c
> > >    >>>            fs/proc/array.o:(.text+0x1) in archive vmlinux.a
> > > --
> > > > > ld.lld: error: duplicate symbol: swap_free_nr
> > >    >>> defined at main.c
> > >    >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
> > >    >>> defined at base.c
> > >    >>>            fs/proc/base.o:(.text+0x1) in archive vmlinux.a
> > > --
> > > > > ld.lld: error: duplicate symbol: swap_free_nr
> > >    >>> defined at main.c
> > >    >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
> > >    >>> defined at nommu.c
> > >    >>>            fs/proc/nommu.o:(.text+0x1) in archive vmlinux.a
> > > --
> > > > > ld.lld: error: duplicate symbol: swap_free_nr
> > >    >>> defined at main.c
> > >    >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
> > >    >>> defined at buffered-io.c
> > >    >>>            fs/iomap/buffered-io.o:(.text+0x1) in archive vmlin=
ux.a
> > > --
> > > > > ld.lld: error: duplicate symbol: swap_free_nr
> > >    >>> defined at main.c
> > >    >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
> > >    >>> defined at drop_caches.c
> > >    >>>            fs/drop_caches.o:(.text+0x1) in archive vmlinux.a
> > > --
> > > > > ld.lld: error: duplicate symbol: swap_free_nr
> > >    >>> defined at main.c
> > >    >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
> > >    >>> defined at coredump.c
> > >    >>>            fs/coredump.o:(.text+0x1) in archive vmlinux.a
> > > ..
> > >
> >
> > Hi,
> > thank you!
> >
> > SeongJae reported this and fixed it with a patch here:
> > https://lore.kernel.org/linux-mm/20240410233759.274907-1-sj@kernel.org/
> >
> > Can you please test it?
>
> We tested the patch in the link above, and confirmed it fixes the build
> issue in this report.
>
> Tested-by: Yujie Liu <yujie.liu@intel.com>
Nice, thank you for your test :)
>
> Thanks
>
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
> > >
> >
> >
>


--=20
Thanks,
Chuanhua
