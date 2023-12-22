Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08421ECA;
	Fri, 22 Dec 2023 01:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="goT2hFWA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703207022; x=1734743022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i0MKDbGOBPecaWBGblsRdEAasumTZRJamRUsYiJqFyY=;
  b=goT2hFWAKpAfj72mf/My2t1gLHHV7s73+vtB4spjDKxJ69Vc1zq1pvp3
   sTooWo7UvpAJb4I37NzYLdQqxMe2xDahh0SRFHBDVWwV6kRgYdD7eH+HZ
   a3eNbBRV/K+SdaQt9Wod78P9DrfIiVUYPMIfb/ep133SGZtc0aw6hkoOV
   Qw6VMuGP20deUuT/5zA4eLbZ6irQUE3yTzWurkLM+wLUcQ6AU7/cZH1Ql
   L1vwgWO7Ozb9VbdwTGSSqmcAyT5CQdeszk04ANejVkw9r9KHdlUzk8vaJ
   hJD8+KNqE8kjJmR1edytnwY8/GA87hmPurx1mR3R6NBr/jFvJJmSwL8lG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="3146558"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="3146558"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 17:03:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="900278815"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="900278815"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 21 Dec 2023 17:03:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGTwr-0008wO-12;
	Fri, 22 Dec 2023 01:03:34 +0000
Date: Fri, 22 Dec 2023 09:02:59 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jeff Layton <jlayton@kernel.org>
Subject: [linux-next:master 9031/9925] ld.lld: error: undefined symbol:
 __fscache_unuse_cookie
Message-ID: <202312220902.oRE08a2z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   857647efa9be89a13cf8963c7e167fab062b28bb
commit: 9896c4f367fcc44213d15fe7210e9305df8063f2 [9031/9925] netfs, fscache: Combine fscache with netfs
config: i386-randconfig-006-20231221 (https://download.01.org/0day-ci/archive/20231222/202312220902.oRE08a2z-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231222/202312220902.oRE08a2z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312220902.oRE08a2z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __fscache_unuse_cookie
   >>> referenced by fscache.h:289 (include/linux/fscache.h:289)
   >>>               fs/erofs/fscache.o:(erofs_fscache_register_cookie) in archive vmlinux.a
   >>> referenced by fscache.h:289 (include/linux/fscache.h:289)
   >>>               fs/erofs/fscache.o:(erofs_fscache_acquire_cookie) in archive vmlinux.a
   >>> referenced by fscache.h:289 (include/linux/fscache.h:289)
   >>>               fs/erofs/fscache.o:(erofs_fscache_unregister_cookie) in archive vmlinux.a
   >>> referenced 1 more times
--
>> ld.lld: error: undefined symbol: __fscache_relinquish_cookie
   >>> referenced by fscache.h:308 (include/linux/fscache.h:308)
   >>>               fs/erofs/fscache.o:(erofs_fscache_register_cookie) in archive vmlinux.a
   >>> referenced by fscache.h:308 (include/linux/fscache.h:308)
   >>>               fs/erofs/fscache.o:(erofs_fscache_acquire_cookie) in archive vmlinux.a
   >>> referenced by fscache.h:308 (include/linux/fscache.h:308)
   >>>               fs/erofs/fscache.o:(erofs_fscache_unregister_cookie) in archive vmlinux.a
   >>> referenced 1 more times
--
>> ld.lld: error: undefined symbol: __fscache_acquire_cookie
   >>> referenced by fscache.h:253 (include/linux/fscache.h:253)
   >>>               fs/erofs/fscache.o:(erofs_fscache_acquire_cookie) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: __fscache_use_cookie
   >>> referenced by fscache.h:272 (include/linux/fscache.h:272)
   >>>               fs/erofs/fscache.o:(erofs_fscache_acquire_cookie) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: __fscache_relinquish_volume
   >>> referenced by fscache.h:224 (include/linux/fscache.h:224)
   >>>               fs/erofs/fscache.o:(erofs_fscache_domain_put) in archive vmlinux.a
   >>> referenced by fscache.h:224 (include/linux/fscache.h:224)
   >>>               fs/erofs/fscache.o:(erofs_fscache_unregister_fs) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: __fscache_acquire_volume
   >>> referenced by fscache.h:204 (include/linux/fscache.h:204)
   >>>               fs/erofs/fscache.o:(erofs_fscache_register_fs) in archive vmlinux.a
   >>> referenced by fscache.h:204 (include/linux/fscache.h:204)
   >>>               fs/erofs/fscache.o:(erofs_fscache_register_fs) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: __fscache_begin_read_operation
   >>> referenced by fscache.h:457 (include/linux/fscache.h:457)
   >>>               fs/erofs/fscache.o:(erofs_fscache_read_folios_async) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
