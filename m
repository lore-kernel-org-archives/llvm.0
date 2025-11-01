Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654A826ED5E;
	Sat,  1 Nov 2025 06:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761977386; cv=none; b=lBy4bQwktyFcPE7dB4CkoRzt4ICywe2i82bt4mYNVCNH3b7iMzlHLbCwE4g5KK7oxpxsE9YqgO0ul62ZYnPJmPaLbagzDBDipwLUfWBNnIGtg3AHKlS29wCrmkBmZjHu4KBXMilfYBMetw/q1N1T8OTDDEN8fRcwKoGsq7u6mFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761977386; c=relaxed/simple;
	bh=bqaEm8qkzluJFcj5K3U/O86yPhUXk6DJ/URd+gKLwj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=St4+FrmqpwxTavQvkM56nxSc9dtB4jCj1yP6EKfAVEoZoaz44Ann8ThVglpA91HHcoiggOvhHr5NvprBuae85y11oWAW0rXwsnmHq+Q3GVGhH8fE7drpZ/HiHrWd/0OBPwiiwbrtvefTO3bINaUKzFfSeZfDu2Wxs9+RXTcRzKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JUcyfbV7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JUcyfbV7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761977385; x=1793513385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bqaEm8qkzluJFcj5K3U/O86yPhUXk6DJ/URd+gKLwj4=;
  b=JUcyfbV79jYfMKspc7xJUlkCJStYXLJCKIIip7fXkdHvzFT50FLjE4js
   5Ex5eXG6Xq/Y34Bxbu+hDvV5lOJXBM03ko4/CVlReH6DprL2Zk8QHFDXk
   /R3EQnpsICJm9pizAfE+rgZ1Xcf/YTtUJ5beETIuYcP58WE/3av404iV9
   E3lPO11OVStXk2vXe+7swNtuhmPk5NDxOapYHHggkQuFT6aoUZ6pZx4tA
   8KnOTnhdayLcQx0P+68l2Q/jI2lMFP6ZmO+2j3jh2bj/svS6nd5hQxCvP
   vXvUdEUnWLGy/KAEPZWcSvMAZ1OOcsPkexyQtND55cxFMpC0jVGW3sgtQ
   w==;
X-CSE-ConnectionGUID: X+r9rqOPSuGmijk/wQ9wpQ==
X-CSE-MsgGUID: m3PyW9N6SWutUVdBlL0E9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="74428880"
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="74428880"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 23:09:28 -0700
X-CSE-ConnectionGUID: +Sz5wqAaQ+Gea1s6q3fWlQ==
X-CSE-MsgGUID: YBxcoucjQX6pgDdGU9bSrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="186282191"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 31 Oct 2025 23:09:24 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF4ni-000NxA-0W;
	Sat, 01 Nov 2025 06:09:22 +0000
Date: Sat, 1 Nov 2025 14:08:35 +0800
From: kernel test robot <lkp@intel.com>
To: Ricardo Robaina <rrobaina@redhat.com>, audit@vger.kernel.org,
	linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	paul@paul-moore.com, eparis@redhat.com, fw@strlen.de,
	pablo@netfilter.org, kadlec@netfilter.org,
	Ricardo Robaina <rrobaina@redhat.com>
Subject: Re: [PATCH v4 1/2] audit: add audit_log_packet_ip4 and
 audit_log_packet_ip6 helper functions
Message-ID: <202511011350.ye4VgG6l-lkp@intel.com>
References: <cfafc5247fbfcd2561de16bcff67c1afd5676c9e.1761918165.git.rrobaina@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfafc5247fbfcd2561de16bcff67c1afd5676c9e.1761918165.git.rrobaina@redhat.com>

Hi Ricardo,

kernel test robot noticed the following build errors:

[auto build test ERROR on pcmoore-audit/next]
[also build test ERROR on netfilter-nf/main linus/master v6.18-rc3 next-20251031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ricardo-Robaina/audit-add-audit_log_packet_ip4-and-audit_log_packet_ip6-helper-functions/20251031-220605
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git next
patch link:    https://lore.kernel.org/r/cfafc5247fbfcd2561de16bcff67c1afd5676c9e.1761918165.git.rrobaina%40redhat.com
patch subject: [PATCH v4 1/2] audit: add audit_log_packet_ip4 and audit_log_packet_ip6 helper functions
config: s390-randconfig-002-20251101 (https://download.01.org/0day-ci/archive/20251101/202511011350.ye4VgG6l-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project be2081d9457ed095c4a6ebe2a920f0f7b76369c6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511011350.ye4VgG6l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511011350.ye4VgG6l-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/netfilter/nft_log.c:48:10: error: call to undeclared function 'audit_log_packet_ip4'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      48 |                         fam = audit_log_packet_ip4(ab, skb) ? NFPROTO_IPV4 : -1;
         |                               ^
>> net/netfilter/nft_log.c:51:10: error: call to undeclared function 'audit_log_packet_ip6'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      51 |                         fam = audit_log_packet_ip6(ab, skb) ? NFPROTO_IPV6 : -1;
         |                               ^
   net/netfilter/nft_log.c:56:9: error: call to undeclared function 'audit_log_packet_ip4'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      56 |                 fam = audit_log_packet_ip4(ab, skb) ? NFPROTO_IPV4 : -1;
         |                       ^
   net/netfilter/nft_log.c:59:9: error: call to undeclared function 'audit_log_packet_ip6'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      59 |                 fam = audit_log_packet_ip6(ab, skb) ? NFPROTO_IPV6 : -1;
         |                       ^
   4 errors generated.


vim +/audit_log_packet_ip4 +48 net/netfilter/nft_log.c

    28	
    29	static void nft_log_eval_audit(const struct nft_pktinfo *pkt)
    30	{
    31		struct sk_buff *skb = pkt->skb;
    32		struct audit_buffer *ab;
    33		int fam = -1;
    34	
    35		if (!audit_enabled)
    36			return;
    37	
    38		ab = audit_log_start(NULL, GFP_ATOMIC, AUDIT_NETFILTER_PKT);
    39		if (!ab)
    40			return;
    41	
    42		audit_log_format(ab, "mark=%#x", skb->mark);
    43	
    44		switch (nft_pf(pkt)) {
    45		case NFPROTO_BRIDGE:
    46			switch (eth_hdr(skb)->h_proto) {
    47			case htons(ETH_P_IP):
  > 48				fam = audit_log_packet_ip4(ab, skb) ? NFPROTO_IPV4 : -1;
    49				break;
    50			case htons(ETH_P_IPV6):
  > 51				fam = audit_log_packet_ip6(ab, skb) ? NFPROTO_IPV6 : -1;
    52				break;
    53			}
    54			break;
    55		case NFPROTO_IPV4:
    56			fam = audit_log_packet_ip4(ab, skb) ? NFPROTO_IPV4 : -1;
    57			break;
    58		case NFPROTO_IPV6:
    59			fam = audit_log_packet_ip6(ab, skb) ? NFPROTO_IPV6 : -1;
    60			break;
    61		}
    62	
    63		if (fam == -1)
    64			audit_log_format(ab, " saddr=? daddr=? proto=-1");
    65	
    66		audit_log_end(ab);
    67	}
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
