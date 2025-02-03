Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31CE194AEC;
	Mon,  3 Feb 2025 16:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738601816; cv=none; b=obGkfSlaehzqeJnwDU7q++D6FRjl/cfxPzi+XwNSM7sIdwWsj3n7JTOtzxOMMp9+XLYv6lS2xbOqb6kX4OeQKtRjxbL7fAlZBGDN2d5meMOmVLQia+9UZQeOTlinmjwuz/chkSv/EXiweLu/uj0FJ3sPsB1/1znOt/D60nkfKiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738601816; c=relaxed/simple;
	bh=RPGi+hi5oCiLkTSSKY2KV+BpdD7LCwIa9QElia2VBT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iCCeHHQNxczb0C97whAom6qJirUO7bK0R15zGAa6MDW/k70jtxxwIR3YqQG32pUaVvAPcqcZ0fd44YSEAHS5mQO7PRw8i7kkt8qp3HEotp9jbdZ/D0GBE6dUFzS7VfISwKG82ppZ+WmZfCUowP7endVQbCbZT9m3/IhSc48a7KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iMdxCv7b; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iMdxCv7b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738601815; x=1770137815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RPGi+hi5oCiLkTSSKY2KV+BpdD7LCwIa9QElia2VBT0=;
  b=iMdxCv7bnYYx6zmKr36JN8E2piVlrkgH+NmjJ4TfCIKe8k7ktcyTJh2b
   sZzP9rIBLrglBI18PQggO01jdVAQ6mdAdOIEVWEbmZP+zDWBfp9ZGRPNA
   dDAdwCz2lbT5odWaw4C4+wUkSZeFABrRdnLVBp6YaKasnw1nqxvETMDpy
   nlKXvf+OYYLYZ0TMs+n5dypN2+48DDtfw5wnhYdOT4xthjX8oF91+fAXk
   O8xsrcJiS5qSUBZLfuVYHtgz64hUpM2ddLVaUlYXy4tHf6LN2deZwybix
   TK7x7cqM5LEBMFW3NglTpllKY+QNEsTG3NIHtcp7igFCrJ4XwPnyrDMoY
   w==;
X-CSE-ConnectionGUID: HoDOLJ09R/iyQ7UcqvVfyA==
X-CSE-MsgGUID: jodSq6JfSsi+hCIGu284eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="49707283"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="49707283"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 08:56:54 -0800
X-CSE-ConnectionGUID: rwTJZFdWTh+Rt8EfmxvyfA==
X-CSE-MsgGUID: V19IV0oeQfiF67jMx/j9cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147547222"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Feb 2025 08:56:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tezkg-000rD9-2U;
	Mon, 03 Feb 2025 16:56:50 +0000
Date: Tue, 4 Feb 2025 00:56:35 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.13-esp32 35/53]
 drivers/misc/esp32-ipc.c:228:34: warning: unused variable 'esp32_ipc_match'
Message-ID: <202502040003.WRLTz6Ya-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Max,

First bad commit (maybe != root cause):

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.13-esp32
head:   f4a6cef2509c4e81637b6d5d6f0c27966895985a
commit: 08b8a525de25b35564cb9ae5f7b5ad1122a84fed [35/53] esp_wifi: add IPC transport
config: mips-jazz_defconfig (https://download.01.org/0day-ci/archive/20250204/202502040003.WRLTz6Ya-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502040003.WRLTz6Ya-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040003.WRLTz6Ya-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/esp32-ipc.c:228:34: warning: unused variable 'esp32_ipc_match' [-Wunused-const-variable]
     228 | static const struct of_device_id esp32_ipc_match[] = {
         |                                  ^~~~~~~~~~~~~~~
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ESP32_IPC
   Depends on [n]: OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - ESP32_WIFI_SHMEM [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ESPRESSIF [=y]


vim +/esp32_ipc_match +228 drivers/misc/esp32-ipc.c

ff5d67ac76ee59 Max Filippov 2023-08-11  227  
ff5d67ac76ee59 Max Filippov 2023-08-11 @228  static const struct of_device_id esp32_ipc_match[] = {
ff5d67ac76ee59 Max Filippov 2023-08-11  229  	{
ff5d67ac76ee59 Max Filippov 2023-08-11  230  		.compatible = "esp,esp32-ipc",
ff5d67ac76ee59 Max Filippov 2023-08-11  231  	}, {},
ff5d67ac76ee59 Max Filippov 2023-08-11  232  };
ff5d67ac76ee59 Max Filippov 2023-08-11  233  MODULE_DEVICE_TABLE(of, esp32_ipc_match);
ff5d67ac76ee59 Max Filippov 2023-08-11  234  

:::::: The code at line 228 was first introduced by commit
:::::: ff5d67ac76ee59b6351fd6f70df8d0178ef4f72a misc/esp32-ipc: introduce generic IPC for ESP32

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Max Filippov <jcmvbkbc@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
