Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAC01CF7A4;
	Fri, 11 Oct 2024 17:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728668553; cv=none; b=BexSqbfMEum6enRe/BvHMiM5VrcF7Umt0Lm6tABLmYxbllmu7P6z8d6MfzQWbkp1erNAadOCO2ZfA1hO/8Uo5ad73I7NUrc62lh/9KfkAs2lB1wrNiR9/d/aAGWoDm0e+e7rjqk5PbwrMnKISdfX1QGAt5a2HX1PABxfgeEsB/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728668553; c=relaxed/simple;
	bh=NXAHPqL78/4Y+cAwdo6+m9pQfMfuBslZLO8letHwfvs=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VjUQ20QynD2KCz2e3j7/vk2ygxY3OyWsatRNTPrROpXuOaB2XjMmjIsUsHBOjNFPT+lNQTYk8FshV/Uvi5dtzXXYecQrXWuXrChCZO7RsXN2e4nHluGQk7Z4RJv2l8NFUpDE9SzhXHi4OaAUddYMLIoYJmbt4efZOU4m+S+C1dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eCUdWZm1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eCUdWZm1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728668552; x=1760204552;
  h=date:from:cc:subject:message-id:mime-version;
  bh=NXAHPqL78/4Y+cAwdo6+m9pQfMfuBslZLO8letHwfvs=;
  b=eCUdWZm10v3yhqrxDEnhRG/oFvVSlYVhj53qBzSFGDao81Lr0SFXn/vt
   pR/k9K8wFp0xsWywcW/KVl5zyQzgLttiDz2hU64tJr6IhxBxzY8qxb3y8
   OGlXeNOznbgY5TqKQsg56s5Dv6XktoCkqtSVjelfbIfOWOTDGSbifLthF
   u36fvXgYUYzhZx7HCUdMQvVU3sE8XNm/66tiASUKGO8odV6U5ZEuly88G
   Iefhc0cyXu12f0QSQwP8syQn7YMvGsqqqOU1QG2T5RXADgtVx4Ydyhb/S
   4ck8r0Z+yxnsrwMyJFMtut9eHJ4M+ofX34nlf0CEkYsk9IE1p4XX93JXd
   A==;
X-CSE-ConnectionGUID: cGkwsflQT/OVBTA0tEVepw==
X-CSE-MsgGUID: CH1xZkSMRI6xO3XJrxUYmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28215243"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="28215243"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 10:42:31 -0700
X-CSE-ConnectionGUID: 7h58VZwDSq2XVc9A+nBHZw==
X-CSE-MsgGUID: aDXSHmkAT9OCZvRpb08CpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="81752675"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Oct 2024 10:42:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szJel-000CaG-2H;
	Fri, 11 Oct 2024 17:42:27 +0000
Date: Sat, 12 Oct 2024 01:42:21 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [linux-next:master 3809/4143] arch/um/kernel/skas/stub_exe.c:79:6:
 warning: stack frame size (16412) exceeds limit (1024) in '_start'
Message-ID: <202410120104.vAWdIYTZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Benjamin Berg <benjamin.berg@intel.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d61a00525464bfc5fe92c6ad713350988e492b88
commit: 32e8eaf263d9be014ba1970444f745682fa9c6c0 [3809/4143] um: use execveat to create userspace MMs
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20241012/202410120104.vAWdIYTZ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410120104.vAWdIYTZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410120104.vAWdIYTZ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/um/kernel/skas/stub_exe.c:79:6: warning: stack frame size (16412) exceeds limit (1024) in '_start' [-Wframe-larger-than]
      79 | void _start(void)
         |      ^
   1 warning generated.
--
>> clang: error: unknown argument: '-n'


vim +/_start +79 arch/um/kernel/skas/stub_exe.c

    78	
  > 79	void _start(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
