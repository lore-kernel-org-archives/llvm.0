Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F3138B13E;
	Tue, 31 Mar 2026 18:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774982982; cv=none; b=buWWb1z3w8eW1FJEr3HWP4pVTcOpbkSSCqt/JtgArb6AdcxhwgsBhzRgMF+vymPJ/pQfTeCzbGkF+XBSlomajnWbbCsJPgZgDT5vcsm4lMXoMTG5bkFYfl0f8sd222q1hcNZB7aaKDHnuDcwyrhQeZo/pxvgP3LI9X05JHw/AYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774982982; c=relaxed/simple;
	bh=5SKQoGxZ2Np4n4qJpn+lEqUim0Gn5U2UIHOvwizikpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7Jrlf3MI2VWnCQAa3vjWMEjqOKZa/t+p8S4LCfXYPqiA62Dq/Qw7SCgIbeRArCI4WMqPxKjyWr/lRrj8unUpYYFFj+tDIckwuW7xSZLCL0uQ1gel+8cf5eTaWN3OjdFV+5uZwoaOlt2FjG4neMtsPT1dfpSN6a+PStX0LBSwgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AHl1JZCv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AHl1JZCv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774982981; x=1806518981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5SKQoGxZ2Np4n4qJpn+lEqUim0Gn5U2UIHOvwizikpo=;
  b=AHl1JZCvkPXv7avgx6mTLL/t2PvjQOVLHstgs88GfI8Q0uCEIUfEUBfx
   Kzmn9hIYO3iNWOsV+okpFCB8iundkNQw+ypvkD5Bcb88biEpz6rbfDUdt
   XCaSBaEp+9AcY/R0v+dFhTHgETRY5tLXH5JxpfWhpqOFYZwXSCz9ktjvb
   ZEDXvxiKdnlIqqJK/TM00Zu4gB4cdUPMbCLEkeK8eVK3CW+m+Vp6+IkQa
   j2q8FRwqGml7sfSEB8j4Ho6ork4e0mzp5Tu+bg2S0vbSfUnXUYLiFm4iE
   6bvq62iXZJSsT7OxOFNmmvP/EnKTjkziWNw+inHKl99PTYK1lbtXCDS8i
   w==;
X-CSE-ConnectionGUID: 1CjitYiZTbKXBEMvAU5EMw==
X-CSE-MsgGUID: 2znftap+RZSwDDvQsDfVyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76122469"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="76122469"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 11:49:41 -0700
X-CSE-ConnectionGUID: E6a592iPSS6kQGrB5r9dKw==
X-CSE-MsgGUID: bbo3wJeKT3yDy1GiktAoXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="230882169"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 Mar 2026 11:49:37 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7e9e-0000000049R-3eTN;
	Tue, 31 Mar 2026 18:49:34 +0000
Date: Wed, 1 Apr 2026 02:49:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Rife <jrife@google.com>, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jordan Rife <jrife@google.com>, bpf@vger.kernel.org,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Andrii Nakryiko <andrii@kernel.org>,
	Yusuke Suzuki <yusuke.suzuki@isovalent.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: Re: [PATCH net-next v3 2/4] udp: Remove disconnected sockets from
 the 4-tuple hash
Message-ID: <202604010240.xuggtnr1-lkp@intel.com>
References: <20260330215707.2374657-3-jrife@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330215707.2374657-3-jrife@google.com>

Hi Jordan,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jordan-Rife/udp-Only-compare-daddr-dport-when-sk_state-TCP_ESTABLISHED/20260331-082300
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260330215707.2374657-3-jrife%40google.com
patch subject: [PATCH net-next v3 2/4] udp: Remove disconnected sockets from the 4-tuple hash
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260401/202604010240.xuggtnr1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010240.xuggtnr1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010240.xuggtnr1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/ipv4/udp.c:2182:31: error: call to undeclared function 'udp_get_table_prot'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2182 |         struct udp_table *udptable = udp_get_table_prot(sk);
         |                                      ^
   net/ipv4/udp.c:2182:31: note: did you mean 'vm_get_page_prot'?
   include/linux/mm.h:4105:10: note: 'vm_get_page_prot' declared here
    4105 | pgprot_t vm_get_page_prot(vm_flags_t vm_flags);
         |          ^
>> net/ipv4/udp.c:2182:20: error: incompatible integer to pointer conversion initializing 'struct udp_table *' with an expression of type 'int' [-Wint-conversion]
    2182 |         struct udp_table *udptable = udp_get_table_prot(sk);
         |                           ^          ~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/udp_get_table_prot +2182 net/ipv4/udp.c

  2179	
  2180	static int udp_disconnect_unhash4(struct sock *sk, int flags)
  2181	{
> 2182		struct udp_table *udptable = udp_get_table_prot(sk);
  2183	
  2184		udp_unhash4(udptable, sk);
  2185		__udp_disconnect(sk, flags);
  2186	
  2187		return 0;
  2188	}
  2189	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
