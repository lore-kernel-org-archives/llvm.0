Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982061F8F0E;
	Fri, 11 Oct 2024 05:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728625322; cv=none; b=kBxaArIHMsji+6D8Dxh+UzOpusxdA+9Fg8z3w/NOlJZOuMnGm/HzeUFoMCiMtMG22jLm5rI9uk6t3p/i/oZVSjcQTR8dXfVEQPQgQs4cdARTox8mpYBjlVPfqGbmbbTSpQT2GrEQ0/dLMDNeMTAmDEiT/N8vmO3MM1+ftwHw0c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728625322; c=relaxed/simple;
	bh=1GnuJPx7TmfpbxrwXtxrx0oK5n9HSkMkpXKcS4JG84s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MuODRmURVq9YrW48vxT45/3sXzXdDlsl2kftE0yF7HAknd0zeIMzuNkWHt6qvscD6zUD0BC7HL5We4+3xJdWV/EfPMcBa4FQoK4Wm0MfV8Xx4Tlp30KCeo4Ma0MgMOA593SXDgC/vCy4XjwDMA5BEyhdMj+wipGdbua9+SNaa9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UbbiDFRY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UbbiDFRY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728625320; x=1760161320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1GnuJPx7TmfpbxrwXtxrx0oK5n9HSkMkpXKcS4JG84s=;
  b=UbbiDFRYDRlBect3DtTOAApM6YgOwVxvhjw6oFLJVjRg6spsTlPcuX3T
   HEqCfjw/y2SybKCULveKr31RGIDas1/sM3jJDtu6VZz1Om897SC5bFWsG
   I5qMIiRIoT3UPkzjagYOV2cPgSNS8D1VM2w4qxVIEuNzABJ9RViZZMb6x
   Ml1wyVeoIEp6qpnAOjWSFpjbRaShsBc4DsKYynErOv6KyAqvnPO0ToJs8
   SzT0IR4uAwehzdsjn7kUe7BUDl3mN1d92D78A4hPdJupHmP46TaZP4Bx5
   Y746AzD3wd2lbRKbElV+LUsDwzguX2bOqm7Tg7udJ0TZht3HlJaM3K1ld
   g==;
X-CSE-ConnectionGUID: 8dCkN0KBS2+eXjA54XGt+w==
X-CSE-MsgGUID: Cw12VBBhQviajL1ahaTwOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="27483137"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="27483137"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 22:41:58 -0700
X-CSE-ConnectionGUID: lAxIf9tOT3mdnBpNW4D1VA==
X-CSE-MsgGUID: DsHMejMCRq+zDpkXa4rBOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="107544877"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Oct 2024 22:41:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sz8PT-000BsS-19;
	Fri, 11 Oct 2024 05:41:55 +0000
Date: Fri, 11 Oct 2024 13:41:00 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vincent-guittot:scmi/ffa-transport 1/1] ld.lld: error: undefined
 symbol: tee_shm_get_va
Message-ID: <202410111342.xleqPExp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.linaro.org/people/vincent.guittot/kernel.git scmi/ffa-transport
head:   d613a19181fee0ca12b6b5a9dff302c1207a2e15
commit: d613a19181fee0ca12b6b5a9dff302c1207a2e15 [1/1] scmi/ffa: add a new scmi transport layer based on ffa
config: arm64-randconfig-003-20241011 (https://download.01.org/0day-ci/archive/20241011/202410111342.xleqPExp-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410111342.xleqPExp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410111342.xleqPExp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: tee_shm_get_va
   >>> referenced by ffa.c:302 (drivers/firmware/arm_scmi/transports/ffa.c:302)
   >>>               drivers/firmware/arm_scmi/transports/ffa.o:(scmi_ffa_chan_setup) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
