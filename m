Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1183B377555;
	Tue, 21 Apr 2026 16:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776788667; cv=none; b=FuBPogrM5u2cH+ZH9uYbTd0tiRzCFoSY/MuFwsyDlsRVMfi3271xMOE3iSfCDTRwmwEnwj2rlLR5adbX6aasfrSzenu06d7w85A6RU+bE6tH1n3CojbIrQnAxpIn9ad4JPhuhI1E2WERbggukhu2GtncbjwHPqs1618OIsio9sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776788667; c=relaxed/simple;
	bh=nQunemQjmq7J3pbxI2AqF1xIeNDWFBx1/5BRlXisaCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNJJ/yLW4IvlclaqyXadnBpK/MBpjn/JCI/Isg1P/gO085uWSA6laZ6J0KAnTevTZpf3XM6pv+QJCRMEYWUy6NXkiokb6+JAgt+YwJe8pgwZccNaXAYnQIsyrY25lcDl6X544/6GiH7wP8o9tY5Dvb1Uiu7V86kRb8ofOlCbJIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ms2WS/RP; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ms2WS/RP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776788666; x=1808324666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nQunemQjmq7J3pbxI2AqF1xIeNDWFBx1/5BRlXisaCw=;
  b=ms2WS/RP2gHPwjm4T+J5FzdqbCd4BpkFwyHTE4aeMadk8c9U5Kc3dINO
   UbPmdR0j87Cl77HBoQWvdM3B5BezDi1U9eqg+oP64Dh5m+0i/ML/L/ZLC
   Z/bl8C3DfSvvlZKHLfxokHKCkfsaWzdt1jGekl8w674qoawa7P+5jOA1g
   M1TPD2kyY7bf9lWcLL8nQH1alvIkN8CwP6JXi3+414SNPgLkeYV0mMeDo
   azN59N1216fksHMda7RBKr0rpWyjDdT87m818SdO0KIyyB7APeSmtNmQI
   798fdZelEaJIBsQbHlTvp+nyF5BfGzUTRQPi2+xQokCUhce6uj9GdxDIi
   w==;
X-CSE-ConnectionGUID: cRU4YJXURSu9JIxQ2N8foA==
X-CSE-MsgGUID: hU5PFTD1TyuMynoEruw8wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="88427198"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="88427198"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 09:24:24 -0700
X-CSE-ConnectionGUID: owCl++O5Q26diS7PURbSEQ==
X-CSE-MsgGUID: QxmqOUo2RwujnCUiyc/PeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="237059148"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Apr 2026 09:24:22 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFDtb-000000003ki-34Tq;
	Tue, 21 Apr 2026 16:24:19 +0000
Date: Wed, 22 Apr 2026 00:24:07 +0800
From: kernel test robot <lkp@intel.com>
To: Marino Dzalto <marino.dzalto@gmail.com>, pablo@netfilter.org,
	fw@strlen.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Marino Dzalto <marino.dzalto@gmail.com>
Subject: Re: [PATCH] netfilter: xt_HL: add pr_fmt, default case and NULL
 checks
Message-ID: <202604220024.iITt6Hv8-lkp@intel.com>
References: <20260403193929.89449-1-marino.dzalto@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403193929.89449-1-marino.dzalto@gmail.com>

Hi Marino,

kernel test robot noticed the following build errors:

[auto build test ERROR on netfilter-nf/main]
[also build test ERROR on linus/master v7.0 next-20260420]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marino-Dzalto/netfilter-xt_HL-add-pr_fmt-default-case-and-NULL-checks/20260420-185652
base:   https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git main
patch link:    https://lore.kernel.org/r/20260403193929.89449-1-marino.dzalto%40gmail.com
patch subject: [PATCH] netfilter: xt_HL: add pr_fmt, default case and NULL checks
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260422/202604220024.iITt6Hv8-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260422/202604220024.iITt6Hv8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604220024.iITt6Hv8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/netfilter/xt_hl.c:34:6: error: cannot assign to variable 'ttl' with const-qualified type 'const u8' (aka 'const unsigned char')
      34 |         ttl = ip_hdr(skb)->ttl;
         |         ~~~ ^
   net/netfilter/xt_hl.c:29:11: note: variable 'ttl' declared const here
      29 |         const u8 ttl;
         |         ~~~~~~~~~^~~
   1 error generated.


vim +34 net/netfilter/xt_hl.c

    25	
    26	static bool ttl_mt(const struct sk_buff *skb, struct xt_action_param *par)
    27	{
    28		const struct ipt_ttl_info *info = par->matchinfo;
    29		const u8 ttl;
    30	
    31		if (!skb)
    32			return false;
    33	
  > 34		ttl = ip_hdr(skb)->ttl;
    35	
    36		switch (info->mode) {
    37		case IPT_TTL_EQ:
    38			return ttl == info->ttl;
    39		case IPT_TTL_NE:
    40			return ttl != info->ttl;
    41		case IPT_TTL_LT:
    42			return ttl < info->ttl;
    43		case IPT_TTL_GT:
    44			return ttl > info->ttl;
    45		default:
    46			pr_warn("Unknown TTL match mode: %d\n", info->mode);
    47			return false;
    48		}
    49	}
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
