Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE12C18054;
	Fri,  4 Aug 2023 16:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691166104; x=1722702104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SkRmCWHjINejDayhUfO2zrXccz5Yf1cMte27jc60wKM=;
  b=hgUJB1R3+Ra+OUPRrMR5/IGaceg6qx8PPf/pWgjpOQ/PCglbfXfjRBc8
   LVDkvDpft0ZdO3vNeW5Xs3JyLnprBP8zIDb6RDpMLRoXA/MtmZkkpEbI0
   Ys9gBWj5qj0MUODpd3KZ18OrGkfWgjQ6apbSdGK0sTSxhrl5AZa0V00w1
   Kvox5NKHSfW7MApUQxORCpe8y3s9qPh4iP01/4wk/3b+uizZjFqW6zwt4
   hp3Zj8VF4K09wUsmVHzJxA+N5XkQ3BQwm0FMzInqgfUoPBdV4wHQv3njA
   PYzXjjqLvAl4ofUil96lonF4U8UmyRZ+L0yJDlGsnb80rK00zqrmoHboL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="372935607"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="372935607"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 09:21:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="800119275"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="800119275"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Aug 2023 09:21:42 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRxYb-0002yd-26;
	Fri, 04 Aug 2023 16:21:41 +0000
Date: Sat, 5 Aug 2023 00:20:57 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Babrou <ivan@cloudflare.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [driver-core:driver-core-testing 2/16] fs/kernfs/mount.c:50:5:
 warning: no previous prototype for function 'kernfs_statfs'
Message-ID: <202308050054.TMaWFpME-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git driver-core-testing
head:   b84388be432d001b3baa782fa047eddb0f375233
commit: 26dd6e284e277f80468f48b4ff8ebfb0e9ca7369 [2/16] kernfs: attach uuid for every kernfs and report it in fsid
config: arm-randconfig-r005-20230801 (https://download.01.org/0day-ci/archive/20230805/202308050054.TMaWFpME-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050054.TMaWFpME-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308050054.TMaWFpME-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/kernfs/mount.c:50:5: warning: no previous prototype for function 'kernfs_statfs' [-Wmissing-prototypes]
      50 | int kernfs_statfs(struct dentry *dentry, struct kstatfs *buf)
         |     ^
   fs/kernfs/mount.c:50:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      50 | int kernfs_statfs(struct dentry *dentry, struct kstatfs *buf)
         | ^
         | static 
   1 warning generated.


vim +/kernfs_statfs +50 fs/kernfs/mount.c

    49	
  > 50	int kernfs_statfs(struct dentry *dentry, struct kstatfs *buf)
    51	{
    52		simple_statfs(dentry, buf);
    53		buf->f_fsid = uuid_to_fsid(dentry->d_sb->s_uuid.b);
    54		return 0;
    55	}
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
