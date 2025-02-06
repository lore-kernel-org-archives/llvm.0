Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76696A33B;
	Thu,  6 Feb 2025 02:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738807935; cv=none; b=C4q/gYB//7DOAgopYnVARkRX1EKuUOGRZ+wVJEKilZqOOrbK8c1E9IqCeJG7xO03nohXjzf4dwbygRTFiqI4ceF6A70gr9pBMnQF4yCNaa3slCtLrXd/qn3+ZzQbNtd1OFVj1L7AdAO7IyAy20PpeTqX7YIl0a5RxwtgLhwHQyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738807935; c=relaxed/simple;
	bh=s5ABybadNbx5dhtsgIpzsbFk+k0DTAMZT/VsP4j4byc=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KX4su1zvvohHY0bG2949EB+/PmwIoBzRNeCUYNnmmEq3e30pHONflyPz74tsAoXhT9a5OAVfc76EpEz22FCDRJ+O4YuByIiaq+LPPpDO8wvreZdOWXW0onEl1WtvcfS6Xx2QiQx2H8LtNE3UgPffwoF7mJqj2tgKKT7a1jk3kPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dFtN5eoN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dFtN5eoN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738807934; x=1770343934;
  h=date:from:cc:subject:message-id:mime-version;
  bh=s5ABybadNbx5dhtsgIpzsbFk+k0DTAMZT/VsP4j4byc=;
  b=dFtN5eoNA992tuxDe4qzKZazM8DBmph08uq93QIP0NCU5UAbBtDsjMa3
   um1oY+EUgAKf2IRoBME4rucoSB+XOIyI4Rr2IjZ5xA6dG9UUIzWprLMQg
   592w2fAnWmvpSxwW8Yhu6yzZfKfv5mjHzGXAZkKIpHXGak+t8OVzscgZE
   uIL/XI/J4W7mlRyXJsArbk8qwUVI1TK7qKbMSb6IvcZsdoc1ZyuUvcfef
   3fIJUPmxgsHql4XUK1taRC1GsVFMugMKn7a8irUe+72Fsf+LB/u7wr/I3
   kVgSmBbgSCB48yluTzFoR+VE0xCXvjI5zlCUdFjQkP400T3hpng3OQHZA
   g==;
X-CSE-ConnectionGUID: QKMZxeheRaqlkTuxy8DRMg==
X-CSE-MsgGUID: C9pdgZ5fTLmKFe9UyVj9IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43151198"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="43151198"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 18:12:13 -0800
X-CSE-ConnectionGUID: 4yOB26R0S3+4tQNmoNjBmQ==
X-CSE-MsgGUID: YZIpoOweRdyt9cPZHckUDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115151441"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Feb 2025 18:12:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfrNB-000wLs-1U;
	Thu, 06 Feb 2025 02:12:09 +0000
Date: Thu, 6 Feb 2025 10:11:45 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: kernel/bpf/verifier.c:559:11: warning: bitwise operation between
 different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag')
Message-ID: <202502061028.oJzUQ4PO-lkp@intel.com>
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

Hi Hao,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   92514ef226f511f2ca1fb1b8752966097518edc0
commit: c25b2ae136039ffa820c26138ed4a5e5f3ab3841 bpf: Replace PTR_TO_XXX_OR_NULL with PTR_TO_XXX | PTR_MAYBE_NULL
date:   3 years, 2 months ago
config: arm-randconfig-004-20250120 (https://download.01.org/0day-ci/archive/20250206/202502061028.oJzUQ4PO-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502061028.oJzUQ4PO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502061028.oJzUQ4PO-lkp@intel.com/

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
