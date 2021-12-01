Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD93D68
	for <llvm@lists.linux.dev>; Wed,  1 Dec 2021 01:25:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="297160554"
X-IronPort-AV: E=Sophos;i="5.87,277,1631602800"; 
   d="scan'208";a="297160554"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2021 17:24:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,277,1631602800"; 
   d="scan'208";a="459833528"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 30 Nov 2021 17:24:57 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1msEMi-000E1p-Vo; Wed, 01 Dec 2021 01:24:56 +0000
Date: Wed, 1 Dec 2021 09:24:22 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Blakey <paulb@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Saeed Mahameed <saeedm@nvidia.com>,
	Oz Shlomo <ozsh@nvidia.com>
Subject: [saeed:net-next 612/668] net/openvswitch/flow.c:915:19: warning:
 variable 'zone' is uninitialized when used here
Message-ID: <202112010929.w3wcdBWp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git net-next
head:   960dff4cc0bfc59cc7a168c8f1e1f58c93f6a10d
commit: dff3da2f663fdac40a3d72b85ee3b5f89e88501f [612/668] net: openvswitch: Fix matching zone id for invalid conns arriving from tc
config: x86_64-randconfig-r022-20211130 (https://download.01.org/0day-ci/archive/20211201/202112010929.w3wcdBWp-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 25eb7fa01d7ebbe67648ea03841cda55b4239ab2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git/commit/?id=dff3da2f663fdac40a3d72b85ee3b5f89e88501f
        git remote add saeed https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git
        git fetch --no-tags saeed net-next
        git checkout dff3da2f663fdac40a3d72b85ee3b5f89e88501f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/openvswitch/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/openvswitch/flow.c:915:19: warning: variable 'zone' is uninitialized when used here [-Wuninitialized]
                           key->ct_zone = zone;
                                          ^~~~
   net/openvswitch/flow.c:864:10: note: initialize the variable 'zone' to silence this warning
           u16 zone;
                   ^
                    = 0
   1 warning generated.


vim +/zone +915 net/openvswitch/flow.c

   910	
   911		err = key_extract(skb, key);
   912		if (!err) {
   913			ovs_ct_fill_key(skb, key, post_ct);   /* Must be after key_extract(). */
   914			if (post_ct && !skb_get_nfct(skb))
 > 915				key->ct_zone = zone;
   916		}
   917		return err;
   918	}
   919	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
