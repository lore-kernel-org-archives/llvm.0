Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7F010E7;
	Sun, 17 Dec 2023 03:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQHZUWxF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702785141; x=1734321141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3zuDj/Deq9eCtEMXuIEN+/2dITzUH9y22LsDEx64MRw=;
  b=hQHZUWxF0Lwic1dRCQOG19UW1o74WuxpgvV9+Ih9Ia89hV9YvwyO+4WN
   fiakJOVselSl264OvL7J5mfkL+f7dcYKtISj+wGcPWUAexyuNyPhAPZcV
   M/NOWTgxFDHkh7OKFghr9qaEJ+TSq+13XyyJLAyPyulDIsizJt/7duuaf
   2jYhTI3UvuQwGdmPmJa778ZcQp5/B+aj6AzaxPA/VUPgMmrwFD5gfB8G1
   t/eWb/UC5xRuQfm3LzIUqai99PLtjc8KDB6lQbVbZEKPZmVsOr61BqZKo
   wfTEJuqHRTwZLkI3Wm5E/E65Uw9AWkfAjINGub3wHBzt0kb1GoZCz30cs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="426530716"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="426530716"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 19:52:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="724888950"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="724888950"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 Dec 2023 19:52:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEiCN-0002be-15;
	Sun, 17 Dec 2023 03:52:15 +0000
Date: Sun, 17 Dec 2023 11:51:25 +0800
From: kernel test robot <lkp@intel.com>
To: Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [toke:xdp-queueing-08 5/10] include/net/xdp.h:549:19: error:
 redefinition of 'dev_xdp_enqueue'
Message-ID: <202312171147.k361NPR4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Toke,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/toke/linux.git xdp-queueing-08
head:   707bff6510161065e4e624c99c8c668b6c0114b6
commit: 901d57633459462242239a51dd6b9bed3e7d96d7 [5/10] xdp: Move bulk queue functions and data structures out of devmap.c
config: i386-buildonly-randconfig-003-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171147.k361NPR4-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171147.k361NPR4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171147.k361NPR4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/eventpoll.c:40:
   In file included from include/net/busy_poll.h:19:
>> include/net/xdp.h:549:19: error: redefinition of 'dev_xdp_enqueue'
   static inline int dev_xdp_enqueue(struct net_device *dev, struct xdp_frame *xdpf,
                     ^
   include/linux/bpf.h:2567:5: note: previous definition is here
   int dev_xdp_enqueue(struct net_device *dev, struct xdp_frame *xdpf,
       ^
   1 error generated.


vim +/dev_xdp_enqueue +549 include/net/xdp.h

   548	
 > 549	static inline int dev_xdp_enqueue(struct net_device *dev, struct xdp_frame *xdpf,
   550					  struct net_device *dev_rx)
   551	{
   552		return __xdp_enqueue_frame(dev, xdpf, dev_rx, NULL);
   553	}
   554	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
