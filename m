Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03F378F3E;
	Thu, 26 Jun 2025 01:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750902957; cv=none; b=W87RimAaBdIdWB04UGJ8ThB18ydHuVnimORx9EVnFUJtmVY8Y3k+37YLan5cOe4dYL9y3ude4Bb1WUZc1dXCXUfnuaCK5RZ5PCysuOr/H95BXZwXPkBTjk0bZT1E6dtP2aXAGgzaGCwAbx36g7ER2OOxBWSgXiiVBpyUlnGRD/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750902957; c=relaxed/simple;
	bh=re19UG0IkryuzuT95VYZTRioTVmK3N5zApHZb7tP2xM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E0tpDMmhnLjZM+xO0jgODorHNsXnPX/HrPk44chfDnk9y67RadsCNTwA88HtzDtjZW4KDoO5Ekvive/cPbTdjAEnX/OlFK4GHV2mbjXmELEz17ru2vev/A4hNgOI78eHmjMfMBlXuCXwRmPnDjsI+nd1TT5WSlmWWkFy7nP1GOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B8oDKpnm; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B8oDKpnm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750902956; x=1782438956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=re19UG0IkryuzuT95VYZTRioTVmK3N5zApHZb7tP2xM=;
  b=B8oDKpnm/fPPirMtgHHEjedYJ0Xh9MCzZJIsoaQgtWz0DnUmTwjlGWZJ
   7pN7tOmpeyOCvlPohZxNH9VxPtUydfiQ1NWu04iKM5m/OywDmNSHZ4zuj
   lcjT3g6HKheTWvVwTknfVcvnWoRlekRIH76wRkcek4+xLTEZEqTcfRlvU
   /kEfsPFnpTGhaGYlUsFYVA3x6naNbxfl77mewata1tjWMGrPpEQ5j96oH
   296Nt/WYu0TwkNR3WVi3tTICkezGc8DNFqyg9z7vf3BEI3uMZT7YejC9R
   lPuGKJ38f62Y/aStDDsSvpzsauNh6cbA8OGei2UvdWliuZJLYroMoXee8
   g==;
X-CSE-ConnectionGUID: 4bvUTFv1SIKJsKD1hQdDng==
X-CSE-MsgGUID: PHr+d2/NQBCEbRYaV2bZIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="63446360"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="63446360"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 18:55:56 -0700
X-CSE-ConnectionGUID: KdvhqKorSV+6TnAXuO8E9w==
X-CSE-MsgGUID: 6xnNkEQEQGKkwbDmYsE4GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="151899156"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 Jun 2025 18:55:55 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUbqC-000TbW-0J;
	Thu, 26 Jun 2025 01:55:52 +0000
Date: Thu, 26 Jun 2025 09:55:23 +0800
From: kernel test robot <lkp@intel.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:luo/v1.1 6/26]
 kernel/liveupdate/kexec_handover_internal.h:19:22: error: expected ';' after
 struct
Message-ID: <202506260925.XlsADuaG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git luo/v1.1
head:   e4c806972f1c2e204a721e95d1fcf9fcfab373e9
commit: 99d36be802ede16e9a776118524e0ebce82ae96b [6/26] liveupdate: kho: move to kernel/liveupdate
config: x86_64-buildonly-randconfig-004-20250626 (https://download.01.org/0day-ci/archive/20250626/202506260925.XlsADuaG-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506260925.XlsADuaG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506260925.XlsADuaG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/liveupdate/kexec_handover.c:28:
>> kernel/liveupdate/kexec_handover_internal.h:19:22: error: expected ';' after struct
      19 | struct kho_debugfs {}
         |                      ^
         |                      ;
   1 error generated.


vim +19 kernel/liveupdate/kexec_handover_internal.h

3444e8a922e364b kernel/kexec_handover_internal.h Pasha Tatashin 2025-04-10  17  
3444e8a922e364b kernel/kexec_handover_internal.h Pasha Tatashin 2025-04-10  18  #else
3444e8a922e364b kernel/kexec_handover_internal.h Pasha Tatashin 2025-04-10 @19  struct kho_debugfs {}
3444e8a922e364b kernel/kexec_handover_internal.h Pasha Tatashin 2025-04-10  20  #endif
3444e8a922e364b kernel/kexec_handover_internal.h Pasha Tatashin 2025-04-10  21  

:::::: The code at line 19 was first introduced by commit
:::::: 3444e8a922e364bfae20936265f4718b0e6c0ce5 kho: make debugfs interface optional

:::::: TO: Pasha Tatashin <pasha.tatashin@soleen.com>
:::::: CC: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
