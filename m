Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F86B53A7;
	Sat,  9 Nov 2024 01:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731117571; cv=none; b=iuhYHZl2M7idAmrS8Pq9+FyBl6PjqYxnTjxe2jM+yFH/EU8OGVHaTZtvF53rmU5S51S0sXneSzI9wOA+ItPsHGcP5/4vNYn+w5fGXVnG3lbZwd0RtletCjZYHR2cGgXebfk/2ttws2T87P9O8EWv+GmETRfJ4ikL0lnA29Nx5ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731117571; c=relaxed/simple;
	bh=RL8pC2RKBKS+yRw87IPcZXlynL/Ya/+tpKtSI1cQYL4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tNopeL/SY0UhK3eisNKsVTBZyWRU9ZLQrThMPKFz/Keg/sQUQaPyT7sq8vo2nr3WJjcaezYRMw46I+kWxclWDpdkKzaKnIU95hxrjNi38v/FmImAFS56qjj9BL1ufK5g7xqonVPbvmo+cNv/ItUCDjkCsJ5QmY7yIvo/vjKQzgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aqY9jCd+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aqY9jCd+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731117569; x=1762653569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RL8pC2RKBKS+yRw87IPcZXlynL/Ya/+tpKtSI1cQYL4=;
  b=aqY9jCd+gVwTqM5UBmRzZ7UhKEFgnVHl0tFBEUfdlrhqiE943SVK4dkb
   4OXIcqMe6XA8beccKbZIkvTCW7uCMNM/T24k+rh3xZ4oX+qfgPosUajX4
   H/i/cZh53ZZsPqG9HB1CWKGXREgS/xCBehrmycdJPoFRs5aBZrARSN7Pf
   KmOoiM6Q7QYv5k11cSFbdZ1hZKyMDfOrV7SLYfuesRopnT+QMWHk/i+1g
   XyklmuPp9QjJccqRBQfZOgkbAzEJ68nenSG9npubZNIj6bhee2c6lUCa4
   U/DU8Xe2RpHkqI5IV8D/a+mcxDFpoIueB8WXAG4nSZo0T0NEn3TFh3T6S
   A==;
X-CSE-ConnectionGUID: 2DqfkliFTRe6HpjX4YoARw==
X-CSE-MsgGUID: H5RRoXmFRoeVKzKKYnW/1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34700441"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34700441"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 17:59:29 -0800
X-CSE-ConnectionGUID: CgFhjh63SqmVj9IXtkPsOA==
X-CSE-MsgGUID: 9P45AqBZQ6awpZfXSRvGwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="85821656"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Nov 2024 17:59:28 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9al3-000ryg-3A;
	Sat, 09 Nov 2024 01:59:25 +0000
Date: Sat, 9 Nov 2024 09:59:00 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bigeasy-staging:futex_local_v3 8/8] ld.lld: error: undefined
 symbol: xxh64
Message-ID: <202411090953.L1ryT6u4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git futex_local_v3
head:   ca715b99641d5113ad75a0c2f647d8cc0a87e38d
commit: ca715b99641d5113ad75a0c2f647d8cc0a87e38d [8/8] futex: Wire up all hash functions for testing.
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20241109/202411090953.L1ryT6u4-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411090953.L1ryT6u4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411090953.L1ryT6u4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xxh64
   >>> referenced by core.c
   >>>               kernel/futex/core.o:(futex_hash) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
