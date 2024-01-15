Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D4617D5;
	Mon, 15 Jan 2024 02:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TBHePou1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705287291; x=1736823291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PmrqYi3b29cZ7UVE5sDTUs30E0JOvsUHpC87EcpooHg=;
  b=TBHePou1Px2a26EJG1gNAyKjMycDsgu9aiAIJfkpTv48K6itNiETfyxL
   hKf29f2GtX5al9kfy4OBvwakX0rngUwqZLka9GgGiWxI9I0yTIdzYr8Ca
   7KKom/F8VAkY89zw2M0CrqB+4a6UYuG2hAxnf1rJQQMbtbjPorhsPI9al
   Ntm7H8ruJGsfFiVVdczCLtdkKwZ3xtVFj9dZyHCDQoOt4vPyCcfTWuoE/
   G830KQC+daxztHr4OJeLStDePOjOKDnXel9wPdmno3A3+VEqo8GFR0HLl
   d9v1whHYRF45TQs0NOQi5mQdgpPLDnpP3K2xjqxIEUr3E/QUL4AX/iH6S
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="465902125"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="465902125"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 18:54:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="873962223"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="873962223"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Jan 2024 18:54:49 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPD7c-000C2Q-1m;
	Mon, 15 Jan 2024 02:54:45 +0000
Date: Mon, 15 Jan 2024 10:53:49 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [legion:patchset/meminfo/v2.1 2/6] fs/proc/cpuinfo.c:16:16: error:
 array initializer must be an initializer list
Message-ID: <202401151021.zhwCz9Ij-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git patchset/meminfo/v2.1
head:   b26ce8a047fe25e6d094cd573ab62709263545fd
commit: 894d5981f7e7db9482ef95472cf73f4bcc68a551 [2/6] proc: Implement /proc/self/cpuinfo
config: i386-randconfig-011-20240115 (https://download.01.org/0day-ci/archive/20240115/202401151021.zhwCz9Ij-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240115/202401151021.zhwCz9Ij-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401151021.zhwCz9Ij-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/proc/cpuinfo.c:16:16: error: array initializer must be an initializer list
      16 |         cpumask_var_t mask = NULL;
         |                       ^
   1 error generated.


vim +16 fs/proc/cpuinfo.c

    12	
    13	static bool cpu_allowed(struct seq_file *m, int cpu)
    14	{
    15		struct task_struct *task;
  > 16		cpumask_var_t mask = NULL;
    17	
    18		if (cpu >= nr_cpu_ids)
    19			return false;
    20	
    21		task = get_proc_task(file_inode(m->file));
    22		if (!task)
    23			return false;
    24	
    25		cpuset_cpus_allowed(task, mask);
    26		put_task_struct(task);
    27	
    28		return cpumask_test_cpu(cpu, mask);
    29	}
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
