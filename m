Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5FB1A23AC
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 00:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771201290; cv=none; b=HClBL26rDe6AkjlKaA+tgT48v2SkUvUBW0bCmAaZFqSmDEBqDVgEiCttcP2sOWT9WVatSPypqtH8Ajn5mUH5+ZJnWae/vZIEP8+U2wN29BeESiTEtXbgy9EPY/s6KsYX2nZA10jmUytqbroVGLgFg4qLEKYBNpKZRowweb26tgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771201290; c=relaxed/simple;
	bh=yizi3buzsewzVlptNwzArm835Y8CYScULqTPDTpICho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MarNaJmxx0mi6H5fJNNVKGsTz+3L6O2vAHXd7YDJhXBSCS3zniIf2tLZ+QncTEdQghKF/X1t7wfYeWg4xgHuNhcPx09DiqSmJuhemJBH6GM/ZH0qn0iH35kMuoUbNvNNz+izKYWR6E3bo1G4gdGinC7QmmPPHfpKdRQPfwWUH+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QgQvi3G4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QgQvi3G4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C88FC19425
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 00:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771201289;
	bh=yizi3buzsewzVlptNwzArm835Y8CYScULqTPDTpICho=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QgQvi3G4Us5SP/+uosYpFZjKQT4xbw+NzFLTab9oZHUIwP24wuDawdyEtS8KKcjXX
	 UqW08/d0WNyl/5U9UaumwAFc9o9CExMOBifirEuxJepAmRaRu2cF3az/BeHsIihs+V
	 7GRmyW8kTHAkKCh55CTCK/gj3kvz6/YSP+ScxssmLSMTxcmQbpRHn05A25uGtAS1nl
	 DJNp15Kg2y3vPgjbPwNHk+YerdR0QE3ZyGHCa9T+YxNI+4JCUfB3WoVOMbO0mp5Wy8
	 hAG6IDBXxvRVdDU0+EYODCb4QSb0+WG5RWH0j0l6p3btGt5piniHnM9iK/vqQmfv1c
	 G5gpRNmIqmwmw==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-649e456e8a2so2197917d50.0
        for <llvm@lists.linux.dev>; Sun, 15 Feb 2026 16:21:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX58TaJyb90Auzof/Ygn6O3z5KwQu2VI9mH9N0RZDPP9gstuRtuSc9byNo1fZcCd0rx7vdh@lists.linux.dev
X-Gm-Message-State: AOJu0YzcbNbhPzGfRE80BEqZUF3H8y7kwQeXjXbZXrYshGRwAyE54eav
	UtrjRhy9FpQOFizH6/1GDfwxz3UF5Fb1/95Dx4v7imF7vqvgDInGYn5PztKxSF9ixsp0aeNA4BK
	qha55q4YBsY81KuFQTgNwHP7dqACNpfA=
X-Received: by 2002:a05:690c:7201:b0:796:45d4:9e4d with SMTP id
 00721157ae682-797a0cd0714mr163124137b3.56.1771201288910; Sun, 15 Feb 2026
 16:21:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202602142051.bzpo4KnU-lkp@intel.com> <CAD++jLmmnNP-x80wT5HGTar0VghXZxsU_kYdcsvZH2nkbtp2sA@mail.gmail.com>
 <20260214192543.GA2633863@ax162>
In-Reply-To: <20260214192543.GA2633863@ax162>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Feb 2026 01:21:17 +0100
X-Gmail-Original-Message-ID: <CAD++jLmskLnHezEa9zVOBevGQ+qg3z9y9n89UDR6OVnV30XO9w@mail.gmail.com>
X-Gm-Features: AaiRm53etEaEVND0GDIui9kN7DBUsOUmtN1nv-WsDCUrMCPUB6xpd_VXzNp1VFw
Message-ID: <CAD++jLmskLnHezEa9zVOBevGQ+qg3z9y9n89UDR6OVnV30XO9w@mail.gmail.com>
Subject: Re: [arm-integrator:b4/aarch64-clear-pages 2/2] make[7]: *** No rule
 to make target 'arch/arm64/kvm/hyp/nvhe/../../../lib/clear_page.nvhe.o',
 needed by 'arch/arm64/kvm/hyp/nvhe/kvm_nvhe.tmp.o'.
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 14, 2026 at 8:25=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
> On Sat, Feb 14, 2026 at 06:10:19PM +0100, Linus Walleij wrote:
> > On Sat, Feb 14, 2026 at 1:54=E2=80=AFPM kernel test robot <lkp@intel.co=
m> wrote:
> >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-=
integrator.git b4/aarch64-clear-pages
> > > head:   a925ec351435c4da7f3ca8877af9e0aee81bcca5
> > > commit: a925ec351435c4da7f3ca8877af9e0aee81bcca5 [2/2] arm64: Impleme=
nt clear_pages()
> > > config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/2=
0260214/202602142051.bzpo4KnU-lkp@intel.com/config)
> > > compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project =
cd708029e0b2869e80abe31ddb175f7c35361f90)
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20260214/202602142051.bzpo4KnU-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202602142051.bzpo4KnU=
-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > > >> make[7]: *** No rule to make target 'arch/arm64/kvm/hyp/nvhe/../..=
/../lib/clear_page.nvhe.o', needed by 'arch/arm64/kvm/hyp/nvhe/kvm_nvhe.tmp=
.o'.
> > >    make[7]: Target 'arch/arm64/kvm/hyp/nvhe/' not remade because of e=
rrors.
> >
> > What is this?
>
> This is reproducible with a clean out folder. Your patch renamed
> clear_page.S to clear_pages.S and you handled that properly in
> arch/arm64/lib/Makefile but arch/arm64/kvm/hyp/nvhe also uses this
> file, so the rename needs to be handled there as well.

Aha what a clever trick, I was unaware of this trickery...

Thanks a lot Nathan, much appreciated!!

Yours,
Linus Walleij
