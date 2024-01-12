Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346896DD12;
	Fri, 12 Jan 2024 15:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CN/UJBHq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705071967; x=1736607967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aO1g+cqEmWMvQqcYqq+Q8Z459PrpLlpU201XXoDDq6U=;
  b=CN/UJBHqAyYsI+rHVhAbHXX9vUosEXtH8M4S7c/6i64sV/CD8EmiEbGo
   teIm4Tdhp3I92+owidpFEB+a3ciqphSjiYKiqo0So33B+UB0/uPjTu2+y
   +37CIdQTgb7YT7ldsCYat3Qvi8Bku4ySCIzF3TQx0tJZa6OcfMgc2B/vK
   GMY5uCAOg+rdj5E9398dVyllmsPIoFjDNdCKA5h4UrEGBnZVDKSkCS533
   47qMcSgY3oFLB52HsMoEyaDZlQ0s8xNHl8DuZLrkQl3nisucJedOaOVPh
   MFefsyw5iAGKqFj4/hPE4LHU11jNLa80LpSwfbmC3mn2G5ZF9IVQZ8zGW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6553805"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="6553805"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 07:06:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="786371179"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="786371179"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 12 Jan 2024 07:05:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOJ6G-0009aW-1x;
	Fri, 12 Jan 2024 15:05:36 +0000
Date: Fri, 12 Jan 2024 23:05:31 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie 6/51] ld.lld: error: undefined symbol:
 __dma_sync_single_for_cpu
Message-ID: <202401122315.vpxurpps-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie
head:   9d338a0014d8cae8169f15ac3348b2dd3347165e
commit: e7cbc42890e72aaf5c8841da31b87e6e8869ddb8 [6/51] xsk: use generic DMA sync shortcut instead of a custom one
config: i386-randconfig-003-20240112 (https://download.01.org/0day-ci/archive/20240112/202401122315.vpxurpps-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401122315.vpxurpps-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401122315.vpxurpps-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __dma_sync_single_for_cpu
   >>> referenced by xsk_buff_pool.c:692 (net/xdp/xsk_buff_pool.c:692)
   >>>               net/xdp/xsk_buff_pool.o:(xp_dma_sync_for_cpu_slow) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: __dma_sync_single_for_device
   >>> referenced by xsk_buff_pool.c:700 (net/xdp/xsk_buff_pool.c:700)
   >>>               net/xdp/xsk_buff_pool.o:(xp_dma_sync_for_device_slow) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
