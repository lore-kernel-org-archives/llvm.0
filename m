Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783EC18021;
	Wed, 14 Feb 2024 10:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707906470; cv=none; b=rYElb76qaXThd0e8HbitZekQTs+FOhD9OFK9eUhl0nVxOfhYEJh51Uevc0SxBsndOsj/TYQVIXInN5V1pwC8gy3NhNvhTc4dUY3spdrR1Bsyd+sCNRQtB7atjjAvyYNHLmzejxd5+8RcDFKfVg7/UTLVey9jXGulkcnVSrc7wYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707906470; c=relaxed/simple;
	bh=NXAlRxIjjtwOK3LHN5YfrN2FbyMPx+YGMmGt8mi0p2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uV/iADrjhZo/PDLMUOxt2KGtbUIht1Xnj0YcYtESu6uozDJB1/XlL5+61fVW8KMd4zZrpAlhE/22o8gKmMx+kE5Wiu5uqBsfkLBql6JDcQLUhz22APCW8u0rfIZAQkyRx11OyvArbcmjU5du9l7doEIQVZsn8+GpM7Z9SyhTuYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hPosFcFg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hPosFcFg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707906469; x=1739442469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NXAlRxIjjtwOK3LHN5YfrN2FbyMPx+YGMmGt8mi0p2g=;
  b=hPosFcFgWyud0TjMkxOpnaa4PCfFAckCVFIpXuG1xMoXKTsibw/CsW6P
   1/dmdODaPc+9/ttUm6uvp/vQ8//43KPZuxcPuSxScsON6w0Bem1C9qRWR
   Ji0dWote/krc6RNxsOYRTDshzxxaqsEyI07nXzCAyhgDt5W4HzXooeMfO
   iZXUvjMM8zhksD2lrVYNDQif63oQMzD+AlyoxaP3PaJ1OPTodhqpEdIXR
   YV6oUaK++P6yHsLcLmxZHJKjnXtoevqtOTyIs4d1OYrPwXCIXzDtU4VfT
   1VZzMsJLXo4l7fgKTrn/zxKrTIN9EfM0tdoaV6Ufdq2u3F8LpYtpkk93S
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1812577"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="1812577"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 02:27:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3313512"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Feb 2024 02:27:46 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raCUS-0008fw-1w;
	Wed, 14 Feb 2024 10:27:44 +0000
Date: Wed, 14 Feb 2024 18:26:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:dlserver-feb-fixes 1/9] kernel/sched/fair.c:8535:9: error:
 call to undeclared function 'pick_task_fair'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202402141843.yLu0T1sy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git dlserver-feb-fixes
head:   a81d7e41130fa46e91bde4dd820f673250934286
commit: 60503246d2cf0d7b91d18325cb21c24c13f1d40d [1/9] sched/core: Add clearing of ->dl_server in put_prev_task_balance()
config: arm-randconfig-001-20240214 (https://download.01.org/0day-ci/archive/20240214/202402141843.yLu0T1sy-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project c08b90c50bcac9f3f563c79491c8dbcbe7c3b574)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402141843.yLu0T1sy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402141843.yLu0T1sy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:8535:9: error: call to undeclared function 'pick_task_fair'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    8535 |         return pick_task_fair(dl_se->rq);
         |                ^
>> kernel/sched/fair.c:8535:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct task_struct *' [-Wint-conversion]
    8535 |         return pick_task_fair(dl_se->rq);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/pick_task_fair +8535 kernel/sched/fair.c

  8532	
  8533	static struct task_struct *fair_server_pick_task(struct sched_dl_entity *dl_se)
  8534	{
> 8535		return pick_task_fair(dl_se->rq);
  8536	}
  8537	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
