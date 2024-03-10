Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD283A8C0;
	Sun, 10 Mar 2024 19:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710097886; cv=none; b=eZtBWyzTFv7lh/db9YbZE5n/2kF3l2U8fGASxSUklWwMvIwWnctJ4+Fdv2yM1BU1syafETbfxCUBksqL69QA3JaWkmiNoDhMN8eje0MM602IO9tassiYEJRF8CG7ehBJ0fKLUwm85kDVR84s3m1tW1bYg+8BUNPf6L/rEBxJ1UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710097886; c=relaxed/simple;
	bh=vf8AnNkKTp9QV4hfkV2xbNdyMNpFNly2Oc8Yy36XR4s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GEXaVYP7JPzutQAPHcZuDxeW5DFK+Rw346JGF26SJPVykpqSfe62Wb1ToXaKRcAEGIkPm4BdU63GFRsWuwnR4MxEBiLNHzhjExIBDIvna+wq+FPr3skKg6RYbPMOWwj/tg77q4mkblTaWjR/sGBD0R5PYfwUn+sxDq3XP93JW4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kz4PX6e+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kz4PX6e+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710097884; x=1741633884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vf8AnNkKTp9QV4hfkV2xbNdyMNpFNly2Oc8Yy36XR4s=;
  b=kz4PX6e+7PiaFh3g/jQ+0ByTC004XK9awmQyHX0wgHlBzws/8odpj+xI
   6nbXdaaY8k3cSb/v7Vniybz+OcKXMjhVNLhYQo5puozHzSHC4U8kCgo1d
   oPzDfMTFkqw/GB/cP2bkfRv80C+RGEXBVosGOZMOJBSssJ3EKXTThH7OB
   f8rza5XnWGJtyG2Lqk1D2Wm53S6gN6VaIMZzdNgcCSjg0ZocmEXvzGhWa
   U2yKPoBRWNax534o+P2/NwRB8fgaCHfDr5mT2nZQUqxZrJrq9StDc+yME
   L4ueSDRaRi1+4DG2/9hRlKm1JumQtx30e8xjb6J58QvKLClqdRMt16mkJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="16162861"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="16162861"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 12:11:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="11055511"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Mar 2024 12:11:23 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjOZs-0008UZ-2n;
	Sun, 10 Mar 2024 19:11:20 +0000
Date: Mon, 11 Mar 2024 03:10:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_uprobe_6 1/2] <inline asm>:8:6: error:
 unexpected token in operand
Message-ID: <202403110341.2BY3e9dL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_uprobe_6
head:   89ec186aa763b7de4f2846f57d5f7ffc38d72077
commit: c46975c90ceef8ec72cfa1826b02ebea142c1787 [1/2] uprobe: Add syscall to speed up return probe
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240311/202403110341.2BY3e9dL-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403110341.2BY3e9dL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403110341.2BY3e9dL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> <inline asm>:8:6: error: unexpected token in operand
   push %rax
        ^
>> <inline asm>:9:11: error: unknown token in expression
   mov $462, %rax
             ^
>> <inline asm>:9:11: error: malformed expression
   mov $462, %rax
             ^
>> <inline asm>:10:1: error: invalid instruction
   syscall
   ^
   4 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
