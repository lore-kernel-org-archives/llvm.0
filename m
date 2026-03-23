Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A2939185E;
	Mon, 23 Mar 2026 10:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263426; cv=none; b=BALGD5czi0XrBKan4b7vVIZA2NX8KN2kfxbZ8szsr04mlLM5lwAI0Hz2FRPJInJ4EjLY31AKXCBKdGSy52HdlQCTiB3itlrQYry15eLkzP/OlUiUKHtJrV5AXBRN2Gh44C3tu/7ZOt3xnvzIop3b06i9KWW7FUpOxP73wH+pw4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263426; c=relaxed/simple;
	bh=wSDBEtgylDbVLV5Dzb2nr0Y74+YlFOeW3xsiMnjWhBg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lXe1dKzOr9zqGyUXE6xcoM/BOFWU/xuDTjDVhJxoGp9vCIYzaBfeUxumhATShsVvJJ+qYAGd3NYF+sLA0ZEyLU/T//JLS6DY1F7QHPpOEdk6H2VRLNXLEnJGdtmOtLPTh8X1rSz2ZUnsvEqUxUVmRLlBg8vzTNCJOkElxsFVYEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GcsR2XDT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GcsR2XDT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774263426; x=1805799426;
  h=date:from:to:cc:subject:message-id;
  bh=wSDBEtgylDbVLV5Dzb2nr0Y74+YlFOeW3xsiMnjWhBg=;
  b=GcsR2XDTYimm6BBMqxY2F3e6enGg6HbHlLSPTeTZr9WrGkUtAOBlhSpf
   4ehaoHwhdUmgpt0j0WzzY9feecqvBdrAHiyUfwTiB4Ehit/91PqSSMnq0
   zmoSolwMYKm2pDfVY2j3zFRPUz0JHuNBuE7Tfc+2YuTHW53On3KDODhUJ
   7EbS2hZyMsnIY1DazT1WKCKpZuUnPwUolTBcB8IolUK70C8aIcW9uX8X0
   Ka4kH/aMBsTrf9p4usBbb+uMoXqU7ftU4oNMdKhLe8dFKfnmhYHOBZDVY
   QSrL6O7p+mTiWB3OqsmJgk1b5sS2fvQkzSnXDBDfTDQizok6YFQsBOq6K
   A==;
X-CSE-ConnectionGUID: 5PfpG3SAQUSNHJqtWQQEHQ==
X-CSE-MsgGUID: mlZNZkiqQLexlM3Q513lkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="79116744"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="79116744"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:57:05 -0700
X-CSE-ConnectionGUID: UgX0DQDZTuC39PeTfMPrnA==
X-CSE-MsgGUID: 1I+f6KRCQIStB80CMPmPFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="223185084"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Mar 2026 03:57:03 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4cxx-000000000Nr-0ZqY;
	Mon, 23 Mar 2026 10:57:01 +0000
Date: Mon, 23 Mar 2026 18:56:09 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/entry/preemption-fix 1/3] ld.lld: error:
 vmlinux.a(process.o at 2773892) <inline asm>:1:10: expected readable system
 register
Message-ID: <202603231818.968oYVfp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/entry/preemption-fix
head:   423b062b9d1426491a06e59385e3b55da584cda0
commit: 39a482d122b314ad64537c09bb66a282efa8181b [1/3] HACK: arm64: Check CPU state at task-switch time
config: arm64-randconfig-004-20260321 (https://download.01.org/0day-ci/archive/20260323/202603231818.968oYVfp-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603231818.968oYVfp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603231818.968oYVfp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(process.o at 2773892) <inline asm>:1:10: expected readable system register
   mrs x8, PAN
   ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
