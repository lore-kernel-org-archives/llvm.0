Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB7723B1;
	Sat, 30 Sep 2023 16:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696091623; x=1727627623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jkGq4FyeEK1wZTuf5qwJm/j7GEFBeAFVDImvOvRcjCc=;
  b=VAFfvMpBbqvba0njKq9yfe45sJAdZcPLpW5HgVvakmd+fi4tJv+geM+t
   zwKf4wc9NpIQQyAh7NU/VJH0odrNZM3GeRtWsaKlxyv4ehtoVbV6x6jY5
   gdjH1xdM3PZP/2YStF2T7A0UuVH4cdEQU1Vi2MUVFz3+CpqSWHhoDt5/+
   DwpPYyU2qsveJlpTv2T8a9E4ZJiRxDPDaoMlGc4JGEMOTUNn/C6UtUvRa
   c1egxa1CNyoX5SbUVsZnzE4goh3ElGYc+A5QsM+kKCnU3FqSixhYVc2Bi
   YiG1q/CPESnPHh9l8YmvYwJGXGrxT+zbPlxAYVwMXpSoIV+SJAxsRy6Bq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="446615898"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="446615898"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 09:33:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="699932077"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="699932077"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 30 Sep 2023 09:33:40 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmcuQ-0004IL-23;
	Sat, 30 Sep 2023 16:33:38 +0000
Date: Sun, 1 Oct 2023 00:33:26 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-unionfs@vger.kernel.org
Subject: [mszeredi-vfs:statmount-v3 3/4] <stdin>:1573:2: warning: syscall
 statmount not implemented
Message-ID: <202310010048.tqG9YpMs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/vfs.git statmount-v3
head:   5321994510f383b43dd2d49fcbdaedcf8cba1306
commit: 752065afadf4dbffa79febfc8e30d771353c1584 [3/4] add statmount(2) syscall
config: mips-ath25_defconfig (https://download.01.org/0day-ci/archive/20231001/202310010048.tqG9YpMs-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310010048.tqG9YpMs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310010048.tqG9YpMs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> <stdin>:1573:2: warning: syscall statmount not implemented [-W#warnings]
    1573 | #warning syscall statmount not implemented
         |  ^
   1 warning generated.
--
>> <stdin>:1573:2: warning: syscall statmount not implemented [-W#warnings]
    1573 | #warning syscall statmount not implemented
         |  ^
   1 warning generated.
--
>> <stdin>:1573:2: warning: syscall statmount not implemented [-W#warnings]
    1573 | #warning syscall statmount not implemented
         |  ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
