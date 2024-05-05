Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8775623A8;
	Sun,  5 May 2024 06:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714891253; cv=none; b=tm8URqp+ER69pN3IUUE1+sL/dOA+nxNvUh49GYx+O1yf14uJmrHLA48ieXm6KJ8P1TAG1EahUbpqLz5gTZI0VWB+jP2ZN9+vVNoZsms7HibJfutKJd6u9wvBClGDAZ7Qq9ckAdT3xW+K5lSXXbBo2pnPfCKLrvEQ2wK6ofZ47U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714891253; c=relaxed/simple;
	bh=Xcc8RhRLk28gQ6j0i9uRyr552BLs964LoGEhz9ue+R4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2f2WIngg5io83IAPjkXAp/fRU+IDlK324W4ftxRmovAtDxQUWKlHsvruIFF+8MxWYSu5LeKwCnrm491Cyh7Oez34mzCEQYrmHAG5oOeli8ug6XgFuQiqEbipsv268yLXSnCr12igkeJk3GttZtXALF722oX3tDe9vP2e7f+aAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ae0Sh6v+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ae0Sh6v+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714891252; x=1746427252;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xcc8RhRLk28gQ6j0i9uRyr552BLs964LoGEhz9ue+R4=;
  b=ae0Sh6v+ouBKdJGcbIrpw+SvJpwFy1QNT93blcTZydyRzlAx3qvkBgXz
   +zH9e3E0Ss1EINkzsCvrLgE3HGYLMsAljPb9l85ick48wPCJkkTxN17Bz
   pl74w7RLpw2twz/Rvf6ZVTxp+nkXksCLhWTx9+ddOjxWfinRD4LSUvQP9
   FqOtSm01uUtLuYoNTLGUqhkvimeOTdjX5maBRftL271/A9JD3BFt4CLHG
   zE0m/6zJ7g3q9+4q++McjPz8nnGiP0gTxIlpCcIXo2wqIlmJeHJ4CI5fa
   JRtQ/vlqvnvZdZUZA4O3UpgK0RyMzpIg0qhPAWoC54qyTwhb742ndJL3m
   g==;
X-CSE-ConnectionGUID: rpoKFMdJT8ChAfC63CtrHg==
X-CSE-MsgGUID: tBBTXwHoRs2XyCpRUwegmA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="13597877"
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; 
   d="scan'208";a="13597877"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 23:40:51 -0700
X-CSE-ConnectionGUID: yyMr83WxTxSnp4b/7SdlIg==
X-CSE-MsgGUID: XDf+GOiNTQ21gBixMBSDGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; 
   d="scan'208";a="65288782"
Received: from lkp-server01.sh.intel.com (HELO 123fad1cf874) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 May 2024 23:40:49 -0700
Received: from kbuild by 123fad1cf874 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3VYF-000020-0J;
	Sun, 05 May 2024 06:40:47 +0000
Date: Sun, 5 May 2024 14:39:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] platform/x86/intel/ifs: Initialize AMX state for the
 scan test
Message-ID: <202405051417.5CWuLrhT-lkp@intel.com>
References: <20240430212508.105117-3-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430212508.105117-3-chang.seok.bae@intel.com>

Hi Chang,

kernel test robot noticed the following build errors:

[auto build test ERROR on e67572cd2204894179d89bd7b984072f19313b03]

url:    https://github.com/intel-lab-lkp/linux/commits/Chang-S-Bae/x86-fpu-Extend-kernel_fpu_begin_mask-to-initialize-AMX-state/20240501-054234
base:   e67572cd2204894179d89bd7b984072f19313b03
patch link:    https://lore.kernel.org/r/20240430212508.105117-3-chang.seok.bae%40intel.com
patch subject: [PATCH 2/2] platform/x86/intel/ifs: Initialize AMX state for the scan test
config: x86_64-buildonly-randconfig-004-20240505 (https://download.01.org/0day-ci/archive/20240505/202405051417.5CWuLrhT-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405051417.5CWuLrhT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405051417.5CWuLrhT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/platform/x86/intel/ifs/load.c:9:
>> drivers/platform/x86/intel/ifs/ifs.h:334:2: error: call to undeclared function 'kernel_fpu_begin_mask'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     334 |         kernel_fpu_begin_mask(KFPU_AMX);
         |         ^
>> drivers/platform/x86/intel/ifs/ifs.h:334:24: error: use of undeclared identifier 'KFPU_AMX'
     334 |         kernel_fpu_begin_mask(KFPU_AMX);
         |                               ^
>> drivers/platform/x86/intel/ifs/ifs.h:339:2: error: call to undeclared function 'kernel_fpu_end'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     339 |         kernel_fpu_end();
         |         ^
   3 errors generated.


vim +/kernel_fpu_begin_mask +334 drivers/platform/x86/intel/ifs/ifs.h

   327	
   328	static inline void ifs_fpu_begin(void)
   329	{
   330		/*
   331		 * The AMX state must be initialized prior to executing In-Field
   332		 * Scan tests, according to Intel SDM.
   333		 */
 > 334		kernel_fpu_begin_mask(KFPU_AMX);
   335	}
   336	
   337	static inline void ifs_fpu_end(void)
   338	{
 > 339		kernel_fpu_end();
   340	}
   341	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
