Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A5B3FEF;
	Fri, 14 Jul 2023 05:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689311426; x=1720847426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0zK5ix1Ghqg4w6MZ/8ERPdW2RzRUWEBFvWPTcyKTRmw=;
  b=AR8DbZCgjRbJwPEyNs5ajMFWIffI8Q3PVakBl89VLklJF6W7WyW88S9Z
   nxyA46dvq3c56Aukq7wigXLwYgEDHe3CnkcEtS6jflv3mP8qh+aCL+Kzb
   GGJSCPN6z9ghICYm6Zs763m1nHoDiJSZeDZgLdlTzOYseECTm/fQIU6AD
   cd1+dFyUq3zmDEVax/+622I9DsT/YJD0iMuk6KtTSQmdkhlnrXOTDxTEj
   Iiog7fbhcMjZvBeBmqftqvkd3M8PhinDRlRDabyBy+yOWveG1umiSCSvn
   qElY2jOkXrSSppg7NAnVQzUV6yZnJEF9zpwBe5GsrG1+GRe1HnWQp9D5W
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="362857341"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="362857341"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 22:10:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="757443722"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="757443722"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 13 Jul 2023 22:10:22 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKB4Q-0007CH-0f;
	Fri, 14 Jul 2023 05:10:22 +0000
Date: Fri, 14 Jul 2023 13:10:19 +0800
From: kernel test robot <lkp@intel.com>
To: Carlos Maiolino <cem@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lukas Czerner <lczerner@redhat.com>, Jan Kara <jack@suse.cz>
Subject: [akpm-mm:mm-unstable 161/178] mm/shmem_quota.c:286:5: warning: no
 previous prototype for function 'shmem_mark_dquot_dirty'
Message-ID: <202307141341.R961dyMt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   6936d35dc558257b576113c74b586074dd942e9a
commit: 1eadb10f211346c9baf6daff1be3890f072ffd82 [161/178] shmem: prepare shmem quota infrastructure
config: s390-randconfig-r012-20230714 (https://download.01.org/0day-ci/archive/20230714/202307141341.R961dyMt-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307141341.R961dyMt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307141341.R961dyMt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shmem_quota.c:286:5: warning: no previous prototype for function 'shmem_mark_dquot_dirty' [-Wmissing-prototypes]
     286 | int shmem_mark_dquot_dirty(struct dquot *dquot)
         |     ^
   mm/shmem_quota.c:286:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     286 | int shmem_mark_dquot_dirty(struct dquot *dquot)
         | ^
         | static 
>> mm/shmem_quota.c:291:5: warning: no previous prototype for function 'shmem_dquot_write_info' [-Wmissing-prototypes]
     291 | int shmem_dquot_write_info(struct super_block *sb, int type)
         |     ^
   mm/shmem_quota.c:291:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     291 | int shmem_dquot_write_info(struct super_block *sb, int type)
         | ^
         | static 
   2 warnings generated.


vim +/shmem_mark_dquot_dirty +286 mm/shmem_quota.c

   285	
 > 286	int shmem_mark_dquot_dirty(struct dquot *dquot)
   287	{
   288		return 0;
   289	}
   290	
 > 291	int shmem_dquot_write_info(struct super_block *sb, int type)
   292	{
   293		return 0;
   294	}
   295	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
