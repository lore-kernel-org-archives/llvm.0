Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7AE29CA
	for <llvm@lists.linux.dev>; Fri,  4 Feb 2022 01:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643938307; x=1675474307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gLXsbz+N+c/G+5aZ3zmQYUFfJ6hdeG8+fzXCGvG/b7w=;
  b=Hx7ShVbqYXa6sqUXumPAMMjZRI2c9Q+Mznygp6G6WplUWl4RjPkl1+DG
   1wnhO/W3BguRzCTgyaQSzwWPaWY/cpq4ZjPxWm0HbL3qIBb2XCQt68Gki
   B+ovekRJDY4kmWVTltxhiay0FJSwfRQic5h8RxhB/GVVyOf1LTPb9XzwP
   yKW6EqPq6xzoNajkRxUUO8/bMdk8IeMBZqaCyyuWn7/WgTwPIDSM3Fz2c
   6nhpYdm4VYpvIuI6byeHnvht7jjKDCtrWbNE1HateTgYGKBKFMFhdvN/n
   YkkV1ym24iWwBeov537fPIdc3Ckcf0N9pkXvBrj1tWQY7YvYPkd8I+0Sz
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="247124598"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; 
   d="scan'208";a="247124598"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2022 17:31:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; 
   d="scan'208";a="771970338"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Feb 2022 17:31:45 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nFnRx-000WwR-91; Fri, 04 Feb 2022 01:31:45 +0000
Date: Fri, 4 Feb 2022 09:31:08 +0800
From: kernel test robot <lkp@intel.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH RFC 2/4] net: skb: add function name as part of reason
Message-ID: <202202040814.dnMvgmym-lkp@intel.com>
References: <20220203153731.8992-3-dongli.zhang@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220203153731.8992-3-dongli.zhang@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Dongli,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on net/master]
[also build test ERROR on horms-ipvs/master net-next/master linus/master v5.17-rc2 next-20220203]
[cannot apply to rostedt-trace/for-next mst-vhost/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Dongli-Zhang/net-skb-to-use-function-line-pair-as-reason-for-kfree_skb_reason/20220203-234047
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git 4a81f6da9cb2d1ef911131a6fd8bd15cb61fc772
config: i386-randconfig-r012-20220131 (https://download.01.org/0day-ci/archive/20220204/202202040814.dnMvgmym-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a73e4ce6a59b01f0e37037761c1e6889d539d233)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/f23dbdfcd70917e6ee216f97a477bb3387731628
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Dongli-Zhang/net-skb-to-use-function-line-pair-as-reason-for-kfree_skb_reason/20220203-234047
        git checkout f23dbdfcd70917e6ee216f97a477bb3387731628
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash mm/ net/core/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   net/core/drop_monitor.c:114:10: warning: declaration of 'enum skb_drop_reason' will not be visible outside of this function [-Wvisibility]
                                   enum skb_drop_reason reason);
                                        ^
   net/core/drop_monitor.c:268:10: warning: declaration of 'enum skb_drop_reason' will not be visible outside of this function [-Wvisibility]
                                   enum skb_drop_reason reason)
                                        ^
   net/core/drop_monitor.c:268:26: error: variable has incomplete type 'enum skb_drop_reason'
                                   enum skb_drop_reason reason)
                                                        ^
   net/core/drop_monitor.c:268:10: note: forward declaration of 'enum skb_drop_reason'
                                   enum skb_drop_reason reason)
                                        ^
   net/core/drop_monitor.c:487:21: error: incompatible function pointer types initializing 'void (*)(void *, struct sk_buff *, void *, enum skb_drop_reason)' with an expression of type 'void (void *, struct sk_buff *, void *, enum skb_drop_reason)' [-Werror,-Wincompatible-function-pointer-types]
           .kfree_skb_probe        = trace_kfree_skb_hit,
                                     ^~~~~~~~~~~~~~~~~~~
   net/core/drop_monitor.c:497:17: warning: declaration of 'enum skb_drop_reason' will not be visible outside of this function [-Wvisibility]
                                                 enum skb_drop_reason reason)
                                                      ^
   net/core/drop_monitor.c:497:33: error: variable has incomplete type 'enum skb_drop_reason'
                                                 enum skb_drop_reason reason)
                                                                      ^
   net/core/drop_monitor.c:497:17: note: forward declaration of 'enum skb_drop_reason'
                                                 enum skb_drop_reason reason)
                                                      ^
   net/core/drop_monitor.c:986:21: error: incompatible function pointer types initializing 'void (*)(void *, struct sk_buff *, void *, enum skb_drop_reason)' with an expression of type 'void (void *, struct sk_buff *, void *, enum skb_drop_reason)' [-Werror,-Wincompatible-function-pointer-types]
           .kfree_skb_probe        = net_dm_packet_trace_kfree_skb_hit,
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/core/drop_monitor.c:1136:32: error: incompatible function pointer types passing 'void (*const)(void *, struct sk_buff *, void *, enum skb_drop_reason)' to parameter of type 'void (*)(void *, struct sk_buff *, void *, const char *, unsigned int)' [-Werror,-Wincompatible-function-pointer-types]
           rc = register_trace_kfree_skb(ops->kfree_skb_probe, NULL);
                                         ^~~~~~~~~~~~~~~~~~~~
   include/trace/events/skb.h:15:1: note: passing argument to parameter 'probe' here
   TRACE_EVENT(kfree_skb,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:419:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:260:31: note: expanded from macro '__DECLARE_TRACE'
           register_trace_##name(void (*probe)(data_proto), void *data)    \
                                        ^
   net/core/drop_monitor.c:1151:29: error: incompatible function pointer types passing 'void (*const)(void *, struct sk_buff *, void *, enum skb_drop_reason)' to parameter of type 'void (*)(void *, struct sk_buff *, void *, const char *, unsigned int)' [-Werror,-Wincompatible-function-pointer-types]
           unregister_trace_kfree_skb(ops->kfree_skb_probe, NULL);
                                      ^~~~~~~~~~~~~~~~~~~~
   include/trace/events/skb.h:15:1: note: passing argument to parameter 'probe' here
   TRACE_EVENT(kfree_skb,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:419:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:273:33: note: expanded from macro '__DECLARE_TRACE'
           unregister_trace_##name(void (*probe)(data_proto), void *data)  \
                                          ^
   net/core/drop_monitor.c:1175:29: error: incompatible function pointer types passing 'void (*const)(void *, struct sk_buff *, void *, enum skb_drop_reason)' to parameter of type 'void (*)(void *, struct sk_buff *, void *, const char *, unsigned int)' [-Werror,-Wincompatible-function-pointer-types]
           unregister_trace_kfree_skb(ops->kfree_skb_probe, NULL);
                                      ^~~~~~~~~~~~~~~~~~~~
   include/trace/events/skb.h:15:1: note: passing argument to parameter 'probe' here
   TRACE_EVENT(kfree_skb,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:419:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:273:33: note: expanded from macro '__DECLARE_TRACE'
           unregister_trace_##name(void (*probe)(data_proto), void *data)  \
                                          ^
   3 warnings and 7 errors generated.


vim +1136 net/core/drop_monitor.c

8e94c3bc922e70 Ido Schimmel 2019-08-17  1109  
7c747838a55818 Ido Schimmel 2019-08-11  1110  static int net_dm_trace_on_set(struct netlink_ext_ack *extack)
9a8afc8d3962f3 Neil Horman  2009-03-11  1111  {
28315f7999870b Ido Schimmel 2019-08-11  1112  	const struct net_dm_alert_ops *ops;
70c69274f354ec Ido Schimmel 2019-08-11  1113  	int cpu, rc;
4b706372f18de5 Neil Horman  2010-07-20  1114  
28315f7999870b Ido Schimmel 2019-08-11  1115  	ops = net_dm_alert_ops_arr[net_dm_alert_mode];
28315f7999870b Ido Schimmel 2019-08-11  1116  
cad456d5abbb63 Neil Horman  2012-05-17  1117  	if (!try_module_get(THIS_MODULE)) {
965100966efe85 Ido Schimmel 2019-08-06  1118  		NL_SET_ERR_MSG_MOD(extack, "Failed to take reference on module");
7c747838a55818 Ido Schimmel 2019-08-11  1119  		return -ENODEV;
cad456d5abbb63 Neil Horman  2012-05-17  1120  	}
cad456d5abbb63 Neil Horman  2012-05-17  1121  
70c69274f354ec Ido Schimmel 2019-08-11  1122  	for_each_possible_cpu(cpu) {
70c69274f354ec Ido Schimmel 2019-08-11  1123  		struct per_cpu_dm_data *data = &per_cpu(dm_cpu_data, cpu);
44075f56379388 Ido Schimmel 2019-08-11  1124  		struct sk_buff *skb;
70c69274f354ec Ido Schimmel 2019-08-11  1125  
28315f7999870b Ido Schimmel 2019-08-11  1126  		INIT_WORK(&data->dm_alert_work, ops->work_item_func);
70c69274f354ec Ido Schimmel 2019-08-11  1127  		timer_setup(&data->send_timer, sched_send_work, 0);
44075f56379388 Ido Schimmel 2019-08-11  1128  		/* Allocate a new per-CPU skb for the summary alert message and
44075f56379388 Ido Schimmel 2019-08-11  1129  		 * free the old one which might contain stale data from
44075f56379388 Ido Schimmel 2019-08-11  1130  		 * previous tracing.
44075f56379388 Ido Schimmel 2019-08-11  1131  		 */
44075f56379388 Ido Schimmel 2019-08-11  1132  		skb = reset_per_cpu_data(data);
44075f56379388 Ido Schimmel 2019-08-11  1133  		consume_skb(skb);
70c69274f354ec Ido Schimmel 2019-08-11  1134  	}
70c69274f354ec Ido Schimmel 2019-08-11  1135  
28315f7999870b Ido Schimmel 2019-08-11 @1136  	rc = register_trace_kfree_skb(ops->kfree_skb_probe, NULL);
7c747838a55818 Ido Schimmel 2019-08-11  1137  	if (rc) {
7c747838a55818 Ido Schimmel 2019-08-11  1138  		NL_SET_ERR_MSG_MOD(extack, "Failed to connect probe to kfree_skb() tracepoint");
7c747838a55818 Ido Schimmel 2019-08-11  1139  		goto err_module_put;
7c747838a55818 Ido Schimmel 2019-08-11  1140  	}
cad456d5abbb63 Neil Horman  2012-05-17  1141  
28315f7999870b Ido Schimmel 2019-08-11  1142  	rc = register_trace_napi_poll(ops->napi_poll_probe, NULL);
7c747838a55818 Ido Schimmel 2019-08-11  1143  	if (rc) {
7c747838a55818 Ido Schimmel 2019-08-11  1144  		NL_SET_ERR_MSG_MOD(extack, "Failed to connect probe to napi_poll() tracepoint");
7c747838a55818 Ido Schimmel 2019-08-11  1145  		goto err_unregister_trace;
7c747838a55818 Ido Schimmel 2019-08-11  1146  	}
7c747838a55818 Ido Schimmel 2019-08-11  1147  
7c747838a55818 Ido Schimmel 2019-08-11  1148  	return 0;
7c747838a55818 Ido Schimmel 2019-08-11  1149  
7c747838a55818 Ido Schimmel 2019-08-11  1150  err_unregister_trace:
28315f7999870b Ido Schimmel 2019-08-11  1151  	unregister_trace_kfree_skb(ops->kfree_skb_probe, NULL);
7c747838a55818 Ido Schimmel 2019-08-11  1152  err_module_put:
9398e9c0b1d44e Ido Schimmel 2021-03-10  1153  	for_each_possible_cpu(cpu) {
9398e9c0b1d44e Ido Schimmel 2021-03-10  1154  		struct per_cpu_dm_data *data = &per_cpu(dm_cpu_data, cpu);
9398e9c0b1d44e Ido Schimmel 2021-03-10  1155  		struct sk_buff *skb;
9398e9c0b1d44e Ido Schimmel 2021-03-10  1156  
9398e9c0b1d44e Ido Schimmel 2021-03-10  1157  		del_timer_sync(&data->send_timer);
9398e9c0b1d44e Ido Schimmel 2021-03-10  1158  		cancel_work_sync(&data->dm_alert_work);
9398e9c0b1d44e Ido Schimmel 2021-03-10  1159  		while ((skb = __skb_dequeue(&data->drop_queue)))
9398e9c0b1d44e Ido Schimmel 2021-03-10  1160  			consume_skb(skb);
9398e9c0b1d44e Ido Schimmel 2021-03-10  1161  	}
7c747838a55818 Ido Schimmel 2019-08-11  1162  	module_put(THIS_MODULE);
7c747838a55818 Ido Schimmel 2019-08-11  1163  	return rc;
7c747838a55818 Ido Schimmel 2019-08-11  1164  }
7c747838a55818 Ido Schimmel 2019-08-11  1165  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
