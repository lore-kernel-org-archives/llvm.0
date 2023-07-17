Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0C01FCC;
	Mon, 17 Jul 2023 06:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689576470; x=1721112470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t56X6wAm793JDlg8of4tdGbn3IDFPeDRnn4Jjq/Xaiw=;
  b=ErLkCHabBPcCZDd7t91i27mgUBvVE60LRgLxQLu8nIPIhE7N/0W/nQ9p
   7kutatDZ6K/1vo+wyIiVzEqRI64ix1hJG7+OqHdxxNEnmfufyAuYKRE2E
   co3wRl8SJotqEJYrZy45ZcT5QrlX68YdMK0Ov6N/WbKUuz5kZxb8icoGE
   OWcn1SRd9tWPdrnWkm+my3TpKFDUMB+3OW6q09WDXdkdA4d7We1Opb2Sn
   /gLD+5jI3DKspP832SAU7Zqn/vsq92ffW8VC+DOeToLwW856zWtDw8Lh+
   UWEiGqqBo1X5gtkE6Jiz+2JL6ZGOSchFfLCFVNsX3eYDPqV5R038yDTx7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="429617757"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="429617757"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2023 23:47:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="700400225"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="700400225"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 16 Jul 2023 23:47:46 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLI1J-0009E8-0L;
	Mon, 17 Jul 2023 06:47:45 +0000
Date: Mon, 17 Jul 2023 14:47:32 +0800
From: kernel test robot <lkp@intel.com>
To: Fangrui Song <maskray@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [stable:linux-4.14.y 4459/9999] arch/mips/kernel/pm.c:56:22: error:
 unsupported inline asm: input with type 'unsigned long' matching output with
 type 'unsigned long long'
Message-ID: <202307171441.HTkYKwpu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Fangrui,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.14.y
head:   60a6e3043cc8b918c989707a5eba5fd6830a08a4
commit: 71749b1181eca12af96654a781cabcd058c37c8f [4459/9999] Makefile: Fix GCC_TOOLCHAIN_DIR prefix for Clang cross compilation
config: mips-randconfig-r021-20230717 (https://download.01.org/0day-ci/archive/20230717/202307171441.HTkYKwpu-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230717/202307171441.HTkYKwpu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307171441.HTkYKwpu-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/infiniband/core/cma.c:3986:30: warning: equality comparison with extraneous parentheses [-Wparentheses-equality]
    3986 |         } else if ((addr->sa_family == AF_INET6)) {
         |                     ~~~~~~~~~~~~~~~~^~~~~~~~~~~
   drivers/infiniband/core/cma.c:3986:30: note: remove extraneous parentheses around the comparison to silence this warning
    3986 |         } else if ((addr->sa_family == AF_INET6)) {
         |                    ~                ^          ~
   drivers/infiniband/core/cma.c:3986:30: note: use '=' to turn this equality comparison into an assignment
    3986 |         } else if ((addr->sa_family == AF_INET6)) {
         |                                     ^~
         |                                     =
   1 warning generated.
--
>> drivers/net/ethernet/broadcom/bnx2.c:3288:15: warning: equality comparison with extraneous parentheses [-Wparentheses-equality]
    3288 |                 if ((rx_pkt == budget))
         |                      ~~~~~~~^~~~~~~~~
   drivers/net/ethernet/broadcom/bnx2.c:3288:15: note: remove extraneous parentheses around the comparison to silence this warning
    3288 |                 if ((rx_pkt == budget))
         |                     ~       ^        ~
   drivers/net/ethernet/broadcom/bnx2.c:3288:15: note: use '=' to turn this equality comparison into an assignment
    3288 |                 if ((rx_pkt == budget))
         |                             ^~
         |                             =
   1 warning generated.
--
>> net/rds/ib_stats.c:40:1: warning: section does not match previous declaration [-Wsection]
      40 | DEFINE_PER_CPU_SHARED_ALIGNED(struct rds_ib_statistics, rds_ib_stats);
         | ^
   include/linux/percpu-defs.h:144:2: note: expanded from macro 'DEFINE_PER_CPU_SHARED_ALIGNED'
     144 |         DEFINE_PER_CPU_SECTION(type, name, PER_CPU_SHARED_ALIGNED_SECTION) \
         |         ^
   include/linux/percpu-defs.h:104:2: note: expanded from macro 'DEFINE_PER_CPU_SECTION'
     104 |         __PCPU_ATTRS(sec) PER_CPU_DEF_ATTRIBUTES                        \
         |         ^
   include/linux/percpu-defs.h:49:26: note: expanded from macro '__PCPU_ATTRS'
      49 |         __percpu __attribute__((section(PER_CPU_BASE_SECTION sec)))     \
         |                                 ^
   net/rds/ib.h:419:1: note: previous attribute is here
     419 | DECLARE_PER_CPU(struct rds_ib_statistics, rds_ib_stats);
         | ^
   include/linux/percpu-defs.h:113:2: note: expanded from macro 'DECLARE_PER_CPU'
     113 |         DECLARE_PER_CPU_SECTION(type, name, "")
         |         ^
   include/linux/percpu-defs.h:101:9: note: expanded from macro 'DECLARE_PER_CPU_SECTION'
     101 |         extern __PCPU_ATTRS(sec) __typeof__(type) name
         |                ^
   include/linux/percpu-defs.h:49:26: note: expanded from macro '__PCPU_ATTRS'
      49 |         __percpu __attribute__((section(PER_CPU_BASE_SECTION sec)))     \
         |                                 ^
   1 warning generated.
--
>> fs/afs/write.c:786:5: warning: no previous prototype for function 'afs_page_mkwrite' [-Wmissing-prototypes]
     786 | int afs_page_mkwrite(struct vm_area_struct *vma, struct page *page)
         |     ^
   fs/afs/write.c:786:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     786 | int afs_page_mkwrite(struct vm_area_struct *vma, struct page *page)
         | ^
         | static 
   1 warning generated.
--
>> fs/afs/proc.c:38:37: warning: unused variable 'afs_proc_cells_fops' [-Wunused-const-variable]
      38 | static const struct file_operations afs_proc_cells_fops = {
         |                                     ^
>> fs/afs/proc.c:52:37: warning: unused variable 'afs_proc_rootcell_fops' [-Wunused-const-variable]
      52 | static const struct file_operations afs_proc_rootcell_fops = {
         |                                     ^
>> fs/afs/proc.c:72:37: warning: unused variable 'afs_proc_cell_volumes_fops' [-Wunused-const-variable]
      72 | static const struct file_operations afs_proc_cell_volumes_fops = {
         |                                     ^
>> fs/afs/proc.c:94:37: warning: unused variable 'afs_proc_cell_vlservers_fops' [-Wunused-const-variable]
      94 | static const struct file_operations afs_proc_cell_vlservers_fops = {
         |                                     ^
>> fs/afs/proc.c:115:37: warning: unused variable 'afs_proc_cell_servers_fops' [-Wunused-const-variable]
     115 | static const struct file_operations afs_proc_cell_servers_fops = {
         |                                     ^
   5 warnings generated.
--
   drivers/scsi/3w-sas.c:297:22: warning: variable 'sglist' set but not used [-Wunused-but-set-variable]
     297 |         struct scatterlist *sglist = NULL, *sg;
         |                             ^
>> drivers/scsi/3w-sas.c:387:11: warning: implicit conversion from 'int' to 'char' changes value from 128 to -128 [-Wconstant-conversion]
     387 |         cdb[4] = TW_ALLOCATION_LENGTH; /* allocation length */
         |                ~ ^~~~~~~~~~~~~~~~~~~~
   drivers/scsi/3w-sas.h:140:37: note: expanded from macro 'TW_ALLOCATION_LENGTH'
     140 | #define TW_ALLOCATION_LENGTH                  128
         |                                               ^~~
   drivers/scsi/3w-sas.c:579:11: warning: implicit conversion from 'int' to 'char' changes value from 128 to -128 [-Wconstant-conversion]
     579 |         cdb[4] = TW_ALLOCATION_LENGTH; /* allocation length */
         |                ~ ^~~~~~~~~~~~~~~~~~~~
   drivers/scsi/3w-sas.h:140:37: note: expanded from macro 'TW_ALLOCATION_LENGTH'
     140 | #define TW_ALLOCATION_LENGTH                  128
         |                                               ^~~
   drivers/scsi/3w-sas.c:1411:23: warning: variable 'tw_dev' set but not used [-Wunused-but-set-variable]
    1411 |         TW_Device_Extension *tw_dev;
         |                              ^
   4 warnings generated.
--
   In file included from arch/mips/kernel/pm.c:17:
   arch/mips/include/asm/mmu_context.h:148:2: error: unsupported inline asm: input with type 'unsigned long' matching output with type 'unsigned long long'
     148 |         TLBMISS_HANDLER_SETUP_PGD(next->pgd);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/mmu_context.h:40:17: note: expanded from macro 'TLBMISS_HANDLER_SETUP_PGD'
      40 |         htw_set_pwbase((unsigned long)pgd);                             \
         |         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/mmu_context.h:29:19: note: expanded from macro 'htw_set_pwbase'
      29 |                 write_c0_pwbase(pgd);                                   \
         |                 ~~~~~~~~~~~~~~~~^~~~
   arch/mips/include/asm/mipsregs.h:1743:63: note: expanded from macro 'write_c0_pwbase'
    1743 | #define write_c0_pwbase(val)    __write_ulong_c0_register($5, 5, val)
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   arch/mips/include/asm/mipsregs.h:1324:39: note: expanded from macro '__write_ulong_c0_register'
    1324 |                 __write_64bit_c0_register(reg, sel, val);               \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   arch/mips/include/asm/mipsregs.h:1299:41: note: expanded from macro '__write_64bit_c0_register'
    1299 |                 __write_64bit_c0_split(register, sel, value);           \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   arch/mips/include/asm/mipsregs.h:1394:13: note: expanded from macro '__write_64bit_c0_split'
    1394 |                         : "=&r,r" (__tmp)                               \
         |                                    ~~~~~
    1395 |                         : "r,0" (val));                                 \
         |                                  ^~~
   In file included from arch/mips/kernel/pm.c:17:
   arch/mips/include/asm/mmu_context.h:148:2: error: unsupported inline asm: input with type 'unsigned long' matching output with type 'unsigned long long'
     148 |         TLBMISS_HANDLER_SETUP_PGD(next->pgd);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/mmu_context.h:40:17: note: expanded from macro 'TLBMISS_HANDLER_SETUP_PGD'
      40 |         htw_set_pwbase((unsigned long)pgd);                             \
         |         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/mmu_context.h:29:19: note: expanded from macro 'htw_set_pwbase'
      29 |                 write_c0_pwbase(pgd);                                   \
         |                 ~~~~~~~~~~~~~~~~^~~~
   arch/mips/include/asm/mipsregs.h:1743:63: note: expanded from macro 'write_c0_pwbase'
    1743 | #define write_c0_pwbase(val)    __write_ulong_c0_register($5, 5, val)
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   arch/mips/include/asm/mipsregs.h:1324:39: note: expanded from macro '__write_ulong_c0_register'
    1324 |                 __write_64bit_c0_register(reg, sel, val);               \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   arch/mips/include/asm/mipsregs.h:1299:41: note: expanded from macro '__write_64bit_c0_register'
    1299 |                 __write_64bit_c0_split(register, sel, value);           \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   arch/mips/include/asm/mipsregs.h:1405:13: note: expanded from macro '__write_64bit_c0_split'
    1405 |                         : "=&r,r" (__tmp)                               \
         |                                    ~~~~~
    1406 |                         : "r,0" (val));                                 \
         |                                  ^~~
   In file included from arch/mips/kernel/pm.c:17:
   arch/mips/include/asm/mmu_context.h:189:2: error: unsupported inline asm: input with type 'unsigned long' matching output with type 'unsigned long long'
     189 |         TLBMISS_HANDLER_SETUP_PGD(next->pgd);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/mmu_context.h:40:17: note: expanded from macro 'TLBMISS_HANDLER_SETUP_PGD'
      40 |         htw_set_pwbase((unsigned long)pgd);                             \
         |         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/mmu_context.h:29:19: note: expanded from macro 'htw_set_pwbase'
      29 |                 write_c0_pwbase(pgd);                                   \
         |                 ~~~~~~~~~~~~~~~~^~~~
   arch/mips/include/asm/mipsregs.h:1743:63: note: expanded from macro 'write_c0_pwbase'
    1743 | #define write_c0_pwbase(val)    __write_ulong_c0_register($5, 5, val)
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   arch/mips/include/asm/mipsregs.h:1324:39: note: expanded from macro '__write_ulong_c0_register'
    1324 |                 __write_64bit_c0_register(reg, sel, val);               \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   arch/mips/include/asm/mipsregs.h:1299:41: note: expanded from macro '__write_64bit_c0_register'
    1299 |                 __write_64bit_c0_split(register, sel, value);           \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   arch/mips/include/asm/mipsregs.h:1394:13: note: expanded from macro '__write_64bit_c0_split'
    1394 |                         : "=&r,r" (__tmp)                               \
         |                                    ~~~~~
    1395 |                         : "r,0" (val));                                 \
         |                                  ^~~
   In file included from arch/mips/kernel/pm.c:17:
   arch/mips/include/asm/mmu_context.h:189:2: error: unsupported inline asm: input with type 'unsigned long' matching output with type 'unsigned long long'
     189 |         TLBMISS_HANDLER_SETUP_PGD(next->pgd);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/mmu_context.h:40:17: note: expanded from macro 'TLBMISS_HANDLER_SETUP_PGD'
      40 |         htw_set_pwbase((unsigned long)pgd);                             \
         |         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/mmu_context.h:29:19: note: expanded from macro 'htw_set_pwbase'
      29 |                 write_c0_pwbase(pgd);                                   \
         |                 ~~~~~~~~~~~~~~~~^~~~
   arch/mips/include/asm/mipsregs.h:1743:63: note: expanded from macro 'write_c0_pwbase'
    1743 | #define write_c0_pwbase(val)    __write_ulong_c0_register($5, 5, val)
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   arch/mips/include/asm/mipsregs.h:1324:39: note: expanded from macro '__write_ulong_c0_register'
    1324 |                 __write_64bit_c0_register(reg, sel, val);               \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   arch/mips/include/asm/mipsregs.h:1299:41: note: expanded from macro '__write_64bit_c0_register'
    1299 |                 __write_64bit_c0_split(register, sel, value);           \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   arch/mips/include/asm/mipsregs.h:1405:13: note: expanded from macro '__write_64bit_c0_split'
    1405 |                         : "=&r,r" (__tmp)                               \
         |                                    ~~~~~
    1406 |                         : "r,0" (val));                                 \
         |                                  ^~~
>> arch/mips/kernel/pm.c:56:22: error: unsupported inline asm: input with type 'unsigned long' matching output with type 'unsigned long long'
      56 |                 write_c0_userlocal(current_thread_info()->tp_value);
         |                 ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/mipsregs.h:1472:66: note: expanded from macro 'write_c0_userlocal'
    1472 | #define write_c0_userlocal(val) __write_ulong_c0_register($4, 2, val)
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   arch/mips/include/asm/mipsregs.h:1324:39: note: expanded from macro '__write_ulong_c0_register'
    1324 |                 __write_64bit_c0_register(reg, sel, val);               \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   arch/mips/include/asm/mipsregs.h:1299:41: note: expanded from macro '__write_64bit_c0_register'
    1299 |                 __write_64bit_c0_split(register, sel, value);           \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   arch/mips/include/asm/mipsregs.h:1394:13: note: expanded from macro '__write_64bit_c0_split'
    1394 |                         : "=&r,r" (__tmp)                               \
         |                                    ~~~~~
    1395 |                         : "r,0" (val));                                 \
         |                                  ^~~
>> arch/mips/kernel/pm.c:56:22: error: unsupported inline asm: input with type 'unsigned long' matching output with type 'unsigned long long'
      56 |                 write_c0_userlocal(current_thread_info()->tp_value);
         |                 ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/mipsregs.h:1472:66: note: expanded from macro 'write_c0_userlocal'
    1472 | #define write_c0_userlocal(val) __write_ulong_c0_register($4, 2, val)
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   arch/mips/include/asm/mipsregs.h:1324:39: note: expanded from macro '__write_ulong_c0_register'
    1324 |                 __write_64bit_c0_register(reg, sel, val);               \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   arch/mips/include/asm/mipsregs.h:1299:41: note: expanded from macro '__write_64bit_c0_register'
    1299 |                 __write_64bit_c0_split(register, sel, value);           \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   arch/mips/include/asm/mipsregs.h:1405:13: note: expanded from macro '__write_64bit_c0_split'
    1405 |                         : "=&r,r" (__tmp)                               \
         |                                    ~~~~~
    1406 |                         : "r,0" (val));                                 \
         |                                  ^~~
   6 errors generated.
--
>> fs/xfs/xfs_stats.c:132:37: warning: unused variable 'xqm_proc_fops' [-Wunused-const-variable]
     132 | static const struct file_operations xqm_proc_fops = {
         |                                     ^
>> fs/xfs/xfs_stats.c:156:37: warning: unused variable 'xqmstat_proc_fops' [-Wunused-const-variable]
     156 | static const struct file_operations xqmstat_proc_fops = {
         |                                     ^
   2 warnings generated.
--
>> drivers/net/ethernet/chelsio/cxgb/cxgb2.c:112:19: warning: unused variable 'pci_speed' [-Wunused-const-variable]
     112 | static const char pci_speed[][4] = {
         |                   ^
   1 warning generated.
--
>> drivers/net/ethernet/chelsio/cxgb4/sge.c:465:2: warning: variable 'buf_size' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
     465 |         default:
         |         ^~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/sge.c:469:9: note: uninitialized use occurs here
     469 |         return buf_size;
         |                ^~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/sge.c:446:14: note: initialize the variable 'buf_size' to silence this warning
     446 |         int buf_size;
         |                     ^
         |                      = 0
   1 warning generated.
--
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:4564:14: warning: variable 'spd' set but not used [-Wunused-but-set-variable]
    4564 |         const char *spd = "";
         |                     ^
>> drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:4787:13: warning: variable 'adap_idx' set but not used [-Wunused-but-set-variable]
    4787 |         static int adap_idx = 1;
         |                    ^
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:2967:33: warning: unused variable 'cxgb4_mgmt_ethtool_ops' [-Wunused-const-variable]
    2967 | static const struct ethtool_ops cxgb4_mgmt_ethtool_ops = {
         |                                 ^
   3 warnings generated.


vim +56 arch/mips/kernel/pm.c

b1d4c6cac02808 James Hogan 2014-03-04  38  
b1d4c6cac02808 James Hogan 2014-03-04  39  /**
b1d4c6cac02808 James Hogan 2014-03-04  40   * mips_cpu_restore() - Restore general CPU state.
b1d4c6cac02808 James Hogan 2014-03-04  41   * Restores important CPU context.
b1d4c6cac02808 James Hogan 2014-03-04  42   */
b1d4c6cac02808 James Hogan 2014-03-04  43  static void mips_cpu_restore(void)
b1d4c6cac02808 James Hogan 2014-03-04  44  {
b1d4c6cac02808 James Hogan 2014-03-04  45  	unsigned int cpu = smp_processor_id();
b1d4c6cac02808 James Hogan 2014-03-04  46  
b1d4c6cac02808 James Hogan 2014-03-04  47  	/* Restore ASID */
b1d4c6cac02808 James Hogan 2014-03-04  48  	if (current->mm)
b1d4c6cac02808 James Hogan 2014-03-04  49  		write_c0_entryhi(cpu_asid(cpu, current->mm));
b1d4c6cac02808 James Hogan 2014-03-04  50  
b1d4c6cac02808 James Hogan 2014-03-04  51  	/* Restore DSP state */
b1d4c6cac02808 James Hogan 2014-03-04  52  	restore_dsp(current);
b1d4c6cac02808 James Hogan 2014-03-04  53  
b1d4c6cac02808 James Hogan 2014-03-04  54  	/* Restore UserLocal */
b1d4c6cac02808 James Hogan 2014-03-04  55  	if (cpu_has_userlocal)
b1d4c6cac02808 James Hogan 2014-03-04 @56  		write_c0_userlocal(current_thread_info()->tp_value);
b1d4c6cac02808 James Hogan 2014-03-04  57  
b1d4c6cac02808 James Hogan 2014-03-04  58  	/* Restore watch registers */
a7e89326b415b5 James Hogan 2016-03-01  59  	__restore_watch(current);
b1d4c6cac02808 James Hogan 2014-03-04  60  }
b1d4c6cac02808 James Hogan 2014-03-04  61  

:::::: The code at line 56 was first introduced by commit
:::::: b1d4c6cac02808b1d4e84d0187dc6014bffd2446 MIPS: PM: Add CPU PM callbacks for general CPU context

:::::: TO: James Hogan <james.hogan@imgtec.com>
:::::: CC: Paul Burton <paul.burton@imgtec.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
