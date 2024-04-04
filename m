Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308A874400;
	Thu,  4 Apr 2024 09:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712221984; cv=none; b=iSuhphrWVsCZFFdGTltKihplQTaU9vU+G16vDf67Uwxbw0UYzFgz9k9Dm5yY9Gfa85MsjlRCsggU/sL1DQxJlj+brq933aj9okSbUzfoDM2BfO+OUc30V3EglcLYz4VJwJw5olRDdSQ3z8kF0wP/kqpk/PjXAZDSPBvWzTeUcL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712221984; c=relaxed/simple;
	bh=FYER5ATYPFtKR/i7wS4P5+crA3V9/TfOLGvkH8QlmJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fXiJj53ibcp7/moDjiAXRC6eOC3rRgC12HV3iMDkXH7/u4CDoUNZq5BHRTIxCyMfDuiIj7CfhFYLBnKrPzAa2im7Va91HD5hhB1zcE1JYxWEIzHbFpl2T9roj4kxAVJd+tfyQq2VqkvDAhzN1ywhegbkjO3is27Q4YQQH09EaVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DwpVoIQi; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DwpVoIQi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712221983; x=1743757983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FYER5ATYPFtKR/i7wS4P5+crA3V9/TfOLGvkH8QlmJ0=;
  b=DwpVoIQir4CHYvQDUBHyrSSTNIIh+fdLUBkINrhhOo4Wk/VBigQ1Y2qE
   mXdKKqPTS7ty4oJItYu6oYXRWf+T1qvMtawhqFV2+Fub6+CYGKV/M0msr
   l7RxBuXBZbzy4xbNz0viEJ7Ui/mm7SI56KR4CQSW16a+8RbHvXvT4c0lK
   wXDxQcDqL3iPi9MTrYj7MlM14YF8DfkNzQ4t39T/gK8JgNvtbBcfF+18B
   2UGCZrt5kReT+wPax+SoRceallU2/Ou01ZR+aTttKFSDkDi6KtGAMLaZN
   oLvlPxj7VAmhIcP4coKmlvoOhgZriN8J142rPEnMRaPXdz/FVJc3INQPL
   A==;
X-CSE-ConnectionGUID: VefXaKiZTHKmX/Qw+jaLdw==
X-CSE-MsgGUID: OMA78+l5SLGkc13Y4jwjjw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7660361"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="7660361"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 02:02:38 -0700
X-CSE-ConnectionGUID: 2ESFl/HsSwOn5bjAp0BF8Q==
X-CSE-MsgGUID: jP2Yk4TDSA6pIdlUcwYpjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="19310302"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Apr 2024 02:02:36 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsIzS-0000oi-1V;
	Thu, 04 Apr 2024 09:02:34 +0000
Date: Thu, 4 Apr 2024 17:02:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 16/20] security/selinux/selinuxfs.c:600:6:
 warning: logical not is only applied to the left hand side of this
 comparison
Message-ID: <202404041659.eAEyfzDC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   434bfd4fff7ae30ffe26a2e330ed50ff5bb34ee4
commit: 3094d40caca196d182c0f820b0d52e0fe7a5bf2f [16/20] security: convert to read/write iterators
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240404/202404041659.eAEyfzDC-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404041659.eAEyfzDC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404041659.eAEyfzDC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from security/selinux/selinuxfs.c:16:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> security/selinux/selinuxfs.c:600:6: warning: logical not is only applied to the left hand side of this comparison [-Wlogical-not-parentheses]
     600 |         if (!copy_from_iter(data, count, from) != 0)
         |             ^                                  ~~
   security/selinux/selinuxfs.c:600:6: note: add parentheses after the '!' to evaluate the comparison first
     600 |         if (!copy_from_iter(data, count, from) != 0)
         |             ^                                      
         |              (                                     )
   security/selinux/selinuxfs.c:600:6: note: add parentheses around left hand side expression to silence this warning
     600 |         if (!copy_from_iter(data, count, from) != 0)
         |             ^
         |             (                                 )
   2 warnings generated.


vim +600 security/selinux/selinuxfs.c

   573	
   574	{
   575		struct file *file = iocb->ki_filp;
   576		struct selinux_fs_info *fsi = file_inode(file)->i_sb->s_fs_info;
   577		struct selinux_load_state load_state;
   578		size_t count = iov_iter_count(from);
   579		ssize_t length;
   580		void *data = NULL;
   581	
   582		mutex_lock(&selinux_state.policy_mutex);
   583	
   584		length = avc_has_perm(current_sid(), SECINITSID_SECURITY,
   585				      SECCLASS_SECURITY, SECURITY__LOAD_POLICY, NULL);
   586		if (length)
   587			goto out;
   588	
   589		/* No partial writes. */
   590		length = -EINVAL;
   591		if (iocb->ki_pos != 0)
   592			goto out;
   593	
   594		length = -ENOMEM;
   595		data = vmalloc(count);
   596		if (!data)
   597			goto out;
   598	
   599		length = -EFAULT;
 > 600		if (!copy_from_iter(data, count, from) != 0)
   601			goto out;
   602	
   603		length = security_load_policy(data, count, &load_state);
   604		if (length) {
   605			pr_warn_ratelimited("SELinux: failed to load policy\n");
   606			goto out;
   607		}
   608	
   609		length = sel_make_policy_nodes(fsi, load_state.policy);
   610		if (length) {
   611			pr_warn_ratelimited("SELinux: failed to initialize selinuxfs\n");
   612			selinux_policy_cancel(&load_state);
   613			goto out;
   614		}
   615	
   616		selinux_policy_commit(&load_state);
   617	
   618		length = count;
   619	
   620		audit_log(audit_context(), GFP_KERNEL, AUDIT_MAC_POLICY_LOAD,
   621			"auid=%u ses=%u lsm=selinux res=1",
   622			from_kuid(&init_user_ns, audit_get_loginuid(current)),
   623			audit_get_sessionid(current));
   624	out:
   625		mutex_unlock(&selinux_state.policy_mutex);
   626		vfree(data);
   627		return length;
   628	}
   629	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
