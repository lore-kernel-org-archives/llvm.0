Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67973D88E7;
	Tue, 21 Apr 2026 14:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776781571; cv=none; b=QBsLofOrL+sr67UHm+1dKm9f8q9a57aCLUIMq51To148657Z6LkbKUDufBWNK5vClVHogLH1AABpNJeqyzavgHQYAYqZTWV4UqXlCTdaWkr1XkjnUx+Ey9RKGVym/weOT+rgWQUc1dxTFOwgqyap6hSsDVJFg8Is2vShUt4ZGRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776781571; c=relaxed/simple;
	bh=Uf961pC2Hg2lcetGzgr6f+yCwOAkllfRhKPzEor1gpM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XXpagx60Ik/2K5oVPMbOj3VL0M21X7AAr2V7ERhwx7YNL+HRY5ZStoC/LXerdTl5jjmVxOf5QWizIjKXeSxN87f5Tp6cvO2scTHIBMnhn0VnAa7SRezLkbvgzcExrGbg0PD3smnfHGwzcsNIKGwyNguYtgti5FxsRvgPsooCoOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HDa0pWHo; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDa0pWHo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776781570; x=1808317570;
  h=date:from:to:cc:subject:message-id;
  bh=Uf961pC2Hg2lcetGzgr6f+yCwOAkllfRhKPzEor1gpM=;
  b=HDa0pWHo+uKHrqjm80BMilupKaLUazs0COcCbdbVjn/skbS+HRFtPrBS
   RzU+w2iSS2eAn/3a2psAMhRNlOkYyiui2XHeBSeEddQCvrdURLlXYMnqS
   01BXyeqlJSWVAG6tjOJ6SEToThw2bOT276OfGoMK/Bv8JvNBFKQifa9s8
   +j3FCyPBI3i6kkzHo7L/rC++I8Ufh3EBfYC3BNwj95BNSIzfPw0Ahg7xv
   X9wEjjIaeLvbzMB4TkB2To71PGre4H1uqnT5PftAGkoQdCAgRUps1Wpe2
   /8q39mPsqDKL0QJdK/GS25rsWEIdwjjOBk3SNOd9VOMjq2so9EWEKx6jH
   A==;
X-CSE-ConnectionGUID: /h7NA7SoRI+4REpA1+ARmQ==
X-CSE-MsgGUID: SOWrSq7NRoaFp1OX4mlpuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77783589"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="77783589"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 07:26:08 -0700
X-CSE-ConnectionGUID: 2/+BCOt5SaWtyN59cX+Eag==
X-CSE-MsgGUID: 4lFKZ4OeSGi49r3Cvp1g6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="232332684"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Apr 2026 07:26:06 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFC39-000000003ci-255A;
	Tue, 21 Apr 2026 14:26:03 +0000
Date: Tue, 21 Apr 2026 22:25:58 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Chao Gao <chao.gao@intel.com>,
 linux-doc@vger.kernel.org
Subject: Warning: arch/x86/virt/vmx/tdx/tdx.c:141 This comment starts
 with '/**', but isn't a kernel-doc comment. Refer to
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202604212224.WjYFUnV9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Sean,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b4e07588e743c989499ca24d49e752c074924a9a
commit: 165e77353831a85caa0444d16f29bd6b111dd2c5 KVM: x86/tdx: Do VMXON and TDX-Module initialization during subsys init
date:   7 weeks ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260421/202604212224.WjYFUnV9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260421/202604212224.WjYFUnV9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 165e77353831 ("KVM: x86/tdx: Do VMXON and TDX-Module initialization during subsys init")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604212224.WjYFUnV9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/x86/virt/vmx/tdx/tdx.c:141 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Enable VMXON and then do one-time TDX module per-cpu initialization SEAMCALL

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
