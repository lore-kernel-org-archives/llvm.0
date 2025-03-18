Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F6E1917FB;
	Tue, 18 Mar 2025 17:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742320160; cv=none; b=pQdCvaPg+l9d8f3mLJPPruOlSgsaoycMa/11Ut6YDQmIIjWp8zZMF6XFj6whqJae7Ce+oCToG8F/2kUw4mIGna1UaJp94eWgV50p9TGpIhgFaWhdg0VRYTdMdDR5RcI4zbapqm7dWVPEmq1PzwGyg8zzq+a1TR7/ISCdotF1ef4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742320160; c=relaxed/simple;
	bh=k34fZ0bIh8psfvN9IA9ptmSP+cOI7/hhmDvb5wAVIPA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QerK1b9/+knXb1W0BN33F0wzCAkPJptjP9Ml2vD6yKsAQ4khdGDcmiBi/d7ZwB+9MdMdv5F+rSaREvRerJP7oYWiuoNAxRL0islHnUkHRZHvuSXIxB9Z2JjXKDxW0qPGFhZ7LY4tQW2H36ziyMTUgH6oJC18JVmBtEDegBICFm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ltpw1EUv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ltpw1EUv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742320158; x=1773856158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k34fZ0bIh8psfvN9IA9ptmSP+cOI7/hhmDvb5wAVIPA=;
  b=ltpw1EUvGwoJH5B5QRG4OqUJq4jAGu16OLGNAEjaE99T2e/R8S5JTbQO
   mtR0LjKeQweodb6+fzFhkTvqryc55P+7cbMVlUUo/7DoqBfXaMbvwwRVW
   nEG9rFfaO5agN7vHj100BKXOeBbhrwGP6VwVkUyuiqKPtu9aT1XaNWNnQ
   No6NRBxhRd19dxrObQ2uLQlzdlZ1Z9Gmz+Pf+ol7Klf8rrhAL0naRgMT/
   ng/Vsc58gUgXbKrn+N2tXj/68tD0B5BSrWk3t4NXMqfaBu7m1NAf44N/s
   jcpmQi+NgDlYFVMIsm3/QnLCAZTP0kzM1VJxwoy7YcuiL2bw5pzkVVgVO
   g==;
X-CSE-ConnectionGUID: SaDUQ1axSmyqPl2be9R6IA==
X-CSE-MsgGUID: SD7r9V3kRU23Tnm+Ud0RZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="53692685"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="53692685"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 10:49:18 -0700
X-CSE-ConnectionGUID: ZsR/pY1WR1mT/kB7G7zkHA==
X-CSE-MsgGUID: 0nxxJKwbSumzKiLmZKFQKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="122350097"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 18 Mar 2025 10:49:17 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tub3y-000E2k-2I;
	Tue, 18 Mar 2025 17:49:14 +0000
Date: Wed, 19 Mar 2025 01:49:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 3/17] ERROR: modpost: "devm_ioremap_resource_wc"
 [drivers/remoteproc/qcom_q6v5_pas.ko] undefined!
Message-ID: <202503190118.2NswvIEl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   533e09a4b2a4e7e9b4170be21d9a34a0871d8337
commit: 9663d85dd47bbe3adb12fd0d9f8cdbe163c889d9 [3/17] remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
config: arm64-randconfig-002-20250318 (https://download.01.org/0day-ci/archive/20250319/202503190118.2NswvIEl-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250319/202503190118.2NswvIEl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503190118.2NswvIEl-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> ERROR: modpost: "devm_ioremap_resource_wc" [drivers/remoteproc/qcom_q6v5_pas.ko] undefined!
>> ERROR: modpost: "devm_ioremap_resource_wc" [drivers/remoteproc/qcom_wcnss_pil.ko] undefined!
>> ERROR: modpost: "devm_ioremap_resource_wc" [drivers/remoteproc/ti_k3_r5_remoteproc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
