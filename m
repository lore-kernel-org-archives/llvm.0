Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29590401A23;
	Fri, 15 May 2026 08:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778834403; cv=none; b=RjNPLUcXwMksaRTTaNTfyDcVhzdWxymSG+xGO9MYCKihavTys5CE0Ebvf4Zp8grPCbMz+cCKFT+gVxsfUhgoOF+iVXisoNmhlNNslUgZxMDPDZxfvYeqJk2BhLeru+NVTTykyR/hdoVNANfmGm2dPfL+RfGlYWQwRgw3HFSE7cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778834403; c=relaxed/simple;
	bh=sGKXbIZKgyuInS3d5J3QOxp1VpByw84H18wr0ATeCXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MfWWQRM4KSoiigOGiwlGLzCdBVVNjQasfL/FUr0MGgrqQXqhz2uE9lXydr5KhXsof9ah4J6fMvQVdc4LtdJdqb7h7AKOB4sjev3kHByQJdt2XPQuZ/ZrA6mWm9ZyXMIs+OLlzoli2ZZgthBbo3c2ZQnPPfACdUJ0O8txzpOqx+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mrILbTk+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mrILbTk+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778834401; x=1810370401;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sGKXbIZKgyuInS3d5J3QOxp1VpByw84H18wr0ATeCXk=;
  b=mrILbTk+8Y81KeWhb4b+rT9qlSp9hp1cguxciNpyhVebMjAxGoun8IaU
   m/WhrIJwaX3pnGMVgVp4cOJTteNX5YWzV8TnU/43FMtMyMxAUkM35mahY
   oqMMfRRxlL+BOuc4l+0C7L5+lJmMRb42I3FLldyHpxZYofQ0azJtNP0dg
   Fa8FJWRqB3Ej0k6aFKY1q6pwm3YyWRzoOVK7Q8pbTph7uR8zmraqalW9c
   kh+pB8O1IO140ZYhIdY73bA8pTdrDq9ZU6gf5Ri74vWCpeyYGAGhTd+5B
   OaO6gH8KJlF06atXR4XR++NABSalR58iyBYEIG8icydAMSnp2vJ4N1fWc
   A==;
X-CSE-ConnectionGUID: /jHRjQawRhCkFpDPwDreAw==
X-CSE-MsgGUID: 7ECWAAwXSXWlabFycrsDHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="83401752"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="83401752"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 01:40:01 -0700
X-CSE-ConnectionGUID: ftFTCVoxQJ+g6bBWZv2KAQ==
X-CSE-MsgGUID: mGuxFZz/RsSrGOTFyA+qLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="276725515"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 May 2026 01:39:17 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNo4f-000000001C9-3NpQ;
	Fri, 15 May 2026 08:39:13 +0000
Date: Fri, 15 May 2026 16:32:09 +0800
From: kernel test robot <lkp@intel.com>
To: Sicong Huang <congei42@163.com>, fei1.li@intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	acrn-dev@lists.projectacrn.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, Sicong Huang <congei42@163.com>
Subject: Re: [PATCH v1] virt: acrn: Fix irqfd use-after-free during async
 shutdown
Message-ID: <202605151636.lR13SqEN-lkp@intel.com>
References: <20260511135737.2285411-1-congei42@163.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511135737.2285411-1-congei42@163.com>

Hi Sicong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sicong-Huang/virt-acrn-Fix-irqfd-use-after-free-during-async-shutdown/20260515-063914
base:   linus/master
patch link:    https://lore.kernel.org/r/20260511135737.2285411-1-congei42%40163.com
patch subject: [PATCH v1] virt: acrn: Fix irqfd use-after-free during async shutdown
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260515/202605151636.lR13SqEN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605151636.lR13SqEN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605151636.lR13SqEN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/acrn/irqfd.c:232:28: warning: unused variable 'next' [-Wunused-variable]
     232 |         struct hsm_irqfd *irqfd, *next;
         |                                   ^~~~
   1 warning generated.


vim +/next +232 drivers/virt/acrn/irqfd.c

aa3b483ff1d71c5 Shuo Liu 2021-02-07  229  
aa3b483ff1d71c5 Shuo Liu 2021-02-07  230  void acrn_irqfd_deinit(struct acrn_vm *vm)
aa3b483ff1d71c5 Shuo Liu 2021-02-07  231  {
aa3b483ff1d71c5 Shuo Liu 2021-02-07 @232  	struct hsm_irqfd *irqfd, *next;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
