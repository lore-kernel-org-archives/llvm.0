Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0E280630;
	Tue, 19 Mar 2024 13:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710853778; cv=none; b=Gf0Ko0OBcuIVF2VFpp6fb4CSX3XnucTGElp9dmbtiRL1Ho3G2Qi0kE6dY6Bzl5lGyMkjcfxqJwqojKj41YEXPbtcEKrTCqUQ23Ev14XQ32fPDIegMOocIU8UYVpUSgy+rj7vqlZGQ4z5naCJW7v2dlJEGpnguWCdh+dFrxcCFts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710853778; c=relaxed/simple;
	bh=Vm0FlXINuPVyjHyrZnUUNVa7FLf5NMfsHgXWWmKfenk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qxe1TBkscCZTJJ967qY/U4fn/TwmcmALqKvtQpiThls9M9wPFTQKe1XrDWXyle9kRyA4Xk3XAuEFD9eQbfmH8SiwWbFp4PBfdGvm+zar63/0FjYPQ0gyVmZfTza/bQPtylBwViXl52hYN4xdkIkdl/0PyCiXjcErvgsyPzKtuf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hozh5bLJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hozh5bLJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710853777; x=1742389777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vm0FlXINuPVyjHyrZnUUNVa7FLf5NMfsHgXWWmKfenk=;
  b=Hozh5bLJXFGwTt3IEmd82tRTwJB5/rRKod2z6uvYJ94TBzKtNsJLPl7J
   uPIYc/4msWAFMkQzMgQoJ4vcNIjaHL66ZebdRmDErcE05p7W0gmOrdXjq
   6ihwBzqVoyOoez9qfK2sZqMmxYu3U+DHKjDl6W9wYpHTFqopIETYNeyBN
   MzEI4mQjVqMDc6yeTVa393AnOKwyPS5hXg7Y/oA9skgZ9fuhc564Nd5ei
   MV/KKeSR82fCFY49I8rxAeNC/aMv6C3FWDmktBt2LSj1S1xSihbTum0s/
   3hiro2cPDYtUZ1Px7eo7Bu5bAEm2YTSkQybN+CQfFxektd+rnDHzChjK6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5843583"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="5843583"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 06:09:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="36942639"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Mar 2024 06:09:35 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmZDg-000HmD-2Q;
	Tue, 19 Mar 2024 13:09:32 +0000
Date: Tue, 19 Mar 2024 21:09:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 16/25] fs/nfsd/nfs4state.c:8918: warning:
 expecting prototype for nfsd_get_dir_delegation(). Prototype was for
 nfsd_get_dir_deleg() instead
Message-ID: <202403192159.AjiacC5u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   3509cb8bd63103f6f1a76089f0352fe85a9097ab
commit: 04a8f2055f5649c42d4698bd720cf84d7187ab35 [16/25] nfsd: wire up GET_DIR_DELEGATION handling
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240319/202403192159.AjiacC5u-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8f68022f8e6e54d1aeae4ed301f5a015963089b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240319/202403192159.AjiacC5u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403192159.AjiacC5u-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfsd/nfs4state.c:8918: warning: expecting prototype for nfsd_get_dir_delegation(). Prototype was for nfsd_get_dir_deleg() instead


vim +8918 fs/nfsd/nfs4state.c

  8903	
  8904	/**
  8905	 * nfsd_get_dir_delegation - attempt to get a directory delegation
  8906	 * @cstate: compound state
  8907	 * @gdd: GET_DIR_DELEGATION arg/resp structure
  8908	 * @nf: nfsd_file opened on the directory
  8909	 *
  8910	 * Given a GET_DIR_DELEGATION request @gdd, attempt to acquire a delegation on
  8911	 * on the directory to which @nf refers. Note that this does not set up any
  8912	 * sort of async notifications for the delegation.
  8913	 */
  8914	struct nfs4_delegation *
  8915	nfsd_get_dir_deleg(struct nfsd4_compound_state *cstate,
  8916			   struct nfsd4_get_dir_delegation *gdd,
  8917			   struct nfsd_file *nf)
> 8918	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
