Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5534C27B517;
	Thu, 24 Apr 2025 13:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745499613; cv=none; b=d+IIzdnh8sksQNY+VVRj3kobE1fBoH+Q1vlU3pQaMGTCOc/gXpAhTXiBXkiiC7+S8kC614Mpv3m7C/anLqjIpHsIv0SVuE1ba/Eu//ios6d8uwbdjaQpnVKxRhtjN/vqPMgh9S+RA/KXXUQpyiv1OZQDu4ghJnajt5d8MZ1FJbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745499613; c=relaxed/simple;
	bh=oFJfL3+dME0UM+OmUkJV7gt/cLmlQFJTkIGAZTM254E=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eVRzJh6D/A3trEttrdXmnDUIBtr/XaJBk4kQDEPxbgzwNCbPiks+Sv55pLEhO2romaj/KgmZPJUIz24inK8mpUrlyGFK7aY9O0NtJtCrOwg0XU1ghjwOR00ATkro9hFxINsQjX1g8FWQVqiHg+0zr+ojjkYvRukjYb28R6j7nfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F3SRi1VI; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F3SRi1VI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745499611; x=1777035611;
  h=date:from:cc:subject:message-id:mime-version;
  bh=oFJfL3+dME0UM+OmUkJV7gt/cLmlQFJTkIGAZTM254E=;
  b=F3SRi1VI8LeKGM8LYfXM3dvlvizSAMOv4RcPGsb+33CWjBJ+NrkHNhJ/
   K54/KADqG5TQQVVL858Rsfk3Pw+IKemTgkmJKtxG3fZmRQzjU8Fwyj1Km
   p4Bin7DV5S/eB9wnHOp1kY5fxyx9gLrBOV/7ThxA+3js0Oa2W6jB4C8vl
   OiHPk+zFif2Umf03vps76HNgFC7cm9r2gFu3QV6FKgYSqthmUrHB1gfU4
   JtPx2AnwUbk2cIgFS7hske7Pq5CbgG8dGcs7N+sp4RwRkdBQDrESBDo6q
   612Ak95uW38pEs6efIfSdHKSTon7yiGYWibFln9W0deKI8ASH6r5IppVr
   Q==;
X-CSE-ConnectionGUID: lBKF71wBRMCl2GVPuZRlDw==
X-CSE-MsgGUID: /RJfBwFWShSZPLnLZsg65Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47015180"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="47015180"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 06:00:11 -0700
X-CSE-ConnectionGUID: 9Dvav5V2SxeB35/IOY++3w==
X-CSE-MsgGUID: ZsfSn0MHTa+4TZzqX0+vjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="132596123"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Apr 2025 06:00:09 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7wBT-0004AD-1h;
	Thu, 24 Apr 2025 13:00:07 +0000
Date: Thu, 24 Apr 2025 20:59:11 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH v1] usb: isp1760: increase buffer size to avoid overflow
Message-ID: <202504242017.ShUkQrcZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20250423111040.GC857@altlinux.org>
References: <20250423111040.GC857@altlinux.org>
TO: "Alexey V. Vissarionov" <gremlin@altlinux.org>
TO: Rui Miguel Silva <rui.silva@linaro.org>
CC: "Alexey V. Vissarionov" <gremlin@altlinux.org>
CC: Fedor Pchelkin <pchelkin@ispras.ru>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: linux-usb@vger.kernel.org
CC: lvc-project@linuxtesting.org

Hi Alexey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.15-rc3 next-20250424]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-V-Vissarionov/usb-isp1760-increase-buffer-size-to-avoid-overflow/20250423-191222
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250423111040.GC857%40altlinux.org
patch subject: [PATCH v1] usb: isp1760: increase buffer size to avoid overflow
config: hexagon-randconfig-002-20250424 (https://download.01.org/0day-ci/archive/20250424/202504242017.ShUkQrcZ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504242017.ShUkQrcZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504242017.ShUkQrcZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/usb/isp1760/isp1760-if.c:24:
   In file included from drivers/usb/isp1760/isp1760-core.h:21:
>> drivers/usb/isp1760/isp1760-hcd.h:53:30: warning: comparison of different enumeration types ('enum isp176x_device_controller_fields' and 'enum isp176x_host_controller_fields') [-Wenum-compare]
      53 |         struct regmap_field     *fields[DC_HC_FIELD_MAX];
         |                                         ^~~~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-regs.h:271:16: note: expanded from macro 'DC_HC_FIELD_MAX'
     271 |         (DC_FIELD_MAX > HC_FIELD_MAX ? DC_FIELD_MAX : HC_FIELD_MAX)
         |          ~~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   In file included from drivers/usb/isp1760/isp1760-if.c:24:
   In file included from drivers/usb/isp1760/isp1760-core.h:21:
>> drivers/usb/isp1760/isp1760-hcd.h:53:30: warning: conditional expression between different enumeration types ('enum isp176x_device_controller_fields' and 'enum isp176x_host_controller_fields') [-Wenum-compare-conditional]
      53 |         struct regmap_field     *fields[DC_HC_FIELD_MAX];
         |                                         ^~~~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-regs.h:271:31: note: expanded from macro 'DC_HC_FIELD_MAX'
     271 |         (DC_FIELD_MAX > HC_FIELD_MAX ? DC_FIELD_MAX : HC_FIELD_MAX)
         |                                      ^ ~~~~~~~~~~~~   ~~~~~~~~~~~~
   In file included from drivers/usb/isp1760/isp1760-if.c:24:
   In file included from drivers/usb/isp1760/isp1760-core.h:22:
>> drivers/usb/isp1760/isp1760-udc.h:72:30: warning: comparison of different enumeration types ('enum isp176x_device_controller_fields' and 'enum isp176x_host_controller_fields') [-Wenum-compare]
      72 |         struct regmap_field *fields[DC_HC_FIELD_MAX];
         |                                     ^~~~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-regs.h:271:16: note: expanded from macro 'DC_HC_FIELD_MAX'
     271 |         (DC_FIELD_MAX > HC_FIELD_MAX ? DC_FIELD_MAX : HC_FIELD_MAX)
         |          ~~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   In file included from drivers/usb/isp1760/isp1760-if.c:24:
   In file included from drivers/usb/isp1760/isp1760-core.h:22:
>> drivers/usb/isp1760/isp1760-udc.h:72:30: warning: conditional expression between different enumeration types ('enum isp176x_device_controller_fields' and 'enum isp176x_host_controller_fields') [-Wenum-compare-conditional]
      72 |         struct regmap_field *fields[DC_HC_FIELD_MAX];
         |                                     ^~~~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-regs.h:271:31: note: expanded from macro 'DC_HC_FIELD_MAX'
     271 |         (DC_FIELD_MAX > HC_FIELD_MAX ? DC_FIELD_MAX : HC_FIELD_MAX)
         |                                      ^ ~~~~~~~~~~~~   ~~~~~~~~~~~~
   4 warnings generated.


vim +53 drivers/usb/isp1760/isp1760-hcd.h

    46	
    47	struct isp1760_hcd {
    48		struct usb_hcd		*hcd;
    49	
    50		void __iomem		*base;
    51	
    52		struct regmap		*regs;
  > 53		struct regmap_field	*fields[DC_HC_FIELD_MAX];
    54	
    55		bool			is_isp1763;
    56		const struct isp1760_memory_layout	*memory_layout;
    57	
    58		spinlock_t		lock;
    59		struct isp1760_slotinfo	*atl_slots;
    60		int			atl_done_map;
    61		struct isp1760_slotinfo	*int_slots;
    62		int			int_done_map;
    63		struct isp1760_memory_chunk memory_pool[ISP176x_BLOCK_MAX];
    64		struct list_head	qh_list[QH_END];
    65	
    66		/* periodic schedule support */
    67	#define	DEFAULT_I_TDPS		1024
    68		unsigned		periodic_size;
    69		unsigned		i_thresh;
    70		unsigned long		reset_done;
    71		unsigned long		next_statechange;
    72	};
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
