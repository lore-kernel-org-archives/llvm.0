Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6219218D
	for <llvm@lists.linux.dev>; Sat, 19 Mar 2022 00:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647650695; x=1679186695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Waa6UaQ8DXjX/4JnvVYJvUN1UNFfkOpgMZau9jyzVdE=;
  b=IAZF8R7jTvIwwhxHZfXtv75RMBMgjnJnGH9cq78oilm+6jQxFoji1kGr
   WKTvz3CR4NmMc0GcpO2IBFx4DcZEQMvOLpTdg7unZpmvHNcvd13ZlEtae
   ObR0z1eDsllGuzx+p7Q5L3Cv8fynIwZcYjZaVP2PrLdHh1Pkk7gSQ+Wrc
   K3DH8a5xAy/slcxffYBLutfJlNIx5xm/NK4vX6HdCX3Yxy9cHWknazAnn
   DfLYyRXO7dUv3HE4up4Irx7wyg1fHejWW4uZY+BnKq5txhyta6IWTLxBx
   /fY+2KFHo3LKOBT0MsneTjIEnNCt+X3zPCkuY4CooYpYJ4pVFRTFgkYab
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="320465766"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="320465766"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 17:44:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="647708479"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 18 Mar 2022 17:44:53 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nVNDA-000FKU-SD; Sat, 19 Mar 2022 00:44:52 +0000
Date: Sat, 19 Mar 2022 08:44:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jlayton:ceph-sparse-read 14/15] net/ceph/osd_client.c:5847:30:
 error: initializing 'struct ceph_sparse_extent *' with an expression of
 incompatible type 'struct ceph_sparse_extent'; take the address with &
Message-ID: <202203190851.4BjZDePa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git ceph-sparse-read
head:   dd42d5af0df78fdd04a5a93c0488211435bd32e6
commit: 555a255575736e3b39f6b2c70574422439b765b6 [14/15] libceph: add sparse read support to OSD client
config: arm64-randconfig-r034-20220317 (https://download.01.org/0day-ci/archive/20220319/202203190851.4BjZDePa-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6e70e4056dff962ec634c5bd4f2f4105a0bef71)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/commit/?id=555a255575736e3b39f6b2c70574422439b765b6
        git remote add jlayton https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git
        git fetch --no-tags jlayton ceph-sparse-read
        git checkout 555a255575736e3b39f6b2c70574422439b765b6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash net/ceph/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> net/ceph/osd_client.c:5847:30: error: initializing 'struct ceph_sparse_extent *' with an expression of incompatible type 'struct ceph_sparse_extent'; take the address with &
                   struct ceph_sparse_extent *ext = sr->sr_extent[i];
                                              ^     ~~~~~~~~~~~~~~~~
                                                    &
   1 error generated.


vim +5847 net/ceph/osd_client.c

  5840	
  5841	#ifdef __BIG_ENDIAN
  5842	static inline void convert_extent_map(struct ceph_sparse_read *sr)
  5843	{
  5844		int i;
  5845	
  5846		for (i = 0; i < sr->sr_count; i++) {
> 5847			struct ceph_sparse_extent *ext = sr->sr_extent[i];
  5848	
  5849			ext->off = le64_to_cpu((__force __le32)ext->off);
  5850			ext->len = le64_to_cpu((__force __le32)ext->len);
  5851		}
  5852	}
  5853	#else
  5854	static inline void convert_extent_map(struct ceph_sparse_read *sr)
  5855	{
  5856	}
  5857	#endif
  5858	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
