Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CBA947B;
	Tue, 12 Sep 2023 18:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694544681; x=1726080681;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m4ArRUJq81IoQwOUurgDTOz0S2e8/xwn1JxXLNRgGXc=;
  b=D9B170+VMzpN6ux9v/C3QKGCapm34pk5/qi2YlqERKPpWTCy6GVbhBUl
   x/lFA1NiwWIrUZn1F0vnM+i4zDirKgecChdrR7CSciqX1hzWPI7uPFz0J
   ameNgbt6r3ASYCbmp8nLddJyn0MtPzoZiez7HybX40flZYu0Ue7B4d7LH
   OLBQik5Bhg2GdhqPV1rXXl6cEYzwhCwAnrbVuSu/Gsuizhln196KMYKC+
   IroKacPAXE1N6yuyRMfTU5MCu2k6VQuSyLYEEy+c2sdObKCKi889QSezl
   qn0Rs7wOIE2bTSZlYO4lKeHFm6nwJLnUjSTpQ3SGMUJn/6D99PuuEvdFH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="382272922"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="382272922"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 11:51:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="887041629"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="887041629"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 12 Sep 2023 11:50:45 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg8Tf-00008v-17;
	Tue, 12 Sep 2023 18:51:11 +0000
Date: Wed, 13 Sep 2023 02:50:29 +0800
From: kernel test robot <lkp@intel.com>
To: Pingfan Liu <piliu@redhat.com>, linuxppc-dev@lists.ozlabs.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Baoquan He <bhe@redhat.com>, Pingfan Liu <piliu@redhat.com>,
	kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>,
	Ming Lei <ming.lei@redhat.com>, Wen Xiong <wenxiong@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCHv6 1/3] powerpc/setup: Loosen the mapping between cpu
 logical id and its seq in dt
Message-ID: <202309130232.N2REwHBv-lkp@intel.com>
References: <20230911131855.40738-2-piliu@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911131855.40738-2-piliu@redhat.com>

Hi Pingfan,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/fixes]
[also build test ERROR on linus/master v6.6-rc1 next-20230912]
[cannot apply to powerpc/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pingfan-Liu/powerpc-setup-Loosen-the-mapping-between-cpu-logical-id-and-its-seq-in-dt/20230911-213042
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes
patch link:    https://lore.kernel.org/r/20230911131855.40738-2-piliu%40redhat.com
patch subject: [PATCHv6 1/3] powerpc/setup: Loosen the mapping between cpu logical id and its seq in dt
config: powerpc-randconfig-r032-20230912 (https://download.01.org/0day-ci/archive/20230913/202309130232.N2REwHBv-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130232.N2REwHBv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130232.N2REwHBv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: boot_cpu_hwid
   >>> referenced by setup-common.c:0 (arch/powerpc/kernel/setup-common.c:0)
   >>>               arch/powerpc/kernel/setup-common.o:(smp_setup_cpu_maps) in archive vmlinux.a
   >>> referenced by setup-common.c:0 (arch/powerpc/kernel/setup-common.c:0)
   >>>               arch/powerpc/kernel/setup-common.o:(smp_setup_cpu_maps) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
