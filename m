Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A532192D62;
	Sun, 20 Oct 2024 15:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729439156; cv=none; b=p5vGkiR4cAYcBRrKKifPINwPePnXrE8evWhjxqL/VBMWIwKYMqdtQA2UanTdtwS1SQ2sZveovkz5zX3WOVTcmEYLsHGDXDrWsNkztOm0S83MEOtt6+K2SJXRvsQYi2jeHsbod67XoRmTPT/aooGFlFoUbFiilLHs+gAVTkeAq0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729439156; c=relaxed/simple;
	bh=oBSxvVCQvuOFWJb29jBKcsRLEA1gUiTx+t48UEYafKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ffJieP7LLTk2VJeQDc2p56/3dVIq/yefb2qrvcfvvkBa1LnmfriutxRAdZYPAq4gUD9egT6XijJLcmZz3AMkSFMYzgoNtFT5WB/nYk3p678UgSRMEmkXA+EU9Fz9KoSmtPXOPKpgORlqwDHzCFDxb57YuRkxUdYYqYB2ney1cAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=npZ+zrDk; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="npZ+zrDk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729439154; x=1760975154;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oBSxvVCQvuOFWJb29jBKcsRLEA1gUiTx+t48UEYafKA=;
  b=npZ+zrDkBCFU4+8dH4KMH1RAYMprzUr0em07teL6o4bf7R9Bnbei0m9z
   5x3cAGgV2f+Qx7rCJ4m8voiW1rHfIxS1rGXzwNx/GT4L0jTSplOTfKXLr
   xbekweluirzL7Qu+GHwwRwYNAS22KXX0bWKx+l84XH5Rju5wRbuGRZScz
   MqxbCB5o8xaSC+tcO7LRirmjvtS8Rak4GU8vJFeMRWQqmT3Mo+8E7+jb5
   y4vDkvj+/XLDIF48zIok/fupqUyfbxTTpLApqZy3xWbBxt8iIFOIAaaS7
   SNxpGs0HBkclcKSeGNPfmXIxhBDY1B8EBepIsgV+9EgXJ1/qFo+rSLWZs
   A==;
X-CSE-ConnectionGUID: n/KOG51QSPOayFag3RuSUw==
X-CSE-MsgGUID: pHJs5gF7SFKoI/qOOE/x3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46385029"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46385029"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 08:45:50 -0700
X-CSE-ConnectionGUID: IU+8m1tRSQSStK6A6hNJuQ==
X-CSE-MsgGUID: yjvybfZ9SlGfWQEBGS8uFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="110061710"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Oct 2024 08:45:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2Y7n-000QQF-0u;
	Sun, 20 Oct 2024 15:45:47 +0000
Date: Sun, 20 Oct 2024 23:45:02 +0800
From: kernel test robot <lkp@intel.com>
To: Mikhail Ivanov <ivanov.mikhail1@huawei-partners.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 3/8] landlock: Fix inconsistency of errors for TCP
 actions
Message-ID: <202410202353.RF5ZJUXV-lkp@intel.com>
References: <20241017110454.265818-4-ivanov.mikhail1@huawei-partners.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017110454.265818-4-ivanov.mikhail1@huawei-partners.com>

Hi Mikhail,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on fe76bd133024aaef12d12a7d58fa3e8d138d3bf3]

url:    https://github.com/intel-lab-lkp/linux/commits/Mikhail-Ivanov/landlock-Fix-non-TCP-sockets-restriction/20241017-190842
base:   fe76bd133024aaef12d12a7d58fa3e8d138d3bf3
patch link:    https://lore.kernel.org/r/20241017110454.265818-4-ivanov.mikhail1%40huawei-partners.com
patch subject: [RFC PATCH v2 3/8] landlock: Fix inconsistency of errors for TCP actions
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241020/202410202353.RF5ZJUXV-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410202353.RF5ZJUXV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410202353.RF5ZJUXV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/landlock/net.c:94:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
      94 |                 const struct sockaddr_in *const addr =
         |                 ^
   1 warning generated.


vim +94 security/landlock/net.c

    72	
    73	/*
    74	 * Checks that TCP @sock and @address attributes are correct for bind(2).
    75	 *
    76	 * On success, extracts port from @address in @port and returns 0.
    77	 *
    78	 * This validation is consistent with network stack and returns the error
    79	 * in the order corresponding to the order of errors from the network stack.
    80	 * It's required to not wrongfully return -EACCES instead of meaningful network
    81	 * stack level errors. Consistency is tested with kselftest.
    82	 *
    83	 * This helper does not provide consistency of error codes for BPF filter
    84	 * (if any).
    85	 */
    86	static int
    87	check_tcp_bind_consistency_and_get_port(struct socket *const sock,
    88						struct sockaddr *const address,
    89						const int addrlen, __be16 *port)
    90	{
    91		/* IPV6_ADDRFORM can change sk->sk_family under us. */
    92		switch (READ_ONCE(sock->sk->sk_family)) {
    93		case AF_INET:
  > 94			const struct sockaddr_in *const addr =
    95				(struct sockaddr_in *)address;
    96	
    97			/* Cf. inet_bind_sk(). */
    98			if (addrlen < sizeof(struct sockaddr_in))
    99				return -EINVAL;
   100			/*
   101			 * For compatibility reason, accept AF_UNSPEC for bind
   102			 * accesses (mapped to AF_INET) only if the address is
   103			 * INADDR_ANY (cf. __inet_bind).
   104			 */
   105			if (addr->sin_family != AF_INET) {
   106				if (addr->sin_family != AF_UNSPEC ||
   107				    addr->sin_addr.s_addr != htonl(INADDR_ANY))
   108					return -EAFNOSUPPORT;
   109			}
   110			*port = ((struct sockaddr_in *)address)->sin_port;
   111			break;
   112	#if IS_ENABLED(CONFIG_IPV6)
   113		case AF_INET6:
   114			/* Cf. inet6_bind_sk(). */
   115			if (addrlen < SIN6_LEN_RFC2133)
   116				return -EINVAL;
   117			/* Cf. __inet6_bind(). */
   118			if (address->sa_family != AF_INET6)
   119				return -EAFNOSUPPORT;
   120			*port = ((struct sockaddr_in6 *)address)->sin6_port;
   121			break;
   122	#endif /* IS_ENABLED(CONFIG_IPV6) */
   123		default:
   124			WARN_ON_ONCE(0);
   125			return -EACCES;
   126		}
   127		return 0;
   128	}
   129	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
