Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E367763A7;
	Sat, 25 Nov 2023 07:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cu3AjvnP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700897073; x=1732433073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D603gzO8KuMgQz+2EtM1quS3lvYHGWWRpgLXGDHXI4w=;
  b=cu3AjvnPqHZkaDPly+L+DEpoW15ng7oIlevBwayWK868EmDVglmDFKBu
   tb3IegdvE7aSwzv0RjUUe6Cru1AUcl3C3RAGeIDEHBZsH2INWvqCZxOsk
   kCyobH/1P7TtVP8sSUpERXcUPewqWg2sM/uFbESyvTC44f4itVD6YK6A/
   aLvg/O/zVt7BsSzsgdwj+u9r+HwFatUft9bpKMKlZcDQaCTS8wEK/WEnu
   F7cZd4wp/4BLdy28P6mH0xdeokUL09RIyo8FMzWx+JhJBAJt6witZXJ32
   +YpLPhpWlJr3Y2MG05HhyNIbA1/6eB6vUI/klIGbUOHAJm9eGoMeq7TRf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="377546086"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="377546086"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 23:24:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="941093724"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="941093724"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Nov 2023 23:24:31 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6n1g-0003j5-2I;
	Sat, 25 Nov 2023 07:24:28 +0000
Date: Sat, 25 Nov 2023 15:24:23 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/200-dcp 153/158] drivers/gpu/drm/apple/dcp.c:413:6:
 warning: no previous prototype for function 'dcp_sleep'
Message-ID: <202311251327.AMkqJvnN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   0d53d6a4e78b8c3cd7d1d99920dbc7196e52fe8f
commit: a9a37deb33077eed7a8b744481943e2a300b5273 [153/158] drm: apple: Disconnect dptx When the CRTC is powered down
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231125/202311251327.AMkqJvnN-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311251327.AMkqJvnN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311251327.AMkqJvnN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/apple/dcp.c:413:6: warning: no previous prototype for function 'dcp_sleep' [-Wmissing-prototypes]
     413 | void dcp_sleep(struct apple_dcp *dcp)
         |      ^
   drivers/gpu/drm/apple/dcp.c:413:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     413 | void dcp_sleep(struct apple_dcp *dcp)
         | ^
         | static 
   1 warning generated.


vim +/dcp_sleep +413 drivers/gpu/drm/apple/dcp.c

   411	
   412	
 > 413	void dcp_sleep(struct apple_dcp *dcp)
   414	{
   415		switch (dcp->fw_compat) {
   416		case DCP_FIRMWARE_V_12_3:
   417			iomfb_sleep_v12_3(dcp);
   418			break;
   419		case DCP_FIRMWARE_V_13_5:
   420			iomfb_sleep_v13_3(dcp);
   421			break;
   422		default:
   423			WARN_ONCE(true, "Unexpected firmware version: %u\n", dcp->fw_compat);
   424			break;
   425		}
   426	}
   427	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
