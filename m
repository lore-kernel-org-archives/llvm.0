Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1C12C82
	for <llvm@lists.linux.dev>; Thu, 13 Jan 2022 12:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642076208; x=1673612208;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=roiXvwsCJ2r/QnoW//F6QW3xaSm4lbYiofK086ssinA=;
  b=LEstYqmxo9vBytHTlFdkKgiooxMpwWuw4U2T3fXYqHxGYavUyR+DzazG
   zGnc9VCMeqZFbDzsqG5WgO4dw2yvPBYBmsmk4adQ340WHgrHEqyYmF1t2
   0arNkpu2cUWma8m8F0Q/X0so2Q6Gr1r87tRP7JhlOiQJcK5lnpVVgbLXx
   M63CmkYnntnHHJfkhlRvjitv8jqMfqKwOfDpNOLCQVyIw3JpmPb1JyYTV
   +o9T2dojnUbg3NEJZMwV+qbkTVPETp2wA+NLRq0pvCxqswl8ijrnYRDyq
   /222AV0uCUhViVckVAE3pYubc/61skQ3cg6YQRtE3Au/8pqOS9eWMgXiG
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="242812090"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; 
   d="scan'208";a="242812090"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2022 04:16:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; 
   d="scan'208";a="515907378"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 13 Jan 2022 04:16:46 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n7z25-0007Av-Dg; Thu, 13 Jan 2022 12:16:45 +0000
Date: Thu, 13 Jan 2022 20:16:05 +0800
From: kernel test robot <lkp@intel.com>
To: Xiao Yang <yangx.jy@fujitsu.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v2 2/2] RDMA/rxe: Support RDMA Atomic Write operation
Message-ID: <202201132027.agYTyFRu-lkp@intel.com>
References: <20220113030350.2492841-3-yangx.jy@fujitsu.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113030350.2492841-3-yangx.jy@fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Xiao,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on v5.16]
[also build test ERROR on next-20220113]
[cannot apply to rdma/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Xiao-Yang/RDMA-rxe-Add-RDMA-Atomic-Write-operation/20220113-110548
base:    df0cc57e057f18e44dac8e6c18aba47ab53202f9
config: riscv-randconfig-r035-20220113 (https://download.01.org/0day-ci/archive/20220113/202201132027.agYTyFRu-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d1021978b8e7e35dcc30201ca1731d64b5a602a8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/4294d58609cfb4c296c7937eafd58e044a4d81c6
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Xiao-Yang/RDMA-rxe-Add-RDMA-Atomic-Write-operation/20220113-110548
        git checkout 4294d58609cfb4c296c7937eafd58e044a4d81c6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/infiniband/sw/rxe/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/infiniband/sw/rxe/rxe_resp.c:606:2: error: call to __compiletime_assert_499 declared with 'error' attribute: Need native word sized stores/loads for atomicity.
           smp_store_release(dst, *src);
           ^
   include/asm-generic/barrier.h:162:2: note: expanded from macro 'smp_store_release'
           compiletime_assert_atomic_type(*p);                             \
           ^
   include/linux/compiler_types.h:338:2: note: expanded from macro 'compiletime_assert_atomic_type'
           compiletime_assert(__native_word(t),                            \
           ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:316:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:165:1: note: expanded from here
   __compiletime_assert_499
   ^
   1 error generated.


vim +/error +606 drivers/infiniband/sw/rxe/rxe_resp.c

   593	
   594	static enum resp_states process_atomic_write(struct rxe_qp *qp,
   595						     struct rxe_pkt_info *pkt)
   596	{
   597		struct rxe_mr *mr = qp->resp.mr;
   598	
   599		u64 *src = payload_addr(pkt);
   600	
   601		u64 *dst = iova_to_vaddr(mr, qp->resp.va + qp->resp.offset, sizeof(u64));
   602		if (!dst || (uintptr_t)dst & 7)
   603			return RESPST_ERR_MISALIGNED_ATOMIC;
   604	
   605		/* Do atomic write after all prior operations have completed */
 > 606		smp_store_release(dst, *src);
   607	
   608		/* decrease resp.resid to zero */
   609		qp->resp.resid -= sizeof(u64);
   610	
   611		return RESPST_NONE;
   612	}
   613	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
