Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12F0134AC;
	Tue,  5 Nov 2024 08:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730794342; cv=none; b=YMActa3U2ouPMHFwn+W4yXeV4b4utnnFhCWNK8KMRrZ+qa7a7mSLPhWWKS7sdZtKPSL7oKhcW8Wxxv3CwBe2dV692yCYlChstAvB/KQKu+cHSyFFrjW3Kbxuf6BbvW34R5j5chaYG5SuzcSjbmxLuLRFL35svGyn7PxSb/kA90w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730794342; c=relaxed/simple;
	bh=HKAjDyXM2GrNoXrtld9WY5ntqn/2SJfMf+z1FubmwGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HGk5HcNmKqO4/hf82xzVu0J59FeKwAsmQ25q5PWpwUenFwz8UDQ3ghjH4RcrFn4/1kS8wZJWRGDfMS+wjpeJwwSSsyGbhwMrenY0IKiNPfehQr+fRCKDoAmjOqKLwFTcMJDHmVQdRUU+BxHUX5MZTBS0rOQJDKl1F0KaZqQbHBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xp3klXsT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xp3klXsT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730794340; x=1762330340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HKAjDyXM2GrNoXrtld9WY5ntqn/2SJfMf+z1FubmwGU=;
  b=Xp3klXsTKUtdGdpLGd26FD1gmOv0A3d8SwXgtBZf2GJTlxJKiPJgYT81
   D3nAl4tvErln6Rp+lie4i3OByrY7NmRtBrwYGI0U2XJ1Dx1wuV8OLhsf6
   7GzR/OFt06HRm6h4jDT92SMdXFfhrBRcTFI/pScJrtA9UkjrgqVG2kUpi
   tqverodjZXp19NDiXKmNs+CZGKU9ttQ6fz1uu3CigHCLa9R+fPGAEUXdi
   7NKTkJ1ZgKl76OfAVrhlWgVAOZciaO0KcpEDdpLAb0906LrLKPNCJJqbf
   NRPwIaJW7CGmg4Vuyf9i8NkIWUtStx6YBzHmtzD46oBu2iPAW5sCMy9Y6
   w==;
X-CSE-ConnectionGUID: mYM40YuPQmGDc5xE+ajo8Q==
X-CSE-MsgGUID: nmFhMnrTQSGnk+VMXpjXiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30748927"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="30748927"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 00:12:16 -0800
X-CSE-ConnectionGUID: VdSOAGRbSR6cX6oZIVisSw==
X-CSE-MsgGUID: DsQnjz5PQQCelpZ7tPALYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="114715892"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Nov 2024 00:12:14 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8Efc-000lnz-1s;
	Tue, 05 Nov 2024 08:12:12 +0000
Date: Tue, 5 Nov 2024 16:11:36 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/ibt 10/11]
 arch/x86/um/../kernel/module.c:undefined reference to
 `apply_direct_call_offset'
Message-ID: <202411051639.jC1CC22C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/ibt
head:   62e8598e1d31c62fc827b23173786c9a5a525fb0
commit: f8c0cdd341a8c29884b35532fd9638a2b320b286 [10/11] x86/ibt: Implement IBT+
config: um-x86_64_defconfig (https://download.01.org/0day-ci/archive/20241105/202411051639.jC1CC22C-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411051639.jC1CC22C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411051639.jC1CC22C-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/bin/ld: arch/x86/kernel/module.o: in function `module_finalize':
>> arch/x86/um/../kernel/module.c:(.text+0x4bd): undefined reference to `apply_direct_call_offset'
   clang-15: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
