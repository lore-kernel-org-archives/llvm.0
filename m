Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27A43ABD82;
	Fri,  7 Aug 2026 05:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786078992; cv=none; b=n2eIBjSv/lnLWjNo4o/IBuTQLUjL7PTyoOhlBQIWl1Pwus3pGZhCE1Xs8gdBTTLNmkTkshpKDCBXVtR2J+fT1TJ0lwBoBkP0pbBxVeLVR2wKMcvc+gqEOnz+9II0wEV3isS+rLrCehFwfyPpKOOAu5EuhhyxuMHQlIA70pViXTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786078992; c=relaxed/simple;
	bh=7/3GbuKzjuHuMHVYw9C/8iqZ7/xolDroB1KyzEJtYE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TsUJ/+foTeyRyFEyFtuOh7f9l5INT+poB2PTPfomlaG6HLvD9YwC9+0gSyg1gQut56qA6NNnvZpcBcdg/C0QMPdmpUTWo9pu3ReD/6MGYSLkqalj+mODi8vUYBlCJoHPjK86ZgUu4niBJmvj33xrTiuq0uOo9hcA/nTHzMdP8aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QDVG//93; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QDVG//93"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786078988; x=1817614988;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7/3GbuKzjuHuMHVYw9C/8iqZ7/xolDroB1KyzEJtYE0=;
  b=QDVG//93q9fCMxa+BfDNEAZlBgnRszsELpXUVdLWKqSmOU8eEMLXsj1I
   C6ag66eGQH2ZRE/6AvdAdYqvliZQhguG17wHQW5yzmFIhKB+1BTbUnDkl
   9CE6iNPBGg9+O+L8WkQkVuoXJoeDTmrNwXtLaYjYjKye2Tn9khRojf7gi
   tbNb3WAr8YkvPb8vtoGwjq6r8rlOpnvoKPDbtzA3fZPFLoHD5zNJuiFug
   RZJOODIVI0h7f8vxSCuSfe1UXOOiMeNRHZ/WX+qv6E0KpC4ZWiFhdZsq/
   poWopXd3LWwOPHhkJiveraIepkN2COMj2ZMTTefnVvuA+1pFhdnaLqW4/
   A==;
X-CSE-ConnectionGUID: DG1zH6hlTi+ziodphYPOkA==
X-CSE-MsgGUID: o1ZfMNdbQ6q75wab23L+6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86762816"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="86762816"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 22:03:00 -0700
X-CSE-ConnectionGUID: +QcWvMRGQOSEIpLvcsvWzg==
X-CSE-MsgGUID: 9trdEoYIS1u5QPAU5Tu7Zw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Aug 2026 22:02:58 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsCjQ-00000000HED-0XzN;
	Fri, 07 Aug 2026 05:02:56 +0000
Date: Fri, 7 Aug 2026 13:02:19 +0800
From: kernel test robot <lkp@intel.com>
To: Tigran Mkrtchyan <tigran.mkrtchyan@desy.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] [RFC] nfs4: inject process namespace into COMPOUND tag
Message-ID: <202608071235.7jvY6oOL-lkp@intel.com>
References: <20260626151029.1516839-1-tigran.mkrtchyan@desy.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626151029.1516839-1-tigran.mkrtchyan@desy.de>

Hi Tigran,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on trondmy-nfs/linux-next]
[also build test ERROR on linus/master v7.2-rc6 next-20260806]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tigran-Mkrtchyan/nfs4-inject-process-namespace-into-COMPOUND-tag/20260806-105541
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20260626151029.1516839-1-tigran.mkrtchyan%40desy.de
patch subject: [PATCH] [RFC] nfs4: inject process namespace into COMPOUND tag
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260807/202608071235.7jvY6oOL-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 12df34b8469b8095359de8c249cb1b2753fadeea)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260807/202608071235.7jvY6oOL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608071235.7jvY6oOL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfs/nfs4xdr.c:1039:7: error: use of undeclared identifier 'taks'
    1039 |                 if (taks->tk_ns_inum != 0) {
         |                     ^~~~
   fs/nfs/nfs4xdr.c:1042:60: error: use of undeclared identifier 'taks'
    1042 |                         hdr->taglen = snprintf(ns_tag, sizeof(ns_tag), "ns:%u", taks->tk_ns_inum);
         |                                                                                 ^~~~
   2 errors generated.


vim +/taks +1039 fs/nfs/nfs4xdr.c

  1027	
  1028	static void encode_compound_hdr(struct xdr_stream *xdr,
  1029					struct rpc_rqst *req,
  1030					struct compound_hdr *hdr)
  1031	{
  1032		__be32 *p;
  1033	
  1034		/* Inject namespace info into compound tag if not already set */
  1035		if (hdr->taglen == 0 && req->rq_task != NULL) {
  1036			/* Use namespace info captured at task creation time */
  1037			struct rpc_task *task = req->rq_task;
  1038	
> 1039			if (taks->tk_ns_inum != 0) {
  1040				char ns_tag[NFS4_MAXTAGLEN + 1];
  1041	
  1042				hdr->taglen = snprintf(ns_tag, sizeof(ns_tag), "ns:%u", taks->tk_ns_inum);
  1043				if (hdr->taglen > NFS4_MAXTAGLEN) {
  1044					hdr->taglen = NFS4_MAXTAGLEN;
  1045					ns_tag[NFS4_MAXTAGLEN] = '\0';
  1046				}
  1047				hdr->tag = ns_tag;
  1048			}
  1049		}
  1050	
  1051		/* initialize running count of expected bytes in reply.
  1052		 * NOTE: the replied tag SHOULD be the same is the one sent,
  1053		 * but this is not required as a MUST for the server to do so. */
  1054		hdr->replen = 3 + hdr->taglen;
  1055	
  1056		WARN_ON_ONCE(hdr->taglen > NFS4_MAXTAGLEN);
  1057		encode_string(xdr, hdr->taglen, hdr->tag);
  1058		p = reserve_space(xdr, 8);
  1059		*p++ = cpu_to_be32(hdr->minorversion);
  1060		hdr->nops_p = p;
  1061		*p = cpu_to_be32(hdr->nops);
  1062	}
  1063	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
