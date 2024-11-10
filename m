Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1D62556E;
	Sun, 10 Nov 2024 10:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731236035; cv=none; b=EM6CxQA9xEFyXG16BrdO0x7dy8TdTKDkAX+s/lfiSgsaPLDazfB5rcEoWJG8UbVitf9RWebSqzlIu/urPTspuV2aCQFxpxVWNsI3CajSIw5EgJVTGalGPUm/GARA7qp1bI2N3hONR+anY1oqcvJefUgVy6da+s3akiuZH/tZAKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731236035; c=relaxed/simple;
	bh=zzMt0OYWbVG1DCByliP6/KgNFDeJTzkn4VABlK9VMeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RBu8Xmf7hAkPZRI8YEBv1hJQwHcwLpWZOCpgmhM9rNoarctGWS45buw2vKEFc93vx/DChwzMZYi+BuETScctIXBBaXYOjjqH5OHqSHCX2aWpzRueISVQHY6DW7vnXcGBUSS3hhD/kTMlogPqE/A7JzDgzJySJM+tR0Ym7s8CEh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kyd/MLMM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kyd/MLMM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731236033; x=1762772033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zzMt0OYWbVG1DCByliP6/KgNFDeJTzkn4VABlK9VMeQ=;
  b=kyd/MLMMBE/qVcOHXG0Bi7W46sthd2FpIog2F4qNyhDVVyC+YDqea6Z2
   gdiw4OzkUWRUtMNeC5KT87VQAC1MuOtVMAtoyLJrjDRgCMNNt0yCMVj2r
   ZbsRPixzXFecUTOWBkk6nGbbKDEYKnXRbntjQzb8ux6V1UdYAvUeRpX61
   8gpX4mTZ5RYywy5egawGPve5vdziAQSoNEQoc3SHLfbnSxrYOsqILxnVH
   wQn5oEWo/VmjoFYG1EmFqIxay1bFMslATOiz2qFQdRSneZNuvF4AQIfbL
   4y9Rfl9Wbgoz8nhQoPbftMxNS3z1Chtqfl7r4uJE9WSpwQ5f+fEMvYQsz
   Q==;
X-CSE-ConnectionGUID: 2Pjr5jmSTrKktKwxRuyE5w==
X-CSE-MsgGUID: 4jEiYA8GSIyOg2hEslU3wA==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="30464566"
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="30464566"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 02:53:52 -0800
X-CSE-ConnectionGUID: pS9VAJIYQiW3JWUwfedTMQ==
X-CSE-MsgGUID: B2IrAF3TTrOa9JsfDAULhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="90910803"
Received: from lkp-server01.sh.intel.com (HELO 7b17a4138caf) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Nov 2024 02:53:51 -0800
Received: from kbuild by 7b17a4138caf with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tA5Zk-00005z-2l;
	Sun, 10 Nov 2024 10:53:48 +0000
Date: Sun, 10 Nov 2024 18:53:27 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Lee <ryan.lee@canonical.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	John Johansen <john.johansen@canonical.com>
Subject: [jj-apparmor:apparmor-next 2/16] security/apparmor/domain.c:696:3:
 warning: label followed by a declaration is a C23 extension
Message-ID: <202411101808.AI8YG6cs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   8c4f7960ae8a7a03a43f814e4af471b8e6ea3391
commit: ee650b3820f3d127a31c589101b60fbb28e53989 [2/16] apparmor: properly handle cx/px lookup failure for complain
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241110/202411101808.AI8YG6cs-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411101808.AI8YG6cs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411101808.AI8YG6cs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from security/apparmor/domain.c:16:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from security/apparmor/domain.c:16:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from security/apparmor/domain.c:16:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from security/apparmor/domain.c:16:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> security/apparmor/domain.c:696:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     696 |                 struct aa_profile *new_profile = NULL;
         |                 ^
   8 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +696 security/apparmor/domain.c

898127c34ec032 John Johansen             2010-07-29  630  
90c436a64a6e20 John Johansen             2022-09-19  631  static struct aa_label *profile_transition(const struct cred *subj_cred,
90c436a64a6e20 John Johansen             2022-09-19  632  					   struct aa_profile *profile,
93c98a484c4900 John Johansen             2017-06-09  633  					   const struct linux_binprm *bprm,
93c98a484c4900 John Johansen             2017-06-09  634  					   char *buffer, struct path_cond *cond,
93c98a484c4900 John Johansen             2017-06-09  635  					   bool *secure_exec)
898127c34ec032 John Johansen             2010-07-29  636  {
1ad22fcc4d0d2f John Johansen             2022-09-05  637  	struct aa_ruleset *rules = list_first_entry(&profile->rules,
1ad22fcc4d0d2f John Johansen             2022-09-05  638  						    typeof(*rules), list);
93c98a484c4900 John Johansen             2017-06-09  639  	struct aa_label *new = NULL;
93c98a484c4900 John Johansen             2017-06-09  640  	const char *info = NULL, *name = NULL, *target = NULL;
98b824ff8984fd John Johansen             2023-04-28  641  	aa_state_t state = rules->file->start[AA_CLASS_FILE];
2d679f3cb0eaa6 John Johansen             2017-05-29  642  	struct aa_perms perms = {};
93c98a484c4900 John Johansen             2017-06-09  643  	bool nonewprivs = false;
b1d9e6b0646d0e Casey Schaufler           2015-05-02  644  	int error = 0;
898127c34ec032 John Johansen             2010-07-29  645  
93c98a484c4900 John Johansen             2017-06-09  646  	AA_BUG(!profile);
93c98a484c4900 John Johansen             2017-06-09  647  	AA_BUG(!bprm);
93c98a484c4900 John Johansen             2017-06-09  648  	AA_BUG(!buffer);
898127c34ec032 John Johansen             2010-07-29  649  
4227c333f65cdd John Johansen             2017-05-23  650  	error = aa_path_name(&bprm->file->f_path, profile->path_flags, buffer,
72c8a768641dc6 John Johansen             2017-05-22  651  			     &name, &info, profile->disconnected);
898127c34ec032 John Johansen             2010-07-29  652  	if (error) {
637f688dc3dc30 John Johansen             2017-06-09  653  		if (profile_unconfined(profile) ||
93c98a484c4900 John Johansen             2017-06-09  654  		    (profile->label.flags & FLAG_IX_ON_NAME_ERROR)) {
93c98a484c4900 John Johansen             2017-06-09  655  			AA_DEBUG("name lookup ix on error");
898127c34ec032 John Johansen             2010-07-29  656  			error = 0;
93c98a484c4900 John Johansen             2017-06-09  657  			new = aa_get_newest_label(&profile->label);
93c98a484c4900 John Johansen             2017-06-09  658  		}
898127c34ec032 John Johansen             2010-07-29  659  		name = bprm->filename;
898127c34ec032 John Johansen             2010-07-29  660  		goto audit;
898127c34ec032 John Johansen             2010-07-29  661  	}
898127c34ec032 John Johansen             2010-07-29  662  
637f688dc3dc30 John Johansen             2017-06-09  663  	if (profile_unconfined(profile)) {
8e51f9087f4024 Matthew Garrett           2018-02-08  664  		new = find_attach(bprm, profile->ns,
8e51f9087f4024 Matthew Garrett           2018-02-08  665  				  &profile->ns->base.profiles, name, &info);
93c98a484c4900 John Johansen             2017-06-09  666  		if (new) {
93c98a484c4900 John Johansen             2017-06-09  667  			AA_DEBUG("unconfined attached to new label");
93c98a484c4900 John Johansen             2017-06-09  668  			return new;
898127c34ec032 John Johansen             2010-07-29  669  		}
93c98a484c4900 John Johansen             2017-06-09  670  		AA_DEBUG("unconfined exec no attachment");
93c98a484c4900 John Johansen             2017-06-09  671  		return aa_get_newest_label(&profile->label);
898127c34ec032 John Johansen             2010-07-29  672  	}
898127c34ec032 John Johansen             2010-07-29  673  
93c98a484c4900 John Johansen             2017-06-09  674  	/* find exec permissions for name */
98b824ff8984fd John Johansen             2023-04-28  675  	state = aa_str_perms(rules->file, state, name, cond, &perms);
898127c34ec032 John Johansen             2010-07-29  676  	if (perms.allow & MAY_EXEC) {
898127c34ec032 John Johansen             2010-07-29  677  		/* exec permission determine how to transition */
8e51f9087f4024 Matthew Garrett           2018-02-08  678  		new = x_to_label(profile, bprm, name, perms.xindex, &target,
8e51f9087f4024 Matthew Garrett           2018-02-08  679  				 &info);
93c98a484c4900 John Johansen             2017-06-09  680  		if (new && new->proxy == profile->label.proxy && info) {
93c98a484c4900 John Johansen             2017-06-09  681  			/* hack ix fallback - improve how this is detected */
93c98a484c4900 John Johansen             2017-06-09  682  			goto audit;
93c98a484c4900 John Johansen             2017-06-09  683  		} else if (!new) {
93c98a484c4900 John Johansen             2017-06-09  684  			info = "profile transition not found";
ee650b3820f3d1 Ryan Lee                  2024-08-23  685  			/* remove MAY_EXEC to audit as failure or complaint */
17322cc3f9ba57 John Johansen             2013-02-18  686  			perms.allow &= ~MAY_EXEC;
ee650b3820f3d1 Ryan Lee                  2024-08-23  687  			if (COMPLAIN_MODE(profile)) {
ee650b3820f3d1 Ryan Lee                  2024-08-23  688  				/* create null profile instead of failing */
ee650b3820f3d1 Ryan Lee                  2024-08-23  689  				goto create_learning_profile;
ee650b3820f3d1 Ryan Lee                  2024-08-23  690  			}
ee650b3820f3d1 Ryan Lee                  2024-08-23  691  			error = -EACCES;
898127c34ec032 John Johansen             2010-07-29  692  		}
898127c34ec032 John Johansen             2010-07-29  693  	} else if (COMPLAIN_MODE(profile)) {
ee650b3820f3d1 Ryan Lee                  2024-08-23  694  create_learning_profile:
93c98a484c4900 John Johansen             2017-06-09  695  		/* no exec permission - learning mode */
5d7c44ef5e4f01 John Johansen             2017-11-20 @696  		struct aa_profile *new_profile = NULL;
df323337e507a0 Sebastian Andrzej Siewior 2019-05-03  697  
58f89ce58bb4f5 John Johansen             2022-10-03  698  		new_profile = aa_new_learning_profile(profile, false, name,
5d7c44ef5e4f01 John Johansen             2017-11-20  699  						      GFP_KERNEL);
898127c34ec032 John Johansen             2010-07-29  700  		if (!new_profile) {
898127c34ec032 John Johansen             2010-07-29  701  			error = -ENOMEM;
898127c34ec032 John Johansen             2010-07-29  702  			info = "could not create null profile";
93c98a484c4900 John Johansen             2017-06-09  703  		} else {
898127c34ec032 John Johansen             2010-07-29  704  			error = -EACCES;
93c98a484c4900 John Johansen             2017-06-09  705  			new = &new_profile->label;
93c98a484c4900 John Johansen             2017-06-09  706  		}
898127c34ec032 John Johansen             2010-07-29  707  		perms.xindex |= AA_X_UNSAFE;
898127c34ec032 John Johansen             2010-07-29  708  	} else
898127c34ec032 John Johansen             2010-07-29  709  		/* fail exec */
898127c34ec032 John Johansen             2010-07-29  710  		error = -EACCES;
898127c34ec032 John Johansen             2010-07-29  711  
93c98a484c4900 John Johansen             2017-06-09  712  	if (!new)
93c98a484c4900 John Johansen             2017-06-09  713  		goto audit;
93c98a484c4900 John Johansen             2017-06-09  714  
c29bceb3967398 John Johansen             2012-04-12  715  
93c98a484c4900 John Johansen             2017-06-09  716  	if (!(perms.xindex & AA_X_UNSAFE)) {
93c98a484c4900 John Johansen             2017-06-09  717  		if (DEBUG_ON) {
93c98a484c4900 John Johansen             2017-06-09  718  			dbg_printk("apparmor: scrubbing environment variables"
93c98a484c4900 John Johansen             2017-06-09  719  				   " for %s profile=", name);
8ac2ca328ec935 Sebastian Andrzej Siewior 2019-04-05  720  			aa_label_printk(new, GFP_KERNEL);
93c98a484c4900 John Johansen             2017-06-09  721  			dbg_printk("\n");
93c98a484c4900 John Johansen             2017-06-09  722  		}
93c98a484c4900 John Johansen             2017-06-09  723  		*secure_exec = true;
93c98a484c4900 John Johansen             2017-06-09  724  	}
93c98a484c4900 John Johansen             2017-06-09  725  
93c98a484c4900 John Johansen             2017-06-09  726  audit:
90c436a64a6e20 John Johansen             2022-09-19  727  	aa_audit_file(subj_cred, profile, &perms, OP_EXEC, MAY_EXEC, name,
90c436a64a6e20 John Johansen             2022-09-19  728  		      target, new,
93c98a484c4900 John Johansen             2017-06-09  729  		      cond->uid, info, error);
93c98a484c4900 John Johansen             2017-06-09  730  	if (!new || nonewprivs) {
93c98a484c4900 John Johansen             2017-06-09  731  		aa_put_label(new);
93c98a484c4900 John Johansen             2017-06-09  732  		return ERR_PTR(error);
93c98a484c4900 John Johansen             2017-06-09  733  	}
93c98a484c4900 John Johansen             2017-06-09  734  
93c98a484c4900 John Johansen             2017-06-09  735  	return new;
93c98a484c4900 John Johansen             2017-06-09  736  }
93c98a484c4900 John Johansen             2017-06-09  737  

:::::: The code at line 696 was first introduced by commit
:::::: 5d7c44ef5e4f0149c9fb99faeae41e930485a1ec apparmor: fix locking when creating a new complain profile.

:::::: TO: John Johansen <john.johansen@canonical.com>
:::::: CC: John Johansen <john.johansen@canonical.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
