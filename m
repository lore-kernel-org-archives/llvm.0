Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB654E0B7D;
	Mon, 19 Oct 2026 11:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407965; cv=none; b=jnlTRoXXxwwbrvHbCtedxZe7NzJlNeCR4E/g6XhBEbn3GyJjsttP5exHv4b8KEDgUsjjw3n2msIJXNgDVR56A5iWe+6U5it8hCbOvTpWWzqhDYcmFSfCoASLN2YTUcmY0mAUXy/YKzzpQQZYEzqaeL3qYvOHrxni7SqLH4goz6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407965; c=relaxed/simple;
	bh=jdcE7CavQjBaeRB2gqAjIU1V2Qkw94QPdQpetUuMqFQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KIP5kCFDsEdc80LymNnGwf5hQUpXWEptad2G8L5sPT6xVyMFkHU1xF4OUVabc/razVbJX6ChEih77tYEW7l/Cuvhn0Bt9nfD0C2DKf4AttHhfsp5mOerFIoeHwc23ZlPSeaAUEypL44F4C/NDpWwG1bYk4J7opV3b2Bcri4v+jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lOy5aTKh; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lOy5aTKh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792407962; x=1823943962;
  h=date:from:to:cc:subject:message-id;
  bh=jdcE7CavQjBaeRB2gqAjIU1V2Qkw94QPdQpetUuMqFQ=;
  b=lOy5aTKhVMt9EByBPRC/729J0gzYRkg+9kQiiHY+IjNRIMtWZMXB6LTZ
   JfYDfTN0RN7W41xCVSrAubwX+EAMCJQk9Zvoe8CdZQ9JmzNHyiL72XjP2
   MyuYjmKJNOzOLiFyqgJg/VkRr7YZHsDd2d2ScJzyK1/C9K6s6q1qDMg1R
   9zuZW1KycTVVPlPuZx40Tk0sQgJE7JZRRcNEtL0m1tKMkK6pBTsieq/5p
   e2kQpD4EKE22VZoTQlBHcaDLu0E45wf0MhA8B3Vp++kzJr1hQ4GQFmA+J
   URC2Rv6HXKwS58EfeZ+1olchWOaX8iOmHIIqL8sX8d6+wMV+BRfHt2C0q
   Q==;
X-CSE-ConnectionGUID: W+UBU4lWSa6Rq+fAeazLmQ==
X-CSE-MsgGUID: XG28YpNqQl2a99Vc3qtbXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1096975"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1096975"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 04:06:01 -0700
X-CSE-ConnectionGUID: o522qmMKRsejZMfCTcjOmQ==
X-CSE-MsgGUID: fN7jeY9+QF6ITtSNgyXrDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="4348084"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 19 Oct 2026 04:06:00 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIlBl-000000005at-3OUg;
	Mon, 19 Oct 2026 11:05:57 +0000
Date: Mon, 19 Oct 2026 13:04:57 +0200
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bcain:hexagon 41/82]
 arch/hexagon/kernel/hexagon_ksyms.c:22:15: error: use of undeclared
 identifier '__vmhwconfig'
Message-ID: <202610191251.0QhKvTtb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git hexagon
head:   35ab1dadb94646b74469738c1741f68e8c6aac3d
commit: ce5a6b702e8c793c721b2431bae81ef249eb17cc [41/82] hexagon: add the hypervisor's hwconfig call to the VM interface
config: hexagon-randconfig-2001-20261019 (https://download.01.org/0day-ci/archive/20261019/202610191251.0QhKvTtb-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 337446dacd2a713010f1c9856c21eb8d899b5613)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191251.0QhKvTtb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191251.0QhKvTtb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/hexagon/kernel/hexagon_ksyms.c:22:15: error: use of undeclared identifier '__vmhwconfig'
      22 | EXPORT_SYMBOL(__vmhwconfig);
         |               ^~~~~~~~~~~~
   1 error generated.


vim +/__vmhwconfig +22 arch/hexagon/kernel/hexagon_ksyms.c

    13	
    14	/* Additional functions */
    15	EXPORT_SYMBOL(__clear_user_hexagon);
    16	EXPORT_SYMBOL(raw_copy_from_user);
    17	EXPORT_SYMBOL(raw_copy_to_user);
    18	EXPORT_SYMBOL(__vmgetie);
    19	EXPORT_SYMBOL(vmgetie_cached);
    20	EXPORT_SYMBOL(vmsetie_cached);
    21	EXPORT_SYMBOL(__vmyield);
  > 22	EXPORT_SYMBOL(__vmhwconfig);
    23	EXPORT_SYMBOL(memcpy);
    24	EXPORT_SYMBOL(memset);
    25	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
