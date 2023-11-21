Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0769584CC;
	Tue, 21 Nov 2023 21:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SGviCvAK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700602065; x=1732138065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aErFLE5NRGJiThILQEDiUIBkEQRBIqvv5llIdQo0VWw=;
  b=SGviCvAKFFfeHc5TwgW2TsqBEWSKkf5eUAF60BMyqbKkADyMHbaD86U4
   dIM99RLLGwi3mqW3+nIpYk5V4nmoYpqHkLkKT1Pl7rrGe7h0lD9M4dcsA
   8cjpe8xM1YiFyem6mtigePVBGd19YbGuT28SiU5gQ8sj3k7/v/eFLay7p
   A67zQKWOlO8VcT1+hSbeXwBmeI0YMGphzo9W8IiL2UOYzOEDkhH1tsdQf
   lupJEp2rl7WqZY166i47Cl6NmX/moo8vTMyzPSKQzeddQUcuIdZU+zZx/
   UuKawrwBksPnhbIBneurWFIUwXcw1q2hG5JI1EOU5eSFlmcJbDOcFvOr+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="390788284"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="390788284"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 13:27:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="857442535"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="857442535"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Nov 2023 13:27:44 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5YHV-0008HJ-2Y;
	Tue, 21 Nov 2023 21:27:41 +0000
Date: Wed, 22 Nov 2023 05:27:13 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/200-dcp 95/145]
 drivers/gpu/drm/apple/iomfb.c:221:6: warning: no previous prototype for
 function 'dcp_sleep'
Message-ID: <202311220556.u1bKa9r1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   e3a82f03cd81edb4608ab6dde0e073ac91e2fdb8
commit: 4508d91b634778cc472055cdbc9032d7a57dc530 [95/145] drm/apple: Add support for the macOS 13.2 DCP firmware
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231122/202311220556.u1bKa9r1-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311220556.u1bKa9r1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311220556.u1bKa9r1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/apple/iomfb.c:221:6: warning: no previous prototype for function 'dcp_sleep' [-Wmissing-prototypes]
     221 | void dcp_sleep(struct apple_dcp *dcp)
         |      ^
   drivers/gpu/drm/apple/iomfb.c:221:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     221 | void dcp_sleep(struct apple_dcp *dcp)
         | ^
         | static 
>> drivers/gpu/drm/apple/iomfb.c:518:6: warning: no previous prototype for function 'iomfb_start' [-Wmissing-prototypes]
     518 | void iomfb_start(struct apple_dcp *dcp)
         |      ^
   drivers/gpu/drm/apple/iomfb.c:518:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     518 | void iomfb_start(struct apple_dcp *dcp)
         | ^
         | static 
   2 warnings generated.


vim +/dcp_sleep +221 drivers/gpu/drm/apple/iomfb.c

   220	
 > 221	void dcp_sleep(struct apple_dcp *dcp)
   222	{
   223		switch (dcp->fw_compat) {
   224		case DCP_FIRMWARE_V_12_3:
   225			iomfb_sleep_v12_3(dcp);
   226			break;
   227		case DCP_FIRMWARE_V_13_2:
   228			iomfb_sleep_v13_2(dcp);
   229			break;
   230		default:
   231			WARN_ONCE(true, "Unexpected firmware version: %u\n", dcp->fw_compat);
   232			break;
   233		}
   234	}
   235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
