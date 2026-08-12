Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1B2473C73;
	Wed, 12 Aug 2026 17:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786557467; cv=none; b=hOD6kQV2d9w62TEdJ7tPGFOaImPrcpiBGlBq3oq6qwWYLEXjCIpyg3NeEU6G2QcTt9kNTCQ994/etRwuK9cNUsZtXore3HSuj1Tzndc1NnAExSG8O3+rANF7YvlLrqefEcmCEuhyFcO4sH7iuoK0YLLFJP48AJHkGPG2p6Llqp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786557467; c=relaxed/simple;
	bh=TpiuBnZF48jsQnaonYk+XOy+Z33iCdKm5m1COS60WQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhHREeC9wiUWK4VvkMwi15oWobieuq+qTLRO20nLKZ92n6hJkL1dpsw/kvCYAZrAcunjebO//arygDglTe1CKkkG/Fz+jBs0J9X3I8XE1x1VMhKd2Z1Q7zryk8UL+U8s0d1eU02pF3wU6be31QwAU9X4joJlgeRFa6Vj9AxJmhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AaCdWRFV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AaCdWRFV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786557466; x=1818093466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TpiuBnZF48jsQnaonYk+XOy+Z33iCdKm5m1COS60WQ0=;
  b=AaCdWRFVE2iczCTVRVa8Q36IOs/21/X1Mu/2s1OHyJaECFfKWY4FFEe4
   IgXW0+All1tamApqaIezggynrosIu0tlwdNImIEQunCG/R3VfKQ9zQUFJ
   nQHL6SwQBH/oTQDKPidVgnmHjvfoXLNVw8SS8/qx1Gm2ET/zZbqvrbCzm
   ybUv1WTlsLo1BNHXUpjsZPYZjIerVj67Cq/2+ZjDavdxo0qakYzdN8kdu
   wEsVT6pMmlVCuWfPe5MKvm+fifbUwNsJAcMcc5TCUZBuU3oxGxnKPauNT
   noVDvHNcbD6PXqYwL5ssfEyOop3iZFyx6ZiIxNgjYwSJFLZVJQHOj1mUb
   A==;
X-CSE-ConnectionGUID: oGTIZD2iTfKKZMS7fTy8Sg==
X-CSE-MsgGUID: 5kjO9UD7SgimSoy4UBzw0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87198069"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="87198069"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 10:57:45 -0700
X-CSE-ConnectionGUID: zF+zFhqPRHW9lv1SHh52tA==
X-CSE-MsgGUID: I7SM75XMQj2/MPnxJ527kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="288486910"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Aug 2026 10:57:38 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuDCo-00000000RHS-24h7;
	Wed, 12 Aug 2026 17:57:34 +0000
Date: Thu, 13 Aug 2026 01:57:22 +0800
From: kernel test robot <lkp@intel.com>
To: Trevor Chan <trev@trevrosa.dev>, gregkh@linuxfoundation.org,
	rafael@kernel.org, dakr@kernel.org, ojeda@kernel.org,
	a.hindborg@kernel.org, paul@paul-moore.com, airlied@gmail.com,
	simona@ffwll.ch, aliceryhl@google.com, viro@zeniv.linux.org.uk,
	brauner@kernel.org, igor.korotin@linux.dev, boqun@kernel.org,
	gary@garyguo.net, axboe@kernel.dk, daniel.almeida@collabora.com,
	shankari.ak0208@gmail.com, lyude@redhat.com, j@jananu.net,
	akpm@linux-foundation.org, acourbot@nvidia.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	david.m.ertman@intel.com, iweiny@kernel.org, leon@kernel.org,
	bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu,
	tamird@kernel.org, work@onurozkan.dev, sergeh@kernel.org
Subject: Re: [PATCH v5] rust: aref: make `AlwaysRefCounted::inc_ref` an
 associated function
Message-ID: <202608130155.R5DtGsVt-lkp@intel.com>
References: <20260628092853.16550-1-trev@trevrosa.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628092853.16550-1-trev@trevrosa.dev>

Hi Trevor,

kernel test robot noticed the following build errors:

[auto build test ERROR on driver-core/driver-core-linus]
[also build test ERROR on rust/rust-next akpm-mm/mm-everything linus/master v7.2-rc7]
[cannot apply to driver-core/driver-core-testing driver-core/driver-core-next drm/drm-next next-20260811]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Trevor-Chan/rust-aref-make-AlwaysRefCounted-inc_ref-an-associated-function/20260812-112718
base:   driver-core/driver-core-linus
patch link:    https://lore.kernel.org/r/20260628092853.16550-1-trev%40trevrosa.dev
patch subject: [PATCH v5] rust: aref: make `AlwaysRefCounted::inc_ref` an associated function
config: x86_64-randconfig-016-20260812 (https://download.01.org/0day-ci/archive/20260813/202608130155.R5DtGsVt-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130155.R5DtGsVt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130155.R5DtGsVt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0185]: method `inc_ref` has a `&self` declaration in the impl, but not in the trait
   --> rust/kernel/opp.rs:1046:5
   |
   1046 |     fn inc_ref(&self) {
   |     ^^^^^^^^^^^^^^^^^ `&self` used in impl
   |
   ::: rust/kernel/sync/aref.rs:50:5
   |
   50 |     fn inc_ref(obj: &Self);
   |     ----------------------- trait method declared without `&self`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
