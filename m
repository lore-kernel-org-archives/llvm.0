Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEC1186F
	for <llvm@lists.linux.dev>; Fri,  2 Sep 2022 15:44:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8105AC433D6;
	Fri,  2 Sep 2022 15:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662133455;
	bh=yfXNLWwklr+vfZiv505dQVxWhaA1YdtdN+HFsT0EppY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KMPn+k5ATlFDVCVcQyU5cx79W4OsuKY+4q6IlKf48cXq5XkXDr/F9DL2rZgzoHyXQ
	 e2rPEHxzxA82DHl3l4vleTHpZKk+s1KQ3R5DN+z9WMvSySXJFen60tn4hYX1thFVoD
	 dnI3c6nLaVn1oOG90LXgea8MF0Eu9ug9OE7xJfeGV2Ezo0gwIzCEU4yEneKGS15ekE
	 ptZwIGIvPh/eUKY3qB3qP+0CCYLvoiFK8WsD64mCknjYu2qsDb7FGlcrjnR8d7pdXD
	 UJEk7/efxsXRrGDSnnPhhIeNODW8zeOhs3WBnV5LJBgPT3BLnETZTvSN8wUZlANhvW
	 qSmL2A9u2FATg==
Date: Fri, 2 Sep 2022 08:44:13 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
Subject: Re: [jpoimboe:s390 2/2] Unsupported relocation type: 26
Message-ID: <20220902154413.ambn4qvy7a4hudjs@treble>
References: <202209021319.l7dwyum7-lkp@intel.com>
 <YxIdXugKymRtV9zW@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YxIdXugKymRtV9zW@dev-arch.thelio-3990X>

On Fri, Sep 02, 2022 at 08:12:30AM -0700, Nathan Chancellor wrote:
> On Fri, Sep 02, 2022 at 01:51:11PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git s390
> > head:   fa09ffb73e4d64424faef5988a1e993317db77c5
> > commit: fa09ffb73e4d64424faef5988a1e993317db77c5 [2/2] s390: Compile relocatable kernel without -fPIE
> > config: s390-randconfig-r044-20220901
> > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install s390 cross compiling tool for clang build
> >         # apt-get install binutils-s390x-linux-gnu
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=fa09ffb73e4d64424faef5988a1e993317db77c5
> >         git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
> >         git fetch --no-tags jpoimboe s390
> >         git checkout fa09ffb73e4d64424faef5988a1e993317db77c5
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash
> > 
> > If you fix the issue, kindly add following tag where applicable
> > Reported-by: kernel test robot <lkp@intel.com>
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> Unsupported relocation type: 26
> 
> Looks like 26 is R_390_GOTENT according to
> https://github.com/llvm/llvm-project/blob/ee761374f797a47919ec8f9f49f9b8b1b20573e8/llvm/include/llvm/BinaryFormat/ELFRelocs/SystemZ.def.

Indeed.  BTW, that define can also be found in /usr/include/elf.h.

I guess I need to test this feature with clang ;-)  Without -fPIE, I'm
not sure why it would be using a GOT relocation for vmlinux.

-- 
Josh
