Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608343FE4;
	Mon, 26 Sep 2022 15:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90BC1C433D6;
	Mon, 26 Sep 2022 15:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664207175;
	bh=yFOUSYy23Xn5rm/tomaoa4I3a2DtNrDG+KzB8W4AvW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lnlw1VsWlAVFSGUyhR3sWv/XSq7i5gt5MAIELyTizUZMT8I8twJlogN3XR4/RCwRl
	 Tb/R00Cwci62SAyUdy4nnpXGhqcRZUqyOLRhX+OdceqU/Sq7Qgiy4zknCQN2cOcRqa
	 Z4xltlhgFNZDr+CgRhEo90BLR3TATckk/CYavrQ+2sy0S+UrTUTW9KhvQb3fezPUws
	 HC7WppU3OljpZndWLcsCPXAiNLDR3FyfRigQLVmJRnevLWDzs8AhfwlSBMroyHHNFT
	 oin5ER/6Yi57ywuOJSuN2g/306pGj+wDu0lvRDK9HKBrmvhiD7LTEyAnNfSzWfKw+H
	 ykoNSTMcimkfg==
Date: Mon, 26 Sep 2022 08:46:12 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Masami Hiramatsu <mhiramat@kernel.org>, regressions@lists.linux.dev,
	lkft-triage@lists.linaro.org, llvm@lists.linux.dev
Subject: Re: arch/arm/probes/kprobes/core.c:409:30: error: .fnstart must
 precede .save or .vsave directives
Message-ID: <YzHJRH9hO1lfjSPp@dev-arch.thelio-3990X>
References: <CA+G9fYvyD9OWF53ua2EZmyf+=YTx4f1mezDNkVLMxf3BKXW=_w@mail.gmail.com>
 <YzHIwvzhM9DSW9cF@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzHIwvzhM9DSW9cF@dev-arch.thelio-3990X>

+ our mailing list, I should have added it with that message.

On Mon, Sep 26, 2022 at 08:44:05AM -0700, Nathan Chancellor wrote:
> Hi Naresh,
> 
> On Mon, Sep 26, 2022 at 06:57:00PM +0530, Naresh Kamboju wrote:
> > Following build warnings / errors noticed on arm with clang-13 / 14
> > on Linux next-20220923.
> > 
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > 
> > Regressions found on arm:
> > 
> >    - build-clang-13-bcm2835_defconfig
> >    - build-clang-nightly-imx_v6_v7_defconfig
> >    - build-clang-nightly-orion5x_defconfig
> >    - build-clang-13-keystone_defconfig
> >    - build-clang-13-omap2plus_defconfig
> >    - build-clang-14-imx_v6_v7_defconfig
> >    - build-clang-nightly-omap2plus_defconfig
> >    - build-clang-nightly-multi_v5_defconfig
> >    - build-clang-nightly-bcm2835_defconfig
> >    - build-clang-13-imx_v6_v7_defconfig
> >    - build-clang-13-imx_v4_v5_defconfig
> >    - build-clang-14-imx_v4_v5_defconfig
> >    - build-clang-13-orion5x_defconfig
> >    - build-clang-14-multi_v5_defconfig-65236a87
> >    - build-clang-14-lkftconfig
> >    - build-clang-nightly-imx_v4_v5_defconfig
> >    - build-clang-13-multi_v5_defconfig
> >    - build-clang-13-lkftconfig
> >    - build-clang-nightly-keystone_defconfig
> >    - build-clang-14-multi_v5_defconfig
> >    - build-clang-14-orion5x_defconfig
> >    - build-clang-14-omap2plus_defconfig
> >    - build-clang-nightly-multi_v5_defconfig-65236a87
> >    - build-clang-14-bcm2835_defconfig
> >    - build-clang-14-keystone_defconfig
> >    - build-clang-nightly-lkftconfig
> > 
> > arch/arm/probes/kprobes/core.c:409:30: error: .fnstart must precede
> > .save or .vsave directives
> >                 "stmdb  sp, {sp, lr, pc}        \n\t"
> >                                                   ^
> > <inline asm>:3:2: note: instantiated into assembly here
> >         .save   {sp, lr, pc}
> >         ^
> > /builds/linux/arch/arm/probes/kprobes/core.c:412:29: error: .fnstart
> > must precede .pad directive
> >                 "stmdb  sp!, {r0 - r11}         \n\t"
> >                                                   ^
> > <inline asm>:6:2: note: instantiated into assembly here
> >         .pad    #52
> >         ^
> > 2 errors generated.
> > make[5]: *** [/builds/linux/scripts/Makefile.build:250:
> > arch/arm/probes/kprobes/core.o] Error 1
> > 
> > build log:
> > https://builds.tuxbuild.com/2FAyD1qcTlzjIYE7mjrugjCsxu1/
> 
> Thank you for the testing and report! I brought this up on GitHub on
> Friday as I noticed this as well:
> 
> https://github.com/ClangBuiltLinux/linux/issues/1718
> 
> It sounds like we can avoid this by rewriting __kretprobe_trampoline()
> in out of line assembly but I have not had a chance to sit down and try
> it.
> 
> Cheers,
> Nathan
