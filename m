Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5B9241E9
	for <llvm@lists.linux.dev>; Mon,  4 Dec 2023 18:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="k9XwJYVG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Bwa+mWa9t9Jyqa5fhOpyXs9O2/cRDmN3kPMWCUex0Jc=; b=k9XwJYVGkMrMDLoLh4nAjQ10yB
	JA82oqtLwxB4l8ixHe0Q1l6os0C5NTD7yuLM1NPFI3oCR9SvPLcyltEikswkChKWWqoNeYfmdIs5B
	NNd0/t8gi9tN7LlZJxFuVvV3JPPPgOCF1mmBzPFFBG/ilKFFIcD6EiskOCj7Osg5lmsWu164eg+a+
	h6bvegq1DwigISF2gmGAZmZmvKykmF0Bwb4K1RpJRxZx1XW/lzfsX2hTO2bYy78knkwHgDDp4N2zp
	Fr3v/V4Rbny7qCaUtk3KIo2+2/ZKGZ+fRLOHwgjrQ5ugtQwoXLFK7np4jVt9iWBnlmaRfURNeWeW9
	OMUuOnBg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:32798)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rADe1-0005u1-1B;
	Mon, 04 Dec 2023 18:26:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rADe3-0000th-5Q; Mon, 04 Dec 2023 18:26:15 +0000
Date: Mon, 4 Dec 2023 18:26:15 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	clang-built-linux <llvm@lists.linux.dev>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	lkft-triage@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: clang-nightly: vdso/compat_gettimeofday.h:152:15: error:
 instruction variant requires ARMv6 or later
Message-ID: <ZW4Zx4olPp0Owz0a@shell.armlinux.org.uk>
References: <CA+G9fYvD72Vpfs2g8R+OJ6L8w9p_uaWbXpWMvnGAx_AOLabatw@mail.gmail.com>
 <20231204181304.GA2043538@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204181304.GA2043538@dev-arch.thelio-3990X>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Dec 04, 2023 at 11:13:04AM -0700, Nathan Chancellor wrote:
> Hi Naresh,
> 
> On Mon, Dec 04, 2023 at 05:33:26PM +0530, Naresh Kamboju wrote:
> > Following build errors noticed on Linux next-20231204 tag with clang-nightly
> > for arm and arm64.
> > 
> > ## Test Regressions (compared to next-20231201)
> > * arm64, build
> >   - clang-nightly-defconfig
> >   - clang-nightly-defconfig-40bc7ee5
> >   - clang-nightly-lkftconfig
> >   - clang-nightly-lkftconfig-kselftest
> > 
> > * arm, build
> >   - clang-nightly-allnoconfig
> >   - clang-nightly-axm55xx_defconfig
> >   - clang-nightly-bcm2835_defconfig
> >   - clang-nightly-clps711x_defconfig
> >   - clang-nightly-defconfig
> >   - clang-nightly-exynos_defconfig
> >   - clang-nightly-imx_v6_v7_defconfig
> >   - clang-nightly-keystone_defconfig
> >   - clang-nightly-lkftconfig
> >   - clang-nightly-lkftconfig-kselftest
> >   - clang-nightly-omap2plus_defconfig
> >   - clang-nightly-pxa910_defconfig
> >   - clang-nightly-s3c6400_defconfig
> >   - clang-nightly-s5pv210_defconfig
> >   - clang-nightly-sama5_defconfig
> >   - clang-nightly-shmobile_defconfig
> >   - clang-nightly-tinyconfig
> >   - clang-nightly-u8500_defconfig
> >   - clang-nightly-vexpress_defconfig
> > 
> > 
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > 
> > 
> > Build log on arm64:
> > ---------
> > In file included from lib/vdso/gettimeofday.c:5:
> > In file included from include/vdso/datapage.h:135:
> > arch/arm64/include/asm/vdso/compat_gettimeofday.h:152:15: error:
> > instruction variant requires ARMv6 or later
> >   152 |         asm volatile("mov %0, %1" : "=r"(ret) : "r"(_vdso_data));
> >       |                      ^
> > <inline asm>:1:2: note: instantiated into assembly here
> >     1 |         mov r4, r1
> >       |         ^

I have to wonder why Clang is complaining about "mov r4, r1" because
that certainly should not require "ARMv6 or later". On the face of it,
this to me looks like a bug in Clang.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
