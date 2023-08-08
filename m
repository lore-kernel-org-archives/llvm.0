Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0DC1B7F5;
	Tue,  8 Aug 2023 19:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691522795; x=1723058795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NllcWDi22avh6Aj3PziNvy0XRZ7PZme2pVRu4Wssdhc=;
  b=hQVNRW4Ej6B3njX+af7GMbTLS6Jvgx+C4/Y91Q7Jpp8uDXfY4F/8MJw8
   qgWBXmVJmpcKxvpLeBdUMEAti4hjbr6zChGtJUIQUf+60dJYzMUpSIuaR
   +Ddq4EaR9gqwK2Mm7jKIYigSA0vMVdhKjAQcAI0baBsu0Up5JOrDcbNHH
   RKxcfMayQI3Vj87CKVtOuiWXg5cRYRv8YlXqHVNfL3qtwdZCvp0779ED7
   1cOTpE3KRB2vwClvNcUcs269Ya7Bsiyy/exWtHpG7SthLpztbt3umy8vB
   cZ0CMERBwl6B4a8t3CJE6txXZbkBaN+lJilonlWvYEtSgcIHUh86CxeBF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="369829621"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="369829621"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 12:26:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="734696303"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="734696303"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 08 Aug 2023 12:26:10 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTSLK-0005ZE-0e;
	Tue, 08 Aug 2023 19:26:10 +0000
Date: Wed, 9 Aug 2023 03:26:04 +0800
From: kernel test robot <lkp@intel.com>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>
Subject: [linux-next:master 7083/7933] ld.lld: error: assignment to symbol
 __init_end does not converge
Message-ID: <202308090338.AqDF9eEK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   71cd4fc492ec41e4acd85e98bbf7a13753fc1e03
commit: 489dcf298fbc8c0be81d98a6477ddeadc7327858 [7083/7933] mm/mm_init.c: remove obsolete macro HASH_SMALL
config: arm64-randconfig-r032-20230808 (https://download.01.org/0day-ci/archive/20230809/202308090338.AqDF9eEK-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090338.AqDF9eEK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308090338.AqDF9eEK-lkp@intel.com/

Note: the linux-next/master HEAD 71cd4fc492ec41e4acd85e98bbf7a13753fc1e03 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: assignment to symbol __init_end does not converge

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
