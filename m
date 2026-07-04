Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E3E298CAB;
	Sat,  4 Jul 2026 17:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783186924; cv=none; b=Wcu4GCW7g3TrE8EKmcWT2BMioyFI/30cFu19bRYxaGQ2TMjd54jURgMQ9w6deH3Zx5P4ul5JgPLK7Bg+JEITYf7qOqj8+xoK2+faZUBhGwrvbwwlmChwMTX+XI12ZgOsHw8OQntLxbtJEJuHZHbZ7cCOih6/IhfRbe3NZlwSwDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783186924; c=relaxed/simple;
	bh=lP20iD2/yM8zpQ8AXBCmnZ3ySgfCY1xuCJ+Vkl9xvI4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tH6+LHG1zw15aCJxereSLFUbimEKFY8XYS+vGDtHIw3wNMACXli/0kgZ8SX1KO4tPKIH6XxNzZKmilPCIV7F4l9s15SvbLAKxvpHKcXGeKR1ZpAu0fvugT4eKIqPSw7iig0qtHJGfNxhcusBmcvqBSA8NMqTF229fbZyfFUp+nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dTvMr9FB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dTvMr9FB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783186922; x=1814722922;
  h=date:from:to:cc:subject:message-id;
  bh=lP20iD2/yM8zpQ8AXBCmnZ3ySgfCY1xuCJ+Vkl9xvI4=;
  b=dTvMr9FBbQo0wC5FnqLo5IzinjSCy/3Pq5K2MhKmNjtN4fiY8eE326Mq
   3LSYHfzkqJB848f2uEcP0gpNpMNXcyA8dh61A/sbCtCduxnbime0WC4EW
   W9a0FiSl1mPvyW7Y70rIdAr5YAFyAnjibBtCrg/jq/nFzSL7tyqikxPxl
   Ck4y7s2BHkCbNAD9Rqm6uTAvc+a/Lqd4u5aDui9vvkfSOcR6iEHSRUkb4
   BtVD5tOUY5RLh8ohsTi+XqoEPRymG4PetoGaqtsa/HzumL1yvZ7U2Hb5w
   /70th3YKhZW3T5aDfVaacpQzTFDvZ5gvSwxMOhqlCWRU4D5WIIGEFLvOz
   Q==;
X-CSE-ConnectionGUID: ubuqDUISTzicAupOBjTrVw==
X-CSE-MsgGUID: F+OIjHbRQvepNd1xpSeVmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11837"; a="86436941"
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="86436941"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 10:42:02 -0700
X-CSE-ConnectionGUID: 1wG8N9MNTY6ENMbMR46yiw==
X-CSE-MsgGUID: XHku7kJZQiC4b+qoutbNYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="246958287"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 04 Jul 2026 10:42:00 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wg4NK-00000000DC7-1NnF;
	Sat, 04 Jul 2026 17:41:58 +0000
Date: Sun, 05 Jul 2026 01:41:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: 
 [bod:qcom-laptops-v6.18-rc4-camss-icp-bps-ipe-icp-boots+stats-b4 121/121]
 usr/include/linux/videodev2.h:2550:20: error: field has incomplete type
 'struct timespec'
Message-ID: <202607050136.f7zoWXgo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bod/linux.git qcom-laptops-v6.18-rc4-camss-icp-bps-ipe-icp-boots+stats-b4
head:   ebd1e440443121d18f730ab2aeea5586a754f36f
commit: ebd1e440443121d18f730ab2aeea5586a754f36f [121/121] media: uapi: qcom-camss-stats-params
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260705/202607050136.f7zoWXgo-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260705/202607050136.f7zoWXgo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607050136.f7zoWXgo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/linux/media/qcom/camss/camss-stats-params.h:102:
>> usr/include/linux/videodev2.h:2550:20: error: field has incomplete type 'struct timespec'
    2550 |         struct timespec                 timestamp;
         |                                         ^
   usr/include/linux/videodev2.h:2550:9: note: forward declaration of 'struct timespec'
    2550 |         struct timespec                 timestamp;
         |                ^
   1 error generated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
