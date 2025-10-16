Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96573314B6;
	Thu, 16 Oct 2025 12:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760619164; cv=none; b=mdlrgq78NZ3w5MyQS/zVwgrPbHhDoc0uGzvizAfOo4pZYD1b4klfNu/wOODHuscEXkiGWRIErMu6KntFY3GR8G1Jh7+akfPpGTVPU+4/KoHPqY35VJlhmrAzVBpJC+f1mMf9kgASn2k/UyPi98zFCEcmbDxcrruL4316S8cBpx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760619164; c=relaxed/simple;
	bh=erPlD3QKhuGF+IPlXHF/p3Vqogb9ErA7n4F1s3blZ5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s/X8OeEVQciCR7irtnB/MqWzRG3ZHfhji0KtueyHYKr6Ek3XuwxYldG2Fx1i/H2PWygolaObFgGj5xKjJd2g/FDH6XMfw4i26ALTbuWNz3zNT+gPTjPsExvtcMISUNLv25NtHnRrSEcwCtIxrna4GGFcpgR17KmtAapldb2aIV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d7R2IJor; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d7R2IJor"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760619163; x=1792155163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=erPlD3QKhuGF+IPlXHF/p3Vqogb9ErA7n4F1s3blZ5Q=;
  b=d7R2IJorTnHOse8hcOzhnsuCgN091Dk71BBUPPVyBFLV91pZqMIVlv2w
   lXvC8buL3skesEGDwMC10GFQasIV1rEwNo1L61gbgsvRbWv6qb1+CUh6g
   JehgN44aY1wAj9Pwujda3Irmvr8wx1vzn0pvrA2anWrrt4fPOJUNqc9oY
   kh7PhIUQQFWR6HjOLeFdd7vV+oe2j+icH7j0KWlm8BfFvBlNnwq67m1Ii
   rz/TStPjGNqLrG/NpxsLZgq1SSXY4F51oyEMBWUrNaHFAPiWGIQ9wWDr5
   +th66w2lvnvEwULDEkIHo383maYGQp0QDiTzJDSmrJQ9LYCxPCjLMAmZZ
   Q==;
X-CSE-ConnectionGUID: b3dvIHWzQUSU8EhU67daAw==
X-CSE-MsgGUID: B4I5pH60QvK9xmlHYIrQKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62708348"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="62708348"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 05:52:42 -0700
X-CSE-ConnectionGUID: ICuD30L/SreBwhOTzdMbAw==
X-CSE-MsgGUID: +KvsWoiqRX6fVi3YpwQSNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="213405673"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 16 Oct 2025 05:52:41 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9NT6-0004p3-0v;
	Thu, 16 Oct 2025 12:52:33 +0000
Date: Thu, 16 Oct 2025 20:51:52 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: [sudeep-holla:acpi_scmi_telemetry 7/15]
 drivers/firmware/arm_scmi/scmi_system_telemetry.c:1179:16: error: use of
 undeclared identifier 'generic_delete_inode'
Message-ID: <202510162057.WN9dTbHq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git acpi_scmi_telemetry
head:   872204541d0c298cab365d5dcd343d9cdb749d31
commit: 6440298ac987ad74689901af6c2009b3621a2591 [7/15] firmware: arm_scmi: Add System Telemetry driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251016/202510162057.WN9dTbHq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510162057.WN9dTbHq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510162057.WN9dTbHq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/arm_scmi/scmi_system_telemetry.c:1179:16: error: use of undeclared identifier 'generic_delete_inode'
    1179 |         .drop_inode = generic_delete_inode,
         |                       ^
   drivers/firmware/arm_scmi/scmi_system_telemetry.c:1307:9: error: call to undeclared function 'mount_nodev'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1307 |         return mount_nodev(fs_type, flags, data, tlm_fill_super);
         |                ^
   drivers/firmware/arm_scmi/scmi_system_telemetry.c:1307:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct dentry *' [-Wint-conversion]
    1307 |         return mount_nodev(fs_type, flags, data, tlm_fill_super);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +/generic_delete_inode +1179 drivers/firmware/arm_scmi/scmi_system_telemetry.c

  1176	
  1177	static const struct super_operations tlm_sops = {
  1178		.statfs = simple_statfs,
> 1179		.drop_inode = generic_delete_inode,
  1180	};
  1181	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
