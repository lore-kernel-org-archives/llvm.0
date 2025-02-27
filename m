Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B8322068A;
	Thu, 27 Feb 2025 07:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740640349; cv=none; b=lRchN/1Wz1h6MMDTLIYrN5OK/vxO1nW30GfNTXVfh7GSCo4aWRFLBS3fXO9SSxFB3IirdVflt0nZN+36ZdENqf8F+jh4lxnBWK19jwVztROsJmVJUDYlo8Kqunuh2Pxc5EJgcrs0zWdVdBkyZn15GsueHM5PFfyh3OLFWz6TyIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740640349; c=relaxed/simple;
	bh=EHkwOsTi98TGffo/fQE6AQx6mmSwXjwpLNRKCm7qY9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NOmVg5FH2C9DyX/Gn7AOnwA16m0gSb267RZz7Dy5r2BbfJ0P6VBtS6xThBV2kBAOtIa19eMHhYnIWWz12e9wSOQc3LZ8voT7kv3mZZAcEe5s0olIynEb8IqnAMu15EkB0/o6hKay1aaWoHC5lvg0u71W1c4slMaMXR5H2jN3I9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T1QGVuce; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T1QGVuce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740640348; x=1772176348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EHkwOsTi98TGffo/fQE6AQx6mmSwXjwpLNRKCm7qY9o=;
  b=T1QGVucecsv+XCESVt9j2ml/LUQSZlDSI/eu1EvdVNwuCxfv3OdYVZ1u
   Htghu8eYWQBkYL82EpBPPm7PMubyfAk/67XdmQhkYJQeX/CBqPJfkwGlJ
   XylpwawSn//CpP+xxRNX/9bxUQdGj0YGhiEdmVpiLOYZw17sJFPMLcPzE
   zSO/kwfOPsgTf2CzcifCw+GAJ4Rgosq/WP/rGjoLy5BVBCJN7ax82AY7u
   oEuzb+8yJyhhRWgDCoTbm+RQt7Q1J0TU3t1IvkdCyF/tE9s26QftkTQ2K
   qd1lAnXZYiODmhEskA3X/QpuiQTbCUv8OcmmglsmdwLejlBJoFMvUcBwj
   w==;
X-CSE-ConnectionGUID: rT8jOZzaRMmx1Z8WrWv9gQ==
X-CSE-MsgGUID: cdIBSqPBSI+RYPF4bB3Cug==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41648690"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="41648690"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 23:12:27 -0800
X-CSE-ConnectionGUID: ZEqPPcfkTWOPddNawts56Q==
X-CSE-MsgGUID: V957D0BuTy2LAuHJLiqBDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="121954904"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 26 Feb 2025 23:12:24 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnY4B-000D0b-1r;
	Thu, 27 Feb 2025 07:12:20 +0000
Date: Thu, 27 Feb 2025 15:11:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kiran K <kiran.k@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-bluetooth@vger.kernel.org,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Vijay Satija <vijay.satija@intel.com>
Subject: [bluetooth-next:master 28/29]
 drivers/bluetooth/btintel_pcie.c:134:58: warning: shift count >= width of
 type
Message-ID: <202502271502.37Q8TE9Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
head:   978777bfa2d88998f2ffa2d3405ee20b7276890a
commit: 3104ae5ad1b732140847f1f29534a448b6804d8e [28/29] Bluetooth: btintel_pcie: Setup buffers for firmware traces
config: powerpc-randconfig-001-20250227 (https://download.01.org/0day-ci/archive/20250227/202502271502.37Q8TE9Q-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502271502.37Q8TE9Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502271502.37Q8TE9Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bluetooth/btintel_pcie.c:134:58: warning: shift count >= width of type [-Wshift-count-overflow]
     134 |                 db_frag.bufs[i].buf_addr_msb = (u32)((buf->data_p_addr >> 32) & 0xffffffff);
         |                                                                        ^  ~~
   drivers/bluetooth/btintel_pcie.c:419:20: warning: unused function 'btintel_pcie_in_rom' [-Wunused-function]
     419 | static inline bool btintel_pcie_in_rom(struct btintel_pcie_data *data)
         |                    ^~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +134 drivers/bluetooth/btintel_pcie.c

    90	
    91	/* This function initializes the memory for DBGC buffers and formats the
    92	 * DBGC fragment which consists header info and DBGC buffer's LSB, MSB and
    93	 * size as the payload
    94	 */
    95	static int btintel_pcie_setup_dbgc(struct btintel_pcie_data *data)
    96	{
    97		struct btintel_pcie_dbgc_ctxt db_frag;
    98		struct data_buf *buf;
    99		int i;
   100	
   101		data->dbgc.count = BTINTEL_PCIE_DBGC_BUFFER_COUNT;
   102		data->dbgc.bufs = devm_kcalloc(&data->pdev->dev, data->dbgc.count,
   103					       sizeof(*buf), GFP_KERNEL);
   104		if (!data->dbgc.bufs)
   105			return -ENOMEM;
   106	
   107		data->dbgc.buf_v_addr = dmam_alloc_coherent(&data->pdev->dev,
   108							    data->dbgc.count *
   109							    BTINTEL_PCIE_DBGC_BUFFER_SIZE,
   110							    &data->dbgc.buf_p_addr,
   111							    GFP_KERNEL | __GFP_NOWARN);
   112		if (!data->dbgc.buf_v_addr)
   113			return -ENOMEM;
   114	
   115		data->dbgc.frag_v_addr = dmam_alloc_coherent(&data->pdev->dev,
   116							     sizeof(struct btintel_pcie_dbgc_ctxt),
   117							     &data->dbgc.frag_p_addr,
   118							     GFP_KERNEL | __GFP_NOWARN);
   119		if (!data->dbgc.frag_v_addr)
   120			return -ENOMEM;
   121	
   122		data->dbgc.frag_size = sizeof(struct btintel_pcie_dbgc_ctxt);
   123	
   124		db_frag.magic_num = BTINTEL_PCIE_MAGIC_NUM;
   125		db_frag.ver = BTINTEL_PCIE_DBGC_FRAG_VERSION;
   126		db_frag.total_size = BTINTEL_PCIE_DBGC_FRAG_PAYLOAD_SIZE;
   127		db_frag.num_buf = BTINTEL_PCIE_DBGC_FRAG_BUFFER_COUNT;
   128	
   129		for (i = 0; i < data->dbgc.count; i++) {
   130			buf = &data->dbgc.bufs[i];
   131			buf->data_p_addr = data->dbgc.buf_p_addr + i * BTINTEL_PCIE_DBGC_BUFFER_SIZE;
   132			buf->data = data->dbgc.buf_v_addr + i * BTINTEL_PCIE_DBGC_BUFFER_SIZE;
   133			db_frag.bufs[i].buf_addr_lsb = (u32)(buf->data_p_addr & 0xffffffff);
 > 134			db_frag.bufs[i].buf_addr_msb = (u32)((buf->data_p_addr >> 32) & 0xffffffff);
   135			db_frag.bufs[i].buf_size = BTINTEL_PCIE_DBGC_BUFFER_SIZE;
   136		}
   137	
   138		memcpy(data->dbgc.frag_v_addr, &db_frag, sizeof(db_frag));
   139		return 0;
   140	}
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
