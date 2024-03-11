Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB283C467;
	Mon, 11 Mar 2024 10:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710153525; cv=none; b=eEmpPw8O9RpIL1JVahhOvWnXftmX2C6KXQlzpNOfKo5x5OgaLtDPygDC/7ISoCd2nAomtedGFaIgBCGeiuc2YUTICUEMnw+UHn21JfOSjE6jDzidcyUc46hH5pwb/b7PR3Sn4ZHjoAuAs+29eh5+2XO7F4Rfvn8Th9gGVITghJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710153525; c=relaxed/simple;
	bh=W3gGk27wjmYtwUjQ1SGRwd+igJ1d8Lr8QkzZmlSXBU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=glMutBKlCrp8AVtv7KBXacdKmDY0GIJasHJ+69ARwToWY7udZhtR2p+CQFXl4O3VBT+0EVc0er9BiV02EXRjxy/g3tBFLw6RlzqUBnNnP1w4cnpP4DGIoPQTix1b6SD8HgrArAViUS1uwqZ6QxzpDyq95Oo9xsiDLGLIyzg4ekI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SdduMavW; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SdduMavW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710153523; x=1741689523;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W3gGk27wjmYtwUjQ1SGRwd+igJ1d8Lr8QkzZmlSXBU4=;
  b=SdduMavWcEC6JbDwCIA96NbbDDu0jZ52/BE8lptfOMYIh4QY2E0pG5Uk
   FOQInUe8Ad03smZ/aGRXxYVKTIVn92mp5gpriW743vQ3qw6Z5L9d4TlV9
   R558qdI/ZW+M4IuCvRx1ispeIuIaIZRQyFfN9cZTYrIFjtyDyp7HIghSr
   LMP6xXa9DNHIKDvlK92yqUrSntvWgu6238EQHvIhZQFGTLXka6LS5s19O
   yJ04DU8n6auctSUdtar+BfTv7Nzm+2wXCZpXSdUAXXgw8nvD7N3OxvJzr
   C3XFs4xALIToFy4UbZb/1VLZM32OJuacL/SvoZhSZFm8zH1fNx3tlp7Hg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="15537862"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="15537862"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 03:38:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="11695028"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Mar 2024 03:38:42 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjd3H-00094k-0z;
	Mon, 11 Mar 2024 10:38:39 +0000
Date: Mon, 11 Mar 2024 18:38:27 +0800
From: kernel test robot <lkp@intel.com>
To: Navneet Singh <navneet.singh@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:dcd-2024-03-10 7/26] drivers/cxl/core/hdm.c:445:3: warning:
 label followed by a declaration is a C23 extension
Message-ID: <202403111859.6reDudoo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-2024-03-10
head:   0dd99bd79b33de8f6e293c9a2373ca321dad33c7
commit: 97663934fa1a6024e94de32c480cece7039db3a1 [7/26] cxl/port: Add Dynamic Capacity mode support to endpoint decoders
config: arm-randconfig-001-20240311 (https://download.01.org/0day-ci/archive/20240311/202403111859.6reDudoo-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403111859.6reDudoo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403111859.6reDudoo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/cxl/core/hdm.c:7:
   In file included from drivers/cxl/cxlmem.h:11:
   In file included from drivers/cxl/cxl.h:7:
   In file included from include/linux/libnvdimm.h:14:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm/include/asm/cacheflush.h:10:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/cxl/core/hdm.c:445:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     445 |                 int rc;
         |                 ^
   2 warnings generated.


vim +445 drivers/cxl/core/hdm.c

   415	
   416	int cxl_dpa_set_mode(struct cxl_endpoint_decoder *cxled,
   417			     enum cxl_decoder_mode mode)
   418	{
   419		struct cxl_memdev *cxlmd = cxled_to_memdev(cxled);
   420		struct cxl_dev_state *cxlds = cxlmd->cxlds;
   421		struct device *dev = &cxled->cxld.dev;
   422	
   423		guard(rwsem_write)(&cxl_dpa_rwsem);
   424		if (cxled->cxld.flags & CXL_DECODER_F_ENABLE)
   425			return -EBUSY;
   426	
   427		/*
   428		 * Check that the mode is supported by the current partition
   429		 * configuration
   430		 */
   431		switch (mode) {
   432		case CXL_DECODER_RAM:
   433			if (!resource_size(&cxlds->ram_res)) {
   434				dev_dbg(dev, "no available ram capacity\n");
   435				return -ENXIO;
   436			}
   437			break;
   438		case CXL_DECODER_PMEM:
   439			if (!resource_size(&cxlds->pmem_res)) {
   440				dev_dbg(dev, "no available pmem capacity\n");
   441				return -ENXIO;
   442			}
   443			break;
   444		case CXL_DECODER_DC0 ... CXL_DECODER_DC7:
 > 445			int rc;
   446	
   447			rc = dc_mode_to_region_index(mode);
   448			if (rc < 0)
   449				return rc;
   450	
   451			if (resource_size(&cxlds->dc_res[rc]) == 0) {
   452				dev_dbg(dev, "no available dynamic capacity\n");
   453				return -ENXIO;
   454			}
   455			break;
   456		default:
   457			dev_dbg(dev, "unsupported mode: %d\n", mode);
   458			return -EINVAL;
   459		}
   460	
   461		cxled->mode = mode;
   462		return 0;
   463	}
   464	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
