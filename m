Received: from mgamail.intel.com (unknown [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C35433E5;
	Wed,  2 Aug 2023 14:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690987995; x=1722523995;
  h=date:from:cc:subject:message-id:mime-version;
  bh=FClSdxZNNmpvfaeq92g0GFkLKXHLAI2gIkAy452PPy4=;
  b=kXINuLTleu2G8fqLnsA0kEdGscdDb8YPyzl957a3qCO0Ih7JzzV86aRk
   K640Wvh+y3LP9iGlz6cBfJ53k2YapuAmSOwx6YYzrNXCRAZX2wMpnDd2O
   o9gvdr03nSnAqHfZ1TMHiEjrBkVbo9Pkjrjx/XsCOorMtykmjWbxlIDa8
   BpE2ZKYp2ReVXOsEpqVXeIk1En+eZJlUipIKu8Hfzva7Jj7nVu7KibMZi
   ZeyIEsdFDG+EkLUs/899NB+B0UCGk8s3iI59LPs6mUXWvG7P5HgOTYSHD
   ycax6oYgyLEcx3cV+U5rPDFG/5G0F7ejSUGl7+HFJO+k8k9kqpkzL7FLC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="349908334"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="349908334"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 07:53:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="679089860"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="679089860"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Aug 2023 07:53:06 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRDDl-0001HD-31;
	Wed, 02 Aug 2023 14:53:05 +0000
Date: Wed, 2 Aug 2023 22:52:35 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [wireless:main 17/17] ld.lld: error:
 vmlinux.a(drivers/scsi/libsas/sas_scsi_host.o):(function sas_queuecommand:
 .text+0x3a): relocation R_RISCV_HI20 out of range: 536192 is not in
 [-524288, 524287]; references '.LCPI0_0'
Message-ID: <202308022234.iOZXAox2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: Johannes Berg <johannes@sipsolutions.net>
CC: Kalle Valo <kvalo@kernel.org>
CC: linux-wireless@vger.kernel.org
TO: Hans de Goede <hdegoede@redhat.com>
CC: Kalle Valo <kvalo@kernel.org>
CC: Kees Cook <keescook@chromium.org>
CC: Franky Lin <franky.lin@broadcom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git main
head:   16e455a465fca91907af0108f3d013150386df30
commit: 16e455a465fca91907af0108f3d013150386df30 [17/17] wifi: brcmfmac: Fix field-spanning write in brcmf_scan_params_v2_to_v1()
config: riscv-randconfig-r022-20230731 (https://download.01.org/0day-ci/archive/20230802/202308022234.iOZXAox2-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308022234.iOZXAox2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308022234.iOZXAox2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(drivers/scsi/libsas/sas_scsi_host.o):(function sas_queuecommand: .text+0x3a): relocation R_RISCV_HI20 out of range: 536192 is not in [-524288, 524287]; references '.LCPI0_0'
   >>> referenced by libsas.h:412 (include/scsi/libsas.h:412)
   >>> defined in vmlinux.a(drivers/scsi/libsas/sas_scsi_host.o)
--
>> ld.lld: error: vmlinux.a(drivers/scsi/libsas/sas_scsi_host.o):(function sas_queuecommand: .text+0xe2): relocation R_RISCV_HI20 out of range: 526341 is not in [-524288, 524287]; references 'sas_scsi_task_done'
   >>> referenced by sas_scsi_host.c:169 (drivers/scsi/libsas/sas_scsi_host.c:169)
   >>> defined in vmlinux.a(drivers/scsi/libsas/sas_scsi_host.o)
--
>> ld.lld: error: vmlinux.a(drivers/scsi/libsas/sas_scsi_host.o):(function sas_queuecommand: .text+0x104): relocation R_RISCV_HI20 out of range: 536068 is not in [-524288, 524287]; references 'sas_queuecommand.__UNIQUE_ID_ddebug320'
   >>> referenced by sas_scsi_host.c:169 (drivers/scsi/libsas/sas_scsi_host.c:169)
   >>> defined in vmlinux.a(drivers/scsi/libsas/sas_scsi_host.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
