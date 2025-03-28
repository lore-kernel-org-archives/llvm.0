Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F00A1A0BD6;
	Fri, 28 Mar 2025 06:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743142549; cv=none; b=kHVz9KtUBPkZcW3z8v9v+arxnELnEIrYqeu/HfKy0lu28FEqQFoHeCbbu4xeKF2+ThG+TGSMLNT/CAqmof5zbvsmg3XoyQum2fAnlYQc7w9gkDrII3MWEam4BcE7cKdvlVmtnuzQ4mpQPPlH6fxFrRl0psEbz1MT/Xvu5hZ4+vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743142549; c=relaxed/simple;
	bh=t0+avbavxqKf2SBDgwvGRH1AbocKdwk3H54ZpeoBmnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cxFPYcS6hni5GktlKB/xw9UNg8XoSMzaLVzhiL0CWhlye/8ZMv3l3e0BxT4XEZwiziPmQkJDno3sp4rddSDRnvXyvuIvhvkgKOodkFRRpnTfx7PfMNTVk9IsdKpJlb7QKtqVeKGh7qlF1g+RuYSoU+WaGwerNyg/pUfkhDWkQ48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ETittspV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ETittspV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743142548; x=1774678548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t0+avbavxqKf2SBDgwvGRH1AbocKdwk3H54ZpeoBmnI=;
  b=ETittspVpRVjA8qjedyjfY1d4vmZpbLu5JYWu+pxF2nN+v8AZSyx7lx2
   ekE/DDnBKY8xyAopj0iatmC2qQFt33YqxU+YwjQpD6rXxLbN3EY91KwzV
   /kpSCS/XklqSHhcZP9Mkbx9lUw0HMN+Lpx+nNXP+HFJ01DKTH+fgd01H5
   yeER0j0Qmpg4A9iDy78z4nmGgD52MDyUziFRWv2jx9223Lrh8pNzCinOD
   r/Lpotep821QzCLyRHHpCXse9XYH0ciVCHPwFdRO6/k9Y+mFV4ewke9Hz
   haiCY/1j5eG2SV6wdBviG11DWUBU7xyEOXAkUkUoKl2v4l1ZBU2b2OMtg
   w==;
X-CSE-ConnectionGUID: /hwTu6R7Q2eI0EKxVO9ZMQ==
X-CSE-MsgGUID: 6fIIUxkQT82djVeS7nAS1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55867267"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="55867267"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 23:15:46 -0700
X-CSE-ConnectionGUID: qZ/9Tp1ySYqBI7PGafHoHA==
X-CSE-MsgGUID: hSPnELrAQZO+BKYzYHE3Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="129507775"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 27 Mar 2025 23:15:44 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ty30I-0007AY-1o;
	Fri, 28 Mar 2025 06:15:42 +0000
Date: Fri, 28 Mar 2025 14:15:28 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/scx-dlserver-boost 16/16]
 kernel/sched/deadline.c:1765:5: warning: no previous prototype for function
 'dl_server_remove_params'
Message-ID: <202503281421.a2nhfsTA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/scx-dlserver-boost
head:   153b74fef19625181700e52ed4017330372a961e
commit: 153b74fef19625181700e52ed4017330372a961e [16/16] Add a function to remove the dl_server's bw reservation
config: riscv-randconfig-002-20250328 (https://download.01.org/0day-ci/archive/20250328/202503281421.a2nhfsTA-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503281421.a2nhfsTA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503281421.a2nhfsTA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:60:
>> kernel/sched/deadline.c:1765:5: warning: no previous prototype for function 'dl_server_remove_params' [-Wmissing-prototypes]
    1765 | int dl_server_remove_params(struct sched_dl_entity *dl_se)
         |     ^
   kernel/sched/deadline.c:1765:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1765 | int dl_server_remove_params(struct sched_dl_entity *dl_se)
         | ^
         | static 
   1 warning generated.


vim +/dl_server_remove_params +1765 kernel/sched/deadline.c

  1755	
  1756	/**
  1757	 * dl_server_remove_params - Remove bandwidth reservation for a DL server
  1758	 * @dl_se: The DL server entity to remove bandwidth for
  1759	 *
  1760	 * This function removes the bandwidth reservation for a DL server entity,
  1761	 * cleaning up all bandwidth accounting and server state.
  1762	 *
  1763	 * Returns: 0 on success, negative error code on failure
  1764	 */
> 1765	int dl_server_remove_params(struct sched_dl_entity *dl_se)
  1766	{
  1767	    struct rq *rq = dl_se->rq;
  1768	    int cpu = cpu_of(rq);
  1769	    struct dl_bw *dl_b;
  1770	    int cpus;
  1771	
  1772	    if (!dl_se->dl_runtime)
  1773	        return 0;  /* Already disabled */
  1774	
  1775	    /*
  1776		 * First dequeue if still queued. It should not be queued since
  1777		 * we call this only after the last dl_server_stop().
  1778		 */
  1779	    if (WARN_ON_ONCE(on_dl_rq(dl_se)))
  1780	        dequeue_dl_entity(dl_se, DEQUEUE_SLEEP);
  1781	
  1782	    /* Cancel any pending timers */
  1783	    hrtimer_try_to_cancel(&dl_se->dl_timer);
  1784	    hrtimer_try_to_cancel(&dl_se->inactive_timer);
  1785	
  1786	    
  1787		/* Remove bandwidth from both runqueue and root domain accounting */
  1788	    dl_b = dl_bw_of(cpu);
  1789	    guard(raw_spinlock)(&dl_b->lock);
  1790	    cpus = dl_bw_cpus(cpu);
  1791	
  1792	    sub_rq_bw(dl_se, &rq->dl);
  1793	    __dl_sub(dl_b, dl_se->dl_bw, cpus);
  1794	
  1795	    /*
  1796	     * If server was active and consuming bandwidth, remove it from
  1797	     * running bandwidth accounting. This should not happen because
  1798	     * we call this only after the last dl_server_stop().
  1799	     */
  1800	    if (WARN_ON_ONCE(!dl_se->dl_non_contending))
  1801	        sub_running_bw(dl_se, &rq->dl);
  1802	
  1803	    /*
  1804		 * Clear all server parameters. This will also clear ->dl_server so
  1805		 * the next dl_server_apply_params() will reconfigure the server.
  1806		 */
  1807	    __dl_clear_params(dl_se);
  1808	
  1809	    return 0;
  1810	}
  1811	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
