Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABD313C666;
	Thu, 11 Apr 2024 04:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712810177; cv=none; b=h40Nul5wUazFdOIZibTd81iLPL6tYnlmpQdUQvqNfpushz6BAwVFRWqXOMO358by0zm9f+UA/p6ORCbT4Xlo0LtHYi039pvN3S+YtUmgooSXXPnBn8Je0cqxlk51uE67h9qx73cB9an1boGR5YaXAioUX6svv8w3ax0uVJOVaZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712810177; c=relaxed/simple;
	bh=1Sd4UId+t0Qmr4yX+AXXSHUBrK7/jUf5TFaitYa8wmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rBkUu453MYi5RpfEdNqyTOemd0Njx9dT7SSbY22qNzwCXKa6nLPC/rLqXmJhKk3SAZKDBl4xlQcjR8GmtkbXUCiQ47lXkkbeDS86lkXAIaVRmpv75+iA3XYCU94ZaNwN02VW4+kD9+HaCF/SRjTWNrPPlbKHuUa9SBai7gIyxD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDemdMv1; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDemdMv1"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-4dae8b2d29bso1228941e0c.0;
        Wed, 10 Apr 2024 21:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712810173; x=1713414973; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Le7Y4BNvSiXzkm5ieez1VGt+rIBFDmuOI1Z1lq3tsx8=;
        b=XDemdMv1hlldFeeohdjgoHZpVBKnuD00rv94oHGbMOj20tk32cZdTxMwX3PcKDPcAX
         qw99MBFGkI3NUpY/Dm+gMCux7BceZIG0Qi/jUeJz9xZRnbMURYwlB2qbWOiyY+w6p9Y7
         Mdu3ZLg66QuPBHrc1poUP+5nBu5n4VpeUOdvfLALnVVAN/Fyr/VVqxdgqxHyfsfU27NH
         hARiuXJediKPHFWgijOzjcd0eWRih8iHiYotybFEjGlQo1QfgvuuS56t2k284ixgPK0I
         OTxbYmtgzBW/m8/dkg5oDVmJcbXhNXQgB6EHzzcAndlgaQfC6f+IEVZ6PFf03rqniYLb
         vlYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712810173; x=1713414973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Le7Y4BNvSiXzkm5ieez1VGt+rIBFDmuOI1Z1lq3tsx8=;
        b=cwOANvnBotTHCs/jIXBL77yS1nC/TAkAQGz/kQeWRgXwVzvolzoRIZkzknW5isr59b
         gWvqWrAxD258Yr//4jDwZ48ircwYdDxW/tC8nnwaz/nxc/yuQbNAJ9va/c9U7pLdDAzb
         VmQtQ2dUt6uVmwc+rQ+rLw9FMm6XHuLDN67A0PaL47eEMz4myasK1xE5XM2ZiQIRWDFU
         tMBeH8lriLAthEUGSQnqg7M7EN5h6P2Qb1pIigMzx7Q83DeshhHsgi7sSz+QHPsYF8Bn
         82+fFfoHp+rzA8kncmnUJ8R5U1ZpnNJI9/89XvzEGLNGqjQoUdE3lrt8X+qLTxoBbDnJ
         YRKA==
X-Forwarded-Encrypted: i=1; AJvYcCVmeIm07GOQYGVmnji3HoltM1BIrd2udccWclxCgNsUaCLdmyBbzPr72th4YVsmlA3c4ayRzhtLqXHZVKOvsVZ+xu4anCq10PhXYahKyXdxFJK/xYRxEqJ+SadFufORNRDhANM=
X-Gm-Message-State: AOJu0YxlbkR8zYB+L92kcsfEV4YijPCtQ/3DF9iDpr3sxwbecCU3GPQv
	lO4O94DZA9UcPsM5WSoKfIQz+S2DwmGsBMlmLM4yuyiB69PWEHpJXCja2GU8Y/j02Y2T2GXp3qy
	16ibKMjon28cUsZUT9t9ABDlmo5s=
X-Google-Smtp-Source: AGHT+IGRPvfH9plkp5Z/5FyHXCz/cq958bVxU8UQ5KKJyGBuCdLEKaRC75gExVnl1qd1KQHIpPtq9bc3S+aHw/hxCFU=
X-Received: by 2002:a05:6122:8cb:b0:4d8:7222:b6da with SMTP id
 11-20020a05612208cb00b004d87222b6damr5423328vkg.6.1712810172105; Wed, 10 Apr
 2024 21:36:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202404111223.DDjEQDHj-lkp@intel.com>
In-Reply-To: <202404111223.DDjEQDHj-lkp@intel.com>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 11 Apr 2024 16:36:00 +1200
Message-ID: <CAGsJ_4zsuBymrGuHcJZQH=U4PEftQtN0z83hQvUUioJuz26R_w@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable 360/372] include/linux/swap.h:565:6:
 warning: no previous prototype for function 'swap_free_nr'
To: kernel test robot <lkp@intel.com>
Cc: Chuanhua Han <hanchuanhua@oppo.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Barry Song <v-songbaohua@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 4:27=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-un=
stable
> head:   de14d5f2a9ff2df737a01575ee95bc5a35f5853d
> commit: ca23b4d4cae5d32a9d22fb3c39550dcf43df83f9 [360/372] mm: swap: intr=
oduce swap_free_nr() for batched swap_free()
> config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240=
411/202404111223.DDjEQDHj-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009=
708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240411/202404111223.DDjEQDHj-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404111223.DDjEQDHj-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In file included from arch/x86/kernel/asm-offsets.c:14:
>    In file included from include/linux/suspend.h:5:
> >> include/linux/swap.h:565:6: warning: no previous prototype for functio=
n 'swap_free_nr' [-Wmissing-prototypes]
>      565 | void swap_free_nr(swp_entry_t entry, int nr_pages)
>          |      ^
>    include/linux/swap.h:565:1: note: declare 'static' if the function is =
not intended to be used outside of this translation unit
>      565 | void swap_free_nr(swp_entry_t entry, int nr_pages)
>          | ^
>          | static
>    1 warning generated.
> --
>    In file included from arch/x86/kernel/reboot.c:33:
>    In file included from arch/x86/include/asm/efi.h:7:
>    In file included from arch/x86/include/asm/tlb.h:8:
>    In file included from include/asm-generic/tlb.h:15:
> >> include/linux/swap.h:565:6: warning: no previous prototype for functio=
n 'swap_free_nr' [-Wmissing-prototypes]
>      565 | void swap_free_nr(swp_entry_t entry, int nr_pages)
>          |      ^
>    include/linux/swap.h:565:1: note: declare 'static' if the function is =
not intended to be used outside of this translation unit
>      565 | void swap_free_nr(swp_entry_t entry, int nr_pages)
>          | ^
>          | static
>    arch/x86/kernel/reboot.c:972:20: warning: unused function 'nmi_shootdo=
wn_cpus_on_restart' [-Wunused-function]
>      972 | static inline void nmi_shootdown_cpus_on_restart(void) { }
>          |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    2 warnings generated.
> --
>    In file included from arch/x86/kernel/asm-offsets.c:14:
>    In file included from include/linux/suspend.h:5:
> >> include/linux/swap.h:565:6: warning: no previous prototype for functio=
n 'swap_free_nr' [-Wmissing-prototypes]
>      565 | void swap_free_nr(swp_entry_t entry, int nr_pages)
>          |      ^
>    include/linux/swap.h:565:1: note: declare 'static' if the function is =
not intended to be used outside of this translation unit
>      565 | void swap_free_nr(swp_entry_t entry, int nr_pages)
>          | ^
>          | static
>    1 warning generated.
>
>
> vim +/swap_free_nr +565 include/linux/swap.h
>
>    564
>  > 565  void swap_free_nr(swp_entry_t entry, int nr_pages)
>    566  {
>    567  }
>    568

Hi,
thank you!

SeongJae reported this and fixed it with a patch here:
https://lore.kernel.org/linux-mm/20240410233759.274907-1-sj@kernel.org/

Can you please test it?

 >
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
