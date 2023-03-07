Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03B6366;
	Tue,  7 Mar 2023 05:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678168076; x=1709704076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CHCTHz6JZ6sjXAf8kfzA5PwFDWPUeKmzsv0ZP88jjks=;
  b=I2qeJ8o02XwbHM8k2VoOIHMNk6cQvX2zjbnGQa54//ybU9yNetFepNOz
   g9MqC6H2ZZBC/w/HorpAUXkv+b+FRJCPGh8/jvfgZHvWXHfK9/dVqkL6t
   0l6yH1mF2UQBEH4OHvCnHc9rdjS4NSrslK3niSMI2vuXrkdtIDPt2UCum
   3TQnrayWZtIE7AHQ3tPHbZ+PMHmcBn4At4QeuzXkFF0VEMeKW8qybjTg6
   UGqJprUqMtDupScw/oyYDEWUWAJ7ccLyQrh6wGwEozt7Ic0R7AtU1zey4
   nFfudLXvyTLxmHcqmHyLOhTsU8wBQMSswo7ElwEN/5lQOZvjecDKI1adA
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="422041746"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="422041746"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 21:47:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="800293860"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="800293860"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 Mar 2023 21:47:52 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZQAx-00010p-2b;
	Tue, 07 Mar 2023 05:47:51 +0000
Date: Tue, 7 Mar 2023 13:46:56 +0800
From: kernel test robot <lkp@intel.com>
To: Koby Elbaz <kelbaz@habana.ai>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Oded Gabbay <ogabbay@kernel.org>
Subject: [ogabbay:habanalabs-next-6.4 36/49]
 drivers/accel/habanalabs/gaudi2/gaudi2.c:7002:6: warning: no previous
 prototype for function 'gaudi2_is_device_idle'
Message-ID: <202303071320.X5ouBlNY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git habanalabs-next-6.4
head:   e174cf78642820ba623fd1786f6bfe9972732248
commit: d287ea1c6a9af606462612214a61b0bb9aeda10a [36/49] habanalabs/gaudi2: break is_idle function into per-engine sub-routines
config: x86_64-randconfig-a016-20230306 (https://download.01.org/0day-ci/archive/20230307/202303071320.X5ouBlNY-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git/commit/?id=d287ea1c6a9af606462612214a61b0bb9aeda10a
        git remote add ogabbay https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git
        git fetch --no-tags ogabbay habanalabs-next-6.4
        git checkout d287ea1c6a9af606462612214a61b0bb9aeda10a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/accel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303071320.X5ouBlNY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/accel/habanalabs/gaudi2/gaudi2.c:7002:6: warning: no previous prototype for function 'gaudi2_is_device_idle' [-Wmissing-prototypes]
   bool gaudi2_is_device_idle(struct hl_device *hdev, u64 *mask_arr, u8 mask_len,
        ^
   drivers/accel/habanalabs/gaudi2/gaudi2.c:7002:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool gaudi2_is_device_idle(struct hl_device *hdev, u64 *mask_arr, u8 mask_len,
   ^
   static 
   1 warning generated.


vim +/gaudi2_is_device_idle +7002 drivers/accel/habanalabs/gaudi2/gaudi2.c

  7001	
> 7002	bool gaudi2_is_device_idle(struct hl_device *hdev, u64 *mask_arr, u8 mask_len,
  7003						struct engines_data *e)
  7004	{
  7005		bool is_idle = true;
  7006	
  7007		is_idle &= gaudi2_get_edma_idle_status(hdev, mask_arr, mask_len, e);
  7008		is_idle &= gaudi2_get_pdma_idle_status(hdev, mask_arr, mask_len, e);
  7009		is_idle &= gaudi2_get_nic_idle_status(hdev, mask_arr, mask_len, e);
  7010		is_idle &= gaudi2_get_mme_idle_status(hdev, mask_arr, mask_len, e);
  7011		is_idle &= gaudi2_get_tpc_idle_status(hdev, mask_arr, mask_len, e);
  7012		is_idle &= gaudi2_get_decoder_idle_status(hdev, mask_arr, mask_len, e);
  7013		is_idle &= gaudi2_get_rotator_idle_status(hdev, mask_arr, mask_len, e);
  7014	
  7015		return is_idle;
  7016	}
  7017	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
