Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DAF371862;
	Wed, 11 Mar 2026 21:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773266227; cv=none; b=QSfbpE9JlqFjW9OuzNOeDvpQWkwvbcyc8jobbm7hqvf9bPH3EdLSzTGe/fVn98Fh+JGip8FY4O+5sYVAqNUvXsFjcI7tGQ3e6o9VvHymkGWNj289JuyAzZk6t3m2eK9LwdwSnmWVgpM1ueJ6z62NdbpeiAmBwTC1sAMvU4EnxU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773266227; c=relaxed/simple;
	bh=OsG9K40sR4G/EGEZgUu0mPs+Eu/B6Q92ozaspornThw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jINX0NrMJub7OT4eg4ZDTFJyqwv1G04g0RjPLzjI+9vQQaTHUkmgW+h4+yMkRgPxF15ywIg3FGl2uvKIlf371tRhYTvUw+wGNJt8XwXCnfb7gzg0c+qTugqmCSKZ1oS4k8FdpJnFGcV77vBXnZgkg6YFQndCavGe5EnK61ER3aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M3pmnHwq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M3pmnHwq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773266225; x=1804802225;
  h=date:from:to:cc:subject:message-id;
  bh=OsG9K40sR4G/EGEZgUu0mPs+Eu/B6Q92ozaspornThw=;
  b=M3pmnHwqINvTK17DgA5ZaiUM9ktzk6W35705T5/5hlojEFRfZ+cH2fbY
   FRu/R9AotHRJwQafu2QAetMjNUGta+sq7CdNdOWoLJL24kG8ueWtpxi/f
   ZT75fdhHdO+68hoeNveMhI2SRhPPlsRmwCFG9gt4Pm/7UpbiChR56BdhB
   /InZwfPDIKlNmdA5bNLMSU0tPZijjb+bzSVCYeTW/BOygFYljkj+bgaLl
   czEbac4B0rHN1Iy8cpzrKQ+jl9q2ZFgOnvX9EJjM+uhdwQ/XPYgh7pG/l
   Lx7YUCqnR2QiDAiWbueqmwfEgLU6iCdCmukR8VZ6ytvzJHGbf+6DEPIBb
   g==;
X-CSE-ConnectionGUID: 1oDd5edcTNO+thYOpE7zXQ==
X-CSE-MsgGUID: dwwjiZYxRYmrQFAUU0fKUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="77955595"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="77955595"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 14:57:05 -0700
X-CSE-ConnectionGUID: ZNpBYw7hR2mkrpzmbmWLJg==
X-CSE-MsgGUID: 79MQ8kheRu+0PLJnJTA4Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="243629171"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Mar 2026 14:57:03 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0RY4-000000001kR-1ytQ;
	Wed, 11 Mar 2026 21:57:00 +0000
Date: Thu, 12 Mar 2026 05:56:29 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Marc Zyngier <maz@kernel.org>
Subject: [linux-next:master 5480/5731]
 arch/arm64/kvm/hyp/nvhe/trace.c:16:10: fatal error: 'simple_ring_buffer.c'
 file not found
Message-ID: <202603120516.w7mPa5ZC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f90aadf1c67c8b4969d1e5e6d4fd7227adb6e4d7
commit: 680a04c333fa29bf92007efe11431be005e8c4bb [5480/5731] KVM: arm64: Add tracing capability for the nVHE/pKVM hyp
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260312/202603120516.w7mPa5ZC-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603120516.w7mPa5ZC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603120516.w7mPa5ZC-lkp@intel.com/

All errors (new ones prefixed by >>):

   clang: warning: no such include directory: './kernel/trace/' [-Wmissing-include-dirs]
>> arch/arm64/kvm/hyp/nvhe/trace.c:16:10: fatal error: 'simple_ring_buffer.c' file not found
      16 | #include "simple_ring_buffer.c"
         |          ^~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +16 arch/arm64/kvm/hyp/nvhe/trace.c

    15	
  > 16	#include "simple_ring_buffer.c"
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
