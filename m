Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4611FD0;
	Thu, 29 Jun 2023 03:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688008030; x=1719544030;
  h=date:from:cc:subject:message-id:mime-version;
  bh=4CG/fMw67DblqeB7vzKBxeWLJCt+yMwNmxPLK8DEwvQ=;
  b=l8995tIHAFzo0HWq2N7oMuCcj07pzY7hRQ4Nojs+HifkUpclJEpeQTP4
   jWUc5cxr/vqfVLBR/nFwaxI5otkc7JRkJ2h2g/nv2qA9sTkZAjwY13Qfu
   5CC5op16ud1S13K4IJ3eR3CrzpziqMLbhFoEF9mT5FFxLQCQuQb7IoHom
   Z2rS/A3L1C7ASgPjfodBfQYcZJkD55yQnTDUPZ0LaKpKcwmjUzZp97PuV
   k5QEf/aHoBxkE8lzQB0obHDcGsFFeCivSuzwB9roSbK6TcdrSsOOxjTK1
   rqIpOdwANAQdPmLfMhzdN6ROev3FjuOt445dbdts15lJTvBcoFutih1+N
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="346778023"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="346778023"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 20:07:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="720418368"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="720418368"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 28 Jun 2023 20:07:06 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEhzt-000DjX-2T;
	Thu, 29 Jun 2023 03:07:05 +0000
Date: Thu, 29 Jun 2023 11:06:26 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-4.14.y 3914/9999] crypto/async_tx/async_pq.o: warning:
 objtool: async_syndrome_val()+0x4d8: undefined stack state
Message-ID: <202306291158.kEly4qeQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Arnd Bergmann <arnd@arndb.de>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Sasha Levin <sashal@kernel.org>

Hi Arnd,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.14.y
head:   60a6e3043cc8b918c989707a5eba5fd6830a08a4
commit: 5385e6b7ea431b3725650bbc0e65103687134771 [3914/9999] crypto: ccp -- don't "select" CONFIG_DMADEVICES
config: x86_64-randconfig-x016-20230628 (https://download.01.org/0day-ci/archive/20230629/202306291158.kEly4qeQ-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230629/202306291158.kEly4qeQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306291158.kEly4qeQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/async_tx/async_pq.o: warning: objtool: async_syndrome_val()+0x4d8: undefined stack state

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
