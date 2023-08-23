Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2331C2E6;
	Wed, 23 Aug 2023 20:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692821385; x=1724357385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AvUeRca67cv5xiR1xSt7IP4lbB1HUdJhCrmEBsWjAtM=;
  b=jSN8OG1cjnF3yHk5zlfrIqVWO5mErIR/LsVPmxXY9abWHNZmfXRD8GTt
   amwG2vPX3UzmNU9tCsTrh2b1wAwo4lFQlkmjZH9KnY70PXinMh5VVVPVz
   gw4T6d1na6fmOwn6Uda5cNrRQFuw4j4s4z2MvsXufFbxsiXyZPxuTFgkf
   rpQcKXRxfeHRbRNe1+wVYC9hXDnufd7wfSfcg7AIHK6GLQTN6E8BK+mwf
   ySq9PLmwrjXpj65nRQIc1MxnCCQ3XUFNnqkE8qZawwLMu2hP66znByPoA
   qvtPTQ0mMPyVyjUOEkOPVsnY/7VIuOES8dTDaQsowMWwcCRy9IYC3+Gge
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="460621930"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="460621930"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 13:09:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="826851453"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="826851453"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Aug 2023 13:09:43 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYuAg-0001TG-2P;
	Wed, 23 Aug 2023 20:09:42 +0000
Date: Thu, 24 Aug 2023 04:09:04 +0800
From: kernel test robot <lkp@intel.com>
To: Geliang Tang <geliang.tang@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC mptcp-next v2 2/2] mptcp: add bpf_burst set/get params
Message-ID: <202308240315.MEo2AODX-lkp@intel.com>
References: <486891cb494ba4e9eeb02b6e220ca670dbc80866.1692788531.git.geliang.tang@suse.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <486891cb494ba4e9eeb02b6e220ca670dbc80866.1692788531.git.geliang.tang@suse.com>

Hi Geliang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on mptcp/export]
[cannot apply to mptcp/export-net linus/master v6.5-rc7 next-20230823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Geliang-Tang/mptcp-add-set-get-params-wrappers/20230823-190626
base:   https://github.com/multipath-tcp/mptcp_net-next.git export
patch link:    https://lore.kernel.org/r/486891cb494ba4e9eeb02b6e220ca670dbc80866.1692788531.git.geliang.tang%40suse.com
patch subject: [RFC mptcp-next v2 2/2] mptcp: add bpf_burst set/get params
config: um-randconfig-r014-20230823 (https://download.01.org/0day-ci/archive/20230824/202308240315.MEo2AODX-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240315.MEo2AODX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240315.MEo2AODX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/mptcp/sched.c:14:
   In file included from include/net/bpf_sk_storage.h:11:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from net/mptcp/sched.c:14:
   In file included from include/net/bpf_sk_storage.h:11:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from net/mptcp/sched.c:14:
   In file included from include/net/bpf_sk_storage.h:11:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from net/mptcp/sched.c:14:
   include/net/bpf_sk_storage.h:64:1: warning: no previous prototype for function 'bpf_sk_storage_lookup' [-Wmissing-prototypes]
      64 | bpf_sk_storage_lookup(struct sock *sk, struct bpf_map *map, bool cacheit_lockit)
         | ^
   include/net/bpf_sk_storage.h:63:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      63 | struct bpf_local_storage_data *
         | ^
         | static 
>> net/mptcp/sched.c:211:10: error: no member named 'sk_bpf_storage' in 'struct sock'
     211 |         if (sk->sk_bpf_storage && sk->sk_bpf_storage->smap &&
         |             ~~  ^
   net/mptcp/sched.c:211:32: error: no member named 'sk_bpf_storage' in 'struct sock'
     211 |         if (sk->sk_bpf_storage && sk->sk_bpf_storage->smap &&
         |                                   ~~  ^
   net/mptcp/sched.c:212:18: error: no member named 'sk_bpf_storage' in 'struct sock'
     212 |             !strcmp(sk->sk_bpf_storage->smap->map.name, "mptcp_burst_map")) {
         |                     ~~  ^
   net/mptcp/sched.c:215:42: error: no member named 'sk_bpf_storage' in 'struct sock'
     215 |                 sdata = bpf_sk_storage_lookup(sk, &sk->sk_bpf_storage->smap->map, true);
         |                                                    ~~  ^
   net/mptcp/sched.c:239:10: error: no member named 'sk_bpf_storage' in 'struct sock'
     239 |         if (sk->sk_bpf_storage && sk->sk_bpf_storage->smap &&
         |             ~~  ^
   net/mptcp/sched.c:239:32: error: no member named 'sk_bpf_storage' in 'struct sock'
     239 |         if (sk->sk_bpf_storage && sk->sk_bpf_storage->smap &&
         |                                   ~~  ^
   net/mptcp/sched.c:240:18: error: no member named 'sk_bpf_storage' in 'struct sock'
     240 |             !strcmp(sk->sk_bpf_storage->smap->map.name, "mptcp_burst_map")) {
         |                     ~~  ^
   net/mptcp/sched.c:243:42: error: no member named 'sk_bpf_storage' in 'struct sock'
     243 |                 sdata = bpf_sk_storage_lookup(sk, &sk->sk_bpf_storage->smap->map, true);
         |                                                    ~~  ^
   13 warnings and 8 errors generated.


vim +211 net/mptcp/sched.c

   203	
   204	int mptcp_sched_get_params(struct mptcp_sock *msk)
   205	{
   206		struct sock *sk = (struct sock *)msk;
   207	
   208		if (msk->sched == &mptcp_sched_default)
   209			return msk->snd_burst;
   210	
 > 211		if (sk->sk_bpf_storage && sk->sk_bpf_storage->smap &&
   212		    !strcmp(sk->sk_bpf_storage->smap->map.name, "mptcp_burst_map")) {
   213			struct bpf_local_storage_data *sdata;
   214	
   215			sdata = bpf_sk_storage_lookup(sk, &sk->sk_bpf_storage->smap->map, true);
   216			if (sdata) {
   217				struct mptcp_burst_storage {
   218					int snd_burst;
   219				} *ptr;
   220	
   221				ptr = (struct mptcp_burst_storage *)sdata->data;
   222				if (ptr)
   223					return ptr->snd_burst;
   224			}
   225		}
   226	
   227		return 0;
   228	}
   229	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
