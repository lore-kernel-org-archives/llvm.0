Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAB61459FD;
	Fri,  6 Sep 2024 09:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725614583; cv=none; b=UxnJYnwqn3ms6G1YOQ1UtpF0Cvb6unic2thpI5OzPNmRF0VbBkxfPkhxj+2MvWXNrmqKPGN1oduf62Bwt0lpU6z8WtUXKtkHEToibMdcHvxh4bH7tb2P6KAlTMv/rgdNTdLnFUgSsqN3iCL0hwFF/h/Ck7/uVbtxVus4bn6n3lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725614583; c=relaxed/simple;
	bh=JR3mQVUBRcTsb6WCjCw0cgd9BkJ1RqTbb1N3pRmCnbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QSPwClKDOANHUEGQzkCVt0yd7TkAWOhu+oORdigy7a1Bb8v9grgsLzxRPAxu5oLzFGtTnQcXnO7VTY3j7b7xbzY1Z6YeWtfm65YmzJGF/9tqfeJP3ggSmxJK3RJ/3Jj6TxCbfVOY6OApYUpFeh+f141YsEw/GFpzJRFNfnWLWJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VQex7TrO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VQex7TrO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725614581; x=1757150581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JR3mQVUBRcTsb6WCjCw0cgd9BkJ1RqTbb1N3pRmCnbQ=;
  b=VQex7TrOFyIa4JuVlnTXhs/OEax8s2OxFZpMWQjmLYy1NmViizSJd7Iq
   83j9J/JoQAEo/bghy/zoYLLAAZDF/F9HZr8Fb2cm2vmcBGd0wsWLxfcFz
   Gd+g8t6x8NVucwNLKIUrDdrQedabtvA2pKEtc1DyGIwpASnWeUPpN3MKk
   9PRELuiMq1DiyQziktJIoaokdIwhFTt3JQy6juraa6UkfbefuFF1ZdGob
   pN3C+cirg62KzjiDqTB4HvItwCL/kG9QIbdkFFyX2L/gqqDpoZirW4rpV
   t8jjfEMy9rtRm1G8WHw6eCA7PXMMvPh/yVVH6IrCOj0Jz6gC8WMWEp1aY
   A==;
X-CSE-ConnectionGUID: Rq5Sr1T5TICFLIdw7bhmeQ==
X-CSE-MsgGUID: 8ckgUamyTUeqmf3e0hLueg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="13407092"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="13407092"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 02:23:00 -0700
X-CSE-ConnectionGUID: 6SicCxJ2T86hyJOkMLAGNQ==
X-CSE-MsgGUID: qTEErkvJQkCltP1VIYzU+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="65887220"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Sep 2024 02:22:58 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smVB9-000Auj-0v;
	Fri, 06 Sep 2024 09:22:55 +0000
Date: Fri, 6 Sep 2024 17:22:28 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Fedorenko <vadfed@meta.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Willem de Bruijn <willemb@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Simon Horman <horms@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org
Subject: Re: [PATCH net-next v3 1/4] net_tstamp: add SCM_TS_OPT_ID to provide
 OPT_ID in control message
Message-ID: <202409061658.ydeSewh7-lkp@intel.com>
References: <20240904113153.2196238-2-vadfed@meta.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904113153.2196238-2-vadfed@meta.com>

Hi Vadim,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Vadim-Fedorenko/net_tstamp-add-SCM_TS_OPT_ID-to-provide-OPT_ID-in-control-message/20240904-193351
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240904113153.2196238-2-vadfed%40meta.com
patch subject: [PATCH net-next v3 1/4] net_tstamp: add SCM_TS_OPT_ID to provide OPT_ID in control message
config: i386-buildonly-randconfig-005-20240906 (https://download.01.org/0day-ci/archive/20240906/202409061658.ydeSewh7-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409061658.ydeSewh7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409061658.ydeSewh7-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/net_tstamp.h:46:15: error: unknown type name 'SOF_TIMESTAMPING_LAST'
      46 | static_assert(SOF_TIMESTAMPING_LAST != (1 << 31));
         |               ^
>> ./usr/include/linux/net_tstamp.h:46:37: error: expected ')'
      46 | static_assert(SOF_TIMESTAMPING_LAST != (1 << 31));
         |                                     ^
   ./usr/include/linux/net_tstamp.h:46:14: note: to match this '('
      46 | static_assert(SOF_TIMESTAMPING_LAST != (1 << 31));
         |              ^
>> ./usr/include/linux/net_tstamp.h:46:1: warning: type specifier missing, defaults to 'int' [-Wimplicit-int]
      46 | static_assert(SOF_TIMESTAMPING_LAST != (1 << 31));
         | ^
         | int
   1 warning and 2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
