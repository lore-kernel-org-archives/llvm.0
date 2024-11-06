Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE75E2F26;
	Wed,  6 Nov 2024 00:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730852906; cv=none; b=U72RBr/+jhFhFXYO97ngNzDuluIN552b/pV3+tqp31suT9E9rOriTpVrjk8aO4Nq+9TCe7k2lE7CBFFsdeZ2lAaVX3p1aQN6Q8pkXs30JMDlYDK6BRwJRfNli4ebEqVVi38vzv3pJYuYTFCXe2qe2UXrRMZCwTJcMtKj8S5PydU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730852906; c=relaxed/simple;
	bh=112D4tuzI2xIXLLm19Jm49K0UIYLzqkk6fpdRmVG7kA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iAhW9YvOwRmv5aM698cRshHPiG4wrvGM8fFn5ND2xvLPg3obfTFOVGmDKZ+OsyhiPP2uN0AIUTJq1QOcdFDmLr/8cSmSBx38Ic/6ewcCiUzMrAbvx8HGFc7v7Jg3IuwYmL4xZq/njPiJvU0c9teEdTc3/sU80lu3SbiDCthKpJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hnX4m0Jp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hnX4m0Jp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730852903; x=1762388903;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=112D4tuzI2xIXLLm19Jm49K0UIYLzqkk6fpdRmVG7kA=;
  b=hnX4m0Jp7Pdr9x4Ngy2XenOPhf+uCbwjhO828ZBT9VMuZem6XrdfRjJ2
   3IV5HRA3TluE64ngIXCND8RTjbJ2Q2PrG0TuOHwL/Pgc7C58joe0NfGoS
   2i/BrqPLnOOlpg7seoJStFWyqfVckD62hTdH/Fgb3kma5LSunlPtlUDvY
   pV8LTVMTLqJBSnOMXel5hRVLU7n9uUl/uMzZZ+20K3vA1UBdiuB+ksTxl
   eixtGIC02NOHbnOtEvt7lxyZ4WNHRF3SousZ5vNU+mbPjWQvzqao/+Hcy
   oMbrJT0C8igEjHF6AnTYmxX9gQvcSHseYUi5obIsFG/GkmVhvOWdymXJq
   g==;
X-CSE-ConnectionGUID: tO1w/MURQLOCuYtMcw+Awg==
X-CSE-MsgGUID: vSF+t8WaSHaDy6jPakM3Sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30403688"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30403688"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 16:28:23 -0800
X-CSE-ConnectionGUID: q8R2r8GiSWKV3znXms6uXg==
X-CSE-MsgGUID: rOQWAb0MTW6mqFrdBLbJWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="83766193"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Nov 2024 16:27:53 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8Ttn-000mdZ-1c;
	Wed, 06 Nov 2024 00:27:51 +0000
Date: Wed, 6 Nov 2024 08:27:36 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Francis <alistair23@gmail.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, ojeda@kernel.org,
	boqun.feng@gmail.com, a.hindborg@kernel.org, benno.lossin@proton.me,
	aliceryhl@google.com, tmgross@umich.edu, gary@garyguo.net
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH] rust: bindings: Support some inline static functions
Message-ID: <202411060829.3NoGuTYU-lkp@intel.com>
References: <20241105022143.1087112-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105022143.1087112-1-alistair.francis@wdc.com>

Hi Alistair,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.12-rc6]
[also build test ERROR on linus/master]
[cannot apply to rust/rust-next next-20241105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alistair-Francis/rust-bindings-Support-some-inline-static-functions/20241105-102435
base:   v6.12-rc6
patch link:    https://lore.kernel.org/r/20241105022143.1087112-1-alistair.francis%40wdc.com
patch subject: [PATCH] rust: bindings: Support some inline static functions
config: um-randconfig-001-20241106 (https://download.01.org/0day-ci/archive/20241106/202411060829.3NoGuTYU-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411060829.3NoGuTYU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411060829.3NoGuTYU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> cp: cannot stat '/tmp/bindgen/extern.c': No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
