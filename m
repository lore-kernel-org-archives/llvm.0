Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561031FA6;
	Tue,  8 Aug 2023 18:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691518902; x=1723054902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xz/fbjXbKVOYE1zW+Oz2Tr6irMjV60KZO7LIw0gw80k=;
  b=ZoVNp+y2y+1eAwpN+0uVVqvWBuqUXg4o5mxL6AExtZNjVsubNDDaCXuq
   WJt33WYlznhz2/J6F96/sV/zfuIa+ukVNYEo1rqFGQTH5ISbywPKJAlzb
   p2GaFqSrdkcUE39RjdcWzHWWVvvPVCZTWPmkr80BC/MB0jCq1mz0f5Abi
   W7Blhrz8S7aWgXO1e9E6DUskl3YO4a0XxJkKfaIOtoYlFQVW5ONNF0m7x
   CJ1mwqBFy1VnszX88bbPVwayB1tBjPEJKH9ni5BWf7Pzs9K1AE0+LLAEz
   uTkpiHmts1Ywp2brJ7fSxYVoIShKcE0b3n2jTbi/dmcqO+ER/LdJOQ+2Z
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="373682508"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="373682508"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 10:42:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="708350452"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="708350452"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Aug 2023 10:42:06 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTQic-0005Ve-09;
	Tue, 08 Aug 2023 17:42:06 +0000
Date: Wed, 9 Aug 2023 01:42:03 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:testing/af/home 6/8]
 fs/btrfs/async-thread.c:411:34: error: no member named 'hipri_workers' in
 'struct btrfs_fs_info'; did you mean 'fixup_workers'?
Message-ID: <202308090137.21gS239M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block testing/af/home
head:   8b2a24828c670d20cda3d69f5741e11e89f575f7
commit: 5f3624d1fef48864c37168c21cd1a1a1334649b8 [6/8] btrfs: Add wq_cpu_set=%s mount option
config: i386-randconfig-i002-20230808 (https://download.01.org/0day-ci/archive/20230809/202308090137.21gS239M-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090137.21gS239M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308090137.21gS239M-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/btrfs/async-thread.c:411:34: error: no member named 'hipri_workers' in 'struct btrfs_fs_info'; did you mean 'fixup_workers'?
           btrfs_apply_wq_cpu_set(fs_info, hipri_workers);
                                           ^~~~~~~~~~~~~
                                           fixup_workers
   fs/btrfs/async-thread.c:402:40: note: expanded from macro 'btrfs_apply_wq_cpu_set'
           apply_wq_cpu_set_notice(INFO, (INFO)->WQ->normal_wq, # WQ)
                                                 ^
   fs/btrfs/fs.h:567:26: note: 'fixup_workers' declared here
           struct btrfs_workqueue *fixup_workers;
                                   ^
   1 error generated.


vim +411 fs/btrfs/async-thread.c

   397	
   398	#define apply_wq_cpu_set(INFO, WQ) \
   399		apply_wq_cpu_set_notice(INFO, (INFO)->WQ, # WQ)
   400	
   401	#define btrfs_apply_wq_cpu_set(INFO, WQ) \
   402		apply_wq_cpu_set_notice(INFO, (INFO)->WQ->normal_wq, # WQ)
   403	
   404	
   405	void btrfs_apply_workqueue_cpu_set(struct btrfs_fs_info *fs_info)
   406	{
   407		if (!btrfs_test_opt(fs_info, WQ_CPU_SET))
   408			return;
   409	
   410		btrfs_apply_wq_cpu_set(fs_info, workers);
 > 411		btrfs_apply_wq_cpu_set(fs_info, hipri_workers);
   412		btrfs_apply_wq_cpu_set(fs_info, delalloc_workers);
   413		btrfs_apply_wq_cpu_set(fs_info, flush_workers);
   414		btrfs_apply_wq_cpu_set(fs_info, caching_workers);
   415		btrfs_apply_wq_cpu_set(fs_info, fixup_workers);
   416		apply_wq_cpu_set(fs_info, endio_workers);
   417		apply_wq_cpu_set(fs_info, endio_meta_workers);
   418		apply_wq_cpu_set(fs_info, rmw_workers);
   419		btrfs_apply_wq_cpu_set(fs_info, endio_write_workers);
   420		apply_wq_cpu_set(fs_info, compressed_write_workers);
   421		btrfs_apply_wq_cpu_set(fs_info, endio_freespace_worker);
   422		btrfs_apply_wq_cpu_set(fs_info, delayed_workers);
   423		btrfs_apply_wq_cpu_set(fs_info, qgroup_rescan_workers);
   424		apply_wq_cpu_set(fs_info, discard_ctl.discard_workers);
   425	}
   426	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
