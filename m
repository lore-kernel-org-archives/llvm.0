Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B648468;
	Fri, 11 Aug 2023 19:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691781711; x=1723317711;
  h=date:from:cc:subject:message-id:mime-version;
  bh=FNmjrG9JZ/12H8iaVfUebop38A00OJyKWRbBSKZrur0=;
  b=I5x+dgBUok4pL404rqaILh0oKMGSaGVwAC/ovmiBg8fUKEB2mSXp1rz2
   /To1Z9O5FELC2uxialTTako9VBXqIvj26Pho3pdV1+aOBVBUcHHAgVJM6
   jKt16VllJjzj77AqpcpqZBygm2iHPJpstVhMLAMnYsJUN6eT38gIOk8Ui
   CCrnmPWk07c+Y5Kc27tgksCJp/g6LFQYiK9piz0B8B0q6a4DRHrRACezi
   uVUnqBnqN0Oc8rLtDFs/Lpz8h6RVaeqKqWWg9VH3wDIw3tuehCll/19Mj
   FM1gVNyPpTwkJHrMk9L81MnOK49vB6HsYp40GPlpisBxyPqGJZhFWyEA/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="375458128"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="375458128"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 12:21:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="906554269"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="906554269"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 11 Aug 2023 12:21:50 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUXhl-0007ya-29;
	Fri, 11 Aug 2023 19:21:49 +0000
Date: Sat, 12 Aug 2023 03:21:38 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [broonie-spi:for-6.6 14/42] vmlinux.o: warning: objtool:
 amd_spi_host_transfer() falls through to next function
 amd_spi_max_transfer_size()
Message-ID: <202308120329.no6VNiTY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-spi@vger.kernel.org
TO: Yang Yingliang <yangyingliang@huawei.com>
CC: Mark Brown <broonie@kernel.org>

Hi Yang,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-6.6
head:   ddaec4e44d4e2a556b51159d48788a85ff67179d
commit: e9759d403baaeda9ea4d61d64c3151e214561217 [14/42] spi: amd: switch to use modern name
config: x86_64-randconfig-r033-20230811 (https://download.01.org/0day-ci/archive/20230812/202308120329.no6VNiTY-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120329.no6VNiTY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120329.no6VNiTY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: jffs2_erase_pending_blocks() falls through to next function jffs2_free_jeb_node_refs()
>> vmlinux.o: warning: objtool: amd_spi_host_transfer() falls through to next function amd_spi_max_transfer_size()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
