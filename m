Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCB9610B;
	Thu,  2 Oct 2025 20:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759438434; cv=none; b=ElRoKwl8gHulOTXgPO/snEjuuRbIY8li3/IC2VMqBVVRPYDdmiGKrV87F6fmSgewkrsxchGBBXfhvg4yhm6PE5pjUxAZHeyowRMrBDKOth3X9NOIeGFrQu/abHGDtQ5gETg8fnqGqSExkgE1KPhCqCPw0/njl5BvCJx9IEyDwA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759438434; c=relaxed/simple;
	bh=KtFqP/arthrRztirKPKtAcTBBOI1/NQx6QVgvQWd7LE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZRghyZWv8oUtlftta7ae7/m2EcWRoRdaNv3kA7Br2x/DqygjzKmocIUX4exCIAYlRLpwDpSCtjaUgJ/dQCH2Ro8MVGhh95lu5DV6IMxbGEERr9GeBJTzP5WV4oSlfeLRf+W2bdOee6L+3iQjSSurjfFI+kl6Mq9nfN/yNkA8SFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tnuu0MFW; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tnuu0MFW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759438433; x=1790974433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KtFqP/arthrRztirKPKtAcTBBOI1/NQx6QVgvQWd7LE=;
  b=Tnuu0MFWuve13m2A/daYTHKQhklrbF6ybahK4ifUVZZI2HJjraNhjIrg
   qqcHNHwHckBxw7QhRNuOqr3bO7+uelUV4fmFPrDgFk5/d9owj1x9Rcwa/
   MqGR0rfkYT5tYxexYoCMjp4MPgTHv6etiDUlFlmkXboiSs0jczPzJTp9x
   uHJywxv5ku70QCY4xrsWGYFlAojUDryiiePm62ce6nTV6cBB7UENTnUNd
   d7wBqcPLAD63FBqRLicu4LEu3eDrmtpjglpftDWg4Rv/BmKAhLVyTl69R
   gzQ0Ph/kXycYcrLJ55XoCGNSFJuv+eFXev1ZMGcnnzMKU6e69OXs/CZaV
   w==;
X-CSE-ConnectionGUID: 0GRI1yuwSfeZoTzA5dYqiQ==
X-CSE-MsgGUID: XxzFeNoMSXyJ1nNR96dLAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="72347708"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="72347708"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 13:53:51 -0700
X-CSE-ConnectionGUID: gj90oZk4Qhq4z+xJTDbB+Q==
X-CSE-MsgGUID: kZK23Pl8RkKIBDW4eFEjgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="179571947"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Oct 2025 13:53:50 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4QJ9-00047b-2M;
	Thu, 02 Oct 2025 20:53:47 +0000
Date: Fri, 3 Oct 2025 04:52:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Acs <acsjakub@amazon.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 13069/13300] error[E0425]: cannot find value
 `VM_MERGEABLE` in crate `bindings`
Message-ID: <202510030449.VfSaAjvd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7396732143a22b42bb97710173d598aaf50daa89
commit: 8355c2312fdfe590a296b8abf9414ab7ecb49d1d [13069/13300] mm/ksm: fix flag-dropping behavior in ksm_madvise
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251003/202510030449.VfSaAjvd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251003/202510030449.VfSaAjvd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510030449.VfSaAjvd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find value `VM_MERGEABLE` in crate `bindings`
   --> rust/kernel/mm/virt.rs:471:49
   |
   471  |     pub const MERGEABLE: vm_flags_t = bindings::VM_MERGEABLE as vm_flags_t;
   |                                                 ^^^^^^^^^^^^ help: a constant with a similar name exists: `MMF_VM_MERGEABLE`
   |
   ::: rust/bindings/bindings_generated.rs:7936:1
   |
   7936 | pub const MMF_VM_MERGEABLE: u32 = 16;
   | ------------------------------- similarly named constant `MMF_VM_MERGEABLE` defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
