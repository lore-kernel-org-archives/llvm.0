Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A311A841F;
	Sun, 20 Apr 2025 09:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745143052; cv=none; b=tkfScuDHTFLejIXhkBeDkjRoHVlWFSvymn3iayz/V480iFtwDm5LPyuTk6EZS1w5KYZcITa3e7rZWJqisNI/hLhx6cq6K5RgzhmYpc+whqsD704POZ+qs0EcJgZXF+NqJUkvxypVxpLTkqF/u7asedJ0y5fT4050qVbhEbgTncU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745143052; c=relaxed/simple;
	bh=rAkOHGBGxFrFVyTfH7sdPlAPyOGvpOR61qWJ1+CCp0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M4+hIlWTi+Hr+UDifNa/zeNli466Ue4s2azj3I/Q4w2vV/RLHY0a0i/l/vyqsORo/m/kKk5vsC5PSYxa9ACFepYEctQWxpzUdiVVupE2O2fvO09WumI+uQiuJiJ41HIhjAOQVTASxTV9APIQLuzsmudzPMFhAsRUMcV7ghRAls8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q/itxP0r; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q/itxP0r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745143051; x=1776679051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rAkOHGBGxFrFVyTfH7sdPlAPyOGvpOR61qWJ1+CCp0s=;
  b=Q/itxP0rxfNzzzXTIgjiBV7UCrIEAEN5m77JprFDNpWjiHnmzbl7roVs
   eVZVEnwqPtP85B4linkpdbh5zeJxzQg3vc7YtxjfA6LB3iRvVl/05DzVH
   9Sh8DyL1GkaMoRYjkyADSXv7SR8mMfRFOAJMHzWG5jnpA8e9F0/WWKzsR
   PwROceh/gEK2cvRsaiX3Kssgnnz5Q4Ginwe7eP+ljo0zJYqBBN9uReFYE
   iWlPgtfnxTffTI9FaBmXIlZGDW3ZYtbtSSNFNPgdKMvErE/Z1rc85ZJap
   cvPZQKnQRPrFk6d8dGWhTVSNlWN6LIkZJX760l1YVfFXj1CUbgGZzXuBr
   A==;
X-CSE-ConnectionGUID: qMebsj1ASZ2oKMd77ildUQ==
X-CSE-MsgGUID: eSvsakr3Rv2DhrJly3RNwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="69198317"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="69198317"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 02:57:31 -0700
X-CSE-ConnectionGUID: LgKwv8FvQ4+SahmYm9WEZw==
X-CSE-MsgGUID: dL5XNpHmQx2KdkLvO8L+1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="154636724"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Apr 2025 02:57:29 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6RQV-0004Zf-0F;
	Sun, 20 Apr 2025 09:57:27 +0000
Date: Sun, 20 Apr 2025 17:56:42 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ingo Molnar <mingo@kernel.org>
Subject: [mingo-tip:WIP.x86/e820 20/20] arch/x86/kernel/e820.o: warning:
 objtool: e820__setup_pci_gap() is missing an ELF size annotation
Message-ID: <202504201720.szkKSgMx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ingo,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/e820
head:   00188fb1706a5b13228b766cb47dcda740319a86
commit: 00188fb1706a5b13228b766cb47dcda740319a86 [20/20] x86/boot/e820: Standardize e820 table index variable types under 'u32'
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250420/202504201720.szkKSgMx-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504201720.szkKSgMx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504201720.szkKSgMx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/e820.o: warning: objtool: e820__setup_pci_gap() is missing an ELF size annotation

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
