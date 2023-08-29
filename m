Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F2514AAF;
	Tue, 29 Aug 2023 20:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693342211; x=1724878211;
  h=date:from:cc:subject:message-id:mime-version;
  bh=KYmFPHXnaFkGmxAMbMwXDRJruRZ6CnBvhtFyYf6OTNo=;
  b=lWdWOTrFlXfu5ygqDtWDGSA9t2c880mjEek13v7zDiqvLnvlB/S4MHve
   VD52Ln/tQSqmsqV07e+nNYPysSO4rMn9b4jQ+NYZ7lCmrNVJN56i+lI45
   sKeawd90M9SLTt7lM0tBNE/lqZqn3TxQk43HOcpoq1LtcX8TXL+fcm4Ad
   y5qkZlAosqlmCDqOdqubAvXMyB5ydRaOlm9qf9X1AddZETvVyCSL/RyCr
   r2b5+yG84y5Zwst1ZodfKH3DSzb2b4xZG0nKzK8H1S3ncSvo5FlHeyJU8
   NY6Hvxx11CvsHuKhwK4yX10oGvdMmqxlB9/KdsZpP+pmPSVItrJs26YA+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="374378340"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="374378340"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 13:50:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688642495"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="688642495"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 13:50:08 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qb5f5-00094R-1Z;
	Tue, 29 Aug 2023 20:50:07 +0000
Date: Wed, 30 Aug 2023 04:49:42 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: arch/x86/kvm/kvm-amd.o: warning: objtool:
 __svm_sev_es_vcpu_run+0x4a: BP used as a scratch register
Message-ID: <202308300414.IzgpaT6c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Nicolas Schier <nicolas@fjasle.eu>
CC: Sami Tolvanen <samitolvanen@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eaf9f4649cf03ba3442712497a30686380ba7c23
commit: c25e1c55822f9b3b53ccbf88b85644317a525752 kbuild: do not create *.prelink.o for Clang LTO or IBT
date:   1 year, 3 months ago
config: x86_64-randconfig-012-20230830 (https://download.01.org/0day-ci/archive/20230830/202308300414.IzgpaT6c-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308300414.IzgpaT6c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308300414.IzgpaT6c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kvm/kvm-amd.o: warning: objtool: __svm_vcpu_run+0xe2: BP used as a scratch register
>> arch/x86/kvm/kvm-amd.o: warning: objtool: __svm_sev_es_vcpu_run+0x4a: BP used as a scratch register


objdump-func vmlinux.o __svm_sev_es_vcpu_run:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
