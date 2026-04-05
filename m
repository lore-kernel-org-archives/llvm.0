Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B6D1A3029;
	Sun,  5 Apr 2026 02:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775354825; cv=none; b=sOwkJMXiNmFFi3vEY2yxQt6GfSRrJ9n0XbXjnaua01I3f6xbZhHWxrE/q6kh9teKJkaaS3bMsvz65txwfrHL2elRanDbies3Lsacr7tSHWeirNfsaH0bY/J7HllFTBTTxFxtNwVY/invQuqk9xmaDIYAFdhS5stYT2MZLWjNNPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775354825; c=relaxed/simple;
	bh=Bgnn9IrWdJjkKFc9pqE3SbIpQsoYPc76K3qiVOWuDKI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kVNLmyJ3osN2renEVpDZkCaWXrkkmJ7a/yQYiS1ZfwzmBcgMvjwcpNkgn28HSDCcm7nmLfp/dFGQpKCkvynWIdmsBt7H4LhR2Jc4646cAWmnL3BEbv1+t74Woc9VCg/QuO67oTdrAOus6K1FjeVFeKCC8a4uQQOulFZJmM7I6qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bSSHyZnr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bSSHyZnr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775354824; x=1806890824;
  h=date:from:to:cc:subject:message-id;
  bh=Bgnn9IrWdJjkKFc9pqE3SbIpQsoYPc76K3qiVOWuDKI=;
  b=bSSHyZnrNMZkjeNR8B7Mf9PosrPQs9/sH8VZhxUpXJqXRlIT08NBgYCI
   qp3SOUjPVQbb7DyZUOiIbpW9wj2tnXP2Et/QJFK8hkFfHODtlQfXOKR51
   qEnEaxk6nsTJENLjhBDp1wsMaJIb7GCV9WT6csNNQXf0MHu/s63Te8ldf
   YtEsx+fXxxesfzFM8Fn8ovFAOxZMr184F6mlQ72qdCkKalb2ws/SbM7xc
   bJcBAbLzN6ukH6k2nUPpKIzMr3e9YFT1kXiDnYzB8SPDsLc1xNrVwtzS7
   0S9LnxIhFkdnxUzska7PawUQkpfiUOTBjILQV75hXWIYGZwX3ls/QGud9
   A==;
X-CSE-ConnectionGUID: 4J9U7XFSSLqUymMyFZg3ww==
X-CSE-MsgGUID: IfNomdeWQPat9zCMyBJdFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11749"; a="87817486"
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="87817486"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 19:07:03 -0700
X-CSE-ConnectionGUID: GJyxc3awRO+AqDasHLQq2A==
X-CSE-MsgGUID: dEDOXF95RMW2+z82XYkWDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="250832391"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 04 Apr 2026 19:07:02 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9Ct9-000000009jF-3yEp;
	Sun, 05 Apr 2026 02:06:59 +0000
Date: Sun, 05 Apr 2026 04:06:02 +0200
From: kernel test robot <lkp@intel.com>
To: "Naveen N Rao (AMD)" <naveen@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 setup_local_APIC+0x2aa (section: .text) -> init_eilvt (section: .init.text)
Message-ID: <202604050356.erXlHElD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Naveen-N-Rao-AMD/x86-apic-Drop-AMD-Extended-Interrupt-LVT-macros/20260403-160307
head:   43266aa9ff041a935816f55dba1040887a69dfbe
commit: 2d7d6118468af6e0b8f74c3d2d67dc59c1e48ddd x86/apic: Introduce a variable to track the number of EILVT registers
date:   2 days ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260405/202604050356.erXlHElD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604050356.erXlHElD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604050356.erXlHElD-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: setup_local_APIC+0x2aa (section: .text) -> init_eilvt (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
