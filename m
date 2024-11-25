Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80F219007D;
	Mon, 25 Nov 2024 09:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732525408; cv=none; b=p4VgZ3Sw8fwRfLxnuEQkXPoaGsb2bQDzada6PisIkFX+5kqkVe6w/dLMgx703NqbTnLwkFEnZvYMCGseYwWOKkHIWp4pjLwB5aIePO1KoU6AcAR4Ox7nN+ZJG8rINQhHwfw0A0yYt5yhAbBoUjVVE6y367uGGrZOdQEaB2SHaQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732525408; c=relaxed/simple;
	bh=2OmXam+k7g5h8EQzhTSDSS4SU0GY+CkNe50RDJMNa2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZNOLsaodFGpQ2jKPwJaZahfez/KYEIMLMMk2/V6sZrfb8PA2G1vOl8KqMUQQh+kkts0hute1hMI7ASo2aYPZLro1pNQsGf7CkKrg4LAO4VXZXYGB7+f3I1/bKCpqf6ng5qgCl8w4Ep2Ksckyx9IfZFb6d4eWajHV3yk4n4cC6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nyDHFgMI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nyDHFgMI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732525407; x=1764061407;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2OmXam+k7g5h8EQzhTSDSS4SU0GY+CkNe50RDJMNa2w=;
  b=nyDHFgMIVJOHO2bLxHQC7ZRdFtrNpDX3BFbgCuVjPk30UvoL2PZ8ENxm
   LvbYceji4k0w6A3oIfBJ0Jf+tmvhitt+E9Zm1Q9wPXzpMxR2TFRSp3UDl
   lQjy5rhqX/rqJE9eGjbEaE4kn5IeTo5vTuzSrqWsS1avsZNsUAKD7pm2f
   Lr7EWrijOwJfRnPE2fVLbBMcFhCo5QUnu2YT80wz3zpDivO1FXypS++G3
   aGciqQQ8JlkrLlZc4MwMLbCxFDVG4CPsLm+98aHh+37IQdxSrMc59WkIj
   o7DSyde0RSiiM1NneGuoZZYGbfm8QIB1niCxIPeEA4ygvl/ilE0JNpKC8
   g==;
X-CSE-ConnectionGUID: HmPbC5XkT2CpFqYYuCDQeA==
X-CSE-MsgGUID: ZQLWAWYWRW2nIm5MHhTMNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="43119536"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="43119536"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 01:03:26 -0800
X-CSE-ConnectionGUID: BUccMeWbS5ydhmKTy5oDuA==
X-CSE-MsgGUID: CGuwAQ6IToSSwdzYuYJTsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="95988831"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Nov 2024 01:03:24 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFV05-00066H-2h;
	Mon, 25 Nov 2024 09:03:21 +0000
Date: Mon, 25 Nov 2024 17:02:22 +0800
From: kernel test robot <lkp@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>, tglx@linutronix.de, bp@alien8.de,
	andy@kernel.org, akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: Re: [PATCH 2/2] string: retire bcmp()
Message-ID: <202411251629.TKfhELVt-lkp@intel.com>
References: <20241123094729.1099378-3-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241123094729.1099378-3-mjguzik@gmail.com>

Hi Mateusz,

kernel test robot noticed the following build errors:

[auto build test ERROR on kees/for-next/hardening]
[also build test ERROR on tip/master tip/x86/core linus/master v6.12 next-20241125]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mateusz-Guzik/x86-callthunks-s-bcmp-memcmp/20241125-110959
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
patch link:    https://lore.kernel.org/r/20241123094729.1099378-3-mjguzik%40gmail.com
patch subject: [PATCH 2/2] string: retire bcmp()
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20241125/202411251629.TKfhELVt-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411251629.TKfhELVt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411251629.TKfhELVt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: bcmp
   >>> referenced by do_mounts.c
   >>>               init/do_mounts.o:(parse_root_device) in archive vmlinux.a
   >>> referenced by do_mounts.c
   >>>               init/do_mounts.o:(parse_root_device) in archive vmlinux.a
   >>> referenced by do_mounts.c
   >>>               init/do_mounts.o:(parse_root_device) in archive vmlinux.a
   >>> referenced 37 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
