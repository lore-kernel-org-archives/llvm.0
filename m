Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB25938DE1;
	Mon, 11 Mar 2024 09:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710150946; cv=none; b=bUvXAwN47e2x2HPS/RVbu7yWgS0Ywn6IP2cXE0s2GibIAtGZRVF2CQNtULV6O2iem0BBMu/2k3BjuM9jX7a6nsu77KtEElrUQaRThgZavsjw0VTAr6vvdFMYFEOx7Llim/+MSJXqO1clDKuge2enBoZZaXgbEvcFw+Cbd6lqaUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710150946; c=relaxed/simple;
	bh=IRziA5u5KOYYRrfULdeIlofdRRWKz9z9ZrW0q4Jm2PA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hICezRe3hjRyKcr8PzLYCk+2H6MRycW/ofYRUeZSmvURSVQX8KiPavIzL7js3HQzOp4jsq2/Bv09mf2T1/+Vr/20qeo/QlprVaNwhDBnft8aRXn7p151neNOIxrNRVf8Z+MfHpu00RdSu/46MaLSQ5dJmDESkEBkZOLIjMWGSKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jOXux6/v; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jOXux6/v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710150945; x=1741686945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IRziA5u5KOYYRrfULdeIlofdRRWKz9z9ZrW0q4Jm2PA=;
  b=jOXux6/v15WvCDpBHdmsKrx8nHr7rJcXkjoQ6M6Pb7xRfr0q4poeGxND
   sH48PPbbylTZsDFUITfu7n9nBW6pYUFs3v6RqBSs48dTbcNeZm7QmxwL1
   CBNBAiKlW7YDpGIZ6j/ZfQp65blmFpCGLw7aj7TzTo8oUooAUoLzxWmch
   FH8NRwOsx+Kh/WXdALZ14ZGLa7lmKS6xShflUPAFlZTVrR0OXCM5JrFrW
   s9s/IypFIewsoEIMHS9wttx9+87Bzs9OntPU/IVys9T3mTxmEFVfGEG79
   CPQyRUDmftPFgjm+VbiPlBUIZb5wnfys779cOWZ+y2Yj2LUi2ddGkP6ZC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4940540"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="4940540"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 02:55:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="11539618"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Mar 2024 02:55:41 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjcNe-00093P-1H;
	Mon, 11 Mar 2024 09:55:38 +0000
Date: Mon, 11 Mar 2024 17:54:59 +0800
From: kernel test robot <lkp@intel.com>
To: Navneet Singh <navneet.singh@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:dcd-2024-03-10 7/26] drivers/cxl/core/hdm.c:445:3: error:
 expected expression
Message-ID: <202403111726.SaRLpSrS-lkp@intel.com>
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
config: i386-buildonly-randconfig-001-20240311 (https://download.01.org/0day-ci/archive/20240311/202403111726.SaRLpSrS-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403111726.SaRLpSrS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403111726.SaRLpSrS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cxl/core/hdm.c:445:3: error: expected expression
     445 |                 int rc;
         |                 ^
>> drivers/cxl/core/hdm.c:447:3: error: use of undeclared identifier 'rc'
     447 |                 rc = dc_mode_to_region_index(mode);
         |                 ^
   drivers/cxl/core/hdm.c:448:7: error: use of undeclared identifier 'rc'
     448 |                 if (rc < 0)
         |                     ^
   drivers/cxl/core/hdm.c:449:11: error: use of undeclared identifier 'rc'
     449 |                         return rc;
         |                                ^
   drivers/cxl/core/hdm.c:451:36: error: use of undeclared identifier 'rc'
     451 |                 if (resource_size(&cxlds->dc_res[rc]) == 0) {
         |                                                  ^
   5 errors generated.


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
 > 447			rc = dc_mode_to_region_index(mode);
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
