Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4041C6A1;
	Wed, 24 Jul 2024 02:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721787546; cv=none; b=UAEctPqLXDwM8pPpl/vr1Ju95IEZpnKhhDjsh0Vzj5YwRV9AzVNZx9V30r4/aAmt4IFg+ow6TPwtYt5T/tY7C2xc2I8BqVRH2pwv33oExpHypNpW6yNzxDCn96SAEbVatmGaMk3x5KK1+Ck1GaPSktrhVaNosbrx1/UOxUB7I9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721787546; c=relaxed/simple;
	bh=AX7TCzOqF+kRV52BtSQ5g+nfPZuolJtzec1v4oyt74Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6rmvysxC0EAZAj2mYpyfUUgVLzruOFTuzW7NhEGlY8l9gin1ssUmsb0v6o4cCbpoQ4bSyx8qoJdxx3lythcMm9aYkKrLixvQYGlAYcih7bpWnDXr4uncK7JDgtvthyr1jvlLHc0aVqlR2foxdoCarDbBdHTEJfdbPKRw0PgX7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J7A0X0YQ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J7A0X0YQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721787544; x=1753323544;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AX7TCzOqF+kRV52BtSQ5g+nfPZuolJtzec1v4oyt74Q=;
  b=J7A0X0YQkUPSF6/honafXgQZmHLjtmylqnMFXC8TyO4t8MAxoh/YHw/y
   x2C0EjPAAuonmBs9e/Zzf4YWraJryGgMpw6Qx1Tdpa/MmEIcjBe+G+Plp
   XCI5DC3kuDc9wGbJ378hohggWw9wAbliOu2dw1N5e8VoHoTuDrJ24AZ2t
   CzI71pNJdymr/pUKhf6K3W8763sA+pZgBUc5WgBhZXuCUPEcDMBPvge6U
   X19KKGTrkZooViWuC2JbEWi2ACVohfCf2uMGl6pzlsxgJfedeWxbRk9I9
   yXTDntRtWYnBkeLkpv01F+LbmDVAPQt87ETdJvCCrTISo/FdNCPpm1aRW
   w==;
X-CSE-ConnectionGUID: ukbo0CwWS5iBx15/h6Bh/g==
X-CSE-MsgGUID: JQzOCT39Qs+TWZz1vD3yHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="30590396"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="30590396"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 19:19:03 -0700
X-CSE-ConnectionGUID: Jb5/wmEdQU2qzz/VgI1jNw==
X-CSE-MsgGUID: UrvIPvw9RDuKqQlUJ23IHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="53205678"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Jul 2024 19:19:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWRak-000mZA-2y;
	Wed, 24 Jul 2024 02:18:58 +0000
Date: Wed, 24 Jul 2024 10:18:18 +0800
From: kernel test robot <lkp@intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
	Krishnamoorthi M <krishnamoorthi.m@amd.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH 4/5] i3c: mipi-i3c-hci: Add a quirk to set timing
 parameters
Message-ID: <202407240917.PpEicOHG-lkp@intel.com>
References: <20240723173538.3493935-5-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723173538.3493935-5-Shyam-sundar.S-k@amd.com>

Hi Shyam,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.10 next-20240723]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shyam-Sundar-S-K/i3c-mipi-i3c-hci-Add-MIPI0100-ACPI-ID-to-the-I3C-Support-List/20240724-013958
base:   linus/master
patch link:    https://lore.kernel.org/r/20240723173538.3493935-5-Shyam-sundar.S-k%40amd.com
patch subject: [PATCH 4/5] i3c: mipi-i3c-hci: Add a quirk to set timing parameters
config: x86_64-buildonly-randconfig-004-20240724 (https://download.01.org/0day-ci/archive/20240724/202407240917.PpEicOHG-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407240917.PpEicOHG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407240917.PpEicOHG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i3c/master/mipi-i3c-hci/hci_quirks.c:35:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      35 |         reg_write(HCI_SCL_I3C_OD_TIMING, AMD_SCL_I3C_OD_TIMING);
         |         ^
   drivers/i3c/master/mipi-i3c-hci/hci.h:30:26: note: expanded from macro 'reg_write'
      30 | #define reg_write(r, v)         writel(v, hci->base_regs + (r))
         |                                 ^
>> drivers/i3c/master/mipi-i3c-hci/hci_quirks.c:37:9: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      37 |         data = reg_read(HCI_SDA_HOLD_SWITCH_DLY_TIMING);
         |                ^
   drivers/i3c/master/mipi-i3c-hci/hci.h:29:22: note: expanded from macro 'reg_read'
      29 | #define reg_read(r)             readl(hci->base_regs + (r))
         |                                 ^
   2 errors generated.


vim +/writel +35 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c

    30	
    31	void amd_set_od_pp_timing(struct i3c_hci *hci)
    32	{
    33		u32 data;
    34	
  > 35		reg_write(HCI_SCL_I3C_OD_TIMING, AMD_SCL_I3C_OD_TIMING);
    36		reg_write(HCI_SCL_I3C_PP_TIMING, AMD_SCL_I3C_PP_TIMING);
  > 37		data = reg_read(HCI_SDA_HOLD_SWITCH_DLY_TIMING);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
