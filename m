Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260F33C5DC5;
	Wed, 27 May 2026 20:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779913671; cv=none; b=R89rCY6beBGMZUX2qgS6CxjySougVER+ImvHFXR7RG+T32YuuohnaJ0BirsLl1flNUyK+KKNZJlTVb/aReXYF/JINZQQjRWNTJOc7ifx+iSjce9xMQ8yAm+CtrkEAu6Xo4u13WjfZv1TGCIzXo0vPWu43djNcgBs2aM9ph1jRYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779913671; c=relaxed/simple;
	bh=98esLAp6737wLpPw6beh4dpuTuo5C/lSCgzwpXV1Qgw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vj8CCmDckX5tZtVbsnsavZNFgggCjhX2RyWhgqndU/ZhMTjVuhdnbCuMpUZHISkNeNZhc4kLryi//KrJd6RQfYBVH7fk/+sUrTvouVH+BZuNzYRMLNjnEzaQvgpI9vKH19MQr5QbPqP7ex4LUD6NwDjLW+HcaH50lJBL4FV1nfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M/GticcQ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M/GticcQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779913669; x=1811449669;
  h=date:from:to:cc:subject:message-id;
  bh=98esLAp6737wLpPw6beh4dpuTuo5C/lSCgzwpXV1Qgw=;
  b=M/GticcQ3oa3/labFeLoVIP5RBIxEX1bKHu+5WyUBfEQeBj4YZiQlUGq
   sjZGx8LRnOZuA/0J5exAK5/fS9cPGxSAvR/LW7gt5FzUjy+xrstvU1R6Z
   OojiQXsjEPl3f22CRTz0dob8Fk87pH0pJsQbpSAT3KG4oq9R7X4xr6cSf
   640Tc/yjYjfzDZZnoSVg7ipLSELDt74jehGi97nQCLCo52s+ky7C11yHN
   tVLPiwL3Yvkvn0mvR/lkLLyUYFrNxJHyD54yLLQX4DQgA4xyWsR1N9ISX
   fB5EJ/Dk9fJA3yEnjOUAgcy9PSYJNR0CyErkxBRVzYwKFLQYRw8tRB/7x
   g==;
X-CSE-ConnectionGUID: 6WYrIXyJTsGEYMrNmk9TJA==
X-CSE-MsgGUID: IC9xpVKPQSSGYLgAaqJUMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91444934"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="91444934"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 13:27:48 -0700
X-CSE-ConnectionGUID: dYJbiqIiT2O2jIyd0lc3jA==
X-CSE-MsgGUID: 9iRXkkIATBOAhSyrfnQT1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="246374872"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 May 2026 13:27:47 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSKqt-000000004Qa-3SbL;
	Wed, 27 May 2026 20:27:43 +0000
Date: Thu, 28 May 2026 04:26:49 +0800
From: kernel test robot <lkp@intel.com>
To: Ricardo Robaina <rrobaina@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Paul Moore <paul@paul-moore.com>
Subject: [linux-next:master 8419/8766] kernel/auditfilter.c:592:60:
 error: too many arguments provided to function-like macro invocation
Message-ID: <202605280441.YSawqHBc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e7d700e14934e68f86338c5610cf2ae76798b663
commit: 84470b80b7b0ded9a6b071a211a028fe5fec7e44 [8419/8766] audit: fix recursive locking deadlock in audit_dupe_exe()
config: arm-randconfig-003-20260528 (https://download.01.org/0day-ci/archive/20260528/202605280441.YSawqHBc-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 853d532794be83adc97d51c9ff8c9095ce32631b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605280441.YSawqHBc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605280441.YSawqHBc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/auditfilter.c:592:60: error: too many arguments provided to function-like macro invocation
     592 |                         audit_mark = audit_alloc_mark(&entry->rule, str, f_val, NULL);
         |                                                                                 ^
   kernel/audit.h:327:9: note: macro 'audit_alloc_mark' defined here
     327 | #define audit_alloc_mark(k, p, l) (ERR_PTR(-EINVAL))
         |         ^
>> kernel/auditfilter.c:592:17: error: use of undeclared identifier 'audit_alloc_mark'; did you mean 'audit_alloc'?
     592 |                         audit_mark = audit_alloc_mark(&entry->rule, str, f_val, NULL);
         |                                      ^~~~~~~~~~~~~~~~
         |                                      audit_alloc
   include/linux/audit.h:604:19: note: 'audit_alloc' declared here
     604 | static inline int audit_alloc(struct task_struct *task)
         |                   ^
>> kernel/auditfilter.c:592:15: error: incompatible pointer types assigning to 'struct audit_fsnotify_mark *' from 'int (struct task_struct *)' [-Wincompatible-pointer-types]
     592 |                         audit_mark = audit_alloc_mark(&entry->rule, str, f_val, NULL);
         |                                    ^ ~~~~~~~~~~~~~~~~
   kernel/auditfilter.c:879:35: error: too many arguments provided to function-like macro invocation
     879 |                         err = audit_dupe_exe(new, old, ctx);
         |                                                        ^
   kernel/audit.h:333:9: note: macro 'audit_dupe_exe' defined here
     333 | #define audit_dupe_exe(n, o) (-EINVAL)
         |         ^
>> kernel/auditfilter.c:879:10: error: use of undeclared identifier 'audit_dupe_exe'; did you mean 'audit_dupe_rule'?
     879 |                         err = audit_dupe_exe(new, old, ctx);
         |                               ^~~~~~~~~~~~~~
         |                               audit_dupe_rule
   kernel/auditfilter.c:819:21: note: 'audit_dupe_rule' declared here
     819 | struct audit_entry *audit_dupe_rule(struct audit_krule *old,
         |                     ^
>> kernel/auditfilter.c:879:8: error: incompatible pointer to integer conversion assigning to 'int' from 'struct audit_entry *(struct audit_krule *, struct audit_watch_ctx *)' [-Wint-conversion]
     879 |                         err = audit_dupe_exe(new, old, ctx);
         |                             ^ ~~~~~~~~~~~~~~
   6 errors generated.


vim +592 kernel/auditfilter.c

   446	
   447	/* Translate struct audit_rule_data to kernel's rule representation. */
   448	static struct audit_entry *audit_data_to_entry(struct audit_rule_data *data,
   449						       size_t datasz)
   450	{
   451		int err = 0;
   452		struct audit_entry *entry;
   453		void *bufp;
   454		size_t remain = datasz - sizeof(struct audit_rule_data);
   455		int i;
   456		char *str;
   457		struct audit_fsnotify_mark *audit_mark;
   458	
   459		entry = audit_to_entry_common(data);
   460		if (IS_ERR(entry))
   461			goto exit_nofree;
   462	
   463		bufp = data->buf;
   464		for (i = 0; i < data->field_count; i++) {
   465			struct audit_field *f = &entry->rule.fields[i];
   466			u32 f_val;
   467	
   468			err = -EINVAL;
   469	
   470			f->op = audit_to_op(data->fieldflags[i]);
   471			if (f->op == Audit_bad)
   472				goto exit_free;
   473	
   474			f->type = data->fields[i];
   475			f_val = data->values[i];
   476	
   477			/* Support legacy tests for a valid loginuid */
   478			if ((f->type == AUDIT_LOGINUID) && (f_val == AUDIT_UID_UNSET)) {
   479				f->type = AUDIT_LOGINUID_SET;
   480				f_val = 0;
   481				entry->rule.pflags |= AUDIT_LOGINUID_LEGACY;
   482			}
   483	
   484			err = audit_field_valid(entry, f);
   485			if (err)
   486				goto exit_free;
   487	
   488			err = -EINVAL;
   489			switch (f->type) {
   490			case AUDIT_LOGINUID:
   491			case AUDIT_UID:
   492			case AUDIT_EUID:
   493			case AUDIT_SUID:
   494			case AUDIT_FSUID:
   495			case AUDIT_OBJ_UID:
   496				f->uid = make_kuid(current_user_ns(), f_val);
   497				if (!uid_valid(f->uid))
   498					goto exit_free;
   499				break;
   500			case AUDIT_GID:
   501			case AUDIT_EGID:
   502			case AUDIT_SGID:
   503			case AUDIT_FSGID:
   504			case AUDIT_OBJ_GID:
   505				f->gid = make_kgid(current_user_ns(), f_val);
   506				if (!gid_valid(f->gid))
   507					goto exit_free;
   508				break;
   509			case AUDIT_ARCH:
   510				f->val = f_val;
   511				entry->rule.arch_f = f;
   512				break;
   513			case AUDIT_SUBJ_USER:
   514			case AUDIT_SUBJ_ROLE:
   515			case AUDIT_SUBJ_TYPE:
   516			case AUDIT_SUBJ_SEN:
   517			case AUDIT_SUBJ_CLR:
   518			case AUDIT_OBJ_USER:
   519			case AUDIT_OBJ_ROLE:
   520			case AUDIT_OBJ_TYPE:
   521			case AUDIT_OBJ_LEV_LOW:
   522			case AUDIT_OBJ_LEV_HIGH:
   523				str = audit_unpack_string(&bufp, &remain, f_val);
   524				if (IS_ERR(str)) {
   525					err = PTR_ERR(str);
   526					goto exit_free;
   527				}
   528				entry->rule.buflen += f_val;
   529				f->lsm_str = str;
   530				err = security_audit_rule_init(f->type, f->op, str,
   531							       (void **)&f->lsm_rule,
   532							       GFP_KERNEL);
   533				/* Keep currently invalid fields around in case they
   534				 * become valid after a policy reload. */
   535				if (err == -EINVAL) {
   536					pr_warn("audit rule for LSM \'%s\' is invalid\n",
   537						str);
   538					err = 0;
   539				} else if (err)
   540					goto exit_free;
   541				break;
   542			case AUDIT_WATCH:
   543				str = audit_unpack_string(&bufp, &remain, f_val);
   544				if (IS_ERR(str)) {
   545					err = PTR_ERR(str);
   546					goto exit_free;
   547				}
   548				err = audit_to_watch(&entry->rule, str, f_val, f->op);
   549				if (err) {
   550					kfree(str);
   551					goto exit_free;
   552				}
   553				entry->rule.buflen += f_val;
   554				break;
   555			case AUDIT_DIR:
   556				str = audit_unpack_string(&bufp, &remain, f_val);
   557				if (IS_ERR(str)) {
   558					err = PTR_ERR(str);
   559					goto exit_free;
   560				}
   561				err = audit_make_tree(&entry->rule, str, f->op);
   562				kfree(str);
   563				if (err)
   564					goto exit_free;
   565				entry->rule.buflen += f_val;
   566				break;
   567			case AUDIT_INODE:
   568				f->val = f_val;
   569				err = audit_to_inode(&entry->rule, f);
   570				if (err)
   571					goto exit_free;
   572				break;
   573			case AUDIT_FILTERKEY:
   574				if (entry->rule.filterkey || f_val > AUDIT_MAX_KEY_LEN)
   575					goto exit_free;
   576				str = audit_unpack_string(&bufp, &remain, f_val);
   577				if (IS_ERR(str)) {
   578					err = PTR_ERR(str);
   579					goto exit_free;
   580				}
   581				entry->rule.buflen += f_val;
   582				entry->rule.filterkey = str;
   583				break;
   584			case AUDIT_EXE:
   585				if (entry->rule.exe || f_val > PATH_MAX)
   586					goto exit_free;
   587				str = audit_unpack_string(&bufp, &remain, f_val);
   588				if (IS_ERR(str)) {
   589					err = PTR_ERR(str);
   590					goto exit_free;
   591				}
 > 592				audit_mark = audit_alloc_mark(&entry->rule, str, f_val, NULL);
   593				if (IS_ERR(audit_mark)) {
   594					kfree(str);
   595					err = PTR_ERR(audit_mark);
   596					goto exit_free;
   597				}
   598				entry->rule.buflen += f_val;
   599				entry->rule.exe = audit_mark;
   600				break;
   601			default:
   602				f->val = f_val;
   603				break;
   604			}
   605		}
   606	
   607		if (entry->rule.inode_f && entry->rule.inode_f->op == Audit_not_equal)
   608			entry->rule.inode_f = NULL;
   609	
   610	exit_nofree:
   611		return entry;
   612	
   613	exit_free:
   614		if (entry->rule.tree)
   615			audit_put_tree(entry->rule.tree); /* that's the temporary one */
   616		if (entry->rule.exe)
   617			audit_remove_mark(entry->rule.exe); /* that's the template one */
   618		audit_free_rule(entry);
   619		return ERR_PTR(err);
   620	}
   621	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
