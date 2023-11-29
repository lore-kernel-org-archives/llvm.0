Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD7D6FA6;
	Wed, 29 Nov 2023 07:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eISU9fYo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701244219; x=1732780219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2G9qbUBL+xAwO6LkMF5omkuoL5W23fwkosqkSDei0TA=;
  b=eISU9fYor+W6edb6TN6SBquKbVd++ri5VF4UquOPLiLQnyuYrTzcXLwo
   p2cPLJCg84Z9i4YiTzzm4F/i5BeqX9kyLApJtjtkCrBMslXq9qQHPGhHK
   g8uvVveLxDDQIjIm8fu3ysYldnAb0kYc0s5cI67vyovg9nZlV1x7VLOA4
   fiycQWoPO8VdVRQ6AC+aVs6b22W/IpP2JKXci0UV4dqces8jjueZSzBE2
   WamlUqcPk81VbCE/JVM7A39c/4w1hrWodOidJjkT7ceus3K1BEi5ivw1K
   daq/qSIeifldOzhS71QeyMTdUgVbmMI61OSKhiAoE08XLFZuN18JXsVcQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="6385850"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="6385850"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 23:50:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="772596888"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="772596888"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 28 Nov 2023 23:50:16 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8FKo-0008kK-2H;
	Wed, 29 Nov 2023 07:50:14 +0000
Date: Wed, 29 Nov 2023 15:49:05 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-max-aggregation 9/11]
 kernel/sched/core.c:1410:1: warning: no previous prototype for function
 'update_uclamp_req'
Message-ID: <202311291206.KWdbUM6g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux uclamp-max-aggregation
head:   eb0c51750b3bf5ac41d3f628fd05e22a5426a759
commit: 1184db07bd011cf19005485e643f767d12c33184 [9/11] sched/uclamp: Remove rq max aggregation
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20231129/202311291206.KWdbUM6g-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231129/202311291206.KWdbUM6g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311291206.KWdbUM6g-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/core.c:1410:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   update_uclamp_req(struct task_struct *p, enum uclamp_id clamp_id,
   ^
   int
   kernel/sched/core.c:1413:16: error: passing 'struct uclamp_se' to parameter of incompatible type 'struct uclamp_se *'; take the address with &
           uclamp_se_set(p->uclamp_req[clamp_id], value, user_defined);
                         ^~~~~~~~~~~~~~~~~~~~~~~
                         &
   kernel/sched/core.c:1402:52: note: passing argument to parameter 'uc_se' here
   static inline void uclamp_se_set(struct uclamp_se *uc_se,
                                                      ^
   kernel/sched/core.c:1414:37: error: call to undeclared function 'uclamp_eff_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           uclamp_se_set(p->uclamp[clamp_id], uclamp_eff_get(p, clamp_id), user_defined);
                                              ^
   kernel/sched/core.c:1414:37: note: did you mean 'uclamp_se_set'?
   kernel/sched/core.c:1402:20: note: 'uclamp_se_set' declared here
   static inline void uclamp_se_set(struct uclamp_se *uc_se,
                      ^
   kernel/sched/core.c:1414:16: error: passing 'struct uclamp_se' to parameter of incompatible type 'struct uclamp_se *'; take the address with &
           uclamp_se_set(p->uclamp[clamp_id], uclamp_eff_get(p, clamp_id), user_defined);
                         ^~~~~~~~~~~~~~~~~~~
                         &
   kernel/sched/core.c:1402:52: note: passing argument to parameter 'uc_se' here
   static inline void uclamp_se_set(struct uclamp_se *uc_se,
                                                      ^
>> kernel/sched/core.c:1410:1: warning: no previous prototype for function 'update_uclamp_req' [-Wmissing-prototypes]
   update_uclamp_req(struct task_struct *p, enum uclamp_id clamp_id,
   ^
   kernel/sched/core.c:1410:18: note: declare 'static' if the function is not intended to be used outside of this translation unit
   update_uclamp_req(struct task_struct *p, enum uclamp_id clamp_id,
                    ^
                    static 
   kernel/sched/core.c:1480:1: error: static declaration of 'uclamp_eff_get' follows non-static declaration
   uclamp_eff_get(struct task_struct *p, enum uclamp_id clamp_id)
   ^
   kernel/sched/core.c:1414:37: note: previous implicit declaration is here
           uclamp_se_set(p->uclamp[clamp_id], uclamp_eff_get(p, clamp_id), user_defined);
                                              ^
   1 warning and 5 errors generated.


vim +/update_uclamp_req +1410 kernel/sched/core.c

  1408	
  1409	/* Update p->uclamp_req and effective p->uclamp in one go */
> 1410	update_uclamp_req(struct task_struct *p, enum uclamp_id clamp_id,
  1411			  unsigned int value, bool user_defined)
  1412	{
  1413		uclamp_se_set(p->uclamp_req[clamp_id], value, user_defined);
  1414		uclamp_se_set(p->uclamp[clamp_id], uclamp_eff_get(p, clamp_id), user_defined);
  1415	}
  1416	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
