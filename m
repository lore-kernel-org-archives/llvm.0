Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA2F36C59E;
	Wed,  8 Jul 2026 11:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783508426; cv=none; b=BEVs/klR6eFWvtNM3i9yKG/ANpmdCs8ifN+nVNG1yeOZN3xH/ISAFsFT4Zbs07AMDUCBu9dquVDhl0ATtMsjQExmRXv47CNVqH1JIGHTp+RFwZguMSQLMO0rvwehHvhS8qftRMmJAguGAhPtP+TI4UqIVVUkGCxOfgBQzCjFF2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783508426; c=relaxed/simple;
	bh=RgFp3t0xXEJuRU59u8geFWyHTZrH6eXJzcU9jj8DX2I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ckl8m7uUrYfAmTNcuec7/PlM/5mc2VYzVTbxpPWjmu0+6oqtpjvTKBq4p26EJEP7S9s1j9FfbzIw29F5tHHx1q8U2OWc1NL8rc0yPTkpUu8niGlZ0ZMOtIoxh4wH49zVzG0iztQ3R5GQtxhr9pjA4nxBxsFzhl15Qo/B1q5Hdus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KdkPdMqi; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KdkPdMqi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783508422; x=1815044422;
  h=date:from:to:cc:subject:message-id;
  bh=RgFp3t0xXEJuRU59u8geFWyHTZrH6eXJzcU9jj8DX2I=;
  b=KdkPdMqiTv5OCwQEHOshYCMeuQXg8Vdgsl6TTo+0mmKWDjg8GFBRI9Dk
   7gvKgXXgF7HwYUCbUsDJHLw6C4YOFccmsg1pke99Tt5oJHYuPg6jzNFGF
   Xq71Tox1lToyw5rDe+3Sl8UM1pH0qxJU2t/bORT97vgOyADwjFTYUrsrn
   ykHU3wufSpunMX9pEgnlza3rBfn2ly/DPca57S+NTiYTb2HD5W7Bs2q0J
   u3pTx15/YESkUIE6LLjFX2jj/iJbgNd/Cq3j8ZUOafZl5t5tFWKFYNx8z
   QtMecnDbg3DIfiHHnw81hwzzapKnbOveLKxvsVtloFj0t0d6HtZTnA7ua
   A==;
X-CSE-ConnectionGUID: mEhah3EhRLGUoB200MM9xQ==
X-CSE-MsgGUID: Y/WEgV1+TlmB40Wp+NGiCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="83279513"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83279513"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 04:00:21 -0700
X-CSE-ConnectionGUID: SvT0GAjvSmSz+aT2OvWsZw==
X-CSE-MsgGUID: EJqI0mu5TnmoQW8XBaR8og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="292451236"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 08 Jul 2026 04:00:19 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whQ0m-000000002kj-458x;
	Wed, 08 Jul 2026 11:00:16 +0000
Date: Wed, 08 Jul 2026 12:59:36 +0200
From: kernel test robot <lkp@intel.com>
To: Jozsef Kadlecsik <kadlec@netfilter.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 Florian Westphal <fw@strlen.de>
Subject: [netfilter-nf:testing 11/20]
 net/netfilter/ipset/ip_set_hash_gen.h:379:21: warning: result of comparison
 of constant -1 with expression of type 'u8' (aka 'unsigned char') is always
 false
Message-ID: <202607081250.ODagxDyb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git testing
head:   c2fbcb9151957c3d921a7441cf080e49eb13b05d
commit: a900abcb974bae821a5d4ae79ad3442808915416 [11/20] netfilter: ipset: rework cidr bookkeeping
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260708/202607081250.ODagxDyb-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607081250.ODagxDyb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607081250.ODagxDyb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/netfilter/ipset/ip_set_hash_ipportnet.c:131:
>> net/netfilter/ipset/ip_set_hash_gen.h:379:21: warning: result of comparison of constant -1 with expression of type 'u8' (aka 'unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
     379 |         if (unlikely(found == -1))
         |                      ~~~~~ ^  ~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   In file included from net/netfilter/ipset/ip_set_hash_ipportnet.c:391:
>> net/netfilter/ipset/ip_set_hash_gen.h:379:21: warning: result of comparison of constant -1 with expression of type 'u8' (aka 'unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
     379 |         if (unlikely(found == -1))
         |                      ~~~~~ ^  ~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   2 warnings generated.


vim +379 net/netfilter/ipset/ip_set_hash_gen.h

   364	
   365	static void
   366	mtype_del_cidr(struct ip_set *set, struct htype *h, u8 cidr, u8 n)
   367	{
   368		struct net_prefixes *nets, *tmp;
   369		u8 i, j, found, len = 0;
   370	
   371		spin_lock_bh(&set->lock);
   372		nets = __ipset_dereference(h->rnets[n]);
   373		for (i = 0, found = -1; i < nets->len; i++) {
   374			if (nets->nets[i].count)
   375				len++;
   376			if (nets->nets[i].cidr == cidr)
   377				found = i;
   378		}
 > 379		if (unlikely(found == -1))
   380			return;
   381		nets->nets[found].count--;
   382		if (nets->nets[found].count)
   383			goto unlock;
   384		len--;
   385		tmp = kzalloc(sizeof(struct net_prefixes) +
   386			      len * sizeof(struct net_prefix), GFP_ATOMIC);
   387		if (!tmp)
   388			/* Leave a hole */
   389			return;
   390		tmp->len = len;
   391		for (i = 0, j = 0; i < nets->len; i++) {
   392			if (!nets->nets[i].count || i == found)
   393				continue;
   394			tmp->nets[j].cidr = nets->nets[i].cidr;
   395			tmp->nets[j++].count = nets->nets[i].count;
   396		}
   397		rcu_assign_pointer(h->rnets[n], tmp);
   398		kfree_rcu(nets, rcu);
   399	unlock:
   400		spin_unlock_bh(&set->lock);
   401	}
   402	#endif
   403	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
