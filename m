Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD0C1B7F4
	for <llvm@lists.linux.dev>; Sat, 14 Feb 2026 17:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771089031; cv=none; b=qEnuUT3rmaT+AfPsvyJKjEtESKhUXxVw9Hl91jx5lLjzT+05w38eykPhvX0/DgzE3fJetv/ePFM/xoqltzsogZV0VSUUw7ZuMt1biW30gs6euWWB1TMBsIKD2dCruMufRV0DZU4/5tsfMku7XL5BBQ2kTdC/MotMn+YTbaZ3Dyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771089031; c=relaxed/simple;
	bh=vNj2Cl497tl7JUutr4WbGWbH8FHNgXU/T1j9z7DicG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AuhP656GSovc6sd2bzVIzYtbrqv4aohapu0OPnvLO/rS674D1zTNm1InBK1cubWydYg/tj64FPuKH8NsQy/Gycgx8OEcGie4SHpiklFGnL1RRPX2uuOA41SYwQVqTAWmiX5vhbjlDXrrJO0sHQ1/7GUhT5uzL0gcVNtzANkQSvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VYXI0xOo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VYXI0xOo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F70DC16AAE
	for <llvm@lists.linux.dev>; Sat, 14 Feb 2026 17:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771089031;
	bh=vNj2Cl497tl7JUutr4WbGWbH8FHNgXU/T1j9z7DicG4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VYXI0xOocCSbJ0D8TjmQO5TdU/LWlIojS9m79aZsDk6cMncoUmI+DKgzR2dNbf+ZC
	 A+Vq96wit+ariVX+byUs9WfM20kcE1gRrM1C/T3DZgIKlLZeX1tRwRy306e+h/aeNJ
	 ULSLrum8ZP6TuuWNWJ0eVsNnjPNDPZ2g/KYI1wEcgcF7t9sgtP8lJ0JcujB2qrR9mT
	 9QLZmbFMdewbqi6QvLEVjJ1JhyUXbsUsySaDW2uhdPcbg+9ehgkkMNqXJGdv+GRaIT
	 FCHFjiPl2PmFQJjRXoWUcVYUJgTMF3nNKHFJpwEQYk7BeEsWvjqJVTLO3NiFssFNl0
	 QrhYN/K2ltx6g==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64ada2c30a1so1852337d50.0
        for <llvm@lists.linux.dev>; Sat, 14 Feb 2026 09:10:31 -0800 (PST)
X-Gm-Message-State: AOJu0YxNuL+ST//O440syo8zT3vf1IKVg7i04cz/hgpXpfKIzr/nxq/D
	Rfc+sAS8GLeg+ZZETr/ZjO4G49NDhVz5s9NRZPjja8JrJbj2wIHXXEd+EnsEccwzCanySqOI9TK
	O3e44t0+p47uxR6yGnvRTsFrOz02G1iA=
X-Received: by 2002:a05:690e:d4e:b0:649:ec59:726c with SMTP id
 956f58d0204a3-64c197ae855mr5024321d50.21.1771089030392; Sat, 14 Feb 2026
 09:10:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202602142051.bzpo4KnU-lkp@intel.com>
In-Reply-To: <202602142051.bzpo4KnU-lkp@intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 14 Feb 2026 18:10:19 +0100
X-Gmail-Original-Message-ID: <CAD++jLmmnNP-x80wT5HGTar0VghXZxsU_kYdcsvZH2nkbtp2sA@mail.gmail.com>
X-Gm-Features: AaiRm53yv5kV7GXyVXmNTFyw-Khswm9x0DSyWABtFBB7bPq-ax7mPkMES0RWrcg
Message-ID: <CAD++jLmmnNP-x80wT5HGTar0VghXZxsU_kYdcsvZH2nkbtp2sA@mail.gmail.com>
Subject: Re: [arm-integrator:b4/aarch64-clear-pages 2/2] make[7]: *** No rule
 to make target 'arch/arm64/kvm/hyp/nvhe/../../../lib/clear_page.nvhe.o',
 needed by 'arch/arm64/kvm/hyp/nvhe/kvm_nvhe.tmp.o'.
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 14, 2026 at 1:54=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-inte=
grator.git b4/aarch64-clear-pages
> head:   a925ec351435c4da7f3ca8877af9e0aee81bcca5
> commit: a925ec351435c4da7f3ca8877af9e0aee81bcca5 [2/2] arm64: Implement c=
lear_pages()
> config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260=
214/202602142051.bzpo4KnU-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd70=
8029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260214/202602142051.bzpo4KnU-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602142051.bzpo4KnU-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> make[7]: *** No rule to make target 'arch/arm64/kvm/hyp/nvhe/../../../=
lib/clear_page.nvhe.o', needed by 'arch/arm64/kvm/hyp/nvhe/kvm_nvhe.tmp.o'.
>    make[7]: Target 'arch/arm64/kvm/hyp/nvhe/' not remade because of error=
s.

What is this?

It looks 100% like the kind of problem you get when you patch an assembly .=
S
file and there are old compile products left in the build tree, but
Make does not
have the idea to rebuild them.

Usuallt this is solved with make clean/mrproper.

Yours,
Linus Walleij
