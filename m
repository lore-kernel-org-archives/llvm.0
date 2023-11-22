Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DD0184C;
	Wed, 22 Nov 2023 02:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iLI6k+HL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700621122; x=1732157122;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+SRKTY82F5RwG3K6X109BY32eywlj2KI1nBKJq1iZnY=;
  b=iLI6k+HLttu6hnVsm1bRyy/yj5tsStz+GkduVFOLPjNKYJn7rMuzkxaS
   DNB+999qhlv5/fnFVcQoHG7ThDgwCYDh80GZ/2pAeg+sR71QTsoqhrXR2
   FXifE0zQb/SoQJHxwcTUyyuPIkAOp420EZMHhH4XH4qRjXtCUmKq9fICR
   XF8NECPfIHpoHLehDkTNqYVataQLIr6iXf2hVVyaIbE291baUMP8cQhXn
   XcF3C2uJXMmJjc8j19lRR3w+Gq/a1ZuPtQEklkpaDLYf69f5i5DBOvRF3
   CFHTE5Vo5VoAqzLW/LA/hAW//kutPTN9ht6y8PJoKUYmgOl7XXeg4TgcS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="372142830"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="372142830"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 18:45:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="760300438"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="760300438"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Nov 2023 18:45:19 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5dDQ-0008ZA-0e;
	Wed, 22 Nov 2023 02:44:42 +0000
Date: Wed, 22 Nov 2023 10:36:36 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>, linux-doc@vger.kernel.org
Subject: [asahilinux:bits/200-dcp 126/145]
 drivers/mux/apple-display-crossbar.c:22: warning: This comment starts with
 '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202311221053.cOjeBbia-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   e3a82f03cd81edb4608ab6dde0e073ac91e2fdb8
commit: 592b58213f6556b76911d71b22f1d1de1e1a88ac [126/145] mux: apple dp crossbar: Support t602x DP cross bar variant
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231122/202311221053.cOjeBbia-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311221053.cOjeBbia-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311221053.cOjeBbia-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mux/apple-display-crossbar.c:22: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * T602x register interface is cleary different so most of the nemes below are
   drivers/mux/apple-display-crossbar.c:44: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * T8013, T600x, T8112 dp crossbar registers.


vim +22 drivers/mux/apple-display-crossbar.c

    20	
    21	/**
  > 22	 * T602x register interface is cleary different so most of the nemes below are
    23	 * probly wrong.
    24	 */
    25	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
