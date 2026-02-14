Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4C726B755;
	Sat, 14 Feb 2026 19:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771097147; cv=none; b=e3+AKwrbCbrc/shFAwAVasVsmb33eXP12g9C3YDpVjI7684xAI71wH14160EqN7IcEyU+SN8mOQzZKiCVxbWB1uizVYKSUGTWY/To+2pFchrVJF6fVyqn2zsC7LEWvzwTz2N0G0ww8sWzvzNZJUpdJ6tluRDzC3jfWS9PVi3PfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771097147; c=relaxed/simple;
	bh=kNZ3ZzxS8QWzKzB9cvbP7UgruYp1x4wId3fGjgoa8Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dErka+NVpnn0Zd7UA6M9doFJheuGR2/W7zinC0bEzFY7p4PxVqC+Zb0KX8sVvwT8tPTaTgx+KNhZDegqosWkdYV55luMRPF7pnTq8hUthqT773p178EiXl2hm551fGothFVoZG4D9f7JEra64tLFaSuiCCl2aw3DzNOXHMDOAuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KJ4qRa+j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KJ4qRa+j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1B38C16AAE;
	Sat, 14 Feb 2026 19:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771097146;
	bh=kNZ3ZzxS8QWzKzB9cvbP7UgruYp1x4wId3fGjgoa8Vs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KJ4qRa+jfCpPIQvSmd8ccffR44vnK4eJCeC8/Kjjr/oDkTb/F4fChv39CJJ6wtEUY
	 x2wONHcMd6f5Tvm/2toI+fW1HbaE7ZQ/CQX008AqppZl2+6mO4eYslWoE7RqyhkAI1
	 M1eIqoVRsHjkg2aLASq+wj9SQ41NWBNy4vYZ6L1YonkBKCIThC4eqpmMp12BBG7Udw
	 mDog7clWIL8lBf6GV8F5x6vgZyx5VjTjLXpexmIOwcQNw8NvjW8UuoN7jLC97OjWB1
	 bvfYavll+ud92MJ3oMf9McQ6Xrvyuqmd7T4DuS7Pr+ECdHhiABPlPY5+mVLH2+88sH
	 +mZASSrRQJ8yA==
Date: Sat, 14 Feb 2026 14:25:43 -0500
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [arm-integrator:b4/aarch64-clear-pages 2/2] make[7]: *** No rule
 to make target 'arch/arm64/kvm/hyp/nvhe/../../../lib/clear_page.nvhe.o',
 needed by 'arch/arm64/kvm/hyp/nvhe/kvm_nvhe.tmp.o'.
Message-ID: <20260214192543.GA2633863@ax162>
References: <202602142051.bzpo4KnU-lkp@intel.com>
 <CAD++jLmmnNP-x80wT5HGTar0VghXZxsU_kYdcsvZH2nkbtp2sA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLmmnNP-x80wT5HGTar0VghXZxsU_kYdcsvZH2nkbtp2sA@mail.gmail.com>

On Sat, Feb 14, 2026 at 06:10:19PM +0100, Linus Walleij wrote:
> On Sat, Feb 14, 2026 at 1:54 PM kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/aarch64-clear-pages
> > head:   a925ec351435c4da7f3ca8877af9e0aee81bcca5
> > commit: a925ec351435c4da7f3ca8877af9e0aee81bcca5 [2/2] arm64: Implement clear_pages()
> > config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260214/202602142051.bzpo4KnU-lkp@intel.com/config)
> > compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602142051.bzpo4KnU-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202602142051.bzpo4KnU-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> make[7]: *** No rule to make target 'arch/arm64/kvm/hyp/nvhe/../../../lib/clear_page.nvhe.o', needed by 'arch/arm64/kvm/hyp/nvhe/kvm_nvhe.tmp.o'.
> >    make[7]: Target 'arch/arm64/kvm/hyp/nvhe/' not remade because of errors.
> 
> What is this?

This is reproducible with a clean out folder. Your patch renamed
clear_page.S to clear_pages.S and you handled that properly in
arch/arm64/lib/Makefile but arch/arm64/kvm/hyp/nvhe also uses this
file, so the rename needs to be handled there as well.

diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index a244ec25f8c5..f857dac82a88 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -17,7 +17,7 @@ ccflags-y += -fno-stack-protector	\
 hostprogs := gen-hyprel
 HOST_EXTRACFLAGS += -I$(objtree)/include
 
-lib-objs := clear_page.o copy_page.o memcpy.o memset.o
+lib-objs := clear_pages.o copy_page.o memcpy.o memset.o
 lib-objs := $(addprefix ../../../lib/, $(lib-objs))
 
 CFLAGS_switch.nvhe.o += -Wno-override-init
