Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8341FB3;
	Fri, 27 Dec 2024 19:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735328857; cv=none; b=nQtpFgVxEBuXoU/MZk9QwQIYi/c8qSAm3xsXf3NrGMLxBEmV8ALHPsYBa3+LHvG8G7iXb82mZfS2INaSJOkNZaZMyKAxNNoZNUw/og9T0wpzKLHiQHMtR1YK/FWV2qUTASb81te3WD6F9+w48W/eEsiXg5YrmYhrORqwnoVYNNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735328857; c=relaxed/simple;
	bh=1Wf6genTBK8WTUSM89HySfp9KmqDF0xJ1SMW6rrJMHQ=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gVUxQd49B/Ap4mzox9ebbeXflbx4ky+NCSIcHiUmCjs0Pb1F1vMBn1Yq38TNnuDZEoNGNjrBecrHqPANEYQXE38F9HG8NJhWDXQMqh7cjQDLcZtPAdZDbCo8NyKk9XYKNGuRLahFHlwZW+RsyveUiiCPLsUHmqIVa7nVlgSDdFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HO/yK3ym; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HO/yK3ym"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735328855; x=1766864855;
  h=date:from:cc:subject:message-id:mime-version;
  bh=1Wf6genTBK8WTUSM89HySfp9KmqDF0xJ1SMW6rrJMHQ=;
  b=HO/yK3ymuesg26QKp+ktulBNAQ9HLArR/zBg8uleE4VLXx7fkIgztxRP
   rjJ1xiHh+YPaHSjcpZe7r8iHkcyJ6Dkt4D+i/L1VtO0eMk592UfymsJ8I
   8XazWcPvo+acDZFueEnnk2HntY2F+bR5GZh4alYrKCA/vYXerEjKfm+wa
   v2H1TRDpK6zYCoAXsYWuXaxoHzn18ySP7v/+0YqWUfE1OUMsFwKhjYFg5
   RMkwim2nVTQWAA16Uc7QT+t+04XfRNvXd1WvVehM2616veCyEx6eHzhvX
   X1jiNyPA5aUsDksKmgMXhuuSahrkgQ28xOQLk2Y1Q43uNfHyi7Nm3Ms9h
   w==;
X-CSE-ConnectionGUID: 012QOY2sQYiQyMx8lpndAg==
X-CSE-MsgGUID: 91jyHIQvSkihd2T8UWkvuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35955945"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35955945"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 11:47:34 -0800
X-CSE-ConnectionGUID: B2yTkriVQle6B+l08mr9BA==
X-CSE-MsgGUID: 6BgYwtpaTeymUf9yIlVX4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104846293"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Dec 2024 11:47:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRGJ1-0003Xo-1W;
	Fri, 27 Dec 2024 19:47:31 +0000
Date: Sat, 28 Dec 2024 03:46:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: kernel/bpf/verifier.c:559:11: warning: bitwise operation between
 different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag')
Message-ID: <202412280338.nu6P3FKl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Hao Luo <haoluo@google.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d6ef8b40d075c425f548002d2f35ae3f06e9cf96
commit: c25b2ae136039ffa820c26138ed4a5e5f3ab3841 bpf: Replace PTR_TO_XXX_OR_NULL with PTR_TO_XXX | PTR_MAYBE_NULL
date:   3 years ago
config: arm64-randconfig-003-20241220 (https://download.01.org/0day-ci/archive/20241228/202412280338.nu6P3FKl-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280338.nu6P3FKl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280338.nu6P3FKl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/bpf/verifier.c:7:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:20:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:1721:
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
>> kernel/bpf/verifier.c:559:11: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     559 |         if (type & PTR_MAYBE_NULL) {
         |             ~~~~ ^ ~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:6602:43: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6602 |                 regs[BPF_REG_0].type = PTR_TO_MAP_VALUE | ret_flag;
         |                                        ~~~~~~~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:6609:40: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6609 |                 regs[BPF_REG_0].type = PTR_TO_SOCKET | ret_flag;
         |                                        ~~~~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:6612:45: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6612 |                 regs[BPF_REG_0].type = PTR_TO_SOCK_COMMON | ret_flag;
         |                                        ~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:6615:42: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6615 |                 regs[BPF_REG_0].type = PTR_TO_TCP_SOCK | ret_flag;
         |                                        ~~~~~~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:6618:37: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6618 |                 regs[BPF_REG_0].type = PTR_TO_MEM | ret_flag;
         |                                        ~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:6638:38: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6638 |                         regs[BPF_REG_0].type = PTR_TO_MEM | ret_flag;
         |                                                ~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:6641:41: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6641 |                         regs[BPF_REG_0].type = PTR_TO_BTF_ID | ret_flag;
         |                                                ~~~~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:6649:40: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6649 |                 regs[BPF_REG_0].type = PTR_TO_BTF_ID | ret_flag;
         |                                        ~~~~~~~~~~~~~ ^ ~~~~~~~~
>> kernel/bpf/verifier.c:7272:20: warning: bitwise operation between different enumeration types ('const enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    7272 |         if (ptr_reg->type & PTR_MAYBE_NULL) {
         |             ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   15 warnings generated.
--
   In file included from kernel/bpf/map_iter.c:3:
   In file included from include/linux/bpf.h:20:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:1721:
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
>> kernel/bpf/map_iter.c:177:23: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     177 |                   PTR_TO_RDONLY_BUF | PTR_MAYBE_NULL },
         |                   ~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/bpf/map_iter.c:179:21: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     179 |                   PTR_TO_RDWR_BUF | PTR_MAYBE_NULL },
         |                   ~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   7 warnings generated.


vim +559 kernel/bpf/verifier.c

   524	
   525	/* string representation of 'enum bpf_reg_type'
   526	 *
   527	 * Note that reg_type_str() can not appear more than once in a single verbose()
   528	 * statement.
   529	 */
   530	static const char *reg_type_str(struct bpf_verifier_env *env,
   531					enum bpf_reg_type type)
   532	{
   533		char postfix[16] = {0};
   534		static const char * const str[] = {
   535			[NOT_INIT]		= "?",
   536			[SCALAR_VALUE]		= "inv",
   537			[PTR_TO_CTX]		= "ctx",
   538			[CONST_PTR_TO_MAP]	= "map_ptr",
   539			[PTR_TO_MAP_VALUE]	= "map_value",
   540			[PTR_TO_STACK]		= "fp",
   541			[PTR_TO_PACKET]		= "pkt",
   542			[PTR_TO_PACKET_META]	= "pkt_meta",
   543			[PTR_TO_PACKET_END]	= "pkt_end",
   544			[PTR_TO_FLOW_KEYS]	= "flow_keys",
   545			[PTR_TO_SOCKET]		= "sock",
   546			[PTR_TO_SOCK_COMMON]	= "sock_common",
   547			[PTR_TO_TCP_SOCK]	= "tcp_sock",
   548			[PTR_TO_TP_BUFFER]	= "tp_buffer",
   549			[PTR_TO_XDP_SOCK]	= "xdp_sock",
   550			[PTR_TO_BTF_ID]		= "ptr_",
   551			[PTR_TO_PERCPU_BTF_ID]	= "percpu_ptr_",
   552			[PTR_TO_MEM]		= "mem",
   553			[PTR_TO_RDONLY_BUF]	= "rdonly_buf",
   554			[PTR_TO_RDWR_BUF]	= "rdwr_buf",
   555			[PTR_TO_FUNC]		= "func",
   556			[PTR_TO_MAP_KEY]	= "map_key",
   557		};
   558	
 > 559		if (type & PTR_MAYBE_NULL) {
   560			if (base_type(type) == PTR_TO_BTF_ID ||
   561			    base_type(type) == PTR_TO_PERCPU_BTF_ID)
   562				strncpy(postfix, "or_null_", 16);
   563			else
   564				strncpy(postfix, "_or_null", 16);
   565		}
   566	
   567		snprintf(env->type_str_buf, TYPE_STR_BUF_LEN, "%s%s",
   568			 str[base_type(type)], postfix);
   569		return env->type_str_buf;
   570	}
   571	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
