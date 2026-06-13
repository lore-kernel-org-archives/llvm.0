Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C334D374728;
	Sat, 13 Jun 2026 11:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781351363; cv=none; b=cgiDl885f09ZpjRz2fLx3kU+2lzIWWrmn0kGNPJJEOksJ2S05zd6E8snqZr1DC1omq3pc+Nne4BZygefxMWXRA5t8F7JMJdq2etE4AtP7FhMxDxFnoYP6M//wLtxcUtXKR7vCCRDYytxag1qJFHqu9pIhfn4Vq5+S8wAO6T4OPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781351363; c=relaxed/simple;
	bh=6AiT8TVE9kz0XCg998qJ5vn1POeF3xXxIgNvk2kqbbY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BkzmzQg9Y7YhZ8enPfkF/qOenho3IWiAvB1mUDtJpSw+ZC9bvXDS7fml3E9iSE0OaTc1qrjbAXg2kw+N0thHTF96zda9BDHwKkb517cPKgFFJ35JSFS5dPEjL0ISczKePCjfHq3SqbFWnMo56nyx08djETD56cLa2CmrUzwPg4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hGpGxat9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hGpGxat9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781351362; x=1812887362;
  h=date:from:to:cc:subject:message-id;
  bh=6AiT8TVE9kz0XCg998qJ5vn1POeF3xXxIgNvk2kqbbY=;
  b=hGpGxat9mdnd/KnjIcV0TCyIKLjmj980lFbBcuRiykeV5hte81oZUHNW
   E21vFgUwXbs9PwHow+CJYt5kN/WIn2yxzMAXzAOcbxg5xjS/z1AKGYpLh
   8y9zD+gs5V9uVAr2hOmVUbv8aeKq7OiRR3SV89AW19Ysm5CV0iSfzkC5i
   2V1pyFgm3RE0XPBSx69PvbgZh5ym5gogiW7QpPnbqioU3lpHeGcQlaIEd
   2xd9LexiNQr5yLy5e7v0c4J2aV2QokHWnOkfptuxcSKygX4nZFxzwod6m
   dtdncDCnU3TZQa4Cwgp/mpl01MplrZwK+7S59f1qWJf8oqIi9RUhNDfdz
   Q==;
X-CSE-ConnectionGUID: 4sxOMrtqSbKYt3i3q2jsMA==
X-CSE-MsgGUID: u/OTy5mvT+u6yFWi4cY2eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="81299209"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="81299209"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 04:49:21 -0700
X-CSE-ConnectionGUID: eT6oZC9QTKayQEjYW97Ssw==
X-CSE-MsgGUID: 8uo6jugcSUOu4nEbDiRMkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="245929611"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 13 Jun 2026 04:49:20 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYMrV-000000004Tp-1uXG;
	Sat, 13 Jun 2026 11:49:17 +0000
Date: Sat, 13 Jun 2026 13:49:05 +0200
From: kernel test robot <lkp@intel.com>
To: Cong Wang <xiyou.wangcong@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: Warning: kernel/seccomp.c:241 struct member 'pins' not
 described in 'seccomp_filter'
Message-ID: <202606131331.Gwuxcq14-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Cong-Wang/mm-add-__do_mmap-and-vm_mmap_seal_remote/20260613-081932
head:   f5af20b8e3f9e7d8778e63646a08b4152ad65e7e
commit: 28deacdb0e3273f480ad8f4c482c780a39fa687d seccomp: add kernel-installed pinned-memfd redirect
date:   11 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260613/202606131331.Gwuxcq14-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606131331.Gwuxcq14-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606131331.Gwuxcq14-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/seccomp.c:241 struct member 'pins' not described in 'seccomp_filter'
>> Warning: kernel/seccomp.c:241 struct member 'pins' not described in 'seccomp_filter'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
