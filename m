Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9A6318EDC
	for <llvm@lists.linux.dev>; Mon, 11 May 2026 05:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778478233; cv=none; b=Sbceuvilc8+9TUEZ6xQfJmMV4OQ1PW1Zyfv/u2dHwj2kK7sU+nQ8fLs6D96qDUd370rZN3wnIL9YppogZs4t5quzmy7xlQLaudyRz0R+Mo2VpAOWtyQ3wXBUWqjaZTUMh4tDysXYiG/cg4vvnKC5fA8Wo4H41u5MB7tWq/4Alxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778478233; c=relaxed/simple;
	bh=fzEx3JNkK7OcxRPY5Wj1PtbRVfgdEii7o2DmZ/V6Xbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tdxuR0U2K3aA+NirIjtvAKH+MSV2bCj72R5DQLL6gh6Wipya9y6nyMIB3/Z8p7uIHRtBA0xznHV6YL8UeN1kmJu/prh4mPXJjuyWBz50zOldkk8+DLa9PgACGK++tQun+77V6ftpyWrjV6nM0DBErWsGiLd6OTk5LJTpn3/AbZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=roAs8z8h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="roAs8z8h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2046CC2BCB0
	for <llvm@lists.linux.dev>; Mon, 11 May 2026 05:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778478233;
	bh=fzEx3JNkK7OcxRPY5Wj1PtbRVfgdEii7o2DmZ/V6Xbs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=roAs8z8h8jeeX321euQBI0dkJRKIOfR3oMKKV93hn9nZdp6Quk3BSbpU2HM4ECs1D
	 RXHvyVjuad2ZYg3hQxcpXzxCJaE3VXJFFR7voWmje4P21jhOaTrTlFudWbe/j5Ciwc
	 xAMgRSNBAZl7U5LmabHm9l7nDueCQwBpOy8d+igfREmUNheBScPDc3Jehih+TIiY4Y
	 jN4WkSMn4xhZCUo6nStn2VZjGcmijxSWjtoAyFApmTK0/Pu24jgtBoyfLNZklO7fVP
	 lPcvOZM7Hktu79nfFdJr1359pafYyxtyhskl5/bF4crYaJ5EpYwTYQTGbBScEARPRo
	 2Y6wz/1AXfA1Q==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38e7c3a2deaso32221571fa.2
        for <llvm@lists.linux.dev>; Sun, 10 May 2026 22:43:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/6x6oWdrV60pGi3k0IvFX/B3057sM7wzfeT+cU4Rx1e+Tu2hREgOhvB/oUyKBC1B+qPspo@lists.linux.dev
X-Gm-Message-State: AOJu0Yw40azl/l+z2MLaWlRRUvCuvF6JH1PNs0HcIuWEZaFyqkpAV7cV
	eym1/ZwMiSGgQUa1jKX321Uw0SgWq9KsGulZRfQbEOSJ0SJwV9a5zDnl0lGRYH2rhHpxoNMVGp9
	kyrilNx612a5Vfg0csaxp64VPHRpCs1g=
X-Received: by 2002:a2e:8e6f:0:b0:38d:e744:8663 with SMTP id
 38308e7fff4ca-393c4210887mr46871401fa.26.1778478231455; Sun, 10 May 2026
 22:43:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202605111200.am4cLJ4C-lkp@intel.com>
In-Reply-To: <202605111200.am4cLJ4C-lkp@intel.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 11 May 2026 13:43:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v64UkRiF4rdA7RC+C-nYjo7aKb8-k5khJncZMnNXr7tjfw@mail.gmail.com>
X-Gm-Features: AVHnY4JeEfN8EoEEkhpY1E-qaspIAms16DUjRx9I-Fqnhiwc6bu7EGcSYxonYbY
Message-ID: <CAGb2v64UkRiF4rdA7RC+C-nYjo7aKb8-k5khJncZMnNXr7tjfw@mail.gmail.com>
Subject: Re: [sunxi:sunxi/dt-for-7.2 2/4] FATAL ERROR: Syntax error parsing
 input tree
To: kernel test robot <lkp@intel.com>
Cc: Michal Piekos <michal.piekos@mmpsystems.pl>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 12:09=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git s=
unxi/dt-for-7.2
> head:   c6895beaf5eab889ebdaffeb6210ad1111f3e72e
> commit: 7c86694a7b8c9a0b2e29b312b21fcaf61d54b474 [2/4] riscv: dts: allwin=
ner: d1s-t113: add hstimer node
> config: riscv-defconfig (https://download.01.org/0day-ci/archive/20260511=
/202605111200.am4cLJ4C-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5=
bac06718f502014fade905512f1d26d578a18f3)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260511/202605111200.am4cLJ4C-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605111200.am4cLJ4C-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    Lexical error: arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi:301.1=
8-25 Unexpected 'GIC_SPI'
>    Lexical error: arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi:302.1=
1-18 Unexpected 'GIC_SPI'
> >> FATAL ERROR: Syntax error parsing input tree

Sorry for the breakage. This is now fixed up in the sunxi tree.

ChenYu

> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
