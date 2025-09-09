Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A52D264608;
	Tue,  9 Sep 2025 04:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757391707; cv=none; b=Du6PF/iqIxK+d1qt1+l4XBo3l1R3gbD5uic+t5wiARkFqmNyJWwqmx9dHn0LR7UBsAmwc7pFnZ9z1TN4qO3oBmxl0r24rJ5jnHmHsQynWE8RqZzdn3qZ9dW0mELghWrkc0M4xI6AXT2FbSrscrw/OX3et4DxCBKllVCbyhYKYLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757391707; c=relaxed/simple;
	bh=uiMPRgKoh/7aoMbCuFsqFG68K9Whk5O6b0LWk1SRbmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QZC0fqlPs+OWeAeDhkUWq1ItuQ9kkoB5DMZA7p91WCR9JMIVuz83dB6VXnnmMuqWhPU0p6fqDrEk7iqb/rUaZ/pWou3zdnCf0KYkMnybtfF4YlGIpObI94smMpXCemQ/YPJgdXUQ5yWQ4dm8DFP5XJFlBGMD8WF4bTcW4q92814=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NCKMMBA7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NCKMMBA7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757391705; x=1788927705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uiMPRgKoh/7aoMbCuFsqFG68K9Whk5O6b0LWk1SRbmQ=;
  b=NCKMMBA7O7UnNRdWt0XZIDwesvVcm81HqKLR2CzAb3iyT5YMKoyC842y
   OK+PfXJMEUt46OK5f8isSjGHwXihv2xK9MLnHBek/UR97V2UyQKtNw8zt
   tIW2H9FkA+LRs8DR2U8bbO0G8G+D20Esx7HoP+KORR5I009V/0l+ggPse
   Ms9xYimfZlXdkbemotuq8WX8tnOg4O3TjtBxxLMdM+nW9t5QA+Se0YF9j
   t9g3L+3t1QmNn6VyuhvvVOa4kA/i/+u/LMBjKHjQ9GLzgHTHxU1ZYqTda
   pwRxJsNpJhWeRa/W5s/YdiAW0jUXi28lYiOpd4mYyDcWmfHdUStjLRFm6
   Q==;
X-CSE-ConnectionGUID: H8deopeZSeqn9zdMiIUmXw==
X-CSE-MsgGUID: RP+FQMDATIKUsNmNOP15Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="69920322"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="69920322"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 21:21:45 -0700
X-CSE-ConnectionGUID: nN2qOAFXSIK5L+aS5i3VRg==
X-CSE-MsgGUID: N5jIvYpQRrOF7jPcYBT5ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="196622452"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Sep 2025 21:21:44 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvprR-0004Qm-2X;
	Tue, 09 Sep 2025 04:21:41 +0000
Date: Tue, 9 Sep 2025 12:20:46 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/slice 52/58] <stdin>:1624:2: warning: syscall
 rseq_slice_yield not implemented
Message-ID: <202509091241.EafUYqt9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/slice
head:   a2e41ac0ef0218895394b1ac12abe5b67d6d62d0
commit: e10fa02843f1a0c8abe9ea4953b04cbe9e11abca [52/58] rseq: Implement sys_rseq_slice_yield()
config: arm64-randconfig-001-20250909 (https://download.01.org/0day-ci/archive/20250909/202509091241.EafUYqt9-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509091241.EafUYqt9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509091241.EafUYqt9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> <stdin>:1624:2: warning: syscall rseq_slice_yield not implemented [-W#warnings]
   #warning syscall rseq_slice_yield not implemented
    ^
   1 warning generated.
--
>> <stdin>:1624:2: warning: syscall rseq_slice_yield not implemented [-W#warnings]
   #warning syscall rseq_slice_yield not implemented
    ^
   1 warning generated.
--
>> <stdin>:1624:2: warning: syscall rseq_slice_yield not implemented [-W#warnings]
   #warning syscall rseq_slice_yield not implemented
    ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
