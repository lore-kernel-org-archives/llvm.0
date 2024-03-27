Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA8323774;
	Wed, 27 Mar 2024 04:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711513339; cv=none; b=jwxmR6MzydbIdeR0ifgMjTKjV5o/vSN6Z9tuLInyMYhXr468mltBTTS3gI80LC9xtTGm/zkFEXrAFKX5CjJJOIDwE0KbyYfGq5RNj0viMGxDBp+rYz7nydAWmtXyBIsBbAU8jK+telkXtAC4zafSuoE6lMgrhDp6Nm7zrR2Yhw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711513339; c=relaxed/simple;
	bh=oiKTiKOb5Jojd+oorgkSC6Zix3bkAATtMk0CoQngLAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8qdEgZKtD9X4DwWGlL9y8LWFtXbHnBPQCUb/lzcXvB2IDLzi8/BtKV/4m7HYKZ89n/7lTi4/jO6vUSwW3qOfNt3yskNoqvBkZ+e3W1ANiomZfnQY3rAunfKyZfJByjLuRxf98AV4EGqa49y4GGUE5d908+mNFevIuGCL/kLgmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nqzN21fe; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nqzN21fe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711513337; x=1743049337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oiKTiKOb5Jojd+oorgkSC6Zix3bkAATtMk0CoQngLAg=;
  b=nqzN21feLnHN6JklX3sqLCnr0OCZdswOP7LTl/QHSoa7AKh+GcJXhpU2
   SEMIZXfPBsnttZBNl/XZlUJod1sye1Wy2aBRbpsshzmu5NxTDthoX7lzm
   XSP3u+cgUbIk7bCWefIysbQM9/uHgtWqDQmIIkXBu4Me+ArfqkcMwoISx
   Xu+leXMZcnllac+av53E3DepIe2KgRkSjPhMAU6PGLcFStCqc7WPZZGhc
   hVFc3M5b9TQfuY6Yu565Hi/FKsUGCmQc53Gu3bw+J4mo5xy3drZDVUqMy
   CD3J6T+PC7TH/vKbC5JKDQCLZAQ7IDGNK1GDJNennMVQP37heT4gHkQup
   g==;
X-CSE-ConnectionGUID: T6mVx7onT4K3+fXZF7msDg==
X-CSE-MsgGUID: FxVQ9aV9STagdtvE2hnYXA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6458258"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="6458258"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 21:22:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="20892615"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Mar 2024 21:22:13 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpKnj-0000kQ-0N;
	Wed, 27 Mar 2024 04:22:11 +0000
Date: Wed, 27 Mar 2024 12:21:30 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/4] tracing: add __print_sym() to replace
 __print_symbolic()
Message-ID: <202403271216.iazgC6LR-lkp@intel.com>
References: <20240326202131.9d261d5bb667.I9bd2617499f0d170df58471bc51379742190f92d@changeid>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240326202131.9d261d5bb667.I9bd2617499f0d170df58471bc51379742190f92d@changeid>

Hi Johannes,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on mcgrof/modules-next]
[also build test WARNING on arnd-asm-generic/master tip/timers/core net/main net-next/main linus/master horms-ipvs/master v6.9-rc1 next-20240326]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/tracing-add-__print_sym-to-replace-__print_symbolic/20240327-032437
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git modules-next
patch link:    https://lore.kernel.org/r/20240326202131.9d261d5bb667.I9bd2617499f0d170df58471bc51379742190f92d%40changeid
patch subject: [RFC PATCH v2 1/4] tracing: add __print_sym() to replace __print_symbolic()
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240327/202403271216.iazgC6LR-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240327/202403271216.iazgC6LR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403271216.iazgC6LR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/maple_tree.c:65:
   In file included from include/trace/events/maple_tree.h:123:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:27:
>> include/trace/stages/init.h:30:9: warning: 'TRACE_DEFINE_SYM_FNS' macro redefined [-Wmacro-redefined]
      30 | #define TRACE_DEFINE_SYM_FNS(_symbol_id, _lookup, _show)                \
         |         ^
   include/linux/tracepoint.h:130:9: note: previous definition is here
     130 | #define TRACE_DEFINE_SYM_FNS(...)
         |         ^
   In file included from lib/maple_tree.c:65:
   In file included from include/trace/events/maple_tree.h:123:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:27:
>> include/trace/stages/init.h:54:9: warning: 'TRACE_DEFINE_SYM_LIST' macro redefined [-Wmacro-redefined]
      54 | #define TRACE_DEFINE_SYM_LIST(_symbol_id, ...)                          \
         |         ^
   include/linux/tracepoint.h:131:9: note: previous definition is here
     131 | #define TRACE_DEFINE_SYM_LIST(...)
         |         ^
   2 warnings generated.
--
   In file included from lib/maple_tree.c:65:
   In file included from include/trace/events/maple_tree.h:9:
   In file included from include/linux/tracepoint.h:22:
   In file included from include/linux/static_call.h:135:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from lib/maple_tree.c:65:
   In file included from include/trace/events/maple_tree.h:123:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:27:
>> include/trace/stages/init.h:30:9: warning: 'TRACE_DEFINE_SYM_FNS' macro redefined [-Wmacro-redefined]
      30 | #define TRACE_DEFINE_SYM_FNS(_symbol_id, _lookup, _show)                \
         |         ^
   include/linux/tracepoint.h:130:9: note: previous definition is here
     130 | #define TRACE_DEFINE_SYM_FNS(...)
         |         ^
   In file included from lib/maple_tree.c:65:
   In file included from include/trace/events/maple_tree.h:123:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:27:
>> include/trace/stages/init.h:54:9: warning: 'TRACE_DEFINE_SYM_LIST' macro redefined [-Wmacro-redefined]
      54 | #define TRACE_DEFINE_SYM_LIST(_symbol_id, ...)                          \
         |         ^
   include/linux/tracepoint.h:131:9: note: previous definition is here
     131 | #define TRACE_DEFINE_SYM_LIST(...)
         |         ^
   lib/maple_tree.c:351:21: warning: unused function 'mte_set_full' [-Wunused-function]
     351 | static inline void *mte_set_full(const struct maple_enode *node)
         |                     ^~~~~~~~~~~~
   lib/maple_tree.c:356:21: warning: unused function 'mte_clear_full' [-Wunused-function]
     356 | static inline void *mte_clear_full(const struct maple_enode *node)
         |                     ^~~~~~~~~~~~~~
   lib/maple_tree.c:361:20: warning: unused function 'mte_has_null' [-Wunused-function]
     361 | static inline bool mte_has_null(const struct maple_enode *node)
         |                    ^~~~~~~~~~~~
   10 warnings generated.


vim +/TRACE_DEFINE_SYM_FNS +30 include/trace/stages/init.h

    12	
    13	#undef TRACE_DEFINE_ENUM
    14	#define TRACE_DEFINE_ENUM(a)				\
    15		static struct trace_eval_map __used __initdata	\
    16		__##TRACE_SYSTEM##_##a =			\
    17		{						\
    18			.system = TRACE_SYSTEM_STRING,		\
    19			.eval_string = #a,			\
    20			.eval_value = a				\
    21		};						\
    22		static struct trace_eval_map __used		\
    23		__section("_ftrace_eval_map")			\
    24		*TRACE_SYSTEM##_##a = &__##TRACE_SYSTEM##_##a
    25	
    26	/*
    27	 * Define a symbol for __print_sym by giving lookup and
    28	 * show functions. See &struct trace_sym_def.
    29	 */
  > 30	#define TRACE_DEFINE_SYM_FNS(_symbol_id, _lookup, _show)		\
    31		_TRACE_DEFINE_SYM_FNS(TRACE_SYSTEM, _symbol_id, _lookup, _show)
    32	#define _TRACE_DEFINE_SYM_FNS(_system, _symbol_id, _lookup, _show)	\
    33		__TRACE_DEFINE_SYM_FNS(_system, _symbol_id, _lookup, _show)
    34	#define __TRACE_DEFINE_SYM_FNS(_system, _symbol_id, _lookup, _show)	\
    35		___TRACE_DEFINE_SYM_FNS(_system ## _ ## _symbol_id, _symbol_id,	\
    36					_lookup, _show)
    37	#define ___TRACE_DEFINE_SYM_FNS(_name, _symbol_id, _lookup, _show)	\
    38		static struct trace_sym_def					\
    39		__trace_sym_def_ ## _name = {					\
    40			.system = TRACE_SYSTEM_STRING,				\
    41			/* need the ) for later strcmp */			\
    42			.symbol_id = #_symbol_id ")",				\
    43			.lookup = _lookup,					\
    44			.show = _show,						\
    45		};								\
    46		static struct trace_sym_def 					\
    47		__section("_ftrace_sym_defs")					\
    48		*__trace_sym_def_p_ ## _name = &__trace_sym_def_ ## _name
    49	
    50	/*
    51	 * Define a symbol for __print_sym by giving lookup and
    52	 * show functions. See &struct trace_sym_def.
    53	 */
  > 54	#define TRACE_DEFINE_SYM_LIST(_symbol_id, ...)				\
    55		_TRACE_DEFINE_SYM_LIST(TRACE_SYSTEM, _symbol_id, __VA_ARGS__)
    56	#define _TRACE_DEFINE_SYM_LIST(_system, _symbol_id, ...)		\
    57		__TRACE_DEFINE_SYM_LIST(_system, _symbol_id, __VA_ARGS__)
    58	#define __TRACE_DEFINE_SYM_LIST(_system, _symbol_id, ...)		\
    59		___TRACE_DEFINE_SYM_LIST(_system ## _ ## _symbol_id, _symbol_id,\
    60					 __VA_ARGS__)
    61	#define ___TRACE_DEFINE_SYM_LIST(_name, _symbol_id, ...)		\
    62		static struct trace_sym_entry					\
    63		__trace_sym_list_ ## _name[] = { __VA_ARGS__ };			\
    64		static const char *						\
    65		__trace_sym_lookup_ ## _name(unsigned long long value)		\
    66		{								\
    67			return trace_sym_lookup(__trace_sym_list_ ## _name,	\
    68				ARRAY_SIZE(__trace_sym_list_ ## _name), value);	\
    69		}								\
    70		static void							\
    71		__trace_sym_show_ ## _name(struct seq_file *m)			\
    72		{								\
    73			trace_sym_show(m, __trace_sym_list_ ## _name,		\
    74				       ARRAY_SIZE(__trace_sym_list_ ## _name));	\
    75		}								\
    76		___TRACE_DEFINE_SYM_FNS(_name, _symbol_id,			\
    77					__trace_sym_lookup_ ## _name,		\
    78					__trace_sym_show_ ## _name)
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
