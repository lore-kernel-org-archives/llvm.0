Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFE6624;
	Thu,  7 Nov 2024 01:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730941307; cv=none; b=MRFPQO1XfPDCIzmeV8cM/1mSbc/i7Xj+HvHp9Bq2K/v1UkoiFOip9irekPSqu/tZodUYKoNxH8cTVXDFXyGGZsYC9vvIYaR5K5lFsDcJorPcQ6qpyVrLfLKCwfrraS+hjuK//dQnijfLqIfkdRs6jpXr0gtIkyFqEjjSlEI8Ed4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730941307; c=relaxed/simple;
	bh=CgCCwseyQzxLyupmcJaVTKfASp/uOZFW0KBf7nozm7Q=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oa/56QjljKy3YLFFNWzI7V3Vimhat2DEPrNe74dZSueXbetcsPw3pnOodylEt/9CUZ23BUSFvgTCjDsDVngA/J4ehpc2gYM/WSNXGabiIX2tgdb/RxwRwOjzJHYTdz7ipuc3sb6uHe6gX+QIwZVmEhaj4LgIotkbnB8i9+bKQw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GcV/Brpr; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GcV/Brpr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730941306; x=1762477306;
  h=date:from:cc:subject:message-id:mime-version;
  bh=CgCCwseyQzxLyupmcJaVTKfASp/uOZFW0KBf7nozm7Q=;
  b=GcV/BrprfUgg3mZAaVFpKrh6qBAq4+tPxL+ExAodXa27vboUGDelyZBj
   A7Xie+zqRgVQX5m5k1DsOSqdeZ8sT49kbGjPmtLrK+rClq/oitzHn5kdv
   AL0Eega/DYVMvnWykcrqRgL123LngUgJ7uk4lLSEVaVRES14Q9etTZs19
   MZsomYJPJaaNGKquwx1tvM8psLAWLuraKo6TJ1WqraOb5+Ne586uz9RJE
   cp7vR9gPpk6AwRNgbHGVVpEl/n+z+iItVxOAl2QhBUqLgO3M7e8DnI8lZ
   NR0YrPLikDElKYVOSVQ6PU8mwanDB2ITTI0oD12a9gHewG9xrscxh/gPR
   A==;
X-CSE-ConnectionGUID: O2MC7DpbQimooUMS79d4rA==
X-CSE-MsgGUID: TAexItVISsaxs7mkloSZQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34462968"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34462968"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 17:01:45 -0800
X-CSE-ConnectionGUID: ym3+iI1HQjOI38Zmn/ODVA==
X-CSE-MsgGUID: PP2s3cWxRv+xVyyry4tRCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="89637175"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Nov 2024 17:01:45 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8qu6-000pb2-0z;
	Thu, 07 Nov 2024 01:01:42 +0000
Date: Thu, 7 Nov 2024 09:01:16 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [peterz-queue:x86/kvm 7/11] vmlinux.o: warning: objtool:
 ftrace_regs_caller+0x1aa: unannotated intra-function call
Message-ID: <202411070813.VDzr0alJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/kvm
head:   dc414cd768dce496fe3a5dd19255b78fe54d3eb7
commit: 20aed0ae53569706c86e14b9fbcca252ec169e73 [7/11] objtool: Convert ANNOTATE_INTRA_FUNCTION_CALLS to ANNOTATE
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241107/202411070813.VDzr0alJ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411070813.VDzr0alJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411070813.VDzr0alJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: ftrace_regs_caller+0x1aa: unannotated intra-function call

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
