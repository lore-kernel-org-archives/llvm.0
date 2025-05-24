Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE712BB04;
	Sat, 24 May 2025 01:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748049234; cv=none; b=caq5dcJxpcXsjYm9MfL9v+fWFVZvy8IMW/b5UaCUXCvx3v1J5phxL3FyyI29qj/Q+zWyf5RB1m6HGb3nHijhbrEMAnccuqwfcjblCE88S7jBMpIG1/xgIbtZdtW7MZyXz3B/68MBgOfqrTNO1EheAnn2tanMeM/kiQCnQR2Mig0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748049234; c=relaxed/simple;
	bh=teAmctQEEI3GPZ/QSD3a2qMWBxHEKxxxo1ztoWuEIVo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W7KAW5JbS4loUuM3OaqEhLrqZnVc+hTWeRjwNa6Vcby60CGPNCO0lHTr76IUFTAEIBXY3RNmw6OpVME6Ks7zpzZdYHlAo1r3VmPXHhCLT/+su4lzldTFeyZu59VILPW/hInLy7ULDdWmoZICx5IleJyl9hZNiVdOMyUdjX+X4/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WcfxdarE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WcfxdarE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748049233; x=1779585233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=teAmctQEEI3GPZ/QSD3a2qMWBxHEKxxxo1ztoWuEIVo=;
  b=WcfxdarEhrhz3eFykOB6XWq+x7RjBYRkYLaSW8KS3jGQiwHhl+ffbsLS
   +X/FP9MWFuOwFaA97axXmvwD0fEB/ZuYh8bRskMRdPOhMKrdqcey25hou
   NvnhCwjL6s2FpqlwuleRMq+LJaZjzZig4Bw7OZooy1qqhuO52+Bm5cTHS
   F83y4G5TaRwWMJRk27IsikvkRC2KgAczakVQDzif27rXpMCnxGY1awmIc
   oTKCS6Li+TrKXVxUu3IZvr7q+6xRI+A+7Cv8x19p4fDJMprXVrsDWN9nG
   4NXAzlrfVJfL238vgAexYGpuQMMvCdb3pAi9aHQz2fX5v9xhQDhm7FboZ
   A==;
X-CSE-ConnectionGUID: CJ6Jw3D6TaGPBuj2hWW1tQ==
X-CSE-MsgGUID: nvLOIGKhRPqt5EvE5imGCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61517170"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="61517170"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 18:13:52 -0700
X-CSE-ConnectionGUID: sGwsxCuaRAmGvk8EgBYGsA==
X-CSE-MsgGUID: 8Re+33FLTjOLhChCeMlF+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="142391927"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 May 2025 18:13:50 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIdSO-000Qqk-1s;
	Sat, 24 May 2025 01:13:48 +0000
Date: Sat, 24 May 2025 09:13:28 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:container 2/15] <stdin>:1618:2: warning: syscall
 container_create not implemented
Message-ID: <202505240927.xGjX0Qgj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git container
head:   e934156b00c64a64a048108513ab445a232c2120
commit: 61e7b03ab06fef4e10ee9f799118ed4a648e9823 [2/15] containers: Implement containers as kernel objects
config: hexagon-randconfig-002-20250524 (https://download.01.org/0day-ci/archive/20250524/202505240927.xGjX0Qgj-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505240927.xGjX0Qgj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505240927.xGjX0Qgj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> <stdin>:1618:2: warning: syscall container_create not implemented [-W#warnings]
    1618 | #warning syscall container_create not implemented
         |  ^
   1 warning generated.
--
>> <stdin>:1618:2: warning: syscall container_create not implemented [-W#warnings]
    1618 | #warning syscall container_create not implemented
         |  ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
