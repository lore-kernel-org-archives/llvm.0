Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BCA2DE6FF;
	Mon, 25 May 2026 19:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779739166; cv=none; b=R9kgnVe7lomTZR/DK3ptq+CzSPMLErvi0xroGiKPWC4xlqp9/z+qOCjjX1VMkH1dcK8c4SZ5J2UI/SAeBv2lK8pKmZjMlqTIXPAOck7CicNqqFIGuZon1TPcM/sBps3mZ+fXJiTLH9dnf6EpCYzNpza3lZnNUx0T6OqiGng6p1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779739166; c=relaxed/simple;
	bh=YN78vf8+41suap17viVNSe54cvyCYZejAjYdkDMzsE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SRqDnU5FUxuQiIBI3sMFfED5qXV4iJ8rsweHyEYD30JyvamEWYLwoZQtIWd0mRlWxMdLi+HzXsSIRuIdWizhWtcBObxW1jmDeDMjdzclIqhuPvw9dQzm/oEKSVsYoALh2PdBtvWM4jfEsxda8Cfh4jXZ+8yMJMZg6FnBmlJWM0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/kp6wh/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/kp6wh/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779739165; x=1811275165;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YN78vf8+41suap17viVNSe54cvyCYZejAjYdkDMzsE8=;
  b=i/kp6wh/Jzi2a3WPaPHyov3QjOjC0UPEy4EFCrHAbiutpBcevtvG1G0V
   Gc9aYcXXx/+9IKfxX5OTcDqvhjXqfoCJoXAKkn3T9nf9Or9Pni9X4PUP8
   y19pVxY3509dS+YrpOLKBNzbTfIoNe8tnR7wCWHfRlSNXn8NKEFC9vYk3
   +qxR1cRZUdC6M4ExfT5JwLeMAQyS8g5L+VNULr+Z85gbDoDNtI9ynl7To
   zgIt3daZt3gskTBP1k5nA+UGDhsl3Mxito5CmXnO3JC3MUOh37kBESqu3
   lDSbCxBCqckOYohsLlh+DpeLwMT/X8irtZ7WmIH0JDfWtHek8Q4IX+IaN
   Q==;
X-CSE-ConnectionGUID: jUE/P/02SOyVGpaintwJLw==
X-CSE-MsgGUID: K49T1Pd4TWK+uIL7dJQybg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80744703"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="80744703"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 12:59:25 -0700
X-CSE-ConnectionGUID: BeO12+0TRIC4UOErPJW5vg==
X-CSE-MsgGUID: CQ5CodBjRsyC0Zym5/AbZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="245977964"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 May 2026 12:59:23 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRbSK-000000001mM-2rX7;
	Mon, 25 May 2026 19:59:20 +0000
Date: Tue, 26 May 2026 03:58:30 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <cel@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] SUNRPC: Reject short RFC 4121 MIC tokens in
 gss_krb5_verify_mic_v2
Message-ID: <202605260319.m5jggKFF-lkp@intel.com>
References: <20260523165237.510204-1-cel@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523165237.510204-1-cel@kernel.org>

Hi Chuck,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on trondmy-nfs/linux-next]
[also build test ERROR on linus/master v7.1-rc5 next-20260525]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuck-Lever/SUNRPC-Reject-short-RFC-4121-MIC-tokens-in-gss_krb5_verify_mic_v2/20260524-005345
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20260523165237.510204-1-cel%40kernel.org
patch subject: [PATCH] SUNRPC: Reject short RFC 4121 MIC tokens in gss_krb5_verify_mic_v2
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260526/202605260319.m5jggKFF-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605260319.m5jggKFF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605260319.m5jggKFF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/sunrpc/auth_gss/gss_krb5_unseal.c:89:47: error: use of undeclared identifier 'cksum_len'
      89 |         if (read_token->len < GSS_KRB5_TOK_HDR_LEN + cksum_len)
         |                                                      ^
   1 error generated.


vim +/cksum_len +89 net/sunrpc/auth_gss/gss_krb5_unseal.c

    69	
    70	u32
    71	gss_krb5_verify_mic_v2(struct krb5_ctx *ctx, struct xdr_buf *message_buffer,
    72			       struct xdr_netobj *read_token)
    73	{
    74		struct crypto_ahash *tfm = ctx->initiate ?
    75					   ctx->acceptor_sign : ctx->initiator_sign;
    76		char cksumdata[GSS_KRB5_MAX_CKSUM_LEN];
    77		struct xdr_netobj cksumobj = {
    78			.len	= ctx->gk5e->cksumlength,
    79			.data	= cksumdata,
    80		};
    81		u8 *ptr = read_token->data;
    82		__be16 be16_ptr;
    83		time64_t now;
    84		u8 flags;
    85		int i;
    86	
    87		dprintk("RPC:       %s\n", __func__);
    88	
  > 89		if (read_token->len < GSS_KRB5_TOK_HDR_LEN + cksum_len)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
