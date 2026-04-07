Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0704334F255;
	Tue,  7 Apr 2026 04:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534681; cv=none; b=iTEBXgT0LMiwTB9Q3GmIKJWXnpRdv/hJEdNQnHYVmq1JaSLp87iKSB7vcIMmz7t/+u91mBqEkUS0gufJqv4dq61AEYlfJe8pre3wYyV6kLjCMnUYyscuTERisddT+gkqFj/uVlPoBMc3187YCaiuz0pz6rOciaueqsNnRu2rlbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534681; c=relaxed/simple;
	bh=vAwx37XpYjExws9eC4G7TLXBU5U4vQE3ly/996W8gWA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YyNBe3fUZv772e+Gl0GYyvfHLvQTE2Jon1jkVKx0/nTNMcWUTWGTNr4d/98d/WMBfH3l8YxUksilk9NZ9k8W/9iIogdar3JUHJj/+AxkS65hKt7caiUwQze94f9s9594EZC7EZ0RzT/meVUzVPr1Cm82xjSMJFjS1OeKeMLAgWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZXjtZSlG; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZXjtZSlG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534680; x=1807070680;
  h=date:from:to:cc:subject:message-id;
  bh=vAwx37XpYjExws9eC4G7TLXBU5U4vQE3ly/996W8gWA=;
  b=ZXjtZSlGpsp22+UxNrvC7ZOZJa/NnkU7JofPcVQfheZ6epQIMyd+rY3V
   nzwXQ985RUOhGuRKrpy5iLiinq6IbUF6j+B1sjVZ60ris0Gv74iSG55b/
   nsTiIo/n7UP+v01S312FViHPn5NU1IGhJBbVPYSW7ouEC4U61O+MFuasP
   HRuKKdAesfjunh7w2Vyv2jeuhZogcO1rHXO71+aXILzjgYrwsaqXsV8cA
   KCrnM66LfKgufHakoYL8u8Mrluz+wSLMqy5NThH0OteWuQVreCn+56Vid
   DA6iM8/C6zDKMPPxLxUu42Rhmh9Qkgx0ke3wT0g/HuKuyuPoLuYhQYPmQ
   g==;
X-CSE-ConnectionGUID: H4H/lo6+SEe7mc2unrkRlQ==
X-CSE-MsgGUID: DW5tVMomQJSqyXiz4feQeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87193702"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87193702"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:04:38 -0700
X-CSE-ConnectionGUID: DjaGCDmeTH6A6ii49g6THw==
X-CSE-MsgGUID: Xh9/y7iMTimXUrx1pY+mkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="228319730"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Apr 2026 21:04:37 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xg2-0000000009R-14Vt;
	Tue, 07 Apr 2026 04:04:34 +0000
Date: Tue, 07 Apr 2026 12:04:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kyle Sanderson <kyle.leet@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/1103 1/1]
 fs/bcachefs/alloc/zone.c:23:10: fatal error: 'linux/printbuf.h' file not
 found
Message-ID: <202604071152.iDI82zbN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs pr/1103
head:   773a9613b5d5dea295b8faadab583519fdbbaccf
commit: 5c65ed577ff88f1ef3236caa947c006c4131dc5f [1/1] wip: defrag
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260407/202604071152.iDI82zbN-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604071152.iDI82zbN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604071152.iDI82zbN-lkp@intel.com/

Note: the koverstreet-bcachefs/pr/1103 HEAD 773a9613b5d5dea295b8faadab583519fdbbaccf builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> fs/bcachefs/alloc/zone.c:23:10: fatal error: 'linux/printbuf.h' file not found
      23 | #include <linux/printbuf.h>
         |          ^~~~~~~~~~~~~~~~~~
   1 error generated.


vim +23 fs/bcachefs/alloc/zone.c

    20	
    21	#include <linux/math64.h>
    22	#include <linux/log2.h>
  > 23	#include <linux/printbuf.h>
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
