Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEB52417C7;
	Fri,  7 Feb 2025 12:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738930322; cv=none; b=OYJQs8Zo5QZbHZzvEwFMaY/DwuUk5KMaDq97/POFRRd56tkGwk7MyAZdyr9Psoy5xakduY6u6jzf9AwDdEszkCTYbiXLO/bceDMx4NRID8EA0EhOUAZMU0HAFUv95H/OtwoRc0nfuN+VuS3MXFLUjI6MuatUAbrT+xULN0imMkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738930322; c=relaxed/simple;
	bh=44+kI0ymCiU9bIwsTFQzODfkR6qaFWCxNsJeQgoivU0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n/3pzRaA9czPyPXwk3gFKgn6u4dUQ4c8M0OFRh6+II4SUR9KW6YvfauGBjSWDU1o+Ib1rHULcgwCGfJvdqwO2PvS3jIAnRRzwV/vl2Gw1SA2fkr1YRcIfvQWl1QrO7sOrl8VE4sIi6VxZmxmG3yZkJCY0rrp8PQEd4/a19mOscU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UPbbTT+c; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UPbbTT+c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738930321; x=1770466321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=44+kI0ymCiU9bIwsTFQzODfkR6qaFWCxNsJeQgoivU0=;
  b=UPbbTT+c4Gz0YPTSlaGlQt8KnRi5IABgpFY3Hg59GaSpbw5Wip4qvaOU
   cC3EISJl0pa/FJT2mKyF2Jh4ukMYxZCbqC1V0hAUW+OOzVBwZuGWRc6el
   RBEz1jeR/7kr+iutX9YbDAEe4fbjKnn2Mjq8FTTkzeGjAcF1BxcPhxIVw
   3nORyT7+Noqo8lWpWVrwb+rTqdrvXgdkvW0JvL9FWBWiVS78cwgcrh86d
   Ec5zSnpnmTUVUdUtoK/9XozEE0OdnSagR8053szvNS0hQ/Du2gF6cmngV
   parB1A+BDIVEYjHbH6J1udYRWF8IEeZs+VE9jDJxXRwsqoplv28uWvdQF
   Q==;
X-CSE-ConnectionGUID: fgfi1PLkRVa8PpqiCT8PVQ==
X-CSE-MsgGUID: HrTn7WCuRPmDsmquqhcDYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="57106615"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="57106615"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 04:12:00 -0800
X-CSE-ConnectionGUID: gERVZ8ZCQPCp3AwL0ybvOQ==
X-CSE-MsgGUID: eD57+2owRNiVK7um7dbWZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111946668"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Feb 2025 04:11:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgNDA-000yH9-0O;
	Fri, 07 Feb 2025 12:11:56 +0000
Date: Fri, 7 Feb 2025 20:11:46 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/fineibt-bhi 11/11] vmlinux.o: warning: objtool:
 __arch_prepare_bpf_trampoline+0x50b: relocation to !ENDBR: __bhi_args+0x40
Message-ID: <202502071952.0qFkAAwo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/fineibt-bhi
head:   b3504017bcc2bd5b56acc9c799ed5054dd78c8b6
commit: b3504017bcc2bd5b56acc9c799ed5054dd78c8b6 [11/11] x86/fineibt: Add FineIBT+BHI mitigation
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250207/202502071952.0qFkAAwo-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502071952.0qFkAAwo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502071952.0qFkAAwo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: nvmet_ctrl_state_show() falls through to next function __cfi_nvmet_ctrl_host_traddr_open()
   vmlinux.o: warning: objtool: amd_set_spi_freq() falls through to next function amd_spi_busy_wait()
   vmlinux.o: warning: objtool: tw28_set_ctrl_val() falls through to next function __cfi_tw28_get_ctrl_val()
   vmlinux.o: warning: objtool: xen_hypercall_setfunc+0x6e: relocation to !ENDBR: xen_hypercall_amd+0x0
>> vmlinux.o: warning: objtool: __arch_prepare_bpf_trampoline+0x50b: relocation to !ENDBR: __bhi_args+0x40
>> vmlinux.o: warning: objtool: do_jit+0x4bb: relocation to !ENDBR: __bhi_args+0x40
   vmlinux.o: warning: objtool: __xen_hypercall_setfunc+0x1f: relocation to !ENDBR: xen_hypercall_amd+0x0
   vmlinux.o: warning: objtool: xen_hypercall_hvm+0x16: relocation to !ENDBR: xen_hypercall_amd+0x0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
