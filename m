Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621A11ACEC6;
	Sat, 18 Jan 2025 22:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737240619; cv=none; b=eC1pOG0YbqyzkqA+RbzFfeHQCoAMIBGftPSnzLoCJbrmOT306x3rFzTEV+H3CdZmV7cBgDFVQUZzuO+Vw+9zTL+Taro8Yfgrxj4lU1GlXCA9TDgZzmZSjiKP6Bmvotq2fnc6Eg+sSbzzwMZMEZtpQ2+qjVchLgHzYmDBGpttc1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737240619; c=relaxed/simple;
	bh=/Tn/OseRQ2QVznJpcAZm7DImbHl8bgDfFtzORSm62Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HzggcvI58aXiorE3G1fsAdLlHK8T4EeDAsa6XRQZNSi/Z3ICVhM21CmqsCdMeRsS09Q509WJv701+SolHODbj9mTWy/bR8tceQpl7lkNdK0x0scK5dT0QYJ0QgYhWqc7u3JwZqFkMutBjt0jg5KDEjIWKnyYisM9QaCNE5eA+Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IJUAWSp3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IJUAWSp3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737240617; x=1768776617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Tn/OseRQ2QVznJpcAZm7DImbHl8bgDfFtzORSm62Ng=;
  b=IJUAWSp3wLvQb1whiQl/T+5QELQoym+fCS+z4JM/cYZ1jSwaBJj/IUuu
   SSazBw5FAmrJvY3wbcvvFffyXjSdsH2lhddChG4xnBmz/lJnSlyGzhDoj
   BPmpPhD5xWciTo1qOkRk255n9U0H+s0AVQ+6Mb7mqx1ZiFzBD9NxPwvgw
   FkO4HN+U+bszILbpAftE0ubKOV/eriUUe/uB2wcL9N150RYvzOMDhNPqy
   26r+HFmo75uvARhf6l5uuxhVgy8RSfTIHiMy1b78f7UJzOOf0aAQ/Emub
   WiDlK3RAaXC+yKkzTZAk/RkMFp3kxTYiuu2I01n5hcgb5Z+7BfwJB6XX5
   A==;
X-CSE-ConnectionGUID: lAO37IacTA2qXDFeuJlBFQ==
X-CSE-MsgGUID: Ui8W9OkaQrySyXlNc/GP3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="48314959"
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="48314959"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 14:50:13 -0800
X-CSE-ConnectionGUID: n97JPR+OR+G+GsWfX44vJw==
X-CSE-MsgGUID: cx4/J6cuSlqZgHYSTn39Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="106302409"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Jan 2025 14:50:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZHdq-000UuC-1d;
	Sat, 18 Jan 2025 22:50:10 +0000
Date: Sun, 19 Jan 2025 06:49:21 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jj-apparmor:apparmor-next 10/19] security/apparmor/file.c:183:
 warning: expecting prototype for aa_lookup_fperms(). Prototype was for
 aa_lookup_condperms() instead
Message-ID: <202501190614.8oxB0ItF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   e6b087676954e36a7b1ed51249362bb499f8c1c2
commit: 2e12c5f060176ede209673e4f63ea5d0e3c5814c [10/19] apparmor: add additional flags to extended permission.
config: i386-buildonly-randconfig-005-20250119 (https://download.01.org/0day-ci/archive/20250119/202501190614.8oxB0ItF-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501190614.8oxB0ItF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501190614.8oxB0ItF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/apparmor/file.c:183: warning: expecting prototype for aa_lookup_fperms(). Prototype was for aa_lookup_condperms() instead


vim +183 security/apparmor/file.c

aebd873e8d3e34 John Johansen  2017-06-09  168  
76862af5d1add6 Randy Dunlap   2023-01-02  169  struct aa_perms default_perms = {};
6380bd8ddf613b John Johansen  2010-07-29  170  /**
408d53e923bd85 Mike Salvatore 2020-03-30  171   * aa_lookup_fperms - convert dfa compressed perms to internal perms
2e12c5f060176e John Johansen  2023-07-23  172   * @subj_uid: uid to use for subject owner test
2e12c5f060176e John Johansen  2023-07-23  173   * @rules: the aa_policydb to lookup perms for  (NOT NULL)
6380bd8ddf613b John Johansen  2010-07-29  174   * @state: state in dfa
6380bd8ddf613b John Johansen  2010-07-29  175   * @cond:  conditions to consider  (NOT NULL)
6380bd8ddf613b John Johansen  2010-07-29  176   *
408d53e923bd85 Mike Salvatore 2020-03-30  177   * TODO: convert from dfa + state to permission entry
6380bd8ddf613b John Johansen  2010-07-29  178   *
408d53e923bd85 Mike Salvatore 2020-03-30  179   * Returns: a pointer to a file permission set
6380bd8ddf613b John Johansen  2010-07-29  180   */
2e12c5f060176e John Johansen  2023-07-23  181  struct aa_perms *aa_lookup_condperms(kuid_t subj_uid, struct aa_policydb *rules,
33fc95d8293cfc John Johansen  2022-01-17  182  				     aa_state_t state, struct path_cond *cond)
6380bd8ddf613b John Johansen  2010-07-29 @183  {
2e12c5f060176e John Johansen  2023-07-23  184  	unsigned int index = ACCEPT_TABLE(rules->dfa)[state];
6380bd8ddf613b John Johansen  2010-07-29  185  
2e12c5f060176e John Johansen  2023-07-23  186  	if (!(rules->perms))
408d53e923bd85 Mike Salvatore 2020-03-30  187  		return &default_perms;
6380bd8ddf613b John Johansen  2010-07-29  188  
2e12c5f060176e John Johansen  2023-07-23  189  	if ((ACCEPT_TABLE2(rules->dfa)[state] & ACCEPT_FLAG_OWNER)) {
2e12c5f060176e John Johansen  2023-07-23  190  		if (uid_eq(subj_uid, cond->uid))
2e12c5f060176e John Johansen  2023-07-23  191  			return &(rules->perms[index]);
2e12c5f060176e John Johansen  2023-07-23  192  		return &(rules->perms[index + 1]);
2e12c5f060176e John Johansen  2023-07-23  193  	}
6380bd8ddf613b John Johansen  2010-07-29  194  
2e12c5f060176e John Johansen  2023-07-23  195  	return &(rules->perms[index]);
6380bd8ddf613b John Johansen  2010-07-29  196  }
6380bd8ddf613b John Johansen  2010-07-29  197  

:::::: The code at line 183 was first introduced by commit
:::::: 6380bd8ddf613b29f478396308b591867d401de4 AppArmor: file enforcement routines

:::::: TO: John Johansen <john.johansen@canonical.com>
:::::: CC: James Morris <jmorris@namei.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
