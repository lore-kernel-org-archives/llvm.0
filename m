Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7000B11C9B;
	Sat, 22 Jul 2023 07:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690011719; x=1721547719;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1t7r9iswAGwnX4DCZBtxBayK813PjLsJi9RPVgk721M=;
  b=KlVzKm1Klb7FgZKwS5k8vp6apfLZlraF2KuyiLM4It4bsGioN9DhMeMQ
   YMUZJsHF0W575VZzku2nTJA1jq1zLb6dbAb6xpLS8p2nvoqBDpnUKnKvL
   WFqoVKDGZaiAb+hCzb3IBxVbiawLqxDNLAPkJXqUDbtxswHtkxuMWEM1/
   bxL04UzK78Zqe2FpYpCOiMvxhIM1rQqw57ZmTzRMsKi6N2BMpffl/i8JB
   Ccc5wUD9Sx938BT0MQ6UdRl3Nk3/93xeVjtP3piTbEmzZCh1J0wZrboFP
   in5nqrLK3M5YtJzv4Oifj4kEInxoFhhRcRDr2C+/WddU4/oNuYBHsMYHq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="352067691"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="352067691"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 00:41:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="898947564"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="898947564"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 22 Jul 2023 00:41:57 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qN7FU-000885-2y;
	Sat, 22 Jul 2023 07:41:56 +0000
Date: Sat, 22 Jul 2023 15:41:33 +0800
From: kernel test robot <lkp@intel.com>
To: kuifeng@meta.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next 2/5] bpf: Provide bpf_copy_from_user() and
 bpf_copy_to_user().
Message-ID: <202307221559.mSQLTotj-lkp@intel.com>
References: <20230722052248.1062582-3-kuifeng@meta.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230722052248.1062582-3-kuifeng@meta.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/kuifeng-meta-com/bpf-enable-sleepable-BPF-programs-attached-to-cgroup-get-set-sockopt/20230722-132551
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230722052248.1062582-3-kuifeng%40meta.com
patch subject: [RFC bpf-next 2/5] bpf: Provide bpf_copy_from_user() and bpf_copy_to_user().
config: powerpc-randconfig-r015-20230720 (https://download.01.org/0day-ci/archive/20230722/202307221559.mSQLTotj-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307221559.mSQLTotj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307221559.mSQLTotj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/helpers.c:681:17: warning: no previous prototype for function 'bpf_copy_to_user' [-Wmissing-prototypes]
     681 | __bpf_kfunc int bpf_copy_to_user(void *dst__uninit, u32 dst__sz,
         |                 ^
   kernel/bpf/helpers.c:681:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     681 | __bpf_kfunc int bpf_copy_to_user(void *dst__uninit, u32 dst__sz,
         |             ^
         |             static 
   1 warning generated.
--
>> kernel/bpf/helpers.c:673: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * long bpf_copy_to_user(void *dst, u32 size, const void *kern_ptr)


vim +/bpf_copy_to_user +681 kernel/bpf/helpers.c

   671	
   672	/**
 > 673	 * long bpf_copy_to_user(void *dst, u32 size, const void *kern_ptr)
   674	 *     Description
   675	 *             Read *size* bytes from kernel space address *kern_ptr* and
   676	 *              store the data in user space address *dst*. This is a
   677	 *              wrapper of **copy_to_user**\ ().
   678	 *     Return
   679	 *             0 on success, or a negative error in case of failure.
   680	 */
 > 681	__bpf_kfunc int bpf_copy_to_user(void *dst__uninit, u32 dst__sz,
   682					 const void *src__ign)
   683	{
   684		int ret = copy_to_user(dst__uninit, src__ign, dst__sz);
   685	
   686		if (unlikely(ret))
   687			return -EFAULT;
   688	
   689		return ret;
   690	}
   691	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
