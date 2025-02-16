Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A091758B;
	Sun, 16 Feb 2025 04:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739681903; cv=none; b=iFLkc+ez1SHYcE1wCcATDlF3D5fbQt7FU3KqUp/v7g6IShnrl3b3ckdJySZ6yxEZEUVlQ035//Iw9gRQkEFGyRnRHAgpg3Q45BoX2ef8QJYjpwNH25eaBZvw0zSeu57pw/FBSGL7OcCke4k6GRQ7GWQjZ/JV8CR5ydxd3shHSCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739681903; c=relaxed/simple;
	bh=jzaDLNyoUwMWP/UmIFEQ2jOk0GEFuhtSFzPrA838f3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=co47vqHcr9F1bLSAixWmBk31uboi7NHkJtjAby190PjrTIn22yWRruHyrLQ5ZImvaVnIei8iXAkSWKdqOJ5hn7u9H8zKdjC/dcC3JO+QTn88DuxIys1slXBVjuN0vb6SCDn5UjbV/BJtvs0V0Ljzi0HQAvIGQBp7S+9NIY7C9wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GSl7QU68; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSl7QU68"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739681902; x=1771217902;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jzaDLNyoUwMWP/UmIFEQ2jOk0GEFuhtSFzPrA838f3o=;
  b=GSl7QU682wwv/TfHxacY/tLjsnuYUXNTra/pqrgAWuzBLc/PrC1YOyaM
   Cl+00s7BWBme47HVpZ+uGK68txNJ8YbXcgsWscrIjccGvLJ6gU5gz66st
   d7V7TmKnHZNgGzcJmw1Rbs44MxbTs2Rok72Z6p95LrTij4igCdi72tpkd
   zJjYc8VblSmqOSavQsT/Ee1Zss0iQVGPlKDO0NtmCLOxIikUlP32bIAa3
   Dhq+j15bjv6JbW97j3EF9EvnM1oupbtte8LvMJ5NPAF0wDUdigoePiwlx
   6KessCGbIqPXhF7tAxZAkQIVZFG1ZlzE983bWIeXbUrYuP+GF/th/SCd9
   g==;
X-CSE-ConnectionGUID: 0fYH1qhOQ4SSgA+FBVhaiQ==
X-CSE-MsgGUID: HnU3PMWiQi2Mb1+zuFZObQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="40248907"
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; 
   d="scan'208";a="40248907"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 20:58:22 -0800
X-CSE-ConnectionGUID: xE9YVpeXSr6F8+Qt5bKmMg==
X-CSE-MsgGUID: xpfzUoOyQpmfaIPgFhZ7hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; 
   d="scan'208";a="144674023"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Feb 2025 20:58:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjWjS-001BaJ-0R;
	Sun, 16 Feb 2025 04:58:18 +0000
Date: Sun, 16 Feb 2025 12:57:53 +0800
From: kernel test robot <lkp@intel.com>
To: Vedang Nagar <quic_vnagar@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/2] media: venus: fix OOB access issue while reading
 sequence changed events
Message-ID: <202502161251.lBVyP1dc-lkp@intel.com>
References: <20250215-venus-security-fixes-v2-2-cfc7e4b87168@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250215-venus-security-fixes-v2-2-cfc7e4b87168@quicinc.com>

Hi Vedang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 91e71d606356e50f238d7a87aacdee4abc427f07]

url:    https://github.com/intel-lab-lkp/linux/commits/Vedang-Nagar/media-venus-fix-OOB-read-issue-due-to-double-read/20250216-012213
base:   91e71d606356e50f238d7a87aacdee4abc427f07
patch link:    https://lore.kernel.org/r/20250215-venus-security-fixes-v2-2-cfc7e4b87168%40quicinc.com
patch subject: [PATCH v2 2/2] media: venus: fix OOB access issue while reading sequence changed events
config: s390-randconfig-002-20250216 (https://download.01.org/0day-ci/archive/20250216/202502161251.lBVyP1dc-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250216/202502161251.lBVyP1dc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502161251.lBVyP1dc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/qcom/venus/hfi_msgs.c:22:42: warning: parameter 'data_ptr' set but not used [-Wunused-but-set-parameter]
      22 | static inline int increment_data_ptr(u8 *data_ptr, u32 *rem_bytes)
         |                                          ^
   1 warning generated.


vim +/data_ptr +22 drivers/media/platform/qcom/venus/hfi_msgs.c

    21	
  > 22	static inline int increment_data_ptr(u8 *data_ptr, u32 *rem_bytes)
    23	{
    24		if (*rem_bytes < sizeof(u32))
    25			return -EINVAL;
    26		data_ptr += sizeof(u32);
    27		*rem_bytes -= sizeof(u32);
    28	
    29		return 0;
    30	}
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
