Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1675C2592;
	Sat, 15 Jul 2023 21:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689455891; x=1720991891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9MXhK1NdtpJxoRNnnJuhAWp4qphOYnJwdhUEa6KVf8w=;
  b=C77THK/webT3fCE4WBdMwK4WHlgB9nudaCh+K2MLQtg5biR3mXozNTFb
   e6o8G81+LD6ZXwtvPKwQpzPEF3s3mnD6dScTKOqtzXn42dkRzrFEYsLUu
   SyMPXPanVPOKcx5E0haG15r8keBRQ9OPnbJrS+Fv4Ve3d1kTX7d9/mOOE
   nH1b1YjPHZk1jQHDlq1uRwVa0euF/fph6oGhZvQsf9iYB3vJcQP+ByRRx
   A2aoXdnRtRcaRjAk6urf+hAyGfNIocBBWuxNJix55V9gl/W+pOS5rGm1a
   yD1vt11NyIbuc1MNoE5JxOQQLpyds88JbvrwUOtoFKuyFGNS3l9MEw3Gt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="365741946"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="365741946"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 14:18:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="752427673"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="752427673"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 15 Jul 2023 14:18:06 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKmeT-0008NB-2i;
	Sat, 15 Jul 2023 21:18:05 +0000
Date: Sun, 16 Jul 2023 05:17:55 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topology 30/38]
 arch/x86/kernel/apic/x2apic_phys.c:11:29: error: expected ';' after top
 level declarator
Message-ID: <202307160506.toCz4O8q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topology
head:   59df0262d2da163a8281c806688cc62e4d919908
commit: e2f40f2fdd6f60db02638b295a11feaee036fe70 [30/38] x86/apic: Sanitize APID ID range validation
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230716/202307160506.toCz4O8q-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307160506.toCz4O8q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307160506.toCz4O8q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/apic/x2apic_phys.c:11:29: error: expected ';' after top level declarator
   static u32 x2apic_max_apicid __refdatao;
                               ^
                               ;
   arch/x86/kernel/apic/x2apic_phys.c:108:5: warning: no previous prototype for function 'x2apic_apic_id_valid' [-Wmissing-prototypes]
   int x2apic_apic_id_valid(u32 apicid)
       ^
   arch/x86/kernel/apic/x2apic_phys.c:108:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int x2apic_apic_id_valid(u32 apicid)
   ^
   static 
   1 warning and 1 error generated.
--
>> arch/x86/kernel/apic/x2apic_cluster.c:220:36: error: use of undeclared identifier 'x2apic_max_apicid'; did you mean 'x2apic_calc_apicid'?
           apic_x2apic_cluster.max_apic_id = x2apic_max_apicid;
                                             ^~~~~~~~~~~~~~~~~
                                             x2apic_calc_apicid
   arch/x86/kernel/apic/x2apic_cluster.c:98:12: note: 'x2apic_calc_apicid' declared here
   static u32 x2apic_calc_apicid(unsigned int cpu)
              ^
   1 error generated.


vim +11 arch/x86/kernel/apic/x2apic_phys.c

     9	
    10	static struct apic apic_x2apic_phys;
  > 11	static u32 x2apic_max_apicid __refdatao;
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
