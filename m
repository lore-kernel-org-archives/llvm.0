Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA1A17F1;
	Fri, 20 Jan 2023 10:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674212110; x=1705748110;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WirNdjXcNBVyodVjqhh0h3CpV44jofuXffWJE1a0G6w=;
  b=bVSALvh/QkpUeJ/aaroge7ZqHMlJ3dY1HnlkXIlvwAiAQZDQ+Kc/pMen
   jWh3TECE6S871u2SAQdw3FWFDFOD3Z8PSgfTIogVxXJ8tq8pHf+KVnJ8v
   ++NOTvQs4pos/Zv3QU5Cys+zpdB33XwSJ2fzRzc5G5SOoRk8POvdEO19a
   nmIwFUwE86waPR5H4Bvphjiz/bPjHPABFEoNLcvuo+RpbFWqkwNMtbQCc
   ZU2tYaL6NbSERYYDONXtRPla+DnNnfKck3jkbb0PCzwo3MlJzWDl5WhT3
   HfI5qYdkT8aEeegjALojhfi4tHD/T60K68lI+dl17raGrXpq5UWGroiue
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="325589523"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="325589523"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 02:55:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="784473649"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="784473649"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 20 Jan 2023 02:55:02 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIp2u-0002UI-0C;
	Fri, 20 Jan 2023 10:54:56 +0000
Date: Fri, 20 Jan 2023 18:54:24 +0800
From: kernel test robot <lkp@intel.com>
To: Martin Krastev <krastevm@vmware.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Zack Rusin <zackr@vmware.com>
Subject: drivers/gpu/drm/vmwgfx/vmwgfx_msg.c:713:21: warning: unused function
 'mksstat_init_record'
Message-ID: <202301201858.yiiu0sKz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d368967cb1039b5c4cccb62b5a4b9468c50cd143
commit: 7a7a933edd6c3a6d5d64e08093f2d564104cefcd drm/vmwgfx: Introduce VMware mks-guest-stats
date:   1 year, 7 months ago
config: x86_64-randconfig-a001-20230116 (https://download.01.org/0day-ci/archive/20230120/202301201858.yiiu0sKz-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7a7a933edd6c3a6d5d64e08093f2d564104cefcd
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7a7a933edd6c3a6d5d64e08093f2d564104cefcd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/gma500/ drivers/gpu/drm/vmwgfx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vmwgfx/vmwgfx_msg.c:713:21: warning: unused function 'mksstat_init_record' [-Wunused-function]
   static inline char *mksstat_init_record(mksstat_kern_stats_t stat_idx,
                       ^
   1 warning generated.


vim +/mksstat_init_record +713 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c

   701	
   702	/**
   703	 * mksstat_init_record: Initializes an MKSGuestStatCounter-based record
   704	 * for the respective mksGuestStat index.
   705	 *
   706	 * @stat_idx: Index of the MKSGuestStatCounter-based mksGuestStat record.
   707	 * @pstat: Pointer to array of MKSGuestStatCounterTime.
   708	 * @pinfo: Pointer to array of MKSGuestStatInfoEntry.
   709	 * @pstrs: Pointer to current end of the name/description sequence.
   710	 * Return: Pointer to the new end of the names/description sequence.
   711	 */
   712	
 > 713	static inline char *mksstat_init_record(mksstat_kern_stats_t stat_idx,
   714		MKSGuestStatCounterTime *pstat, MKSGuestStatInfoEntry *pinfo, char *pstrs)
   715	{
   716		char *const pstrd = pstrs + strlen(mksstat_kern_name_desc[stat_idx][0]) + 1;
   717		strcpy(pstrs, mksstat_kern_name_desc[stat_idx][0]);
   718		strcpy(pstrd, mksstat_kern_name_desc[stat_idx][1]);
   719	
   720		pinfo[stat_idx].name.s = pstrs;
   721		pinfo[stat_idx].description.s = pstrd;
   722		pinfo[stat_idx].flags = MKS_GUEST_STAT_FLAG_NONE;
   723		pinfo[stat_idx].stat.counter = (MKSGuestStatCounter *)&pstat[stat_idx];
   724	
   725		return pstrd + strlen(mksstat_kern_name_desc[stat_idx][1]) + 1;
   726	}
   727	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
