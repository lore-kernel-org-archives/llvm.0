Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445041B272;
	Wed, 29 Nov 2023 10:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eajR8JMN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701254706; x=1732790706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BZ6mKkSg/PokyHaXTrcCCXEpNUcaYlgAbNAIrKE9gus=;
  b=eajR8JMNwVCkeI+oNIXpOjlT4wYeGyhrFUFI4JBvIXvlVzIi8MBHBzKr
   W7K5AsIdx+WGW7JxNcPB9530hySZerjyI+FBvfistjZaBVXIN8w4xmy5V
   s3HTPh1i1iKjPKnztvhaPt8fLjDQqZ0splOTNZcZDP4dMfs/GkUlTPYEb
   7e8mppEJtzWQScBQGCupERCWMRvDqH+hQctNtxyxQJ+yAAlccO6JO5Hz+
   7a8si5/P6g+eTyoHkjBqENwBraGgF0RpSvC8RVUgQ5u1Mh0nLCel8t3Cp
   00q9j1IhwuisG0pTI6WFzdDeS8elIIgeHpnz0P3EhXlhlTI8sgU6guTtZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="123883"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="123883"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 02:45:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="718714661"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="718714661"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 29 Nov 2023 02:45:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8I3v-000067-2k;
	Wed, 29 Nov 2023 10:44:59 +0000
Date: Wed, 29 Nov 2023 18:44:23 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 3338/3829] make[5]: *** No rule to make target
 'samples/cgroup/cgroup_event_listener.c', needed by
 'samples/cgroup/cgroup_event_listener'.
Message-ID: <202311291652.B1dxuHt0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1f5c003694fab4b1ba6cbdcc417488b975c088d0
commit: fc2cf253aaec1eaf84f9d9f629b455ef5c1834f2 [3338/3829] samples: introduce new samples subdir for cgroup
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231129/202311291652.B1dxuHt0-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231129/202311291652.B1dxuHt0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311291652.B1dxuHt0-lkp@intel.com/

Note: the linux-next/master HEAD 1f5c003694fab4b1ba6cbdcc417488b975c088d0 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> make[5]: *** No rule to make target 'samples/cgroup/cgroup_event_listener.c', needed by 'samples/cgroup/cgroup_event_listener'.
   make[5]: Target 'samples/cgroup/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
