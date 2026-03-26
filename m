Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932163F54CD;
	Thu, 26 Mar 2026 11:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774525599; cv=none; b=LVWNra00bFH9Co9NPYcSE89pEw5HjoHbi1vv5HrOBTMCet7Zb1pZMz0lIDjjFsLVPpz2C6yJmH7Hx1JZHvDCpbXlX397TpiEfgkrMzA6k9zGpMOdQ0n4DidfhvflFYl4EV8+IXjo/wDEWBg5W17vUGcVlNfdfh2040s10+xYQzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774525599; c=relaxed/simple;
	bh=ofJzlAWKgixcp4+wTysf5ew1gWizcxE8ZddUuSZ46FE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=soH0fdK8V86vHHv+DtvQdBitH80A5PLL3jFA5K4HEUTUyhy80f0UGVv9D7rbwE9+NpTE5+St8V/UVuT/YSnyXdfrt7pDiQsN9jmtk1JLVqYazCSOWMd0OcwRXBBKtnGcofC0NYMpwa+SHMWOIdF8N+oX78Bo0R8dhaj+lsQ36Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BMt103CB; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BMt103CB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774525591; x=1806061591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ofJzlAWKgixcp4+wTysf5ew1gWizcxE8ZddUuSZ46FE=;
  b=BMt103CBBCF7zYDc97UdIfy550Y/UZpwa/DJ3+f1L79jlddcZU/Ay8c/
   Np1qt/2/A+fdGF7VR0gHV68af6lhuxGUEPvWu6hp/8MZq+h+quLD3LHeJ
   cKZ9Hn6rveMvTeFJkLRqbXjZhCIyPLfMt5vxJvjGzjjLP0QLMFCtZMthI
   FBfZwWjTxxmwka4KgCqroPzEMyByVU3JIwxj/srJqJK6I3BQVxENMY6vE
   NBBULLAK/DqrvGVdenl5CNjbXsMhJlWOZhIvrw3SgQxccbf1vRoc5fWyo
   0mLYaFDxjTmkUNr15YrX+R9zJMagJwy511KQ2Pkpe0vu8PY62nTcrZ9ea
   A==;
X-CSE-ConnectionGUID: MH0nkdRYTy+KkZ0t2jnAKw==
X-CSE-MsgGUID: BM32pHXDRQqi/oYBWNjhgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75469563"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="75469563"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 04:46:29 -0700
X-CSE-ConnectionGUID: ljPFRTexQ8ye6RJur4lN3A==
X-CSE-MsgGUID: AiWrJJphTGGDsFLxII67gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="229052926"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Mar 2026 04:46:22 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5jAI-000000008oL-3xnO;
	Thu, 26 Mar 2026 11:46:18 +0000
Date: Thu, 26 Mar 2026 19:46:14 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v4 08/10] gpu: nova-core: convert falcon registers to
 kernel register macro
Message-ID: <202603261919.gCMgXdPS-lkp@intel.com>
References: <20260325-b4-nova-register-v4-8-bdf172f0f6ca@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-b4-nova-register-v4-8-bdf172f0f6ca@nvidia.com>

Hi Alexandre,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dff8302ca1d0e773c90dbeeb05e759f995c95482]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Courbot/gpu-nova-core-introduce-bounded_enum-macro/20260326-064653
base:   dff8302ca1d0e773c90dbeeb05e759f995c95482
patch link:    https://lore.kernel.org/r/20260325-b4-nova-register-v4-8-bdf172f0f6ca%40nvidia.com
patch subject: [PATCH v4 08/10] gpu: nova-core: convert falcon registers to kernel register macro
config: loongarch-randconfig-001-20260326 (https://download.01.org/0day-ci/archive/20260326/202603261919.gCMgXdPS-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603261919.gCMgXdPS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603261919.gCMgXdPS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `num::Bounded`
   --> drivers/gpu/nova-core/falcon.rs:24:5
   |
   24 |     num::Bounded,
   |     ^^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
