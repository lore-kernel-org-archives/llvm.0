Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301FE64B;
	Sat, 12 Aug 2023 01:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691802732; x=1723338732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SrWnoBb+qWIGTiJ28WWqxHgp31YT/f0wKBw59r9UMnc=;
  b=ID0y4jIqNiVVu+VqD5Wjtrhau3fh2xT5ZJ49OiSDkGVouf4RHmyGiRKQ
   1GSVVWApvvOiHrAE0S3w6o4LiInGSNDJRn8afpgQHZc0tvtHdmrCfGsh5
   TDqQu58NJbLn5ssOVq7P9wt7Az2CAc5iqzkErZuLe7fjJTNejYa5bkide
   fYG66E7V4YOMxPOm3JYiSUZd1Ot+pH5tWGt0ovFSa+uRbAa+XdtzgrPqo
   gYcpqbwk/QW9NsztLiBog1pOdOntqNqmnz0tDLSjDY2qWr90zUlkitdSg
   0qgpSiB4Hi/vGmyD/rLgkbtyBsvtB1+WfeAY3wbfUcKm30AebaTKn8Doi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="356753399"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="356753399"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 18:11:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="798216433"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="798216433"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 11 Aug 2023 18:11:56 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUdAZ-0008AF-39;
	Sat, 12 Aug 2023 01:11:55 +0000
Date: Sat, 12 Aug 2023 09:11:33 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Xu <peterx@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Huang, Ying" <ying.huang@intel.com>
Subject: Cannot find symbol for section 69: .text.arch_max_swapfile_size.
Message-ID: <202308120906.Efohswpa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   190bf7b14b0cf3df19c059061be032bd8994a597
commit: be45a4902c7caa717fee6b2f671e59b396ed395c mm/swap: cache maximum swapfile size when init swap
date:   11 months ago
config: mips-randconfig-r014-20230811 (https://download.01.org/0day-ci/archive/20230812/202308120906.Efohswpa-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120906.Efohswpa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120906.Efohswpa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Cannot find symbol for section 69: .text.arch_max_swapfile_size.
   mm/swapfile.o: failed

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
