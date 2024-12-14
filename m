Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA46E1A08A6;
	Sat, 14 Dec 2024 17:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734197243; cv=none; b=L3aKpukEq7qI1iM4k4PKrXy0ObXtyfHLNvEJ0JQ65ypjwiReBnYZIZ8RrO2hXOlzO6RNXix1Xw6Dx6RiqrPycFq0xe5JO8qIGSovo9HsgThbhjI5wyLSgo+1LNBwuqebm9uyJFzBzbzZKQpCwghjAYy5sk9FKYdXR8tvvjRxIbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734197243; c=relaxed/simple;
	bh=qu19EnEyGt5gT7oeBE/Xs3rjvRYr2NHypFXrXVPMojo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cLAII0PJ2qcEn0lRl6J5wAtwztPhuGsSA5qquzpmpdUHfH37A/xE5kqnhR0pKF1ajje/JrsRJ2lcusqgRCw+fEqU/u6lILUsNG1SlcMBXd7ZDw4asS/y/9NqCpq73dKEAY9KmoNCluPnMrh4a2qBLgWTiWusej8nCiEwQj909Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cyd1BgfM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyd1BgfM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734197241; x=1765733241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qu19EnEyGt5gT7oeBE/Xs3rjvRYr2NHypFXrXVPMojo=;
  b=cyd1BgfMGKtq45TdA6t+57+K9X4gYFuU/CSDl3FOSuJIWWrQRXN++d+/
   Ey/p0xjaHKqLx50C3G7yT4z9HAPQSeOMrBFp3UTTsVCxb2N92LEwXThMN
   p6cu9nqzODzxT03PJegVl7iFht2t1VWgdQIy9/Qt7st5n+jr5mAPjSb2O
   PEfeGL/9S5IqRit7sGsJF2dBzMMiG/qm/4o/RfC81SzBD5N0pfKMxbXAF
   wawRQfNAhsgSqMF+MQ3TCq3G90glmzW6N84k3n6xgVVDyNSHcVrKcF1dT
   8alBSk+bc/P/JbxDO7Elk2ggkT3LFjkuWnctzcQBRRovwgAqSl4nHMPHY
   g==;
X-CSE-ConnectionGUID: 7+Fuo4eHRbW3O2h0LLq2Yw==
X-CSE-MsgGUID: seZvp38AQXuUUr9Qtdq17w==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="46027277"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="46027277"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 09:27:20 -0800
X-CSE-ConnectionGUID: e8qi2guLT7ytgjetTzzehQ==
X-CSE-MsgGUID: L2wbcwwlTTOMLNU5lLrIkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="96561630"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Dec 2024 09:27:19 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMVvA-000D63-20;
	Sat, 14 Dec 2024 17:27:16 +0000
Date: Sun, 15 Dec 2024 01:26:34 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_part2_v3 6/11]
 include/linux/page_frag_cache.h:36:21: warning: 'static' function
 'encoded_page_decode_page' declared in header file should be declared
 'static inline'
Message-ID: <202412150138.wLEXHSIg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache_part2_v3
head:   68b52bf3f8fc7db3d837efaadd688f096a20b3f8
commit: a92c7b766c1f707dfd31e87822695e276e9d0aac [6/11] mm: page_frag: introduce refill prepare & commit API
config: hexagon-randconfig-001-20241214 (https://download.01.org/0day-ci/archive/20241215/202412150138.wLEXHSIg-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 2dc22615fd46ab2566d0f26d5ba234ab12dc4bf8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412150138.wLEXHSIg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412150138.wLEXHSIg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/bpf/prog_iter.c:3:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from kernel/bpf/prog_iter.c:5:
   In file included from include/linux/filter.h:12:
   In file included from include/linux/skbuff.h:34:
>> include/linux/page_frag_cache.h:36:21: warning: 'static' function 'encoded_page_decode_page' declared in header file should be declared 'static inline' [-Wunneeded-internal-declaration]
      36 | static struct page *encoded_page_decode_page(unsigned long encoded_page)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
--
   In file included from kernel/bpf/ringbuf.c:1:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   kernel/bpf/ringbuf.c:526:38: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     526 |         .arg1_type      = ARG_PTR_TO_RINGBUF_MEM | OBJ_RELEASE,
         |                           ~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   kernel/bpf/ringbuf.c:539:38: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     539 |         .arg1_type      = ARG_PTR_TO_RINGBUF_MEM | OBJ_RELEASE,
         |                           ~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   kernel/bpf/ringbuf.c:566:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     566 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/ringbuf.c:635:33: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     635 |         .arg4_type      = ARG_PTR_TO_DYNPTR | DYNPTR_TYPE_RINGBUF | MEM_UNINIT | MEM_WRITE,
         |                           ~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   kernel/bpf/ringbuf.c:653:33: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     653 |         .arg1_type      = ARG_PTR_TO_DYNPTR | DYNPTR_TYPE_RINGBUF | OBJ_RELEASE,
         |                           ~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   kernel/bpf/ringbuf.c:672:33: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     672 |         .arg1_type      = ARG_PTR_TO_DYNPTR | DYNPTR_TYPE_RINGBUF | OBJ_RELEASE,
         |                           ~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   In file included from kernel/bpf/ringbuf.c:6:
   In file included from include/linux/filter.h:12:
   In file included from include/linux/skbuff.h:34:
>> include/linux/page_frag_cache.h:36:21: warning: 'static' function 'encoded_page_decode_page' declared in header file should be declared 'static inline' [-Wunneeded-internal-declaration]
      36 | static struct page *encoded_page_decode_page(unsigned long encoded_page)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   8 warnings generated.
--
   In file included from kernel/bpf/map_iter.c:3:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   kernel/bpf/map_iter.c:95:27: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
      95 |                   PTR_TO_BTF_ID_OR_NULL | PTR_TRUSTED },
         |                   ~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   kernel/bpf/map_iter.c:176:16: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     176 |                   PTR_TO_BUF | PTR_MAYBE_NULL | MEM_RDONLY },
         |                   ~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/bpf/map_iter.c:178:16: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     178 |                   PTR_TO_BUF | PTR_MAYBE_NULL },
         |                   ~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   In file included from kernel/bpf/map_iter.c:5:
   In file included from include/linux/filter.h:12:
   In file included from include/linux/skbuff.h:34:
>> include/linux/page_frag_cache.h:36:21: warning: 'static' function 'encoded_page_decode_page' declared in header file should be declared 'static inline' [-Wunneeded-internal-declaration]
      36 | static struct page *encoded_page_decode_page(unsigned long encoded_page)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings generated.
--
   In file included from kernel/bpf/btf.c:6:
   In file included from include/uapi/linux/bpf_perf_event.h:11:
   In file included from ./arch/hexagon/include/generated/uapi/asm/bpf_perf_event.h:1:
   In file included from include/uapi/asm-generic/bpf_perf_event.h:4:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   kernel/bpf/btf.c:7525:46: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    7525 |                         sub->args[i].arg_type = ARG_PTR_TO_DYNPTR | MEM_RDONLY;
         |                                                 ~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/btf.c:7540:46: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    7540 |                         sub->args[i].arg_type = ARG_PTR_TO_BTF_ID | PTR_TRUSTED;
         |                                                 ~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   kernel/bpf/btf.c:7571:43: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    7571 |                         sub->args[i].arg_type = ARG_PTR_TO_MEM | PTR_MAYBE_NULL;
         |                                                 ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/bpf/btf.c:8107:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    8107 |         .arg1_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   In file included from kernel/bpf/btf.c:19:
   In file included from include/linux/bpf_verifier.h:9:
   In file included from include/linux/filter.h:12:
   In file included from include/linux/skbuff.h:34:
>> include/linux/page_frag_cache.h:36:21: warning: 'static' function 'encoded_page_decode_page' declared in header file should be declared 'static inline' [-Wunneeded-internal-declaration]
      36 | static struct page *encoded_page_decode_page(unsigned long encoded_page)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   6 warnings generated.
--
   In file included from kernel/bpf/syscall.c:4:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   kernel/bpf/syscall.c:5986:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    5986 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/syscall.c:6036:41: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6036 |         .arg4_type      = ARG_PTR_TO_FIXED_SIZE_MEM | MEM_UNINIT | MEM_WRITE | MEM_ALIGNED,
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   In file included from kernel/bpf/syscall.c:5:
   In file included from include/linux/bpf-cgroup.h:11:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:34:
>> include/linux/page_frag_cache.h:36:21: warning: 'static' function 'encoded_page_decode_page' declared in header file should be declared 'static inline' [-Wunneeded-internal-declaration]
      36 | static struct page *encoded_page_decode_page(unsigned long encoded_page)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.
--
          |                                                  ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:12412:25: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12412 |                                    (dynptr_arg_type & MEM_UNINIT)) {
          |                                     ~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:12432:26: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12432 |                         if (!(dynptr_arg_type & MEM_UNINIT)) {
          |                               ~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:12459:36: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12459 |                             reg->type != (PTR_TO_BTF_ID | MEM_ALLOC)) {
          |                                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:12463:36: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12463 |                         if (reg->type == (PTR_TO_BTF_ID | MEM_ALLOC) && !reg->ref_obj_id) {
          |                                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:12473:36: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12473 |                             reg->type != (PTR_TO_BTF_ID | MEM_ALLOC)) {
          |                                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:12477:36: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12477 |                         if (reg->type == (PTR_TO_BTF_ID | MEM_ALLOC) && !reg->ref_obj_id) {
          |                                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:12486:36: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12486 |                         if (reg->type != (PTR_TO_BTF_ID | MEM_ALLOC)) {
          |                                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:12509:37: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12509 |                                 if (reg->type != (PTR_TO_BTF_ID | MEM_ALLOC)) {
          |                                                   ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:12784:19: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12784 |                                 if (reg->type & MEM_RCU) {
          |                                     ~~~~~~~~~ ^ ~~~~~~~
   include/linux/bpf_verifier.h:479:12: note: expanded from macro 'bpf_for_each_reg_in_vstate_mask'
     479 |                                 (void)(__expr);                          \
         |                                        ^~~~~~
   kernel/bpf/verifier.c:12784:19: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12784 |                                 if (reg->type & MEM_RCU) {
          |                                     ~~~~~~~~~ ^ ~~~~~~~
   include/linux/bpf_verifier.h:484:12: note: expanded from macro 'bpf_for_each_reg_in_vstate_mask'
     484 |                                 (void)(__expr);                          \
         |                                        ^~~~~~
   kernel/bpf/verifier.c:12964:42: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12964 |                                 regs[BPF_REG_0].type = PTR_TO_BTF_ID | MEM_ALLOC;
          |                                                        ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:12974:42: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12974 |                                 regs[BPF_REG_0].type = PTR_TO_BTF_ID | MEM_ALLOC;
          |                                                        ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:12993:42: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12993 |                                 regs[BPF_REG_0].type = PTR_TO_BTF_ID | PTR_TRUSTED;
          |                                                        ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   kernel/bpf/verifier.c:13005:42: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    13005 |                                 regs[BPF_REG_0].type = PTR_TO_BTF_ID | PTR_UNTRUSTED;
          |                                                        ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   kernel/bpf/verifier.c:13022:39: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    13022 |                                 regs[BPF_REG_0].type = PTR_TO_MEM | type_flag;
          |                                                        ~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:13096:24: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    13096 |                                 if (cur_iter->type & MEM_RCU) /* KF_RCU_PROTECTED */
          |                                     ~~~~~~~~~~~~~~ ^ ~~~~~~~
   kernel/bpf/verifier.c:13558:20: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    13558 |         if (ptr_reg->type & PTR_MAYBE_NULL) {
          |             ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:18535:31: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    18535 |                         *prev_type = PTR_TO_BTF_ID | PTR_UNTRUSTED;
          |                                      ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   kernel/bpf/verifier.c:18984:38: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    18984 |                 aux->btf_var.reg_type = PTR_TO_MEM | MEM_RDONLY;
          |                                         ~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:19003:41: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    19003 |                 aux->btf_var.reg_type = PTR_TO_BTF_ID | MEM_PERCPU;
          |                                         ~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:19020:38: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    19020 |                 aux->btf_var.reg_type = PTR_TO_MEM | MEM_RDONLY;
          |                                         ~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:20070:22: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    20070 |                 case PTR_TO_BTF_ID | PTR_UNTRUSTED:
          |                      ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   kernel/bpf/verifier.c:20077:22: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    20077 |                 case PTR_TO_BTF_ID | MEM_ALLOC | PTR_UNTRUSTED:
          |                      ~~~~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:20078:22: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    20078 |                 case PTR_TO_BTF_ID | PTR_TRUSTED | PTR_MAYBE_NULL:
          |                      ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   kernel/bpf/verifier.c:21809:51: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    21809 |                         } else if (arg->arg_type == (ARG_PTR_TO_DYNPTR | MEM_RDONLY)) {
          |                                                      ~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:21814:23: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    21814 |                                 if (arg->arg_type & PTR_MAYBE_NULL)
          |                                     ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:21821:23: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    21821 |                                 if (arg->arg_type & PTR_MAYBE_NULL)
          |                                     ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:21823:23: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    21823 |                                 if (arg->arg_type & PTR_UNTRUSTED)
          |                                     ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   kernel/bpf/verifier.c:21825:23: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    21825 |                                 if (arg->arg_type & PTR_TRUSTED)
          |                                     ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   In file included from kernel/bpf/verifier.c:7:
   In file included from include/linux/bpf-cgroup.h:11:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:34:
>> include/linux/page_frag_cache.h:36:21: warning: 'static' function 'encoded_page_decode_page' declared in header file should be declared 'static inline' [-Wunneeded-internal-declaration]
      36 | static struct page *encoded_page_decode_page(unsigned long encoded_page)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   110 warnings generated.
--
   In file included from kernel/bpf/task_iter.c:6:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   kernel/bpf/task_iter.c:698:27: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     698 |                   PTR_TO_BTF_ID_OR_NULL | PTR_TRUSTED },
         |                   ~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   In file included from kernel/bpf/task_iter.c:8:
   In file included from include/linux/filter.h:12:
   In file included from include/linux/skbuff.h:34:
>> include/linux/page_frag_cache.h:36:21: warning: 'static' function 'encoded_page_decode_page' declared in header file should be declared 'static inline' [-Wunneeded-internal-declaration]
      36 | static struct page *encoded_page_decode_page(unsigned long encoded_page)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.
--
   In file included from kernel/bpf/helpers.c:4:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   kernel/bpf/helpers.c:114:36: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     114 |         .arg2_type      = ARG_PTR_TO_MAP_VALUE | MEM_UNINIT | MEM_WRITE,
         |                           ~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/helpers.c:127:36: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     127 |         .arg2_type      = ARG_PTR_TO_MAP_VALUE | MEM_UNINIT | MEM_WRITE,
         |                           ~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/helpers.c:538:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     538 |         .arg1_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/helpers.c:541:41: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     541 |         .arg4_type      = ARG_PTR_TO_FIXED_SIZE_MEM | MEM_UNINIT | MEM_WRITE | MEM_ALIGNED,
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/helpers.c:566:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     566 |         .arg1_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/helpers.c:569:41: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     569 |         .arg4_type      = ARG_PTR_TO_FIXED_SIZE_MEM | MEM_UNINIT | MEM_WRITE | MEM_ALIGNED,
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/helpers.c:582:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     582 |         .arg1_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/helpers.c:652:35: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     652 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/helpers.c:724:39: warning: bitwise operation between different enumeration types ('enum bpf_return_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     724 |         .ret_type       = RET_PTR_TO_MEM_OR_BTF_ID | PTR_MAYBE_NULL | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:737:39: warning: bitwise operation between different enumeration types ('enum bpf_return_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     737 |         .ret_type       = RET_PTR_TO_MEM_OR_BTF_ID | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/helpers.c:1079:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1079 |         .arg4_type      = ARG_PTR_TO_MEM | PTR_MAYBE_NULL | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:1640:44: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1640 |         .arg2_type    = ARG_PTR_TO_BTF_ID_OR_NULL | OBJ_RELEASE,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   kernel/bpf/helpers.c:1745:33: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1745 |         .arg4_type      = ARG_PTR_TO_DYNPTR | DYNPTR_TYPE_LOCAL | MEM_UNINIT | MEM_WRITE,
         |                           ~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:1788:33: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1788 |         .arg3_type      = ARG_PTR_TO_DYNPTR | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/helpers.c:1836:33: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1836 |         .arg1_type      = ARG_PTR_TO_DYNPTR | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/helpers.c:1838:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1838 |         .arg3_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/helpers.c:1878:33: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1878 |         .arg1_type      = ARG_PTR_TO_DYNPTR | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   In file included from kernel/bpf/helpers.c:6:
   In file included from include/linux/bpf-cgroup.h:11:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:34:
>> include/linux/page_frag_cache.h:36:21: warning: 'static' function 'encoded_page_decode_page' declared in header file should be declared 'static inline' [-Wunneeded-internal-declaration]
      36 | static struct page *encoded_page_decode_page(unsigned long encoded_page)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   19 warnings generated.
..


vim +36 include/linux/page_frag_cache.h

    35	
  > 36	static struct page *encoded_page_decode_page(unsigned long encoded_page)
    37	{
    38	        return virt_to_page((void *)encoded_page);
    39	}
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
