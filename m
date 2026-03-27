Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7704536AB46;
	Fri, 27 Mar 2026 09:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774604182; cv=none; b=spuhYrVkXFZWWFviiXNqlVDQfH0kVSR62pmlXtT7yKkSfGYXmeo1/LAdkSHy5AyuCCe1xyQpGR69kePaxaZmWrF31gju9E+1Xr9ibbzMmVZ3XdkEiem7zg1GNBJO9S9ihSmTX0iw46/yHzNBO552OticU44hufBGyFSoGoEHHjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774604182; c=relaxed/simple;
	bh=PBwhHdoRja7dlpN2hamBn1BpdzNzw6McKoVgUYzeL/Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BxvOIPiUQ7KVt2WmakPrQUJzhN5coE0CT8q/nilh9Rs2PKf7F0LAwdbpfP45vOc3kCe+a1Q8Uqx3LXtl0eFYo+Av2sXzPGSDWOz+m8uReXvHvFLRsMNBGaXka5/p/KfJTeqt3gnx5izMIZcvGnswmzXEKaWdgYPRtYerrsrFcoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YwRaLjuP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YwRaLjuP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774604182; x=1806140182;
  h=date:from:to:cc:subject:message-id;
  bh=PBwhHdoRja7dlpN2hamBn1BpdzNzw6McKoVgUYzeL/Q=;
  b=YwRaLjuPZXRaXsF5dZjgDSRG0sY8Kn7S2Qnm9cv6fOn20ZA68JU1QwoM
   t2qpJkwMVOSHA9eigauDIt6vm+O7G4nhh8TD85mQA9h3Yal4rghyEi23b
   G2MNXFqwzyA0NQFmhMd6bG5SoNsMKhJAFhyI4+CF329wOYz2Ogi7wkUUh
   EI4VY5Yhy1Tpz61IoJQ2g4K4RLhB87z4OncnauHU9++4iEUKuNGrg2+5p
   Zb3v77a8TnBiyf/N053y30ocbWfKA2v1VHlQSq8WptpVvugCm9OnXgzXG
   znD4roDv8OvCUQd7cxL9VCWnd3hj3p1lA0G963/8frFuOCp+u4vgj7JMg
   A==;
X-CSE-ConnectionGUID: JePocGFNQtCMqqBpoG6gBw==
X-CSE-MsgGUID: ZzBjMBzhRP+my15DnSfjkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="101134434"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="101134434"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 02:36:21 -0700
X-CSE-ConnectionGUID: SQOR4W0VQjSi/w7j2odH9A==
X-CSE-MsgGUID: wwSF5KTvS/WWqsvHE5GyhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="222390876"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Mar 2026 02:36:19 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w63c1-00000000A7p-0ASF;
	Fri, 27 Mar 2026 09:36:17 +0000
Date: Fri, 27 Mar 2026 17:35:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 322/525] arch/powerpc/kvm/timing.c:172:6:
 error: cannot take the address of an rvalue of type 'char *'
Message-ID: <202603271712.kT4rdiHD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   520344cda122ca1903fafb19768f56509e3db8b1
commit: 347664d07e7cc165e1dae2f95b2f6f1053a62844 [322/525] powerpc/kvm: convert to read/write iterators
config: powerpc64-randconfig-002-20260327 (https://download.01.org/0day-ci/archive/20260327/202603271712.kT4rdiHD-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603271712.kT4rdiHD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603271712.kT4rdiHD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/kvm/timing.c:172:6: error: cannot take the address of an rvalue of type 'char *'
     172 |         if (get_iter(&c, from)) {
         |             ^        ~~
   include/linux/uio.h:243:50: note: expanded from macro 'get_iter'
     243 | #define get_iter(val, from)     !copy_from_iter_full(&(val), sizeof((val)), from)
         |                                                      ^ ~~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
>> arch/powerpc/kvm/timing.c:172:6: error: cannot take the address of an rvalue of type 'char *'
     172 |         if (get_iter(&c, from)) {
         |             ^        ~~
   include/linux/uio.h:243:50: note: expanded from macro 'get_iter'
     243 | #define get_iter(val, from)     !copy_from_iter_full(&(val), sizeof((val)), from)
         |                                                      ^ ~~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:61: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
>> arch/powerpc/kvm/timing.c:172:6: error: cannot take the address of an rvalue of type 'char *'
     172 |         if (get_iter(&c, from)) {
         |             ^        ~~
   include/linux/uio.h:243:50: note: expanded from macro 'get_iter'
     243 | #define get_iter(val, from)     !copy_from_iter_full(&(val), sizeof((val)), from)
         |                                                      ^ ~~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:86: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                                      ^~~~
   include/linux/compiler.h:68:3: note: expanded from macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   3 errors generated.


vim +172 arch/powerpc/kvm/timing.c

   159	
   160	/* Write 'c' to clear the timing statistics. */
   161	static ssize_t kvmppc_exit_timing_write(struct kiocb *iocb,
   162						struct iov_iter *from)
   163	{
   164		size_t count = iov_iter_count(from);
   165		int err = -EINVAL;
   166		char c;
   167	
   168		if (count > 1) {
   169			goto done;
   170		}
   171	
 > 172		if (get_iter(&c, from)) {
   173			err = -EFAULT;
   174			goto done;
   175		}
   176	
   177		if (c == 'c') {
   178			struct seq_file *seqf = iocb->ki_filp->private_data;
   179			struct kvm_vcpu *vcpu = seqf->private;
   180			/* Write does not affect our buffers previously generated with
   181			 * show. seq_file is locked here to prevent races of init with
   182			 * a show call */
   183			mutex_lock(&seqf->lock);
   184			kvmppc_init_timing_stats(vcpu);
   185			mutex_unlock(&seqf->lock);
   186			err = count;
   187		}
   188	
   189	done:
   190		return err;
   191	}
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
