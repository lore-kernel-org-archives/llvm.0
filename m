Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415F12F5A02;
	Mon, 10 Nov 2025 21:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762810607; cv=none; b=gGyCRvtPJGdU63/B+8ciW50Wl/Pk12Yhtvh18oN5kRcfSOsA+0FiZ2cqGKL6cGv8MTSrqlD0R7zO0bUAPpCH6717w6Pjurp+XXQP1N9hUe4/yOfF5IbOdlqNdAf33HUsmn1fcGk9AVljWkRhoJVhpUSRmProBkGwECR3qoqNq7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762810607; c=relaxed/simple;
	bh=CTJVkjrbUSqe+A8bpFZm82gYv0MPWLBXaF3q0pTBnqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kIrmWQoKjeMhgl1hiHiQTMRW/w7gKoTsVHJwhgLE+taezvHbUyuBh30GerFoPksw9QOahLektNFUFSb3G8he04yvmOx+3ZykARet0El6qSLaRGqw1tFnF0iBrZp2133O71gBe56t3qSpf4Q7dsrQonAgi6k8k5ob9loUil5vYyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b5oFjC3b; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b5oFjC3b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762810606; x=1794346606;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CTJVkjrbUSqe+A8bpFZm82gYv0MPWLBXaF3q0pTBnqk=;
  b=b5oFjC3bpyevWYXAAO5cWNKPGmWJf6HCbD78MimDXW4zkxIOxx5Q2I49
   j+uVNawi+elyBSXmvVmO1uiqp7cwQLONABoNdWkvuYq9H2LRrOlOYT+/0
   eFyqwtWESsVWe4nckXLirvVrZPHQgLKv/cszDKPmTwy8X2Jm0VsLQJDQe
   g2XwFi2j7VrdTyMJLtdrJDk3U520sUIpsNutmKk+eURYgeGb9ePMbAF6V
   PJDxO1kzOwtx2j2UoPgPJ4bfYKmNE+y4SQLzPQSDwyGPrwdmAOwo9QBXn
   ND8CjE6TOiML78HxUYkOm4wRzNj8EzLf85THQ0zF8I+lBnkLeFoEcNB6x
   Q==;
X-CSE-ConnectionGUID: e+cwHIM9Tuq7TyBNDlkfzg==
X-CSE-MsgGUID: dqZOVhjVQZiwYxZZqJonxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="65023371"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="65023371"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 13:36:45 -0800
X-CSE-ConnectionGUID: k7Cn/WjMRjOTV1b0bZTqYA==
X-CSE-MsgGUID: HHkLK9uSSd+EfkQeZrcUFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="193780548"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Nov 2025 13:36:41 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIZZ1-000139-25;
	Mon, 10 Nov 2025 21:36:39 +0000
Date: Tue, 11 Nov 2025 05:36:00 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH 4/4] rust: io: add typedef for phys_addr_t
Message-ID: <202511110532.BF1f9LTs-lkp@intel.com>
References: <20251106-resource-phys-typedefs-v1-4-0c0edc7301ce@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-resource-phys-typedefs-v1-4-0c0edc7301ce@google.com>

Hi Alice,

kernel test robot noticed the following build errors:

[auto build test ERROR on 211ddde0823f1442e4ad052a2f30f050145ccada]

url:    https://github.com/intel-lab-lkp/linux/commits/Alice-Ryhl/rust-io-define-ResourceSize-as-resource_size_t/20251106-201954
base:   211ddde0823f1442e4ad052a2f30f050145ccada
patch link:    https://lore.kernel.org/r/20251106-resource-phys-typedefs-v1-4-0c0edc7301ce%40google.com
patch subject: [PATCH 4/4] rust: io: add typedef for phys_addr_t
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251111/202511110532.BF1f9LTs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511110532.BF1f9LTs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511110532.BF1f9LTs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   kernel/sched/sched.h:3743:18: warning: variable 'cpumask' set but not used [-Wunused-but-set-variable]
   3743 |         struct cpumask *cpumask;
   |                         ^
   1 warning generated.
>> error: unknown start of token:   --> rust/kernel/io/resource.rs:17:19
   |
   17 |     ResourceSize, \
   |                   ^^
   |
   = note: character appears once more

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
