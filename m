Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55ADF186E;
	Sat, 25 Nov 2023 16:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZITN+Jjj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700930923; x=1732466923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uIV2dIBUx15ELzFbCQib2pVVoJo48c8mY/xytMjMl6g=;
  b=ZITN+JjjD11qWRGBgCN+16HhnUurAZTksjhJWLGpOBf0KALmLmkPA19B
   TMhGZxvS4HRlTspTSMRcZxGdAGqaUmv/h2jUXSQhz3BQ7CHx78cbaZJvd
   RvujwzocU53t2JuCwVaULGiMXLJdvtTeIGb49+EuvpqD/CofK+66aOZTv
   yGgcXlBZx5KfLQiIWr581UdW1jQXLqYXzDF3NZlVm4l6y7cPQeiMYSn02
   IxzSi+IKkWAbp4s/F2cTr5OkLpPYci6hdaeObylWWdnXN/OEBaeQRMIIi
   vt9GgYKnUDaVuqeB5CGFSDLpCNFu7cghIcbhQLBjTigrBvnTTWoL714Ke
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="372682276"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="372682276"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 08:48:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="1015152054"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="1015152054"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 25 Nov 2023 08:48:38 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6vpb-0004DC-37;
	Sat, 25 Nov 2023 16:48:35 +0000
Date: Sun, 26 Nov 2023 00:48:21 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.7-rc1-esp32 18/44]
 drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:408:3: warning: call to
 '__warn_flushing_systemwide_wq' declared with 'warning' attribute: Please
 avoid flushing system-wide workqueues.
Message-ID: <202311252335.bLu4UYaO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.7-rc1-esp32
head:   29146ecac0ff1d907be16ff18d485a34985f6bf3
commit: 4ec7aaad4e82b17d2faa76d468344969bb1ef9e4 [18/44] esp_wifi: fix build for linux-6.7
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231125/202311252335.bLu4UYaO-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311252335.bLu4UYaO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311252335.bLu4UYaO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:414:22: warning: no previous prototype for function 'prepare_command_request' [-Wmissing-prototypes]
   struct command_node *prepare_command_request(struct esp_adapter *adapter, u8 cmd_code, u16 len)
                        ^
   drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:414:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct command_node *prepare_command_request(struct esp_adapter *adapter, u8 cmd_code, u16 len)
   ^
   static 
   drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:854:23: warning: variable 'bss' set but not used [-Wunused-but-set-variable]
           struct cfg80211_bss *bss;
                                ^
>> drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:408:3: warning: call to '__warn_flushing_systemwide_wq' declared with 'warning' attribute: Please avoid flushing system-wide workqueues. [-Wattribute-warning]
                   flush_scheduled_work();
                   ^
   include/linux/workqueue.h:639:2: note: expanded from macro 'flush_scheduled_work'
           __warn_flushing_systemwide_wq();                                \
           ^
   3 warnings generated.


vim +408 drivers/net/wireless/espressif/esp32-ng/esp_cmd.c

68443b38720d12 Max Filippov 2023-06-27  404  
68443b38720d12 Max Filippov 2023-06-27  405  static void destroy_cmd_wq(struct esp_adapter *adapter)
68443b38720d12 Max Filippov 2023-06-27  406  {
68443b38720d12 Max Filippov 2023-06-27  407  	if (adapter->cmd_wq) {
68443b38720d12 Max Filippov 2023-06-27 @408  		flush_scheduled_work();
68443b38720d12 Max Filippov 2023-06-27  409  		destroy_workqueue(adapter->cmd_wq);
68443b38720d12 Max Filippov 2023-06-27  410  		adapter->cmd_wq = NULL;
68443b38720d12 Max Filippov 2023-06-27  411  	}
68443b38720d12 Max Filippov 2023-06-27  412  }
68443b38720d12 Max Filippov 2023-06-27  413  

:::::: The code at line 408 was first introduced by commit
:::::: 68443b38720d1296140f260511f3281d5d5cccb5 drivers/net/wireless/espressif/esp32-ng: initial import

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Max Filippov <jcmvbkbc@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
