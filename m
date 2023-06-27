Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABCD7FA;
	Tue, 27 Jun 2023 01:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687828783; x=1719364783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=US6XbYRtv542B2ht8NoVXWNa5wdS3jod7rBJVSkfi0w=;
  b=MrOc/QgoYTr6tBTXvZXFa64S7nDd+PuwjZzFwcEX+gpQFHAwzv4j7GPQ
   Gb4Z+6lz/PnlfYnVd2w0+5HALEj36YRQY9D9S2S/HOevdjVmzK7jw/1D5
   spfnL4cNupa54tvTAo/6vFOw1KD3n2OHbDkKZCSe87AxlzIDSdWuTz9Y2
   jYIC7ONr2wmII5Gr52j6nRdzOMX8ji0T1i9fvFxhyOfFJQ3cHh/DD/xH/
   GNLQMNtJr1TAOm5HNjHHS95GUHAoshpxeydQGmuDoJB1T9zvSbPsX18I4
   o2Axz3ahxcolCWoO5j4lhMJB69tycT3YhxkfUi1GOgZjgOo3fbQaAq1q+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="447822528"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="447822528"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 18:19:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="840494090"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="840494090"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 26 Jun 2023 18:19:40 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDxMp-000BL0-1P;
	Tue, 27 Jun 2023 01:19:39 +0000
Date: Tue, 27 Jun 2023 09:19:12 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-bluetooth@vger.kernel.org
Subject: [bluetooth-next:master 18/33] ERROR: modpost: "pidfd_prepare"
 [net/bluetooth/bluetooth.ko] undefined!
Message-ID: <202306270959.9Y2gQBta-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
head:   53c7c193d66ae7a22f137b38d0d374c756892bd4
commit: b4f7565b8844e5b29a9f3d1855655a7b837da19b [18/33] Bluetooth: hci_sock: Forward credentials to monitor
config: x86_64-randconfig-r006-20230626 (https://download.01.org/0day-ci/archive/20230627/202306270959.9Y2gQBta-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230627/202306270959.9Y2gQBta-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306270959.9Y2gQBta-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "pidfd_prepare" [net/bluetooth/bluetooth.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
