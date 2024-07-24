Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11931448EF;
	Wed, 24 Jul 2024 23:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721864745; cv=none; b=Sy1jpSdMWgAdNNDbVeYvtoUoVGt07um7eGKSMHS+oZH9Lfycy5RqQ9z/4AjweVC8NJO90dOEKaBLzjET+BvHG03XIemoDgbYpuqouq4oYuXkoC+x6mNntPg37sX+eMv0fqahoI8wBzXgddvJzm6fBuxbIZbi/8krM9uUqdrh/Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721864745; c=relaxed/simple;
	bh=gFjRmchMccwdynziRK+43PvXB+HMH5CRWDi3x4ykouo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K/IoX2Aliy6QWwjUtS0Ncuu30yA1iIaZ/yUR5aOWMDaV5GKEyF4LZALYKRfaUE755RCTCiue2jtaimU73mtirpXJMzQXztd/l/sdov5w3A4maQDU6+Y1MptN3SyXppDeODPk7NP3mKaVN4zZ6FUcN3FidFC2gzQTNIoTiQqUHrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VCPRrf0s; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VCPRrf0s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721864744; x=1753400744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gFjRmchMccwdynziRK+43PvXB+HMH5CRWDi3x4ykouo=;
  b=VCPRrf0sko2NPLc2C2U/tB2cbk/eWqE6I+BozBnNqnAi5+GD5jo1WETo
   gbFRyXON7wQlok3KVod8BANz94UG57Awyl6FKNFqPba2562RSIGaVBsxw
   My030fXpL9P54OiogQqQnXIb2iqj1BWHNfnsBbQNuzGRbVRysIYX880ms
   BuV5XF+1jgfsdxApM4vcoI+rAxzeKTBucVFSFrlWc9kSptdwfspUSpwuF
   XCmh7abH8jmnBL2TjXIffApGCtk0cJIP00BycvvVsWI5SKTBgNYF9znhx
   A4IeS3yYpI7QzY/KzuKxlgGNbd1wHxMl6zcN6qQeXK2XsscuBTWzjPtcn
   A==;
X-CSE-ConnectionGUID: dw1WlKQ2Qhq726NcmCjIwA==
X-CSE-MsgGUID: 2VxYfxuMRXG5p+5LEWr7Kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="23336740"
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; 
   d="scan'208";a="23336740"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 16:45:43 -0700
X-CSE-ConnectionGUID: f+SNmL4YTcCJvAGvUl4Acw==
X-CSE-MsgGUID: e7feWLPHRou16Ok1LiyNIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; 
   d="scan'208";a="52812776"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Jul 2024 16:45:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWlfv-000nYY-1Q;
	Wed, 24 Jul 2024 23:45:39 +0000
Date: Thu, 25 Jul 2024 07:45:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [riteshharjani:kfence-fix-wip6 8/10] WARNING: modpost: vmlinux:
 section mismatch in reference: htab_bolt_mapping+0x6fc (section: .text) ->
 hash_linear_map_add_slot (section: .init.text)
Message-ID: <202407250732.GsB8DOnk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/riteshharjani/linux kfence-fix-wip6
head:   232bab42e9b7dd1051658608c6ee254ee53cf09e
commit: ecfb8c417508371572ee090210e62416a6232b11 [8/10] kfence enable
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240725/202407250732.GsB8DOnk-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240725/202407250732.GsB8DOnk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407250732.GsB8DOnk-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
>> WARNING: modpost: vmlinux: section mismatch in reference: htab_bolt_mapping+0x6fc (section: .text) -> hash_linear_map_add_slot (section: .init.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_bpf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ubsan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_keys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_key_base.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_kmod.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_blackhole_dev.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_objpool.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib_crypt_ccmp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib_crypt_tkip.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib_crypt_wep.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/configfs/configfs_sample.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/bytestream-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/dma-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/inttype-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/record-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kprobes/kprobe_example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kprobes/kretprobe_example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kmemleak/kmemleak-test.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
