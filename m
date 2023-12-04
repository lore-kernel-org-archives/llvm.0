Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736612C1AB;
	Mon,  4 Dec 2023 19:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mpfSE74Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DAF1C433C7;
	Mon,  4 Dec 2023 19:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701719949;
	bh=MXwhypHm/2XEVlJLFiCiCiYnn0Tjqj3lKlj+8mfTxUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mpfSE74YGQlBzvvMt4KY8SUzEJP3DhJpui6G7u6rqCeg765mjU1ONJHXxHWDuJsp5
	 fZX9acdqO8SEPmqSFWw1yq27R/JNHi1Zro7BADiK5WL66PulgsHKreFeY77PNrJKLP
	 Mr+YajXnDxCmN9N3n6C4zsJJc9Cqx3n5xNxHhZ+ueAQy8+VGcy5AQukV9HHE+KnuZT
	 1Vpn4Xb1MGzNur7Zh4M7O3o8MYBZIAuSFf9CWlgvwSeXc/5IFh9RooicFq0wWzU54u
	 7urAI+8n5q5DNDE75EcU7bJKKWjJFZfac95ajrj1Dc110oUCrKCMZZ+I0R5iptbRbz
	 H7tK/bectefgw==
Date: Mon, 4 Dec 2023 12:59:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	clang-built-linux <llvm@lists.linux.dev>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	lkft-triage@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: clang-nightly: vdso/compat_gettimeofday.h:152:15: error:
 instruction variant requires ARMv6 or later
Message-ID: <20231204195906.GA2045328@dev-arch.thelio-3990X>
References: <CA+G9fYvD72Vpfs2g8R+OJ6L8w9p_uaWbXpWMvnGAx_AOLabatw@mail.gmail.com>
 <20231204181304.GA2043538@dev-arch.thelio-3990X>
 <ZW4Zx4olPp0Owz0a@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZW4Zx4olPp0Owz0a@shell.armlinux.org.uk>

On Mon, Dec 04, 2023 at 06:26:15PM +0000, Russell King (Oracle) wrote:
> On Mon, Dec 04, 2023 at 11:13:04AM -0700, Nathan Chancellor wrote:
> > Hi Naresh,
> > 
> > On Mon, Dec 04, 2023 at 05:33:26PM +0530, Naresh Kamboju wrote:
> > > Following build errors noticed on Linux next-20231204 tag with clang-nightly
> > > for arm and arm64.
> > > 
> > > ## Test Regressions (compared to next-20231201)
> > > * arm64, build
> > >   - clang-nightly-defconfig
> > >   - clang-nightly-defconfig-40bc7ee5
> > >   - clang-nightly-lkftconfig
> > >   - clang-nightly-lkftconfig-kselftest
> > > 
> > > * arm, build
> > >   - clang-nightly-allnoconfig
> > >   - clang-nightly-axm55xx_defconfig
> > >   - clang-nightly-bcm2835_defconfig
> > >   - clang-nightly-clps711x_defconfig
> > >   - clang-nightly-defconfig
> > >   - clang-nightly-exynos_defconfig
> > >   - clang-nightly-imx_v6_v7_defconfig
> > >   - clang-nightly-keystone_defconfig
> > >   - clang-nightly-lkftconfig
> > >   - clang-nightly-lkftconfig-kselftest
> > >   - clang-nightly-omap2plus_defconfig
> > >   - clang-nightly-pxa910_defconfig
> > >   - clang-nightly-s3c6400_defconfig
> > >   - clang-nightly-s5pv210_defconfig
> > >   - clang-nightly-sama5_defconfig
> > >   - clang-nightly-shmobile_defconfig
> > >   - clang-nightly-tinyconfig
> > >   - clang-nightly-u8500_defconfig
> > >   - clang-nightly-vexpress_defconfig
> > > 
> > > 
> > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > > 
> > > 
> > > Build log on arm64:
> > > ---------
> > > In file included from lib/vdso/gettimeofday.c:5:
> > > In file included from include/vdso/datapage.h:135:
> > > arch/arm64/include/asm/vdso/compat_gettimeofday.h:152:15: error:
> > > instruction variant requires ARMv6 or later
> > >   152 |         asm volatile("mov %0, %1" : "=r"(ret) : "r"(_vdso_data));
> > >       |                      ^
> > > <inline asm>:1:2: note: instantiated into assembly here
> > >     1 |         mov r4, r1
> > >       |         ^
> 
> I have to wonder why Clang is complaining about "mov r4, r1" because
> that certainly should not require "ARMv6 or later". On the face of it,
> this to me looks like a bug in Clang.

This is because the compat vDSO is compiled with '-mthumb' by default
and Nick helpfully pointed out on IRC that prior to ARMv6, one of the
operands to the mov had to be a HI register, which I do see in the ARM:

  Encoding T1     ARMv6*, ARMv7 if <Rd> and <Rm> both from R0-R7
                  ARMv4T, ARMv5T*, ARMv6*, ARMv7 otherwise
  MOV<c> <Rd>, <Rm>

Cheers,
Nathan
