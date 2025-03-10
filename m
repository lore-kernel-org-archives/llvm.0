Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222A1222598;
	Mon, 10 Mar 2025 08:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741594128; cv=none; b=sNDWxi29+//8L1Qlo9O5k9WmBC1PSHFn5zhTL3lGWMWGNIDuSIe55phTTUucHAkSe8OIFrXrNhvhZ2Yc6iJFRXOukFxCuJnnI+NpRG/M9lHeqTbbrIAGOq7Sc5gPjmmKVhx86kUitIomYosT5QAwoD2o9Y28UCRQL+ON0+nJFp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741594128; c=relaxed/simple;
	bh=oj773ZY1lX6xeNXKPLSmZK9uZvl58r8+Nt5vEp3hkqM=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zx5kY3p+9teOV737NR0k76HbmhobZ7RLx204flSJGRcJrX/+5pTyoqLkQW4BGQAOOKTyJ8FcKZW4DE/ijfuqjZcwJkEZ7AZIjgrLja51RZMvGxGuwKQ6EiLrqH+72HvRjxsA8jl2XkyJhDKSzMVw1dqSW4LO/gN8Jj7h2Rdypho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bas7sXuF; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bas7sXuF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741594126; x=1773130126;
  h=date:from:cc:subject:message-id:mime-version;
  bh=oj773ZY1lX6xeNXKPLSmZK9uZvl58r8+Nt5vEp3hkqM=;
  b=bas7sXuFgHjs5lcQ2PEueTXZFvOxjTRR5TOU5+7bZNpPviT++MyP/gyK
   IDVatni63rS+Qe7rHzz++vNNQ2t58335LyR4BOjaJDayzVJo/a84yafdi
   /+8ysQ4DN+wDpGhrxt1QNgfB4Ex+3dr7JkhIk6EnnPOYZPvN9aS2EHgwn
   eniq4+P2JK6r1IJoAPWQvbZUgxEU1lTYIeiaaVHvb/hUCMgMEPVrzzXlH
   3qtfUHgPAW0Wl/3/ECRykz8jm7WuMrjMcIeVGRD80Pf9K37h6ne6V75P+
   MG5ZoXAnuoIePLJXO2/CKeJqmys/HAt6gnzPusjBTIrq90vyU3YM/WoxZ
   w==;
X-CSE-ConnectionGUID: XekxZ0uDRtuQIz+QS7kEUg==
X-CSE-MsgGUID: ToQZzzPOQgiR/dYXDZPPqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42768047"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="42768047"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 01:08:45 -0700
X-CSE-ConnectionGUID: gtCM+lBETmilN0qILKInqw==
X-CSE-MsgGUID: lEyqF+vrQP21ThEUfwJlTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="124990971"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 10 Mar 2025 01:08:44 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trYBm-0003yf-0h;
	Mon, 10 Mar 2025 08:08:42 +0000
Date: Mon, 10 Mar 2025 16:08:14 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: kernel/bpf/log.c:425:11: warning: bitwise operation between
 different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag')
Message-ID: <202503101529.rnkM3qaN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Andrii Nakryiko <andrii@kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>

Hi Andrii,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   80e54e84911a923c40d7bee33a34c1b4be148d7a
commit: 42feb6620accded89cad5f455665e21281813d79 bpf: move verifier state printing code to kernel/bpf/log.c
date:   1 year, 4 months ago
config: x86_64-buildonly-randconfig-006-20250127 (https://download.01.org/0day-ci/archive/20250310/202503101529.rnkM3qaN-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503101529.rnkM3qaN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503101529.rnkM3qaN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/bpf/log.c:9:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2177:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/bpf/log.c:425:11: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     425 |         if (type & PTR_MAYBE_NULL) {
         |             ~~~~ ^ ~~~~~~~~~~~~~~
   kernel/bpf/log.c:433:9: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     433 |                  type & MEM_RDONLY ? "rdonly_" : "",
         |                  ~~~~ ^ ~~~~~~~~~~
   kernel/bpf/log.c:434:9: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     434 |                  type & MEM_RINGBUF ? "ringbuf_" : "",
         |                  ~~~~ ^ ~~~~~~~~~~~
   kernel/bpf/log.c:435:9: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     435 |                  type & MEM_USER ? "user_" : "",
         |                  ~~~~ ^ ~~~~~~~~
   kernel/bpf/log.c:436:9: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     436 |                  type & MEM_PERCPU ? "percpu_" : "",
         |                  ~~~~ ^ ~~~~~~~~~~
   kernel/bpf/log.c:437:9: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     437 |                  type & MEM_RCU ? "rcu_" : "",
         |                  ~~~~ ^ ~~~~~~~
   kernel/bpf/log.c:438:9: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     438 |                  type & PTR_UNTRUSTED ? "untrusted_" : "",
         |                  ~~~~ ^ ~~~~~~~~~~~~~
   kernel/bpf/log.c:439:9: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     439 |                  type & PTR_TRUSTED ? "trusted_" : ""
         |                  ~~~~ ^ ~~~~~~~~~~~
   9 warnings generated.


vim +425 kernel/bpf/log.c

   392	
   393	/* string representation of 'enum bpf_reg_type'
   394	 *
   395	 * Note that reg_type_str() can not appear more than once in a single verbose()
   396	 * statement.
   397	 */
   398	const char *reg_type_str(struct bpf_verifier_env *env, enum bpf_reg_type type)
   399	{
   400		char postfix[16] = {0}, prefix[64] = {0};
   401		static const char * const str[] = {
   402			[NOT_INIT]		= "?",
   403			[SCALAR_VALUE]		= "scalar",
   404			[PTR_TO_CTX]		= "ctx",
   405			[CONST_PTR_TO_MAP]	= "map_ptr",
   406			[PTR_TO_MAP_VALUE]	= "map_value",
   407			[PTR_TO_STACK]		= "fp",
   408			[PTR_TO_PACKET]		= "pkt",
   409			[PTR_TO_PACKET_META]	= "pkt_meta",
   410			[PTR_TO_PACKET_END]	= "pkt_end",
   411			[PTR_TO_FLOW_KEYS]	= "flow_keys",
   412			[PTR_TO_SOCKET]		= "sock",
   413			[PTR_TO_SOCK_COMMON]	= "sock_common",
   414			[PTR_TO_TCP_SOCK]	= "tcp_sock",
   415			[PTR_TO_TP_BUFFER]	= "tp_buffer",
   416			[PTR_TO_XDP_SOCK]	= "xdp_sock",
   417			[PTR_TO_BTF_ID]		= "ptr_",
   418			[PTR_TO_MEM]		= "mem",
   419			[PTR_TO_BUF]		= "buf",
   420			[PTR_TO_FUNC]		= "func",
   421			[PTR_TO_MAP_KEY]	= "map_key",
   422			[CONST_PTR_TO_DYNPTR]	= "dynptr_ptr",
   423		};
   424	
 > 425		if (type & PTR_MAYBE_NULL) {
   426			if (base_type(type) == PTR_TO_BTF_ID)
   427				strncpy(postfix, "or_null_", 16);
   428			else
   429				strncpy(postfix, "_or_null", 16);
   430		}
   431	
   432		snprintf(prefix, sizeof(prefix), "%s%s%s%s%s%s%s",
   433			 type & MEM_RDONLY ? "rdonly_" : "",
   434			 type & MEM_RINGBUF ? "ringbuf_" : "",
   435			 type & MEM_USER ? "user_" : "",
   436			 type & MEM_PERCPU ? "percpu_" : "",
   437			 type & MEM_RCU ? "rcu_" : "",
   438			 type & PTR_UNTRUSTED ? "untrusted_" : "",
   439			 type & PTR_TRUSTED ? "trusted_" : ""
   440		);
   441	
   442		snprintf(env->tmp_str_buf, TMP_STR_BUF_LEN, "%s%s%s",
   443			 prefix, str[base_type(type)], postfix);
   444		return env->tmp_str_buf;
   445	}
   446	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
