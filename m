Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7861325228C;
	Tue, 10 Feb 2026 06:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770703588; cv=none; b=J2If5cKB240ZVjXY1Zwqp0t9OwvQPvRT3kfz1QGdbPPFklhUy6PcRP9hakdHxq/uRwyUbd7E0TdRfb3LfKWGofJ+YUN7M+hMtj6XhrHTPcsYxoQ9nJYag0RGdRArminSj+W5G+I9Srl163ZHXAHxyJyz1OL40mGpwEoFTWE+D0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770703588; c=relaxed/simple;
	bh=ef2LDxOjUzRKR/fbMQbt1nYZbXEMxb334xYIsanvJPI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ppIOp7r9NBTh6t+MjsuzWhHS5zMoGg8MGDIszSVnOggx/lwVi80k5qGys31aszbYYLcy4A1xHxKcKod03xNqYjzGFD/eL61lUTlRIlPjCegQF/taoMc06H2OcqSrgmtmvsCw6Fi5GlPSMDkl+ukMdp2CxicSXTHs2JzLhAQvIZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M4IJwbKU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M4IJwbKU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770703587; x=1802239587;
  h=date:from:to:cc:subject:message-id;
  bh=ef2LDxOjUzRKR/fbMQbt1nYZbXEMxb334xYIsanvJPI=;
  b=M4IJwbKUHDav+nPCtNmFTTTPkTsR2pOs4yxfdaJSD9ZiduxvOa8hJDLt
   PVXjSqp2BYLQPYfZ4c9XBOvXESoqOGik6eQ9bM/rP0Fn54KNjpljoCBi0
   YpVob/nqCcurcX120Jiuw6iQqU2/8NaKyx7dLVgO6QeQsJ6B79J43Aggz
   n1lcEK9mICawCNEU5hRgq0tFIAZjX4br6mRvcWezm0OjHH9IS6Mc+5EgG
   ZbUXxqk0RBWXQmumgsSetMDKWYrUXbllrYj1squpNe5cl7Sg8iREB1dn2
   eMNlOo5C21VbtC1ANgjkC8ZGrMz3q2r9L8vsVQewU2fnh60KxV1YuLuCI
   g==;
X-CSE-ConnectionGUID: t4K8LmRNRbWQ1D3A3DsVsQ==
X-CSE-MsgGUID: ecJr0Z70RpiDzRXGfw4lrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71034201"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71034201"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 22:06:27 -0800
X-CSE-ConnectionGUID: YteFzgtjQz6r1aUCXKck3A==
X-CSE-MsgGUID: ciZuzSvuRTG9jjYp1p6DaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="234772379"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Feb 2026 22:06:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpgtC-00000000oho-3Ybq;
	Tue, 10 Feb 2026 06:06:22 +0000
Date: Tue, 10 Feb 2026 14:05:33 +0800
From: kernel test robot <lkp@intel.com>
To: Ross Philipson <ross.philipson@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Ard Biesheuvel <ardb@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [ardb:x86-slaunch 32/41] include/linux/slaunch.h:12:10:
 fatal error: 'asm/txt.h' file not found
Message-ID: <202602101319.ajx2z2BV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-slaunch
head:   68d6a808368b02c2fdfa0ba1e4e59d6b97668c1a
commit: c6eaa811aa41c3de29b05dce1fadad2533e459f2 [32/41] kexec: Secure Launch kexec SEXIT support
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260210/202602101319.ajx2z2BV-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101319.ajx2z2BV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101319.ajx2z2BV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/kexec_core.c:44:
>> include/linux/slaunch.h:12:10: fatal error: 'asm/txt.h' file not found
   #include <asm/txt.h>
            ^~~~~~~~~~~
   1 error generated.


vim +12 include/linux/slaunch.h

1877aef65de484 Ross Philipson 2025-12-15  11  
1877aef65de484 Ross Philipson 2025-12-15 @12  #include <asm/txt.h>
1877aef65de484 Ross Philipson 2025-12-15  13  

:::::: The code at line 12 was first introduced by commit
:::::: 1877aef65de484a2f9f9e51efc35e661c16360f8 x86: Secure Launch main header file

:::::: TO: Ross Philipson <ross.philipson@oracle.com>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
