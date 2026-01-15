Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE17A3A1A55;
	Thu, 15 Jan 2026 14:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768485670; cv=none; b=VQI8s2x0Ew/ci6TNBSk/1/45oM6fD5czEWtwTVg91BEmm7s1Ngr/r7USNT79lOBrl3lh9HOZGRflHumpDa8z4aM2MQRDabj8bfCF4GOu9bjRQVFJfoWDs/ubzCTrvxfWXzvNgsxDVRw8pKJPOHczlKAqfZ63wTshYhjrN7h99as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768485670; c=relaxed/simple;
	bh=hJJl95SYFUc6OLzc6JIHj9meMnBXpzNd1RauUuIsKsU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OSNjhwSwkobS+VfguOROJGwW2H7dCcU+vDMXskDV5uKxv/OLa/epN9LX7+aCl2BqGJEwAUvxN07x9eAHcP6HRAvUTHHN7XXq4yyIN4BdM1rUC5XpIjysNPm9cqHEvj9L1PaPuBlzug+qeyJctY6CtHjzpWCoFrDTq9BuipLZ3Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hXd5+0Jj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hXd5+0Jj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768485669; x=1800021669;
  h=date:from:to:cc:subject:message-id;
  bh=hJJl95SYFUc6OLzc6JIHj9meMnBXpzNd1RauUuIsKsU=;
  b=hXd5+0JjrF3Cj4QHVCl7ii0r4T5SuIa9YnKAQgEw9d5OXn2c0yeIDwh3
   S+gjgSchKqU/MgO8Xu+slvcEMONUA9/jLx5vJjjwbNC9Zw4EKViXceM02
   58zIIDw73r2xjDzU9UsoZ7qj/o9R20v9jV6kwNwI+LA7mZsh80PSBDca0
   /sDRcQ4WSwEdgG1ZEMVYitD5VMqhJTqHRwQx75P4oYLc3hLhFxDW4ql2I
   0hnK7KSMZ5ADUzMzfLbeqA2HT4Qo7/SjoZE2z8xqcnPM0hB3TuSe2ko8l
   OYUSI6bYAH6kVXdl/mDQSyjUkQVL0NkR+ACNiQ9kLZAmxiKGqDzDFyjOE
   g==;
X-CSE-ConnectionGUID: AEunZ+QxTJK5tKBvd7J95w==
X-CSE-MsgGUID: GwExZU6vQWSDxMGTTITqzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69689033"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69689033"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 06:01:09 -0800
X-CSE-ConnectionGUID: tohnMBLWRKuhSfIYh3rqAw==
X-CSE-MsgGUID: vy1FSQzrSMC46Tg2IaS1Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="209471366"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Jan 2026 06:01:07 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgNuK-00000000I2E-2MNA;
	Thu, 15 Jan 2026 14:01:04 +0000
Date: Thu, 15 Jan 2026 22:00:50 +0800
From: kernel test robot <lkp@intel.com>
To: Prathamesh Shete <pshete@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jon Hunter <jonathanh@nvidia.com>,
 Petlozu Pravareshwar <petlozup@nvidia.com>
Subject: [jonhunter:tegra/next-fixes 4/6] Warning:
 drivers/soc/tegra/pmc.c:477 struct member 'pending_wake_status' not described
 in 'tegra_pmc'
Message-ID: <202601152118.iUDaBhog-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/jonhunter/linux tegra/next-fixes
head:   8db7df69105098e025ef2c558d2a3e23bc788a9b
commit: 8c40b13eff0e1a7d46a38648951ff0b9581c0628 [4/6] soc/tegra: pmc: Fix unsafe generic_handle_irq() call
config: arm-randconfig-002-20260115 (https://download.01.org/0day-ci/archive/20260115/202601152118.iUDaBhog-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601152118.iUDaBhog-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601152118.iUDaBhog-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/soc/tegra/pmc.c:477 struct member 'pending_wake_status' not described in 'tegra_pmc'
>> Warning: drivers/soc/tegra/pmc.c:477 struct member 'pending_wake_irq_work' not described in 'tegra_pmc'
>> Warning: drivers/soc/tegra/pmc.c:477 struct member 'pending_wake_status' not described in 'tegra_pmc'
>> Warning: drivers/soc/tegra/pmc.c:477 struct member 'pending_wake_irq_work' not described in 'tegra_pmc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
