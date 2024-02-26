Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E322C58AA4;
	Mon, 26 Feb 2024 09:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708939971; cv=none; b=V1pmAWJ7QxS5PdfobY16ijG4lPLIZyQCJyKigYQljjW5E/Jy6scxYjBntU5Q3gZowxCsYkPT+itSr891DQo9k/QLQ+zDOTzkp15FcMgOoc0tKhl9/7TzQwzF1UCoxZzUm5bjvnUy0KbKvwADxj96OAv+ISltgF+gw2+l8TssenI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708939971; c=relaxed/simple;
	bh=W6pN9ImoFyOf/xlaEZubhk5FIV8jPoNkev+9lkiw8NY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l46pR58pL2lv2w7h/xCws/c5UGnOFHBDcL2Ii7lrfBdsBYqigaSucsdN+Ojdaccb1b3NOItcPfAipdpq7/zpYo7pwnZE7uDyll5lwm0Re3L6TPh0sEaOoQUXqmE6W+CO4Yg0Bzy42it0wlqDK6ydEdzg41DpDlWZSfO8pDM8YrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kSVyav7c; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kSVyav7c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708939969; x=1740475969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W6pN9ImoFyOf/xlaEZubhk5FIV8jPoNkev+9lkiw8NY=;
  b=kSVyav7cztGuy3woaY6yl3toW54CTG8Wol3c+OcAYS+uhiA4bngaaF6t
   +5TLx3cRXBUntBUGCHgQskgnVDdWFJ2mQHdMUPdKqupuYaL83n0K3r6Ee
   LDsRByAe9gA2+TJ3Rj+X0d9VslP7llEpcnvBKjJHTNfczaAVRVOyPQR40
   uBEpZKRzRCefZf6wzZaIvGkBTTLx+xLh8NnsO6/NKgtfND4m8G92IN4QJ
   NpIx+ZgCMeAIGOB0ANYwu2/76SNFRjlCqr+GWUyxGqnoz2akbDISuk6/i
   sUl0gqR4Cdyo5n+kYi7H7+0qcvcNlkM1IH9zjyrf7/L6WTO0MvDfr9bAv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="20664038"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="20664038"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 01:32:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="37617960"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 26 Feb 2024 01:32:47 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reXLo-000ADz-1j;
	Mon, 26 Feb 2024 09:32:44 +0000
Date: Mon, 26 Feb 2024 17:31:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 15/18] fs/nfsd/nfs4proc.c:3684:14: error: invalid
 application of 'sizeof' to an incomplete type 'const struct
 nfsd4_operation[]'
Message-ID: <202402261758.ymZelTFN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   25aee189baf00d1981cec7a3958c540f7a7f2012
commit: ea33aff5f86750fd39ef425423264b1c8e0f11e1 [15/18] nfsd: wire up GET_DIR_DELEGATION handling
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240226/202402261758.ymZelTFN-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240226/202402261758.ymZelTFN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402261758.ymZelTFN-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfsd/nfs4proc.c:3513:14: error: use of undeclared identifier 'nfsd4_get_dir_delegation'
    3513 |                 .op_func = nfsd4_get_dir_delegation,
         |                            ^
>> fs/nfsd/nfs4proc.c:3684:14: error: invalid application of 'sizeof' to an incomplete type 'const struct nfsd4_operation[]'
    3684 |         if (opnum < ARRAY_SIZE(nfsd4_ops))
         |                     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   fs/nfsd/nfs4proc.c:3205:37: warning: tentative array definition assumed to have one element
    3205 | static const struct nfsd4_operation nfsd4_ops[] = {
         |                                     ^
   1 warning and 2 errors generated.


vim +3684 fs/nfsd/nfs4proc.c

07d1f8020738ba J. Bruce Fields 2014-03-06  3681  
f1c7f79b6ab4f7 Adrian Bunk     2008-08-08  3682  static const char *nfsd4_op_name(unsigned opnum)
b001a1b6aa9609 Benny Halevy    2008-07-02  3683  {
b001a1b6aa9609 Benny Halevy    2008-07-02 @3684  	if (opnum < ARRAY_SIZE(nfsd4_ops))
b001a1b6aa9609 Benny Halevy    2008-07-02  3685  		return nfsd4_ops[opnum].op_name;
b001a1b6aa9609 Benny Halevy    2008-07-02  3686  	return "unknown_operation";
b001a1b6aa9609 Benny Halevy    2008-07-02  3687  }
b001a1b6aa9609 Benny Halevy    2008-07-02  3688  

:::::: The code at line 3684 was first introduced by commit
:::::: b001a1b6aa960949a24c2cdc28257dfcc9428d74 nfsd: dprint operation names

:::::: TO: Benny Halevy <bhalevy@panasas.com>
:::::: CC: J. Bruce Fields <bfields@citi.umich.edu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
