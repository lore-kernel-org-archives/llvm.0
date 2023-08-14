Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D18DDB7
	for <llvm@lists.linux.dev>; Mon, 14 Aug 2023 22:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ryqcZH1Hvw5HNmHlq3TKESru+Cb5hlhzjBfdQfEHtNQ=; b=FQNa+HirlKOzMaY0PvKIkNJnje
	iYieoOUwFfG0h6dSHhEcmyOVRae+6INYjWO8qC34S3F7SYtG9irheBfYVs4mcQbs7tiTOxMeERwdu
	Wv825p0VzqhkFgFbDlnMMdYZVtNLrseIRTkVqlWXMaF2erRRItrfFzeqW+jIteiAT3acnwg2nVxGH
	ix+2NiK5hijny+m1pc3KiMVfY3j0la+LRYBMNzCboSmDydmHd2D9ghbyy2huzf1HZ7E/2AdwriTVN
	Dlgz586+HlWsR1Mk0VuNRiSU3yDC/E66qO11uryI9hzzFyfA+iMB4734E0AmgpKGXFkyYDVv775jW
	Vtgbfolw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56558)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qVfje-0000rf-0n;
	Mon, 14 Aug 2023 23:08:26 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qVfjd-0006Js-2v; Mon, 14 Aug 2023 23:08:25 +0100
Date: Mon, 14 Aug 2023 23:08:25 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
	kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [arm:for-next 4/4] arch/arm/vfp/vfpmodule.c:324:13: error:
 static declaration of 'VFP_bounce' follows non-static declaration
Message-ID: <ZNql2TqaVFnMKlzJ@shell.armlinux.org.uk>
References: <202308150547.m54XHV12-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308150547.m54XHV12-lkp@intel.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Aug 15, 2023 at 05:06:03AM +0800, kernel test robot wrote:
> tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git for-next
> head:   f493fedcc3016e46ecbf7ab9490ba4762723efab
> commit: f493fedcc3016e46ecbf7ab9490ba4762723efab [4/4] Merge branch 'devel-stable' into for-next
> config: arm-milbeaut_m10v_defconfig (https://download.01.org/0day-ci/archive/20230815/202308150547.m54XHV12-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150547.m54XHV12-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308150547.m54XHV12-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> arch/arm/vfp/vfpmodule.c:324:13: error: static declaration of 'VFP_bounce' follows non-static declaration
>    static void VFP_bounce(u32 trigger, u32 fpexc, struct pt_regs *regs)
>                ^
>    arch/arm/include/asm/vfp.h:105:6: note: previous declaration is here
>    void VFP_bounce(u32 trigger, u32 fpexc, struct pt_regs *regs);
>         ^
>    1 error generated.

I'm guessing this is a conflict between Arnd's patch

ae1f8d793a19 ("ARM: 9304/1: add prototype for function called only from asm")

merged in v6.5-rc1 and Ard's patch, and that part of Arnd's patch
needs to be reverted since VFP_bounce is now static. Agreed?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
