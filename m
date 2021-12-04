Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC65E2C9D
	for <llvm@lists.linux.dev>; Sat,  4 Dec 2021 17:51:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10188"; a="217160284"
X-IronPort-AV: E=Sophos;i="5.87,287,1631602800"; 
   d="scan'208";a="217160284"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2021 09:51:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,287,1631602800"; 
   d="scan'208";a="610785214"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 04 Dec 2021 09:51:56 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mtZCV-000JG1-Pl; Sat, 04 Dec 2021 17:51:55 +0000
Date: Sun, 5 Dec 2021 01:51:01 +0800
From: kernel test robot <lkp@intel.com>
To: Sriram R <quic_srirrama@quicinc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC] mac80211: Mesh Fast xmit support
Message-ID: <202112050138.7zrjRa42-lkp@intel.com>
References: <1638583489-6518-1-git-send-email-quic_srirrama@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1638583489-6518-1-git-send-email-quic_srirrama@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Sriram,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on jberg-mac80211-next/master]
[also build test ERROR on next-20211203]
[cannot apply to jberg-mac80211/master v5.16-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sriram-R/mac80211-Mesh-Fast-xmit-support/20211204-100545
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next.git master
config: i386-randconfig-r023-20211203 (https://download.01.org/0day-ci/archive/20211205/202112050138.7zrjRa42-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f1d1854eb1450d352663ee732235893c5782237)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/14d9dd609e27a80e3ffcf52e43d32de54577b9f1
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sriram-R/mac80211-Mesh-Fast-xmit-support/20211204-100545
        git checkout 14d9dd609e27a80e3ffcf52e43d32de54577b9f1
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> net/mac80211/mesh_pathtbl.c:1133:7: error: use of undeclared identifier 'old_next_hop'; did you mean 'next_hop'?
           if (!old_next_hop || !ether_addr_equal(old_next_hop->addr, next_hop->addr))
                ^~~~~~~~~~~~
                next_hop
   net/mac80211/mesh_pathtbl.c:1123:70: note: 'next_hop' declared here
   void mesh_path_fix_nexthop(struct mesh_path *mpath, struct sta_info *next_hop)
                                                                        ^
   net/mac80211/mesh_pathtbl.c:1133:41: error: use of undeclared identifier 'old_next_hop'; did you mean 'next_hop'?
           if (!old_next_hop || !ether_addr_equal(old_next_hop->addr, next_hop->addr))
                                                  ^~~~~~~~~~~~
                                                  next_hop
   net/mac80211/mesh_pathtbl.c:1123:70: note: 'next_hop' declared here
   void mesh_path_fix_nexthop(struct mesh_path *mpath, struct sta_info *next_hop)
                                                                        ^
   2 errors generated.


vim +1133 net/mac80211/mesh_pathtbl.c

  1114	
  1115	/**
  1116	 * mesh_path_fix_nexthop - force a specific next hop for a mesh path
  1117	 *
  1118	 * @mpath: the mesh path to modify
  1119	 * @next_hop: the next hop to force
  1120	 *
  1121	 * Locking: this function must be called holding mpath->state_lock
  1122	 */
  1123	void mesh_path_fix_nexthop(struct mesh_path *mpath, struct sta_info *next_hop)
  1124	{
  1125		spin_lock_bh(&mpath->state_lock);
  1126		mesh_path_assign_nexthop(mpath, next_hop);
  1127		mpath->sn = 0xffff;
  1128		mpath->metric = 0;
  1129		mpath->hop_count = 0;
  1130		mpath->exp_time = 0;
  1131		mpath->flags = MESH_PATH_FIXED | MESH_PATH_SN_VALID;
  1132		mesh_path_activate(mpath);
> 1133		if (!old_next_hop || !ether_addr_equal(old_next_hop->addr, next_hop->addr))
  1134			mpath->path_change_count++;
  1135		spin_unlock_bh(&mpath->state_lock);
  1136		ewma_mesh_fail_avg_init(&next_hop->mesh->fail_avg);
  1137		/* init it at a low value - 0 start is tricky */
  1138		ewma_mesh_fail_avg_add(&next_hop->mesh->fail_avg, 1);
  1139		mesh_path_tx_pending(mpath);
  1140	}
  1141	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
