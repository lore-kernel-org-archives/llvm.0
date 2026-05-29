Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C9A3AEF57;
	Fri, 29 May 2026 20:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780086232; cv=none; b=RJ42ozSMphd90Fq/jv15HB6jXARkg3pJbV7Q1GLVUNo4JiC52WsqgfKpo+W+d2AnA5crh0nBslN9t+SEkBxsnM27VK4ht/T70VeSfsnf9nz1lDwTYC2VtPB6JdHJrDIZD9hdlulSiMAuY8mZG1Bl25Kw5lb/QsC+CFb4Cz4YPyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780086232; c=relaxed/simple;
	bh=m6t+qih5eLt7Ihr0AEZGA4bpKqoMo4Cu3aWOvweiSFg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f72TfdPEwF2TJdhmLfB8e8krAgbgeGdbp9Ps78BBrxF2nb5GqTZnk+1HrLo/FPppfZWTE0AIn8/MYZL2UWh4xKxDMR6hz3otfsknwcbfufv5dj470l/rtkS9XlvaTzidIysJNQTCXvf2XLsC0wmTtYcirCqon1DKhrhuZwUXq2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M3fasf2h; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M3fasf2h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780086231; x=1811622231;
  h=date:from:to:cc:subject:message-id;
  bh=m6t+qih5eLt7Ihr0AEZGA4bpKqoMo4Cu3aWOvweiSFg=;
  b=M3fasf2hAW6chJcKug2XE1ekdPNQmDXCnQl/u+44Rbe4w3e4aoIlNu/r
   T1usc8lyEm9I1FiR+H9gIDbu/V8WxqtJs1JV9X0YoyOAxNoT180m3z/IV
   REZMfUCcVS0RGG2oNfUvHXuiyC2TCrbjLQ6J5EYZIXdx3e/mhT6G4cCNo
   /xJEsWaGt2BMOShREfCZdT20ByaKkHBKgmGHCPIX0zFhq7f6xF/pOPxco
   0oud0oAbDKlRtS6mVEuaVUlvL+hVCSl45mCLDqy8+5uBPH3hV4W5iWMCv
   NdmUxS0Yr8L/dpHVkpkvVXlu1ZwitM9qnCT1P+Kl7SDsxNYF+++FEAbtZ
   A==;
X-CSE-ConnectionGUID: rgRE7p1CS6SY7aZ9EpZDJQ==
X-CSE-MsgGUID: i96EyFQkS66iqM3/6Af+bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80917594"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="80917594"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 13:23:50 -0700
X-CSE-ConnectionGUID: 7bI9ucCLRCOQiONV4wMA0Q==
X-CSE-MsgGUID: 6I6ZJHXSREi3pL+pZjuPtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="266814036"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 May 2026 13:23:48 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wT3kA-000000007fS-3Yih;
	Fri, 29 May 2026 20:23:46 +0000
Date: Sat, 30 May 2026 04:23:22 +0800
From: kernel test robot <lkp@intel.com>
To: Tomas Glozar <tglozar@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglozar:rtla-for-next 17/26]
 tools/tracing/rtla/tests/scripts/lib/get_workload_pids.sh: warning: ignored
 by one of the .gitignore files
Message-ID: <202605300436.PqQ0Bc8q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglozar/linux.git rtla-for-next
head:   db956bcf8d681b5a01ebe04c79f6a7b29b9934f9
commit: 48209d763c22354c78f6138f4a83814c2f2a3578 [17/26] rtla: Add libsubcmd dependency
config: arm-lpc32xx_defconfig (https://download.01.org/0day-ci/archive/20260530/202605300436.PqQ0Bc8q-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605300436.PqQ0Bc8q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605300436.PqQ0Bc8q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>> tools/tracing/rtla/tests/scripts/lib/get_workload_pids.sh: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
