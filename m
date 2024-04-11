Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9443C13DDD6;
	Thu, 11 Apr 2024 11:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712833911; cv=none; b=kBI4wiaZ8WRks2nXT+1Ckh1gjlSBVxg3aTvfFMPigoRNIHEviBB7leEB/a3xDf23Jt5JpvWiv84BOKYpdcXhecPO1FMwni9Pe7lM24m7T5brk3D2GvvRypmzMdQ8HWh4js9HWusZaOmGmYDPNkwxMa5fWyEUorHd2izIkBbAwJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712833911; c=relaxed/simple;
	bh=NNMOw5K7qDhqQMIweemH0TcaZfDyuDV43zY1PSpfhTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQG8LKwDE0GxRkUpthrt56/ZpZErka+CYd7sxHLwQqqG+1vNdPCKCRY17mUBKlhDfxvtjAEMvqy4/JHqy5wIHh/8dcqHzxrqYsD6LQLr4AnpjZxEZcK9ldvCj10T79kTXuSKBB6BcflVe3FCUD+NW0NKgrfZmzBmMK+yb9ooW4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYJbMn2F; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYJbMn2F"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-516d727074eso7540142e87.0;
        Thu, 11 Apr 2024 04:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712833907; x=1713438707; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVX2Rku0op9HbvUf12NiG6RKbMKdh5Sl/4FiL3iEucI=;
        b=QYJbMn2F44YNCBxgijngvmOuJjx9XtgvkFVOlbjE0JzFiTEI3ShqCK3jbpxbt0j8aD
         GSxBe/EsRWVpBilHiJlqI8mnTYsBpxhepi1nYMxHIxujohabYIssTqw0J6YlCfXcMGam
         G8LqvkFp8cCluOrvwwQ9wbU2l75rUhYW9BVpbAC7O3WEgoC+vZF/K8IKWwNKg58uyH/C
         hNKXthoEfAF5J59PYy9F2tua6TGnOPS4fEM4VlSbCh2J55+dxNdy6TJj9nUoZ2JpHLjt
         XZnZvC1ClaV0kXU45IkhGEPbnc/UXOGHqSpHC8jM27gPafRvRKlkR1uwrN/1AXxQungA
         TYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712833907; x=1713438707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aVX2Rku0op9HbvUf12NiG6RKbMKdh5Sl/4FiL3iEucI=;
        b=Esx23LmZJlckpneIlNZU7rgDCF/BeTV+SK+ZDbOLOFfqQN8IGNzHqwYQuVkNoMMM8R
         cV6wuZgxFJ2Q9bYHpZRP+MyiAh80e1lFdZrDiKd5hD/3UcZCV7p206NqE7LWnQvxZ6rS
         5MS3VvAGLBI7tjR4WVc1lO14mJdqFrrmZmkmrNUhbtoLjKxP9IbTffyoQpWTDcV8Yl1T
         0PQ1zxZH3oY9KCgd65c73P36uuiDcYKdtFjqVzPTk6fanBIoQlfO2pgk9m96cOwNqbrN
         lPltfhyCGa3TRLBB2baAEntaw/Os4l3/XGhwa9CSMC863KL2THbq1AXUzN9XgVzVTm/V
         vUzw==
X-Forwarded-Encrypted: i=1; AJvYcCU4TOiBvesZaIrjcZguloX/TsDGaHODziGW9Xc0eHzrLqL05b6lEcCHG/kLuarRAe2mcX4YULHq/7X4oAzgMEFNNwZk/0J0KzHHoMANmICAgQJIaJh444SXwjGwigp2WEyL7nw=
X-Gm-Message-State: AOJu0YyxSCXTOO/R6mqHRpnOC/2mdDTPSPv01ek8ETlgxQ9zuS04vDcF
	ed/DsMXNuM/KN6dIuelfbbhjqBLEP8lDnTEk3VkhjZGIJ7j+vOW4WPRsntL0Ql0SWLEoFFEktIB
	vSGN4RDc25QNhma+2TgqxbbIlj0s=
X-Google-Smtp-Source: AGHT+IGRQW+vHNKuaELQHfwWtIpsnvir9wmGHAduR+Bcyc9rEe02Na9Ngx1LWF1ZWrLLoJZ2IA/1qj46i5J2kMIMuGM=
X-Received: by 2002:a19:8c1e:0:b0:517:5ee6:4f56 with SMTP id
 o30-20020a198c1e000000b005175ee64f56mr3073451lfd.8.1712833907223; Thu, 11 Apr
 2024 04:11:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202404111834.XUWxYckr-lkp@intel.com>
In-Reply-To: <202404111834.XUWxYckr-lkp@intel.com>
From: Chuanhua Han <chuanhuahan@gmail.com>
Date: Thu, 11 Apr 2024 19:11:35 +0800
Message-ID: <CANzGp4+M2LewamPmpdYNng4QOL3=PDHY9APwwexRLAHY0npe8w@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable 360/372] ld.lld: error: duplicate symbol: swap_free_nr
To: kernel test robot <lkp@intel.com>
Cc: Chuanhua Han <hanchuanhua@oppo.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Barry Song <v-songbaohua@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

kernel test robot <lkp@intel.com> =E4=BA=8E2024=E5=B9=B44=E6=9C=8811=E6=97=
=A5=E5=91=A8=E5=9B=9B 18:32=E5=86=99=E9=81=93=EF=BC=9A
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-un=
stable
> head:   de14d5f2a9ff2df737a01575ee95bc5a35f5853d
> commit: ca23b4d4cae5d32a9d22fb3c39550dcf43df83f9 [360/372] mm: swap: intr=
oduce swap_free_nr() for batched swap_free()
> config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240411=
/202404111834.XUWxYckr-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8=
b3b4a92adee40483c27f26c478a384cd69c6f05)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240411/202404111834.XUWxYckr-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404111834.XUWxYckr-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: duplicate symbol: swap_free_nr
>    >>> defined at main.c
>    >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
>    >>> defined at vsprintf.c
>    >>>            vsprintf.o:(.text+0x1) in archive lib/lib.a
> --
> >> ld.lld: error: duplicate symbol: swap_free_nr
>    >>> defined at main.c
>    >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
>    >>> defined at platform.c
>    >>>            drivers/of/platform.o:(.text+0x1) in archive vmlinux.a
> --
> >> ld.lld: error: duplicate symbol: swap_free_nr
>    >>> defined at main.c
>    >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
>    >>> defined at bdev.c
>    >>>            block/bdev.o:(.text+0x1) in archive vmlinux.a
> --
> >> ld.lld: error: duplicate symbol: swap_free_nr
>    >>> defined at main.c
>    >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
>    >>> defined at commoncap.c
>    >>>            security/commoncap.o:(.text+0x1) in archive vmlinux.a
> --
> >> ld.lld: error: duplicate symbol: swap_free_nr
>    >>> defined at main.c
>    >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
>    >>> defined at meminfo.c
>    >>>            fs/proc/meminfo.o:(.text+0x1) in archive vmlinux.a
> --
> >> ld.lld: error: duplicate symbol: swap_free_nr
>    >>> defined at main.c
>    >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
>    >>> defined at array.c
>    >>>            fs/proc/array.o:(.text+0x1) in archive vmlinux.a
> --
> >> ld.lld: error: duplicate symbol: swap_free_nr
>    >>> defined at main.c
>    >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
>    >>> defined at base.c
>    >>>            fs/proc/base.o:(.text+0x1) in archive vmlinux.a
> --
> >> ld.lld: error: duplicate symbol: swap_free_nr
>    >>> defined at main.c
>    >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
>    >>> defined at nommu.c
>    >>>            fs/proc/nommu.o:(.text+0x1) in archive vmlinux.a
> --
> >> ld.lld: error: duplicate symbol: swap_free_nr
>    >>> defined at main.c
>    >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
>    >>> defined at buffered-io.c
>    >>>            fs/iomap/buffered-io.o:(.text+0x1) in archive vmlinux.a
> --
> >> ld.lld: error: duplicate symbol: swap_free_nr
>    >>> defined at main.c
>    >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
>    >>> defined at drop_caches.c
>    >>>            fs/drop_caches.o:(.text+0x1) in archive vmlinux.a
> --
> >> ld.lld: error: duplicate symbol: swap_free_nr
>    >>> defined at main.c
>    >>>            init/main.o:(swap_free_nr) in archive vmlinux.a
>    >>> defined at coredump.c
>    >>>            fs/coredump.o:(.text+0x1) in archive vmlinux.a
> ..
>

Hi,
thank you!

SeongJae reported this and fixed it with a patch here:
https://lore.kernel.org/linux-mm/20240410233759.274907-1-sj@kernel.org/

Can you please test it?

> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>


--=20
Thanks,
Chuanhua
