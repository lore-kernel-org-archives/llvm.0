Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647801F3FDC;
	Tue, 18 Mar 2025 20:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742331006; cv=none; b=cIUdQl32Q/9qAPPZVxlsPY598er7CeRGajCruAgjxv0IOhIZ3vJCy31lziSuyHAHlOYvWmW3EiBqscahgiXQ7dAv5DZP625Z5sVqy81FFt1LalqkU1k4IHhggqsN92rb8tLuqNtJrOdLfR7LjTE6UVjNXrstiNfQq3ym9hc2/dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742331006; c=relaxed/simple;
	bh=wVVYGXc+GH7jnbA7NCJ34CsaE6AsghU+O0L3eBXQHsg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I2KA9UN8LPyFLw6tD1s1Caokdrd7/Inxy0wuPZcqOWtZqasuxFqUiSYPxmjQBiF6HvWsgPsqVuIBhcRCFt5/zDALjda8BjzAHngtUmuTlYQAkbJ0KdYzMB/o9TzgAwX1GuCa2k3dpWu1EBE8bVBVJiEpEAU2fYJAxRqk1o8K3pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FIx31cC5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FIx31cC5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742331004; x=1773867004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wVVYGXc+GH7jnbA7NCJ34CsaE6AsghU+O0L3eBXQHsg=;
  b=FIx31cC5ibmyMtxK11LsimeKXr8IOXwQlRe8TtAuahcdhlME0quU3Gxx
   Rv6FOcJiSEsjvjVreBRwgHtJnAciU5qQUzpvnetE6pG/mice3nKffs2L+
   GBxO7WyldOSmVCXgNEv7q9vY7OBfxdEquY3Crf1vV3l1vW/1khj45umsz
   zacXopSs1ud+qTsBfAp6NJ1x+tY5zJxRUw85PLyh3qE2KtMi75QrqbS/V
   TP+yBVFiJDCUgQeyG5BOkZvG/6OMwUgb71X7jBzVXMR3GIVTjM5oGrgPP
   m/gGODPm0PWuxDQT1iQzbEGhIFnin0hCOMQZ8JQgUGMF3I+Ywx0RaYkLx
   w==;
X-CSE-ConnectionGUID: lwa4Vf8URxy/l2QQYjfERw==
X-CSE-MsgGUID: m45WVTyWRn2JSVtofYaDiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="43630883"
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="43630883"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 13:50:03 -0700
X-CSE-ConnectionGUID: 0DutFGLAQQSFBalw6yKjyw==
X-CSE-MsgGUID: T89hLsmSTqeY4gvNQG34mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="122858910"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 18 Mar 2025 13:50:02 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tudsu-000EAY-2K;
	Tue, 18 Mar 2025 20:50:00 +0000
Date: Wed, 19 Mar 2025 04:49:50 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/netkit-xdp 1/1] usr/include/linux/if_link.h:1309:2:
 error: unknown type name 'u32'
Message-ID: <202503190402.vEYez0Uo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/netkit-xdp
head:   6443ab44c8f6d392c37d8e6785c278d6d00b88fb
commit: e6e60486969729b6c3a87c463e5ee9db9fdd797a [1/1] netkit: tbd
config: i386-buildonly-randconfig-004-20250319 (https://download.01.org/0day-ci/archive/20250319/202503190402.vEYez0Uo-lkp@intel.com/config)
compiler: clang version 20.1.0 (https://github.com/llvm/llvm-project 24a30daaa559829ad079f2ff7f73eb4e18095f88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250319/202503190402.vEYez0Uo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503190402.vEYez0Uo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/linux/if_arp.h:27:
   In file included from usr/include/linux/netdevice.h:32:
>> usr/include/linux/if_link.h:1309:2: error: unknown type name 'u32'
    1309 |         u32 ifindex;
         |         ^
   usr/include/linux/if_link.h:1310:2: error: unknown type name 'u32'
    1310 |         u32 queue_from;
         |         ^
   usr/include/linux/if_link.h:1311:2: error: unknown type name 'u32'
    1311 |         u32 queue_to;
         |         ^
   3 errors generated.
--
   In file included from <built-in>:1:
>> ./usr/include/linux/if_link.h:1309:2: error: unknown type name 'u32'
    1309 |         u32 ifindex;
         |         ^
   ./usr/include/linux/if_link.h:1310:2: error: unknown type name 'u32'
    1310 |         u32 queue_from;
         |         ^
   ./usr/include/linux/if_link.h:1311:2: error: unknown type name 'u32'
    1311 |         u32 queue_to;
         |         ^
   3 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
