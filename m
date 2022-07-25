Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA874C80
	for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 22:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 554D1C341CD;
	Mon, 25 Jul 2022 22:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658788618;
	bh=WTLwrkIPsf8FEgIVjgSmfxrI9GvpGImfD1cmaawndOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m3kOtIK4uopUXtPH2SH/KNXRpbsTQ/RF0B5SBznEhsqZllj3MxlsP+CMJwho7O0Wl
	 TxL3mZdV8Qw+rCJIhQMShP7OmuYbUs1Ee6u78VoVOy0Mw9tkm18xhnKl60zv4IsuZ2
	 xYj/kLCZy/i9vhtyTD2AxHuiEYGpmj9QE8quUeUWoiGjOvquoHpKKOdGggvxLdDaxG
	 rfDAMhX1pmlijmzdpVr8Tk9hlPnOAD3TEKNpfRqjlObqqUNuT21rNmfOv5LrQDHLLe
	 L5IvHruk+TuXgHk1TbspN/z5o64r62N8wOSS0xJCLaM9U6fLBcOiBzepiq33DZjW4a
	 +UEfmPazMo1LQ==
Date: Mon, 25 Jul 2022 15:36:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Simon Trimmer <simont@opensource.cirrus.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: Re: sound/soc/codecs/wm_adsp.c:1490:32: warning: taking address of
 packed member 'name' of class or structure 'wm_adsp_host_buf_coeff_v1' may
 result in an unaligned pointer value
Message-ID: <Yt8bB+lAoGM2Jmq0@dev-arch.thelio-3990X>
References: <202207260648.ERQjXCRB-lkp@intel.com>
 <Yt8aZ3OZ7lJBgf1V@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yt8aZ3OZ7lJBgf1V@dev-arch.thelio-3990X>

On Mon, Jul 25, 2022 at 03:34:15PM -0700, Nathan Chancellor wrote:
> On Tue, Jul 26, 2022 at 06:29:46AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   e0dccc3b76fb35bb257b4118367a883073d7390e
> > commit: 353bb6a5f2ac495f289b7c7a528c7d134c9a8ec4 ASoC: wm_adsp: Compressed stream DSP memory structs should be __packed
> > date:   5 months ago
> > config: arm-randconfig-r013-20220724 (https://download.01.org/0day-ci/archive/20220726/202207260648.ERQjXCRB-lkp@intel.com/config)
> > compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 9e88cbcc403bdf82f29259ad60ff60a8fc4434a1)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install arm cross compiling tool for clang build
> >         # apt-get install binutils-arm-linux-gnueabi
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=353bb6a5f2ac495f289b7c7a528c7d134c9a8ec4
> >         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> >         git fetch --no-tags linus master
> >         git checkout 353bb6a5f2ac495f289b7c7a528c7d134c9a8ec4
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash sound/soc/codecs/
> > 
> > If you fix the issue, kindly add following tag where applicable
> > Reported-by: kernel test robot <lkp@intel.com>
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> sound/soc/codecs/wm_adsp.c:1490:32: warning: taking address of packed member 'name' of class or structure 'wm_adsp_host_buf_coeff_v1' may result in an unaligned pointer value [-Waddress-of-packed-member]
> >            cs_dsp_remove_padding((u32 *)&coeff_v1.name, ARRAY_SIZE(coeff_v1.name));
> >                                          ^~~~~~~~~~~~~
> >    1 warning generated.
> 
> This warning is disabled in the main Makefile but a recent change in
> LLVM has caused that check to fail, sorry for the noise :(
> 
> https://github.com/ClangBuiltLinux/linux/issues/1674

Ah nevermind, looks like Fangrui already worked around this, it should
be resolved on the next LLVM uprev:

https://github.com/llvm/llvm-project/commit/1d23f6c5a4f6ebb101c282f8f506588fe4d9e92f

Cheers,
Nathan
