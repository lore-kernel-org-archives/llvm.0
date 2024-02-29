Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063C44AED8;
	Thu, 29 Feb 2024 17:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709226831; cv=none; b=e7dEDxd6neRb4/DQDvdeLWDQkm4W9fMzIkkrZq+gTdyL7FI8qihU9Nv1RC9HlOFxVdNszpErHr6JoLLbWPmLguKcYEMwBHpkpOgYy7X0dQOxEqLkKsG3MUx1302Npzv5hs9Zp91IjU32wW5Vo+rSLnrHEhCUrfkNhJWXM0rBvtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709226831; c=relaxed/simple;
	bh=k71hHRxTdC4VWNB89dEM6yP7ffPsSiGSMByJJKrSqIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LgX4A0jVBezyiBUgKDfSs14qUmghPxgEvhKTRekL/SX8tJojQiJA68PkId4z5tw+2guy4kQbRXgSKL1iSYjKaEriMleWGAKsxIUX+7fY2Dbvyaimp4lOoJCY0lmjro0ilofWQmTr9PcRdbzlPRGEMHoh9j5AwOYCWmuizgESbWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UYLpX3qG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UYLpX3qG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709226829; x=1740762829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k71hHRxTdC4VWNB89dEM6yP7ffPsSiGSMByJJKrSqIE=;
  b=UYLpX3qGGsvoJYpnZgfS9IouCLLPZl4fNoiGNAbKKrEbsV6Ts4gDvqeM
   oOrJ92yvDoFy5dQz5wxN0qt+wiKgnUh/TSO8OxkdtFBrrDAoNtwvDVeiG
   487yOwKldoe7IZ3SaRXGlZ4aUTGWSeBYA4Nh/QfYjJbZbdI7po0nyifGl
   Hk0xq1nJor4v2qJqRfq/GM+3cvI4kLJc6toNO/NhrKG8MZccDy6RsJ4Os
   XGwSgBw/jEY6bpbR98fziMA/d26IC0B7rx55fuXDJTPj8StK+xiQrlKvn
   C2kiKgchUD54gth5yeBPz851eBytzFS+mpbTH+hFNIVoLqatIrioO4kRQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3597545"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3597545"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 09:11:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7818808"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 29 Feb 2024 09:11:22 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfjwE-000D8H-2b;
	Thu, 29 Feb 2024 17:11:18 +0000
Date: Fri, 1 Mar 2024 01:10:19 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Inochi Amaoto <inochiama@outlook.com>
Subject: [linux-next:master 8897/11156]
 arch/riscv/boot/dts/sophgo/sg2042.dtsi:9:10: fatal error:
 'dt-bindings/reset/sophgo,sg2042-reset.h' file not found
Message-ID: <202403010154.1CGYy59Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f303a3e2bcfba900efb5aee55236d17030e9f882
commit: 1ce7587e507e1762df1dadc22affcd41376040d5 [8897/11156] riscv: dts: add reset generator for Sophgo SG2042 SoC
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240301/202403010154.1CGYy59Y-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010154.1CGYy59Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010154.1CGYy59Y-lkp@intel.com/

Note: the linux-next/master HEAD f303a3e2bcfba900efb5aee55236d17030e9f882 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts:6:
>> arch/riscv/boot/dts/sophgo/sg2042.dtsi:9:10: fatal error: 'dt-bindings/reset/sophgo,sg2042-reset.h' file not found
       9 | #include <dt-bindings/reset/sophgo,sg2042-reset.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +9 arch/riscv/boot/dts/sophgo/sg2042.dtsi

     8	
   > 9	#include <dt-bindings/reset/sophgo,sg2042-reset.h>
    10	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
