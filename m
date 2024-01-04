Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F32F249F2;
	Thu,  4 Jan 2024 15:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AzfAFYjo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704383346; x=1735919346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OxqZ62v5q+/XRtS6bQm7pY/dvNiy2b16XdNPt1nfaXw=;
  b=AzfAFYjolt7yXZp97+qzmjoQELxa7zZO9yhoQAlkwripGHdyniZVAneG
   aO5lLp/QX0Ignvz08vcaUeFAbTlwTIu4phf8NDXdq91K/wYbXnTb8XKnP
   Fal+cfjmlrKky86B5ODGDwyc+ejq5izeZCYmQbdUpOIve+BC5iekmHqpv
   Jj701olIvv9HMuMgjj9Cy3oGh0g/R9Y8wxtSvdsMHPZICZTsqAv1nILJ7
   CQSdH8JcSQP8bm2hVhzWbmuWF92oWDdWYzASkOIfqdA6fw7ZlsOSKO58T
   0E712z3MIHAFVvM33K528FdRaHZq18mCtjx24uLZPnqYlJQpvTi4hyroJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="18802287"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; 
   d="scan'208";a="18802287"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 07:49:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="1111806637"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; 
   d="scan'208";a="1111806637"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 04 Jan 2024 07:49:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLPxt-00007E-2Q;
	Thu, 04 Jan 2024 15:49:01 +0000
Date: Thu, 4 Jan 2024 23:48:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Borislav Petkov (AMD)" <bp@alien8.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bp:tip-ras-core-WIP 14/14] drivers/ras/amd/atl/core.c:207:2: error:
 call to undeclared function 'amd_atl_register_decoder'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202401042325.d9JZDopR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git tip-ras-core-WIP
head:   cf9dcdd287f3d175a9fafdadb944586333cb785c
commit: cf9dcdd287f3d175a9fafdadb944586333cb785c [14/14] WIP build fix
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240104/202401042325.d9JZDopR-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240104/202401042325.d9JZDopR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401042325.d9JZDopR-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/ras/ras.c:20:54: warning: declaration of 'struct mce' will not be visible outside of this function [-Wvisibility]
      20 | static unsigned long (*amd_atl_umc_na_to_spa)(struct mce *m);
         |                                                      ^
   drivers/ras/ras.c:22:57: warning: declaration of 'struct mce' will not be visible outside of this function [-Wvisibility]
      22 | void amd_atl_register_decoder(unsigned long (*f)(struct mce *))
         |                                                         ^
>> drivers/ras/ras.c:24:24: error: incompatible function pointer types assigning to 'unsigned long (*)(struct mce *)' from 'unsigned long (*)(struct mce *)' [-Wincompatible-function-pointer-types]
      24 |         amd_atl_umc_na_to_spa = f;
         |                               ^ ~
>> drivers/ras/ras.c:22:6: warning: no previous prototype for function 'amd_atl_register_decoder' [-Wmissing-prototypes]
      22 | void amd_atl_register_decoder(unsigned long (*f)(struct mce *))
         |      ^
   drivers/ras/ras.c:22:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      22 | void amd_atl_register_decoder(unsigned long (*f)(struct mce *))
         | ^
         | static 
>> drivers/ras/ras.c:28:6: warning: no previous prototype for function 'amd_atl_unregister_decoder' [-Wmissing-prototypes]
      28 | void amd_atl_unregister_decoder(void)
         |      ^
   drivers/ras/ras.c:28:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      28 | void amd_atl_unregister_decoder(void)
         | ^
         | static 
   drivers/ras/ras.c:34:59: warning: declaration of 'struct mce' will not be visible outside of this function [-Wvisibility]
      34 | unsigned long amd_convert_umc_mca_addr_to_sys_addr(struct mce *m)
         |                                                           ^
>> drivers/ras/ras.c:39:31: error: incompatible pointer types passing 'struct mce *' to parameter of type 'struct mce *' [-Werror,-Wincompatible-pointer-types]
      39 |         return amd_atl_umc_na_to_spa(m);
         |                                      ^
>> drivers/ras/ras.c:34:15: warning: no previous prototype for function 'amd_convert_umc_mca_addr_to_sys_addr' [-Wmissing-prototypes]
      34 | unsigned long amd_convert_umc_mca_addr_to_sys_addr(struct mce *m)
         |               ^
   drivers/ras/ras.c:34:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      34 | unsigned long amd_convert_umc_mca_addr_to_sys_addr(struct mce *m)
         | ^
         | static 
   6 warnings and 2 errors generated.
--
   In file included from drivers/ras/amd/atl/access.c:13:
>> drivers/ras/amd/atl/internal.h:226:55: warning: declaration of 'struct mce' will not be visible outside of this function [-Wvisibility]
     226 | unsigned long convert_umc_mca_addr_to_sys_addr(struct mce *m);
         |                                                       ^
   1 warning generated.
--
   In file included from drivers/ras/amd/atl/core.c:16:
>> drivers/ras/amd/atl/internal.h:226:55: warning: declaration of 'struct mce' will not be visible outside of this function [-Wvisibility]
     226 | unsigned long convert_umc_mca_addr_to_sys_addr(struct mce *m);
         |                                                       ^
>> drivers/ras/amd/atl/core.c:207:2: error: call to undeclared function 'amd_atl_register_decoder'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     207 |         amd_atl_register_decoder(convert_umc_mca_addr_to_sys_addr);
         |         ^
>> drivers/ras/amd/atl/core.c:219:2: error: call to undeclared function 'amd_atl_unregister_decoder'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     219 |         amd_atl_unregister_decoder();
         |         ^
   1 warning and 2 errors generated.
--
   In file included from drivers/ras/amd/atl/umc.c:13:
>> drivers/ras/amd/atl/internal.h:226:55: warning: declaration of 'struct mce' will not be visible outside of this function [-Wvisibility]
     226 | unsigned long convert_umc_mca_addr_to_sys_addr(struct mce *m);
         |                                                       ^
>> drivers/ras/amd/atl/umc.c:15:29: warning: declaration of 'struct mce' will not be visible outside of this function [-Wvisibility]
      15 | static u8 get_die_id(struct mce *m)
         |                             ^
>> drivers/ras/amd/atl/umc.c:21:26: error: incomplete definition of type 'struct mce'
      21 |         return topology_die_id(m->extcpu) % amd_get_nodes_per_socket();
         |                                ~^
   arch/x86/include/asm/topology.h:111:42: note: expanded from macro 'topology_die_id'
     111 | #define topology_die_id(cpu)                    (cpu_data(cpu).topo.die_id)
         |                                                           ^~~
   arch/x86/include/asm/processor.h:191:42: note: expanded from macro 'cpu_data'
     191 | #define cpu_data(cpu)           per_cpu(cpu_info, cpu)
         |                                                   ^~~
   include/linux/percpu-defs.h:269:49: note: expanded from macro 'per_cpu'
     269 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
         |                                                       ^~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/percpu.h:21:45: note: expanded from macro 'per_cpu_offset'
      21 | #define per_cpu_offset(x) (__per_cpu_offset[x])
         |                                             ^
   include/linux/percpu-defs.h:231:56: note: expanded from macro 'SHIFT_PERCPU_PTR'
     231 |         RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
         |                                                               ^~~~~~~~
   include/linux/compiler.h:169:29: note: expanded from macro 'RELOC_HIDE'
     169 |     (typeof(ptr)) (__ptr + (off)); })
         |                             ^~~
   drivers/ras/amd/atl/umc.c:15:29: note: forward declaration of 'struct mce'
      15 | static u8 get_die_id(struct mce *m)
         |                             ^
   drivers/ras/amd/atl/umc.c:25:37: warning: declaration of 'struct mce' will not be visible outside of this function [-Wvisibility]
      25 | static u8 get_coh_st_inst_id(struct mce *m)
         |                                     ^
   drivers/ras/amd/atl/umc.c:27:37: error: incomplete definition of type 'struct mce'
      27 |         return FIELD_GET(UMC_CHANNEL_NUM, m->ipid);
         |                                           ~^
   include/linux/bitfield.h:154:27: note: expanded from macro 'FIELD_GET'
     154 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                                         ^~~~
   include/linux/bitfield.h:72:25: note: expanded from macro '__BF_FIELD_CHECK'
      72 |                                  __bf_cast_unsigned(_reg, ~0ull),       \
         |                                                     ^~~~
   include/linux/bitfield.h:61:64: note: expanded from macro '__bf_cast_unsigned'
      61 | #define __bf_cast_unsigned(type, x)     ((__unsigned_scalar_typeof(type))(x))
         |                                                                    ^~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   drivers/ras/amd/atl/umc.c:25:37: note: forward declaration of 'struct mce'
      25 | static u8 get_coh_st_inst_id(struct mce *m)
         |                                     ^
   drivers/ras/amd/atl/umc.c:27:37: error: incomplete definition of type 'struct mce'
      27 |         return FIELD_GET(UMC_CHANNEL_NUM, m->ipid);
         |                                           ~^
   include/linux/bitfield.h:154:27: note: expanded from macro 'FIELD_GET'
     154 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                                         ^~~~
   include/linux/bitfield.h:72:25: note: expanded from macro '__BF_FIELD_CHECK'
      72 |                                  __bf_cast_unsigned(_reg, ~0ull),       \
         |                                                     ^~~~
   include/linux/bitfield.h:61:64: note: expanded from macro '__bf_cast_unsigned'
      61 | #define __bf_cast_unsigned(type, x)     ((__unsigned_scalar_typeof(type))(x))
         |                                                                    ^~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   drivers/ras/amd/atl/umc.c:25:37: note: forward declaration of 'struct mce'
      25 | static u8 get_coh_st_inst_id(struct mce *m)
         |                                     ^
   drivers/ras/amd/atl/umc.c:27:37: error: incomplete definition of type 'struct mce'
      27 |         return FIELD_GET(UMC_CHANNEL_NUM, m->ipid);
         |                                           ~^
   include/linux/bitfield.h:155:21: note: expanded from macro 'FIELD_GET'
     155 |                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
         |                                   ^~~~
   drivers/ras/amd/atl/umc.c:25:37: note: forward declaration of 'struct mce'
      25 | static u8 get_coh_st_inst_id(struct mce *m)
         |                                     ^
   drivers/ras/amd/atl/umc.c:30:55: warning: declaration of 'struct mce' will not be visible outside of this function [-Wvisibility]
      30 | unsigned long convert_umc_mca_addr_to_sys_addr(struct mce *m)
         |                                                       ^
>> drivers/ras/amd/atl/umc.c:30:15: error: conflicting types for 'convert_umc_mca_addr_to_sys_addr'
      30 | unsigned long convert_umc_mca_addr_to_sys_addr(struct mce *m)
         |               ^
   drivers/ras/amd/atl/internal.h:226:15: note: previous declaration is here
     226 | unsigned long convert_umc_mca_addr_to_sys_addr(struct mce *m);
         |               ^
>> drivers/ras/amd/atl/umc.c:32:41: error: incompatible pointer types passing 'struct mce *' to parameter of type 'struct mce *' [-Werror,-Wincompatible-pointer-types]
      32 |         u8 coh_st_inst_id = get_coh_st_inst_id(m);
         |                                                ^
   drivers/ras/amd/atl/umc.c:25:42: note: passing argument to parameter 'm' here
      25 | static u8 get_coh_st_inst_id(struct mce *m)
         |                                          ^
   drivers/ras/amd/atl/umc.c:33:24: error: incomplete definition of type 'struct mce'
      33 |         unsigned long addr = m->addr;
         |                              ~^
   drivers/ras/amd/atl/umc.c:30:55: note: forward declaration of 'struct mce'
      30 | unsigned long convert_umc_mca_addr_to_sys_addr(struct mce *m)
         |                                                       ^
   drivers/ras/amd/atl/umc.c:34:18: error: incomplete definition of type 'struct mce'
      34 |         u8 socket_id = m->socketid;
         |                        ~^
   drivers/ras/amd/atl/umc.c:30:55: note: forward declaration of 'struct mce'
      30 | unsigned long convert_umc_mca_addr_to_sys_addr(struct mce *m)
         |                                                       ^
   drivers/ras/amd/atl/umc.c:35:25: error: incompatible pointer types passing 'struct mce *' to parameter of type 'struct mce *' [-Werror,-Wincompatible-pointer-types]
      35 |         u8 die_id = get_die_id(m);
         |                                ^
   drivers/ras/amd/atl/umc.c:15:34: note: passing argument to parameter 'm' here
      15 | static u8 get_die_id(struct mce *m)
         |                                  ^
   4 warnings and 9 errors generated.


vim +/amd_atl_register_decoder +207 drivers/ras/amd/atl/core.c

8e1d0790e0a749 Yazen Ghannam 2023-12-18   15  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  @16  #include "internal.h"
8e1d0790e0a749 Yazen Ghannam 2023-12-18   17  
8e1d0790e0a749 Yazen Ghannam 2023-12-18   18  struct df_config df_cfg __read_mostly;
8e1d0790e0a749 Yazen Ghannam 2023-12-18   19  
8e1d0790e0a749 Yazen Ghannam 2023-12-18   20  static int addr_over_limit(struct addr_ctx *ctx)
8e1d0790e0a749 Yazen Ghannam 2023-12-18   21  {
8e1d0790e0a749 Yazen Ghannam 2023-12-18   22  	u64 dram_limit_addr;
8e1d0790e0a749 Yazen Ghannam 2023-12-18   23  
8e1d0790e0a749 Yazen Ghannam 2023-12-18   24  	if (df_cfg.rev >= DF4)
8e1d0790e0a749 Yazen Ghannam 2023-12-18   25  		dram_limit_addr = FIELD_GET(DF4_DRAM_LIMIT_ADDR, ctx->map.limit);
8e1d0790e0a749 Yazen Ghannam 2023-12-18   26  	else
8e1d0790e0a749 Yazen Ghannam 2023-12-18   27  		dram_limit_addr = FIELD_GET(DF2_DRAM_LIMIT_ADDR, ctx->map.limit);
8e1d0790e0a749 Yazen Ghannam 2023-12-18   28  
8e1d0790e0a749 Yazen Ghannam 2023-12-18   29  	dram_limit_addr <<= DF_DRAM_BASE_LIMIT_LSB;
8e1d0790e0a749 Yazen Ghannam 2023-12-18   30  	dram_limit_addr |= GENMASK(DF_DRAM_BASE_LIMIT_LSB - 1, 0);
8e1d0790e0a749 Yazen Ghannam 2023-12-18   31  
8e1d0790e0a749 Yazen Ghannam 2023-12-18   32  	/* Is calculated system address above DRAM limit address? */
8e1d0790e0a749 Yazen Ghannam 2023-12-18   33  	if (ctx->ret_addr > dram_limit_addr) {
8e1d0790e0a749 Yazen Ghannam 2023-12-18   34  		atl_debug(ctx, "Calculated address (0x%016llx) > DRAM limit (0x%016llx)",
8e1d0790e0a749 Yazen Ghannam 2023-12-18   35  			  ctx->ret_addr, dram_limit_addr);
8e1d0790e0a749 Yazen Ghannam 2023-12-18   36  		return -EINVAL;
8e1d0790e0a749 Yazen Ghannam 2023-12-18   37  	}
8e1d0790e0a749 Yazen Ghannam 2023-12-18   38  
8e1d0790e0a749 Yazen Ghannam 2023-12-18   39  	return 0;
8e1d0790e0a749 Yazen Ghannam 2023-12-18   40  }
8e1d0790e0a749 Yazen Ghannam 2023-12-18   41  
8e1d0790e0a749 Yazen Ghannam 2023-12-18   42  static bool legacy_hole_en(struct addr_ctx *ctx)
8e1d0790e0a749 Yazen Ghannam 2023-12-18   43  {
8e1d0790e0a749 Yazen Ghannam 2023-12-18   44  	u32 reg = ctx->map.base;
8e1d0790e0a749 Yazen Ghannam 2023-12-18   45  
8e1d0790e0a749 Yazen Ghannam 2023-12-18   46  	if (df_cfg.rev >= DF4)
8e1d0790e0a749 Yazen Ghannam 2023-12-18   47  		reg = ctx->map.ctl;
8e1d0790e0a749 Yazen Ghannam 2023-12-18   48  
8e1d0790e0a749 Yazen Ghannam 2023-12-18   49  	return FIELD_GET(DF_LEGACY_MMIO_HOLE_EN, reg);
8e1d0790e0a749 Yazen Ghannam 2023-12-18   50  }
8e1d0790e0a749 Yazen Ghannam 2023-12-18   51  
8e1d0790e0a749 Yazen Ghannam 2023-12-18   52  static int add_legacy_hole(struct addr_ctx *ctx)
8e1d0790e0a749 Yazen Ghannam 2023-12-18   53  {
8e1d0790e0a749 Yazen Ghannam 2023-12-18   54  	u32 dram_hole_base;
8e1d0790e0a749 Yazen Ghannam 2023-12-18   55  	u8 func = 0;
8e1d0790e0a749 Yazen Ghannam 2023-12-18   56  
8e1d0790e0a749 Yazen Ghannam 2023-12-18   57  	if (!legacy_hole_en(ctx))
8e1d0790e0a749 Yazen Ghannam 2023-12-18   58  		return 0;
8e1d0790e0a749 Yazen Ghannam 2023-12-18   59  
8e1d0790e0a749 Yazen Ghannam 2023-12-18   60  	if (df_cfg.rev >= DF4)
8e1d0790e0a749 Yazen Ghannam 2023-12-18   61  		func = 7;
8e1d0790e0a749 Yazen Ghannam 2023-12-18   62  
8e1d0790e0a749 Yazen Ghannam 2023-12-18   63  	if (df_indirect_read_broadcast(ctx->node_id, func, 0x104, &dram_hole_base))
8e1d0790e0a749 Yazen Ghannam 2023-12-18   64  		return -EINVAL;
8e1d0790e0a749 Yazen Ghannam 2023-12-18   65  
8e1d0790e0a749 Yazen Ghannam 2023-12-18   66  	dram_hole_base &= DF_DRAM_HOLE_BASE_MASK;
8e1d0790e0a749 Yazen Ghannam 2023-12-18   67  
8e1d0790e0a749 Yazen Ghannam 2023-12-18   68  	if (ctx->ret_addr >= dram_hole_base)
8e1d0790e0a749 Yazen Ghannam 2023-12-18   69  		ctx->ret_addr += (BIT_ULL(32) - dram_hole_base);
8e1d0790e0a749 Yazen Ghannam 2023-12-18   70  
8e1d0790e0a749 Yazen Ghannam 2023-12-18   71  	return 0;
8e1d0790e0a749 Yazen Ghannam 2023-12-18   72  }
8e1d0790e0a749 Yazen Ghannam 2023-12-18   73  
8e1d0790e0a749 Yazen Ghannam 2023-12-18   74  static u64 get_base_addr(struct addr_ctx *ctx)
8e1d0790e0a749 Yazen Ghannam 2023-12-18   75  {
8e1d0790e0a749 Yazen Ghannam 2023-12-18   76  	u64 base_addr;
8e1d0790e0a749 Yazen Ghannam 2023-12-18   77  
8e1d0790e0a749 Yazen Ghannam 2023-12-18   78  	if (df_cfg.rev >= DF4)
8e1d0790e0a749 Yazen Ghannam 2023-12-18   79  		base_addr = FIELD_GET(DF4_BASE_ADDR, ctx->map.base);
8e1d0790e0a749 Yazen Ghannam 2023-12-18   80  	else
8e1d0790e0a749 Yazen Ghannam 2023-12-18   81  		base_addr = FIELD_GET(DF2_BASE_ADDR, ctx->map.base);
8e1d0790e0a749 Yazen Ghannam 2023-12-18   82  
8e1d0790e0a749 Yazen Ghannam 2023-12-18   83  	return base_addr << DF_DRAM_BASE_LIMIT_LSB;
8e1d0790e0a749 Yazen Ghannam 2023-12-18   84  }
8e1d0790e0a749 Yazen Ghannam 2023-12-18   85  
8e1d0790e0a749 Yazen Ghannam 2023-12-18   86  static int add_base_and_hole(struct addr_ctx *ctx)
8e1d0790e0a749 Yazen Ghannam 2023-12-18   87  {
8e1d0790e0a749 Yazen Ghannam 2023-12-18   88  	ctx->ret_addr += get_base_addr(ctx);
8e1d0790e0a749 Yazen Ghannam 2023-12-18   89  
8e1d0790e0a749 Yazen Ghannam 2023-12-18   90  	if (add_legacy_hole(ctx))
8e1d0790e0a749 Yazen Ghannam 2023-12-18   91  		return -EINVAL;
8e1d0790e0a749 Yazen Ghannam 2023-12-18   92  
8e1d0790e0a749 Yazen Ghannam 2023-12-18   93  	return 0;
8e1d0790e0a749 Yazen Ghannam 2023-12-18   94  }
8e1d0790e0a749 Yazen Ghannam 2023-12-18   95  
8e1d0790e0a749 Yazen Ghannam 2023-12-18   96  static bool late_hole_remove(struct addr_ctx *ctx)
8e1d0790e0a749 Yazen Ghannam 2023-12-18   97  {
8e1d0790e0a749 Yazen Ghannam 2023-12-18   98  	if (df_cfg.rev == DF3p5)
8e1d0790e0a749 Yazen Ghannam 2023-12-18   99  		return true;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  100  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  101  	if (df_cfg.rev == DF4)
8e1d0790e0a749 Yazen Ghannam 2023-12-18  102  		return true;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  103  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  104  	if (ctx->map.intlv_mode == DF3_6CHAN)
8e1d0790e0a749 Yazen Ghannam 2023-12-18  105  		return true;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  106  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  107  	return false;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  108  }
8e1d0790e0a749 Yazen Ghannam 2023-12-18  109  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  110  unsigned long norm_to_sys_addr(u8 socket_id, u8 die_id, u8 coh_st_inst_id, unsigned long addr)
8e1d0790e0a749 Yazen Ghannam 2023-12-18  111  {
8e1d0790e0a749 Yazen Ghannam 2023-12-18  112  	struct addr_ctx ctx;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  113  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  114  	if (df_cfg.rev == UNKNOWN)
8e1d0790e0a749 Yazen Ghannam 2023-12-18  115  		return -EINVAL;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  116  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  117  	memset(&ctx, 0, sizeof(ctx));
8e1d0790e0a749 Yazen Ghannam 2023-12-18  118  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  119  	/* Start from the normalized address */
8e1d0790e0a749 Yazen Ghannam 2023-12-18  120  	ctx.ret_addr = addr;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  121  	ctx.inst_id = coh_st_inst_id;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  122  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  123  	ctx.inputs.norm_addr = addr;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  124  	ctx.inputs.socket_id = socket_id;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  125  	ctx.inputs.die_id = die_id;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  126  	ctx.inputs.coh_st_inst_id = coh_st_inst_id;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  127  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  128  	if (determine_node_id(&ctx, socket_id, die_id))
8e1d0790e0a749 Yazen Ghannam 2023-12-18  129  		return -EINVAL;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  130  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  131  	if (get_address_map(&ctx))
8e1d0790e0a749 Yazen Ghannam 2023-12-18  132  		return -EINVAL;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  133  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  134  	if (denormalize_address(&ctx))
8e1d0790e0a749 Yazen Ghannam 2023-12-18  135  		return -EINVAL;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  136  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  137  	if (!late_hole_remove(&ctx) && add_base_and_hole(&ctx))
8e1d0790e0a749 Yazen Ghannam 2023-12-18  138  		return -EINVAL;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  139  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  140  	if (dehash_address(&ctx))
8e1d0790e0a749 Yazen Ghannam 2023-12-18  141  		return -EINVAL;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  142  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  143  	if (late_hole_remove(&ctx) && add_base_and_hole(&ctx))
8e1d0790e0a749 Yazen Ghannam 2023-12-18  144  		return -EINVAL;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  145  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  146  	if (addr_over_limit(&ctx))
8e1d0790e0a749 Yazen Ghannam 2023-12-18  147  		return -EINVAL;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  148  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  149  	return ctx.ret_addr;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  150  }
8e1d0790e0a749 Yazen Ghannam 2023-12-18  151  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  152  static void check_for_legacy_df_access(void)
8e1d0790e0a749 Yazen Ghannam 2023-12-18  153  {
8e1d0790e0a749 Yazen Ghannam 2023-12-18  154  	/*
8e1d0790e0a749 Yazen Ghannam 2023-12-18  155  	 * All Zen-based systems before Family 19h use the legacy
8e1d0790e0a749 Yazen Ghannam 2023-12-18  156  	 * DF Indirect Access (FICAA/FICAD) offsets.
8e1d0790e0a749 Yazen Ghannam 2023-12-18  157  	 */
8e1d0790e0a749 Yazen Ghannam 2023-12-18  158  	if (boot_cpu_data.x86 < 0x19) {
8e1d0790e0a749 Yazen Ghannam 2023-12-18  159  		df_cfg.flags.legacy_ficaa = true;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  160  		return;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  161  	}
8e1d0790e0a749 Yazen Ghannam 2023-12-18  162  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  163  	/* All systems after Family 19h use the current offsets. */
8e1d0790e0a749 Yazen Ghannam 2023-12-18  164  	if (boot_cpu_data.x86 > 0x19)
8e1d0790e0a749 Yazen Ghannam 2023-12-18  165  		return;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  166  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  167  	/* Some Family 19h systems use the legacy offsets. */
8e1d0790e0a749 Yazen Ghannam 2023-12-18  168  	switch (boot_cpu_data.x86_model) {
8e1d0790e0a749 Yazen Ghannam 2023-12-18  169  	case 0x00 ... 0x0f:
8e1d0790e0a749 Yazen Ghannam 2023-12-18  170  	case 0x20 ... 0x5f:
8e1d0790e0a749 Yazen Ghannam 2023-12-18  171  	       df_cfg.flags.legacy_ficaa = true;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  172  	}
8e1d0790e0a749 Yazen Ghannam 2023-12-18  173  }
8e1d0790e0a749 Yazen Ghannam 2023-12-18  174  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  175  /*
8e1d0790e0a749 Yazen Ghannam 2023-12-18  176   * This library provides functionality for AMD-based systems with a Data Fabric.
8e1d0790e0a749 Yazen Ghannam 2023-12-18  177   * The set of systems with a Data Fabric is equivalent to the set of Zen-based systems
8e1d0790e0a749 Yazen Ghannam 2023-12-18  178   * and the set of systems with the Scalable MCA feature at this time. However, these
8e1d0790e0a749 Yazen Ghannam 2023-12-18  179   * are technically independent things.
8e1d0790e0a749 Yazen Ghannam 2023-12-18  180   *
8e1d0790e0a749 Yazen Ghannam 2023-12-18  181   * It's possible to match on the PCI IDs of the Data Fabric devices, but this will be
8e1d0790e0a749 Yazen Ghannam 2023-12-18  182   * an ever expanding list. Instead, match on the SMCA and Zen features to cover all
8e1d0790e0a749 Yazen Ghannam 2023-12-18  183   * relevant systems.
8e1d0790e0a749 Yazen Ghannam 2023-12-18  184   */
8e1d0790e0a749 Yazen Ghannam 2023-12-18  185  static const struct x86_cpu_id amd_atl_cpuids[] = {
8e1d0790e0a749 Yazen Ghannam 2023-12-18  186  	X86_MATCH_FEATURE(X86_FEATURE_SMCA, NULL),
8e1d0790e0a749 Yazen Ghannam 2023-12-18  187  	X86_MATCH_FEATURE(X86_FEATURE_ZEN, NULL),
8e1d0790e0a749 Yazen Ghannam 2023-12-18  188  	{ }
8e1d0790e0a749 Yazen Ghannam 2023-12-18  189  };
8e1d0790e0a749 Yazen Ghannam 2023-12-18  190  MODULE_DEVICE_TABLE(x86cpu, amd_atl_cpuids);
8e1d0790e0a749 Yazen Ghannam 2023-12-18  191  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  192  static int __init amd_atl_init(void)
8e1d0790e0a749 Yazen Ghannam 2023-12-18  193  {
8e1d0790e0a749 Yazen Ghannam 2023-12-18  194  	if (!x86_match_cpu(amd_atl_cpuids))
8e1d0790e0a749 Yazen Ghannam 2023-12-18  195  		return -ENODEV;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  196  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  197  	if (!amd_nb_num())
8e1d0790e0a749 Yazen Ghannam 2023-12-18  198  		return -ENODEV;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  199  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  200  	check_for_legacy_df_access();
8e1d0790e0a749 Yazen Ghannam 2023-12-18  201  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  202  	if (get_df_system_info())
8e1d0790e0a749 Yazen Ghannam 2023-12-18  203  		return -ENODEV;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  204  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  205  	/* Increment this module's recount so that it can't be easily unloaded. */
8e1d0790e0a749 Yazen Ghannam 2023-12-18  206  	__module_get(THIS_MODULE);
8e1d0790e0a749 Yazen Ghannam 2023-12-18 @207  	amd_atl_register_decoder(convert_umc_mca_addr_to_sys_addr);
8e1d0790e0a749 Yazen Ghannam 2023-12-18  208  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  209  	pr_info("AMD Address Translation Library initialized");
8e1d0790e0a749 Yazen Ghannam 2023-12-18  210  	return 0;
8e1d0790e0a749 Yazen Ghannam 2023-12-18  211  }
8e1d0790e0a749 Yazen Ghannam 2023-12-18  212  
8e1d0790e0a749 Yazen Ghannam 2023-12-18  213  /*
8e1d0790e0a749 Yazen Ghannam 2023-12-18  214   * Exit function is only needed for testing and debug. Module unload must be
8e1d0790e0a749 Yazen Ghannam 2023-12-18  215   * forced to override refcount check.
8e1d0790e0a749 Yazen Ghannam 2023-12-18  216   */
8e1d0790e0a749 Yazen Ghannam 2023-12-18  217  static void __exit amd_atl_exit(void)
8e1d0790e0a749 Yazen Ghannam 2023-12-18  218  {
8e1d0790e0a749 Yazen Ghannam 2023-12-18 @219  	amd_atl_unregister_decoder();
8e1d0790e0a749 Yazen Ghannam 2023-12-18  220  }
8e1d0790e0a749 Yazen Ghannam 2023-12-18  221  

:::::: The code at line 207 was first introduced by commit
:::::: 8e1d0790e0a749a62428ff039c7a9050a06e9feb RAS: Introduce AMD Address Translation Library

:::::: TO: Yazen Ghannam <yazen.ghannam@amd.com>
:::::: CC: Borislav Petkov (AMD) <bp@alien8.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
