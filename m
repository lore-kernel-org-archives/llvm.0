Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554F5AD21;
	Wed,  3 Sep 2025 00:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756858544; cv=none; b=HE2VtbWnIzcn4NbPwRcePNqN+VAdSFUm1c141A98dihtC+sJZpLXsyvmDx+RmBMlacsYUds57u/wn1lG2T6FRfEIwPe1QAnrOOSLhMamEA1PrnkyR4UTajRXD3JW3YmKvxJ68wZzidTtm42L6R9cc9EmYdEwCelPYsduj3BlBRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756858544; c=relaxed/simple;
	bh=iCPt6L9JRF+nRjiq3p0LdneRZTOQtq6ef6L9aZ7NZ3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KcTs5Py3m8gD1bKtoKFpmyz5DKf6h1UNdx/8+PkkkPsmbf90FzcuGgRRt+O9SvKXhzPZGK5LNbF5DbU1vVnERboItjt9oi9849lKFLbblJRCiCihSGXZA1YfuVocG0enM2iRAV7DmePTDxgcuUE5dQ8Xz4L4ZyS2aH33jLvDZsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EOibFDqd; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EOibFDqd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756858542; x=1788394542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iCPt6L9JRF+nRjiq3p0LdneRZTOQtq6ef6L9aZ7NZ3Q=;
  b=EOibFDqd37ZtGAEnAlwJAChztOS15eP+3+EWmvK96GFhWNAjMSajVuzp
   BFrTU3Vc/wV03JhKwIMWiqj8oXkhyeToGxXdUM2Coq0SV0Nn2NFi5kkMQ
   mUcqA0gjOSIbLC8E3uXJio29IYpoK6Q9IvzRl0kmogUDs/xrO0JfD1ZOK
   nnAjggtYRx/yl1i5liYOhZ6rfrZUQIU5QrnU6HubqJ0xQ7nhXp300O6UK
   3ZR1wXpHapT8O/bfc2W6F05u8StCeVwCkt/m7ljQfcyqMbOl8N53U0xXC
   u78mkWEov5pp/69udm/hE76p87+Vr/4bWMoeppS1NQ83lgAXZ4MfXjAES
   Q==;
X-CSE-ConnectionGUID: aU+3obxxQTOzCvQs8iDSLg==
X-CSE-MsgGUID: tD42dkxzRzaf+Ryd/zISgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="76602813"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="76602813"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 17:15:41 -0700
X-CSE-ConnectionGUID: QPuetLGeSYWv4vKCvyu+IA==
X-CSE-MsgGUID: is3DoUAaQ7mPyXOYGhpLlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="171810312"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 02 Sep 2025 17:15:40 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utbA2-0003AD-0x;
	Wed, 03 Sep 2025 00:15:38 +0000
Date: Wed, 3 Sep 2025 08:12:50 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/perf 33/47] include/linux/rseq_entry.h:379:23:
 error: too many arguments to function call, expected single argument 't',
 have 2 arguments
Message-ID: <202509030818.YoqG3i0M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/perf
head:   dcdbc80bf84fba7d19b555690131fb4493dbd8e7
commit: d4951780706de1aa7b2e7b7a75eb4c60de996aa5 [33/47] rseq: Provide and use rseq_set_ids()
config: arm-randconfig-001-20250903 (https://download.01.org/0day-ci/archive/20250903/202509030818.YoqG3i0M-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2e122990391b2ba062e6308a12cfedf7206270ba)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250903/202509030818.YoqG3i0M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509030818.YoqG3i0M-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rseq.c:75:
>> include/linux/rseq_entry.h:379:23: error: too many arguments to function call, expected single argument 't', have 2 arguments
     379 |         rseq_trace_update(t, ids);
         |         ~~~~~~~~~~~~~~~~~    ^~~
   include/linux/rseq_entry.h:66:20: note: 'rseq_trace_update' declared here
      66 | static inline void rseq_trace_update(struct task_struct *t) { }
         |                    ^                 ~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +/t +379 include/linux/rseq_entry.h

   331	
   332	/*
   333	 * Updates CPU ID, Node ID and MM CID and reads the critical section
   334	 * address, when @csaddr != NULL. This allows to put the ID update and the
   335	 * read under the same uaccess region to spare a seperate begin/end.
   336	 *
   337	 * As this is either invoked from a C wrapper with @csaddr = NULL or from
   338	 * the fast path code with a valid pointer, a clever compiler should be
   339	 * able to optimize the read out. Spares a duplicate implementation.
   340	 *
   341	 * Returns true, if the operation was successful, false otherwise.
   342	 *
   343	 * In the failure case task::rseq_event::fatal is set when invalid data
   344	 * was found on debug kernels. It's clear when the failure was an unresolved page
   345	 * fault.
   346	 *
   347	 * If inlined into the exit to user path with interrupts disabled, the
   348	 * caller has to protect against page faults with pagefault_disable().
   349	 *
   350	 * In preemptible task context this would be counterproductive as the page
   351	 * faults could not be fully resolved. As a consequence unresolved page
   352	 * faults in task context are fatal too.
   353	 */
   354	static rseq_inline
   355	bool rseq_set_ids_get_csaddr(struct task_struct *t, struct rseq_ids *ids,
   356				     u32 node_id, u64 *csaddr)
   357	{
   358		struct rseq __user *rseq = t->rseq;
   359	
   360		if (static_branch_unlikely(&rseq_debug_enabled)) {
   361			if (!rseq_debug_validate_ids(t))
   362				return false;
   363		}
   364	
   365		if (!user_rw_masked_begin(rseq))
   366			return false;
   367	
   368		unsafe_put_user(ids->cpu_id, &rseq->cpu_id_start, efault);
   369		unsafe_put_user(ids->cpu_id, &rseq->cpu_id, efault);
   370		unsafe_put_user(node_id, &rseq->node_id, efault);
   371		unsafe_put_user(ids->mm_cid, &rseq->mm_cid, efault);
   372		if (csaddr)
   373			unsafe_get_user(*csaddr, &rseq->rseq_cs, efault);
   374		user_access_end();
   375	
   376		/* Cache the new values */
   377		t->rseq_ids.cpu_cid = ids->cpu_cid;
   378		rseq_stat_inc(rseq_stats.ids);
 > 379		rseq_trace_update(t, ids);
   380		return true;
   381	efault:
   382		user_access_end();
   383		return false;
   384	}
   385	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
