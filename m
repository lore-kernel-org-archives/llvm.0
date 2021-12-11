Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1646A173
	for <llvm@lists.linux.dev>; Sat, 11 Dec 2021 07:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639206396; x=1670742396;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O2YU37KXP0l1tFxVuAvYHeUYDcnslR4XejiggKx5wKA=;
  b=G202c/w4IKNV2OTnNyoC/jVyUd0u9mHfKa2E3/qxQ3Clxh94Gpz1eRkc
   RUvBpVWp2Y9iotWsj2QvaNqXO+bZIpXLA6RMSVVTkf55YtO/lz+3A4Cg+
   98CrKOc4N9OZYoXpetImLcM56sFcnN2ZohUGFKqUeXDjFmEXEz54thbBI
   d9YfIUM4e9YfPNLdnd+j043bMGzo+g3sbeZzJie5cdXWwEbTz+ubcqA6m
   blfIE4WR9Im+KX7sWWsB3oczyRNEdpfnauF5sgk43dUnPc3aOcTNQb8J9
   5MCbTR5FAQ4y7h7J4MvhqYEYy7qwFzrJaYu00xR/bBJbqH8sqRTiVGBp8
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="238740015"
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; 
   d="scan'208";a="238740015"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2021 23:06:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; 
   d="scan'208";a="462806055"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 10 Dec 2021 23:06:33 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mvwSn-0004HG-2W; Sat, 11 Dec 2021 07:06:33 +0000
Date: Sat, 11 Dec 2021 15:06:29 +0800
From: kernel test robot <lkp@intel.com>
To: Dai Ngo <dai.ngo@oracle.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH RFC v7 2/2] nfsd: Initial implementation of NFSv4
 Courteous Server
Message-ID: <202112111506.H3x5bYP2-lkp@intel.com>
References: <20211211010244.44599-3-dai.ngo@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211211010244.44599-3-dai.ngo@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Dai,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on v5.16-rc4]
[cannot apply to cel-2.6/for-next jlayton/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Dai-Ngo/nfsd-Initial-implementation-of-NFSv4-Courteous-Server/20211211-090428
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 9e65da135b39cabd82dc2f56b0db526b65a8d690
config: i386-randconfig-a011-20211210 (https://download.01.org/0day-ci/archive/20211211/202112111506.H3x5bYP2-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1cb1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/cba406450190222281d46b185d17895e76cf370b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Dai-Ngo/nfsd-Initial-implementation-of-NFSv4-Courteous-Server/20211211-090428
        git checkout cba406450190222281d46b185d17895e76cf370b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/nfsd/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/nfsd/nfs4state.c:6759:10: warning: expression which evaluates to zero treated as a null pointer constant of type 'void *' [-Wnon-literal-null-conversion]
                   return false;
                          ^~~~~
   1 warning generated.


vim +6759 fs/nfsd/nfs4state.c

  6730	
  6731	/*
  6732	 * If testonly is true then check if the client owns the lock is a
  6733	 * courtesy client. If it is then return that client else return NULL.
  6734	 * If testonly is false then destroy the specified courtesy client.
  6735	 */
  6736	static void *
  6737	nfsd4_fl_expire_lock(void *cfl, bool testonly)
  6738	{
  6739		struct file_lock *fl;
  6740		struct nfs4_lockowner *lo;
  6741		struct nfs4_client *clp;
  6742		struct nfsd_net *nn;
  6743	
  6744		if (testonly) {
  6745			fl = (struct file_lock *)cfl;
  6746			lo = (struct nfs4_lockowner *)fl->fl_owner;
  6747			clp = lo->lo_owner.so_client;
  6748			if (test_bit(NFSD4_COURTESY_CLIENT, &clp->cl_flags))
  6749				return clp;
  6750			return NULL;
  6751		}
  6752		clp = (struct nfs4_client *)cfl;
  6753	
  6754		nn = net_generic(clp->net, nfsd_net_id);
  6755		spin_lock(&nn->client_lock);
  6756		if (!test_bit(NFSD4_COURTESY_CLIENT, &clp->cl_flags) ||
  6757				mark_client_expired_locked(clp)) {
  6758			spin_unlock(&nn->client_lock);
> 6759			return false;
  6760		}
  6761		spin_unlock(&nn->client_lock);
  6762		expire_client(clp);
  6763		return (void *)true;
  6764	}
  6765	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
