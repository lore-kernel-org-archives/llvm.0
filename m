Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DE8848B;
	Fri, 26 May 2023 15:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE4AC433EF;
	Fri, 26 May 2023 15:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685114700;
	bh=MGPYVWTyfzxHlvWypAeb9b789VZlSWcYKk8mJrmf1oo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PbNKvKC3ZdT4BtjyYdi4o5bZwl67wlYwTnBwwi0SgSjCvBgmthz21up7nhqmSPZdX
	 O3CBpS+BEay8bm/WDPrOqA+UKCSfRnq3p5UdEwnMUTqLKe6q/UQWN42B9dEk+r4QS+
	 sbTbJRurpVVQxpLnSfrF1cq+ecwvA/aq+u4FNvqNwreaAqdxvsvkyvoiFcSW7YehSB
	 qsH3En8CxP4CSYRwEABtmGiJrs8Nrdj/eaa2DpZqJn6Z0xschKjO1jAaHPa+ppA2wI
	 /chGQ1JbrsrGEJNgnxN1smxhKqlIRv+VpZOu3mWhcLIydSBnnUTprLRrpyvUC6gNKp
	 oiaK+W6iONZug==
Date: Fri, 26 May 2023 08:24:58 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	John Keeping <john@metanate.com>, llvm@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: Re: [stable:linux-4.19.y 984/6017] ld.lld: error:
 drivers/usb/dwc2/platform.o: contains a compressed section, but zlib is not
 available
Message-ID: <20230526152458.GA395537@dev-arch.thelio-3990X>
References: <202305251508.iFEInYVW-lkp@intel.com>
 <CAKwvOd=QY_QNWP2+nofvowbCD66noajsY8q1xe-MamV_gF3TPA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOd=QY_QNWP2+nofvowbCD66noajsY8q1xe-MamV_gF3TPA@mail.gmail.com>

On Thu, May 25, 2023 at 02:21:24PM -0700, Nick Desaulniers wrote:
> On Thu, May 25, 2023 at 12:44 AM kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
> > head:   3f57fb8b1bd06b277556601133823bec370d723f
> > commit: c964b1bbf179a163084b1ec8ad094b8c8dce28c8 [984/6017] usb: dwc2: hcd_queue: Fix use of floating point literal
> > config: x86_64-randconfig-x093-20230524
> > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> > reproduce (this is a W=1 build):
> >         mkdir -p ~/bin
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=c964b1bbf179a163084b1ec8ad094b8c8dce28c8
> >         git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
> >         git fetch --no-tags stable linux-4.19.y
> >         git checkout c964b1bbf179a163084b1ec8ad094b8c8dce28c8
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/usb/
> >
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202305251508.iFEInYVW-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> 
> Hmmm...that's surprising to see on 4.19.  I didn't add support for
> compressed debug info until:
> 
> commit 10e68b02c861 ("Makefile: support compressed debug info")
> 
> which landed in v5.8-rc1 and AFAIK was never backported.
> 
> I wasn't able to reproduce this with ToT LLVM (clang-17); I wonder if
> this is an issue with clang-14?

Something I was thinking about yesterday is that binutils has a bunch of
configure flags to control default behavior and one of those is
compressed debug sections on by default:

  --enable-compressed-debug-sections={all,gas,gold,ld,none}
                          Enable compressed debug sections for gas, gold or ld
                          by default

Is it possible that the version of binutils that the kernel test robot
uses has compressed debug sections enabled by default for gas? Although,
if I am reading make.cross correctly (linked above), it seems like the
integrated assembler should be used in this case... It would be really
helpful to have the exact make command that the robot used in the report
to know for sure. I do not see a similar switch available for LLVM and
even then, I would not expect to see the same issue because we should
not even have the ability to generate a compressed debug section if zlib
was not available.

> Just tried and could not reproduce.  Has this issue been seen elsewhere?
> 
> Ah, we have
> 
> https://lore.kernel.org/llvm/?q=contains+a+compressed+section%2C+but+zlib+is+not+available
> https://lore.kernel.org/llvm/20230404161735.GA1703291@dev-arch.thelio-3990X/
> 
> So since 10e68b02c861 is in v5.8-rc1, then for 4.14, 4.19, and 5.4 we
> probably want a stable-only patch for -gz=none.
> 
> GCC didn't support -gz=none until 5.1, so that might be an issue for
> older branches of stable which might still support older GCC versions.
> 4.19.y still supports gcc 4.6.
> 
> ```
> diff --git a/Makefile b/Makefile
> index 71416fde7348..e6754300021c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -756,6 +756,7 @@ KBUILD_AFLAGS       += -g
>  else
>  KBUILD_AFLAGS  += -Wa,-gdwarf-2
>  endif
> +KBUILD_CFLAGS  += $(call cc-option, -gz=none)
>  endif
> 
>  ifdef CONFIG_DEBUG_INFO_DWARF4
> ```
> 
> Godbolt only binutils v2.27+, but 4.19 supported v2.20+ (so I can't
> check --compress-debug-sections=none assembler support quickly).

You could do

  KBUILD_AFLAGS   += $(as-option, -Wa$(comma)--compress-debug-sections=none)

no?

> >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed section, but zlib is not available
> >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed section, but zlib is not available
> >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed section, but zlib is not available
> >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed section, but zlib is not available
> >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed section, but zlib is not available
> >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed section, but zlib is not available
> >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed section, but zlib is not available
> >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed section, but zlib is not available
> >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed section, but zlib is not available
> > >> ld.lld: error: drivers/usb/dwc2/platform.o: contains a compressed section, but zlib is not available
> >    ld.lld: error: too many errors emitted, stopping now (use -error-limit=0 to see all errors)

Cheers,
Nathan
