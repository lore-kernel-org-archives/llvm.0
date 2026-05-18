Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358041FC10C;
	Mon, 18 May 2026 06:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779085739; cv=none; b=QKv6+YcddPJ3UoRhIxXJyMYf3sbwzHhGlm2K7mYmXdTzYk5g/tJpPY2pcuMqM25dpE/sxlKeXYe9QK+XjnjQ8otL0k+FbLwJLS9SM63ZxbnQuSj9kfcFAt8TBK20miV2rVG7NcM1GsCZaWoqmetf0R2ZSCNT1dBpiRgj5kcb1Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779085739; c=relaxed/simple;
	bh=crUwGqC4+pXxFLpkZawrYEO/q19NSUqZT8S7pasV7ag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=n73UI1D2lbn6b+NgMs2aCCb2KwVaAKz6PUvFktXlETs9zmRy81oyIeLoArtvx4HG8ZXEzjxRsUlxMs69EcdVvlzPVz2P/GuTxF/yBy1DwqOWJ6Cee6BvjkeCQZ0JiENEDtwZKpOsuuvE1q/SanKOvuNePRnMDWxDI1tNH9tf7oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lfZZoOI7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lfZZoOI7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779085736; x=1810621736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=crUwGqC4+pXxFLpkZawrYEO/q19NSUqZT8S7pasV7ag=;
  b=lfZZoOI7bdLm2F4bVqM/tiBf93B5NMn4ewDlaFGzDn246JY4aCVREsCq
   U9e827Y4OXebr7unafbn/1hjGqKnYFaTlFuUFPUxSXSAGNpAr7cL2zBSW
   x3u9wtPTxa7Ep1Zzji28kYqk0jNa/KU2uxG9hSLDqD2PpfjwJzVGOT8X1
   yrzph2v6RuQoR8tlyfbABIzCxo7RSUT3zGzge3DMzcxBO5FKikdwlkVvx
   PNmbRKlpEit9gsXXH4A+7K1kub/Ny3MOtNTMfCTQzDD4Um6rFvd30ZQFQ
   /HRS47/fh4ouJp8f94pZzmxLW+NLGwx95fBDEM/ePifLyew7kiavfOjqv
   Q==;
X-CSE-ConnectionGUID: qQrCFvnlSa+Jo5I28OgMRg==
X-CSE-MsgGUID: CE+0A3ZKQvejgkalQrPhZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="67459012"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="67459012"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 23:28:55 -0700
X-CSE-ConnectionGUID: Co4AYr1kRc6Mdz7ufac1pQ==
X-CSE-MsgGUID: hTWK5M/GQE+t+bmAb9HBtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="244312882"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 17 May 2026 23:28:53 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOrT8-000000009k9-41jr;
	Mon, 18 May 2026 06:28:50 +0000
Date: Mon, 18 May 2026 08:28:05 +0200
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Andr=C3=A9?= Almeida" <andrealmeid@igalia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>, Bhupesh <bhupesh@igalia.com>
Subject: net/netfilter/nf_tables_api.c:9714:46: error: incompatible
 integer to pointer conversion passing 'ssize_t' (aka 'long') to parameter of
 type 'const char *'
Message-ID: <202605180818.g37TDTit-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/sched-Update-get_task_comm-comment/20260518-023906
head:   1b9c135d84ae615e18ef6eeb3d7a0a37b52cd016
commit: f07f318df7d38648966bfebdc5643ba0bcc531b5 treewide: Get rid of get_task_comm()
date:   12 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260518/202605180818.g37TDTit-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605180818.g37TDTit-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605180818.g37TDTit-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/netfilter/nf_tables_api.c:9714:46: error: incompatible integer to pointer conversion passing 'ssize_t' (aka 'long') to parameter of type 'const char *' [-Wint-conversion]
    9714 |             nla_put_string(skb, NFTA_GEN_PROC_NAME, strscpy_pad(buf, current->comm)))
         |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/string.h:149:2: note: expanded from macro 'strscpy_pad'
     149 |         CONCATENATE(__strscpy_pad, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^
   include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   <scratch space>:19:1: note: expanded from here
      19 | __strscpy_pad0
         | ^
   include/linux/string.h:86:2: note: expanded from macro '__strscpy_pad0'
      86 |         sized_strscpy_pad(dst, src, sizeof(dst) + __must_be_array(dst) +        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      87 |                                     __must_be_cstr(dst) + __must_be_cstr(src))
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/string.h:116:45: note: expanded from macro 'sized_strscpy_pad'
     116 | #define sized_strscpy_pad(dest, src, count)     ({                      \
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
     117 |         char *__dst = (dest);                                           \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     118 |         const char *__src = (src);                                      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     119 |         const size_t __count = (count);                                 \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     120 |         ssize_t __wrote;                                                \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     121 |                                                                         \
         |                                                                         ~
     122 |         __wrote = sized_strscpy(__dst, __src, __count);                 \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     123 |         if (__wrote >= 0 && __wrote < __count)                          \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     124 |                 memset(__dst + __wrote + 1, 0, __count - __wrote - 1);  \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     125 |         __wrote;                                                        \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     126 | })
         | ~~
   include/net/netlink.h:1655:18: note: passing argument to parameter 'str' here
    1655 |                                  const char *str)
         |                                              ^
   1 error generated.


vim +9714 net/netfilter/nf_tables_api.c

  9699	
  9700	static int nf_tables_fill_gen_info(struct sk_buff *skb, struct net *net,
  9701					   u32 portid, u32 seq)
  9702	{
  9703		struct nlmsghdr *nlh;
  9704		char buf[TASK_COMM_LEN];
  9705		int event = nfnl_msg_type(NFNL_SUBSYS_NFTABLES, NFT_MSG_NEWGEN);
  9706	
  9707		nlh = nfnl_msg_put(skb, portid, seq, event, 0, AF_UNSPEC,
  9708				   NFNETLINK_V0, nft_base_seq_be16(net));
  9709		if (!nlh)
  9710			goto nla_put_failure;
  9711	
  9712		if (nla_put_be32(skb, NFTA_GEN_ID, htonl(nft_base_seq(net))) ||
  9713		    nla_put_be32(skb, NFTA_GEN_PROC_PID, htonl(task_pid_nr(current))) ||
> 9714		    nla_put_string(skb, NFTA_GEN_PROC_NAME, strscpy_pad(buf, current->comm)))
  9715			goto nla_put_failure;
  9716	
  9717		nlmsg_end(skb, nlh);
  9718		return 0;
  9719	
  9720	nla_put_failure:
  9721		nlmsg_trim(skb, nlh);
  9722		return -EMSGSIZE;
  9723	}
  9724	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
