Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54409246BA7;
	Sun, 14 Dec 2025 23:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765754395; cv=none; b=GlAnd7wsCpH/mxQwfTsldu2iFitdHyeCRwsxwpEaFpoIh1N9HNG3sC5j19LY4PXoX7UypJcykGEGz5oLIB02IrPTo2miug8ErheNZI+R1JjTDK4bxwNmxOUpt1Qwz82MzLuvtIp0lp/B0wWOo8McE3GIhVGM3aETk6/ayfOmc3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765754395; c=relaxed/simple;
	bh=/x7UEA4ecb8WA5SkBbszd7wR/m62G0CHuE+fjmF1X40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BaJxigY8Y9H8HrZq6InPl5SEQBOclUdpfx2av1qTg2mNZjg4kltU7l0ehAIVjObu2fPkYu91gl7fpgnw3fbK27tpiAkjWHSDPaUHEgTJn0i6XQmZy0QEJv2FsrEVq4LIyMb4qMWKQXZHhlPYpMSSwwl07YPwi24rVpWP0gDgaRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bMI18dCN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bMI18dCN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765754394; x=1797290394;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/x7UEA4ecb8WA5SkBbszd7wR/m62G0CHuE+fjmF1X40=;
  b=bMI18dCNKWskbcNkAmvcc2nTen4aGFv3k6lgT/5VwuShAKvVKNfPV/3w
   r20IYNuLUbtH2Sm/xI1mrpmLRFWqelyvzLsAeNO4yDLXymaf3puoQUEX9
   6T3Hbh8HNgdNra0u/kktUDA/UYxr159nae0oypdGv+oy4myu6t/0xFZdt
   h7C6LFP07TKWCD1FnyMFkifkTa4ds9wdrckVcCI0ukIkP7HmpnpWyJtbB
   znaHHs+QhRC8u5BA5Oaoc97kHwyFv6pNfPJB2MEK/i6PGNdRpWnGWxjTp
   mukXXYV2uEip3QuI1+w98teGWw7WC/fZYN0n76ESWyg2az16gaIdiMPXP
   w==;
X-CSE-ConnectionGUID: TpWpClDwSLSQdXfyt0tLRA==
X-CSE-MsgGUID: lwjZZgH7SeipiA4GcJGBmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="79117718"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="79117718"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 15:19:53 -0800
X-CSE-ConnectionGUID: 1HeYMiUATAmILM7d7xrvHw==
X-CSE-MsgGUID: sCR42K/ATE+5TGNCEBicEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="197198302"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 14 Dec 2025 15:19:50 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUvNT-000000002Uu-3x2e;
	Sun, 14 Dec 2025 23:19:47 +0000
Date: Mon, 15 Dec 2025 00:19:16 +0100
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, simona@ffwll.ch, airlied@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] vt: Remove con_debug_enter/_leave from struct consw
Message-ID: <202512150014.F2rxSlJ4-lkp@intel.com>
References: <20251208102851.40894-3-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208102851.40894-3-tzimmermann@suse.de>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on tty/tty-next tty/tty-linus linus/master v6.19-rc1 next-20251212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/vt-Remove-trailing-whitespace/20251208-183541
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20251208102851.40894-3-tzimmermann%40suse.de
patch subject: [PATCH 2/2] vt: Remove con_debug_enter/_leave from struct consw
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251215/202512150014.F2rxSlJ4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150014.F2rxSlJ4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150014.F2rxSlJ4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/core/fbcon.c:3176:3: error: field designator 'con_debug_enter' does not refer to any field in type 'const struct consw'
    3176 |         .con_debug_enter        = fbcon_debug_enter,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/video/fbdev/core/fbcon.c:3177:3: error: field designator 'con_debug_leave' does not refer to any field in type 'const struct consw'
    3177 |         .con_debug_leave        = fbcon_debug_leave,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +3176 drivers/video/fbdev/core/fbcon.c

fe2d70d6f6ff03 drivers/video/fbdev/core/fbcon.c Simona Vetter  2019-05-28  3154  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3155  /*
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3156   *  The console `switch' structure for the frame buffer based console
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3157   */
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3158  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3159  static const struct consw fb_con = {
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3160  	.owner			= THIS_MODULE,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3161  	.con_startup 		= fbcon_startup,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3162  	.con_init 		= fbcon_init,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3163  	.con_deinit 		= fbcon_deinit,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3164  	.con_clear 		= fbcon_clear,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3165  	.con_putcs 		= fbcon_putcs,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3166  	.con_cursor 		= fbcon_cursor,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3167  	.con_scroll 		= fbcon_scroll,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3168  	.con_switch 		= fbcon_switch,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3169  	.con_blank 		= fbcon_blank,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3170  	.con_font_set 		= fbcon_set_font,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3171  	.con_font_get 		= fbcon_get_font,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3172  	.con_font_default	= fbcon_set_def_font,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3173  	.con_set_palette 	= fbcon_set_palette,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3174  	.con_invert_region 	= fbcon_invert_region,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3175  	.con_resize             = fbcon_resize,
d219adc1228a38 drivers/video/console/fbcon.c    Jesse Barnes   2010-08-02 @3176  	.con_debug_enter	= fbcon_debug_enter,
d219adc1228a38 drivers/video/console/fbcon.c    Jesse Barnes   2010-08-02 @3177  	.con_debug_leave	= fbcon_debug_leave,
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3178  };
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3179  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
