Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7504403;
	Mon, 18 Dec 2023 02:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LeZUZ6//"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702865818; x=1734401818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kBmXvgQDiWTkCbNOVpIf4GG9M8SJ19N5IMBsSlYQ4Cc=;
  b=LeZUZ6//h1h1bkhEagT67DuNvQaBoPeHwaAKceXgDsPyO9AZXxpYnB7t
   g+7d1j7JAbljCYUvWem/xqktC4WEifn8jgkl0rG2U2kLktkLZPQdd/gp8
   Y1u2asHZZVxrStGPf5qV5uWO1SBvueOdpcdt3pfXGmp7q/PirD1jU/9my
   ygqIcjBl8i1uF/uiO4CN4Bbpu1Ogmfyqu2kEXujaogFucIJgPmz8s1ncr
   E9sY4nv/dlzWt/wXvqzal/CcGDCN2AElwk8/XDMjEtl99BhU5JHZShaTL
   JlKx6wc1CSXZBf97gjEJoQrKRStIFGmHdCZpUnwQe/ZftAnpKuDJbc3pv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="17001472"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="17001472"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 18:16:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="751591090"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="751591090"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 17 Dec 2023 18:16:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rF3AQ-0003fV-00;
	Mon, 18 Dec 2023 02:15:46 +0000
Date: Mon, 18 Dec 2023 10:15:11 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-hmem-report 20/24] drivers/cxl/mem.c:288:3: error: use
 of undeclared identifier 'dev_attr_mem_qos_class'; did you mean
 'dev_attr_pmem_qos_class'?
Message-ID: <202312181027.SHwTaBA8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-hmem-report
head:   da30cd12e1d2c65f67dcdae7cb4842d73184d98e
commit: d1877054cac84876a5263ea668dc0b76d321049d [20/24] fixup missing chunk
config: i386-randconfig-014-20231218 (https://download.01.org/0day-ci/archive/20231218/202312181027.SHwTaBA8-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312181027.SHwTaBA8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312181027.SHwTaBA8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cxl/mem.c:288:3: error: use of undeclared identifier 'dev_attr_mem_qos_class'; did you mean 'dev_attr_pmem_qos_class'?
           &dev_attr_mem_qos_class.attr,
            ^~~~~~~~~~~~~~~~~~~~~~
            dev_attr_pmem_qos_class
   drivers/cxl/mem.c:261:32: note: 'dev_attr_pmem_qos_class' declared here
   static struct device_attribute dev_attr_pmem_qos_class =
                                  ^
   1 error generated.


vim +288 drivers/cxl/mem.c

   285	
   286	static struct attribute *cxl_mem_attrs[] = {
   287		&dev_attr_trigger_poison_list.attr,
 > 288		&dev_attr_mem_qos_class.attr,
   289		&dev_attr_pmem_qos_class.attr,
   290		NULL
   291	};
   292	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
