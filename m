Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EAA145359;
	Thu,  8 Aug 2024 17:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723139567; cv=none; b=JnvyC2sZaAqr19PfKix7x0Crl+HNcDlcCjgK5oWkc3wrz6J1DTCU20AJH56nMvDG1RWSoxCvxAgJASqRN+n6luknjDFed5x2Wtvg3M0fgr48n4ixyNXA4o46A1NiODzJ4Ngn5UZf40mAehxh1nl88YuRbOLctS8nE8OBzGy6asw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723139567; c=relaxed/simple;
	bh=UzAImW6GGzkL/gF6ufPguduJjURr35e1U9oJWw3+mvM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=trY1SgzxeSihcwSsXPy39dyaOAsgqGkR/uq0FmdhJONfEc+sHuENJHYQJf2RBNoj5df+fcRZTO9srXhTiuWmFkep+07vLidyHaiedbgLSv0X+au8oGpnRZz5OymfYkykkah5sF1JRWHQXelNTzCrR70aTtqECwlJqClpI6lxXn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GIpZ9H/1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GIpZ9H/1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723139566; x=1754675566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UzAImW6GGzkL/gF6ufPguduJjURr35e1U9oJWw3+mvM=;
  b=GIpZ9H/1Q5ueTGS2PIc6/uIDqybUlS/r0+nVF4BAvP4OGw9q9BZ7ZLtz
   Tqf+xiS3atWmXgT9C+/cUu68DIX6M778wSJcfvOf8AaKSIGcid84FENVz
   k0BBb13V9nUR3xajiKiqWco0XUAWtAO6U/JNZfG0z+afqgfV0l8UBou8G
   fVp/usNa3EWB++iBQxZSNzFPWeyccLeLTnYrhrd6ja6/V+Iqo1BmZVMg7
   TtLpqDfuWM+5DzpE2+Lh0RT1I789epQlEyOqPsCX8to44xTuLtTeIFRzc
   65XcoGTXKZqk0gLDJ8q4P51WYFIzvPRmfeFNOXgHFCiX2xbrsNywWyNRV
   w==;
X-CSE-ConnectionGUID: Lh9sZR/FQjutg5H+2ikUeQ==
X-CSE-MsgGUID: GnEukypyQ268lLBvVi6mOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="32433600"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="32433600"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 10:52:43 -0700
X-CSE-ConnectionGUID: J/oiyeYOS1iqx3079mUGVA==
X-CSE-MsgGUID: O4CatiBORsW4D5Ow1uHSsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="57537437"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 08 Aug 2024 10:52:41 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sc7JW-0006OE-1b;
	Thu, 08 Aug 2024 17:52:38 +0000
Date: Fri, 9 Aug 2024 01:52:35 +0800
From: kernel test robot <lkp@intel.com>
To: Navneet Singh <navneet.singh@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:dcd-v4-2024-08-07 7/26] drivers/cxl/core/hdm.c:655:7:
 warning: variable 'avail' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202408090138.RB41yBE8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-v4-2024-08-07
head:   9e6891fa14e880557d502a78bae03e40402b41c6
commit: 21a8fe4d9a34b24c7c62c1e732c12413d4d82d3e [7/26] cxl/port: Add dynamic capacity size support to endpoint decoders
config: i386-buildonly-randconfig-004-20240808 (https://download.01.org/0day-ci/archive/20240809/202408090138.RB41yBE8-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090138.RB41yBE8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408090138.RB41yBE8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/core/hdm.c:655:7: warning: variable 'avail' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     655 |                 if (last) {
         |                     ^~~~
   drivers/cxl/core/hdm.c:697:13: note: uninitialized use occurs here
     697 |         if (size > avail) {
         |                    ^~~~~
   drivers/cxl/core/hdm.c:655:3: note: remove the 'if' if its condition is always false
     655 |                 if (last) {
         |                 ^~~~~~~~~~~
     656 |                         /*
         |                         ~~
     657 |                          * Some DC in this DC partition is already allocated,
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     658 |                          * that allocation already handled the skip.
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     659 |                          */
         |                          ~~
     660 |                         start = last->end + 1;
         |                         ~~~~~~~~~~~~~~~~~~~~~~
     661 |                         skip = 0;
         |                         ~~~~~~~~~
     662 |                 } else {
         |                 ~~~~~~
   drivers/cxl/core/hdm.c:596:30: note: initialize the variable 'avail' to silence this warning
     596 |         resource_size_t start, avail, skip;
         |                                     ^
         |                                      = 0
   1 warning generated.


vim +655 drivers/cxl/core/hdm.c

   588	
   589	int cxl_dpa_alloc(struct cxl_endpoint_decoder *cxled, unsigned long long size)
   590	{
   591		resource_size_t free_ram_start, free_pmem_start;
   592		struct cxl_memdev *cxlmd = cxled_to_memdev(cxled);
   593		struct cxl_port *port = cxled_to_port(cxled);
   594		struct cxl_dev_state *cxlds = cxlmd->cxlds;
   595		struct device *dev = &cxled->cxld.dev;
   596		resource_size_t start, avail, skip;
   597		struct resource *p, *last;
   598		int rc;
   599	
   600		down_write(&cxl_dpa_rwsem);
   601		if (cxled->cxld.region) {
   602			dev_dbg(dev, "decoder attached to %s\n",
   603				dev_name(&cxled->cxld.region->dev));
   604			rc = -EBUSY;
   605			goto out;
   606		}
   607	
   608		if (cxled->cxld.flags & CXL_DECODER_F_ENABLE) {
   609			dev_dbg(dev, "decoder enabled\n");
   610			rc = -EBUSY;
   611			goto out;
   612		}
   613	
   614		for (p = cxlds->ram_res.child, last = NULL; p; p = p->sibling)
   615			last = p;
   616		if (last)
   617			free_ram_start = last->end + 1;
   618		else
   619			free_ram_start = cxlds->ram_res.start;
   620	
   621		for (p = cxlds->pmem_res.child, last = NULL; p; p = p->sibling)
   622			last = p;
   623		if (last)
   624			free_pmem_start = last->end + 1;
   625		else
   626			free_pmem_start = cxlds->pmem_res.start;
   627	
   628		if (cxled->mode == CXL_DECODER_RAM) {
   629			start = free_ram_start;
   630			avail = cxlds->ram_res.end - start + 1;
   631			skip = 0;
   632		} else if (cxled->mode == CXL_DECODER_PMEM) {
   633			resource_size_t skip_start, skip_end;
   634	
   635			start = free_pmem_start;
   636			avail = cxlds->pmem_res.end - start + 1;
   637			skip_start = free_ram_start;
   638	
   639			/*
   640			 * If some pmem is already allocated, then that allocation
   641			 * already handled the skip.
   642			 */
   643			if (cxlds->pmem_res.child &&
   644			    skip_start == cxlds->pmem_res.child->start)
   645				skip_end = skip_start - 1;
   646			else
   647				skip_end = start - 1;
   648			skip = skip_end - skip_start + 1;
   649		} else if (cxl_decoder_mode_is_dc(cxled->mode)) {
   650			int dc_index = dc_mode_to_region_index(cxled->mode);
   651	
   652			for (p = cxlds->dc_res[dc_index].child, last = NULL; p; p = p->sibling)
   653				last = p;
   654	
 > 655			if (last) {
   656				/*
   657				 * Some DC in this DC partition is already allocated,
   658				 * that allocation already handled the skip.
   659				 */
   660				start = last->end + 1;
   661				skip = 0;
   662			} else {
   663				/* Calculate skip */
   664				resource_size_t skip_start, skip_end;
   665	
   666				start = cxlds->dc_res[dc_index].start;
   667	
   668				avail = cxlds->dc_res[dc_index].end - start + 1;
   669				if ((resource_size(&cxlds->pmem_res) == 0) || !cxlds->pmem_res.child)
   670					skip_start = free_ram_start;
   671				else
   672					skip_start = free_pmem_start;
   673				/*
   674				 * If any dc region is already mapped, then that allocation
   675				 * already handled the RAM and PMEM skip.  Check for DC region
   676				 * skip.
   677				 */
   678				for (int i = dc_index - 1; i >= 0 ; i--) {
   679					if (cxlds->dc_res[i].child) {
   680						skip_start = cxlds->dc_res[i].child->end + 1;
   681						break;
   682					}
   683				}
   684	
   685				skip_end = start - 1;
   686				skip = skip_end - skip_start + 1;
   687			}
   688		} else {
   689			dev_dbg(dev, "mode not set\n");
   690			rc = -EINVAL;
   691			goto out;
   692		}
   693	
   694		dev_dbg(dev, "DPA Allocation start: %pa len: %#llx Skip: %pa\n",
   695			&start, size, &skip);
   696	
   697		if (size > avail) {
   698			dev_dbg(dev, "%pa exceeds available %s capacity: %pa\n", &size,
   699				cxl_decoder_mode_name(cxled->mode), &avail);
   700			rc = -ENOSPC;
   701			goto out;
   702		}
   703	
   704		rc = __cxl_dpa_reserve(cxled, start, size, skip);
   705	out:
   706		up_write(&cxl_dpa_rwsem);
   707	
   708		if (rc)
   709			return rc;
   710	
   711		return devm_add_action_or_reset(&port->dev, cxl_dpa_release, cxled);
   712	}
   713	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
