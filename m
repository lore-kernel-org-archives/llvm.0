Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E323ECBFD;
	Thu,  5 Feb 2026 13:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770299952; cv=none; b=CWF67ntX+Rr3oGuQ33yl1OOy50YyCIO19H7C45TlVOFb6UV6D2fZAz1LINqKRhnS8XcuS0C6qXaWPYtxsDRUPLj3mKq42EOmelUjjNTIJuM1Jk7nMy0vXsZuYouegyms6eZlA5IBcpwftClq/iURFW0KyDZvPgkLfwm4atho4DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770299952; c=relaxed/simple;
	bh=vOINlmVOf+LD9CAcP4f+8Px5e9XnMosQwffTdTf2cFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HYnasWusuE6QkH/NpdnEZpD0adkeLma7nhmcQj9rL9z0tv4lVCWllotnYlMDYl0SzmchjSm7Q69ul0XzvVvfh+YgNzDTiz7NCNdpbrEt4qY5NlPQAb7LJmEP2CSZ9tnmUkNyTD3lELMDMCZWipeYX0GF1jTwBMXp4LU6c4eBsJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ACeIfetD; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ACeIfetD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770299952; x=1801835952;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vOINlmVOf+LD9CAcP4f+8Px5e9XnMosQwffTdTf2cFU=;
  b=ACeIfetDUfXmDg0Pd+ejejVbqOhJuxkPwdp6Lm1t6hzTN538yNKnNhxp
   i0QbbZLBE6K3OQGBya4LTDQf2ohMSVAH7xbTum+5f15EUmAzyql4UXX3P
   i6YWT7a7KNLr0a9PTBrMmQ+UK16YxXM3lXz6eDRO3D9k5qm6hFVBlSwic
   jRKKxF3sxjuF1ITMLrsteAMTM8cxycQff/ktxtsPnwbiDmxmRDZEViQXH
   knMm0qN/43sh0SDeTJyzKRkYrbeYWsh9Yhvix6ZP6pwqYHP/N2B/DZ0kv
   vRxcyO/Jp7C/caKQaqY0JWDzAdk6ex5Z7r8AYIW9iZIZdC+0z5wss76PD
   w==;
X-CSE-ConnectionGUID: 1VakVdhXQbqf9TqQ9cLJEw==
X-CSE-MsgGUID: LwBWCTNPQ3GTjkOr5EV//A==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="75350476"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="75350476"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 05:59:11 -0800
X-CSE-ConnectionGUID: 0h4W3Y9lRuWEY959xIrL3g==
X-CSE-MsgGUID: CkUkIo86T2Wi6lIKDd6ceA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="215505868"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Feb 2026 05:59:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnzsx-00000000jrQ-3aQO;
	Thu, 05 Feb 2026 13:59:07 +0000
Date: Thu, 5 Feb 2026 21:58:37 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
Message-ID: <202602052141.VLBZpLLo-lkp@intel.com>
References: <20260203081403.68733-5-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203081403.68733-5-phasta@kernel.org>

Hi Philipp,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on rust/rust-next]
[also build test WARNING on linus/master v6.19-rc8]
[cannot apply to tip/locking/core next-20260204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Philipp-Stanner/rust-list-Add-unsafe-for-container_of/20260203-162013
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20260203081403.68733-5-phasta%40kernel.org
patch subject: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
config: x86_64-buildonly-randconfig-004-20260205 (https://download.01.org/0day-ci/archive/20260205/202602052141.VLBZpLLo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260205/202602052141.VLBZpLLo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602052141.VLBZpLLo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: field `run_job` is never read
   --> rust/kernel/drm/jq.rs:531:5
   |
   528 | pub struct Jobqueue<T: 'static + Send> {
   |            -------- field in this struct
   ...
   531 |     run_job: fn(&Pin<&mut Job<T>>) -> ARef<DmaFence<i32>>,
   |     ^^^^^^^
   |
   = note: `#[warn(dead_code)]` on by default
--
>> warning: missing documentation for a struct field
   --> rust/kernel/drm/jq.rs:126:5
   |
   126 |     pub data: T,
   |     ^^^^^^^^^^^
   |
   = note: requested on the command line with `-W missing-docs`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
