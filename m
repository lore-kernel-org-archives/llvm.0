Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74764A945;
	Sat, 17 Jun 2023 18:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687027309; x=1718563309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IyDmPFmysjqrF5/yPtRBQPEMBD0CiUWATrXDjCeSZd8=;
  b=BNogpqJSjl00iSfGdPlbkzHn6g/ZTNPuLPtnuK5AprodoGsiS8ss9HUl
   4HzjFY67kuUeghaX+pj2Rl81Hc/ncOuwkBqH4FbOjhBS5pvlinwA50c7B
   6nlCNoUgB9smC6lZMxGtmrBOFIPPNFMuAabJUDu5jjfSbyyZh7509IuFY
   Yd+rcxkVRWQzwG8Pb1cduOeHdPymDwJwUViw3sEkRRHUvA18Go/dJTTna
   7yCs9pHIV8vC6bcBOVVCzkI2UnD8/s1ej5ASM7Dwjvktcz9O98sFffQZY
   zRm1/ft1AWa28QQYn6V0B1kQXOOtttXVFcceX2OsXStUVCzk2IYnoQP9p
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="423075520"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="423075520"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 11:41:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="778521761"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="778521761"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 17 Jun 2023 11:41:46 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAarp-00030s-2R;
	Sat, 17 Jun 2023 18:41:45 +0000
Date: Sun, 18 Jun 2023 02:41:07 +0800
From: kernel test robot <lkp@intel.com>
To: Edward Cree <ecree.xilinx@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <simon.horman@corigine.com>,
	Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>
Subject: [linux-next:master 8122/10546]
 drivers/net/ethernet/sfc/tc_encap_actions.c:144:7: warning: variable 'n' is
 used uninitialized whenever 'if' condition is true
Message-ID: <202306180235.N2G6clyj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f7efed9f38f886edb450041b82a6f15d663c98f8
commit: 7e5e7d800011adf4aeda615f8a1bc31c0c1e2bb9 [8122/10546] sfc: neighbour lookup for TC encap action offload
config: x86_64-buildonly-randconfig-r003-20230618 (https://download.01.org/0day-ci/archive/20230618/202306180235.N2G6clyj-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306180235.N2G6clyj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306180235.N2G6clyj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/sfc/tc_encap_actions.c:144:7: warning: variable 'n' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
                   if (encap->type & EFX_ENCAP_FLAG_IPV6) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/tc_encap_actions.c:184:8: note: uninitialized use occurs here
                   if (!n) {
                        ^
   drivers/net/ethernet/sfc/tc_encap_actions.c:144:3: note: remove the 'if' if its condition is always false
                   if (encap->type & EFX_ENCAP_FLAG_IPV6) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/tc_encap_actions.c:141:22: note: initialize the variable 'n' to silence this warning
                   struct neighbour *n;
                                      ^
                                       = NULL
   1 warning generated.


vim +144 drivers/net/ethernet/sfc/tc_encap_actions.c

    83	
    84	static int efx_bind_neigh(struct efx_nic *efx,
    85				  struct efx_tc_encap_action *encap, struct net *net,
    86				  struct netlink_ext_ack *extack)
    87	{
    88		struct efx_neigh_binder *neigh, *old;
    89		struct flowi6 flow6 = {};
    90		struct flowi4 flow4 = {};
    91		int rc;
    92	
    93		/* GCC stupidly thinks that only values explicitly listed in the enum
    94		 * definition can _possibly_ be sensible case values, so without this
    95		 * cast it complains about the IPv6 versions.
    96		 */
    97		switch ((int)encap->type) {
    98		case EFX_ENCAP_TYPE_VXLAN:
    99		case EFX_ENCAP_TYPE_GENEVE:
   100			flow4.flowi4_proto = IPPROTO_UDP;
   101			flow4.fl4_dport = encap->key.tp_dst;
   102			flow4.flowi4_tos = encap->key.tos;
   103			flow4.daddr = encap->key.u.ipv4.dst;
   104			flow4.saddr = encap->key.u.ipv4.src;
   105			break;
   106		case EFX_ENCAP_TYPE_VXLAN | EFX_ENCAP_FLAG_IPV6:
   107		case EFX_ENCAP_TYPE_GENEVE | EFX_ENCAP_FLAG_IPV6:
   108			flow6.flowi6_proto = IPPROTO_UDP;
   109			flow6.fl6_dport = encap->key.tp_dst;
   110			flow6.flowlabel = ip6_make_flowinfo(encap->key.tos,
   111							    encap->key.label);
   112			flow6.daddr = encap->key.u.ipv6.dst;
   113			flow6.saddr = encap->key.u.ipv6.src;
   114			break;
   115		default:
   116			NL_SET_ERR_MSG_FMT_MOD(extack, "Unsupported encap type %d",
   117					       (int)encap->type);
   118			return -EOPNOTSUPP;
   119		}
   120	
   121		neigh = kzalloc(sizeof(*neigh), GFP_KERNEL_ACCOUNT);
   122		if (!neigh)
   123			return -ENOMEM;
   124		neigh->net = get_net_track(net, &neigh->ns_tracker, GFP_KERNEL_ACCOUNT);
   125		neigh->dst_ip = flow4.daddr;
   126		neigh->dst_ip6 = flow6.daddr;
   127	
   128		old = rhashtable_lookup_get_insert_fast(&efx->tc->neigh_ht,
   129							&neigh->linkage,
   130							efx_neigh_ht_params);
   131		if (old) {
   132			/* don't need our new entry */
   133			put_net_track(neigh->net, &neigh->ns_tracker);
   134			kfree(neigh);
   135			if (!refcount_inc_not_zero(&old->ref))
   136				return -EAGAIN;
   137			/* existing entry found, ref taken */
   138			neigh = old;
   139		} else {
   140			/* New entry.  We need to initiate a lookup */
   141			struct neighbour *n;
   142			struct rtable *rt;
   143	
 > 144			if (encap->type & EFX_ENCAP_FLAG_IPV6) {
   145	#if IS_ENABLED(CONFIG_IPV6)
   146				struct dst_entry *dst;
   147	
   148				dst = ipv6_stub->ipv6_dst_lookup_flow(net, NULL, &flow6,
   149								      NULL);
   150				rc = PTR_ERR_OR_ZERO(dst);
   151				if (rc) {
   152					NL_SET_ERR_MSG_MOD(extack, "Failed to lookup route for IPv6 encap");
   153					goto out_free;
   154				}
   155				neigh->egdev = dst->dev;
   156				netdev_hold(neigh->egdev, &neigh->dev_tracker,
   157					    GFP_KERNEL_ACCOUNT);
   158				neigh->ttl = ip6_dst_hoplimit(dst);
   159				n = dst_neigh_lookup(dst, &flow6.daddr);
   160				dst_release(dst);
   161	#else
   162				/* We shouldn't ever get here, because if IPv6 isn't
   163				 * enabled how did someone create an IPv6 tunnel_key?
   164				 */
   165				rc = -EOPNOTSUPP;
   166				NL_SET_ERR_MSG_MOD(extack, "No IPv6 support (neigh bind)");
   167	#endif
   168			} else {
   169				rt = ip_route_output_key(net, &flow4);
   170				if (IS_ERR_OR_NULL(rt)) {
   171					rc = PTR_ERR_OR_ZERO(rt);
   172					if (!rc)
   173						rc = -EIO;
   174					NL_SET_ERR_MSG_MOD(extack, "Failed to lookup route for encap");
   175					goto out_free;
   176				}
   177				neigh->egdev = rt->dst.dev;
   178				netdev_hold(neigh->egdev, &neigh->dev_tracker,
   179					    GFP_KERNEL_ACCOUNT);
   180				neigh->ttl = ip4_dst_hoplimit(&rt->dst);
   181				n = dst_neigh_lookup(&rt->dst, &flow4.daddr);
   182				ip_rt_put(rt);
   183			}
   184			if (!n) {
   185				rc = -ENETUNREACH;
   186				NL_SET_ERR_MSG_MOD(extack, "Failed to lookup neighbour for encap");
   187				netdev_put(neigh->egdev, &neigh->dev_tracker);
   188				goto out_free;
   189			}
   190			refcount_set(&neigh->ref, 1);
   191			INIT_LIST_HEAD(&neigh->users);
   192			read_lock_bh(&n->lock);
   193			ether_addr_copy(neigh->ha, n->ha);
   194			neigh->n_valid = n->nud_state & NUD_VALID;
   195			read_unlock_bh(&n->lock);
   196			rwlock_init(&neigh->lock);
   197			INIT_WORK(&neigh->work, efx_neigh_update);
   198			neigh->efx = efx;
   199			neigh->used = jiffies;
   200			if (!neigh->n_valid)
   201				/* Prod ARP to find us a neighbour */
   202				neigh_event_send(n, NULL);
   203			neigh_release(n);
   204		}
   205		/* Add us to this neigh */
   206		encap->neigh = neigh;
   207		list_add_tail(&encap->list, &neigh->users);
   208		return 0;
   209	
   210	out_free:
   211		/* cleanup common to several error paths */
   212		rhashtable_remove_fast(&efx->tc->neigh_ht, &neigh->linkage,
   213				       efx_neigh_ht_params);
   214		synchronize_rcu();
   215		put_net_track(net, &neigh->ns_tracker);
   216		kfree(neigh);
   217		return rc;
   218	}
   219	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
