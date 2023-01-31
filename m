Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8458F4B;
	Tue, 31 Jan 2023 17:17:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D69A2C433D2;
	Tue, 31 Jan 2023 17:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675185444;
	bh=s2zN+bqLHFVqdpmBkSxYj/+hCuUp3ef3EXfXxJ0ViQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dI+IsCU7nn2vH4BlsEBDt/3ORc0kaLglh7JeHTqKktKaH4NKGRkbZHVR/k7f7nU6t
	 KY7+t0ptRzXVGdNaFdkUEcSLVI2XFnQ/i5/YB2Li0EUdhcsqtLlm8ZxwM9WQuuvV2m
	 9gi0xUgvZ8DAtyocRWrF1L39Ex4iY9OFntioPxx1cKhblQGs00QoX1rDFJkIMWkxG1
	 MyVHT6SUXjnttH/ZRuuYzSoLutGnPD3GsOQG1r5cYtcP5d0d5gVUTJcVegxPfm8bpz
	 1UpiL5ITZ6EAXl/LfDG9imkMFPZmCgLBywSEOL+YgOXpL4SrRqAM/lCcNs1CQpJUgG
	 h+jVi88NXF1Eg==
Date: Tue, 31 Jan 2023 17:17:19 +0000
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Lee Jones <lee.jones@linaro.org>
Subject: Re: [lee-mfd:for-mfd-next 36/37] drivers/mmc/host/tmio_mmc.c:141:12:
 error: no member named 'enable' in 'struct mfd_cell'
Message-ID: <Y9lNHyfzwE1+b+Ru@google.com>
References: <202301312253.oUVq9cys-lkp@intel.com>
 <20230131152005.6wy5vbzzcouiofee@pengutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230131152005.6wy5vbzzcouiofee@pengutronix.de>

On Tue, 31 Jan 2023, Uwe Kleine-König wrote:

> Hello,
> 
> On Tue, Jan 31, 2023 at 10:48:48PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
> > head:   a561a980c024193e342b6878f62e02ff9d018285
> > commit: 78e7ccec94380519919267670174cbf1711b7963 [36/37] mfd: Remove .enable() and .disable() callbacks
> > config: hexagon-randconfig-r041-20230130 (https://download.01.org/0day-ci/archive/20230131/202301312253.oUVq9cys-lkp@intel.com/config)
> > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/commit/?id=78e7ccec94380519919267670174cbf1711b7963
> >         git remote add lee-mfd https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
> >         git fetch --no-tags lee-mfd for-mfd-next
> >         git checkout 78e7ccec94380519919267670174cbf1711b7963
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/mmc/host/ drivers/video/fbdev/
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > 
> > All errors (new ones prefixed by >>):
> > 
> > [...]
> > >> drivers/mmc/host/tmio_mmc.c:186:12: error: no member named 'disable' in 'struct mfd_cell'
> >            if (cell->disable)
> >                ~~~~  ^
> 
> This driver doesn't exist in next any more (commit ecb92c1f4752). So I'm
> unsure what to do here.
> 
> The obvious (to me) options are:
> 
>  a) ignore the problem
>  b) merge ecb92c1f4752 into mfd before applying "mfd: Remove .enable()
>     and .disable() callbacks"
>  c) drop "mfd: Remove .enable() and .disable() callbacks" for now and
>     reapply when ecb92c1f4752 is in Linus' tree (variant of b))
> 
> Lee, what's your take here?

We need to pull your patch for now.

See:

  drivers/mmc/host/tmio_mmc.c
  drivers/mtd/nand/raw/tmio_nand.c
  drivers/usb/host/ohci-tmio.c
  drivers/video/fbdev/tmiofb.c
  drivers/w1/masters/ds1wm.c

-- 
Lee Jones [李琼斯]
