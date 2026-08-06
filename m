Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1583DEAD6;
	Thu,  6 Aug 2026 09:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009430; cv=none; b=pYJdePeDqvotW39QpdFRCqVbGqSWGEdE5H71IMWvJ7XsjaYk4qnDtokJtSM4Rg/rrzCYLGmx9IX3UU1xE9KSBh4bp+9E3ZswRMHS2+081EfhoNl1RI5NoqI6Vt4zs/Y/WrBDqF+1sLNp5gL4ljd7DBxdbxRhRon4RaDe93GwxfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009430; c=relaxed/simple;
	bh=3SCLHniwEHSpN7NIHiRPlSJ2z4j9Jt/Ih8EqNhGjvfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssjQ/7iT0PgKy4ipnMFRW8R8rFuuMK5mnHkQrAtJESUF3yqHQaxT7DhgtO2OqF8ZrxnLkWdDmJkECOQUn0/ch6AuuShUDrZpF4bQY6kHAJS/565jdHsdsr3VvLcmkN+R6IzNOrOZVPZ1V+pLolgBiw7wl9mFQqLdOr+h7MaqDqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=acOjvEoE; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acOjvEoE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786009428; x=1817545428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3SCLHniwEHSpN7NIHiRPlSJ2z4j9Jt/Ih8EqNhGjvfI=;
  b=acOjvEoEcmtxtFI6HNUz+ykwWXw02ka1dKyatQiUnDH1IycKhco1iQ6j
   V4COoCQNZb7+Zube8q1vpvB2V6ch/lpFoUHr6zRUXTo+wC34em/h9RNRk
   XTuLsmt6hzmTgueVkidGEuuoYaw3EKaQQq9G5soZZ36VW0dMEgjl8HKbM
   CSJqUMHBzNRn5WfLA3IogIHgSNBVGU2KXRcBDFqf7Xi2X35eZs5E7Q9lG
   v+BBqEwKcc9hcWLCsxx3RD+C/ye8/scU7bg7gtusJ72DImvhA8gA92beZ
   jXSgUuAACwNJPT0eiR/m7+gZopcTMTh1mbqW/2E7VUZ/ZPOxH+UPN4/S5
   g==;
X-CSE-ConnectionGUID: 0vd4H5K4RtKysH3Ymoo3XQ==
X-CSE-MsgGUID: UQENSHHLT2ONQsZKD2N9gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86626318"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="86626318"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 02:43:46 -0700
X-CSE-ConnectionGUID: UjnGBqrTQbeZsMirezjhDw==
X-CSE-MsgGUID: gABfhUh8SFeBpw7OEiE9Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="267203890"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 06 Aug 2026 02:43:43 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrudZ-000000004bm-0935;
	Thu, 06 Aug 2026 09:43:41 +0000
Date: Thu, 6 Aug 2026 11:43:33 +0200
From: kernel test robot <lkp@intel.com>
To: Tigran Mkrtchyan <tigran.mkrtchyan@desy.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] [RFC] nfs4: inject process namespace into COMPOUND tag
Message-ID: <202608061151.ZYrYBoPN-lkp@intel.com>
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
[also build test ERROR on linus/master v7.2-rc6 next-20260805]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tigran-Mkrtchyan/nfs4-inject-process-namespace-into-COMPOUND-tag/20260806-105541
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20260626151029.1516839-1-tigran.mkrtchyan%40desy.de
patch subject: [PATCH] [RFC] nfs4: inject process namespace into COMPOUND tag
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260806/202608061151.ZYrYBoPN-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608061151.ZYrYBoPN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608061151.ZYrYBoPN-lkp@intel.com/

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
