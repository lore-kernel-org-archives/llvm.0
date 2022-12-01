Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF0B6FD7;
	Thu,  1 Dec 2022 16:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 320F0C433C1;
	Thu,  1 Dec 2022 16:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669910459;
	bh=0D/sjN/A+0rsU/ONrX3z3ntgIBfDN4k8Kf5eOrgywsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WyXHaE7UfpiSavmT6vQS4jiBSuk8iUhhtklwNflBsd5hthuVIh0L/meqN/w8aQjFL
	 pay8eEk7brCxUtrc2BDRFp8Uqgw3nERM4wYO+IuEwn3DpRx9EaAohl3eC2dRPAs8p8
	 rdAlJGCIoJpEhqTgR2cIAvZSF8LrbbiaI89DnnHCPTx7gxGHHRNrZqdsDzh5j51cxz
	 THwguBclT1VvzsrE3yXOqA6ggNVgA1KMxW0OKA/dxCR1hEQBNspCE0g8NgzK1i9SFl
	 T4ztCksZWkHWF6DPZMYc7xFXx8lWa6HaOUULgiq7kPPZ9lRQMnBHnROfw/2pFUvf3c
	 KxddVhInUyFdQ==
Date: Thu, 1 Dec 2022 09:00:57 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: kernel test robot <lkp@intel.com>,
	Mikhail Zhilkin <csharper2005@gmail.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	NOGUCHI Hiroshi <drvlabo@gmail.com>
Subject: Re: ld.lld: error: undefined symbol: __udivdi3
Message-ID: <Y4jPubD53yN32OUL@dev-arch.thelio-3990X>
References: <202212010140.pIueEBNb-lkp@intel.com>
 <20221201091610.524f7786@xps-13>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221201091610.524f7786@xps-13>

On Thu, Dec 01, 2022 at 09:16:10AM +0100, Miquel Raynal wrote:
> Hi Mikhail, Hiroshi,
> 
> lkp@intel.com wrote on Thu, 1 Dec 2022 01:46:36 +0800:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   01f856ae6d0ca5ad0505b79bf2d22d7ca439b2a1
> > commit: 9b78ef0c7997052e9eaa0f7a4513d546fa17358c mtd: parsers: add support for Sercomm partitions
> > date:   6 months ago
> > config: mips-randconfig-r033-20221128
> > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 6e4cea55f0d1104408b26ac574566a0e4de48036)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install mips cross compiling tool for clang build
> >         # apt-get install binutils-mipsel-linux-gnu
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9b78ef0c7997052e9eaa0f7a4513d546fa17358c
> >         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> >         git fetch --no-tags linus master
> >         git checkout 9b78ef0c7997052e9eaa0f7a4513d546fa17358c
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> ld.lld: error: undefined symbol: __udivdi3  
> >    >>> referenced by scpart.c
> >    >>>               mtd/parsers/scpart.o:(scpart_parse) in archive drivers/built-in.a  
> > 
> 
> Can you please try to reproduce this with a mips toolchain as advised
> and send a fix?

For what it's worth, this is likely our bug:

https://github.com/ClangBuiltLinux/linux/issues/1635

It sounds like there are some merged LLVM patches that should help but I
guess not based on this report...

Cheers,
Nathan
