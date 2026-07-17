Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2290E28A72F;
	Fri, 17 Jul 2026 22:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784327050; cv=none; b=HXCdds16dYkS+z2azrtMlBBFfrgYUGJSmnkXiSzWiwAl1AIWpk7tmMRzMA+XSWSUKEMnXwvHbgJPCyl7KJq8uelSKR2ObDvZAN8LwKRTkIzDhzev/bsCMkRIkdSoXpUS4nOGLQuj98sXQWmYDM0cZfOOIg/Xu4ILtD/3drlmezw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784327050; c=relaxed/simple;
	bh=Oswjt0k9L3ZCLghFhdskViCwobLBomJ/5ehv+Re/VGc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K1Pzf5CuJvFfiYTaUbXuCdHHvy+cATdx+2GloB/lSXK90Uz/LR1xaPGAvrgQqz9FsAmHdbctl1b8X7uNl62+pqxjWbtmlUnMMcrKnU3swk8XwGsbPhWTcTb9ZUg6/ZMmk1sJ+wElIvyE1p1vC7idgti1xDdbagV4lgVgn+KERuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WBQCYiEz; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WBQCYiEz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784327048; x=1815863048;
  h=date:from:to:cc:subject:message-id;
  bh=Oswjt0k9L3ZCLghFhdskViCwobLBomJ/5ehv+Re/VGc=;
  b=WBQCYiEzZkl2de9ffioMhz3n96LGnYZq8fOIuL99FuQnPw7mwDdLM5DW
   8Hdp6OgqRYwyofmHKPYQbJYAxBKDfYCB5tQiRLMi6bB9KHezu9osEeW9u
   0/rlcPDrj2B7kqhvBJ0SgFmxevKJRPOCf3ti2ebdd8+eHRMOCCm3giJrJ
   FdbwYrIpZsC3sV8b2VrKQFZ6wTjS3B7+K2ndO1JIMfw1UCuFhb1TcA6ig
   IVFIBE2zRGR/VuI3fWP03Ad+RqK5qt1qopyAMdgIG5LceFMb0baUuSjsb
   1FrfYXyAaeHr+VEiweT0nAQ6oNap1skYg/m9XmPL/0byUXJaNaw09z9vj
   Q==;
X-CSE-ConnectionGUID: NCXp0cdjTqSf3sVI3acQPw==
X-CSE-MsgGUID: sGu+a/v8SVSk14cWAXV6uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="72540776"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="72540776"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 15:24:07 -0700
X-CSE-ConnectionGUID: ikV+b76tTKK/KxzmFWVI7w==
X-CSE-MsgGUID: Oji4h2ZlQKiY4vNWXkE1JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="281347853"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jul 2026 15:24:05 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkqyR-000000005ej-2VSM;
	Fri, 17 Jul 2026 22:24:03 +0000
Date: Sat, 18 Jul 2026 00:23:36 +0200
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/managed_nodes/rfc5 37/81]
 Warning: mm/mempolicy.c:2469 expecting prototype for alloc_pages_mpol().
 Prototype was for mpol_zonelist() instead
Message-ID: <202607180039.wwSDEnOr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/rfc5
head:   0d3372ae148c7edad4bf772949f6a2852a059b6d
commit: fc440558999c0e94f91c3ca2650bf9b691d598ac [37/81] mm/mempolicy: add MPOL_F_PRIVATE and zonelist selection
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260718/202607180039.wwSDEnOr-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180039.wwSDEnOr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607180039.wwSDEnOr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/mempolicy.c:2469 expecting prototype for alloc_pages_mpol(). Prototype was for mpol_zonelist() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
