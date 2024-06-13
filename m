Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6548174C;
	Thu, 13 Jun 2024 09:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718269732; cv=none; b=DfIqSWXx8J+KSebo5bhIAjWmph95t6Qr8cxfvL6Iaaq838qEEG1e63ZhFkrOpl7M6JCxUlLg22r3HFyI0RDOL9XUhxqs23s1c6MxsffDlzEStM9IjXS9CrwmsvpSpk0n+K17kYuY6xCMSRzzJVFB1EQSQZHifoP92S/oJrglD8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718269732; c=relaxed/simple;
	bh=zMyaHHimo6OvjtFb9RYOmPDvcnFDV8ay23PM9meInmI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C/BLdjR6Bnu7g85/FYplRjfs0MPHzUNYZuHadYRPi8oDr64LFPMYcEc53nIv2/VpTMf7XcAYNmVPHGIsD8T+sCWRLSRvcYDCfZtXftEFqOsWtcRDUzNsVcrK3lqM4ZfDtUhWCtoucDGL7Kx3TI5J7hZIsD6MMiqHuWi2v7wUDc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=naPECKQR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="naPECKQR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718269731; x=1749805731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zMyaHHimo6OvjtFb9RYOmPDvcnFDV8ay23PM9meInmI=;
  b=naPECKQRI6g/3n+s7jAOHN0U0ITWbvlD9M+sO5fI4T9hTboBl9qXIG6W
   A833WIsRCyGsxGwZkF6b0uJOmVRVv0gRNafnLfOJxRQmTyqtUTRgGcTRZ
   jWVsOe5tTDZ/bAuoJhrlVOzHptc/evZUqFt5Gl1SSwvA2xdpScYcGJEX4
   GgHODzkeEotZWbJVp3n6GsAdJDYUlXDe+BbQOoD87kPZjLox1vhO1ZYBY
   PcmpthgLUIjKhIVcnLaBUrh6AVTMtNFncqvaMBId2n2eOSo/t5H11vzyN
   WB7eBb3KkUazXK5cwS7yxELiirp4rBhAqy8an+EvmVuW+gP/wpm240Fw2
   w==;
X-CSE-ConnectionGUID: vstYLl51SFOS8u+KeuaGFA==
X-CSE-MsgGUID: kf47oeWkRTO3pQ3aDBc9Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15201472"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="15201472"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 02:08:50 -0700
X-CSE-ConnectionGUID: n2Zi160rSOaNNMr1MU1ucQ==
X-CSE-MsgGUID: FCT4D8H7RrWMYujVDHlHGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="71282019"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jun 2024 02:08:47 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHgRp-0002Qu-1P;
	Thu, 13 Jun 2024 09:08:45 +0000
Date: Thu, 13 Jun 2024 17:08:05 +0800
From: kernel test robot <lkp@intel.com>
To: GUO Zihua <guozihua@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Paul Moore <paul@paul-moore.com>, Mimi Zohar <zohar@linux.ibm.com>,
	Casey Schaufler <casey@schaufler-ca.com>
Subject: [linux-next:master 5295/5501]
 security/integrity/ima/ima_policy.c:430:10: error: too many arguments to
 function call, expected 4, have 5
Message-ID: <202406131636.cCrcJztc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6906a84c482f098d31486df8dc98cead21cce2d0
commit: 29f5bedff494c278af5f804ebfe0637c5f50f3bd [5295/5501] ima: Avoid blocking in RCU read-side critical section
config: i386-buildonly-randconfig-004-20240613 (https://download.01.org/0day-ci/archive/20240613/202406131636.cCrcJztc-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406131636.cCrcJztc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406131636.cCrcJztc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> security/integrity/ima/ima_policy.c:430:10: error: too many arguments to function call, expected 4, have 5
     427 |                 ima_filter_rule_init(nentry->lsm[i].type, Audit_equal,
         |                 ~~~~~~~~~~~~~~~~~~~~
     428 |                                      nentry->lsm[i].args_p,
     429 |                                      &nentry->lsm[i].rule,
     430 |                                      gfp);
         |                                      ^~~
   security/integrity/ima/ima.h:548:19: note: 'ima_filter_rule_init' declared here
     548 | static inline int ima_filter_rule_init(u32 field, u32 op, char *rulestr,
         |                   ^                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     549 |                                        void **lsmrule)
         |                                        ~~~~~~~~~~~~~~
   security/integrity/ima/ima_policy.c:1146:11: error: too many arguments to function call, expected 4, have 5
    1143 |         result = ima_filter_rule_init(entry->lsm[lsm_rule].type, Audit_equal,
         |                  ~~~~~~~~~~~~~~~~~~~~
    1144 |                                       entry->lsm[lsm_rule].args_p,
    1145 |                                       &entry->lsm[lsm_rule].rule,
    1146 |                                       GFP_KERNEL);
         |                                       ^~~~~~~~~~
   include/linux/gfp_types.h:374:20: note: expanded from macro 'GFP_KERNEL'
     374 | #define GFP_KERNEL      (__GFP_RECLAIM | __GFP_IO | __GFP_FS)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima.h:548:19: note: 'ima_filter_rule_init' declared here
     548 | static inline int ima_filter_rule_init(u32 field, u32 op, char *rulestr,
         |                   ^                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     549 |                                        void **lsmrule)
         |                                        ~~~~~~~~~~~~~~
   2 errors generated.


vim +430 security/integrity/ima/ima_policy.c

   403	
   404	static struct ima_rule_entry *ima_lsm_copy_rule(struct ima_rule_entry *entry,
   405							gfp_t gfp)
   406	{
   407		struct ima_rule_entry *nentry;
   408		int i;
   409	
   410		/*
   411		 * Immutable elements are copied over as pointers and data; only
   412		 * lsm rules can change
   413		 */
   414		nentry = kmemdup(entry, sizeof(*nentry), gfp);
   415		if (!nentry)
   416			return NULL;
   417	
   418		memset(nentry->lsm, 0, sizeof_field(struct ima_rule_entry, lsm));
   419	
   420		for (i = 0; i < MAX_LSM_RULES; i++) {
   421			if (!entry->lsm[i].args_p)
   422				continue;
   423	
   424			nentry->lsm[i].type = entry->lsm[i].type;
   425			nentry->lsm[i].args_p = entry->lsm[i].args_p;
   426	
   427			ima_filter_rule_init(nentry->lsm[i].type, Audit_equal,
   428					     nentry->lsm[i].args_p,
   429					     &nentry->lsm[i].rule,
 > 430					     gfp);
   431			if (!nentry->lsm[i].rule)
   432				pr_warn("rule for LSM \'%s\' is undefined\n",
   433					nentry->lsm[i].args_p);
   434		}
   435		return nentry;
   436	}
   437	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
