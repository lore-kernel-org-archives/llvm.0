Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D2B2F5A12;
	Wed, 22 Oct 2025 07:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761118388; cv=none; b=pHmnvCtA9BBGUpWf1HlKSkMLNL3kK7etrndNllFG/Tm1yWUDB9vIK/uNiUHn7qdJzOKl5LgRNQSvz9GwCYlzYL/a9wZTjSKQFY4uAocK89QMZsCNdAHMAOA2dpTpc8qvnfAxagwoCVWElH8rvYCuw2zljQZcVXQqKONdtMwveXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761118388; c=relaxed/simple;
	bh=SEQdl/DDnTQ9VJ8ZCedM9vanjwM4a2PsYlLgC2nn7So=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UBd9rAJYs3QlBw+N+tHULUMIwoGMJo2Vwl8oIzw0Iky+Dz7UfNhLez59Do7hj7L1KYm0fJJhOVunPdjrtEErhq1IVa8TWlxYpaNzj92zHy5m4J5bgLIujZtNPtzSx/tH0qsvFsDOfQxmgfTcTrh9COApgSLOFQT6msYX/f9A6Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kSg00j0x; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kSg00j0x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761118385; x=1792654385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SEQdl/DDnTQ9VJ8ZCedM9vanjwM4a2PsYlLgC2nn7So=;
  b=kSg00j0xSAu289w80USiajPdLYAAZB2uLPJG+hFxBea6X54vuEoXFWe8
   9sTOB4AwpfaqivqENEpjuy7ExAoAKmbEIYmNp5vUtgL5DclYUO2vjomXS
   H3d4pgPn+YWwizJh+Fh4Jfz9ZsAwmPOaDYfQK3zPmL2P9KvAuoaG4Z5EN
   AfwntyuwfXYCf7uIGYuJXcGgQihGbZ98budCCUQbtAlxgKBupG9Ah+YbL
   pnF/XYzHm+ROOVEytMvvrebeh401Y3b+luluZgljB+fK6IFm8Mt69mBCi
   TZZmHFWoRivrkIm2dOMFH3pttsx8YyZNvqEEHw9y4OsUC0MeIySXFwcTT
   g==;
X-CSE-ConnectionGUID: w7vBQEs3RhSxwYvvoKKASQ==
X-CSE-MsgGUID: +oSFBrt7Sd2sGdYsD3tSvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67094658"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67094658"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 00:33:05 -0700
X-CSE-ConnectionGUID: MEzP5nnDRnGPXvjWWDrxiA==
X-CSE-MsgGUID: sENikpAJQz6z0cX1m998Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="214441853"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Oct 2025 00:33:05 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBTLC-000C6F-0J;
	Wed, 22 Oct 2025 07:33:02 +0000
Date: Wed, 22 Oct 2025 15:30:52 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alobakin:libeth 7/7] ld.lld: error: duplicate symbol:
 ice_queue_mgmt_ops
Message-ID: <202510221555.oaXJsANt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux libeth
head:   cb251653bf74723c653ae96a5b5a97e57dcc7b18
commit: cb251653bf74723c653ae96a5b5a97e57dcc7b18 [7/7] ice: implement Rx queue management ops
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20251022/202510221555.oaXJsANt-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510221555.oaXJsANt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510221555.oaXJsANt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: ice_queue_mgmt_ops
   >>> defined at ice_main.c
   >>>            drivers/net/ethernet/intel/ice/ice_main.o:(ice_queue_mgmt_ops)
   >>> defined at ice_gnss.c
   >>>            drivers/net/ethernet/intel/ice/ice_gnss.o:(.rodata+0x160)
--
>> ld.lld: error: duplicate symbol: ice_queue_mgmt_ops
   >>> defined at ice_main.c
   >>>            drivers/net/ethernet/intel/ice/ice_main.o:(ice_queue_mgmt_ops)
   >>> defined at ice_tspll.c
   >>>            drivers/net/ethernet/intel/ice/ice_tspll.o:(.rodata+0x1E0)
--
>> ld.lld: error: duplicate symbol: ice_queue_mgmt_ops
   >>> defined at ice_main.c
   >>>            drivers/net/ethernet/intel/ice/ice_main.o:(ice_queue_mgmt_ops)
   >>> defined at queues.c
   >>>            drivers/net/ethernet/intel/ice/virt/queues.o:(.rodata+0xBA0)
--
>> ld.lld: error: duplicate symbol: ice_queue_mgmt_ops
   >>> defined at ice_main.c
   >>>            drivers/net/ethernet/intel/ice/ice_main.o:(ice_queue_mgmt_ops)
   >>> defined at fdir.c
   >>>            drivers/net/ethernet/intel/ice/virt/fdir.o:(.rodata+0xAC0)
--
>> ld.lld: error: duplicate symbol: ice_queue_mgmt_ops
   >>> defined at ice_main.c
   >>>            drivers/net/ethernet/intel/ice/ice_main.o:(ice_queue_mgmt_ops)
   >>> defined at ice_sriov.c
   >>>            drivers/net/ethernet/intel/ice/ice_sriov.o:(.rodata+0xD60)
--
>> ld.lld: error: duplicate symbol: ice_queue_mgmt_ops
   >>> defined at ice_main.c
   >>>            drivers/net/ethernet/intel/ice/ice_main.o:(ice_queue_mgmt_ops)
   >>> defined at ice_tc_lib.c
   >>>            drivers/net/ethernet/intel/ice/ice_tc_lib.o:(.rodata+0x3A0)
--
>> ld.lld: error: duplicate symbol: ice_queue_mgmt_ops
   >>> defined at ice_main.c
   >>>            drivers/net/ethernet/intel/ice/ice_main.o:(ice_queue_mgmt_ops)
   >>> defined at ice_repr.c
   >>>            drivers/net/ethernet/intel/ice/ice_repr.o:(.rodata+0x80)
--
>> ld.lld: error: duplicate symbol: ice_queue_mgmt_ops
   >>> defined at ice_main.c
   >>>            drivers/net/ethernet/intel/ice/ice_main.o:(ice_queue_mgmt_ops)
   >>> defined at ice_ethtool.c
   >>>            drivers/net/ethernet/intel/ice/ice_ethtool.o:(.rodata+0x200)
--
>> ld.lld: error: duplicate symbol: ice_queue_mgmt_ops
   >>> defined at ice_main.c
   >>>            drivers/net/ethernet/intel/ice/ice_main.o:(ice_queue_mgmt_ops)
   >>> defined at ice_lag.c
   >>>            drivers/net/ethernet/intel/ice/ice_lag.o:(.rodata+0x3C0)
--
>> ld.lld: error: duplicate symbol: ice_queue_mgmt_ops
   >>> defined at ice_main.c
   >>>            drivers/net/ethernet/intel/ice/ice_main.o:(ice_queue_mgmt_ops)
   >>> defined at ice_fw_update.c
   >>>            drivers/net/ethernet/intel/ice/ice_fw_update.o:(.rodata+0xC60)
--
>> ld.lld: error: duplicate symbol: ice_queue_mgmt_ops
   >>> defined at ice_main.c
   >>>            drivers/net/ethernet/intel/ice/ice_main.o:(ice_queue_mgmt_ops)
   >>> defined at ice_sf_eth.c
   >>>            drivers/net/ethernet/intel/ice/ice_sf_eth.o:(.rodata+0x1E0)
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
