Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AD02C1A2;
	Tue, 11 Mar 2025 19:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741722296; cv=none; b=BP/UYHEX/eFb6HsrBfLleYqO3PlrXcH18duUhfaQ4qUSbEdaHU8HC4zY6WL7IolPcD9xOxxGRkwhs3I85YvYfgDKIr95rZJ0tREf8ElBu/CGV02rKANhJQsv/a+6GH7+J6jy45zbq0IHyLqJAshiNEdtFV0eqfZUFUX7MBiGGUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741722296; c=relaxed/simple;
	bh=GwrPkIIGmOqOTDHd8PjtXlMstAzljEmYscJ24yHy6+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ml37WCC+oh5HB6liaXYz1/aKvQNke7nPaF/J78q9l8QOczVaW6a3ZrRWsClqaF6FtSTlFL2RRcVH/81XoG+l6aau+5Oim5r3O1IFQeN79MYuMKkUfFcidx/CgcZ18c3s9fURCYjWo7m0DesLmY3CaUwfjSn32k/jrn8iSADIyKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CZkcAnjR; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CZkcAnjR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741722295; x=1773258295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GwrPkIIGmOqOTDHd8PjtXlMstAzljEmYscJ24yHy6+M=;
  b=CZkcAnjRORz8Psh/47R7kWeXgDsbn8gBMtijKQw25yhGQcDPCBNPSAQC
   p1sf3wdI12GYPOdTty17VtQnevv/wXQNVzohiktNA1W71gaR6heJ1qnyD
   sFv9RXoIEVTzWsi1eWY/zifKlb7zFbgouyW6hPzdZTCNiRRYDNNOTAa/o
   AF/g36ApotOITYS6FH1qT0CD6BgKfIkLV1IMT+pgSV+ia2smUVsKtVcxI
   y8LAzM2Zi5tAhgrzrcRt7V4A0knYkPW6YPlSVo8FYwBYkjBRfBxOJjmxy
   o7XM8DtId/psdIbueSPFT0TP6RDhynQeGBuWEtaUEFn6Rf3ms4UiGofRe
   w==;
X-CSE-ConnectionGUID: 23qMpjCmQRSoks2jiBbO6w==
X-CSE-MsgGUID: cnL0D2gaSqeDkCoA7CppEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53773095"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="53773095"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 12:44:53 -0700
X-CSE-ConnectionGUID: QBRCwykRTcuv/AqLKfapTA==
X-CSE-MsgGUID: Yuu7xhoAQGyPHCnHHLdA1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="125316014"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 11 Mar 2025 12:44:51 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ts5Wy-0007mm-2N;
	Tue, 11 Mar 2025 19:44:48 +0000
Date: Wed, 12 Mar 2025 03:43:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:nfsd-tracepoints 10/14] fs/nfsd/nfsproc.c:483:2: error:
 call to undeclared function 'trace_nfsd_proc_link'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202503120309.6UatC2Y3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git nfsd-tracepoints
head:   406b15fe7fc917eb20c0cfe48d441442adad9918
commit: 0dde04bfb829ba259ce6f586a807eaaee6540529 [10/14] nfsd: add tracepoints for hardlink events
config: arm-randconfig-003-20250312 (https://download.01.org/0day-ci/archive/20250312/202503120309.6UatC2Y3-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503120309.6UatC2Y3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503120309.6UatC2Y3-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfsd/nfsproc.c:295:2: error: call to undeclared function 'trace_nfsd_proc_create'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     295 |         trace_nfsd_proc_create(rqstp, dirfhp, S_IFREG, argp->name, argp->len);
         |         ^
   fs/nfsd/nfsproc.c:295:2: note: did you mean 'nfsd_proc_create'?
   fs/nfsd/nfsproc.c:279:1: note: 'nfsd_proc_create' declared here
     279 | nfsd_proc_create(struct svc_rqst *rqstp)
         | ^
>> fs/nfsd/nfsproc.c:483:2: error: call to undeclared function 'trace_nfsd_proc_link'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     483 |         trace_nfsd_proc_link(rqstp, &argp->ffh, &argp->tfh, argp->tname, argp->tlen);
         |         ^
   fs/nfsd/nfsproc.c:483:2: note: did you mean 'nfsd_proc_link'?
   fs/nfsd/nfsproc.c:478:1: note: 'nfsd_proc_link' declared here
     478 | nfsd_proc_link(struct svc_rqst *rqstp)
         | ^
     479 | {
     480 |         struct nfsd_linkargs *argp = rqstp->rq_argp;
     481 |         struct nfsd_stat *resp = rqstp->rq_resp;
     482 | 
     483 |         trace_nfsd_proc_link(rqstp, &argp->ffh, &argp->tfh, argp->tname, argp->tlen);
         |         ~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_link
   fs/nfsd/nfsproc.c:503:2: error: call to undeclared function 'trace_nfsd_proc_symlink'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     503 |         trace_nfsd_proc_symlink(rqstp, &argp->ffh, argp->fname, argp->flen,
         |         ^
   fs/nfsd/nfsproc.c:503:2: note: did you mean 'nfsd_proc_symlink'?
   fs/nfsd/nfsproc.c:494:1: note: 'nfsd_proc_symlink' declared here
     494 | nfsd_proc_symlink(struct svc_rqst *rqstp)
         | ^
     495 | {
     496 |         struct nfsd_symlinkargs *argp = rqstp->rq_argp;
     497 |         struct nfsd_stat *resp = rqstp->rq_resp;
     498 |         struct nfsd_attrs attrs = {
     499 |                 .na_iattr       = &argp->attrs,
     500 |         };
     501 |         struct svc_fh   newfh;
     502 | 
     503 |         trace_nfsd_proc_symlink(rqstp, &argp->ffh, argp->fname, argp->flen,
         |         ~~~~~~~~~~~~~~~~~~~~~~~
         |         nfsd_proc_symlink
   fs/nfsd/nfsproc.c:538:1: error: function definition is not allowed here
     538 | {
         | ^
   fs/nfsd/nfsproc.c:571:1: error: function definition is not allowed here
     571 | {
         | ^
   fs/nfsd/nfsproc.c:587:1: error: function definition is not allowed here
     587 | {
         | ^
   fs/nfsd/nfsproc.c:607:1: error: function definition is not allowed here
     607 | {
         | ^
   fs/nfsd/nfsproc.c:635:1: error: function definition is not allowed here
     635 | {
         | ^
   fs/nfsd/nfsproc.c:819:14: error: use of undeclared identifier 'nfsd_proc_mkdir'; did you mean '_proc_mkdir'?
     819 |                 .pc_func = nfsd_proc_mkdir,
         |                            ^~~~~~~~~~~~~~~
         |                            _proc_mkdir
   include/linux/proc_fs.h:85:24: note: '_proc_mkdir' declared here
      85 | struct proc_dir_entry *_proc_mkdir(const char *, umode_t, struct proc_dir_entry *, void *, bool);
         |                        ^
   fs/nfsd/nfsproc.c:831:14: error: use of undeclared identifier 'nfsd_proc_rmdir'
     831 |                 .pc_func = nfsd_proc_rmdir,
         |                            ^
   fs/nfsd/nfsproc.c:842:14: error: use of undeclared identifier 'nfsd_proc_readdir'
     842 |                 .pc_func = nfsd_proc_readdir,
         |                            ^
   fs/nfsd/nfsproc.c:852:14: error: use of undeclared identifier 'nfsd_proc_statfs'; did you mean 'nfsd_proc_setattr'?
     852 |                 .pc_func = nfsd_proc_statfs,
         |                            ^~~~~~~~~~~~~~~~
         |                            nfsd_proc_setattr
   fs/nfsd/nfsproc.c:75:1: note: 'nfsd_proc_setattr' declared here
      75 | nfsd_proc_setattr(struct svc_rqst *rqstp)
         | ^
   fs/nfsd/nfsproc.c:873:3: error: expected '}'
     873 | };
         |   ^
   fs/nfsd/nfsproc.c:495:1: note: to match this '{'
     495 | {
         | ^
   13 errors generated.


vim +/trace_nfsd_proc_link +483 fs/nfsd/nfsproc.c

   476	
   477	static __be32
   478	nfsd_proc_link(struct svc_rqst *rqstp)
   479	{
   480		struct nfsd_linkargs *argp = rqstp->rq_argp;
   481		struct nfsd_stat *resp = rqstp->rq_resp;
   482	
 > 483		trace_nfsd_proc_link(rqstp, &argp->ffh, &argp->tfh, argp->tname, argp->tlen);
   484	
   485		resp->status = nfsd_link(rqstp, &argp->tfh, argp->tname, argp->tlen,
   486					 &argp->ffh);
   487		fh_put(&argp->ffh);
   488		fh_put(&argp->tfh);
   489		resp->status = nfsd_map_status(resp->status);
   490		return rpc_success;
   491	}
   492	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
