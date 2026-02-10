Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706EB314B6D;
	Tue, 10 Feb 2026 12:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770725602; cv=none; b=r9xWx/3mwwE4Z23Jv3kAPU6oJky3WHJPDWNR+DLnf+y6MfyEjzhX0Nv3Fc8FH2BFi77lsITMiRq9TcAe9xa5Off83UcE9B3w9JMlMJcGoCQTVH28EeE0G3Q0qycz+BTwbyFt4DSOTtwOJqtSkXusSZ3xmqaSMRlpvqiAyCsIldw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770725602; c=relaxed/simple;
	bh=W55IVdCQ4X4FtKVKb+4aAXJ6GXiWAHh67rDC5bvXGzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p0oK2Du/Ohl4yIRPw0hCdzBdICKoNwsEGkpyEIFiThObWFp65fakfy6NMq5XkZEPXB5Lc1O6H2qRGzR/DBvdGNw3QirqwCmTnwDJmSvy53N7z+LXi0ri3jb9gyjgmZvR2zwIcEz+rFlFoo/JarF7WFmzfubFpPnM6Vg7VKM/fFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lInj8xvt; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lInj8xvt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770725600; x=1802261600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W55IVdCQ4X4FtKVKb+4aAXJ6GXiWAHh67rDC5bvXGzQ=;
  b=lInj8xvt1N51VMmTsOOO1mEYvV2HG0PBvf/RUXdopjzmKj1o5BWMBrBN
   zu5fFBP7qoCHTuwoEo/HqAroPYpMt4klLjyg4YRjdgSXaSjwO6dfauvUz
   SAFKRLT9gR0CMH7wZ/Hg052KE32le3vqhwhX7xWCR+EtgqGdWivZ+OgNX
   FwQuhDAlGQezY4WCQo969N9f7708/LpcLHlt45VL6dc9K5f6aMRmAQ5+S
   MelA1tbprjKAC8Qk8FZKMcrYq+NAVLjn+kA0xil/3qlw2pqq+tAvSvZ4a
   NJOtDJMODGr9S0jSKnMV/T+z0skUOGWrJfHsPqg+rp1hQ6aLU4CMt7ITe
   g==;
X-CSE-ConnectionGUID: M1MmTl/RR0Skw20Iwa/DvQ==
X-CSE-MsgGUID: SdFvN4CyTXKbhDzUaXVPGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="72036275"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="72036275"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 04:12:46 -0800
X-CSE-ConnectionGUID: AYSwNHyrTTuxcT6SWSw/0g==
X-CSE-MsgGUID: ZS47TbmCRfCkVUdhGgcMAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="249545058"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Feb 2026 04:12:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpmbc-00000000ozc-3LQy;
	Tue, 10 Feb 2026 12:12:36 +0000
Date: Tue, 10 Feb 2026 20:12:26 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Huang Rui <ray.huang@amd.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH -next v8 2/3] rust: gpu: Add GPU buddy allocator bindings
Message-ID: <202602102034.3i5kT0hT-lkp@intel.com>
References: <20260209214246.2783990-3-joelagnelf@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209214246.2783990-3-joelagnelf@nvidia.com>

Hi Joel,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20260209]

url:    https://github.com/intel-lab-lkp/linux/commits/Joel-Fernandes/rust-clist-Add-support-to-interface-with-C-linked-lists/20260210-054655
base:   next-20260209
patch link:    https://lore.kernel.org/r/20260209214246.2783990-3-joelagnelf%40nvidia.com
patch subject: [PATCH -next v8 2/3] rust: gpu: Add GPU buddy allocator bindings
config: x86_64-buildonly-randconfig-001-20260210 (https://download.01.org/0day-ci/archive/20260210/202602102034.3i5kT0hT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602102034.3i5kT0hT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602102034.3i5kT0hT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from rust/helpers/helpers.c:35:
>> rust/helpers/gpu.c:3:10: fatal error: 'linux/gpu_buddy.h' file not found
   3 | #include <linux/gpu_buddy.h>
   |          ^~~~~~~~~~~~~~~~~~~
   1 error generated.
   make[3]: *** [rust/Makefile:640: rust/helpers/helpers.o] Error 1 shuffle=1268030489
>> rust/helpers/gpu.c:3:10: fatal error: 'linux/gpu_buddy.h' file not found
>> Unable to generate bindings: clang diagnosed error: rust/helpers/gpu.c:3:10: fatal error: 'linux/gpu_buddy.h' file not found
--
   make[3]: *** [rust/Makefile:496: rust/bindings/bindings_helpers_generated.rs] Error 1 shuffle=1268030489
   make[3]: *** Deleting file 'rust/bindings/bindings_helpers_generated.rs'
>> rust/bindings/bindings_helper.h:32:10: fatal error: 'linux/gpu_buddy.h' file not found
>> Unable to generate bindings: clang diagnosed error: rust/bindings/bindings_helper.h:32:10: fatal error: 'linux/gpu_buddy.h' file not found


vim +3 rust/helpers/gpu.c

     2	
   > 3	#include <linux/gpu_buddy.h>
     4	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
