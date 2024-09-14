Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBDA12E5D;
	Sat, 14 Sep 2024 08:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726303494; cv=none; b=tLw46LAZ8mfGB1EI/+vMT2ORtYQxVCMIn5euWX1wN71jt3Kbr+lJLw2UY2lPR3QjzmC5EawdX+3oQC/kbhWWKEfi+I+oo9cihVnPe1a9o+tFozgI27ykZHrRVz9HF0P20ja5ykBE5jW2T/pPjh1bpsXozYbUZdBFjF0S8mYBKNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726303494; c=relaxed/simple;
	bh=uqYiBYnch1mwTt2mJVwyJL+SwayFvOPF3ILi+J+qEk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFQBbTyRZqg7jE6wN1T7HE6E1hHwEvcFKNgxz9woQ3sj3+VH1M7M2BLe+qlSA5BnPo7O/NZltHy0PKLlZRTkXTtbFAzLHKq+H5CCYmZnt88peUO10iHV3piIPwYEukY+8CHzy6zk4F1qCmBIJo+WjVuAEZP2dkSYn1RV8dfDZ2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SqYgzYWt; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SqYgzYWt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726303492; x=1757839492;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uqYiBYnch1mwTt2mJVwyJL+SwayFvOPF3ILi+J+qEk0=;
  b=SqYgzYWtaO0Zz5xGSLthz0P+9xLCkx2LqUbQrc0W4WuiJmcxwI0ZYscw
   aDh42lj+Nx26osIpRhI13HPOkMs/LjXnRrXBuzNcM+noNwuqWgL0ikqZS
   3M79YqsI2YihNbRVDXPd7mucUcrv9sen8TmhN+NKq47K4yyvpCu92TXZP
   yxPT7v71NnOVSs1dyP4y+0m6uKvrzx6erKzWs6cfMz2uz46H1o/Doy0VB
   f1K6zzQFqMEgCOWcUkDp6kY2Opi+HbuqpwXrKWhwGflxBlzoj5KYpt5kO
   /vyJ7X/xgHW4rDq8OcHJGaRl9pJvEUCsXXII/s57dthvQxsrUcHI8pPeL
   A==;
X-CSE-ConnectionGUID: qMQsTsymRqO590dTMcsE5A==
X-CSE-MsgGUID: 6h7nrPz2TCCJmPb1f8L9rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25092062"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="25092062"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 01:44:51 -0700
X-CSE-ConnectionGUID: EF2Ev/HJTteT1DeFCbUNcw==
X-CSE-MsgGUID: rV6NSsHHSgmS1fHq5mw/3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="105796451"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Sep 2024 01:44:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spOOe-0007Xz-0N;
	Sat, 14 Sep 2024 08:44:48 +0000
Date: Sat, 14 Sep 2024 16:44:01 +0800
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] efi/tpm: add efi.tpm_log as a reserved region in
 820_table_firmware
Message-ID: <202409141653.Xws30k1b-lkp@intel.com>
References: <20240911104109.1831501-1-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911104109.1831501-1-usamaarif642@gmail.com>

Hi Usama,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on efi/next]
[also build test ERROR on tip/x86/core linus/master v6.11-rc7 next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/efi-tpm-add-efi-tpm_log-as-a-reserved-region-in-820_table_firmware/20240911-184309
base:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
patch link:    https://lore.kernel.org/r/20240911104109.1831501-1-usamaarif642%40gmail.com
patch subject: [RFC] efi/tpm: add efi.tpm_log as a reserved region in 820_table_firmware
config: i386-defconfig (https://download.01.org/0day-ci/archive/20240914/202409141653.Xws30k1b-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141653.Xws30k1b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141653.Xws30k1b-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/platform/efi/efi.c:175:6: error: redefinition of 'arch_update_firmware_area'
     175 | void arch_update_firmware_area(u64 addr, u64 size)
         |      ^
   include/linux/efi.h:1375:27: note: previous definition is here
    1375 | static inline void __init arch_update_firmware_area(u64 addr, u64 size)
         |                           ^
   1 error generated.


vim +/arch_update_firmware_area +175 arch/x86/platform/efi/efi.c

   173	
   174	/* Reserve firmware area if it was marked as RAM */
 > 175	void arch_update_firmware_area(u64 addr, u64 size)
   176	{
   177		if (e820__get_entry_type(addr, addr + size) == E820_TYPE_RAM) {
   178			e820__range_update_firmware(addr, size, E820_TYPE_RAM, E820_TYPE_RESERVED);
   179			e820__update_table(e820_table_firmware);
   180		}
   181	}
   182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
