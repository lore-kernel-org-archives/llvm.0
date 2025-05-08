Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B230E78F32;
	Thu,  8 May 2025 16:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746723434; cv=none; b=upamEfnGEQTj5deH/KEkZYJ3z92hdMMm4n6omsVIT/A5zC1N6OwYOf3KUJmX8Hgd2qcHNMPqAEhYyoHAM1NOoIx1U4b2tEgqITIm2pe9AK1hJAdgh5KuIYDxtK1HLBgipJNs568BY3ulnAPG81KzRpKR1fEZ5kvTa1vhMznRS4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746723434; c=relaxed/simple;
	bh=xyp88IBzts/7G/Ites2vfmKKQMbCm7r8JYk9fsXDOdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TB3EaR2/LJ7BtKGZRpGD9BJKTG9WFBOpe65WYyZDG1Z7fDJsD2b6BTAZWMYzZeEicsLDSkmRcDII2KH07im6M0SHaQn93qo2LP3eSOuXvQAT8/JTdzZKcjp0av4aY5XON3g+BGz6aNQw/OnG0pWs1BBbJzy83x/09gHflkNd9S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KJZyZNXf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KJZyZNXf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE1BC4CEE7;
	Thu,  8 May 2025 16:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746723434;
	bh=xyp88IBzts/7G/Ites2vfmKKQMbCm7r8JYk9fsXDOdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KJZyZNXfW6GpH4ZYG0nqOnmgQ36w8SANpniB//fCnMhUMf73a4oTwjWdM4wEPol2L
	 ruKEcRW3X+T9dqr5t7t4dioPnzN4vfREMlhdXPNXqthvl5arvCGPSzI3azzGSlzq9c
	 dcLApmLQsMl1haoRU2JYgmT32iKtvs0T6F6odpXiDxkGilDZ0+a9rN7I88jEo0M45M
	 +TQEnXJ2WXirtA2dVK7eBCONvMcQFnKrT+sxw2JA3XTvIx50a7RyETlPCsitk48EGp
	 S2L+Qx4R2xsOj/j+DaVjoRVtDCmeOoqpPZxGgQUPsfv1EmCb9WnEd0ZyTytOJiBxcy
	 a+iurBu0j4QAA==
Date: Thu, 8 May 2025 17:57:10 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [ardb:for-kernelci 15/18]
 arch/x86/boot/startup/sev-startup.c:141:15: error: '__section__' attribute
 only applies to functions, global variables, Objective-C methods, and
 Objective-C properties
Message-ID: <20250508165710.GA2787919@ax162>
References: <202505090001.FS7smjqJ-lkp@intel.com>
 <CAMj1kXEnn0T3zCTq=b8OE0aYB6=ZQ+9p8GK_dxUyD+81d8jYHg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXEnn0T3zCTq=b8OE0aYB6=ZQ+9p8GK_dxUyD+81d8jYHg@mail.gmail.com>

On Thu, May 08, 2025 at 06:50:56PM +0200, Ard Biesheuvel wrote:
> Hey Nathan,
> 
> The error below looks bizarre to me. Any clue?
> 
> On Thu, 8 May 2025 at 18:20, kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git for-kernelci
> > head:   f309d115ff0674e0ce4fe010e587d40bfb5b6e4e
> > commit: 54ae382c92b4521365fde402a792038b968188f8 [15/18] x86/boot: Move startup code out of __head section
> > config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250509/202505090001.FS7smjqJ-lkp@intel.com/config)
> > compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090001.FS7smjqJ-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202505090001.FS7smjqJ-lkp@intel.com/
> >
> > All error/warnings (new ones prefixed by >>):
> >
> > >> arch/x86/boot/startup/sev-startup.c:141:15: error: '__section__' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
> >      141 | static struct __init cc_blob_sev_info *find_cc_blob(struct boot_params *bp)
> >          |               ^

I think this should should be

  static __init struct cc_blob_sev_info *find_cc_blob(struct boot_params *bp)

or

  static struct cc_blob_sev_info __init *find_cc_blob(struct boot_params *bp)

The __init is splitting the return type.

> >    include/linux/init.h:52:17: note: expanded from macro '__init'
> >       52 | #define __init          __section(".init.text") __cold  __latent_entropy __noinitretpoline
> >          |                         ^
> >    include/linux/compiler_attributes.h:321:56: note: expanded from macro '__section'
> >      321 | #define __section(section)              __attribute__((__section__(section)))
> >          |                                                        ^
> > >> arch/x86/boot/startup/sev-startup.c:141:15: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
> >    include/linux/init.h:52:41: note: expanded from macro '__init'
> >       52 | #define __init          __section(".init.text") __cold  __latent_entropy __noinitretpoline
> >          |                                                 ^
> >    include/linux/compiler_types.h:113:34: note: expanded from macro '__cold'
> >      113 | #define __cold                          __attribute__((__cold__))
> >          |                                                        ^
> >    1 warning and 1 error generated.
> >
> >
> > vim +/__section__ +141 arch/x86/boot/startup/sev-startup.c
> >
> >    127
> >    128  /*
> >    129   * Initial set up of SNP relies on information provided by the
> >    130   * Confidential Computing blob, which can be passed to the kernel
> >    131   * in the following ways, depending on how it is booted:
> >    132   *
> >    133   * - when booted via the boot/decompress kernel:
> >    134   *   - via boot_params
> >    135   *
> >    136   * - when booted directly by firmware/bootloader (e.g. CONFIG_PVH):
> >    137   *   - via a setup_data entry, as defined by the Linux Boot Protocol
> >    138   *
> >    139   * Scan for the blob in that order.
> >    140   */
> >  > 141  static struct __init cc_blob_sev_info *find_cc_blob(struct boot_params *bp)
> >    142  {
> >    143          struct cc_blob_sev_info *cc_info;
> >    144
> >    145          /* Boot kernel would have passed the CC blob via boot_params. */
> >    146          if (bp->cc_blob_address) {
> >    147                  cc_info = (struct cc_blob_sev_info *)(unsigned long)bp->cc_blob_address;
> >    148                  goto found_cc_info;
> >    149          }
> >    150
> >    151          /*
> >    152           * If kernel was booted directly, without the use of the
> >    153           * boot/decompression kernel, the CC blob may have been passed via
> >    154           * setup_data instead.
> >    155           */
> >    156          cc_info = find_cc_blob_setup_data(bp);
> >    157          if (!cc_info)
> >    158                  return NULL;
> >    159
> >    160  found_cc_info:
> >    161          if (cc_info->magic != CC_BLOB_SEV_HDR_MAGIC)
> >    162                  snp_abort();
> >    163
> >    164          return cc_info;
> >    165  }
> >    166
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
