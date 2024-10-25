Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5112217F56;
	Fri, 25 Oct 2024 22:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729894175; cv=none; b=EEwnyrbH819PCsl4jac9LXP9h0I5a8sg5nye5lvGessWDUW9WqYRlaqoiV/vV30fc845ZJ1Yk8FdiAbXOk5GJo5k0uFepRQLBYCuSC2xzxc+RqzipAHxSPqdUCScXlPbWfTDmlpuuRZgQod+zzRGPCq1oyB42yThjNOWYkpYgT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729894175; c=relaxed/simple;
	bh=2aHy/NsMHkw8RTywgBShuYOLzJqXhVRUmLNTg6HTcQc=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M/BhcxzMF5UQudkUywh2DybJ+3LdfLqAWSOjUa4LiJ4UgBtSZ8aFPJToIZBo61M1xBSklZ6l6vOQjvDDUmrDbloWwg6yF8IgXqaHMIzuSAMUXl/qRu/XS3LhEQYVxj0BXm/mLgoaskmGI5SKoeUHqkKkVhy3IIdKW89ZG5jkYT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eygjn5FT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eygjn5FT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729894174; x=1761430174;
  h=date:from:cc:subject:message-id:mime-version;
  bh=2aHy/NsMHkw8RTywgBShuYOLzJqXhVRUmLNTg6HTcQc=;
  b=eygjn5FTP28BlmtbeC9FT88l0wmY0clxBWpVGSUEDxoLMAi9/AvJETNJ
   /7Ka2dKT0rZAY9Rz2aeMYWq8tere1WoI7RXnY1AzUc2HjRa3T10zVXfVG
   ST9neIttw3KL0MT8eQgJ8rL5x2urPoSGTj3YNsJAaePxC9WoXkbvp2xBT
   SFJVPPW3IbrJ/kkzrMfIWAZLX5O8umjxwhS3N/UvrScjUX2jvh+9wWmRL
   cK0ye9rUNophIp9JVaXpPtMIpVBi0EMJtEb5RA8jijlDIlylB6phZecLk
   Hkp1dFR+8StI0E2++l3VuhtkcRGfmXzNXE8vKds2yxcxHG9sjEIdCVtr4
   Q==;
X-CSE-ConnectionGUID: gkF1iirpR1K6UlyNu2ESPw==
X-CSE-MsgGUID: 4wHI4pGVQQiEPtT/z5+Frw==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29794861"
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="29794861"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 15:09:33 -0700
X-CSE-ConnectionGUID: GDUAF1ttRI+CJtjU74iL8g==
X-CSE-MsgGUID: utm5zqG5THG5iMxZlWeleg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="85010070"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Oct 2024 15:09:32 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4SUr-000Ywy-39;
	Fri, 25 Oct 2024 22:09:29 +0000
Date: Sat, 26 Oct 2024 06:08:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: sound/soc/codecs/snd-soc-rt5640.o: warning: objtool:
 rt5640_probe+0x12d: can't find switch jump table
Message-ID: <202410260642.LUlx2rP1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Breno Leitao <leitao@debian.org>
CC: Ingo Molnar <mingo@kernel.org>
CC: Ariel Miculas <amiculas@cisco.com>

Hi Breno,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c71f8fb4dc911022748a378b16aad1cc9b43aad8
commit: aefb2f2e619b6c334bcb31de830aa00ba0b11129 x86/bugs: Rename CONFIG_RETPOLINE            => CONFIG_MITIGATION_RETPOLINE
date:   10 months ago
config: x86_64-buildonly-randconfig-005-20241026 (https://download.01.org/0day-ci/archive/20241026/202410260642.LUlx2rP1-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260642.LUlx2rP1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260642.LUlx2rP1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/snd-soc-rt5640.o: warning: objtool: rt5640_probe+0x12d: can't find switch jump table

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
