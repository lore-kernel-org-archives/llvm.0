Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5831DD0F9;
	Thu, 24 Oct 2024 16:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729787771; cv=none; b=B+sFphR7wTCLPmCNZwBvdkM5N1oqO4hfrf7MZGTrKNO/dJgO3fXVWRT4MvUcDf6coyKF7NmcgP/zLqCa2vG6zICfMwRE+mlu474ndpUrJolcHu1OFXC80mxh8/+oaaYguBWOVZN/+LRicoGrHfzjZOKn5Gy0YF77XkcGlJhdhwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729787771; c=relaxed/simple;
	bh=WA5BzBjNA7rvmg6m5esUu5q1i0G5D/NnLq7wBt23YUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ox9e0s7j4euLaKVXI6gvegX5aNuxxq8Le9NO/VDZECTkSARcF9Hs0zQZoZACayPow3EDQxpN74hGuTQqiiYoUtsQYOJyVX8+kZZw2II1vLmjZEnk943a6upehj3IJpmfU4LA13QB2BcT0IRLHnEzjOKMn9YfB6zPns07/SJYchw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U7dOw77k; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U7dOw77k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729787768; x=1761323768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WA5BzBjNA7rvmg6m5esUu5q1i0G5D/NnLq7wBt23YUo=;
  b=U7dOw77kS4vciRsUHuvsO5HqqXzW6dnKmo/j/NkQuFqAzLtBWOYNQE7e
   yJAQh7tC3wjAxpaYyZb9VrJYwqsCBiZRU/tykFVasag7wCdynQ5ZNzulC
   2khzWMagqhJbcgydxK+EiSIn6jaYVWfqo6Y7vS4k0PDxywJOd8/ikPUcp
   yWbTeuPQ9jQUFS/Gep6S1uBDz/ihH+s4y7DWCW0CdaWuzXMVxTCJomZ8G
   QamuoFU80QIHQMeR0ALWGwh6Zl+IT5YX4SM2se5KfoGqNfklPDILBMzW4
   Hassg1OkPDUgT9zxNFv73telcMIjJ4V1ILt2BM3cI7OpSrAv0S//klV54
   g==;
X-CSE-ConnectionGUID: /oLhc/NhRpKeAUy/RlfDng==
X-CSE-MsgGUID: xrHgw8fXT5iCdpZ7tBFibw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29294489"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29294489"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 09:36:07 -0700
X-CSE-ConnectionGUID: jS1LUx7oSuSo95umjY331w==
X-CSE-MsgGUID: V/juis7WTleZznb0q/2Owg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="80948644"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Oct 2024 09:36:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t40od-000WiC-1v;
	Thu, 24 Oct 2024 16:36:03 +0000
Date: Fri, 25 Oct 2024 00:35:03 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] net: netlink: add nla_get_*_default() accessors
Message-ID: <202410250052.PY6qSKo7-lkp@intel.com>
References: <20241024131807.0a6c07355832.I3df6aac71d38a5baa1c0a03d0c7e82d4395c030e@changeid>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024131807.0a6c07355832.I3df6aac71d38a5baa1c0a03d0c7e82d4395c030e@changeid>

Hi Johannes,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main netfilter-nf/main linus/master horms-ipvs/master nf-next/master v6.12-rc4 next-20241024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/net-convert-to-nla_get_-_default/20241024-191943
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20241024131807.0a6c07355832.I3df6aac71d38a5baa1c0a03d0c7e82d4395c030e%40changeid
patch subject: [RFC PATCH 1/2] net: netlink: add nla_get_*_default() accessors
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241025/202410250052.PY6qSKo7-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410250052.PY6qSKo7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410250052.PY6qSKo7-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/nfs/blocklayout/blocklayout.c:37:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/nfs/blocklayout/blocklayout.c:41:
   In file included from fs/nfs/blocklayout/../pnfs.h:34:
   In file included from include/linux/nfs_fs.h:32:
   In file included from include/linux/sunrpc/clnt.h:29:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:102:
   In file included from include/linux/tcp.h:19:
   In file included from include/net/sock.h:66:
   In file included from include/net/dst.h:20:
   In file included from include/net/neighbour.h:31:
   In file included from include/net/rtnetlink.h:6:
>> include/net/netlink.h:1881:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1881 | MAKE_NLA_GET_DEFAULT(u8, nla_get_u8);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1882:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1882 | MAKE_NLA_GET_DEFAULT(u16, nla_get_u16);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1883:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1883 | MAKE_NLA_GET_DEFAULT(u32, nla_get_u32);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1884:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1884 | MAKE_NLA_GET_DEFAULT(u64, nla_get_u64);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1885:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1885 | MAKE_NLA_GET_DEFAULT(unsigned long, nla_get_msecs);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1886:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1886 | MAKE_NLA_GET_DEFAULT(s8, nla_get_s8);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1887:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1887 | MAKE_NLA_GET_DEFAULT(s16, nla_get_s16);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1888:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1888 | MAKE_NLA_GET_DEFAULT(s32, nla_get_s32);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1889:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1889 | MAKE_NLA_GET_DEFAULT(s64, nla_get_s64);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1890:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1890 | MAKE_NLA_GET_DEFAULT(s16, nla_get_le16);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1891:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1891 | MAKE_NLA_GET_DEFAULT(s32, nla_get_le32);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1892:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1892 | MAKE_NLA_GET_DEFAULT(s64, nla_get_le64);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1893:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1893 | MAKE_NLA_GET_DEFAULT(s16, nla_get_be16);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1894:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1894 | MAKE_NLA_GET_DEFAULT(s32, nla_get_be32);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1895:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1895 | MAKE_NLA_GET_DEFAULT(s64, nla_get_be64);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   fs/nfs/blocklayout/blocklayout.c:384:9: warning: variable 'count' set but not used [-Wunused-but-set-variable]
     384 |         size_t count = header->args.count;
         |                ^
   5 warnings and 15 errors generated.
--
   In file included from fs/nfs/blocklayout/dev.c:5:
   In file included from include/linux/sunrpc/svc.h:17:
   In file included from include/linux/sunrpc/xdr.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/nfs/blocklayout/dev.c:5:
   In file included from include/linux/sunrpc/svc.h:19:
   In file included from include/linux/sunrpc/svcauth.h:17:
   In file included from include/linux/sunrpc/clnt.h:29:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:102:
   In file included from include/linux/tcp.h:19:
   In file included from include/net/sock.h:66:
   In file included from include/net/dst.h:20:
   In file included from include/net/neighbour.h:31:
   In file included from include/net/rtnetlink.h:6:
>> include/net/netlink.h:1881:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1881 | MAKE_NLA_GET_DEFAULT(u8, nla_get_u8);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1882:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1882 | MAKE_NLA_GET_DEFAULT(u16, nla_get_u16);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1883:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1883 | MAKE_NLA_GET_DEFAULT(u32, nla_get_u32);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1884:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1884 | MAKE_NLA_GET_DEFAULT(u64, nla_get_u64);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1885:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1885 | MAKE_NLA_GET_DEFAULT(unsigned long, nla_get_msecs);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1886:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1886 | MAKE_NLA_GET_DEFAULT(s8, nla_get_s8);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1887:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1887 | MAKE_NLA_GET_DEFAULT(s16, nla_get_s16);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1888:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1888 | MAKE_NLA_GET_DEFAULT(s32, nla_get_s32);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1889:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1889 | MAKE_NLA_GET_DEFAULT(s64, nla_get_s64);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1890:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1890 | MAKE_NLA_GET_DEFAULT(s16, nla_get_le16);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1891:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1891 | MAKE_NLA_GET_DEFAULT(s32, nla_get_le32);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1892:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1892 | MAKE_NLA_GET_DEFAULT(s64, nla_get_le64);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1893:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1893 | MAKE_NLA_GET_DEFAULT(s16, nla_get_be16);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1894:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1894 | MAKE_NLA_GET_DEFAULT(s32, nla_get_be32);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1895:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1895 | MAKE_NLA_GET_DEFAULT(s64, nla_get_be64);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   4 warnings and 15 errors generated.
--
   In file included from drivers/net/ethernet/intel/e1000e/netdev.c:9:
   In file included from include/linux/pci.h:1650:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/intel/e1000e/netdev.c:15:
   In file included from include/linux/tcp.h:19:
   In file included from include/net/sock.h:66:
   In file included from include/net/dst.h:20:
   In file included from include/net/neighbour.h:31:
   In file included from include/net/rtnetlink.h:6:
>> include/net/netlink.h:1881:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1881 | MAKE_NLA_GET_DEFAULT(u8, nla_get_u8);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1882:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1882 | MAKE_NLA_GET_DEFAULT(u16, nla_get_u16);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1883:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1883 | MAKE_NLA_GET_DEFAULT(u32, nla_get_u32);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1884:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1884 | MAKE_NLA_GET_DEFAULT(u64, nla_get_u64);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1885:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1885 | MAKE_NLA_GET_DEFAULT(unsigned long, nla_get_msecs);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1886:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1886 | MAKE_NLA_GET_DEFAULT(s8, nla_get_s8);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1887:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1887 | MAKE_NLA_GET_DEFAULT(s16, nla_get_s16);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1888:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1888 | MAKE_NLA_GET_DEFAULT(s32, nla_get_s32);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1889:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1889 | MAKE_NLA_GET_DEFAULT(s64, nla_get_s64);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1890:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1890 | MAKE_NLA_GET_DEFAULT(s16, nla_get_le16);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1891:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1891 | MAKE_NLA_GET_DEFAULT(s32, nla_get_le32);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1892:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1892 | MAKE_NLA_GET_DEFAULT(s64, nla_get_le64);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1893:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1893 | MAKE_NLA_GET_DEFAULT(s16, nla_get_be16);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1894:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1894 | MAKE_NLA_GET_DEFAULT(s32, nla_get_be32);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1895:1: error: call to undeclared function 'n'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1895 | MAKE_NLA_GET_DEFAULT(s64, nla_get_be64);
         | ^
   include/net/netlink.h:1878:9: note: expanded from macro 'MAKE_NLA_GET_DEFAULT'
    1878 |         return n(nla);                                  \
         |                ^
>> drivers/net/ethernet/intel/e1000e/netdev.c:4460:22: warning: shift count >= width of type [-Wshift-count-overflow]
    4460 |                 adapter->cc.mask = CYCLECOUNTER_MASK(64);
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   include/linux/timecounter.h:14:59: note: expanded from macro 'CYCLECOUNTER_MASK'
      14 | #define CYCLECOUNTER_MASK(bits) (u64)((bits) < 64 ? ((1ULL<<(bits))-1) : -1)
         |                                                           ^ ~~~~~~
   drivers/net/ethernet/intel/e1000e/netdev.c:7386:46: warning: shift count >= width of type [-Wshift-count-overflow]
    7386 |         err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
         |                                                     ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   6 warnings and 15 errors generated.
..


vim +/n +1881 include/net/netlink.h

  1880	
> 1881	MAKE_NLA_GET_DEFAULT(u8, nla_get_u8);
  1882	MAKE_NLA_GET_DEFAULT(u16, nla_get_u16);
  1883	MAKE_NLA_GET_DEFAULT(u32, nla_get_u32);
  1884	MAKE_NLA_GET_DEFAULT(u64, nla_get_u64);
  1885	MAKE_NLA_GET_DEFAULT(unsigned long, nla_get_msecs);
  1886	MAKE_NLA_GET_DEFAULT(s8, nla_get_s8);
  1887	MAKE_NLA_GET_DEFAULT(s16, nla_get_s16);
  1888	MAKE_NLA_GET_DEFAULT(s32, nla_get_s32);
  1889	MAKE_NLA_GET_DEFAULT(s64, nla_get_s64);
  1890	MAKE_NLA_GET_DEFAULT(s16, nla_get_le16);
  1891	MAKE_NLA_GET_DEFAULT(s32, nla_get_le32);
  1892	MAKE_NLA_GET_DEFAULT(s64, nla_get_le64);
  1893	MAKE_NLA_GET_DEFAULT(s16, nla_get_be16);
  1894	MAKE_NLA_GET_DEFAULT(s32, nla_get_be32);
  1895	MAKE_NLA_GET_DEFAULT(s64, nla_get_be64);
  1896	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
