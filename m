Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C619B11CA0;
	Fri,  1 Nov 2024 04:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730434511; cv=none; b=AXuZErPFrCH11WdO6ULRC7GWWbLrdxeYWBn43tGdmyo3d4mJfsjDU+VVTDlNLArL/PYLucLP0M//OnSloOjs9hSNtSQd9amz11NbgarhpUK94GKJuhxc/v28p/uP4c+PoGyptbWmsQMswh3Wcot/cpCnrpSsQB4XgSrSMNnpLPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730434511; c=relaxed/simple;
	bh=9xDzoBwjMDIEAdLz66R9HUoiCdP6e1xPTsjspSdCIUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7LoK01CN02i9JpelHt9L/YKtcPxPC+jyQ/tiW7FXr4iuwBj3YyKwr03r0I1NPIsDw5CiYWTZuzqtM+GWLaJz4vAc1j2KwfDy6Jy6HF21AVE4JUExaM7RZVOJs0HZtRLL5IJ0ul/vz4hkB3yj6rNUtO7oKyipOs5TLzKmzKXR1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SyjMKO7p; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SyjMKO7p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730434509; x=1761970509;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9xDzoBwjMDIEAdLz66R9HUoiCdP6e1xPTsjspSdCIUs=;
  b=SyjMKO7pF0sGkA7A/119mNfdwIS5tD0wkOxoMdF3PFQaCom3CvwtGj0h
   XeGOCck4Ae8BoWtVSgCHlv/1kdt3qocI2eg5cz+3z6c3stpv6oLkUxUQ5
   wnagvADJh27Teedsd2c7gMPdolIuuKxyUZI22aTuoBs9R0ZK+XdZX0tAe
   rTtbOSmCJZnzwKHBsuqIjshx6Wt/SXlMWnymb4XeRGGkEdFYIkK4r6XRy
   q8OqTBVlsAYOk0Y6mI5shuTq6r2c/HRfvy6st3nXCCv3+Tq/nttBsnk5J
   mGbOArsHPU/p2CRGnAjkrNy7Gtp0HUg4+lRT9xbK1OZcU4SKtqOpaptjV
   g==;
X-CSE-ConnectionGUID: njeE5iO3Rg+HEItvwnjOkg==
X-CSE-MsgGUID: Iqc//SA6Su+1m86/k22eoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="47680051"
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="47680051"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 21:15:08 -0700
X-CSE-ConnectionGUID: N7vj03srRQquG7fIq26Hmg==
X-CSE-MsgGUID: ChZqBy5NTzu8jDUN4hdhXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="87623375"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Oct 2024 21:15:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6j3w-000h7b-1P;
	Fri, 01 Nov 2024 04:15:04 +0000
Date: Fri, 1 Nov 2024 12:14:33 +0800
From: kernel test robot <lkp@intel.com>
To: Nava kishore Manne <nava.kishore.manne@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 1/1] fpga-region: Add generic IOCTL interface for
 runtime FPGA programming
Message-ID: <202411011107.t2xWpqrr-lkp@intel.com>
References: <20241029091734.3288005-2-nava.kishore.manne@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029091734.3288005-2-nava.kishore.manne@amd.com>

Hi Nava,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.12-rc5 next-20241031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nava-kishore-Manne/fpga-region-Add-generic-IOCTL-interface-for-runtime-FPGA-programming/20241029-181743
base:   linus/master
patch link:    https://lore.kernel.org/r/20241029091734.3288005-2-nava.kishore.manne%40amd.com
patch subject: [RFC v2 1/1] fpga-region: Add generic IOCTL interface for runtime FPGA programming
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241101/202411011107.t2xWpqrr-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411011107.t2xWpqrr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411011107.t2xWpqrr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/fpga/fpga-region.c:8:
   In file included from include/linux/fpga/fpga-bridge.h:6:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/fpga/fpga-region.c:223:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     223 |                 unsigned int status;
         |                 ^
>> drivers/fpga/fpga-region.c:227:7: warning: variable 'err' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     227 |                 if (copy_to_user((void __user *)arg, &status, sizeof(status)))
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fpga/fpga-region.c:234:9: note: uninitialized use occurs here
     234 |         return err;
         |                ^~~
   drivers/fpga/fpga-region.c:227:3: note: remove the 'if' if its condition is always true
     227 |                 if (copy_to_user((void __user *)arg, &status, sizeof(status)))
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     228 |                         err = -EFAULT;
   drivers/fpga/fpga-region.c:202:9: note: initialize the variable 'err' to silence this warning
     202 |         int err;
         |                ^
         |                 = 0
   6 warnings generated.


vim +223 drivers/fpga/fpga-region.c

   198	
   199	static long fpga_region_device_ioctl(struct file *file, unsigned int cmd,
   200					     unsigned long arg)
   201	{
   202		int err;
   203		void __user *argp = (void __user *)arg;
   204		struct fpga_region_config_info config_info;
   205		struct fpga_region *region =  (struct fpga_region *)(file->private_data);
   206	
   207		switch (cmd) {
   208		case FPGA_REGION_IOCTL_LOAD:
   209			if (copy_from_user(&config_info, argp, sizeof(struct fpga_region_config_info)))
   210				return -EFAULT;
   211	
   212			err = region->region_ops->region_config_enumeration(region, &config_info);
   213	
   214			break;
   215		case FPGA_REGION_IOCTL_REMOVE:
   216			if (copy_from_user(&config_info, argp, sizeof(struct fpga_region_config_info)))
   217				return -EFAULT;
   218	
   219			err = region->region_ops->region_remove(region, &config_info);
   220	
   221			break;
   222		case FPGA_REGION_IOCTL_STATUS:
 > 223			unsigned int status;
   224	
   225			status = region->region_ops->region_status(region);
   226	
 > 227			if (copy_to_user((void __user *)arg, &status, sizeof(status)))
   228				err = -EFAULT;
   229			break;
   230		default:
   231			err = -ENOTTY;
   232		}
   233	
   234		return err;
   235	}
   236	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
