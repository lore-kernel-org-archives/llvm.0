Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B6D17C9E4;
	Tue, 11 Jun 2024 11:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718106144; cv=none; b=QVdz3LRhfGCD/facBL9VQjkqeERL17L3b6ofgjkueahmYgyzkfBnVH2yzD/8C+BPLlhe6tuuyxXE0aHY6tWi49TND7SouVb7C5E1vZxCORLM3KhnkF1hJPknUe1gxTVdgyhpiYjpP3bzdNwTAaNn3Xapz9L0VevNX/JUeViVL1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718106144; c=relaxed/simple;
	bh=BiPB2Ctg7NTXRTtb16mEbjJOd9PBqX0xayAmaS1s69w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jNahStSSLgU1NZlieuz0RT6EwKcl6iF7r8gFUxUmVCCZkT0yikf/8qEKCqZa/l+xkEZ3fo4Y1bW7YwvuucJNo6qqwj3JqglueT9HkCSO5WgpHI/4K8LaDCPB0nc69WTeVUH1uWBfXAbjitmd3McMpiM5ivbZ2B2mAGjNrvME4hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZgCxno/O; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZgCxno/O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718106142; x=1749642142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BiPB2Ctg7NTXRTtb16mEbjJOd9PBqX0xayAmaS1s69w=;
  b=ZgCxno/OdqcfIulMPgOSrYlG45jbfw24yb6DrfohFFM+GD6ubDIYe8Q5
   jy9xfiWIHvEhKRor2Zp8PysMg8jPlQglVF4VxrYYTlvxszB96j/ZjEjE4
   dRWsCiE+SJXOKALmZZUiJCwwYkTURkPNhrWtaIgbE+S/AmP4W0CGjJT93
   yUh/kL3nr70Zez0MS6rhfi0YAb5sAs8yV7zPV75LYIqhyaQ+nHZtjkcpW
   tfelx4Aeqnp8kAs4sGYZoXN++Sz6B3NIhM78FbcdJMVlW0Ep8mTmaGy2/
   HUONRO+tAnnv0MrJVVehSyFlLfqNmeWGVWYDhbLwaIbqlPtrYVBpZfkiv
   w==;
X-CSE-ConnectionGUID: Le0UzxNVQfqUVV3vZr0s7g==
X-CSE-MsgGUID: XAhdOi7uRvacN8FNkiP3ww==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14763018"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="14763018"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 04:42:19 -0700
X-CSE-ConnectionGUID: kk0TNnTLRbO4k7YfF5S38w==
X-CSE-MsgGUID: BnwbP1zaQdKNO9OPSn3MQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="43968638"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Jun 2024 04:42:18 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGztI-0000NL-0L;
	Tue, 11 Jun 2024 11:42:16 +0000
Date: Tue, 11 Jun 2024 19:41:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	Mateusz Polchlopek <mateusz.polchlopek@intel.com>
Subject: [tnguy-next-queue:dev-queue 65/95] ld.lld: error: undefined symbol:
 ptp_schedule_worker
Message-ID: <202406111926.YVudwbSa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   10d0e5f67bf964e5e8cc7a99ab8c1942ce3d97c7
commit: cad731b65625243ce2b7b83375ab76c7828398be [65/95] iavf: periodically cache PHC time
config: riscv-randconfig-002-20240611 (https://download.01.org/0day-ci/archive/20240611/202406111926.YVudwbSa-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4403cdbaf01379de96f8d0d6ea4f51a085e37766)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406111926.YVudwbSa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406111926.YVudwbSa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ptp_schedule_worker
   >>> referenced by iavf_ptp.c:184 (drivers/net/ethernet/intel/iavf/iavf_ptp.c:184)
   >>>               drivers/net/ethernet/intel/iavf/iavf_ptp.o:(iavf_ptp_init) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
