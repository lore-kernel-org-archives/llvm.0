Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70712224249;
	Sun, 20 Jul 2025 19:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753040328; cv=none; b=kU4elMEKsSPnwQY7BEjUMslzkVK8vTRG34WtiqFGMDfGUdypzPlH8PmCuxg0rSWySrPIMPt4wYRub2/V/Q1wa3HHlXkGvUkmCvNrJmpndNoOZpa+1R3In2h18xICTVH8pgvkdCszb3QCSEcybEh4ghH7KNiuXRMY0IdC2v9Fhz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753040328; c=relaxed/simple;
	bh=3+17M80J1rrj5/D4/6EBNEXFFjQtjTLOy5en89nEAxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCyp4p71vatjOqIo0Se/UHcSiUwFfNIwvIa+3jHCBVGffaAZ3RzlSdXva+FkrxDadad20h1uetoUh/TJx4r36kzigzynTNVuDOsfAW9x5ih+gyVAV0JHgv6LfFbqpVE9pRZsa0AxRQb9Ckkr8Zp2LMWusXuGLt1vMeZ3B8e1mgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fNlf87b0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fNlf87b0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753040327; x=1784576327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3+17M80J1rrj5/D4/6EBNEXFFjQtjTLOy5en89nEAxU=;
  b=fNlf87b0WfAfpWIduYNB8E/VoYuGF6zpK5ae/P+SVeeUrFPdjBEM70gK
   TIQ/iQ8StLwohfdx3rgv/kNio3kPFXzA6FNjj90KTzxaWsjQkDSPsExeB
   AKjphu7PZroEw+5aL0YXNPrCamqxA1cZhDyVpwv4BKyN35ZWgxPNgAot3
   oizlZf2iHs6rvTNCHq20prajjjGntpYRckTaAawtqTI0LBfKE6jAZ27zs
   4AIQUssRMlN1AbMA0e0UBviwBFi94ZIgGMm/RshKgpZ2WOHuIyIP+1x5y
   RVMVoBrLnxN3Uh3OcClybgNI0N9XZx6M+3fo4oHWVf+vMFbmN8ggspzfz
   Q==;
X-CSE-ConnectionGUID: GfFANlevQ72pcj4K+th8jQ==
X-CSE-MsgGUID: bbJpyehQRiGlMS7OwzE6rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="55198694"
X-IronPort-AV: E=Sophos;i="6.16,327,1744095600"; 
   d="scan'208";a="55198694"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 12:38:46 -0700
X-CSE-ConnectionGUID: brlyVfWoRjOYT00pJKRBig==
X-CSE-MsgGUID: pQMzE5wjRlqd1ad/ct6usw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,327,1744095600"; 
   d="scan'208";a="158435405"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Jul 2025 12:38:43 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udZrs-000GI5-2R;
	Sun, 20 Jul 2025 19:38:40 +0000
Date: Mon, 21 Jul 2025 03:38:09 +0800
From: kernel test robot <lkp@intel.com>
To: Sidong Yang <sidong.yang@furiosa.ai>, Miguel Ojeda <ojeda@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	io-uring@vger.kernel.org, Sidong Yang <sidong.yang@furiosa.ai>
Subject: Re: [PATCH 3/4] rust: miscdevice: add uring_cmd() for MiscDevice
 trait
Message-ID: <202507210306.zCOB3QtO-lkp@intel.com>
References: <20250719143358.22363-4-sidong.yang@furiosa.ai>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250719143358.22363-4-sidong.yang@furiosa.ai>

Hi Sidong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rust/rust-next]
[also build test WARNING on char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus soc/for-next linus/master v6.16-rc6 next-20250718]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sidong-Yang/rust-bindings-add-io_uring-headers-in-bindings_helper-h/20250719-223630
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20250719143358.22363-4-sidong.yang%40furiosa.ai
patch subject: [PATCH 3/4] rust: miscdevice: add uring_cmd() for MiscDevice trait
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250721/202507210306.zCOB3QtO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507210306.zCOB3QtO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507210306.zCOB3QtO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused variable: `issue_flags`
   --> rust/kernel/miscdevice.rs:184:9
   |
   184 |         issue_flags: u32,
   |         ^^^^^^^^^^^ help: if this is intentional, prefix it with an underscore: `_issue_flags`
   |
   = note: `#[warn(unused_variables)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
