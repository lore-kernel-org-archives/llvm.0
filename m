Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E1C4690;
	Sat,  1 Feb 2025 03:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738378985; cv=none; b=D3yhIxzLKLNjo2i/FgW2dCK9t5BLMW9Xl9mPdv2a0HMawmnEDu/EyJ6GWJ3AV63zteM5dLoiQC1eiBlOOoHrsyiWZstd3g0x8aHldRHS3oPZJ/vxXDA2OPLKAmo3g9Vt34ay0PSyfByFE9iTrKv37ovSMjGMlx6D9Ypo0Ngfp5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738378985; c=relaxed/simple;
	bh=+5nYmRsm5TUPidVZbI5cEfKCcO/LTnvNAslNDVI31BM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uhu3C/vtDXL++LeQoaBSnHGztxw4mdLzM55bXQ2NaXn5Lb09p2qoFegJJp8cMAH5FGoXaqbBigbMoHk+HHrgPfv/QAGhfsSEzb6wUGs9N8bxj2FIgdj5KY64vHGDv+kE9tcLpQnoMIJyo7cynRdALd5jEftA8jEMVNROFhl2ajU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n2wqAz/B; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n2wqAz/B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738378983; x=1769914983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+5nYmRsm5TUPidVZbI5cEfKCcO/LTnvNAslNDVI31BM=;
  b=n2wqAz/BXBXXTun/Rl6oktIPBteah6RlQenXJ/SfKMKcubZ61IHJNBKV
   +M6CNtnCbcY+cGRN72lQH2GKrDQ3EctcSCWXP8MzJyi0/hEsn0HbEkg/z
   rvM89Hyr2jgckXOC/dpHe/C00ExgITffcM+GIkw7OqJ3Qeqpc/GI1Ii4Y
   Uq7V8JDFYDO2/DAx/ARaPxw+EFcGaL9H9qkHK7JeiXEWXvC3MGrzuZmGD
   sWT3+RPkqR0lso8zxReJIotDFbSE+voV+6kEjjBjJxzY59L+p2ZBKUgXG
   nZ4qoRjLLNfdNac7tmho56AUp2wPyn6cF/m8MSwMz1EZLZSLkGO3Y9aJ+
   g==;
X-CSE-ConnectionGUID: sQKVHNdiTWOvxrR7c7SmiA==
X-CSE-MsgGUID: O8s8rva5RD+F9qVRcWkoxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="39093510"
X-IronPort-AV: E=Sophos;i="6.13,250,1732608000"; 
   d="scan'208";a="39093510"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 19:03:02 -0800
X-CSE-ConnectionGUID: jwSdp+meRJGo6RUzV/aImA==
X-CSE-MsgGUID: wYRxMMMfQ8CviUuCef0gcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110237887"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 Jan 2025 19:03:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1te3mc-000neN-0w;
	Sat, 01 Feb 2025 03:02:58 +0000
Date: Sat, 1 Feb 2025 11:02:13 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 15/24] landlock: Log scoped denials
Message-ID: <202502011045.pZMKNT2k-lkp@intel.com>
References: <20250131163059.1139617-16-mic@digikod.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250131163059.1139617-16-mic@digikod.net>

Hi Mickaël,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 69e858e0b8b2ea07759e995aa383e8780d9d140c]

url:    https://github.com/intel-lab-lkp/linux/commits/Micka-l-Sala-n/lsm-Add-audit_log_lsm_data-helper/20250201-004434
base:   69e858e0b8b2ea07759e995aa383e8780d9d140c
patch link:    https://lore.kernel.org/r/20250131163059.1139617-16-mic%40digikod.net
patch subject: [PATCH v5 15/24] landlock: Log scoped denials
config: powerpc-randconfig-001-20250201 (https://download.01.org/0day-ci/archive/20250201/202502011045.pZMKNT2k-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502011045.pZMKNT2k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502011045.pZMKNT2k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/landlock/task.c:414:28: warning: variable 'handle_layer' is uninitialized when used here [-Wuninitialized]
     414 |                 request.layer_plus_one = handle_layer + 1;
         |                                          ^~~~~~~~~~~~
   security/landlock/task.c:382:21: note: initialize the variable 'handle_layer' to silence this warning
     382 |         size_t handle_layer;
         |                            ^
         |                             = 0
   1 warning generated.


vim +/handle_layer +414 security/landlock/task.c

   378	
   379	static int hook_file_send_sigiotask(struct task_struct *tsk,
   380					    struct fown_struct *fown, int signum)
   381	{
   382		size_t handle_layer;
   383		const struct landlock_cred_security *subject;
   384		struct landlock_request request = {
   385			.type = LANDLOCK_REQUEST_SCOPE_SIGNAL,
   386			.audit = {
   387				.type = LSM_AUDIT_DATA_TASK,
   388				.u.tsk = tsk,
   389			},
   390		};
   391		bool is_scoped = false;
   392	
   393		/* Lock already held by send_sigio() and send_sigurg(). */
   394		lockdep_assert_held(&fown->lock);
   395		subject = &landlock_file(fown->file)->fown_subject;
   396	
   397		/*
   398		 * Quick return for unowned socket.
   399		 *
   400		 * subject->domain has already been filtered when saved by
   401		 * hook_file_set_fowner(), so there is no need to call
   402		 * landlock_get_applicable_subject() here.
   403		 */
   404		if (!subject->domain)
   405			return 0;
   406	
   407		scoped_guard(rcu)
   408		{
   409			is_scoped = domain_is_scoped(subject->domain,
   410						     landlock_get_task_domain(tsk),
   411						     signal_scope.scope);
   412		}
   413		if (is_scoped) {
 > 414			request.layer_plus_one = handle_layer + 1;
   415			landlock_log_denial(subject, &request);
   416			return -EPERM;
   417		}
   418	
   419		return 0;
   420	}
   421	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
