Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C752F0C6A;
	Mon,  2 Feb 2026 18:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770057679; cv=none; b=HahZ+YPzDeDHknWBumlNnPue8kUeyLBPzSPva5m3J6KJ5BIn0y/n695IRou8KdVd+slD80A7+lylLPziQ59tdF+DHznk0pdsOz8ayO8/0KulLihv0Zaj2PvHuYtHfn3rn9d9lTrPjafDMLu4y0296bqId/VfdiaXArzV42vpV4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770057679; c=relaxed/simple;
	bh=sw81gQKy0N//HirXWsKr+gHIICA3xfkylXrF05ZACVs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZMPgSqCWste8WcFVNnp4ZVUHBx8W6O7payIpZ/82dC5bVXGRiitAvO7Rw5NxN72bDrlCrbCUQCsJlyleejMlE4aJLUT3wjPo/++NllvYrPi2rxaADF7/X86x55jNGxz7LX6wdG9i+CnIsCGnJFerz7pLNcWjyypdw3K6fcm1Wfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AFQGSKYV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AFQGSKYV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770057677; x=1801593677;
  h=date:from:to:cc:subject:message-id;
  bh=sw81gQKy0N//HirXWsKr+gHIICA3xfkylXrF05ZACVs=;
  b=AFQGSKYVpBHOJlhzZ+l9qi1rLyBUc3ptBa4A/e/e2IS+CRsuM3quGMvm
   GIy/qsmBd4Ye3FtODQqHLCaTFxXD3cqER64nF0gcN5540kffirsR71yMl
   fe+hTf1Dl6iUcKSMMDt0H2jBEr32i2w1db58oY68ws2fL0XLpo3dYtVv9
   hxE9ujHIlArI5FZoupHV2xihrcFowSeFS7tSWMZPMRONIl11JxDAfaboY
   TaFD8hdjbuHuFX99Hi+5ZfOqxdn1LEeM2rPoo4QEWXUL4icw43zC/Bf9v
   JAM0xVAxq5AsHw/HqsMB+SFCuYpSTN9BVsm/8qFBM6UwEY5HAwp3EMheV
   A==;
X-CSE-ConnectionGUID: qUxzPUqbR/GhljLSilWEWQ==
X-CSE-MsgGUID: cjBo7MXxR32koFqTy7ycfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71121340"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="71121340"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 10:41:17 -0800
X-CSE-ConnectionGUID: HkN1oq+zRmGp6wtEkUH6iw==
X-CSE-MsgGUID: QdONaKPLSH+0t+HN5XCZkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="209743159"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Feb 2026 10:41:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmyrJ-00000000frU-0kuV;
	Mon, 02 Feb 2026 18:41:13 +0000
Date: Tue, 03 Feb 2026 02:41:11 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jj-apparmor:apparmor-next 31/32]
 security/apparmor/policy_unpack.c:549:8: error: use of undeclared identifier
 'unsigned_long'
Message-ID: <202602030243.3X4M6Sua-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   9058798652c8bc0584ed1fb0766a1015046c06e8
commit: 102ada7ca37ed8358bd70c6f8e6475ebacf6f76d [31/32] apparmor: fix fmt string type error in process_strs_entry
config: sparc64-randconfig-002-20260203 (https://download.01.org/0day-ci/archive/20260203/202602030243.3X4M6Sua-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602030243.3X4M6Sua-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602030243.3X4M6Sua-lkp@intel.com/

All errors (new ones prefixed by >>):

>> security/apparmor/policy_unpack.c:549:8: error: use of undeclared identifier 'unsigned_long'
     549 |                                          (unsigned_long) e->pos - saved_pos);
         |                                           ^~~~~~~~~~~~~
   1 error generated.


vim +/unsigned_long +549 security/apparmor/policy_unpack.c

   501	
   502	/**
   503	 * unpack_strs_table - unpack a profile transition table
   504	 * @e: serialized data extent information  (NOT NULL)
   505	 * @name: name of table (MAY BE NULL)
   506	 * @multi: allow multiple strings on a single entry
   507	 * @strs: str table to unpack to (NOT NULL)
   508	 *
   509	 * Returns: 0 if table successfully unpacked or not present, else error
   510	 */
   511	static int unpack_strs_table(struct aa_ext *e, const char *name, bool multi,
   512				      struct aa_str_table *strs)
   513	{
   514		void *saved_pos = e->pos;
   515		struct aa_str_table_ent *table = NULL;
   516		int error = -EPROTO;
   517	
   518		/* exec table is optional */
   519		if (aa_unpack_nameX(e, AA_STRUCT, name)) {
   520			u16 size;
   521			int i;
   522	
   523			if (!aa_unpack_array(e, NULL, &size))
   524				/*
   525				 * Note: index into trans table array is a max
   526				 * of 2^24, but unpack array can only unpack
   527				 * an array of 2^16 in size atm so no need
   528				 * for size check here
   529				 */
   530				goto fail;
   531			table = kcalloc(size, sizeof(struct aa_str_table_ent),
   532					GFP_KERNEL);
   533			if (!table) {
   534				error = -ENOMEM;
   535				goto fail;
   536			}
   537			strs->table = table;
   538			strs->size = size;
   539			for (i = 0; i < size; i++) {
   540				char *str;
   541				int c, size2 = aa_unpack_strdup(e, &str, NULL);
   542				/* aa_unpack_strdup verifies that the last character is
   543				 * null termination byte.
   544				 */
   545				c = process_strs_entry(str, size2, multi);
   546				if (c <= 0) {
   547					AA_DEBUG(DEBUG_UNPACK, "process_strs %d i %d pos %ld",
   548						 c, i,
 > 549						 (unsigned_long) e->pos - saved_pos);
   550					goto fail;
   551				}
   552				if (!multi && c > 1) {
   553					AA_DEBUG(DEBUG_UNPACK, "!multi && c > 1");
   554					/* fail - all other cases with embedded \0 */
   555					goto fail;
   556				}
   557				table[i].strs = str;
   558				table[i].count = c;
   559				table[i].size = size2;
   560			}
   561			if (!aa_unpack_nameX(e, AA_ARRAYEND, NULL))
   562				goto fail;
   563			if (!aa_unpack_nameX(e, AA_STRUCTEND, NULL))
   564				goto fail;
   565		}
   566		return 0;
   567	
   568	fail:
   569		aa_destroy_str_table(strs);
   570		e->pos = saved_pos;
   571		return error;
   572	}
   573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
