Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1EC1991C3;
	Thu, 17 Oct 2024 06:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729147206; cv=none; b=V/UtqDQQOgBdV+l0p7jeGnG7YUqlTmQ/feesg9PTBZWTDquy7bwARIJlh30kFk7ciz547fZxFFWytt5q6SIbkGwKFkY0gt6DfqRKvHbmTAOv4esDuq1UxXhNqKX/I4olTpCJ2Vw6bV4OtbTmRA7DtFLFOHmMzdP/sygs3obnMeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729147206; c=relaxed/simple;
	bh=8KN18dCnH9UO79LbKMRoexRW6pAmOCl0RhJaZVzUi+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vlz6ljgsFmdk7XjUKXcH9EVp2PEVf/zNYpBVOL0vBdD2MJHUatR858htsBSHNnV5ViTX/G8vMz+dgYh6hT9eoxonEmY3wU6spSPxHXb6wTXY6QmOKSHxAkR8nUyOl5BDd+dKJi65yd2SRZ3Hkt82G32lSEJtUO8Xnh7O4+s4k+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NHDDgVZU; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NHDDgVZU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729147204; x=1760683204;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8KN18dCnH9UO79LbKMRoexRW6pAmOCl0RhJaZVzUi+8=;
  b=NHDDgVZUcTwV+WMN9hdF/r+/z2fUurFxviCgxGoravEksgTNTuHbjoqe
   Dul6653R6/N+H3BV0Qe2/CT+bnO38hlSRmsPPL52XtQkj4dj/aK2dTXKc
   LTWpySH2fqr8Lj1j4SwgEsAYJGUrr/dm5c9WzJ7Pok3Qj/x4J9GGafWMn
   vdr/aKlnGQBLVPagNoFlpeduV3rz6vhTNBDLoYIQZFw1XGMjEbWL1l/fJ
   9Fenrm4gMAYtgNdCaQwq/cbGh2JZ9ujeJY7IbOvfb4HjV3kAZHgSUmv7a
   mVQe+k/hQYcTJIr+lqoR0Df4xgaI87yRaZMP+vCC603t2HPl72zHTqaTN
   Q==;
X-CSE-ConnectionGUID: kMW5g8iBTtuwmKzNDYmDRA==
X-CSE-MsgGUID: 7MqOAuz1QFKzClSrYdBw7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="39205117"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="39205117"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 23:40:03 -0700
X-CSE-ConnectionGUID: R35pB6d2SUG7/0+FEpINFA==
X-CSE-MsgGUID: f5dIgtBoSTu1XNWFaEnINw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="83280997"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Oct 2024 23:40:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1KAx-000LpN-0u;
	Thu, 17 Oct 2024 06:39:59 +0000
Date: Thu, 17 Oct 2024 14:39:12 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Woudstra <ericwouds@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v1 net-next 02/12] netfilter: bridge: Add conntrack
 double vlan and pppoe
Message-ID: <202410171456.dIcQWQ3O-lkp@intel.com>
References: <20241013185509.4430-3-ericwouds@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241013185509.4430-3-ericwouds@gmail.com>

Hi Eric,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Woudstra/netfilter-nf_flow_table_offload-Add-nf_flow_encap_push-for-xmit-direct/20241014-030018
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241013185509.4430-3-ericwouds%40gmail.com
patch subject: [PATCH RFC v1 net-next 02/12] netfilter: bridge: Add conntrack double vlan and pppoe
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241017/202410171456.dIcQWQ3O-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241017/202410171456.dIcQWQ3O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410171456.dIcQWQ3O-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/bridge/netfilter/nf_conntrack_bridge.c:257:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     257 |                 struct ppp_hdr {
         |                 ^
   net/bridge/netfilter/nf_conntrack_bridge.c:277:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     277 |                 struct vlan_hdr *vhdr = (struct vlan_hdr *)(skb->data);
         |                 ^
   2 warnings generated.


vim +257 net/bridge/netfilter/nf_conntrack_bridge.c

   239	
   240	static unsigned int nf_ct_bridge_pre(void *priv, struct sk_buff *skb,
   241					     const struct nf_hook_state *state)
   242	{
   243		struct nf_hook_state bridge_state = *state;
   244		__be16 outer_proto, inner_proto;
   245		enum ip_conntrack_info ctinfo;
   246		int ret, offset = 0;
   247		struct nf_conn *ct;
   248		u32 len, data_len;
   249	
   250		ct = nf_ct_get(skb, &ctinfo);
   251		if ((ct && !nf_ct_is_template(ct)) ||
   252		    ctinfo == IP_CT_UNTRACKED)
   253			return NF_ACCEPT;
   254	
   255		switch (skb->protocol) {
   256		case htons(ETH_P_PPP_SES):
 > 257			struct ppp_hdr {
   258				struct pppoe_hdr hdr;
   259				__be16 proto;
   260			} *ph = (struct ppp_hdr *)(skb->data);
   261	
   262			data_len = ntohs(ph->hdr.length) - 2;
   263			offset = PPPOE_SES_HLEN;
   264			outer_proto = skb->protocol;
   265			switch (ph->proto) {
   266			case htons(PPP_IP):
   267				inner_proto = htons(ETH_P_IP);
   268				break;
   269			case htons(PPP_IPV6):
   270				inner_proto = htons(ETH_P_IPV6);
   271				break;
   272			default:
   273				return NF_ACCEPT;
   274			}
   275			break;
   276		case htons(ETH_P_8021Q):
   277			struct vlan_hdr *vhdr = (struct vlan_hdr *)(skb->data);
   278	
   279			data_len = 0xffffffff;
   280			offset = VLAN_HLEN;
   281			outer_proto = skb->protocol;
   282			inner_proto = vhdr->h_vlan_encapsulated_proto;
   283			break;
   284		default:
   285			data_len = 0xffffffff;
   286			break;
   287		}
   288	
   289		if (offset) {
   290			switch (inner_proto) {
   291			case htons(ETH_P_IP):
   292			case htons(ETH_P_IPV6):
   293				if (!pskb_may_pull(skb, offset))
   294					return NF_ACCEPT;
   295				skb_pull_rcsum(skb, offset);
   296				skb_reset_network_header(skb);
   297				skb->protocol = inner_proto;
   298				break;
   299			default:
   300				return NF_ACCEPT;
   301			}
   302		}
   303	
   304		ret = NF_ACCEPT;
   305		switch (skb->protocol) {
   306		case htons(ETH_P_IP):
   307			if (!pskb_may_pull(skb, sizeof(struct iphdr)))
   308				goto do_not_track;
   309	
   310			len = skb_ip_totlen(skb);
   311			if (data_len < len)
   312				len = data_len;
   313			if (pskb_trim_rcsum(skb, len))
   314				goto do_not_track;
   315	
   316			if (nf_ct_br_ip_check(skb))
   317				goto do_not_track;
   318	
   319			bridge_state.pf = NFPROTO_IPV4;
   320			ret = nf_ct_br_defrag4(skb, &bridge_state);
   321			break;
   322		case htons(ETH_P_IPV6):
   323			if (!pskb_may_pull(skb, sizeof(struct ipv6hdr)))
   324				goto do_not_track;
   325	
   326			len = sizeof(struct ipv6hdr) + ntohs(ipv6_hdr(skb)->payload_len);
   327			if (data_len < len)
   328				len = data_len;
   329			if (pskb_trim_rcsum(skb, len))
   330				goto do_not_track;
   331	
   332			if (nf_ct_br_ipv6_check(skb))
   333				goto do_not_track;
   334	
   335			bridge_state.pf = NFPROTO_IPV6;
   336			ret = nf_ct_br_defrag6(skb, &bridge_state);
   337			break;
   338		default:
   339			nf_ct_set(skb, NULL, IP_CT_UNTRACKED);
   340			goto do_not_track;
   341		}
   342	
   343		if (ret == NF_ACCEPT)
   344			ret = nf_conntrack_in(skb, &bridge_state);
   345	
   346	do_not_track:
   347		if (offset) {
   348			skb_push_rcsum(skb, offset);
   349			skb_reset_network_header(skb);
   350			skb->protocol = outer_proto;
   351		}
   352		return ret;
   353	}
   354	static unsigned int nf_ct_bridge_in(void *priv, struct sk_buff *skb,
   355					    const struct nf_hook_state *state)
   356	{
   357		bool promisc = BR_INPUT_SKB_CB(skb)->promisc;
   358		struct nf_conntrack *nfct = skb_nfct(skb);
   359		struct nf_conn *ct;
   360	
   361		if (promisc) {
   362			nf_reset_ct(skb);
   363			return NF_ACCEPT;
   364		}
   365	
   366		if (!nfct || skb->pkt_type == PACKET_HOST)
   367			return NF_ACCEPT;
   368	
   369		/* nf_conntrack_confirm() cannot handle concurrent clones,
   370		 * this happens for broad/multicast frames with e.g. macvlan on top
   371		 * of the bridge device.
   372		 */
   373		ct = container_of(nfct, struct nf_conn, ct_general);
   374		if (nf_ct_is_confirmed(ct) || nf_ct_is_template(ct))
   375			return NF_ACCEPT;
   376	
   377		/* let inet prerouting call conntrack again */
   378		skb->_nfct = 0;
   379		nf_ct_put(ct);
   380	
   381		return NF_ACCEPT;
   382	}
   383	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
