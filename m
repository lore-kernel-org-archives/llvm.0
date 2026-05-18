Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9909B30F924;
	Tue, 19 May 2026 02:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779156799; cv=none; b=uR2G9MgI+cAwWfxNPZcArMSHnneC1tj+B+R0fPBYSzPa4MTzbD2ATt5S7YQqwrA5Y7H0blGM8eo3oBZpmty3OyPcXDSTYApHfL2n/NnP5Gb6JUK4FSWikulcxiCUkJb6WisZG+E42UohKWOnFQDvIwkWsnUN0GnKy7xpThu61oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779156799; c=relaxed/simple;
	bh=uSFSoS25rvDVahFNcqphSXXPXecc7sjgQYUDD2nsObI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h8CuB9FgtEtQlaI0XicMIgbP7vWfksUKeGd63lrEyQolT//ADHaMb6PTAtFPuaLlwQLwrkZQUcCbpdxPZ43FS6maP8N3nogTGdXgwGmapX7WCFhH6HI0cNOv8CtP/ffugIuY53eQt+Sb8oWeIsQ3yAkXhr2zGV1B/t04PjPV3nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iLF+PYar; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iLF+PYar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779156797; x=1810692797;
  h=date:from:to:cc:subject:message-id;
  bh=uSFSoS25rvDVahFNcqphSXXPXecc7sjgQYUDD2nsObI=;
  b=iLF+PYar/GTuArTNLmlE63T3MZwKwA4RRFZEaNBWq35HKucuRLr06vjH
   J3+vWt9jHKZ0+QjcTUN28cic1ez4qrDRYjmU/NYexGGC6ECnj4h7VhYsA
   Py7EkiOq06zw20NTloTGyDFvPDJ+0/NMgaP9HNnp1PVbGMZO73RTbzXl3
   why70tuBazMSgN/5EfyltuADyR3vNP4SxJbDyhSAd+CZ1fjdYKUADJOjn
   r3PKiu8FfBauDfv405pLFLP3IXIevLtK31Dk31QdbUTGkzr0TQGrZdtTL
   YPT6/ismL5Nt2UaEGPGtzTbWZUUT6xOOZfz1dWDDgRWd4xjbzX/hK2ZCz
   g==;
X-CSE-ConnectionGUID: sg0EYyJkQXGXoxxF1wCcGg==
X-CSE-MsgGUID: 0+hI8CmVQwahXDkOtKjVmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="67553803"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="67553803"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:13:15 -0700
X-CSE-ConnectionGUID: 2mPT6jj2TWK24G1DC3KnXQ==
X-CSE-MsgGUID: JDBi2jJ0QAWLppUFT/WWsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="239684834"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 18 May 2026 19:13:14 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP9xH-00000000046-357K;
	Tue, 19 May 2026 02:13:11 +0000
Date: Tue, 19 May 2026 06:42:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.1 155/238]
 drivers/s390/cio/qdio_main.c:990:21: error: incompatible pointer to integer
 conversion assigning to 'unsigned long' from 'typeof (kzalloc_noprof(((1UL)
 << 12), (((gfp_t)(((((1UL))) << (___GFP_DIRECT_RECLAIM_BIT)) | ((((1UL))) <<
 (___GFP_KSWAPD_RECLAIM_BIT...
Message-ID: <202605190507.b2RC4n3p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.1
head:   cf8f69ff9142effba4d8d9a70a1a4f275044376c
commit: 5e2aefac8c982032671882f7d94c38317fa2e3eb [155/238] s390/qdio: replace get_zeroed_page() with kzalloc()
config: s390-defconfig (https://download.01.org/0day-ci/archive/20260519/202605190507.b2RC4n3p-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190507.b2RC4n3p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190507.b2RC4n3p-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/s390/cio/qdio_main.c:990:21: error: incompatible pointer to integer conversion assigning to 'unsigned long' from 'typeof (kzalloc_noprof(((1UL) << 12), (((gfp_t)(((((1UL))) << (___GFP_DIRECT_RECLAIM_BIT)) | ((((1UL))) << (___GFP_KSWAPD_RECLAIM_BIT)))) | ((gfp_t)((((1UL))) << (___GFP_IO_BIT))) | ((gfp_t)((((1UL))) << (___GFP_FS_BIT))))))' (aka 'void *') [-Wint-conversion]
     990 |         irq_ptr->chsc_page = kzalloc(PAGE_SIZE, GFP_KERNEL);
         |                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +990 drivers/s390/cio/qdio_main.c

   944	
   945	/**
   946	 * qdio_allocate - allocate qdio queues and associated data
   947	 * @cdev: associated ccw device
   948	 * @no_input_qs: allocate this number of Input Queues
   949	 * @no_output_qs: allocate this number of Output Queues
   950	 */
   951	int qdio_allocate(struct ccw_device *cdev, unsigned int no_input_qs,
   952			  unsigned int no_output_qs)
   953	{
   954		struct subchannel_id schid;
   955		struct qdio_irq *irq_ptr;
   956		int rc = -ENOMEM;
   957	
   958		ccw_device_get_schid(cdev, &schid);
   959		DBF_EVENT("qallocate:%4x", schid.sch_no);
   960	
   961		if (no_input_qs > QDIO_MAX_QUEUES_PER_IRQ ||
   962		    no_output_qs > QDIO_MAX_QUEUES_PER_IRQ)
   963			return -EINVAL;
   964	
   965		irq_ptr = kzalloc(PAGE_SIZE, GFP_KERNEL);
   966		if (!irq_ptr)
   967			return -ENOMEM;
   968	
   969		irq_ptr->ccw = kmalloc_obj(*irq_ptr->ccw, GFP_KERNEL | GFP_DMA);
   970		if (!irq_ptr->ccw)
   971			goto err_ccw;
   972	
   973		/* kmemleak doesn't scan the page-allocated irq_ptr: */
   974		kmemleak_not_leak(irq_ptr->ccw);
   975	
   976		irq_ptr->cdev = cdev;
   977		mutex_init(&irq_ptr->setup_mutex);
   978		if (qdio_allocate_dbf(irq_ptr))
   979			goto err_dbf;
   980	
   981		DBF_DEV_EVENT(DBF_ERR, irq_ptr, "alloc niq:%1u noq:%1u", no_input_qs,
   982			      no_output_qs);
   983	
   984		/*
   985		 * Allocate a page for the chsc calls in qdio_establish.
   986		 * Must be pre-allocated since a zfcp recovery will call
   987		 * qdio_establish. In case of low memory and swap on a zfcp disk
   988		 * we may not be able to allocate memory otherwise.
   989		 */
 > 990		irq_ptr->chsc_page = kzalloc(PAGE_SIZE, GFP_KERNEL);
   991		if (!irq_ptr->chsc_page)
   992			goto err_chsc;
   993	
   994		/* qdr is used in ccw1.cda which is u32 */
   995		irq_ptr->qdr = kzalloc(PAGE_SIZE, GFP_KERNEL | GFP_DMA);
   996		if (!irq_ptr->qdr)
   997			goto err_qdr;
   998	
   999		rc = qdio_allocate_qs(irq_ptr, no_input_qs, no_output_qs);
  1000		if (rc)
  1001			goto err_queues;
  1002	
  1003		cdev->private->qdio_data = irq_ptr;
  1004		qdio_set_state(irq_ptr, QDIO_IRQ_STATE_INACTIVE);
  1005		return 0;
  1006	
  1007	err_queues:
  1008		kfree((void *)(unsigned long) irq_ptr->qdr);
  1009	err_qdr:
  1010		kfree((void *)irq_ptr->chsc_page);
  1011	err_chsc:
  1012	err_dbf:
  1013		kfree(irq_ptr->ccw);
  1014	err_ccw:
  1015		kfree((void *)(unsigned long) irq_ptr);
  1016		return rc;
  1017	}
  1018	EXPORT_SYMBOL_GPL(qdio_allocate);
  1019	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
