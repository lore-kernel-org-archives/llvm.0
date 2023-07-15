Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F89291D;
	Sat, 15 Jul 2023 19:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689449708; x=1720985708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WSamZGC9Adk6Sh11g4i4xkcbhV0+hz316QWhtrVLpmI=;
  b=lIxQalrqhNnm26XkpYG/I/d0g5/Ruoz8pYC/MmSG8F+UWgzeZaYtSgJ5
   aqo7hKUlA9NlFHBZTU6pEaX2yhT8dlnVrB4aSnKdnkhwUSQjoh//aNqn5
   w4u/Uhp7/+jcTxcMMk9w8tUmO/IUBVAmemm1XTVReaBWlGnZpbK12FntX
   sm9bysjwNVwfyHOMORbXAXKrakAk8zX/SGVeth3ji+NqEBwVeETdic3HW
   ino/TiTFRGVchJgl2+fqNgZVpT3WRQJXG0Mlx5OShyHob7VIhtzgXzTar
   DezAWSxIle4w+HAuN3UrqSPWiaf9Kjwrkwdjgss4gAcWbD2Q9Rl/DnivT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="364563034"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="364563034"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 12:35:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="846823090"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="846823090"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Jul 2023 12:35:05 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKl2m-0008KX-1l;
	Sat, 15 Jul 2023 19:35:04 +0000
Date: Sun, 16 Jul 2023 03:34:25 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topology 30/38]
 arch/x86/kernel/apic/x2apic_phys.c:108:5: warning: no previous prototype for
 function 'x2apic_apic_id_valid'
Message-ID: <202307160311.OnB7vvmP-lkp@intel.com>
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
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230716/202307160311.OnB7vvmP-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307160311.OnB7vvmP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307160311.OnB7vvmP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/apic/x2apic_phys.c:11:29: error: expected ';' after top level declarator
   static u32 x2apic_max_apicid __refdatao;
                               ^
                               ;
>> arch/x86/kernel/apic/x2apic_phys.c:108:5: warning: no previous prototype for function 'x2apic_apic_id_valid' [-Wmissing-prototypes]
   int x2apic_apic_id_valid(u32 apicid)
       ^
   arch/x86/kernel/apic/x2apic_phys.c:108:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int x2apic_apic_id_valid(u32 apicid)
   ^
   static 
   1 warning and 1 error generated.


vim +/x2apic_apic_id_valid +108 arch/x86/kernel/apic/x2apic_phys.c

1b9b89e7f16333 arch/x86/kernel/genx2apic_phys.c   Yinghai Lu               2008-07-21    9  
1a8880a1427081 arch/x86/kernel/apic/x2apic_phys.c Suresh Siddha            2011-05-20   10  static struct apic apic_x2apic_phys;
e2f40f2fdd6f60 arch/x86/kernel/apic/x2apic_phys.c Thomas Gleixner          2023-07-15  @11  static u32 x2apic_max_apicid __refdatao;
26573a97746c7a arch/x86/kernel/apic/x2apic_phys.c David Woodhouse          2020-10-24   12  
26573a97746c7a arch/x86/kernel/apic/x2apic_phys.c David Woodhouse          2020-10-24   13  void __init x2apic_set_max_apicid(u32 apicid)
26573a97746c7a arch/x86/kernel/apic/x2apic_phys.c David Woodhouse          2020-10-24   14  {
26573a97746c7a arch/x86/kernel/apic/x2apic_phys.c David Woodhouse          2020-10-24   15  	x2apic_max_apicid = apicid;
26573a97746c7a arch/x86/kernel/apic/x2apic_phys.c David Woodhouse          2020-10-24   16  }
1a8880a1427081 arch/x86/kernel/apic/x2apic_phys.c Suresh Siddha            2011-05-20   17  
afed7d17209104 arch/x86/kernel/apic/x2apic_phys.c Dou Liyang               2018-01-17   18  static int __init set_x2apic_phys_mode(char *arg)
1b9b89e7f16333 arch/x86/kernel/genx2apic_phys.c   Yinghai Lu               2008-07-21   19  {
1b9b89e7f16333 arch/x86/kernel/genx2apic_phys.c   Yinghai Lu               2008-07-21   20  	x2apic_phys = 1;
1b9b89e7f16333 arch/x86/kernel/genx2apic_phys.c   Yinghai Lu               2008-07-21   21  	return 0;
1b9b89e7f16333 arch/x86/kernel/genx2apic_phys.c   Yinghai Lu               2008-07-21   22  }
1b9b89e7f16333 arch/x86/kernel/genx2apic_phys.c   Yinghai Lu               2008-07-21   23  early_param("x2apic_phys", set_x2apic_phys_mode);
1b9b89e7f16333 arch/x86/kernel/genx2apic_phys.c   Yinghai Lu               2008-07-21   24  
cb214ede7657db arch/x86/kernel/apic/x2apic_phys.c Stoney Wang              2013-02-07   25  static bool x2apic_fadt_phys(void)
1b9b89e7f16333 arch/x86/kernel/genx2apic_phys.c   Yinghai Lu               2008-07-21   26  {
781674fc33adf0 arch/x86/kernel/apic/x2apic_phys.c Jan Kiszka               2015-05-04   27  #ifdef CONFIG_ACPI
cb214ede7657db arch/x86/kernel/apic/x2apic_phys.c Stoney Wang              2013-02-07   28  	if ((acpi_gbl_FADT.header.revision >= FADT2_REVISION_ID) &&
cb214ede7657db arch/x86/kernel/apic/x2apic_phys.c Stoney Wang              2013-02-07   29  		(acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL)) {
ea0dcf903e7d76 arch/x86/kernel/apic/x2apic_phys.c Greg Pearson             2012-04-24   30  		printk(KERN_DEBUG "System requires x2apic physical mode\n");
cb214ede7657db arch/x86/kernel/apic/x2apic_phys.c Stoney Wang              2013-02-07   31  		return true;
ea0dcf903e7d76 arch/x86/kernel/apic/x2apic_phys.c Greg Pearson             2012-04-24   32  	}
781674fc33adf0 arch/x86/kernel/apic/x2apic_phys.c Jan Kiszka               2015-05-04   33  #endif
cb214ede7657db arch/x86/kernel/apic/x2apic_phys.c Stoney Wang              2013-02-07   34  	return false;
cb214ede7657db arch/x86/kernel/apic/x2apic_phys.c Stoney Wang              2013-02-07   35  }
cb214ede7657db arch/x86/kernel/apic/x2apic_phys.c Stoney Wang              2013-02-07   36  
cb214ede7657db arch/x86/kernel/apic/x2apic_phys.c Stoney Wang              2013-02-07   37  static int x2apic_acpi_madt_oem_check(char *oem_id, char *oem_table_id)
cb214ede7657db arch/x86/kernel/apic/x2apic_phys.c Stoney Wang              2013-02-07   38  {
cb214ede7657db arch/x86/kernel/apic/x2apic_phys.c Stoney Wang              2013-02-07   39  	return x2apic_enabled() && (x2apic_phys || x2apic_fadt_phys());
1b9b89e7f16333 arch/x86/kernel/genx2apic_phys.c   Yinghai Lu               2008-07-21   40  }
2d9579a124d746 arch/x86/kernel/genx2apic_phys.c   Suresh Siddha            2008-07-10   41  
f2bffe8a3eef42 arch/x86/kernel/apic/x2apic_phys.c Thomas Gleixner          2015-11-04   42  static void x2apic_send_IPI(int cpu, int vector)
f2bffe8a3eef42 arch/x86/kernel/apic/x2apic_phys.c Thomas Gleixner          2015-11-04   43  {
f2bffe8a3eef42 arch/x86/kernel/apic/x2apic_phys.c Thomas Gleixner          2015-11-04   44  	u32 dest = per_cpu(x86_cpu_to_apicid, cpu);
f2bffe8a3eef42 arch/x86/kernel/apic/x2apic_phys.c Thomas Gleixner          2015-11-04   45  
25a068b8e9a4eb arch/x86/kernel/apic/x2apic_phys.c Dave Hansen              2020-03-05   46  	/* x2apic MSRs are special and need a special fence: */
25a068b8e9a4eb arch/x86/kernel/apic/x2apic_phys.c Dave Hansen              2020-03-05   47  	weak_wrmsr_fence();
f2bffe8a3eef42 arch/x86/kernel/apic/x2apic_phys.c Thomas Gleixner          2015-11-04   48  	__x2apic_send_IPI_dest(dest, vector, APIC_DEST_PHYSICAL);
f2bffe8a3eef42 arch/x86/kernel/apic/x2apic_phys.c Thomas Gleixner          2015-11-04   49  }
f2bffe8a3eef42 arch/x86/kernel/apic/x2apic_phys.c Thomas Gleixner          2015-11-04   50  
a27d0b5e7d913b arch/x86/kernel/apic/x2apic_phys.c Suresh Siddha            2011-05-19   51  static void
a27d0b5e7d913b arch/x86/kernel/apic/x2apic_phys.c Suresh Siddha            2011-05-19   52  __x2apic_send_IPI_mask(const struct cpumask *mask, int vector, int apic_dest)
2d9579a124d746 arch/x86/kernel/genx2apic_phys.c   Suresh Siddha            2008-07-10   53  {
2d9579a124d746 arch/x86/kernel/genx2apic_phys.c   Suresh Siddha            2008-07-10   54  	unsigned long query_cpu;
a27d0b5e7d913b arch/x86/kernel/apic/x2apic_phys.c Suresh Siddha            2011-05-19   55  	unsigned long this_cpu;
dac5f4121df3c3 arch/x86/kernel/genx2apic_phys.c   Ingo Molnar              2009-01-28   56  	unsigned long flags;
2d9579a124d746 arch/x86/kernel/genx2apic_phys.c   Suresh Siddha            2008-07-10   57  
25a068b8e9a4eb arch/x86/kernel/apic/x2apic_phys.c Dave Hansen              2020-03-05   58  	/* x2apic MSRs are special and need a special fence: */
25a068b8e9a4eb arch/x86/kernel/apic/x2apic_phys.c Dave Hansen              2020-03-05   59  	weak_wrmsr_fence();
ce4e240c279a31 arch/x86/kernel/apic/x2apic_phys.c Suresh Siddha            2009-03-17   60  
2d9579a124d746 arch/x86/kernel/genx2apic_phys.c   Suresh Siddha            2008-07-10   61  	local_irq_save(flags);
a27d0b5e7d913b arch/x86/kernel/apic/x2apic_phys.c Suresh Siddha            2011-05-19   62  
a27d0b5e7d913b arch/x86/kernel/apic/x2apic_phys.c Suresh Siddha            2011-05-19   63  	this_cpu = smp_processor_id();
bcda016eddd7a8 arch/x86/kernel/genx2apic_phys.c   Mike Travis              2008-12-16   64  	for_each_cpu(query_cpu, mask) {
a27d0b5e7d913b arch/x86/kernel/apic/x2apic_phys.c Suresh Siddha            2011-05-19   65  		if (apic_dest == APIC_DEST_ALLBUT && this_cpu == query_cpu)
a27d0b5e7d913b arch/x86/kernel/apic/x2apic_phys.c Suresh Siddha            2011-05-19   66  			continue;
2d9579a124d746 arch/x86/kernel/genx2apic_phys.c   Suresh Siddha            2008-07-10   67  		__x2apic_send_IPI_dest(per_cpu(x86_cpu_to_apicid, query_cpu),
2d9579a124d746 arch/x86/kernel/genx2apic_phys.c   Suresh Siddha            2008-07-10   68  				       vector, APIC_DEST_PHYSICAL);
2d9579a124d746 arch/x86/kernel/genx2apic_phys.c   Suresh Siddha            2008-07-10   69  	}
2d9579a124d746 arch/x86/kernel/genx2apic_phys.c   Suresh Siddha            2008-07-10   70  	local_irq_restore(flags);
2d9579a124d746 arch/x86/kernel/genx2apic_phys.c   Suresh Siddha            2008-07-10   71  }
2d9579a124d746 arch/x86/kernel/genx2apic_phys.c   Suresh Siddha            2008-07-10   72  
a27d0b5e7d913b arch/x86/kernel/apic/x2apic_phys.c Suresh Siddha            2011-05-19   73  static void x2apic_send_IPI_mask(const struct cpumask *mask, int vector)
a27d0b5e7d913b arch/x86/kernel/apic/x2apic_phys.c Suresh Siddha            2011-05-19   74  {
a27d0b5e7d913b arch/x86/kernel/apic/x2apic_phys.c Suresh Siddha            2011-05-19   75  	__x2apic_send_IPI_mask(mask, vector, APIC_DEST_ALLINC);
a27d0b5e7d913b arch/x86/kernel/apic/x2apic_phys.c Suresh Siddha            2011-05-19   76  }
a27d0b5e7d913b arch/x86/kernel/apic/x2apic_phys.c Suresh Siddha            2011-05-19   77  
dac5f4121df3c3 arch/x86/kernel/genx2apic_phys.c   Ingo Molnar              2009-01-28   78  static void
dac5f4121df3c3 arch/x86/kernel/genx2apic_phys.c   Ingo Molnar              2009-01-28   79   x2apic_send_IPI_mask_allbutself(const struct cpumask *mask, int vector)
2d9579a124d746 arch/x86/kernel/genx2apic_phys.c   Suresh Siddha            2008-07-10   80  {
a27d0b5e7d913b arch/x86/kernel/apic/x2apic_phys.c Suresh Siddha            2011-05-19   81  	__x2apic_send_IPI_mask(mask, vector, APIC_DEST_ALLBUT);
e7986739a76cde arch/x86/kernel/genx2apic_phys.c   Mike Travis              2008-12-16   82  }
2d9579a124d746 arch/x86/kernel/genx2apic_phys.c   Suresh Siddha            2008-07-10   83  
e7986739a76cde arch/x86/kernel/genx2apic_phys.c   Mike Travis              2008-12-16   84  static void x2apic_send_IPI_allbutself(int vector)
e7986739a76cde arch/x86/kernel/genx2apic_phys.c   Mike Travis              2008-12-16   85  {
43931d350f30c6 arch/x86/kernel/apic/x2apic_phys.c Thomas Gleixner          2019-07-22   86  	__x2apic_send_IPI_shorthand(vector, APIC_DEST_ALLBUT);
2d9579a124d746 arch/x86/kernel/genx2apic_phys.c   Suresh Siddha            2008-07-10   87  }
2d9579a124d746 arch/x86/kernel/genx2apic_phys.c   Suresh Siddha            2008-07-10   88  
2d9579a124d746 arch/x86/kernel/genx2apic_phys.c   Suresh Siddha            2008-07-10   89  static void x2apic_send_IPI_all(int vector)
2d9579a124d746 arch/x86/kernel/genx2apic_phys.c   Suresh Siddha            2008-07-10   90  {
43931d350f30c6 arch/x86/kernel/apic/x2apic_phys.c Thomas Gleixner          2019-07-22   91  	__x2apic_send_IPI_shorthand(vector, APIC_DEST_ALLINC);
2d9579a124d746 arch/x86/kernel/genx2apic_phys.c   Suresh Siddha            2008-07-10   92  }
2d9579a124d746 arch/x86/kernel/genx2apic_phys.c   Suresh Siddha            2008-07-10   93  
9ebd680bd029a9 arch/x86/kernel/apic/x2apic_phys.c Suresh Siddha            2011-05-19   94  static int x2apic_phys_probe(void)
9ebd680bd029a9 arch/x86/kernel/apic/x2apic_phys.c Suresh Siddha            2011-05-19   95  {
85d38d5810e285 arch/x86/kernel/apic/x2apic_phys.c Dheeraj Kumar Srivastava 2023-06-17   96  	if (!x2apic_mode)
85d38d5810e285 arch/x86/kernel/apic/x2apic_phys.c Dheeraj Kumar Srivastava 2023-06-17   97  		return 0;
85d38d5810e285 arch/x86/kernel/apic/x2apic_phys.c Dheeraj Kumar Srivastava 2023-06-17   98  
e2f40f2fdd6f60 arch/x86/kernel/apic/x2apic_phys.c Thomas Gleixner          2023-07-15   99  	apic_x2apic_phys.max_apic_id = x2apic_max_apicid;
e2f40f2fdd6f60 arch/x86/kernel/apic/x2apic_phys.c Thomas Gleixner          2023-07-15  100  
85d38d5810e285 arch/x86/kernel/apic/x2apic_phys.c Dheeraj Kumar Srivastava 2023-06-17  101  	if (x2apic_phys || x2apic_fadt_phys())
9ebd680bd029a9 arch/x86/kernel/apic/x2apic_phys.c Suresh Siddha            2011-05-19  102  		return 1;
9ebd680bd029a9 arch/x86/kernel/apic/x2apic_phys.c Suresh Siddha            2011-05-19  103  
9ebd680bd029a9 arch/x86/kernel/apic/x2apic_phys.c Suresh Siddha            2011-05-19  104  	return apic == &apic_x2apic_phys;
9ebd680bd029a9 arch/x86/kernel/apic/x2apic_phys.c Suresh Siddha            2011-05-19  105  }
9ebd680bd029a9 arch/x86/kernel/apic/x2apic_phys.c Suresh Siddha            2011-05-19  106  
981c2eac1cb97c arch/x86/kernel/apic/x2apic_phys.c Thomas Gleixner          2017-09-13  107  /* Common x2apic functions, also used by x2apic_cluster */
a774635db5c430 arch/x86/kernel/apic/x2apic_phys.c Li RongQing              2018-04-10 @108  int x2apic_apic_id_valid(u32 apicid)
981c2eac1cb97c arch/x86/kernel/apic/x2apic_phys.c Thomas Gleixner          2017-09-13  109  {
26573a97746c7a arch/x86/kernel/apic/x2apic_phys.c David Woodhouse          2020-10-24  110  	if (x2apic_max_apicid && apicid > x2apic_max_apicid)
26573a97746c7a arch/x86/kernel/apic/x2apic_phys.c David Woodhouse          2020-10-24  111  		return 0;
26573a97746c7a arch/x86/kernel/apic/x2apic_phys.c David Woodhouse          2020-10-24  112  
981c2eac1cb97c arch/x86/kernel/apic/x2apic_phys.c Thomas Gleixner          2017-09-13  113  	return 1;
981c2eac1cb97c arch/x86/kernel/apic/x2apic_phys.c Thomas Gleixner          2017-09-13  114  }
981c2eac1cb97c arch/x86/kernel/apic/x2apic_phys.c Thomas Gleixner          2017-09-13  115  

:::::: The code at line 108 was first introduced by commit
:::::: a774635db5c430cbf21fa5d2f2df3d23aaa8e782 x86/apic: Fix signedness bug in APIC ID validity checks

:::::: TO: Li RongQing <lirongqing@baidu.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
