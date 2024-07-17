Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32ABC11CA1;
	Wed, 17 Jul 2024 14:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721226621; cv=none; b=PnQ9AJY1aebhCEDWQQnAD2ymFdlicIOsjUUSL2uDo2j1CxQSoykKmo8Iq3KSCYK8yG8hKDSKtiwwvTgstzfRix+cpyzC6HGFTVzZNYc5yOzZdGHrnD0J6SALurxaV8onnVpIwvZ43ILTROlI/MgTLCWvuORpI1Cmhg1bvk/2GwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721226621; c=relaxed/simple;
	bh=/zn4tteDqX0JeA0DTq/7nXr1r8NWERtQ7F7z5Am12qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xxwyq6kdmFFtoW3rsTWHimX+FShNp1XrGozcbdt2Bb6YPMnQyRq9naA0VUkmpozSu/u+J92xTY1UFaIxNu4nzqBR6xtE/k0c2fLyJj4R8SWyKgu4Uo3PvqsuBJsphBJWzmTR9KsS3WywgCZ8CLCWplfZAP5qF6XIYnPvkv7AEdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQNSrnzu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQNSrnzu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A69C32782;
	Wed, 17 Jul 2024 14:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721226618;
	bh=/zn4tteDqX0JeA0DTq/7nXr1r8NWERtQ7F7z5Am12qo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BQNSrnzuJ1azOAOC4vUX8rUeURdzLA04lL9+DbJSosA49Bceg8mOG4lyPx3Nn9WWk
	 oCUI1+Ia+8t8Dw40xMXPJ48LXcbqluRgFnZ7WbF6tRKoQwus6EA4eikDRHCOCSGmuF
	 Es2lh3wfxNhM45+wUoYrUw+AIqRNK6G8sywR41JBn4oHTGh9U3zWh2FQPrM4Iu9c/Y
	 kGSZj1YbdTiQGW1aeJStReRPRVT9Fk4m+5f1+vyVycYZ817vYPHPvKzfsfYKHtiv45
	 Qwxfx+6QlamJHag54OsBdKO8FuCr8fDMucZhRBnt4Up2o8xvzmcFFjsIKBaAH2BncV
	 4IxU60WDKzl2A==
Date: Wed, 17 Jul 2024 07:30:16 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	arm@kernel.org, Guo Ren <guoren@kernel.org>, arnd@arndb.de,
	conor@kernel.org
Subject: Re: [soc:sophgo/dt 1/1] arch/riscv/boot/dts/sophgo/sg2042.dtsi:7:10:
 fatal error: 'dt-bindings/clock/sophgo,sg2042-clkgen.h' file not found
Message-ID: <20240717143016.GA94990@thelio-3990X>
References: <202407101850.eIQyngoV-lkp@intel.com>
 <MA0P287MB2822C48F3DF670881D26E801FEA42@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MA0P287MB2822C48F3DF670881D26E801FEA42@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>

On Thu, Jul 11, 2024 at 07:09:48AM +0800, Chen Wang wrote:
> This build error is due to the changes about
> "dt-bindings/clock/sophgo,sg2042-clkgen.h" are still on clk-next and have
> not been merge in the master.

A tree needs to build by itself, so changes like this need to be made
atomically. Mainline is now broken because this change went in before
clk-next:

https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/9966522897
https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/9966319154

Please ensure this does not happen again, it is really disruptive for
people who test the whole tree, especially during the merge window when
we are trying to catch breakage that went in without being in -next.

Cheers,
Nathan

> On 2024/7/10 18:56, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git sophgo/dt
> > head:   b1240a39511b9206293b82ac372c5114d6e15821
> > commit: b1240a39511b9206293b82ac372c5114d6e15821 [1/1] riscv: dts: add clock generator for Sophgo SG2042 SoC
> > config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240710/202407101850.eIQyngoV-lkp@intel.com/config)
> > compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240710/202407101850.eIQyngoV-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202407101850.eIQyngoV-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >     In file included from arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts:6:
> > > > arch/riscv/boot/dts/sophgo/sg2042.dtsi:7:10: fatal error: 'dt-bindings/clock/sophgo,sg2042-clkgen.h' file not found
> >         7 | #include <dt-bindings/clock/sophgo,sg2042-clkgen.h>
> >           |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >     1 error generated.
> > 
> > 
> > vim +7 arch/riscv/boot/dts/sophgo/sg2042.dtsi
> > 
> >     > 7	#include <dt-bindings/clock/sophgo,sg2042-clkgen.h>
> >       8	#include <dt-bindings/clock/sophgo,sg2042-pll.h>
> >       9	#include <dt-bindings/clock/sophgo,sg2042-rpgate.h>
> >      10	#include <dt-bindings/interrupt-controller/irq.h>
> >      11	#include <dt-bindings/reset/sophgo,sg2042-reset.h>
> >      12	
> > 
