Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0292B23BF;
	Mon,  4 Mar 2024 03:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709521807; cv=none; b=GKDmIdjf2zGjx8zZeO+9Tb5PBz047SXYTpntvIfQ0wm7VT8VaaxghpNd2aT+38JFhxyIrgpL1bPkFR9Lw0czaaWJBRo2dt1wAq+nhPxyNelgaE67A/9SqG3QWUoGIiZoJyAjHfPVzOhUZWpNtG4VoaWqzcgRoCkp1BJSu6ZLQkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709521807; c=relaxed/simple;
	bh=wVuCYpDAsGh1mDkU3pHFAt+TqMwi/alzNvRAJrg0+c4=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q2qo2tXaOboQdmVAg4uwINx5Rv79irg4PBBlnxuy/Z3VgAuirPBYkdgBRtDDeEn4PU1urYqEpW0i+5OE5/rf6Ikon2mkPrXGawV36Prv3dYhatdZnQPZeMdUktGZcHXYfm0BB7WRXZDBpr3ggUgf5pf0bYYrnqkVSRcwDChtzR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eEFFY8cE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eEFFY8cE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709521805; x=1741057805;
  h=date:from:cc:subject:message-id:mime-version;
  bh=wVuCYpDAsGh1mDkU3pHFAt+TqMwi/alzNvRAJrg0+c4=;
  b=eEFFY8cEJB7Hiz28eUv1WkxBQd0gedMZYpXcU62EAiJUH0/v9cZQXEuu
   LpWIdpEN0WqMPyUfWTcvD2CewPnKYICnQUG/rILAHXQKc43wXUYG13L5t
   ynzQxBf8uB+QGJAMaMFZ7KlbyeeJAWqj+l6XD5Vg99eDeE6kKxWv9/uWs
   O27ulNNxemb6TYeeVdNVu1tEH4hFz3IBpHUTDI/CKggdOJh6GRnIONqE6
   1UOPEHzLYHnMwbFTmHObjTUOggNsJzkGo2NyoSu7NUNeJfwy6fxOU1Scz
   Z5FSHoSJLCsXSvfbCp5Kuz6bVyFTJt/1gVwsvMV1LsxLpBdyRJgjcONzn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4574080"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="4574080"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 19:10:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="13500761"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Mar 2024 19:10:02 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgyiG-0002Ip-0F;
	Mon, 04 Mar 2024 03:10:00 +0000
Date: Mon, 4 Mar 2024 11:09:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: kernel/bpf/log.c:425:11: warning: bitwise operation between
 different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag')
Message-ID: <202403041127.Bhwvvo7z-lkp@intel.com>
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
head:   90d35da658da8cff0d4ecbb5113f5fac9d00eb72
commit: 42feb6620accded89cad5f455665e21281813d79 bpf: move verifier state printing code to kernel/bpf/log.c
date:   4 months ago
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240304/202403041127.Bhwvvo7z-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403041127.Bhwvvo7z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403041127.Bhwvvo7z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/bpf/log.c:9:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2177:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from kernel/bpf/log.c:9:
   include/linux/bpf.h:726:48: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     726 |         ARG_PTR_TO_MAP_VALUE_OR_NULL    = PTR_MAYBE_NULL | ARG_PTR_TO_MAP_VALUE,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:727:43: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     727 |         ARG_PTR_TO_MEM_OR_NULL          = PTR_MAYBE_NULL | ARG_PTR_TO_MEM,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   include/linux/bpf.h:728:43: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     728 |         ARG_PTR_TO_CTX_OR_NULL          = PTR_MAYBE_NULL | ARG_PTR_TO_CTX,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   include/linux/bpf.h:729:45: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     729 |         ARG_PTR_TO_SOCKET_OR_NULL       = PTR_MAYBE_NULL | ARG_PTR_TO_SOCKET,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:730:44: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     730 |         ARG_PTR_TO_STACK_OR_NULL        = PTR_MAYBE_NULL | ARG_PTR_TO_STACK,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~
   include/linux/bpf.h:731:45: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     731 |         ARG_PTR_TO_BTF_ID_OR_NULL       = PTR_MAYBE_NULL | ARG_PTR_TO_BTF_ID,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:735:38: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     735 |         ARG_PTR_TO_UNINIT_MEM           = MEM_UNINIT | ARG_PTR_TO_MEM,
         |                                           ~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   include/linux/bpf.h:737:45: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     737 |         ARG_PTR_TO_FIXED_SIZE_MEM       = MEM_FIXED_SIZE | ARG_PTR_TO_MEM,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   include/linux/bpf.h:760:48: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     760 |         RET_PTR_TO_MAP_VALUE_OR_NULL    = PTR_MAYBE_NULL | RET_PTR_TO_MAP_VALUE,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:761:45: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     761 |         RET_PTR_TO_SOCKET_OR_NULL       = PTR_MAYBE_NULL | RET_PTR_TO_SOCKET,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:762:47: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     762 |         RET_PTR_TO_TCP_SOCK_OR_NULL     = PTR_MAYBE_NULL | RET_PTR_TO_TCP_SOCK,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:763:50: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     763 |         RET_PTR_TO_SOCK_COMMON_OR_NULL  = PTR_MAYBE_NULL | RET_PTR_TO_SOCK_COMMON,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:765:49: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     765 |         RET_PTR_TO_DYNPTR_MEM_OR_NULL   = PTR_MAYBE_NULL | RET_PTR_TO_MEM,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   include/linux/bpf.h:766:45: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     766 |         RET_PTR_TO_BTF_ID_OR_NULL       = PTR_MAYBE_NULL | RET_PTR_TO_BTF_ID,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:767:43: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     767 |         RET_PTR_TO_BTF_ID_TRUSTED       = PTR_TRUSTED    | RET_PTR_TO_BTF_ID,
         |                                           ~~~~~~~~~~~    ^ ~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:878:44: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum-enum-conversion]
     878 |         PTR_TO_MAP_VALUE_OR_NULL        = PTR_MAYBE_NULL | PTR_TO_MAP_VALUE,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~
   include/linux/bpf.h:879:42: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum-enum-conversion]
     879 |         PTR_TO_SOCKET_OR_NULL           = PTR_MAYBE_NULL | PTR_TO_SOCKET,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   include/linux/bpf.h:880:46: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum-enum-conversion]
     880 |         PTR_TO_SOCK_COMMON_OR_NULL      = PTR_MAYBE_NULL | PTR_TO_SOCK_COMMON,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:881:44: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum-enum-conversion]
     881 |         PTR_TO_TCP_SOCK_OR_NULL         = PTR_MAYBE_NULL | PTR_TO_TCP_SOCK,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~
   include/linux/bpf.h:882:42: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum-enum-conversion]
     882 |         PTR_TO_BTF_ID_OR_NULL           = PTR_MAYBE_NULL | PTR_TO_BTF_ID,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
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
   29 warnings generated.


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
