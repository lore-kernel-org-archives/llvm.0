Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C755A6FCE;
	Wed, 30 Aug 2023 18:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693419835; x=1724955835;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ymxlC6jLh9Mr3+C45+sjWLexmjL/lQyUtqKWZdnXZRg=;
  b=Kq/awJ5Ik+tfbnja2HsCpNPI3zzoZNoMpeOh+6F08offTPJ7FqzSUnJa
   YVx4yJSFQPYt8ifXU1huKvObtgWgjRbuMGwKR8IA/Djst7XFUVIIEJbgF
   5yw/OlAuQ9Dgbt1VqVLUGE0BGqqN1uiAQDCy9gjTd5TsO67dTj8bd1eiQ
   GrhBsKjRPj5Nwx3TSOhU5Mup1x0pmrKfGK0yQzu68KmEQPEV5NFR+ZipB
   ChbgmFcHQ1vW5F2qlEcYEsV7WboEGJc12e8R0MAAMUw+58mnAo/Neh7xX
   San5OY4My+/5ukO5u9cAFhNyrBzYyjq/ViLof2O3FOIi1cgNjxkWckLxQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="355221418"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="355221418"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 11:23:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="862731226"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="862731226"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 30 Aug 2023 11:23:51 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbPr4-000A6X-2C;
	Wed, 30 Aug 2023 18:23:50 +0000
Date: Thu, 31 Aug 2023 02:23:10 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.5-esp32 24/34] clang-14: error: linker
 command failed with exit code 1 (use -v to see invocation)
Message-ID: <202308310203.BcYwwBOW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Max Filippov <jcmvbkbc@gmail.com>

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.5-esp32
head:   32b212f29f8b514e9e765eba17d54e901e635130
commit: 6531df78dcbb1d955a0dc87a67760a6bcbca770c [24/34] esp_wifi: add IPC transport
config: um-randconfig-r001-20230831 (https://download.01.org/0day-ci/archive/20230831/202308310203.BcYwwBOW-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310203.BcYwwBOW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310203.BcYwwBOW-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   /usr/bin/ld: drivers/misc/esp32-ipc.o: in function `esp32_ipc_probe':
   drivers/misc/esp32-ipc.c:148: undefined reference to `devm_of_iomap'
   /usr/bin/ld: drivers/misc/esp32-ipc.c:152: undefined reference to `devm_iounmap'
>> clang-14: error: linker command failed with exit code 1 (use -v to see invocation)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ESP32_IPC
   Depends on [n]: OF [=n] && HAS_IOMEM [=n]
   Selected by [y]:
   - ESP32_WIFI_SHMEM [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ESPRESSIF [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
