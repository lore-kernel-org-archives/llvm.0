Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76437F3;
	Tue,  4 Apr 2023 07:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680592448; x=1712128448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7F4rqxNwdR6n8Ncv0fjMdYhXqQN0yEZQTVU5ipJ+E48=;
  b=XnY/IHkhQiF0xg6hLP8MKV8zDhPhx2DJ20uTnYhBDSzJkTezLzoxs/XZ
   Xnd9ObbmmY/pLPGZYoheG0xiJO/Ht96t00SsKTLK/VrYiJREQlGTJcvXk
   1hKfuOowvz6af+vQ6DHgJcc3ecu2kpD5IglWct0WqIMNBlIwpdTezRvNy
   ai7HnylKsIo+X1dt5euRyyeF9W6sgDTzVuv6Ab7r/9QL6vOUAwI9SYqkG
   tRJzvrh9Oj/QnxlunO+IbmcHU20Fc4WmdUgKIE+3zmiHbBba5OBZmM+oD
   fh8Bahu5jBUk6ZplK9p7ecpp96IifEpPpUE/xpdRVy5NNBpykzwsuWoM9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="428396677"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="428396677"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 00:14:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="679784413"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="679784413"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 04 Apr 2023 00:13:59 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjare-000PJa-33;
	Tue, 04 Apr 2023 07:13:58 +0000
Date: Tue, 4 Apr 2023 15:13:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-tpm-wip 2/7] arch/x86/coco/tdx/tdx.c:188:6:
 warning: unused variable 'ret'
Message-ID: <202304041539.7CCwGYy5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-tpm-wip
head:   e2f91af6624fa658a8c4fea969584f50e46f0397
commit: 32ff50e52646b95356c1b7849b88bc67305795b3 [2/7] x86/coco: Add service hypercall support
config: x86_64-randconfig-a002-20230403 (https://download.01.org/0day-ci/archive/20230404/202304041539.7CCwGYy5-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/32ff50e52646b95356c1b7849b88bc67305795b3
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-tpm-wip
        git checkout 32ff50e52646b95356c1b7849b88bc67305795b3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/coco/tdx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304041539.7CCwGYy5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/coco/tdx/tdx.c:188:6: warning: unused variable 'ret' [-Wunused-variable]
           int ret;
               ^
   1 warning generated.


vim +/ret +188 arch/x86/coco/tdx/tdx.c

   168	
   169	/**
   170	 * tdx_hcall_service() - Wrapper to request service from VMM
   171	 *                       using Service hypercall.
   172	 * @req: Address of the direct mapped command request buffer
   173	 *       which contains the service command.
   174	 * @resp: Address of the direct mapped command response buffer
   175	 *        to store service response.
   176	 * @timeout: Maximum Timeout in seconds for command request and
   177	 *           response.
   178	 *
   179	 * Refer to section titled "TDG.VP.VMCALL<Service>" in the TDX GHCI
   180	 * v1.5 specification for more information on Service hypercall.
   181	 * It is used in the TDX TPM driver to service TPM commands.
   182	 *
   183	 * Return 0 on success, error code on failure.
   184	 */
   185	int tdx_hcall_service(u8 *req, u8 *resp, u64 timeout)
   186	{
   187		struct tdx_hypercall_args args = {0};
 > 188		int ret;
   189	
   190		if (!tdx_event_irq_vector)
   191			return -EIO;
   192	
   193		args.r10 = TDX_HYPERCALL_STANDARD;
   194		args.r11 = TDVMCALL_SERVICE;
   195		args.r12 = cc_mkdec(virt_to_phys(req));
   196		args.r13 = cc_mkdec(virt_to_phys(resp));
   197		args.r14 = tdx_event_irq_vector;
   198		args.r15 = timeout;
   199	
   200		return __tdx_hypercall(&args, 0);
   201	}
   202	EXPORT_SYMBOL_GPL(tdx_hcall_service);
   203	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
