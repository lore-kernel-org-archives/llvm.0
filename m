Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4970F15B12F;
	Mon,  7 Oct 2024 19:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728329418; cv=none; b=SS9mzi5EjS4GqcKWk72Cl+ztcR1pqH7cnxO151QXC8iThQ1ai6qoNQslyfDR81Q8bYcdQWuV+ywYwAGFtKQRd5N7Rbazvw8oOA5lMLWcRAMqv5+KZQzb2aWrWJRCf0fWiO/ZvS2UFhi74bF/ushytEb5tfU/U2scnNfdHDNYnws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728329418; c=relaxed/simple;
	bh=d71UIjPvVylIPuxCXhJBr5c48TvAa6Vb+JdJEJTKI5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t5JZc3aZwUDH0OmZ57OoYsJiMJcADSM19CCRuuiYtMfqYTcIf4Fw/ejedSfw7XYupRMoImGjRAcswjar4nTs7A8CJMwgt+ddvrgdIDbzW1cboMulG56nxT7lU7Ts17MM5Itny4omMAUT3QGgG3VYUqCKEZiMaLojk+qPjrmYkOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aA0AtyKD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aA0AtyKD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728329415; x=1759865415;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d71UIjPvVylIPuxCXhJBr5c48TvAa6Vb+JdJEJTKI5A=;
  b=aA0AtyKDmSPTJScnvO4siScHjwNdPfS6i5d1sAH3S5qABLJosgLXbL+e
   2dtfaqwX+SbVwSUMm+u7ReZAO2R2ASGkCiJJZQByCtgoCsWhx29Qwzd8x
   MEA5U7IMmC7K6HCiIeQ54JIMoWQIA+lDc6KfyOk8GlAH9NUPsq3L0f5Tk
   /InaAcfNeJIVHpOjYet516yB+zqWsvVTG44oTz4og88r1xECh5xV3F9uw
   Sb319GbS2hOErzxy71Ph8kZCxhCVhUTy2yCIlqbF93ssOQX/HC+c4NH17
   Dkgyf2af6LqTjNtbQe13IywD8bHscKXoeE77K2XoyXAshesQ7bQrP/ciJ
   Q==;
X-CSE-ConnectionGUID: oab7MchRTEWhvyJbLIibUQ==
X-CSE-MsgGUID: 8KHcB77ORUuvBlDK2oemlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27374547"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="27374547"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 12:30:13 -0700
X-CSE-ConnectionGUID: neeXZEwsQ6W4Q8giYi1+sw==
X-CSE-MsgGUID: 89/p5riiQ+idZ2WYu+dSnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="106331506"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Oct 2024 12:30:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxtQn-0005Ro-1s;
	Mon, 07 Oct 2024 19:30:09 +0000
Date: Tue, 8 Oct 2024 03:30:06 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Fontenot <nathan.fontenot@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] cxl: Update Soft Reserved resources upon region creation
Message-ID: <202410080207.DfKmNFfh-lkp@intel.com>
References: <20241004181754.8960-1-nathan.fontenot@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004181754.8960-1-nathan.fontenot@amd.com>

Hi Nathan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on linus/master v6.12-rc2 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nathan-Fontenot/cxl-Update-Soft-Reserved-resources-upon-region-creation/20241005-021920
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20241004181754.8960-1-nathan.fontenot%40amd.com
patch subject: [RFC] cxl: Update Soft Reserved resources upon region creation
config: i386-defconfig (https://download.01.org/0day-ci/archive/20241008/202410080207.DfKmNFfh-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410080207.DfKmNFfh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410080207.DfKmNFfh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/e820.c:1243:10: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
    1242 |                 pr_err("CXL DEBUG Couldn't add Soft Reserved %llx (%llx)\n",
         |                                                              ~~~~
         |                                                              %x
    1243 |                        start, len);
         |                        ^~~~~
   include/linux/printk.h:508:33: note: expanded from macro 'pr_err'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:465:60: note: expanded from macro 'printk'
     465 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:437:19: note: expanded from macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   arch/x86/kernel/e820.c:1243:17: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
    1242 |                 pr_err("CXL DEBUG Couldn't add Soft Reserved %llx (%llx)\n",
         |                                                                    ~~~~
         |                                                                    %x
    1243 |                        start, len);
         |                               ^~~
   include/linux/printk.h:508:33: note: expanded from macro 'pr_err'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:465:60: note: expanded from macro 'printk'
     465 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:437:19: note: expanded from macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   arch/x86/kernel/e820.c:1275:15: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
    1274 |                 pr_err("CXL DEBUG Adjusting resource %pr (%llx - %llx)\n",
         |                                                           ~~~~
         |                                                           %x
    1275 |                        res, new_start, new_end);
         |                             ^~~~~~~~~
   include/linux/printk.h:508:33: note: expanded from macro 'pr_err'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:465:60: note: expanded from macro 'printk'
     465 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:437:19: note: expanded from macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   arch/x86/kernel/e820.c:1275:26: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
    1274 |                 pr_err("CXL DEBUG Adjusting resource %pr (%llx - %llx)\n",
         |                                                                  ~~~~
         |                                                                  %x
    1275 |                        res, new_start, new_end);
         |                                        ^~~~~~~
   include/linux/printk.h:508:33: note: expanded from macro 'pr_err'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:465:60: note: expanded from macro 'printk'
     465 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:437:19: note: expanded from macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   arch/x86/kernel/e820.c:1286:10: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
    1285 |                 pr_err("CXL DEBUG Adjusting resource %pr (%llx - %llx)\n", res,
         |                                                           ~~~~
         |                                                           %x
    1286 |                        new_start, cxl_res->start);
         |                        ^~~~~~~~~
   include/linux/printk.h:508:33: note: expanded from macro 'pr_err'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:465:60: note: expanded from macro 'printk'
     465 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:437:19: note: expanded from macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   arch/x86/kernel/e820.c:1286:21: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
    1285 |                 pr_err("CXL DEBUG Adjusting resource %pr (%llx - %llx)\n", res,
         |                                                                  ~~~~
         |                                                                  %x
    1286 |                        new_start, cxl_res->start);
         |                                   ^~~~~~~~~~~~~~
   include/linux/printk.h:508:33: note: expanded from macro 'pr_err'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:465:60: note: expanded from macro 'printk'
     465 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:437:19: note: expanded from macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   arch/x86/kernel/e820.c:1332:10: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
    1331 |                 pr_err("CXL DEBUG Found SOFT RESERVE intersection %llx - %llx : %llx - %llx\n",
         |                                                                   ~~~~
         |                                                                   %x
    1332 |                        res->start, res->end, cfmws_res.start, cfmws_res.end);
         |                        ^~~~~~~~~~
   include/linux/printk.h:508:33: note: expanded from macro 'pr_err'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:465:60: note: expanded from macro 'printk'
     465 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)


vim +1243 arch/x86/kernel/e820.c

  1234	
  1235	static void e820__add_soft_reserve(resource_size_t start, resource_size_t len,
  1236					   unsigned long flags)
  1237	{
  1238		struct resource *res;
  1239	
  1240		res = kzalloc(sizeof(*res), GFP_KERNEL);
  1241		if (!res) {
  1242			pr_err("CXL DEBUG Couldn't add Soft Reserved %llx (%llx)\n",
> 1243			       start, len);
  1244			return;
  1245		}
  1246	
  1247		*res = DEFINE_RES_NAMED(start, len, "Soft Reserved", flags);
  1248		res->desc = IORES_DESC_SOFT_RESERVED;
  1249		pr_err("CXL DEBUG Inserting new Soft Reserved %pr\n", res);
  1250		insert_resource(&e820_sr_res, res);
  1251	}
  1252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
