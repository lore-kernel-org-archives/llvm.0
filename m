Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4539146AE;
	Mon, 14 Aug 2023 05:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691990025; x=1723526025;
  h=date:from:cc:subject:message-id:mime-version;
  bh=idFgcfq4nicQlDb75oxlybIP0TLu4rUeYlDR80ppX9M=;
  b=YJH/GdHe0q7PHzV/WtmrwPr+zWs9hmCW9LESviQ03nBY1ND84Kiz6Ljs
   IGzgCdwpP7DXddPXFGbaa3lUStQX+nq2l1E3DDep6ATtCP+vMV42HYSXk
   hREKunAaOHsqkMg4HAyNPdypIenRopVrJz4v+AzjzOQsCSRBhdGfoLU1p
   SfGwaY2BHB/KSL1FByBJnCHv7Zkj0HGjb100bHrxq1t4U3Jh8eCHz97FB
   rjh4vFmf7RxG71Qp6zGNS8qtF1+MYUH1ymRQ8M8b9cQ2z4BskV6+Jhs2a
   rj1APbVL4Wv3p0URleZ8HqS9DtbfhK8PVkp8xTzU9JOq7luy/U0YfJAjo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="370864187"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="370864187"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 22:13:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="803336817"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="803336817"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Aug 2023 22:13:43 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVPte-0009NQ-1W;
	Mon, 14 Aug 2023 05:13:42 +0000
Date: Mon, 14 Aug 2023 13:13:27 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [linux-stable-rc:linux-5.10.y 9989/9999]
 net/netfilter/nf_tables_api.o: warning: objtool:
 nf_tables_deactivate_set()+0x2bb: unreachable instruction
Message-ID: <202308141325.aim9yRqx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Pablo Neira Ayuso <pablo@netfilter.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
head:   5b1776cc14bf85186ed45a8d68d33206f73c727e
commit: cf36c4851c0fc05220d00a1e324ef9efc63feb88 [9989/9999] netfilter: nf_tables: report use refcount overflow
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230814/202308141325.aim9yRqx-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230814/202308141325.aim9yRqx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308141325.aim9yRqx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/nf_tables_api.o: warning: objtool: nf_tables_deactivate_set()+0x2bb: unreachable instruction
--
>> net/netfilter/nft_immediate.o: warning: objtool: nft_immediate_destroy()+0x10e: unreachable instruction


objdump-func vmlinux.o nf_tables_deactivate_set:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
