Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86BD19AD70;
	Thu,  6 Feb 2025 21:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738877478; cv=none; b=Q73i33IeIFvZCZssMjcXT5Ra7r9XJp/RoiFs00ac8u4U645daH8BK6ENKnlSB+6Afs2mE6ZUaO3eiX4pwzqJvvCU1M7VCyIGn1czruNF3qw3gaMErRMjKtUHwwTvX7b+Iat2LkbMC1mBMpSAPmfu/DX8i9jk2czxhH2wwNZqJ8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738877478; c=relaxed/simple;
	bh=a26keLEDOCpi7FRH8z/PbYtXwcgygIib1wsGjuo/X5o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sdAzSJd65tF7nAkitUCxSP9Nv3eE6yW3ny4xDSIF2CY+nIiKA0TLOicoww5FQvIxv4yqmLNWnQ7IiKkTfbPAbgKDBrLbYWANBf9vItvSQLNj9QvGN9rSBre16q0vUcBhTEWb7/ZX2D05Lk1qPeR2/e1EGMrmNw9Ap+SlEHQN1q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kNRtks5X; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kNRtks5X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738877477; x=1770413477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a26keLEDOCpi7FRH8z/PbYtXwcgygIib1wsGjuo/X5o=;
  b=kNRtks5Xv1vfsUnC6Wrvv8WTZRU+TKJGH9D12r/+hHsIxAFJP9LAikJl
   c8/C0qa9oVDGKTZWaliguTGd81l+eRbtDTKFJMzJeCdnCBeCqf9frNt0o
   /x4GDpjHikLZST9kCdLiZpra4TI6VU/jNoY8xZuygfM9w6POR5pfCkltT
   OYQj74JIBzhSpYBpeNE8lhXPcYBmORgp9+JBRSeN77T2zbZhCmhMPjsPQ
   jkPXbZBCJpYThRMOnjbsxmKh9QrdkUpMikgbOjhytP1mqfNNHi5ddy/m+
   pFZw4eyRK/rP6bG6sS5iSJy00BU8BdDifwi63SOdun5ajqHArPDvyWebc
   w==;
X-CSE-ConnectionGUID: TZxF9wQtTRe0qXBQ0tkJAg==
X-CSE-MsgGUID: yHv1Z+8VRYecDIRb3uDT9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="64860434"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="64860434"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 13:31:16 -0800
X-CSE-ConnectionGUID: 0jsEx++QR+yx6o9UQraXRQ==
X-CSE-MsgGUID: 33skUjwLQCGrjsMCJtVg9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="111258860"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Feb 2025 13:31:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tg9Sr-000xLf-09;
	Thu, 06 Feb 2025 21:31:13 +0000
Date: Fri, 7 Feb 2025 05:30:13 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/ibt 3/9] vmlinux.o: warning: objtool:
 xen_hypercall_setfunc+0x49: relocation to !ENDBR: xen_hypercall_amd+0x0
Message-ID: <202502070543.bjPjfBpY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/ibt
head:   57750f0464beab3927ad570e0c1b5e78c91dd1b6
commit: c9fa4d9a993587b69ee18742ca59c61bed1dc808 [3/9] x86/cfi: Clean up linkage
config: x86_64-buildonly-randconfig-004-20250207 (https://download.01.org/0day-ci/archive/20250207/202502070543.bjPjfBpY-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502070543.bjPjfBpY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502070543.bjPjfBpY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: xen_hypercall_setfunc+0x49: relocation to !ENDBR: xen_hypercall_amd+0x0
>> vmlinux.o: warning: objtool: __xen_hypercall_setfunc+0x1e: relocation to !ENDBR: xen_hypercall_amd+0x0
>> vmlinux.o: warning: objtool: xen_hypercall_hvm+0x16: relocation to !ENDBR: xen_hypercall_amd+0x0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
