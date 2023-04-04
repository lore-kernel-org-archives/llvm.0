Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC373C07;
	Tue,  4 Apr 2023 16:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4B5C433EF;
	Tue,  4 Apr 2023 16:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680625058;
	bh=virpC9UGoOztzOmEASPSRJUSscQCSnXSys5jHzavMMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A1LEKsq58kylc4hHf6XNNytVlwvptqzrh45hN3w+Vnuue0+QTbhkxOy1MhN12XLm2
	 vzgIxJgudYA+Q0kIlRcBHbJmKTSGZ8WQbKc/xgH7q3ZHnoa2Apk/QbxAf7ANYQTjCf
	 Dk8ZkRBNcB9qzFtTMD/Q4WC99Joa3m9o/WAVTIFeI/PF67bIdy8QK6U5n98+38KmFQ
	 BCMVzBb0TxiXFt2c5YTdmsi6PBmW4Mx3D9tlaJMLiXZfACto+1XF2omIQ4HnR3T0WC
	 2fe9CYzDP4IsMCoyWppEveyPyRYNhEI4ORweKYxwqA3Aer+b65JRFBQ/inDJq3+j5N
	 Gctx7hUL7eUrA==
Date: Tue, 4 Apr 2023 09:17:35 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Max Gurtovoy <mgurtovoy@nvidia.com>,
	Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
	Christoph Hellwig <hch@lst.de>, Sasha Levin <sashal@kernel.org>
Subject: Re: [stable:linux-5.4.y 5319/9999] ld.lld: error:
 drivers/nvme/host/core.o: contains a compressed section, but zlib is not
 available
Message-ID: <20230404161735.GA1703291@dev-arch.thelio-3990X>
References: <202304032219.jG1sChqf-lkp@intel.com>
 <27cc24d8-c7f4-66b8-954c-d3cb11b5764f@grimberg.me>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27cc24d8-c7f4-66b8-954c-d3cb11b5764f@grimberg.me>

On Mon, Apr 03, 2023 at 07:02:30PM +0300, Sagi Grimberg wrote:
> 
> > Hi Sagi,
> > 
> > First bad commit (maybe != root cause):
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
> > head:   09b1a76e7879184fb35d71a221cae9451b895fff
> > commit: 3e9aa125f69c0006d10f101898932acedc942b59 [5319/9999] nvme-tcp: remove incorrect Kconfig dep in BLK_DEV_NVME
> 
> The failure looks unrelated to the commit IMO. Is it maybe some issue
> with clang linkage with zlib?

Yeah, this is obviously not related to that change. As far as I can
tell, this means that the version of LLVM was compiled in an environment
without zlib. However, I am super confused because linux-5.4.y does not
even have commit 10e68b02c861 ("Makefile: support compressed debug
info") so we should not even be generating compressed debug sections in
the first place...

If I understand the robot's build script correctly, this should be clang
as the compiler and GNU as as the assembler. Is the version of GNU as
the robot is using built with '--enable-compressed-debug-sections',
which would turn compressed debug sections on by default? If so, we
should be able to override that by specifying '-gz=none' explicitly in
linux-5.4.y and earlier.

Cheersm
Nathan

> > config: x86_64-randconfig-a001-20230403 (https://download.01.org/0day-ci/archive/20230403/202304032219.jG1sChqf-lkp@intel.com/config)
> > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> > reproduce (this is a W=1 build):
> >          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >          chmod +x ~/bin/make.cross
> >          # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=3e9aa125f69c0006d10f101898932acedc942b59
> >          git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
> >          git fetch --no-tags stable linux-5.4.y
> >          git checkout 3e9aa125f69c0006d10f101898932acedc942b59
> >          # save the config file
> >          mkdir build_dir && cp config build_dir/.config
> >          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
> >          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/nvme/
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Link: https://lore.kernel.org/oe-kbuild-all/202304032219.jG1sChqf-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> > > > ld.lld: error: drivers/nvme/host/core.o: contains a compressed section, but zlib is not available
> > > > ld.lld: error: drivers/nvme/host/core.o: contains a compressed section, but zlib is not available
> > > > ld.lld: error: drivers/nvme/host/core.o: contains a compressed section, but zlib is not available
> > > > ld.lld: error: drivers/nvme/host/core.o: contains a compressed section, but zlib is not available
> > > > ld.lld: error: drivers/nvme/host/core.o: contains a compressed section, but zlib is not available
> > > > ld.lld: error: drivers/nvme/host/core.o: contains a compressed section, but zlib is not available
> > > > ld.lld: error: drivers/nvme/host/core.o: contains a compressed section, but zlib is not available
> > > > ld.lld: error: drivers/nvme/host/trace.o: contains a compressed section, but zlib is not available
> > > > ld.lld: error: drivers/nvme/host/trace.o: contains a compressed section, but zlib is not available
> > > > ld.lld: error: drivers/nvme/host/trace.o: contains a compressed section, but zlib is not available
> > > > ld.lld: error: drivers/nvme/host/trace.o: contains a compressed section, but zlib is not available
> > > > ld.lld: error: drivers/nvme/host/trace.o: contains a compressed section, but zlib is not available
> > > > ld.lld: error: drivers/nvme/host/trace.o: contains a compressed section, but zlib is not available
> > > > ld.lld: error: drivers/nvme/host/trace.o: contains a compressed section, but zlib is not available
> > > > ld.lld: error: drivers/nvme/host/multipath.o: contains a compressed section, but zlib is not available
> > > > ld.lld: error: drivers/nvme/host/multipath.o: contains a compressed section, but zlib is not available
> > > > ld.lld: error: drivers/nvme/host/multipath.o: contains a compressed section, but zlib is not available
> > > > ld.lld: error: drivers/nvme/host/multipath.o: contains a compressed section, but zlib is not available
> > > > ld.lld: error: drivers/nvme/host/multipath.o: contains a compressed section, but zlib is not available
> > > > ld.lld: error: drivers/nvme/host/multipath.o: contains a compressed section, but zlib is not available
> >     ld.lld: error: too many errors emitted, stopping now (use -error-limit=0 to see all errors)
> > 
> 
