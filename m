Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D291A14F9F0;
	Sat,  1 Jun 2024 12:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717246652; cv=none; b=uP1YuFUraVSDwq3811XEa1lpd8BcRqFfc9K2DO+CgKv0G6kPd4RSzkOAbHdQRXftCFWRDtBk5CcYBSggthLXYmIJWXtNSMAA/N0S3SLpiy5c9R8RK/9V72Rovxm0A+F/Cs4TDEtMTV5qTNS8VYzN7p/b22mBtoewy9yqqs5tHwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717246652; c=relaxed/simple;
	bh=Fivm1LCR0dzG7lVPX86f9+7qvWYNkdEYGCX/xoEl5AU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ipaYDNn/ehmnEj7zgTf9Hw7whfG1z1Dp6nxNgdyRuSg9x00bppCyZj1XzsV6TVnQZPl1AD8d0J3pHicw2uUoE7vQCdZrom1JXZ3E/PaKMs/39vorwNYaxXIkZor7Vn0rK+tlcEVexAdQtX6F+idFck/E/Fv3P6IKTmHO+Hid4KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d9LKGrkK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d9LKGrkK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717246650; x=1748782650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fivm1LCR0dzG7lVPX86f9+7qvWYNkdEYGCX/xoEl5AU=;
  b=d9LKGrkKry5EnGDqz8656HoIcBG/z5r903cCvBHpp5rMgh/DfV25/I+W
   MUQZdOK9YD1fMGol6Wb3QviRlIoKScm5uvdVnW+D1OztzS9JSXaO1IPMd
   DE+xrXNzt1PVrb4zWvozxvC6BRsq2cne+fKsCGLPJkGsdBpQx3LlNhMTv
   r105PxSn0diG9wClk2b3iUhb7Dr1THQlPtEzUJfw4kcmF9INZIkUAhbX1
   xqJ0JqRrGAsR9pu/jLo8ahhWNfOeYbVUaht6DCMHJpnCBra13phRU9nr7
   bLKqBmJp1Nj02kKjOgBKHJi7EWrD7fgQbRkoq0EqkwL9OC75DJpHbBxUm
   Q==;
X-CSE-ConnectionGUID: /1o0LNBXTzeT0QwAY7zOZg==
X-CSE-MsgGUID: we6GQ+MaQKGwqMk5m76q0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11090"; a="17635434"
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="17635434"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 05:57:26 -0700
X-CSE-ConnectionGUID: HphK+o8BQDmOtu3tXry3jg==
X-CSE-MsgGUID: u6r6+95rSdSN1QPSDHhjcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="67270705"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Jun 2024 05:57:26 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDOIU-000ItD-35;
	Sat, 01 Jun 2024 12:57:22 +0000
Date: Sat, 1 Jun 2024 20:56:47 +0800
From: kernel test robot <lkp@intel.com>
To: Yan Zhai <yan@cloudflare.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 net-next 1/7] net: add rx_sk to trace_kfree_skb
Message-ID: <202406012054.AjuaAUPn-lkp@intel.com>
References: <451ae2a5c2ddb3c127cfddaf4a6579d6e85791f3.1717206060.git.yan@cloudflare.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <451ae2a5c2ddb3c127cfddaf4a6579d6e85791f3.1717206060.git.yan@cloudflare.com>

Hi Yan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Yan-Zhai/net-add-rx_sk-to-trace_kfree_skb/20240601-094726
base:   net-next/main
patch link:    https://lore.kernel.org/r/451ae2a5c2ddb3c127cfddaf4a6579d6e85791f3.1717206060.git.yan%40cloudflare.com
patch subject: [RFC v2 net-next 1/7] net: add rx_sk to trace_kfree_skb
config: arm-randconfig-002-20240601 (https://download.01.org/0day-ci/archive/20240601/202406012054.AjuaAUPn-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406012054.AjuaAUPn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406012054.AjuaAUPn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/core/drop_monitor.c:10:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm/include/asm/cacheflush.h:10:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> net/core/drop_monitor.c:1162:32: error: incompatible function pointer types passing 'void (*const)(void *, struct sk_buff *, void *, enum skb_drop_reason)' to parameter of type 'void (*)(void *, struct sk_buff *, void *, enum skb_drop_reason, struct sock *)' [-Wincompatible-function-pointer-types]
    1162 |         rc = register_trace_kfree_skb(ops->kfree_skb_probe, NULL);
         |                                       ^~~~~~~~~~~~~~~~~~~~
   include/trace/events/skb.h:24:1: note: passing argument to parameter 'probe' here
      24 | TRACE_EVENT(kfree_skb,
         | ^
   include/linux/tracepoint.h:568:2: note: expanded from macro 'TRACE_EVENT'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:434:2: note: expanded from macro 'DECLARE_TRACE'
     434 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^
   include/linux/tracepoint.h:270:31: note: expanded from macro '__DECLARE_TRACE'
     270 |         register_trace_##name(void (*probe)(data_proto), void *data)    \
         |                                      ^
   net/core/drop_monitor.c:1177:29: error: incompatible function pointer types passing 'void (*const)(void *, struct sk_buff *, void *, enum skb_drop_reason)' to parameter of type 'void (*)(void *, struct sk_buff *, void *, enum skb_drop_reason, struct sock *)' [-Wincompatible-function-pointer-types]
    1177 |         unregister_trace_kfree_skb(ops->kfree_skb_probe, NULL);
         |                                    ^~~~~~~~~~~~~~~~~~~~
   include/trace/events/skb.h:24:1: note: passing argument to parameter 'probe' here
      24 | TRACE_EVENT(kfree_skb,
         | ^
   include/linux/tracepoint.h:568:2: note: expanded from macro 'TRACE_EVENT'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:434:2: note: expanded from macro 'DECLARE_TRACE'
     434 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^
   include/linux/tracepoint.h:283:33: note: expanded from macro '__DECLARE_TRACE'
     283 |         unregister_trace_##name(void (*probe)(data_proto), void *data)  \
         |                                        ^
   net/core/drop_monitor.c:1200:29: error: incompatible function pointer types passing 'void (*const)(void *, struct sk_buff *, void *, enum skb_drop_reason)' to parameter of type 'void (*)(void *, struct sk_buff *, void *, enum skb_drop_reason, struct sock *)' [-Wincompatible-function-pointer-types]
    1200 |         unregister_trace_kfree_skb(ops->kfree_skb_probe, NULL);
         |                                    ^~~~~~~~~~~~~~~~~~~~
   include/trace/events/skb.h:24:1: note: passing argument to parameter 'probe' here
      24 | TRACE_EVENT(kfree_skb,
         | ^
   include/linux/tracepoint.h:568:2: note: expanded from macro 'TRACE_EVENT'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:434:2: note: expanded from macro 'DECLARE_TRACE'
     434 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^
   include/linux/tracepoint.h:283:33: note: expanded from macro '__DECLARE_TRACE'
     283 |         unregister_trace_##name(void (*probe)(data_proto), void *data)  \
         |                                        ^
   1 warning and 3 errors generated.


vim +1162 net/core/drop_monitor.c

8e94c3bc922e70 Ido Schimmel 2019-08-17  1135  
7c747838a55818 Ido Schimmel 2019-08-11  1136  static int net_dm_trace_on_set(struct netlink_ext_ack *extack)
9a8afc8d3962f3 Neil Horman  2009-03-11  1137  {
28315f7999870b Ido Schimmel 2019-08-11  1138  	const struct net_dm_alert_ops *ops;
70c69274f354ec Ido Schimmel 2019-08-11  1139  	int cpu, rc;
4b706372f18de5 Neil Horman  2010-07-20  1140  
28315f7999870b Ido Schimmel 2019-08-11  1141  	ops = net_dm_alert_ops_arr[net_dm_alert_mode];
28315f7999870b Ido Schimmel 2019-08-11  1142  
cad456d5abbb63 Neil Horman  2012-05-17  1143  	if (!try_module_get(THIS_MODULE)) {
965100966efe85 Ido Schimmel 2019-08-06  1144  		NL_SET_ERR_MSG_MOD(extack, "Failed to take reference on module");
7c747838a55818 Ido Schimmel 2019-08-11  1145  		return -ENODEV;
cad456d5abbb63 Neil Horman  2012-05-17  1146  	}
cad456d5abbb63 Neil Horman  2012-05-17  1147  
70c69274f354ec Ido Schimmel 2019-08-11  1148  	for_each_possible_cpu(cpu) {
70c69274f354ec Ido Schimmel 2019-08-11  1149  		struct per_cpu_dm_data *data = &per_cpu(dm_cpu_data, cpu);
44075f56379388 Ido Schimmel 2019-08-11  1150  		struct sk_buff *skb;
70c69274f354ec Ido Schimmel 2019-08-11  1151  
28315f7999870b Ido Schimmel 2019-08-11  1152  		INIT_WORK(&data->dm_alert_work, ops->work_item_func);
70c69274f354ec Ido Schimmel 2019-08-11  1153  		timer_setup(&data->send_timer, sched_send_work, 0);
44075f56379388 Ido Schimmel 2019-08-11  1154  		/* Allocate a new per-CPU skb for the summary alert message and
44075f56379388 Ido Schimmel 2019-08-11  1155  		 * free the old one which might contain stale data from
44075f56379388 Ido Schimmel 2019-08-11  1156  		 * previous tracing.
44075f56379388 Ido Schimmel 2019-08-11  1157  		 */
44075f56379388 Ido Schimmel 2019-08-11  1158  		skb = reset_per_cpu_data(data);
44075f56379388 Ido Schimmel 2019-08-11  1159  		consume_skb(skb);
70c69274f354ec Ido Schimmel 2019-08-11  1160  	}
70c69274f354ec Ido Schimmel 2019-08-11  1161  
28315f7999870b Ido Schimmel 2019-08-11 @1162  	rc = register_trace_kfree_skb(ops->kfree_skb_probe, NULL);
7c747838a55818 Ido Schimmel 2019-08-11  1163  	if (rc) {
7c747838a55818 Ido Schimmel 2019-08-11  1164  		NL_SET_ERR_MSG_MOD(extack, "Failed to connect probe to kfree_skb() tracepoint");
7c747838a55818 Ido Schimmel 2019-08-11  1165  		goto err_module_put;
7c747838a55818 Ido Schimmel 2019-08-11  1166  	}
cad456d5abbb63 Neil Horman  2012-05-17  1167  
28315f7999870b Ido Schimmel 2019-08-11  1168  	rc = register_trace_napi_poll(ops->napi_poll_probe, NULL);
7c747838a55818 Ido Schimmel 2019-08-11  1169  	if (rc) {
7c747838a55818 Ido Schimmel 2019-08-11  1170  		NL_SET_ERR_MSG_MOD(extack, "Failed to connect probe to napi_poll() tracepoint");
7c747838a55818 Ido Schimmel 2019-08-11  1171  		goto err_unregister_trace;
7c747838a55818 Ido Schimmel 2019-08-11  1172  	}
7c747838a55818 Ido Schimmel 2019-08-11  1173  
7c747838a55818 Ido Schimmel 2019-08-11  1174  	return 0;
7c747838a55818 Ido Schimmel 2019-08-11  1175  
7c747838a55818 Ido Schimmel 2019-08-11  1176  err_unregister_trace:
28315f7999870b Ido Schimmel 2019-08-11  1177  	unregister_trace_kfree_skb(ops->kfree_skb_probe, NULL);
7c747838a55818 Ido Schimmel 2019-08-11  1178  err_module_put:
9398e9c0b1d44e Ido Schimmel 2021-03-10  1179  	for_each_possible_cpu(cpu) {
9398e9c0b1d44e Ido Schimmel 2021-03-10  1180  		struct per_cpu_dm_data *data = &per_cpu(dm_cpu_data, cpu);
9398e9c0b1d44e Ido Schimmel 2021-03-10  1181  		struct sk_buff *skb;
9398e9c0b1d44e Ido Schimmel 2021-03-10  1182  
9398e9c0b1d44e Ido Schimmel 2021-03-10  1183  		del_timer_sync(&data->send_timer);
9398e9c0b1d44e Ido Schimmel 2021-03-10  1184  		cancel_work_sync(&data->dm_alert_work);
9398e9c0b1d44e Ido Schimmel 2021-03-10  1185  		while ((skb = __skb_dequeue(&data->drop_queue)))
9398e9c0b1d44e Ido Schimmel 2021-03-10  1186  			consume_skb(skb);
9398e9c0b1d44e Ido Schimmel 2021-03-10  1187  	}
7c747838a55818 Ido Schimmel 2019-08-11  1188  	module_put(THIS_MODULE);
7c747838a55818 Ido Schimmel 2019-08-11  1189  	return rc;
7c747838a55818 Ido Schimmel 2019-08-11  1190  }
7c747838a55818 Ido Schimmel 2019-08-11  1191  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
