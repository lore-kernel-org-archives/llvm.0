Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96633BE161;
	Tue, 10 Mar 2026 07:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773126221; cv=none; b=iVOGXdfbAAP2vT0LLykjWwAGVFybTu5W0NgjsFjakA8pNsTsW9MDQw1cp9VLiE185YPzCmowfgGXG35DZZwToWzEHmzVZb8WVLAxHaDhtuia2NU+NWgDShJ8UokwuB3rwOvKyI6NaEprSo/26/JGOnDAROvUzj+b/j+qrpYmNgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773126221; c=relaxed/simple;
	bh=HewspYiwt90p5KkOvXWp3gKWEgWsfwJHxVcwJbkfM9k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RaIkJ7gani1LDRlxmbmRopInWBJI569i5JRcT7HU//5Lxoz3WBEJNa19POjz5UeZnz2v914cevqxv2cbOyx4q5c11U2Fm2OZSeq7wTJO9itKyB81NKpij6BlY1pRsVekKB0DylCiHS3TSbTdkozi5XIC9hQgIWTIzSIwiJPnk/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kJSjlv1D; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJSjlv1D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773126216; x=1804662216;
  h=date:from:to:cc:subject:message-id;
  bh=HewspYiwt90p5KkOvXWp3gKWEgWsfwJHxVcwJbkfM9k=;
  b=kJSjlv1DyA2AAZBilVw2oEBlYru9fDGkQpL/nXwdkqohMzoD1/y9RjhX
   gQdiAo8/so522h4C1444+I4tyRHnFr4gwwHB4XpezSg2/r+OCNSkmoQUA
   Elgqwp8UgqNuf0KlQq38WAGs2xii5WIRWCaxyBg+Rz6C2W3nqMPVaksaX
   p1v0jbMbyThNYUc6WVuYPzn+N+yzQsbXj5HjYomw5o8+nzKqJdw75Osde
   IomjfX9ijS7+wfwkfR9XinshheekkP6HFtU4QUAOpFGVn2LmnwfBSULz/
   BQemNZw2wMFq8JzgB/FW3NVejKz3ZySXEKPMluDY9dsfch0X4irmB0ZEh
   w==;
X-CSE-ConnectionGUID: vd3oBXFMR0OtJcAxGNUP/Q==
X-CSE-MsgGUID: +tr9d+q0TlSGDbck0b9VwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74063707"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="74063707"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 00:03:35 -0700
X-CSE-ConnectionGUID: 4I2USQ/+QNKeIf6ZCWuL/g==
X-CSE-MsgGUID: WHVzwDUMTVi8FH6XRBvIQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="243027239"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Mar 2026 00:03:33 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzr7r-000000001Vs-0THX;
	Tue, 10 Mar 2026 07:03:31 +0000
Date: Tue, 10 Mar 2026 15:02:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v4-wip 8/21] kernel/bpf/core.o: warning:
 objtool: ___bpf_prog_run+0x76: ignoring unreachables due to jump table quirk
Message-ID: <202603101417.VTb0SFDV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4-wip
head:   ac16b9ed881281b934626d9265e7eda3fe234674
commit: fa65278b9bdce81fddb3ec54017ccc384fd42dca [8/21] x86: Use PIE codegen for the relocatable 64-bit kernel
config: x86_64-randconfig-072-20260310 (https://download.01.org/0day-ci/archive/20260310/202603101417.VTb0SFDV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603101417.VTb0SFDV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603101417.VTb0SFDV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/core.o: warning: objtool: ___bpf_prog_run+0x76: ignoring unreachables due to jump table quirk

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
