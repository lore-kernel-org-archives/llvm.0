Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF912309A7;
	Sun, 17 Nov 2024 23:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731887260; cv=none; b=V4MlhR4JUfwMsz5cArAqXf3DvGD45Fn9WMy2RXhFiZMEqhFYcLU/qIbgxXm44MihJXIF7Z0CctCVu6K9Ik9eVkXX3pRZ8YB1N8pLNCofTJWM5cXJIEeu/ImBihdpdA16IoYXyCUKODZAN7uEBewdm+HHqKoPnx5oMCHfzMAnaq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731887260; c=relaxed/simple;
	bh=P1BsP1cGK94H5aphr+CmIL8Z4amP2D/fjFOsmEmkSAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MmDD34LC5N2YE/IU+rWd29Rfn2H4aGsbGEBijDFz5WbkonS7f83kUBVjwNTV3up9dleoOJOtRo2CRJSKm64IZGOBuFq/btP7nchX0gkqNJDI7yy8nLuPuUd3gxofmTtojbdhrPSSXFg1/t/k1qg1it/kGHAyQWc3HtruwkuDgPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cISYT6ZU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cISYT6ZU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731887259; x=1763423259;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P1BsP1cGK94H5aphr+CmIL8Z4amP2D/fjFOsmEmkSAs=;
  b=cISYT6ZUl9xBnoVuzfPGhEEqRwe+fkay/ZQT5NHFywLx1UwwHEMt2QRC
   RwhI4PjlkHeqwBsi0SirRnQawhOuuWz9cdFx/c6uqvVdSovy1JFKHyrlQ
   bnmGmlDKMzFPpq+/2v975tP+qSAOdGmROC1y21uYwCkMtvAmAex2zsFyM
   v4YrEPd7WiAMehFi94Tb40EyxoA64nJe1GJiv6hPlG8/TxZcEF7muTjW+
   NQLtU9Ub99Z2iMJX5J5P2COWBVf+LTutYQy9JJMcL4d4QrFwRwtVjGR4Y
   cy06pAW1BsL34HCHdyp9oQjYzvJw+QSXB23LiBz8LR1HKTh+u3sgUROPV
   Q==;
X-CSE-ConnectionGUID: uczItTQhSQqAf16IYMgGfA==
X-CSE-MsgGUID: FkYlMTOhRCem2Ns44zeEKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="35598057"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="35598057"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 15:47:38 -0800
X-CSE-ConnectionGUID: y9QjnJUARW+Pfju8B/fzmQ==
X-CSE-MsgGUID: IRZPKmHYQ56Dn9+mpxT1Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="112357128"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Nov 2024 15:47:31 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCozI-00027l-2K;
	Sun, 17 Nov 2024 23:47:28 +0000
Date: Mon, 18 Nov 2024 07:46:33 +0800
From: kernel test robot <lkp@intel.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
	andrew@lunn.ch, hkallweit1@gmail.com, tmgross@umich.edu,
	ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com,
	anna-maria@linutronix.de, frederic@kernel.org, tglx@linutronix.de,
	arnd@arndb.de, jstultz@google.com, sboyd@kernel.org,
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH v6 6/7] rust: Add read_poll_timeout functions
Message-ID: <202411180733.UATVgVuv-lkp@intel.com>
References: <20241114070234.116329-7-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114070234.116329-7-fujita.tomonori@gmail.com>

Hi FUJITA,

kernel test robot noticed the following build errors:

[auto build test ERROR on 228ad72e7660e99821fd430a04ac31d7f8fe9fc4]

url:    https://github.com/intel-lab-lkp/linux/commits/FUJITA-Tomonori/rust-time-Add-PartialEq-Eq-PartialOrd-Ord-trait-to-Ktime/20241114-151340
base:   228ad72e7660e99821fd430a04ac31d7f8fe9fc4
patch link:    https://lore.kernel.org/r/20241114070234.116329-7-fujita.tomonori%40gmail.com
patch subject: [PATCH v6 6/7] rust: Add read_poll_timeout functions
config: um-randconfig-002-20241117 (https://download.01.org/0day-ci/archive/20241118/202411180733.UATVgVuv-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180733.UATVgVuv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180733.UATVgVuv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0433]: failed to resolve: use of undeclared type `KBox`
   --> rust/doctests_kernel_generated.rs:1821:12
   |
   1821 | let lock = KBox::pin_init(new_spinlock!(()), kernel::alloc::flags::GFP_KERNEL)?;
   |            ^^^^
   |            |
   |            use of undeclared type `KBox`
   |            help: a struct with a similar name exists: `Box`

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
