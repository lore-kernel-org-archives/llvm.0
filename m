Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43151A00CF;
	Thu,  5 Sep 2024 15:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725549012; cv=none; b=cSRCcCdQldPsnuN8bURhqciUYXc69IKfXs7iZssr1pKQyj9WCcTVjUCXctD3ZuZB5sWDc8DctRgMt84FcYLOj8Kr5cNj6bRBHTlgYc/PKE8jnD5jtZQleBFTg4KzGon49Pr1rx3u8yWHDaHfEh/blPeU1U5LMBb/ZLG72UbZ9RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725549012; c=relaxed/simple;
	bh=+B9AVG0IskDOSjaCDJfK/llhKs1Qjy/sxXaIz3HYjiA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lw3EQeKPw0uhDrkpc0sISaexNvgQzaZyTRApoEgqUNDmNFynaPhJomrfN/om/5EONvQGhqxUJoK9QiEwD3Y1xtlNRPZUW/xBsVEWsJeBAqOTS+aherVNBGGaw5JD9uHLAWZz6kapV3OhITkIV4ChZJEkjRQrmQGFARh2hc88CdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f3Yf3nvU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f3Yf3nvU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725549009; x=1757085009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+B9AVG0IskDOSjaCDJfK/llhKs1Qjy/sxXaIz3HYjiA=;
  b=f3Yf3nvUI8wnkNJOawGCRKPlMFffmL8i1hnbWhS3wSJtmHDLnCxHUQVY
   HBkH9EnPaQZVWe4oFiGihBVM7LlTQpVvVGpebAm98GC6HcCJi7jhb9ZsL
   MBCjKUiLM9RsrF+ik+luGQZwLTyvxxnT9EAs7Ook48oVymVtfom11Ovr9
   hzvvpJ8gkCJZeu26m3NTC2lxpY/tLyRjSOMPBY+d4Mwf/IX5QgyKKLnaz
   nYDo/fyScpuYdEOGswidbWayocsPVr8t+sEYHZ5EpzkZxwIVjl89uzraC
   NFOgIfCCG3EGUX0K60ty1whGaMqEKp5d6klswPTcoIxkpB/1yIp9Gjhhb
   Q==;
X-CSE-ConnectionGUID: szfqnl7sTw2uEZjXsPaPuA==
X-CSE-MsgGUID: D9AkVi2qT3mTPcQHDRIvLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="27200310"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="27200310"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 08:10:09 -0700
X-CSE-ConnectionGUID: 4I/UuM26SZCGlGovjx+LIA==
X-CSE-MsgGUID: SRLCETK+SJa1ZNjfLLlHVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="65311745"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Sep 2024 08:10:08 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smE7a-000A1b-1f;
	Thu, 05 Sep 2024 15:10:06 +0000
Date: Thu, 5 Sep 2024 23:09:39 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.11-rc6-esp32 35/53]
 drivers/misc/esp32-ipc.c:228:34: warning: unused variable 'esp32_ipc_match'
Message-ID: <202409052325.VBYpXKyZ-lkp@intel.com>
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

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.11-rc6-esp32
head:   4a9ffb44ce4c24e9dcd4a5f06beeb3dded85319a
commit: de5a96ec7f9b35d9493bc022d16cd1a03ff73798 [35/53] esp_wifi: add IPC transport
config: i386-defconfig (https://download.01.org/0day-ci/archive/20240905/202409052325.VBYpXKyZ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240905/202409052325.VBYpXKyZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409052325.VBYpXKyZ-lkp@intel.com/

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

9aee3c117c9d9b Max Filippov 2023-08-11  227  
9aee3c117c9d9b Max Filippov 2023-08-11 @228  static const struct of_device_id esp32_ipc_match[] = {
9aee3c117c9d9b Max Filippov 2023-08-11  229  	{
9aee3c117c9d9b Max Filippov 2023-08-11  230  		.compatible = "esp,esp32-ipc",
9aee3c117c9d9b Max Filippov 2023-08-11  231  	}, {},
9aee3c117c9d9b Max Filippov 2023-08-11  232  };
9aee3c117c9d9b Max Filippov 2023-08-11  233  MODULE_DEVICE_TABLE(of, esp32_ipc_match);
9aee3c117c9d9b Max Filippov 2023-08-11  234  

:::::: The code at line 228 was first introduced by commit
:::::: 9aee3c117c9d9b9481c339d9ac7b47e6c949bdac misc/esp32-ipc: introduce generic IPC for ESP32

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Max Filippov <jcmvbkbc@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
