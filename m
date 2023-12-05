Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF613FB3E;
	Tue,  5 Dec 2023 09:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="if9KQ+Sk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701769838; x=1733305838;
  h=date:from:cc:subject:message-id:mime-version;
  bh=MIAFt7VNgxWk7TgtI548K1HVHLtaiMSuNyPEbe3cFfY=;
  b=if9KQ+SkHygxBRPBiuvjP0brHtYYMeO44KkB9SUQBmcOLx5zLahC3wBN
   szCJY5g/YiU+BVhzPb+sWuQss61MCAHMYwMktO0jJOxaThlvqVuP1gBhy
   VwiEQEioYdNV9MVLelAIFHltWvbe85WRvr6xwIE2XVDsnyYn1mpz+9OJP
   E11CV2wE7g6+rZRqixpJxIMYTaWEjb7m1FX5VclgNnltt2V9Wo32o+OGa
   XhWQm/besh8WnjyRmc5pS5/kd8jNdzyTHiB9LY8Qw4kykbF6NwPpFNLbg
   xBvf51eh4ntVUx4DmesapP8KEAyemJI7Ceeim94Qq20cXnIbfFzM1xWx8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="384269376"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="384269376"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 01:50:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="805229071"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="805229071"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 05 Dec 2023 01:50:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAS4Y-0008hq-1C;
	Tue, 05 Dec 2023 09:50:34 +0000
Date: Tue, 5 Dec 2023 17:50:24 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [peterz-queue:x86/kvm 4/11] drivers/net/hyperv/hv_netvsc.o: warning:
 objtool: __tracepoint_rndis_send+0x18: data relocation to !ENDBR:
 __SCT__tp_func_rndis_send+0x0
Message-ID: <202312051747.iubLFpvp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/kvm
head:   bd8e1c4c02ac085925674bddccb989e2d7d6cc2d
commit: 4e0928208ef241e2f7ea9367bda43386f8aec87c [4/11] objtool: Convert instrumentation_{begin,end}() to ANNOTATE
config: x86_64-buildonly-randconfig-005-20231204 (https://download.01.org/0day-ci/archive/20231205/202312051747.iubLFpvp-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051747.iubLFpvp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051747.iubLFpvp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/hyperv/hv_netvsc.o: warning: objtool: __tracepoint_rndis_send+0x18: data relocation to !ENDBR: __SCT__tp_func_rndis_send+0x0
>> drivers/net/hyperv/hv_netvsc.o: warning: objtool: __tracepoint_rndis_recv+0x18: data relocation to !ENDBR: __SCT__tp_func_rndis_recv+0x0
>> drivers/net/hyperv/hv_netvsc.o: warning: objtool: __tracepoint_nvsp_send+0x18: data relocation to !ENDBR: __SCT__tp_func_nvsp_send+0x0
>> drivers/net/hyperv/hv_netvsc.o: warning: objtool: __tracepoint_nvsp_send_pkt+0x18: data relocation to !ENDBR: __SCT__tp_func_nvsp_send_pkt+0x0
>> drivers/net/hyperv/hv_netvsc.o: warning: objtool: __tracepoint_nvsp_recv+0x18: data relocation to !ENDBR: __SCT__tp_func_nvsp_recv+0x0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
