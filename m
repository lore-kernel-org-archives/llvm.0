Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A380417D2;
	Mon, 14 Apr 2025 01:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744592727; cv=none; b=L5mnF+JpVf57hNeRsk9TSGrKL+PjL4Nrk8fgo89utLgy52I58rwNZLOY1DJHGLAXhTAo5GjDHU/U7nHk921IuWiwltZzA5LB3wF00tCoBmuV3KfyuhHwDI/RfrrD4byo9UM4YfPNiYKNRfcaUKvWgaZ/NPIgH5Sj7mSItxKi3YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744592727; c=relaxed/simple;
	bh=jRlXu9n1IDrt5U4910lZAha10OQNfH/tM2piwnFtkew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YH41ayUVZcaQ3nXfJjXQvieEiO8AyEEp5ZRFep4evCnQro/okMEZsUk8lZdkAsfKEfefe/dbnOlwAI58n9ChAu2JDkuFl5GMmwhPvNfgMCHJWMz0mZmGMpmoo7KQLF/lbp2TjE5q6wqH46HNaPzdbDPah7OVG+Sjf9H2/823IZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d6QKA/Ju; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d6QKA/Ju"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744592725; x=1776128725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jRlXu9n1IDrt5U4910lZAha10OQNfH/tM2piwnFtkew=;
  b=d6QKA/JuykWPta3hqxD24IpYzv5sovYt2tF3HJBMLeWIebkQVHoE4Lxd
   0z8QdTLsfgU/hC3p6yE9cGRpMkkKoq7M+uraLq89lhfDCBzwLuy7o5umq
   eIaURPJae2AjrbHJtnSVNP2n/FDJzGII170iRMOkfHyOM7lFhA7T4daWz
   vDT4ypw9M5MiTaFV/xWXwFKabqCaD5uO47fYa8XVMz4aWre9p6LFqQZQb
   zrUlY7j/Tpbj/Jz3XppukIroIbFl/0lR+8Z0d7R/b8xuhVTc1tiop7Usi
   7DlmCZGQaRV87ibCOIwTkh03ASm7Ksen/ysNHGUbJJvWnpS9go8pKSHkX
   A==;
X-CSE-ConnectionGUID: BFr09HfeTXezlgq9k781bA==
X-CSE-MsgGUID: 98u/qZmWSoy54pd9Gs1CpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46060592"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="46060592"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 18:05:24 -0700
X-CSE-ConnectionGUID: 5JrwgqbTSwS2KU0mu6IKwA==
X-CSE-MsgGUID: vEmkDUerTGKqW109zTStXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="160633821"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Apr 2025 18:05:23 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u48GG-000D0Y-22;
	Mon, 14 Apr 2025 01:05:20 +0000
Date: Mon, 14 Apr 2025 09:04:25 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [weiny2:dcd-v6-2025-04-13 3/20] drivers/cxl/core/mbox.c:1434:3:
 warning: variable 'num_partitions' is uninitialized when used here
Message-ID: <202504140924.32CIeSfU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-v6-2025-04-13
head:   6e176c0c7df9883fc969f00e23bf99f444daa4a3
commit: 638e1d5342d06b4a65368753d80ffee77d9ea821 [3/20] cxl/mem: Read dynamic capacity configuration from the device
config: riscv-randconfig-002-20250414 (https://download.01.org/0day-ci/archive/20250414/202504140924.32CIeSfU-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250414/202504140924.32CIeSfU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504140924.32CIeSfU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/core/mbox.c:1434:3: warning: variable 'num_partitions' is uninitialized when used here [-Wuninitialized]
    1434 |                 num_partitions += rc;
         |                 ^~~~~~~~~~~~~~
   drivers/cxl/core/mbox.c:1415:19: note: initialize the variable 'num_partitions' to silence this warning
    1415 |         u8 num_partitions;
         |                          ^
         |                           = '\0'
   1 warning generated.


vim +/num_partitions +1434 drivers/cxl/core/mbox.c

  1395	
  1396	/**
  1397	 * cxl_dev_dc_identify() - Reads the dynamic capacity information from the
  1398	 *                         device.
  1399	 * @mbox: Mailbox to query
  1400	 * @dc_info: The dynamic partition information to return
  1401	 *
  1402	 * Read Dynamic Capacity information from the device and return the partition
  1403	 * information.
  1404	 *
  1405	 * Return: 0 if identify was executed successfully, -ERRNO on error.
  1406	 *         on error only dynamic_bytes is left unchanged.
  1407	 */
  1408	int cxl_dev_dc_identify(struct cxl_mailbox *mbox,
  1409				struct cxl_dc_partition_info *dc_info)
  1410	{
  1411		struct cxl_dc_partition_info partitions[CXL_MAX_DC_PARTITIONS];
  1412		size_t dc_resp_size = mbox->payload_size;
  1413		struct device *dev = mbox->host;
  1414		u8 start_partition;
  1415		u8 num_partitions;
  1416	
  1417		struct cxl_mbox_get_dc_config_out *dc_resp __free(kfree) =
  1418						kvmalloc(dc_resp_size, GFP_KERNEL);
  1419		if (!dc_resp)
  1420			return -ENOMEM;
  1421	
  1422		/* Read and check all partition information for validity and potential
  1423		 * debugging; see debug output in cxl_dc_check() */
  1424		start_partition = 0;
  1425		do {
  1426			int rc, i, j;
  1427	
  1428			rc = cxl_get_dc_config(mbox, start_partition, dc_resp, dc_resp_size);
  1429			if (rc < 0) {
  1430				dev_err(dev, "Failed to get DC config: %d\n", rc);
  1431				return rc;
  1432			}
  1433	
> 1434			num_partitions += rc;
  1435	
  1436			if (num_partitions < 1 || num_partitions > CXL_MAX_DC_PARTITIONS) {
  1437				dev_err(dev, "Invalid num of dynamic capacity partitions %d\n",
  1438					num_partitions);
  1439				return -EINVAL;
  1440			}
  1441	
  1442			for (i = start_partition, j = 0; i < num_partitions; i++, j++) {
  1443				rc = cxl_dc_check(dev, partitions, i,
  1444						  &dc_resp->partition[j]);
  1445				if (rc)
  1446					return rc;
  1447			}
  1448	
  1449			start_partition = num_partitions;
  1450	
  1451		} while (num_partitions < dc_resp->avail_partition_count);
  1452	
  1453		/* Return 1st partition */
  1454		dc_info->start = partitions[0].start;
  1455		dc_info->size = partitions[0].size;
  1456		dev_dbg(dev, "Returning partition 0 %zu size %zu\n",
  1457			dc_info->start, dc_info->size);
  1458	
  1459		return 0;
  1460	}
  1461	EXPORT_SYMBOL_NS_GPL(cxl_dev_dc_identify, "CXL");
  1462	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
