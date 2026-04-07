Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B793A9D8B;
	Tue,  7 Apr 2026 10:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558369; cv=none; b=brTJjjGvzex3SSP0Phct5ngH8BevRrmD/hY/XNjw/LYIflxUdXvIDQoHMBD6ePr/c6oBjlGQCAxMuvv59UOYVqJ1Fq/rki44mrDk4sa+X0Cd4zkjr1Kmb2uFLKMSgi7YPR9Royremh8Nzc0VtJNVgaurPhstNZ9edT/bwV+TphU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558369; c=relaxed/simple;
	bh=r10VBvcXoM3Z4eQBWU/o9X8JVvhzleGLD98YRMI0yKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YZBmdUXrafqFr9Bdbc365rKTdTrYrxgGjxKxW1ux6owUFXhrygCBKJO6NrS+Ni+lE28idc7knHT13CmdV6NX4JVphWf3+6RQVMfbe6vR3OWVxn1ZQ3Ofy3Misr6LcsaoJAeyIqohQanlnvoc/KaMQoORRNMLaAempzgJYfFmuLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZVXl1gaE; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZVXl1gaE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775558368; x=1807094368;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r10VBvcXoM3Z4eQBWU/o9X8JVvhzleGLD98YRMI0yKw=;
  b=ZVXl1gaEPAPeBK7NyXDrY5Os9aiW+yxuPXhakgYR70z7iDkqWdsftT8T
   f9YA6YC5kxEOF/ErrQb23WjNm/jWh3++lxOn1zET6Cl+am3apXWx10Nmt
   70CINkfSTqDyQLVI4F5LMtwCecKFIl4Zh1f1Xb5F0ueLRtOP0A2bxvtID
   XPV4VN8DVrJWFDK9js8GVWkD1KQ8zFJ3oMa1py1OTacwWjZvUTc4FRhn7
   XLELMFDR0razmPt5uoGxcTwT3G/Rf+j2zxXhD++yy2jmnTC8U41TGvASj
   lKCNSNTvlFwHSxQKV8kj3D2ydLw+QEkoGagreWM9xwW+FYQwL7wcNIDfG
   Q==;
X-CSE-ConnectionGUID: SJV5ILWFRgCDHn6iFDiAkg==
X-CSE-MsgGUID: 3TEEoFeXSm2uUfeAfoivig==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="94098384"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="94098384"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 03:39:28 -0700
X-CSE-ConnectionGUID: 8qZIApI1QCSNvqiYkzcIAw==
X-CSE-MsgGUID: nWMeLn2zQW6R8ABdGEZsNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="228405589"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Apr 2026 03:39:23 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wA3q3-000000000Tp-494i;
	Tue, 07 Apr 2026 10:39:19 +0000
Date: Tue, 7 Apr 2026 18:38:32 +0800
From: kernel test robot <lkp@intel.com>
To: Yingnan Zhang <342144303@qq.com>, horms@verge.net.au, ja@ssi.bg
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	pablo@netfilter.org, fw@strlen.de, phil@nwl.cc, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	netdev@vger.kernel.org, lvs-devel@vger.kernel.org,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	linux-kernel@vger.kernel.org, Yingnan Zhang <342144303@qq.com>
Subject: Re: [PATCH net v2] ipvs: fix MTU check for GSO packets in tunnel mode
Message-ID: <202604071825.Sh4Y1fMi-lkp@intel.com>
References: <tencent_CA2C1C219C99D315086BE55E8654AF7E6009@qq.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_CA2C1C219C99D315086BE55E8654AF7E6009@qq.com>

Hi Yingnan,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Yingnan-Zhang/ipvs-fix-MTU-check-for-GSO-packets-in-tunnel-mode/20260407-141549
base:   net/main
patch link:    https://lore.kernel.org/r/tencent_CA2C1C219C99D315086BE55E8654AF7E6009%40qq.com
patch subject: [PATCH net v2] ipvs: fix MTU check for GSO packets in tunnel mode
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260407/202604071825.Sh4Y1fMi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604071825.Sh4Y1fMi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604071825.Sh4Y1fMi-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> net/netfilter/ipvs/ip_vs_xmit.c:115:2: warning: non-void function does not return a value in all control paths [-Wreturn-type]
     115 |         } else if (skb->len > mtu &&
         |         ^
>> net/netfilter/ipvs/ip_vs_xmit.c:115:4: error: expected identifier or '('
     115 |         } else if (skb->len > mtu &&
         |           ^
   net/netfilter/ipvs/ip_vs_xmit.c:119:2: error: expected identifier or '('
     119 |         return false;
         |         ^
>> net/netfilter/ipvs/ip_vs_xmit.c:120:1: error: extraneous closing brace ('}')
     120 | }
         | ^
   1 warning and 3 errors generated.


vim +115 net/netfilter/ipvs/ip_vs_xmit.c

   104	
   105	static inline bool
   106	__mtu_check_toobig_v6(const struct sk_buff *skb, u32 mtu)
   107	{
   108		if (IP6CB(skb)->frag_max_size) {
   109			/* frag_max_size tell us that, this packet have been
   110			 * defragmented by netfilter IPv6 conntrack module.
   111			 */
   112			if (IP6CB(skb)->frag_max_size > mtu)
   113				return true; /* largest fragment violate MTU */
   114		}
 > 115		} else if (skb->len > mtu &&
   116			   !(skb_is_gso(skb) && skb_gso_validate_network_len(skb, mtu))) {
   117			return true; /* Packet size violate MTU size */
   118		}
   119		return false;
 > 120	}
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
