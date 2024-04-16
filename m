Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BBB13342E;
	Tue, 16 Apr 2024 18:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713291438; cv=none; b=TnZpwSIrRaFToZt0wrtvcRuFB+d0PZgtjfFmlVHlHJhwsEIj+aFa1aUb9dbgm+U84qW8SjP2McSdwa/qX1FGCPFE0C5A1Z9wq5pxfRXgykehupKrDOE+tbLLEfCFNRTfBfVlPBPapTklGoPpjQqe9tR5aKiJUYx27smVKM67VVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713291438; c=relaxed/simple;
	bh=2ixCp8CuoVpG21uHSMIxZTOZU5TRoGrpceq0DVTrcWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7XDqOrwDgAlWuxcbTeLlg4EiXgUk498rzKgggu/NHNFfABs8sfVTO8bfeOYW+03DQPBYV8wS1+LCG0l6M/rCQfXvf/cAuuVJ+JiqVX/JKbZ80DyFqOtN5FIvXbI1P5VpAjfJNzDmZKdrlfAthf7CBddzx3NuLs7tkCHerJC9B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJ8iGsfx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJ8iGsfx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B14C113CE;
	Tue, 16 Apr 2024 18:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713291438;
	bh=2ixCp8CuoVpG21uHSMIxZTOZU5TRoGrpceq0DVTrcWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iJ8iGsfxjd1uPuRWxyqJH9Pxbn44OHn0b62jjcovdzLHwBD6Xo5IOuFc5YJuM/sEr
	 UQXQVbDoqlmHD57apjBFPdu/qxn1sg+lVEAwtp/cOnbE+/kIk8Na7vwMwZtKf+nWbI
	 fivzfYX89SH2PTdwafy+kKK3p4l7e7mcZetxmspgiQhzNloq+oNaI2O9NjRevGPwC1
	 sNpu+mBCtY7j26C5QLWuWlP2t/cHTvnCGPCTAQgiUn1a4L1lAIfdbiBzv/NCQt3ACi
	 Av4qmZEU9hxyTZvvXGJu7HZ1Sqkv6aiPjbikO8fXBcSyNJ9y0uYNjgL4gyzIqu8rPc
	 VmB4cWcsKz/bA==
Date: Tue, 16 Apr 2024 11:17:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: kernel test robot <lkp@intel.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [pdx86-platform-drivers-x86:review-hans 40/59]
 drivers/platform/x86/amd/pmc/mp2_stb.c:94:2: error: call to undeclared
 function 'writeq'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <20240416181715.GA509518@dev-arch.thelio-3990X>
References: <202404161050.NSNJAxvX-lkp@intel.com>
 <Zh53z2VOwRFTYhVK@smile.fi.intel.com>
 <20240416150916.GA2715839@dev-arch.thelio-3990X>
 <Zh6-MCW_szrniAnb@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zh6-MCW_szrniAnb@smile.fi.intel.com>

On Tue, Apr 16, 2024 at 09:06:40PM +0300, Andy Shevchenko wrote:
> On Tue, Apr 16, 2024 at 08:09:16AM -0700, Nathan Chancellor wrote:
> > On Tue, Apr 16, 2024 at 04:06:23PM +0300, Andy Shevchenko wrote:
> > > On Tue, Apr 16, 2024 at 10:35:55AM +0800, kernel test robot wrote:
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-hans
> > > > head:   0aae4c44b032b5ede39405dfc62900adc467f362
> > > > commit: 2dc77993cb5eb311d6bb5584d30c3d1d42d9fa4a [40/59] platform/x86/amd/pmc: Add AMD MP2 STB functionality
> > > > config: i386-randconfig-011-20240416 (https://download.01.org/0day-ci/archive/20240416/202404161050.NSNJAxvX-lkp@intel.com/config)
> > > > compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404161050.NSNJAxvX-lkp@intel.com/reproduce)
> > > > 
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202404161050.NSNJAxvX-lkp@intel.com/
> > > > 
> > > > All errors (new ones prefixed by >>):
> > > > 
> > > > >> drivers/platform/x86/amd/pmc/mp2_stb.c:94:2: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> > > >       94 |         writeq(mp2->dma_addr, mp2->mmio + AMD_C2P_MSG1);
> > > >          |         ^
> > > >    drivers/platform/x86/amd/pmc/mp2_stb.c:267:45: warning: shift count >= width of type [-Wshift-count-overflow]
> > > >      267 |         rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
> > > >          |                                                    ^~~~~~~~~~~~~~~~
> > > >    include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
> > > >       77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
> > > >          |                                                      ^ ~~~
> > > >    1 warning and 1 error generated.
> > > 
> > > This is bogus, but can perhaps be 'fixed" with GENMASK((n) - 1, 0).
> > 
> > The second warning only appears because of the first error; if the first
> > error is fixed, I suspect the second one won't appear (although I have
> > not actually checked it).
> 
> Is it confirmed? Because to me it looks not obvious at all ==> complier can be
> amended as well in warning reporting

Yes, I see no error or warning with the following diff on top of
2dc77993cb5eb311d6bb5584d30c3d1d42d9fa4a. I am not saying that is not an
issue that should be addressed, I am just explaining why the warning is
showing up at all. It happens with -Warray-bounds occasionally as well.

diff --git a/drivers/platform/x86/amd/pmc/mp2_stb.c b/drivers/platform/x86/amd/pmc/mp2_stb.c
index dfa55327e5f1..9775ddc1b27a 100644
--- a/drivers/platform/x86/amd/pmc/mp2_stb.c
+++ b/drivers/platform/x86/amd/pmc/mp2_stb.c
@@ -11,6 +11,7 @@
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/io.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/iopoll.h>
 #include <linux/pci.h>
 #include <linux/sizes.h>
