Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E777E375F9A;
	Tue,  7 Apr 2026 03:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534335; cv=none; b=DrO+Dl00Fmf2xVDZvDK5e+lnVRfFsnX6Trhw9PcaXUDD6VZ81/yqN+SkLTBaT/XLqe8RSFLvIysRZRQySPlr6yLPAqNb3l9Mk1aSuFMBK8LesMlDVGyNC/fa1gs4Az4GtWf0FUMfv+kH68vwQJLPPCHnNdy6smAIqO9ICtccsCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534335; c=relaxed/simple;
	bh=oiRrbPB6tmH0yPw/IXK44RMxXVCHin4P61pemx7mQ/k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oq9ZkXhP3WmuBPg8S8g5fBgB5luaxjuWfzPY6QnoLW42rwuOzcKcZ+7OnMbNBTOb6RsJWWdkZfTSVr4GFANwSvP7TNAkXIZl1nntpxZ8IhtQx0k+s5neTLW3tTjxIE+iyclVwKcebirmc7/06VHNQBpTdcIPbdkJT0z6Q72GuWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NvKmeooS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NvKmeooS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534334; x=1807070334;
  h=date:from:to:cc:subject:message-id;
  bh=oiRrbPB6tmH0yPw/IXK44RMxXVCHin4P61pemx7mQ/k=;
  b=NvKmeooSM4PHHMJdVImeWCPI5AH/x2g5abMqw7GpOLylZn+1z3eDqxJW
   TxuqvQ8p95+seieVElJx4R9jgCfbAjF9w9MUC33vlzX7/p27IKWbbg/3F
   Jmas4cTCuolAIB3+22/jJqlvSWLH4UNezz6yCDyNTau7PqHg8Z/wg8Urf
   enRy+QPW+rv+uM7+wRG8RY/iEzhkiwoEH0nGKxfktM6sJxBYKWJUaBWaL
   PwXhtzUwL8avjadQpCvbVFvLmut8lcDV9Yrga1ktZjZzYaE2ckk8dX4x8
   +tqI9bDEnKWY3oR6wEW9ImVu+QqKZ6sqKauCUiMjyC7bNKkvIwo3MVR3v
   A==;
X-CSE-ConnectionGUID: bk0Nc9eNScuruZkSXaEf5g==
X-CSE-MsgGUID: WL72TK7ERmabytwNcN5wIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76369564"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76369564"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:58:38 -0700
X-CSE-ConnectionGUID: 9VqQPpaZTdmIOIE+natnzA==
X-CSE-MsgGUID: rwU3lS8bSGKFlqGbMHJsaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="232091301"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Apr 2026 20:58:36 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xaD-00000000065-0QfN;
	Tue, 07 Apr 2026 03:58:33 +0000
Date: Tue, 07 Apr 2026 11:58:01 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 18/68] error: cannot find macro
 `declare_flags_type` in this scope
Message-ID: <202604051110.t7A9W81d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   f7a3080ba37b989ad2fd83054a4b458af97b635d
commit: e7a80b7b6266dffe3e9b93ab97a2b33dde7629aa [18/68] rust: types: Add declare_flags_type()
config: x86_64-randconfig-073-20260404 (https://download.01.org/0day-ci/archive/20260405/202604051110.t7A9W81d-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604051110.t7A9W81d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604051110.t7A9W81d-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: cannot find macro `declare_flags_type` in this scope
   --> rust/doctests_kernel_generated.rs:17838:1
   |
   17838 | declare_flags_type! {
   | ^^^^^^^^^^^^^^^^^^
--
>> error: cannot find macro `declare_flags_type` in this scope
   --> rust/doctests_kernel_generated.rs:17833:1
   |
   17833 | declare_flags_type! {
   | ^^^^^^^^^^^^^^^^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
