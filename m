Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2632F63C;
	Tue, 12 Mar 2024 00:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710205089; cv=none; b=rlqalbOq4BgKh67iHWLdCWBdg4R2JM0zIx3jUN3gxfeMNuJ9Wu6abhhv71VzpT81UeomSjyD1MyLt9RQ4uFbPw/JVX0EnU3niyTNfG2rqUs7uWL0ZbWrfXkr2dtU/3+amPgka6G3q0voJtqxQRH/HKdIOHB28XsN/AIQbRev5cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710205089; c=relaxed/simple;
	bh=vE2JDyQdHwRlxU+xcHzQkIoGHEhCx9E8cxwICBfOoLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TrBppodtPzNbVgMZiCXWhhHTiJlGzXFK+hzoX/jwnAOF1vnN5CUFkuYuffRMbP90Z4wT9TQjUbsc4CLx8EGyFnlxyUB70pEbiq2CQjeJFYY2wCo45452JxfTiKn2TLgJQrtxiE0J1+JVY0vBeggnUYDh535ep4tbYBikVUhX2bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nntjMpYl; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nntjMpYl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710205087; x=1741741087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vE2JDyQdHwRlxU+xcHzQkIoGHEhCx9E8cxwICBfOoLg=;
  b=nntjMpYltLnPqU6qGa/XAZoZ107XSRYprLzceveCJMcypoCZp7VS4J7l
   C2IHTJAxxxBsnvGBISJKg/uOchb8YqSkTZ9pFAyn8AP/vFDrwjlgZY/4V
   g9j2ICn9W5YvfvoRL7y6HW+jW5O+xL0Acve98uzT3Qbgvtzsnhc1MqsKa
   QJJ621EjeBxsPn3ZBQ6pnOl+Ikr5fR4qJoEyHDJHUP3SZ1zXJ3nvogi1T
   vpXzHCyludG8HScM3xrTqgQA6hZE4qpZxyt3JeHsJntSsrV2pSc59SWit
   MYpAyY9eZkm2jTg+HiZdjuc1Am1OCZpqToAos51Uu7ZWFWRKyY3wAgxrA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5079927"
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="5079927"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 17:58:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="16045174"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Mar 2024 17:58:05 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjqSw-0009at-0o;
	Tue, 12 Mar 2024 00:58:02 +0000
Date: Tue, 12 Mar 2024 08:57:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 15/24] fs/nfsd/nfs4proc.c:3688:14: error: invalid
 application of 'sizeof' to an incomplete type 'const struct
 nfsd4_operation[]'
Message-ID: <202403120808.wkgN6axS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   bcf256c81b0b6e8d045b86a7dd8cad6835f141d0
commit: 72c7e2439c6031dd40440f2d3e17c06afee34bea [15/24] nfsd: wire up GET_DIR_DELEGATION handling
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240312/202403120808.wkgN6axS-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403120808.wkgN6axS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403120808.wkgN6axS-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfsd/nfs4proc.c:3517:14: error: use of undeclared identifier 'nfsd4_get_dir_delegation'
    3517 |                 .op_func = nfsd4_get_dir_delegation,
         |                            ^
>> fs/nfsd/nfs4proc.c:3688:14: error: invalid application of 'sizeof' to an incomplete type 'const struct nfsd4_operation[]'
    3688 |         if (opnum < ARRAY_SIZE(nfsd4_ops))
         |                     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   fs/nfsd/nfs4proc.c:3209:37: warning: tentative array definition assumed to have one element
    3209 | static const struct nfsd4_operation nfsd4_ops[] = {
         |                                     ^
   1 warning and 2 errors generated.


vim +3688 fs/nfsd/nfs4proc.c

07d1f8020738ba J. Bruce Fields 2014-03-06  3685  
f1c7f79b6ab4f7 Adrian Bunk     2008-08-08  3686  static const char *nfsd4_op_name(unsigned opnum)
b001a1b6aa9609 Benny Halevy    2008-07-02  3687  {
b001a1b6aa9609 Benny Halevy    2008-07-02 @3688  	if (opnum < ARRAY_SIZE(nfsd4_ops))
b001a1b6aa9609 Benny Halevy    2008-07-02  3689  		return nfsd4_ops[opnum].op_name;
b001a1b6aa9609 Benny Halevy    2008-07-02  3690  	return "unknown_operation";
b001a1b6aa9609 Benny Halevy    2008-07-02  3691  }
b001a1b6aa9609 Benny Halevy    2008-07-02  3692  

:::::: The code at line 3688 was first introduced by commit
:::::: b001a1b6aa960949a24c2cdc28257dfcc9428d74 nfsd: dprint operation names

:::::: TO: Benny Halevy <bhalevy@panasas.com>
:::::: CC: J. Bruce Fields <bfields@citi.umich.edu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
