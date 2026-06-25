Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16EF3A6B70;
	Thu, 25 Jun 2026 01:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782352728; cv=none; b=AYhKhgoEHlEDxc5ExJuO5GWCVa5cp9XLcThSTGLe5I3a7PBNqtF02dNTJCBgBRKwiM7Xixgoxb4fWwNddVMiW/Gs2Hm/1nq6kKLle/26Zr0bZXjbs8ooAO4Y2/j7Aivz6WCc4gY53n2u478YFjxopyQBZbnQ/p6JgIe++wKqor8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782352728; c=relaxed/simple;
	bh=G5lHR/67eZsmT+DqcKjWR5aN2FGRVHuF1mJ6DM47nYw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FzaBjz+7Fj0hTxaAuXlyCWVuMYCEU8sfMV4hj1ohu54uAHZbVCHOC1glNP7v3meI24SKpKMkL9x5fhtfBMcqR5EBlKpZZrmiy1tK5onJ47jPyUbOqc2qnodmBTZPMo+ivXGRnjFQqH7OCvZbfHqXEprgpwm/oCxOBQWYXVTBAU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P0GNcDFP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P0GNcDFP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782352724; x=1813888724;
  h=date:from:to:cc:subject:message-id;
  bh=G5lHR/67eZsmT+DqcKjWR5aN2FGRVHuF1mJ6DM47nYw=;
  b=P0GNcDFPMDFQFVZAtLu1ZYlaZwnhIUu5TGQLKaUHdZIGbaQdDzOJ49UA
   bxQ1ZngNGcNhYJrLxCJbbfOvwgvoUZECcSc1pc8AuI+k4tVT5e/Ygi4Yn
   NMq8dYgzgCOuU0hzgW9alGX7CYvQYljzQucsdunLmsMeBqhKc+hjN9NQz
   ECZIFlQtWWgnHG8wnWs2vZhh9BKH+N/QiXDt3HjBCXgqVioTrqnM7KNwr
   9NjzSBbiE7QHIPBupbchwd/h0t+kx0dQL35mzLL5gFbMBontDAXc9+CVh
   Dacw6RRqMBPSqkKotvxnnmLMo6OEUMle4kOiAOjJMM8aF98XqTn53w+Wu
   g==;
X-CSE-ConnectionGUID: GtGFwe+9R7afHkuAJIZIJQ==
X-CSE-MsgGUID: ZT/m72/7TLyImqE3gVXVxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="70635033"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="70635033"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 18:58:43 -0700
X-CSE-ConnectionGUID: E9Ci0If3SaOsqcZv17+2rA==
X-CSE-MsgGUID: jIumlTPpQbKprmxuY4XDaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="273770346"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 24 Jun 2026 18:58:19 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcZM8-000000003q1-4AKB;
	Thu, 25 Jun 2026 01:58:16 +0000
Date: Thu, 25 Jun 2026 09:57:47 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:abi-test 26/34] net/sctp/socket.c:7309:6:
 error: call to undeclared function 'in_ia32_syscall'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202606250903.GjR7hxXg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git abi-test
head:   741e95c4b46803e113402223592189848b0ac9c8
commit: d81a3a57360fb9705dbc00b272573f277717b9fe [26/34] uapi: explict padding for sctp
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260625/202606250903.GjR7hxXg-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606250903.GjR7hxXg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606250903.GjR7hxXg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/sctp/socket.c:45:
   In file included from include/linux/ip.h:16:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> net/sctp/socket.c:7309:6: error: call to undeclared function 'in_ia32_syscall'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    7309 |         if (in_ia32_syscall())
         |             ^
   1 warning and 1 error generated.


vim +/in_ia32_syscall +7309 net/sctp/socket.c

  7289	
  7290	/*
  7291	 * SCTP_GET_ASSOC_STATS
  7292	 *
  7293	 * This option retrieves local per endpoint statistics. It is modeled
  7294	 * after OpenSolaris' implementation
  7295	 */
  7296	static int sctp_getsockopt_assoc_stats(struct sock *sk, int len,
  7297					       char __user *optval,
  7298					       int __user *optlen)
  7299	{
  7300		struct sctp_assoc_stats sas;
  7301		struct sctp_association *asoc = NULL;
  7302	
  7303		/* User must provide at least the assoc id */
  7304		if (len < sizeof(sctp_assoc_t))
  7305			return -EINVAL;
  7306	
  7307	#ifdef CONFIG_X86_64
  7308		/* FIXME: need to convert sctp_assoc_stats layout */
> 7309		if (in_ia32_syscall())
  7310			return -ENOSYS;
  7311	#endif
  7312	
  7313		/* Allow the struct to grow and fill in as much as possible */
  7314		len = min_t(size_t, len, sizeof(sas));
  7315	
  7316		if (copy_from_user(&sas, optval, len))
  7317			return -EFAULT;
  7318	
  7319		asoc = sctp_id2assoc(sk, sas.sas_assoc_id);
  7320		if (!asoc)
  7321			return -EINVAL;
  7322	
  7323		sas.sas_rtxchunks = asoc->stats.rtxchunks;
  7324		sas.sas_gapcnt = asoc->stats.gapcnt;
  7325		sas.sas_outofseqtsns = asoc->stats.outofseqtsns;
  7326		sas.sas_osacks = asoc->stats.osacks;
  7327		sas.sas_isacks = asoc->stats.isacks;
  7328		sas.sas_octrlchunks = asoc->stats.octrlchunks;
  7329		sas.sas_ictrlchunks = asoc->stats.ictrlchunks;
  7330		sas.sas_oodchunks = asoc->stats.oodchunks;
  7331		sas.sas_iodchunks = asoc->stats.iodchunks;
  7332		sas.sas_ouodchunks = asoc->stats.ouodchunks;
  7333		sas.sas_iuodchunks = asoc->stats.iuodchunks;
  7334		sas.sas_idupchunks = asoc->stats.idupchunks;
  7335		sas.sas_opackets = asoc->stats.opackets;
  7336		sas.sas_ipackets = asoc->stats.ipackets;
  7337	
  7338		/* New high max rto observed, will return 0 if not a single
  7339		 * RTO update took place. obs_rto_ipaddr will be bogus
  7340		 * in such a case
  7341		 */
  7342		sas.sas_maxrto = asoc->stats.max_obs_rto;
  7343		memcpy(&sas.sas_obs_rto_ipaddr, &asoc->stats.obs_rto_ipaddr,
  7344			sizeof(struct sockaddr_storage));
  7345	
  7346		/* Mark beginning of a new observation period */
  7347		asoc->stats.max_obs_rto = asoc->rto_min;
  7348	
  7349		if (put_user(len, optlen))
  7350			return -EFAULT;
  7351	
  7352		pr_debug("%s: len:%d, assoc_id:%d\n", __func__, len, sas.sas_assoc_id);
  7353	
  7354		if (copy_to_user(optval, &sas, len))
  7355			return -EFAULT;
  7356	
  7357		return 0;
  7358	}
  7359	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
