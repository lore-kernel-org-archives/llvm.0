Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A22329E79;
	Wed, 14 Oct 2026 19:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792007748; cv=none; b=E27/jQLyuNmy6TmV39CltKz/ZBW9fM2xZ0Cy9l5A5PY/xl24S/DZvZ+KULyNuBajlRI8ZWLoWS3lYRnBI01c6Bi2JxOkx06seexuU0IHs3mwU7po32msflzFwihFXhlYDWGm7auQ46qHH4KvvDQlH/jxGAmJdPXuGZ1Ur77dbh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792007748; c=relaxed/simple;
	bh=NytQfmkATJi/HEWuFyXxq1HN23S7Y7XOJNRMDy3m2rE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HEIJaJAmFM/jgP2rkXHq+/Wu+FmNh7LFm1OMOdD03ElG1+t3erI69jr22KaAZPreGhCrrynLQH5RU0HFCXtVoNFn9FRcUb2wc0331XhKV9OVle2juaBycun1R86J0YJvVjtf8bGzLB7FVcKnnbwoMCPXC6QVKzMPXstOFoDUrMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ri1Jg0U/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ri1Jg0U/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792007747; x=1823543747;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NytQfmkATJi/HEWuFyXxq1HN23S7Y7XOJNRMDy3m2rE=;
  b=Ri1Jg0U/gq8a49Pgd+0IZEGEU/bpLm9TK64PU0PfXerOUiktwX8UVYWo
   PAWmgGykfjs4Dhlg3vQNf7MAX4fc8tgbpGyuVMwS2lzDGwx0on5GUbLzc
   2fbYH9c6tU0kEDglSIv7b9uKDZXWdTwGKOa2o5LGTdJG0JFqac0vpmKbe
   nwEsG62qV2MyGCsMJMq48uEABjeJ5cJlit6pPPJe9NiVUs9z0Ezb4c46u
   b2TNLnrd1qBRdscOXQcLJLexwKUY5pfbNU5a2786vUF2LB81YTAQ+3jFg
   MtbI4VcUg5ArCof2FWIDX+C/XhdJVPvDtVLTcDmj4D4rVZEU8cVyyoIAr
   A==;
X-CSE-ConnectionGUID: WmXW0pAVQnuBy3TNFEOhdw==
X-CSE-MsgGUID: TM37xxxjRTKqqSyv6PiHiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="663893"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="663893"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 12:55:46 -0700
X-CSE-ConnectionGUID: Pa9hOh66RJmzpcCsm58nVQ==
X-CSE-MsgGUID: +VPqmfhSQ6GB/4exgAPjCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1523763"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Oct 2026 12:55:43 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH54e-00000000F8p-1QC0;
	Wed, 14 Oct 2026 19:55:40 +0000
Date: Thu, 15 Oct 2026 03:54:41 +0800
From: kernel test robot <lkp@intel.com>
To: Tristan de Cacqueray <tristan@midirus.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 1/3] rust: snd: Add initial snd_card binding
Message-ID: <202610150312.jVRyBA9L-lkp@intel.com>
References: <20261011-rust-snd-v1-1-7974ecdcd345@midirus.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011-rust-snd-v1-1-7974ecdcd345@midirus.com>

Hi Tristan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 2dee3d3adcadcc57d62ba6608cd02f50b0c10264]

url:    https://github.com/intel-lab-lkp/linux/commits/Tristan-de-Cacqueray/rust-snd-Add-initial-snd_card-binding/20261011-130217
base:   2dee3d3adcadcc57d62ba6608cd02f50b0c10264
patch link:    https://lore.kernel.org/r/20261011-rust-snd-v1-1-7974ecdcd345%40midirus.com
patch subject: [PATCH RFC 1/3] rust: snd: Add initial snd_card binding
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261015/202610150312.jVRyBA9L-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610150312.jVRyBA9L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610150312.jVRyBA9L-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: snd_devm_card_new
   >>> referenced by snd.rs:29 (rust/kernel/snd.rs:29)
   >>>               vmlinux.o:(<kernel::snd::SoundCard>::new)
--
>> ld.lld: error: undefined symbol: snd_card_register
   >>> referenced by snd.rs:63 (rust/kernel/snd.rs:63)
   >>>               vmlinux.o:(<kernel::snd::SoundCard>::register)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
