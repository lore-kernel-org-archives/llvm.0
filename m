Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6013D2517AC;
	Wed, 29 Apr 2026 19:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777490264; cv=none; b=ooMmjZFn3oOQsFBSLU/Rg1/w4hAn92m956g93xYVIeYVDrF2TiFLwk6god1vSRIOZslK8nWabEfp15VX0yQF7It0RPEmRGd2sVI25ld4ZN3IRiT/QL6ZWSXlGaPt4VRQ/q7eU1Xg5+AFUpt5f/TIq86DO88/B+lrIqbnQRua3dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777490264; c=relaxed/simple;
	bh=rTZAIBvunTW1fAPURLqqqiKt4vHRSEWdkf5OIEvSRCs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XFx4zjYTcQtqLcYRKOxTPHYL21aC+Y+TVbbMeU9ZQLJMz4hMsN7AUJ53Hez+R6YKHblJ73DA/mxLWkTiuNpy/TR22Gr/wZSuesdUltOzElQTzD2oIcNpCytdc7TWqURiFH9JsHMPctoPp6+X66KT7jekZty97alM46ZDZkCH8iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NdbRSSdH; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NdbRSSdH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777490263; x=1809026263;
  h=date:from:to:cc:subject:message-id;
  bh=rTZAIBvunTW1fAPURLqqqiKt4vHRSEWdkf5OIEvSRCs=;
  b=NdbRSSdHiSfrXTP8UG+fDtiiAYc9bXrqOi9KtN6Rz8hYWMe1P0sCLI4o
   pKgcLhQ68/HCK6HS2SnLDvAJaVaz3EtCqAxHIBJIj0oOfs/N/MAqmoVri
   JRYSsXlz+/ZJWoL0+l3vHX2PBgMy/fKjy3t/meLyslFC1CriO7I5SIsyU
   /yrCZL6uKsjb/7K/3GEGYWoyn2Rb8Vqf5zS5zlLWSiCfNts0lUgX0KIaN
   3HdVQI+eVRxKBUuhnv6R+ryiWW5kviKbe12Ou00aFmoKDrwClO2wq5ELP
   EAIDII4teDdoPnlBS6d+LyxvjzcQ3JFNqr4RCHVzJQW/6Fi8dFDkxFwv5
   Q==;
X-CSE-ConnectionGUID: LoavNQjYSb6iSjtyehDy4Q==
X-CSE-MsgGUID: XUh5MnY+TPShpgzw7/DkGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="88740394"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="88740394"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 12:17:43 -0700
X-CSE-ConnectionGUID: GHXMg9b3Rayxy/hRFeEx0g==
X-CSE-MsgGUID: +DOsaoyqRlO2b+mLayM+hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="238684547"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Apr 2026 12:17:41 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIAPi-00000000BRm-320V;
	Wed, 29 Apr 2026 19:17:38 +0000
Date: Thu, 30 Apr 2026 03:17:09 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Tejun Heo <tj@kernel.org>
Subject: [tj-wq:for-7.1-fixes 1/1] kernel/workqueue.c:5916:53:
 warning: diagnostic behavior may be improved by adding the 'format(printf, 1,
 0)' attribute to the declaration of 'alloc_workqueue_va'
Message-ID: <202604300347.2LgXyteh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-7.1-fixes
head:   0de4cb473aed57ee4ba7e0551ad27bddc19fc519
commit: 0de4cb473aed57ee4ba7e0551ad27bddc19fc519 [1/1] workqueue: fix devm_alloc_workqueue() va_list misuse
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260430/202604300347.2LgXyteh-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300347.2LgXyteh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300347.2LgXyteh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/workqueue.c:5916:53: warning: diagnostic behavior may be improved by adding the 'format(printf, 1, 0)' attribute to the declaration of 'alloc_workqueue_va' [-Wmissing-format-attribute]
    5909 | static struct workqueue_struct *alloc_workqueue_va(const char *fmt,
         | __attribute__((format(printf, 1, 0))) 
    5910 |                                                    unsigned int flags,
    5911 |                                                    int max_active,
    5912 |                                                    va_list args)
    5913 | {
    5914 |         struct workqueue_struct *wq;
    5915 | 
    5916 |         wq = __alloc_workqueue(fmt, flags, max_active, args);
         |                                                            ^
   kernel/workqueue.c:5909:33: note: 'alloc_workqueue_va' declared here
    5909 | static struct workqueue_struct *alloc_workqueue_va(const char *fmt,
         |                                 ^
   1 warning generated.


vim +5916 kernel/workqueue.c

  5908	
  5909	static struct workqueue_struct *alloc_workqueue_va(const char *fmt,
  5910							   unsigned int flags,
  5911							   int max_active,
  5912							   va_list args)
  5913	{
  5914		struct workqueue_struct *wq;
  5915	
> 5916		wq = __alloc_workqueue(fmt, flags, max_active, args);
  5917		if (wq)
  5918			wq_init_lockdep(wq);
  5919	
  5920		return wq;
  5921	}
  5922	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
