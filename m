Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268931FDF;
	Wed, 19 Jul 2023 05:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689744435; x=1721280435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7pz0sK01DdvU4zYtuiJq/8cqIVIbdTHg1wuHBtXAa2o=;
  b=fnsIg3LGRwfhg6Lv7aiwHTa1o23fYsl0LY2lhDs0EfKAx1DNyPDsqw4S
   DvTWteq7pHxE290njjpmqtpM4Ya3gFuWc4eyukUgva4h8S6XBGHh99dsl
   PN4DFpp0Cbvgbea3lEqH7mZa1/PMn48MfHJIMBjfwvEatnbaq0lLKsScC
   IGbm8KQd1tEFKRoz4vubAYMsmV5QfsKkY2sEZYGcoCG4NvmUgM8A9Pnhg
   k1KZfbMgYRX7PLCKKKiQLH0mibnMx1qUaquL6+hDNLyl/ob9RXTXSG4yY
   zuFLwwN/VTu0AcjQLJv9hVtDPO89c9LlZ2ozI3hB16E8N57nFuKj+fDXG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="452751649"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="452751649"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 22:27:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="717865627"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="717865627"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 18 Jul 2023 22:27:12 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLziP-0004BF-00;
	Wed, 19 Jul 2023 05:27:10 +0000
Date: Wed, 19 Jul 2023 13:26:17 +0800
From: kernel test robot <lkp@intel.com>
To: Tomer Tayar <ttayar@habana.ai>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Oded Gabbay <ogabbay@kernel.org>
Subject: [ogabbay:habanalabs-accel 21/24]
 drivers/accel/habanalabs/common/device.c:587:5: warning: no previous
 prototype for function '__hl_mmap'
Message-ID: <202307191311.X6nwQDrf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git habanalabs-accel
head:   66064465171cd205e35f2c0c1f23eaff0eea3d56
commit: cc9c2ec0e61883b26effbe0b8cf40d5180999d21 [21/24] accel/habanalabs: register compute device as an accel device
config: x86_64-randconfig-x006-20230718 (https://download.01.org/0day-ci/archive/20230719/202307191311.X6nwQDrf-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191311.X6nwQDrf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191311.X6nwQDrf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/accel/habanalabs/common/device.c:587:5: warning: no previous prototype for function '__hl_mmap' [-Wmissing-prototypes]
   int __hl_mmap(struct hl_fpriv *hpriv, struct vm_area_struct *vma)
       ^
   drivers/accel/habanalabs/common/device.c:587:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __hl_mmap(struct hl_fpriv *hpriv, struct vm_area_struct *vma)
   ^
   static 
   1 warning generated.


vim +/__hl_mmap +587 drivers/accel/habanalabs/common/device.c

   586	
 > 587	int __hl_mmap(struct hl_fpriv *hpriv, struct vm_area_struct *vma)
   588	{
   589		struct hl_device *hdev = hpriv->hdev;
   590		unsigned long vm_pgoff;
   591	
   592		if (!hdev) {
   593			pr_err_ratelimited("Trying to mmap after device was removed! Please close FD\n");
   594			return -ENODEV;
   595		}
   596	
   597		vm_pgoff = vma->vm_pgoff;
   598	
   599		switch (vm_pgoff & HL_MMAP_TYPE_MASK) {
   600		case HL_MMAP_TYPE_BLOCK:
   601			vma->vm_pgoff = HL_MMAP_OFFSET_VALUE_GET(vm_pgoff);
   602			return hl_hw_block_mmap(hpriv, vma);
   603	
   604		case HL_MMAP_TYPE_CB:
   605		case HL_MMAP_TYPE_TS_BUFF:
   606			return hl_mem_mgr_mmap(&hpriv->mem_mgr, vma, NULL);
   607		}
   608		return -EINVAL;
   609	}
   610	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
