Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444937F;
	Thu,  5 Oct 2023 09:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ap7cot3x"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696496854; x=1728032854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BURfMz7oDbbWaN1SO7w7ia/v46pQMbj/y1aw0QOHoBg=;
  b=Ap7cot3x2b+hzytZSVTP0vF+nVJZS/LfCWoE17I9+AU3HUaVutOja4pq
   OZctUKAOtlF+KnaM1G2NXbwMbdE0MKeBQQjXYAqUNp7PcYytoxHgpHYWP
   Btu84+K3grlNuXxexTXhwP8EX7KD1zebJoKiv12y4L/zJ0N5b3ACLWbFI
   ass1Wlc2UMjYhEhs0rkXSTruSinVdwjIXSwIrmXVK2Qk+6Kkgn3xH2CJU
   ei2XhcFDT1E0mDxUB6eUA18uXMOo6blRcDeoDHbtii/v1rnhDYMCFGcQY
   HULrScxUJoOoUiHUDuJoNYvunadaZLyUFzfeLimPMNY0BC5kNwEIwgeCC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="362813368"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="362813368"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 02:07:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="842309817"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="842309817"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Oct 2023 02:07:21 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoKKF-000LEO-05;
	Thu, 05 Oct 2023 09:07:19 +0000
Date: Thu, 5 Oct 2023 17:06:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [trace:trace/core 6/7] fs/tracefs/event_inode.c:909:6: warning: no
 previous prototype for function 'eventfs_remove_events_dir'
Message-ID: <202310051743.y9EobbUr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/core
head:   f5d9e8e08f81c9e7c723de7abcce106808f0770c
commit: 5790b1fb3d672d9a1fe3881a7181dfdbe741568f [6/7] eventfs: Remove eventfs_file and just use eventfs_inode
config: arm-bcm2835_defconfig (https://download.01.org/0day-ci/archive/20231005/202310051743.y9EobbUr-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310051743.y9EobbUr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310051743.y9EobbUr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/tracefs/event_inode.c:909:6: warning: no previous prototype for function 'eventfs_remove_events_dir' [-Wmissing-prototypes]
     909 | void eventfs_remove_events_dir(struct dentry *dentry)
         |      ^
   fs/tracefs/event_inode.c:909:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     909 | void eventfs_remove_events_dir(struct dentry *dentry)
         | ^
         | static 
   1 warning generated.
--
>> kernel/trace/trace_events.c:2285:5: warning: no previous prototype for function 'system_callback' [-Wmissing-prototypes]
    2285 | int system_callback(const char *name, umode_t *mode, void **data,
         |     ^
   kernel/trace/trace_events.c:2285:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2285 | int system_callback(const char *name, umode_t *mode, void **data,
         | ^
         | static 
   1 warning generated.


vim +/eventfs_remove_events_dir +909 fs/tracefs/event_inode.c

5bdcd5f5331a27 Ajay Kaher 2023-07-28  902  
5bdcd5f5331a27 Ajay Kaher 2023-07-28  903  /**
5bdcd5f5331a27 Ajay Kaher 2023-07-28  904   * eventfs_remove_events_dir - remove eventfs dir or file from list
5bdcd5f5331a27 Ajay Kaher 2023-07-28  905   * @dentry: events's dentry to be removed.
5bdcd5f5331a27 Ajay Kaher 2023-07-28  906   *
5bdcd5f5331a27 Ajay Kaher 2023-07-28  907   * This function remove events main directory
5bdcd5f5331a27 Ajay Kaher 2023-07-28  908   */
5bdcd5f5331a27 Ajay Kaher 2023-07-28 @909  void eventfs_remove_events_dir(struct dentry *dentry)

:::::: The code at line 909 was first introduced by commit
:::::: 5bdcd5f5331a276a3ddf1fba8605986d0d15298a eventfs: Implement removal of meta data from eventfs

:::::: TO: Ajay Kaher <akaher@vmware.com>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
