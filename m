Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95332D6E6F;
	Fri, 27 Mar 2026 05:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774591017; cv=none; b=XS4fC7/ff2u6Zfpajd5ZXn+EWF7psDggWCDgHFCAAlU9r4gtTcjxccub73oK/b9RutuPMl6XBn40JSg0Nlk1MUkG7AvdSWGoKPd/h1jFT59nYZVwwIyN8JhC5vdgcq9uqSwmLCets/2/k6JEOopwsnUFj8mIm/9mTesuTS/Ghhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774591017; c=relaxed/simple;
	bh=0fJU6J+x/EvBkIdSK+IV/VVocTmTZfj5R9vMmftQYSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LVZiBnlJPurGCP9zFk+XemjzW/nnsf/PLAWmyhY8X2cV0RybvVnkUYrBety3SiZF50mwC1YGgveHNGOlyFhVaFifcG/xhtsR0i3VqGPTgCtT2FSPR5+QuP7p7dTyk2sv1jKgXVkjv2NaSLB/p5lcIMD3r7n4fiDj8OS6BRQr0EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a3KIqFCk; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a3KIqFCk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774591012; x=1806127012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0fJU6J+x/EvBkIdSK+IV/VVocTmTZfj5R9vMmftQYSU=;
  b=a3KIqFCkSL7dGsgA3FGI54R+dxFzl+eRU4I3RB6Ee35CFxPY3YDg3NGz
   V0TmLaFvHRWFEESrkg8PfW0dQkTazVLQ17vQ061kjBFy87JpgNx4SdntQ
   epkVJAr9r/37JWgzPipzjkTN4VUVnke4JkhjqpOKnTSRQ105OBoN9ceMU
   nyUhzt5574elYFBgfk0FLvYOjLnJ8I/3HD0wx3HPN5U4wdt687wPY1KCq
   qM6OTTWUV+1qGIIDbg4T93T9IL7fttztAH8rI5VwYxoXz3KA1e/4xDcWU
   VXXS54EtHEpQGoumTG0FmFW5B9i+/ep7ekGaB6wlL2fn0+YgT4uMxDO4h
   A==;
X-CSE-ConnectionGUID: +zOPs9PUS526xPukWFG5YQ==
X-CSE-MsgGUID: 7LKOo0NFQ6eugRUEvqEGuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="98277736"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="98277736"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 22:56:52 -0700
X-CSE-ConnectionGUID: mjAytu3mTyS7tHadZMVb/g==
X-CSE-MsgGUID: 0J0tSfQtRKWktDgqJlJ1uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="230002531"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 26 Mar 2026 22:56:51 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w60Bc-000000007S9-27t6;
	Fri, 27 Mar 2026 05:56:48 +0000
Date: Fri, 27 Mar 2026 06:56:40 +0100
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <cel@kernel.org>, NeilBrown <neil@brown.name>,
	Jeff Layton <jlayton@kernel.org>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-nfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Chuck Lever <chuck.lever@oracle.com>
Subject: Re: [PATCH v5 1/7] NFSD: Extract revoke_one_stid() utility function
Message-ID: <202603270629.lOb5BcMW-lkp@intel.com>
References: <20260326-umount-kills-nfsv4-state-v5-1-d2ce071b3570@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-umount-kills-nfsv4-state-v5-1-d2ce071b3570@oracle.com>

Hi Chuck,

kernel test robot noticed the following build errors:

[auto build test ERROR on 65058e9e9b20619f920397f529072e853dd43811]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuck-Lever/NFSD-Extract-revoke_one_stid-utility-function/20260327-081757
base:   65058e9e9b20619f920397f529072e853dd43811
patch link:    https://lore.kernel.org/r/20260326-umount-kills-nfsv4-state-v5-1-d2ce071b3570%40oracle.com
patch subject: [PATCH v5 1/7] NFSD: Extract revoke_one_stid() utility function
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260327/202603270629.lOb5BcMW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603270629.lOb5BcMW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603270629.lOb5BcMW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfsd/nfs4state.c:1830:14: error: use of undeclared identifier 'state_lock'; did you mean 'task_lock'?
    1830 |                 spin_lock(&state_lock);
         |                            ^~~~~~~~~~
         |                            task_lock
   include/linux/sched/task.h:216:20: note: 'task_lock' declared here
     216 | static inline void task_lock(struct task_struct *p)
         |                    ^
   fs/nfsd/nfs4state.c:1833:16: error: use of undeclared identifier 'state_lock'; did you mean 'task_lock'?
    1833 |                 spin_unlock(&state_lock);
         |                              ^~~~~~~~~~
         |                              task_lock
   include/linux/sched/task.h:216:20: note: 'task_lock' declared here
     216 | static inline void task_lock(struct task_struct *p)
         |                    ^
   2 errors generated.


vim +1830 fs/nfsd/nfs4state.c

  1805	
  1806	static void revoke_one_stid(struct nfs4_client *clp, struct nfs4_stid *stid)
  1807	{
  1808		struct nfs4_ol_stateid *stp;
  1809		struct nfs4_delegation *dp;
  1810	
  1811		switch (stid->sc_type) {
  1812		case SC_TYPE_OPEN:
  1813			stp = openlockstateid(stid);
  1814			mutex_lock_nested(&stp->st_mutex, OPEN_STATEID_MUTEX);
  1815			revoke_ol_stid(clp, stp);
  1816			mutex_unlock(&stp->st_mutex);
  1817			break;
  1818		case SC_TYPE_LOCK:
  1819			stp = openlockstateid(stid);
  1820			mutex_lock_nested(&stp->st_mutex, LOCK_STATEID_MUTEX);
  1821			revoke_ol_stid(clp, stp);
  1822			mutex_unlock(&stp->st_mutex);
  1823			break;
  1824		case SC_TYPE_DELEG:
  1825			/*
  1826			 * Extra reference guards against concurrent FREE_STATEID.
  1827			 */
  1828			refcount_inc(&stid->sc_count);
  1829			dp = delegstateid(stid);
> 1830			spin_lock(&state_lock);
  1831			if (!unhash_delegation_locked(dp, SC_STATUS_ADMIN_REVOKED))
  1832				dp = NULL;
  1833			spin_unlock(&state_lock);
  1834			if (dp)
  1835				revoke_delegation(dp);
  1836			else
  1837				nfs4_put_stid(stid);
  1838			break;
  1839		case SC_TYPE_LAYOUT:
  1840			nfsd4_close_layout(layoutstateid(stid));
  1841			break;
  1842		}
  1843	}
  1844	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
