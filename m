Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E4522D785;
	Tue, 14 Apr 2026 08:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776156633; cv=none; b=gxRGlM6Ktsb1iRQTCkbhWSA3fQsDJRWvIrxcQXU9YgutqyhtcoYJF8zI7zcgd3/mvcOEfodKomXDEymSIPmfJaQL2Ijfk1+1VMbctInCEuFwUjzAAOE2Sn+kFj9ns0Wvq63VDLf1VCOCTonVnUSWyyQVS2xC077t89ZfmUPNu9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776156633; c=relaxed/simple;
	bh=Y8aKRsQPhbDEO1Swom3dayyampMO5V0gBDfmuisnZ0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U2IPfJnQM6qYL86OqyRwElenO5QavP/DXfHCR7KmEA5UjiHKlAXl1CaY9KXSWonMWUlAAtdxWSXAOdf1QmhDOASScDn1DYEVPSmVZDVw4mIB4EOzezx44eWKBavW4fQOEDitPH2F5FCTgeGYSt1hGwySsEzKWZomc7INMad4ALY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jKHJODgo; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jKHJODgo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776156632; x=1807692632;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y8aKRsQPhbDEO1Swom3dayyampMO5V0gBDfmuisnZ0g=;
  b=jKHJODgoJF0DjgMlwJ1jqPvxWW12sqR3+2Ktf/0SsY7QZ+g8wanrLiF2
   gEMeZtcqCUn63oENPsg3DIO/Y8XqwwBzn1sfIpbfNfZsgNSeK3Qfb5GWr
   uI8H5vnbCLtP1JSJ/G4oukxKAFKAAwum4fsXBz9LZIY84g0TqR9phHILQ
   pO0e+NucGAEPPCa5McqY1JjUpkeFdDSAd80ifznniViy1FKIEU7YmdMMR
   n7eZ2TrRg/bjmfwU7nn05nnnIi8E95cTpQ2P495Ly3mh2i3tAN+kNLts+
   piKWNaKOk9Guttq4T1FgN3rzMO3ct3BGAP8FsitfuwwfzaNm8LY8KGu0n
   A==;
X-CSE-ConnectionGUID: lT3af+diS7+S1girYut/mg==
X-CSE-MsgGUID: 5DQzXt03RyibJoeyM/VOzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="76986124"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="76986124"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 01:50:31 -0700
X-CSE-ConnectionGUID: /siPSbprTzesLWlsXJ6qdQ==
X-CSE-MsgGUID: b0QCzT9bSSKJtRiNuglGvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="231776985"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Apr 2026 01:50:28 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCZTY-000000001Hl-0FQq;
	Tue, 14 Apr 2026 08:50:28 +0000
Date: Tue, 14 Apr 2026 16:49:34 +0800
From: kernel test robot <lkp@intel.com>
To: Prakash Sangappa <prakash.sangappa@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/1] netlink: Add Netlink process event for cgroup
 migration
Message-ID: <202604141600.VBaiiHS6-lkp@intel.com>
References: <20260407172339.2017158-2-prakash.sangappa@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407172339.2017158-2-prakash.sangappa@oracle.com>

Hi Prakash,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tj-cgroup/for-next]
[also build test ERROR on net/main net-next/main linus/master v7.0 next-20260413]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prakash-Sangappa/netlink-Add-Netlink-process-event-for-cgroup-migration/20260413-212045
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git for-next
patch link:    https://lore.kernel.org/r/20260407172339.2017158-2-prakash.sangappa%40oracle.com
patch subject: [RFC PATCH 1/1] netlink: Add Netlink process event for cgroup migration
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260414/202604141600.VBaiiHS6-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604141600.VBaiiHS6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604141600.VBaiiHS6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/cgroup/cgroup.c:2985:3: error: call to undeclared function 'proc_cgroup_migrate_connector'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2985 |                 proc_cgroup_migrate_connector(leader, dst_cgrp);
         |                 ^
   kernel/cgroup/cgroup.c:2985:3: note: did you mean 'proc_cgrp_migrate_connector'?
   include/linux/cn_proc.h:58:20: note: 'proc_cgrp_migrate_connector' declared here
      58 | static inline void proc_cgrp_migrate_connector(struct task_struct *task)
         |                    ^
   1 error generated.
--
>> kernel/cgroup/cgroup-v1.c:153:5: error: call to undeclared function 'proc_cgroup_migrate_connector'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     153 |                                 proc_cgroup_migrate_connector(task, to);
         |                                 ^
   kernel/cgroup/cgroup-v1.c:153:5: note: did you mean 'proc_cgrp_migrate_connector'?
   include/linux/cn_proc.h:58:20: note: 'proc_cgrp_migrate_connector' declared here
      58 | static inline void proc_cgrp_migrate_connector(struct task_struct *task)
         |                    ^
   1 error generated.


vim +/proc_cgroup_migrate_connector +2985 kernel/cgroup/cgroup.c

  2951	
  2952	/**
  2953	 * cgroup_attach_task - attach a task or a whole threadgroup to a cgroup
  2954	 * @dst_cgrp: the cgroup to attach to
  2955	 * @leader: the task or the leader of the threadgroup to be attached
  2956	 * @threadgroup: attach the whole threadgroup?
  2957	 *
  2958	 * Call holding cgroup_mutex and cgroup_threadgroup_rwsem.
  2959	 */
  2960	int cgroup_attach_task(struct cgroup *dst_cgrp, struct task_struct *leader,
  2961			       bool threadgroup)
  2962	{
  2963		DEFINE_CGROUP_MGCTX(mgctx);
  2964		struct task_struct *task;
  2965		int ret = 0;
  2966	
  2967		/* look up all src csets */
  2968		spin_lock_irq(&css_set_lock);
  2969		task = leader;
  2970		do {
  2971			cgroup_migrate_add_src(task_css_set(task), dst_cgrp, &mgctx);
  2972			if (!threadgroup)
  2973				break;
  2974		} while_each_thread(leader, task);
  2975		spin_unlock_irq(&css_set_lock);
  2976	
  2977		/* prepare dst csets and commit */
  2978		ret = cgroup_migrate_prepare_dst(&mgctx);
  2979		if (!ret)
  2980			ret = cgroup_migrate(leader, threadgroup, &mgctx);
  2981	
  2982		cgroup_migrate_finish(&mgctx);
  2983	
  2984		if (!ret) {
> 2985			proc_cgroup_migrate_connector(leader, dst_cgrp);
  2986			TRACE_CGROUP_PATH(attach_task, dst_cgrp, leader, threadgroup);
  2987		}
  2988	
  2989		return ret;
  2990	}
  2991	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
