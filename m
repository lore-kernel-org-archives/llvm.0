Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456D99461;
	Sun, 16 Jul 2023 23:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689551856; x=1721087856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IbTNVDNVggbtftke/IwycO1oxcla0RvMotw0JMf4Tn8=;
  b=AAgsCTIdjw8D3qQecGT3R8KHx4X1Ey4TOoLt6jmD6EpQCB3g4uebudOK
   MahN2xTsv241fgjLZh0jXQCXhOOvIqZGC/GMwyi8Cb2wqi9LWnZPqMmbL
   tyT47O+jxrxjgccBVD2/Fs9ilVyz76GiVfUP+ziIMkUnUJZy3DK8jtjbz
   rX7wWTPeMVhoOTi0erOO0o+Y8q1WJ5DrhETz6rIvAvMznk7eGhNvBEc+x
   Opc9aU8RJnMGDGkGZIiU+icGo8N8xch5nyvbVpUZ3A/6yzTsxAk57kZBT
   48fHljcOeWIpG6ZcSLlxPbUZt9gvG+ARCBGC7sEAeKi1Sx98bsi4ffVuI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="345403353"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="345403353"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2023 16:57:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="788448685"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="788448685"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 16 Jul 2023 16:57:34 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLBcL-000948-13;
	Sun, 16 Jul 2023 23:57:33 +0000
Date: Mon, 17 Jul 2023 07:56:48 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Coelho <luciano.coelho@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-stable-rc:linux-5.4.y 4185/24028]
 drivers/net/wireless/intel/iwlwifi/fw/dbg.c:2484:6: warning: variable 'ret'
 set but not used
Message-ID: <202307170703.uHNfRi10-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Luca,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
head:   99c1cdbb2fc5f7815356ca11cd37dd1dd18c3ccd
commit: be8a3aecd21ae4769766ca6f1a88a1fbfbe2d148 [4185/24028] iwlwifi: dbg: don't abort if sending DBGC_SUSPEND_RESUME fails
config: x86_64-randconfig-x016-20230717 (https://download.01.org/0day-ci/archive/20230717/202307170703.uHNfRi10-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230717/202307170703.uHNfRi10-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307170703.uHNfRi10-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/intel/iwlwifi/fw/dbg.c:2484:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
           int ret = 0;
               ^
   1 warning generated.


vim +/ret +2484 drivers/net/wireless/intel/iwlwifi/fw/dbg.c

b721f5b1be18ae Shahar S Matityahu 2019-05-21  2479  
be8a3aecd21ae4 Luca Coelho        2020-03-06  2480  void iwl_fw_dbg_stop_restart_recording(struct iwl_fw_runtime *fwrt,
576058330f2d24 Shahar S Matityahu 2019-05-19  2481  				       struct iwl_fw_dbg_params *params,
576058330f2d24 Shahar S Matityahu 2019-05-19  2482  				       bool stop)
b721f5b1be18ae Shahar S Matityahu 2019-05-21  2483  {
576058330f2d24 Shahar S Matityahu 2019-05-19 @2484  	int ret = 0;

:::::: The code at line 2484 was first introduced by commit
:::::: 576058330f2d2403c93a66f48dfa98d90c6f7922 iwlwifi: dbg: support debug recording suspend resume command

:::::: TO: Shahar S Matityahu <shahar.s.matityahu@intel.com>
:::::: CC: Luca Coelho <luciano.coelho@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
