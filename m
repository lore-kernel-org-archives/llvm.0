Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091D55684;
	Mon, 21 Aug 2023 19:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692646377; x=1724182377;
  h=date:from:cc:subject:message-id:mime-version;
  bh=CpvRz3SzXSIgMhGcQOUercgCb1iE61BLWlRVUnD+XcA=;
  b=hk+BLGfs+4xdl6GCxTgfapF/tuKouEI+2r9SZwvm+TL7Kc+Q5aXf8AHW
   Trjx5rc40K4VZBdLCjEE7IudT8L9bm03NfNVw6y/Pgav7ehdXKuv4MTr0
   8izH3cZKWmS1ncKI6lcbofG99O4Qaiw6HhOByn7PJL3NZ/40RgdPw70Bs
   n28G6+JzGAXLEoNUDExd0eSGMuJlrq3dwxxoFik1wqbQughGUZUlN2Nfg
   EcIaRrRi9gThI8a9cfp653tULfi6Z7vpVKttp3yE45ijczqfd1/7d9aH3
   8x9jCTavRsyCNfZckod/HPKPaA3a9hng6Z9/kCdpp1Q8CjuIftZH6EmSj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="460048044"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="460048044"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 12:32:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="771074038"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="771074038"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 21 Aug 2023 12:32:35 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYAde-0000qU-11;
	Mon, 21 Aug 2023 19:32:34 +0000
Date: Tue, 22 Aug 2023 03:32:18 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.10.y 2874/9999] drivers/hwmon/pmbus/adm1275.o:
 warning: objtool: adm1275_probe()+0x744: unreachable instruction
Message-ID: <202308220333.6Kt4bdn3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Peter Zijlstra <peterz@infradead.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Borislav Petkov <bp@suse.de>
CC: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
CC: Ben Hutchings <bwh@kernel.org>

Hi Peter,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   da742ebfa00c3add4a358dd79ec92161c07e1435
commit: b24fdd0f1c3328cf8ee0c518b93a7187f8cee097 [2874/9999] x86/retbleed: Add fine grained Kconfig knobs
config: x86_64-buildonly-randconfig-004-20230821 (https://download.01.org/0day-ci/archive/20230822/202308220333.6Kt4bdn3-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220333.6Kt4bdn3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220333.6Kt4bdn3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/pmbus/adm1275.o: warning: objtool: adm1275_probe()+0x744: unreachable instruction


objdump-func vmlinux.o adm1275_probe:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
