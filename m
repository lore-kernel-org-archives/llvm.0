Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9442F25
	for <llvm@lists.linux.dev>; Tue,  1 Feb 2022 18:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643739663; x=1675275663;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KyOSWEaejFfh8yGXm841fhhAs/IxurylSze+gORwEsM=;
  b=WhoxNz42PjroNJDyBYQBQifWo+6oDpT3EtHeuvZmeVh3ScGgglpxJaar
   8nE5o0JwX6kDFhuWx+7sDc+Pb2Us3VLyHSAAn1AFOWhck3uo/C32gkHW7
   fLPE0fsf3vHc6DJu3BCGtlEkglTDB6C2SdAxxHIc3fjiIjF9jqJKmkE05
   1obu0I+/lFq9f0mk60u54/5cWsRh0QStfS0QGqiTxfA3eLEe64AndUmhF
   f1KNE1Q5W6FHP6mNjxET1wLBsHRC3djFoqEP8/SuH10bRYn/7qrG7vgNo
   hx6AHRM269PoVPoZ444phNqGbhvRFVce2bphp2b49m9zT5DHXZdxdlsDj
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="247706589"
X-IronPort-AV: E=Sophos;i="5.88,334,1635231600"; 
   d="scan'208";a="247706589"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2022 10:21:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,334,1635231600"; 
   d="scan'208";a="698497799"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 01 Feb 2022 10:21:00 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nExm0-000TZo-5j; Tue, 01 Feb 2022 18:21:00 +0000
Date: Wed, 2 Feb 2022 02:20:53 +0800
From: kernel test robot <lkp@intel.com>
To: Bob Pearson <rpearsonhpe@gmail.com>, jgg@nvidia.com,
	zyjzyj2000@gmail.com, linux-rdma@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Bob Pearson <rpearsonhpe@gmail.com>
Subject: Re: [PATCH for-next v10 07/17] RDMA/rxe: Use kzmalloc/kfree for mca
Message-ID: <202202020207.bxuWR3xX-lkp@intel.com>
References: <20220131220849.10170-8-rpearsonhpe@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131220849.10170-8-rpearsonhpe@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Bob,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on v5.17-rc2]
[cannot apply to rdma/for-next next-20220201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Bob-Pearson/Move-two-object-pools-to-rxe_mcast-c/20220201-061231
base:    26291c54e111ff6ba87a164d85d4a4e134b7315c
config: arm-randconfig-r001-20220131 (https://download.01.org/0day-ci/archive/20220202/202202020207.bxuWR3xX-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e844b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/f9d560658bbbd5a17cc3c62e566cb9bb77697530
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Bob-Pearson/Move-two-object-pools-to-rxe_mcast-c/20220201-061231
        git checkout f9d560658bbbd5a17cc3c62e566cb9bb77697530
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/infiniband/sw/rxe/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/infiniband/sw/rxe/rxe_mcast.c:57:6: warning: no previous prototype for function '__rxe_destroy_mcg' [-Wmissing-prototypes]
   void __rxe_destroy_mcg(struct rxe_mcg *grp)
        ^
   drivers/infiniband/sw/rxe/rxe_mcast.c:57:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __rxe_destroy_mcg(struct rxe_mcg *grp)
   ^
   static 
   1 warning generated.


vim +/__rxe_destroy_mcg +57 drivers/infiniband/sw/rxe/rxe_mcast.c

    55	
    56	/* caller is holding a ref from lookup and mcg->mcg_lock*/
  > 57	void __rxe_destroy_mcg(struct rxe_mcg *grp)
    58	{
    59		rxe_drop_key(grp);
    60		rxe_drop_ref(grp);
    61	
    62		rxe_mcast_delete(grp->rxe, &grp->mgid);
    63	}
    64	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
