Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92151C173C;
	Thu,  1 May 2025 04:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746072950; cv=none; b=i3P3LOvUE4UkQXEjAT2GtJeLCEEKjopkBtvariJZIgHIyyglwVlKXNnTizMXCeOPQ6F5XI9iJ3Z6ILYMBIGM+CQlfRV0gLTa+Hc1K1zmRP6MS9asgN7qn+NlpH/8EsJKmjW7k2Ouj1AkyhSuySj4YrsVh4vaRNSl/qCVX1Dur1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746072950; c=relaxed/simple;
	bh=TjXxlPC2qVXYFnjPf2Z+aYVYmSGz4oBr/o09GypsdUE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eNVog1WvesreYbMg2P2JdO4V6I1mEa4vegUCxjuh7us8Nti6z9EoBig9MFavm2ImU6sews3EiiNGPOXADq2FMLSgv8ZaIUmzi54NP0NKpifKsbdNpQYfuMjRisj/AQ2xU9Gww7P7cNadKuaUH23aXBH83jk3eSbzuI8KzhQHHY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+mXb2Zs; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+mXb2Zs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746072947; x=1777608947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TjXxlPC2qVXYFnjPf2Z+aYVYmSGz4oBr/o09GypsdUE=;
  b=U+mXb2ZsToEJyhVvaTWJvnXF7eGhf3HoHM6RD/XOY4YRShPmlD7BThDh
   a24nsI9JmKgiUo8A02dLS+kZjARDPxlGA31haiKp0MgyxvSPb1Hlzl8uD
   EdStcqQacTVmdTjKdcEITRkfF2kgWVJ3ypKNtXkoxaJd9kcGlIcGc99mf
   DFg7tc2cCBXjewq5CQR9b8QjO8TufLIsv2x1AqCN88bZ2U1nPq6W5IJSu
   HTp+vKowl/Pe/O5UqFSgYiXeW6w90bJAI/bRBqsjJHHXB8KDSfppB6BnN
   CzFAZ55nP37V+jiBvnRRDQsJsUTGLrKGXWBgfpsfW0k9zkwD0Yw2BWiZT
   A==;
X-CSE-ConnectionGUID: SyttwPC+Rz+R4clO1ucodQ==
X-CSE-MsgGUID: pXPcSZc3SEW6+BP9SohW/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="50407188"
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="50407188"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 21:15:45 -0700
X-CSE-ConnectionGUID: m6+G2+YkRr+FSZs6BrAhNw==
X-CSE-MsgGUID: GWgNW513SDiTD9EXQikxTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="171533757"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Apr 2025 21:15:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uALKn-0003x7-1i;
	Thu, 01 May 2025 04:15:41 +0000
Date: Thu, 1 May 2025 12:14:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_all 51/68]
 drivers/iommu/generic_pt/fmt/../kunit_generic_pt.h:447:20: warning: result
 of comparison of constant 280375465082880 with expression of type
 'pt_vaddr_t' (aka 'unsigned int') is always true
Message-ID: <202505011237.MVSM07S7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt_all
head:   e09ae4f9b47677554bf952d7c55a9e2c6ade90f8
commit: b7940ba758888328030d3a1338bf11836b963f3f [51/68] iommupt: Add the 32 bit ARMv7s page table format
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250501/202505011237.MVSM07S7-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505011237.MVSM07S7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505011237.MVSM07S7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/generic_pt/fmt/iommu_armv7s.c:11:
   In file included from drivers/iommu/generic_pt/fmt/iommu_template.h:46:
>> drivers/iommu/generic_pt/fmt/../kunit_generic_pt.h:447:20: warning: result of comparison of constant 280375465082880 with expression of type 'pt_vaddr_t' (aka 'unsigned int') is always true [-Wtautological-constant-out-of-range-compare]
     447 |         if (pgsize_bitmap != 0xff0000000000 ||
         |             ~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   1 warning generated.


vim +447 drivers/iommu/generic_pt/fmt/../kunit_generic_pt.h

4c3d5787e1c95a Jason Gunthorpe 2024-06-28  425  
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  426  static void test_lvl_possible_sizes(struct kunit *test, struct pt_state *pts,
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  427  				    void *arg)
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  428  {
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  429  	unsigned int num_items_lg2 = safe_pt_num_items_lg2(pts);
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  430  	pt_vaddr_t pgsize_bitmap = pt_possible_sizes(pts);
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  431  	unsigned int isz_lg2 = pt_table_item_lg2sz(pts);
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  432  
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  433  	if (!pt_can_have_leaf(pts)) {
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  434  		KUNIT_ASSERT_EQ(test, pgsize_bitmap, 0);
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  435  		return;
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  436  	}
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  437  
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  438  	/* No bits for sizes that would be outside this table */
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  439  	KUNIT_ASSERT_EQ(test, log2_mod(pgsize_bitmap, isz_lg2), 0);
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  440  	KUNIT_ASSERT_EQ(
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  441  		test, fvalog2_div(pgsize_bitmap, num_items_lg2 + isz_lg2), 0);
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  442  
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  443  	/*
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  444  	 * Non contiguous must be supported. AMDv1 has a HW bug where it does
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  445  	 * not support it on one of the levels.
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  446  	 */
4c3d5787e1c95a Jason Gunthorpe 2024-06-28 @447  	if (pgsize_bitmap != 0xff0000000000 ||
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  448  	    strcmp(__stringify(PTPFX_RAW), "amdv1") != 0)
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  449  		KUNIT_ASSERT_TRUE(test, pgsize_bitmap & log2_to_int(isz_lg2));
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  450  	else
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  451  		KUNIT_ASSERT_NE(test, pgsize_bitmap, 0);
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  452  
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  453  	/* A contiguous entry should not span the whole table */
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  454  	if (num_items_lg2 + isz_lg2 != PT_VADDR_MAX_LG2)
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  455  		KUNIT_ASSERT_FALSE(
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  456  			test,
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  457  			pgsize_bitmap & log2_to_int(num_items_lg2 + isz_lg2));
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  458  }
4c3d5787e1c95a Jason Gunthorpe 2024-06-28  459  

:::::: The code at line 447 was first introduced by commit
:::::: 4c3d5787e1c95a17df00e741ab31c913ad08433e iommupt: Add a kunit test for Generic Page Table

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
