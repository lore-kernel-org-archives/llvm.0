Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717DC41684D;
	Mon, 14 Sep 2026 09:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379376; cv=none; b=hmCbchFWOfe1Fs/sE4CQoqpyk4X9nacBgy6CchlfL5Kv1hz1PLLeSeHiLj0MnsvdrxleR3t8z6aYbVn4hIFfXcJcrh0I11G9eDbCzqoo0LU3l+tJ+YB/KpzELJhSRKf7YqYlFM9dh4sLYFi/MD6Zp27/JjvH9oOjRq1tKie4lZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379376; c=relaxed/simple;
	bh=fFpokA8xz9+jONXdKLRIuen5of1BLot2wdHJfyGypck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UKUYhEpwNHgox4OS8R/eLdLaJbdg5vrG7pS6yBm9OWCja+ZDilk1RYHCtXnhSYJsMwzEgNzWmo29gXuINkielxOXv+COSc0VlEfNS+UQ+Pym/JJUV/YhEZTW/vcEQcgz7e0HUEEsksJ7clIsvY9Kk4vganvRFIN2sl/GGcnveBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H9ggI9ko; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H9ggI9ko"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789379374; x=1820915374;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fFpokA8xz9+jONXdKLRIuen5of1BLot2wdHJfyGypck=;
  b=H9ggI9koejmWW0DHzrYa/6ngdofoJKIasmg4EYbttLDTlmyOvrS6EgkQ
   LFa0+vrYrYIF1sDnuvwmnB8TboCyG9rsAmuQ92kNyJvzT7lp3oAf7+xge
   dwZpufW7UOSi+NBtCO3UfPZtYLKmDqN07OTusyrAd9GAUB/QSjIaNQn/r
   FI65SfhM/X5RClHs5vkpvRMd763KZ0QSJm6wojm9XxNjb4XTGdWtzezY7
   0MjML0T/Qgql1FNIf4UX6eN3tmXnYY9ofW4O0966k3i/xtD5sUDtrKjVT
   QygrOcYWkaH7dy5MANKNFN6kWfoF/zX+7zhiVMe59/a+Adn1w2lUEJYSq
   Q==;
X-CSE-ConnectionGUID: TPM3kjlJRLSZhH94uNJJnQ==
X-CSE-MsgGUID: 2OonQL3RTtaHE6xjOLTnxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89742298"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89742298"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 02:49:34 -0700
X-CSE-ConnectionGUID: nMPOfAqpQX6EtG6DT99wOw==
X-CSE-MsgGUID: Q+dr2F59QxuEl9PLtq7vhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="276754901"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Sep 2026 02:49:30 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x63JW-000000002jn-3lw5;
	Mon, 14 Sep 2026 09:49:26 +0000
Date: Mon, 14 Sep 2026 17:49:19 +0800
From: kernel test robot <lkp@intel.com>
To: Filipe Xavier <felipeaggger@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Filipe Xavier <felipe_life@live.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: impl_flags: add conversions for raw flag
 representations
Message-ID: <202609141744.1nZ48tzs-lkp@intel.com>
References: <20260912-add-from-raw-conversions-v1-1-0cee34684d24@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912-add-from-raw-conversions-v1-1-0cee34684d24@gmail.com>

Hi Filipe,

kernel test robot noticed the following build errors:

[auto build test ERROR on 08df884136f1c1197bab2a27814404fd329d9aac]

url:    https://github.com/intel-lab-lkp/linux/commits/Filipe-Xavier/rust-impl_flags-add-conversions-for-raw-flag-representations/20260912-135434
base:   08df884136f1c1197bab2a27814404fd329d9aac
patch link:    https://lore.kernel.org/r/20260912-add-from-raw-conversions-v1-1-0cee34684d24%40gmail.com
patch subject: [PATCH] rust: impl_flags: add conversions for raw flag representations
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260914/202609141744.1nZ48tzs-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609141744.1nZ48tzs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609141744.1nZ48tzs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0119]: conflicting implementations of trait `TryFrom<u32>` for type `VmMapFlags`
   --> drivers/gpu/drm/tyr/vm.rs:74:1
   |
   74 | / impl_flags!(
   75 | |     /// Flags controlling virtual memory mapping behavior.
   76 | |     ///
   77 | |     /// These flags control access permissions and caching behavior for GPU virtual
   ...   |
   92 | | );
   | |_^ conflicting implementation for `VmMapFlags`
   ...
   144 |   impl TryFrom<u32> for VmMapFlags {
   |   -------------------------------- first implementation here
   |
   = note: this error originates in the macro `impl_flags` (in Nightly builds, run with -Z macro-backtrace for more info)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
