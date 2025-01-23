Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15D74C6D;
	Thu, 23 Jan 2025 00:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737592686; cv=none; b=a44C0HAJjAhtfc/OdfomY52CRTCXBnrWX7Sk5lQdQvLE6NjNYcsjZb2opYtyAp81tzhlb+csm9Tyr90gVrbYBSiyTMmnDjBh6yFPRLSYy5jP7/GjlmRsHIMJ3Cp6kFKB5oINpj8c+bDDZfqw2DAuK6QVZ7XgWjs8mMQUpsLtQDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737592686; c=relaxed/simple;
	bh=IlcjQdetLDJBJIu6k/SEO/LJU5koZErlJ02WyyNhfKI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AuGFFpmYumbXa7VXQ6Ovg7nuDSCFbOpuz1L4L2M0cym3XuYO7pglZr2jhq1ZO0dIYRN6g4gLk+oF/XJ1amyUXb/Jf2wdwl4IzJ3VeDipOvFoBqmtqe0HKddKWnPcQWi6y1AHhr78f0ZYrz0PK+bNUknaGJmAAUn6IkcftXDjg+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HROcbKna; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HROcbKna"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737592685; x=1769128685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IlcjQdetLDJBJIu6k/SEO/LJU5koZErlJ02WyyNhfKI=;
  b=HROcbKna4fhNXA3CwjZBW3QqBpPCNEyXGF2eIDwvB73nOjGbxucgOYP4
   YGZY417Enwncp9Mqlmg8d95Q0CvzEO/P9aAPZ3RW0QFrhRfoRlBCwbocb
   +tmg45uCLeXWdFslzTqaIFPybvvo7FReHdbYR95LgaKM7h3fxE+XWmgC3
   JqDNHSL8APJF1Zeur06L4VeEvJGZqnr2UQaeqrYA3Wpy8dPd8XsvlMaUu
   CKYuC2nCbAM0lfy1JP6aUn+ZLQu9b/634BdT18xXjqywQmB7W2RPZIqz0
   p533KyoM9t38k4LMX4gZFl2iOqhepMji81VlsCQk3wAChj6YSV0O4QR2C
   Q==;
X-CSE-ConnectionGUID: zDj52Ra5QYGwJC9EfpjS/A==
X-CSE-MsgGUID: o5nZqgKuQcGuXg3+V7OUSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="49066545"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; 
   d="scan'208";a="49066545"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 16:38:05 -0800
X-CSE-ConnectionGUID: Ze9d+ba4RiiopflgkZzbhg==
X-CSE-MsgGUID: 27kQVz3vR1ShplkT2tXg8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; 
   d="scan'208";a="107115492"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Jan 2025 16:38:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1talEO-000aTh-3C;
	Thu, 23 Jan 2025 00:38:00 +0000
Date: Thu, 23 Jan 2025 08:37:10 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: net/6lowpan/nhc_udp.o: warning: objtool: .discard.annotate_insn:
 dodgy linker, sh_entsize != 8
Message-ID: <202501230818.n7HgoHnK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7004a2e46d1693848370809aa3d9c340a209edbb
commit: 317f2a64618c528539d17fe6957a64106087fbd2 objtool: Convert instrumentation_{begin,end}() to ANNOTATE
date:   7 weeks ago
config: x86_64-randconfig-074-20250122 (https://download.01.org/0day-ci/archive/20250123/202501230818.n7HgoHnK-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501230818.n7HgoHnK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501230818.n7HgoHnK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/6lowpan/nhc_udp.c:13:
   In file included from net/6lowpan/nhc.h:5:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
>> net/6lowpan/nhc_udp.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
   In file included from net/ipv4/ip_tunnel.c:14:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
>> net/ipv4/ip_tunnel.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
   In file included from net/ipv4/tcp_westwood.c:25:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
>> net/ipv4/tcp_westwood.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
   In file included from net/ipv6/ip6_udp_tunnel.c:6:
   In file included from include/linux/udp.h:16:
   In file included from include/net/inet_sock.h:19:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
>> net/ipv6/ip6_udp_tunnel.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
   In file included from drivers/acpi/acpi_pad.c:20:
   In file included from include/linux/perf_event.h:18:
   In file included from include/uapi/linux/bpf_perf_event.h:11:
   In file included from ./arch/x86/include/generated/uapi/asm/bpf_perf_event.h:1:
   In file included from include/uapi/asm-generic/bpf_perf_event.h:4:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
>> drivers/acpi/acpi_pad.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
>> drivers/ntb/ntb.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
>> drivers/vdpa/ifcvf/ifcvf.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
   In file included from drivers/xen/pvcalls-front.c:7:
   In file included from include/linux/net.h:24:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
>> drivers/xen/pvcalls-front.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
