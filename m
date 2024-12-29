Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB9A3C17;
	Sun, 29 Dec 2024 09:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735464629; cv=none; b=Pf34gNPeUukaiFL650yHxMhVICGjfK0xUXwg6Cs2RuNDZhce7dLWL+g+A4O127VtMs5GHrGAfkIli+LjA+WxHh0TTX2Vmmycs9s+X7k+FhRd4GjZsN5DPnE/Cznd5EP7kZjzqesdUXgWt3TChFJAwSv3l/kMWLYbdOh0s864Y9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735464629; c=relaxed/simple;
	bh=qwqq6QGuYhJc1afZdnkvxvnWwpgOpYbwvYfKR0NOy+Y=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o5fkRWBjQLrR57PTks0GOFWxorQDYU2+XOZeGO5Kq2FZ5JYHQT0YerpxCVQQaqzjx8+NY+PuYrlgATSG315Ajs4Azsg5wXd9Z4Ze9YeaXi0rz5wiN6mVBnJkRzO8t9rMw4AwpEiGNreVDKKIJw6GXjUTA9tc6pHvhp0fwlnfIlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k+Sbt+ZV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+Sbt+ZV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735464627; x=1767000627;
  h=date:from:cc:subject:message-id:mime-version;
  bh=qwqq6QGuYhJc1afZdnkvxvnWwpgOpYbwvYfKR0NOy+Y=;
  b=k+Sbt+ZVOPKETb7SIoxPovcct8Tzj6XbAGGy9U6RvBa1gpL2O9zfX+vu
   9OU2+qnbUhHRsaq31qObt6xmoCK8Tlui4wXB6DWsmruaX9FBuDwVTcI1Y
   gWwYWxYuziqtUeV8C7ov10Y1xqeRUes5tQoItLxup1pVPxrv+RfrfWRDv
   r+yHCXkX38s4X2622478VYF98oEaKiS8yvc7ky0WCLRnR89grOofI6E6V
   Q1kzJDs1FbLCPS+GIcRgGkU5J2bEF1/az5erxG+8zMUc9AyWJ+F1TJUFN
   ZyG73y7nOpbVFK8WU0DD4Tlx1Ff1GQp2xI0ixZJ2C8yF6PoLNkbuVAJoV
   Q==;
X-CSE-ConnectionGUID: Y0WrshQTQhakO89j3J59NQ==
X-CSE-MsgGUID: dxH7DYOlQYq6MViIK5fiIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="23379341"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="23379341"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 01:30:26 -0800
X-CSE-ConnectionGUID: iQ9ALlJ2TcyWCmqYQQyx6Q==
X-CSE-MsgGUID: KWDlRhwkSbCxo+co3W9YUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137880396"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Dec 2024 01:30:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRpct-0004b2-16;
	Sun, 29 Dec 2024 09:30:23 +0000
Date: Sun, 29 Dec 2024 17:29:52 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: kernel/bpf/verifier.c:559:11: warning: bitwise operation between
 different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag')
Message-ID: <202412291720.pND7BN8r-lkp@intel.com>
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
head:   059dd502b263d8a4e2a84809cf1068d6a3905e6f
commit: c25b2ae136039ffa820c26138ed4a5e5f3ab3841 bpf: Replace PTR_TO_XXX_OR_NULL with PTR_TO_XXX | PTR_MAYBE_NULL
date:   3 years ago
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241229/202412291720.pND7BN8r-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412291720.pND7BN8r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412291720.pND7BN8r-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/bpf/verifier.c:7:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:20:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:1721:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
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
   11 warnings generated.
--
   In file included from kernel/bpf/map_iter.c:3:
   In file included from include/linux/bpf.h:20:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:1721:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/bpf/map_iter.c:177:23: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     177 |                   PTR_TO_RDONLY_BUF | PTR_MAYBE_NULL },
         |                   ~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/bpf/map_iter.c:179:21: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     179 |                   PTR_TO_RDWR_BUF | PTR_MAYBE_NULL },
         |                   ~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   3 warnings generated.
--
   In file included from net/core/sock_map.c:4:
   In file included from include/linux/bpf.h:20:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:1721:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> net/core/sock_map.c:1567:23: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1567 |                   PTR_TO_RDONLY_BUF | PTR_MAYBE_NULL },
         |                   ~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   2 warnings generated.
--
   In file included from net/core/bpf_sk_storage.c:8:
   In file included from include/linux/bpf.h:20:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:1721:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> net/core/bpf_sk_storage.c:932:21: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     932 |                   PTR_TO_RDWR_BUF | PTR_MAYBE_NULL },
         |                   ~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   2 warnings generated.


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
