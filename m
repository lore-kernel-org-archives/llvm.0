Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282063C39;
	Wed, 10 Jul 2024 10:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720609048; cv=none; b=dHAMBDDXh/mGq7EZG4kklHa3/inmSpYYuN8hgu1O3aE8c5TeurKbtJmnhpyx7tdcZaZXonVlOKkWvNHyYJMwSrC3MlEwRxOIvTV0NOsY/t7vw8b9aUqO2BX2jcO4XVpbjOhQDZ6rFNS+oaYX2ajyCYM3wVXxB7HrzQY4NYeUOcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720609048; c=relaxed/simple;
	bh=LDGIPCnHHAUndKww8JYha1a2JOIB2O3zNj/J1SvhgqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YrsWNME/RiR9D/17CK4jPYR/qjD7/Z7bd1ZDJ09dby4gvj8yFGRgrg9RDGVFnzrDfHx+8kgjXiNs8hULulD9nSpdUIUtsV2d4QEPv4ys2fUviu4VX2jJqsIwrSVl/u+nAttrPSy2cDN9z3Ij0jWRm0CPx/D1/7OWJPRIYyGsKt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IbQC4EGS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IbQC4EGS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720609047; x=1752145047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LDGIPCnHHAUndKww8JYha1a2JOIB2O3zNj/J1SvhgqQ=;
  b=IbQC4EGSiNK4YTbmtQzdhjPyIH/VSmBiLXrZgYR5PEUQ5/ywWWlZRq9M
   1Fk4nnYlw3wzdoS7BxnZAfD0Ywx/YnCkzjJH3zW3yY0u3lH4sfTA7N9YH
   dpjS6wG4/7Yj8x4IfwR3busKf0xjDtPXX9t2XSP7d1TgMzC5+QRcqR8f2
   LoCVAsLhplW+2G+rZtu+gc3VFRosTMdiYCJATRTpZVysfEI+1yJhXNOVq
   pnpBjE+M0Ao92DtHDHIVC4/zIMTJKIAheKWyppkfmp6JI45s+b21MrMxE
   DEy7vlJZPFsZsJyUKufBc467EcXIqI3PLqOgy1KJ56NCftjhBsGpQjbUX
   Q==;
X-CSE-ConnectionGUID: mOpsWnwWTR2na2VQv5wDYg==
X-CSE-MsgGUID: Kb5KD2a7QUaCIp+ovPGUvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="20824786"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; 
   d="scan'208";a="20824786"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 03:57:26 -0700
X-CSE-ConnectionGUID: REpdl3uXQ66mfb9y6HvxtA==
X-CSE-MsgGUID: c624mfQtTJm0PFFZ34m9dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; 
   d="scan'208";a="48182820"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Jul 2024 03:57:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRV0k-000XlS-1j;
	Wed, 10 Jul 2024 10:57:22 +0000
Date: Wed, 10 Jul 2024 18:56:38 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, arm@kernel.org,
	Guo Ren <guoren@kernel.org>
Subject: [soc:sophgo/dt 1/1] arch/riscv/boot/dts/sophgo/sg2042.dtsi:7:10:
 fatal error: 'dt-bindings/clock/sophgo,sg2042-clkgen.h' file not found
Message-ID: <202407101850.eIQyngoV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git sophgo/dt
head:   b1240a39511b9206293b82ac372c5114d6e15821
commit: b1240a39511b9206293b82ac372c5114d6e15821 [1/1] riscv: dts: add clock generator for Sophgo SG2042 SoC
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240710/202407101850.eIQyngoV-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240710/202407101850.eIQyngoV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407101850.eIQyngoV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts:6:
>> arch/riscv/boot/dts/sophgo/sg2042.dtsi:7:10: fatal error: 'dt-bindings/clock/sophgo,sg2042-clkgen.h' file not found
       7 | #include <dt-bindings/clock/sophgo,sg2042-clkgen.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +7 arch/riscv/boot/dts/sophgo/sg2042.dtsi

   > 7	#include <dt-bindings/clock/sophgo,sg2042-clkgen.h>
     8	#include <dt-bindings/clock/sophgo,sg2042-pll.h>
     9	#include <dt-bindings/clock/sophgo,sg2042-rpgate.h>
    10	#include <dt-bindings/interrupt-controller/irq.h>
    11	#include <dt-bindings/reset/sophgo,sg2042-reset.h>
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
