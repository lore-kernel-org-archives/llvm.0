Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73F3285CAD;
	Thu,  9 Jul 2026 07:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783583231; cv=none; b=lUw5EDU0pOcuhOMVyM4lybBI7nxIhJRzwRzgGD6a1tY56GVgXcuDROxlzFCzU7K5DXt7gmmPMT6FSXj0MqODrZkt6j5CINCNtn5uTFVHDOKXWdCuwBBi8YVQX1O01BszRhFD9j8aiAHK8Z4gmv25qmP1mkQqXn1EQ0ZqbCDee6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783583231; c=relaxed/simple;
	bh=XDiT+tIOIk0brL7tKqyT3t9lZBpkiLYMsQSLugJ8oPE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aU0XEg8HOSMyPZjB5MMOfIBZJ4kEuvgLo1VUI3rpDSNycGWdoqQ9Qt5sPqtUPkEX/rHEoE+848Fjo2hhbKTgTxDf0FOS4/T71Kb1M0yLSAvPJxSxl+K+XvD7QD5eZftOhp6BhnfhVsDCYxfpoQvTIV/DwzEqQoOWdr5BJ95CZCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9hAtIbn; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9hAtIbn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783583230; x=1815119230;
  h=date:from:to:cc:subject:message-id;
  bh=XDiT+tIOIk0brL7tKqyT3t9lZBpkiLYMsQSLugJ8oPE=;
  b=i9hAtIbnLI0OuShDG/eVtzjoGVHKOo2amYSQR91cqiTC2fITWB+ruU/l
   GkDaVu4EAvchpnfzrH8zZmcNDLPYuoUJk5OGVtToSC/nEhH0JPbBop7ey
   HQ5A06kcv093v6/4+ThEFmKabH/kQ5JFV/OKb6w56sXAHvR2TuQHiXg62
   dHHr9pskHrOtzzfnlSwP1+bR7sx3tUnACVu/mcxAzCbHg191RrkSM8zPJ
   EO4EzlJOw8HtRuOZbYdo1eE06OoDzXwqlPRrKXeozGMZygvLIhVG/B2U4
   7jPFkDmgg6kD/8nQkuDtCzAb2oClZZy8boh+MY6BJ395YEno4uhIduq26
   w==;
X-CSE-ConnectionGUID: RxpXJPpcTq6wTXLZY1Vj/A==
X-CSE-MsgGUID: BkGxc5sVS3GWcZQGeaor4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101684402"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="101684402"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 00:47:10 -0700
X-CSE-ConnectionGUID: 59cavj57Rri+6jDaU6ZOsA==
X-CSE-MsgGUID: MBl1TSD/T3SWjKdXxv/ejA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253421851"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 09 Jul 2026 00:47:08 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whjTO-000000002wv-0WVa;
	Thu, 09 Jul 2026 07:47:06 +0000
Date: Thu, 09 Jul 2026 09:46:15 +0200
From: kernel test robot <lkp@intel.com>
To: Phil Sutter <phil@nwl.cc>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: net/netfilter/nfnetlink_hook.c:375:16: error: expected ';'
 after expression
Message-ID: <202607090956.vur8s2T9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Phil-Sutter/netfilter-nfnetlink_hook-Pass-cb-object-to-nfnl_hook_dump_nat/20260709-004129
head:   82b3ae63423bde6a0a2c963376b2feab3c1d404b
commit: 82b3ae63423bde6a0a2c963376b2feab3c1d404b netfilter: nfnetlink_hook: Fix for concurrent NAT hooks dump and change
date:   15 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260709/202607090956.vur8s2T9-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090956.vur8s2T9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607090956.vur8s2T9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/netfilter/nfnetlink_hook.c:375:16: error: expected ';' after expression
     375 |                 ctx->natv = 0
         |                              ^
         |                              ;
   1 error generated.


vim +375 net/netfilter/nfnetlink_hook.c

   340	
   341	static int nfnl_hook_dump_nat(struct sk_buff *nlskb,
   342				      struct netlink_callback *cb,
   343				      const struct nf_hook_ops *ops, int family)
   344	{
   345		struct nf_nat_lookup_hook_priv *priv = ops->priv;
   346		struct nf_hook_entries *e = rcu_dereference(priv->entries);
   347		struct nfnl_dump_hook_data *ctx = cb->data;
   348		struct nf_hook_ops **nat_ops;
   349		unsigned int i = cb->args[1];
   350		int err = 0;
   351	
   352		if (!e)
   353			return 0;
   354	
   355		if (!ctx->natv)
   356			ctx->natv = (unsigned long)e;
   357	
   358		if (i >= e->num_hook_entries ||
   359		    ctx->natv != (unsigned long)e) {
   360			cb->seq++;
   361			return -EINTR;
   362		}
   363	
   364		nat_ops = nf_hook_entries_get_hook_ops(e);
   365	
   366		for (; i < e->num_hook_entries; i++) {
   367			err = nfnl_hook_dump_one(nlskb, ctx, nat_ops[i],
   368						 ops->priority, family,
   369						 cb->nlh->nlmsg_seq);
   370			if (err)
   371				break;
   372		}
   373	
   374		if (!err) {
 > 375			ctx->natv = 0
   376			i = 0;
   377		}
   378		cb->args[1] = i;
   379		return err;
   380	}
   381	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
