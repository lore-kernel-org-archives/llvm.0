Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B148B1D5CFB;
	Sun, 17 Aug 2025 05:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755409847; cv=none; b=suyVoi+l3mCOeMuM0rPClu3lkTBbi+4K43dkx/3hMi9/bQ+g3iBKv4AyXeOElbGv3yGZEx+SARoWfXcIFy9gIwn9oFKdWljF/OZB7IjzGD6NLfk801rsF2bmYIrPxEyq9G2glfnZ3BCYqDmoEAkLh+mV2b0/8nz0ZioJEvanAVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755409847; c=relaxed/simple;
	bh=nyHY7omVt4L3NYX9AX1MTT90Ptj3gLdYmhit4iwSvbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mIL2Jj5sCvahmmuhIdsGAbDsB/FJXHLLlh1J2a//XgDPgjeDZ7Z1xen5uIjz1LAdjcmyG2+mzlFIdOzZkzf6zVjToU6h3OvL7eQfyGqUwTm9w2iUxpzFDkDi8xFdGhsxFCP+/KWMSJsCVntwbFHoYqgzx1MJU3OjMW89q0yULFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OKjw+Ftp; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OKjw+Ftp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755409845; x=1786945845;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nyHY7omVt4L3NYX9AX1MTT90Ptj3gLdYmhit4iwSvbo=;
  b=OKjw+FtpgHsJBGrYerjl5vY/jR/mfFwHtnrOfioNwVl9z0+eYw3pk1lz
   vs4KvBFotXB1nn8XV9Jqv895rJd+3gGcPlsDV2JHFJ9GxdQJ1imjUyifq
   UWXGUhpQeGqonLllbYQT3u/2++HuFh2s6j6B6ldwwHtEXb7nzrg14z5vm
   zG7Y723xtpDWTuLNY2/8aabbH6DMmPbvlkN54rqAR+5ZE2d9TcqZuaaAv
   9uDQUWGTYRMsReyR1H9xcFa1bKDy21FemQsHUQK0xT+jGlad3sXZKWGt5
   njNJWvxbMk8jQHMbQA3xfDT8fzPxBhPKZIzYVpXEHOF4uTv1/zN4aps87
   w==;
X-CSE-ConnectionGUID: eqpVwMzDQw69XNum3ktptw==
X-CSE-MsgGUID: 9orQ4zmkT92YNlJTj3o1rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57739990"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57739990"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2025 22:50:45 -0700
X-CSE-ConnectionGUID: m4cyg5rXRHmnAQLPkXCxVQ==
X-CSE-MsgGUID: GN+H44+ORmSvjJ9NK+uWag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="171757046"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 16 Aug 2025 22:50:41 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unWHt-000DNd-2i;
	Sun, 17 Aug 2025 05:50:37 +0000
Date: Sun, 17 Aug 2025 13:50:12 +0800
From: kernel test robot <lkp@intel.com>
To: Ayush Singh <ayush@beagleboard.org>,
	Jason Kridner <jkridner@beagleboard.org>,
	Deepak Khatri <lorforlinux@beagleboard.org>,
	Robert Nelson <robertcnelson@beagleboard.org>,
	Miguel Ojeda <ojeda@kernel.org>, Dhruva Gole <d-gole@ti.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Benno Lossin <lossin@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Ayush Singh <ayush@beagleboard.org>
Subject: Re: [PATCH v2 2/2] rust: kernel: of: Add overlay id abstraction
Message-ID: <202508171342.vNfvpebZ-lkp@intel.com>
References: <20250816-rust-overlay-abs-v2-2-48a2c8921df2@beagleboard.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250816-rust-overlay-abs-v2-2-48a2c8921df2@beagleboard.org>

Hi Ayush,

kernel test robot noticed the following build errors:

[auto build test ERROR on 931e46dcbc7e6035a90e9c4a27a84b660e083f0a]

url:    https://github.com/intel-lab-lkp/linux/commits/Ayush-Singh/rust-kernel-of-Add-DeviceNode-abstraction/20250816-140122
base:   931e46dcbc7e6035a90e9c4a27a84b660e083f0a
patch link:    https://lore.kernel.org/r/20250816-rust-overlay-abs-v2-2-48a2c8921df2%40beagleboard.org
patch subject: [PATCH v2 2/2] rust: kernel: of: Add overlay id abstraction
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250817/202508171342.vNfvpebZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250817/202508171342.vNfvpebZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508171342.vNfvpebZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `of_overlay_fdt_apply` in crate `bindings`
   --> rust/kernel/of.rs:95:23
   |
   95 |             bindings::of_overlay_fdt_apply(
   |                       ^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `of_overlay_remove` in crate `bindings`
   --> rust/kernel/of.rs:109:28
   |
   109 |         unsafe { bindings::of_overlay_remove(&mut self.0) };
   |                            ^^^^^^^^^^^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
