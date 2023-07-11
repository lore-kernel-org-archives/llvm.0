Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0188182AC;
	Tue, 11 Jul 2023 09:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689069359; x=1720605359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kdSw6kZRwiK4PCHoVcSIccUbzWh5YJF4C6ZDLBX3beM=;
  b=Xu3f7zXtAShMThVx8H1nn7WGkP53K7mDknI9biB2KcT72Apfpn5mc5Yb
   xsxiakOzEQmynZmetroO8OigTNJVe/8eZu91+HvVAJThMWiy7jd96pDyY
   poQ0ew33QspUTCgX13jW5YN29FZCo8IL8WVn2QYUneXSrUyguyQn4jSDm
   koNZvKezWW0BvE+koCs8IFiSm4+PTezyUGDeFVVPqIGkEInjeqm2Vrtom
   14MuDCg6m5XFfKkMBcSOo3N8KJLrWZFPmVqLhGkB43j2aON1U276e6s4B
   ceu16/e1g7BzSPh8E0UcyiDhN4GB6sUeZp8stZJ2IAxfPVWDMJfM/Y7em
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="368075965"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="368075965"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 02:55:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="715126918"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="715126918"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 11 Jul 2023 02:55:58 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJA69-0004hX-1C;
	Tue, 11 Jul 2023 09:55:57 +0000
Date: Tue, 11 Jul 2023 17:54:58 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.5-rc1-esp32wifi 18/27] ld.lld: error:
 undefined symbol: process_test_capabilities
Message-ID: <202307111704.GiXFE9I4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.5-rc1-esp32wifi
head:   0e48757b20c9e813e7c330d76e0a6f895f0660d4
commit: 815e8f7022417a427120ea90318dc77108a02e21 [18/27] WIP: drivers/net/wireless/espressif: initial import
config: i386-randconfig-r016-20230710 (https://download.01.org/0day-ci/archive/20230711/202307111704.GiXFE9I4-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307111704.GiXFE9I4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307111704.GiXFE9I4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: process_test_capabilities
   >>> referenced by esp_spi.c:213 (drivers/net/wireless/espressif/esp_spi.c:213)
   >>>               drivers/net/wireless/espressif/esp_spi.o:(process_event_esp_bootup) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: process_fw_data
   >>> referenced by esp_spi.c:198 (drivers/net/wireless/espressif/esp_spi.c:198)
   >>>               drivers/net/wireless/espressif/esp_spi.o:(process_event_esp_bootup) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: esp_tx_resume
   >>> referenced by esp_spi.c:380 (drivers/net/wireless/espressif/esp_spi.c:380)
   >>>               drivers/net/wireless/espressif/esp_spi.o:(esp_spi_work) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: esp_alloc_skb
   >>> referenced by esp_spi.c:407 (drivers/net/wireless/espressif/esp_spi.c:407)
   >>>               drivers/net/wireless/espressif/esp_spi.o:(esp_spi_work) in archive vmlinux.a
   >>> referenced by esp_spi.c:413 (drivers/net/wireless/espressif/esp_spi.c:413)
   >>>               drivers/net/wireless/espressif/esp_spi.o:(esp_spi_work) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: esp_process_new_packet_intr
   >>> referenced by esp_spi.c:347 (drivers/net/wireless/espressif/esp_spi.c:347)
   >>>               drivers/net/wireless/espressif/esp_spi.o:(esp_spi_work) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: cfg80211_scan_done
   >>> referenced by esp_spi.c:268 (drivers/net/wireless/espressif/esp_spi.c:268)
   >>>               drivers/net/wireless/espressif/esp_spi.o:(process_event_esp_bootup) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: cfg80211_disconnected
   >>> referenced by esp_spi.c:272 (drivers/net/wireless/espressif/esp_spi.c:272)
   >>>               drivers/net/wireless/espressif/esp_spi.o:(process_event_esp_bootup) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: esp_remove_card
   >>> referenced by esp_spi.c:277 (drivers/net/wireless/espressif/esp_spi.c:277)
   >>>               drivers/net/wireless/espressif/esp_spi.o:(process_event_esp_bootup) in archive vmlinux.a
   >>> referenced by esp_spi.c:199 (drivers/net/wireless/espressif/esp_spi.c:199)
   >>>               drivers/net/wireless/espressif/esp_spi.o:(process_event_esp_bootup) in archive vmlinux.a
   >>> referenced by esp_spi.c:650 (drivers/net/wireless/espressif/esp_spi.c:650)
   >>>               drivers/net/wireless/espressif/esp_spi.o:(spi_exit) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: esp_add_card
   >>> referenced by esp_spi.c:284 (drivers/net/wireless/espressif/esp_spi.c:284)
   >>>               drivers/net/wireless/espressif/esp_spi.o:(process_event_esp_bootup) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: process_capabilities
   >>> referenced by esp_spi.c:288 (drivers/net/wireless/espressif/esp_spi.c:288)
   >>>               drivers/net/wireless/espressif/esp_spi.o:(process_event_esp_bootup) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: print_capabilities
   >>> referenced by esp_spi.c:289 (drivers/net/wireless/espressif/esp_spi.c:289)
   >>>               drivers/net/wireless/espressif/esp_spi.o:(process_event_esp_bootup) in archive vmlinux.a
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
