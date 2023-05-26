Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C1A848B;
	Fri, 26 May 2023 15:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD048C433D2;
	Fri, 26 May 2023 15:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685114852;
	bh=jVhiaxN9Qpgl7wWzEEMIvYPd+vaj2I44GX6yHpO9h0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TTdN2TQGznKSKtvJ1Qe5Cw3crUyUUwtmBGyBb9FimGIct0FaFCCd4ImOhOD9zIuic
	 p5CEJvyH8EuGfpzNUaRWfofuZuX6ofszJ006HMXqo8enY0xpWhkFZ1HLGN7KoSJq46
	 yposDLdoGilayzSWBaqNX1OSzIT0GqKXvAO02v5TAHh+grKladghFGtFO3adMTKeif
	 AhEtmJicFGXPlrJuaKTWdS3IMSJuBainw2mTnEP4+oTj8gef/vd5mO8AhfKm/gQr5M
	 f2HEebHK8qvkDSAMRxmFFBRdcjFtPQ+MjBHHbE1Pp28QbQDyB0LWF/IGZz4BstrVn6
	 AFLNaXP9TGFAQ==
Date: Fri, 26 May 2023 08:27:30 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Ard Biesheuvel <ardb@kernel.org>, Sasha Levin <sashal@kernel.org>
Subject: Re: [stable:linux-5.4.y 1809/9999] ld.lld: error:
 lib/fonts/font_sun8x16.o: contains a compressed section, but zlib is not
 available
Message-ID: <20230526152730.GB395537@dev-arch.thelio-3990X>
References: <202305260739.yrWlFZTF-lkp@intel.com>
 <CAMuHMdV3wFeBBK64Q5-pGcRVP12Smhmaon-Em0cQREjj2duLEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdV3wFeBBK64Q5-pGcRVP12Smhmaon-Em0cQREjj2duLEg@mail.gmail.com>

Hi Geert,

On Fri, May 26, 2023 at 09:04:02AM +0200, Geert Uytterhoeven wrote:
> On Fri, May 26, 2023 at 1:24 AM kernel test robot <lkp@intel.com> wrote:
> > FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
> > head:   f53660ec669f60c772fdf7d75d1c24d288547cee
> > commit: 11420c32c1b49d0f900c4b20bc77c963c54086ce [1809/9999] efi: EFI_EARLYCON should depend on EFI
> > config: x86_64-randconfig-x071-20230525
> > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> > reproduce (this is a W=1 build):
> >         mkdir -p ~/bin
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=11420c32c1b49d0f900c4b20bc77c963c54086ce
> >         git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
> >         git fetch --no-tags stable linux-5.4.y
> >         git checkout 11420c32c1b49d0f900c4b20bc77c963c54086ce
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash lib/
> >
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202305260739.yrWlFZTF-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    ld.lld: error: lib/fonts/fonts.o: contains a compressed section, but zlib is not available
> >    ld.lld: error: lib/fonts/fonts.o: contains a compressed section, but zlib is not available
> >    ld.lld: error: lib/fonts/fonts.o: contains a compressed section, but zlib is not available
> >    ld.lld: error: lib/fonts/fonts.o: contains a compressed section, but zlib is not available
> >    ld.lld: error: lib/fonts/fonts.o: contains a compressed section, but zlib is not available
> >    ld.lld: error: lib/fonts/fonts.o: contains a compressed section, but zlib is not available
> >    ld.lld: error: lib/fonts/fonts.o: contains a compressed section, but zlib is not available
> >    ld.lld: error: lib/fonts/fonts.o: contains a compressed section, but zlib is not available
> >    ld.lld: error: lib/fonts/fonts.o: contains a compressed section, but zlib is not available
> > >> ld.lld: error: lib/fonts/font_sun8x16.o: contains a compressed section, but zlib is not available
> > >> ld.lld: error: lib/fonts/font_sun8x16.o: contains a compressed section, but zlib is not available
> > >> ld.lld: error: lib/fonts/font_sun8x16.o: contains a compressed section, but zlib is not available
> > >> ld.lld: error: lib/fonts/font_sun8x16.o: contains a compressed section, but zlib is not available
> > >> ld.lld: error: lib/fonts/font_sun8x16.o: contains a compressed section, but zlib is not available
> > >> ld.lld: error: lib/fonts/font_sun8x16.o: contains a compressed section, but zlib is not available
> > >> ld.lld: error: lib/fonts/font_sun8x16.o: contains a compressed section, but zlib is not available
> > >> ld.lld: error: lib/fonts/font_sun12x22.o: contains a compressed section, but zlib is not available
> > >> ld.lld: error: lib/fonts/font_sun12x22.o: contains a compressed section, but zlib is not available
> > >> ld.lld: error: lib/fonts/font_sun12x22.o: contains a compressed section, but zlib is not available
> > >> ld.lld: error: lib/fonts/font_sun12x22.o: contains a compressed section, but zlib is not available
> >    ld.lld: error: too many errors emitted, stopping now (use -error-limit=0 to see all errors)
> 
> This looks like a toolchain issue to me: the fonts themselves do not
> contain compressed data, but perhaps they do contain some data that
> coincidentally matches a zlib compressed-data signature?

It is almost certainly a toolchain issue. I do not think it is related
to the font files themselves, there are many other reports of this same
error on other files. There is some discussion on this thread around it:

https://lore.kernel.org/CAKwvOd=QY_QNWP2+nofvowbCD66noajsY8q1xe-MamV_gF3TPA@mail.gmail.com/

Cheers,
Nathan
