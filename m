Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22CE2E8DFC;
	Thu, 26 Mar 2026 03:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495152; cv=none; b=Ryj5b1x5CTt7eaAJYmNuiQLlPrQMu/prfaG6QN4BI2C8Z5U2xV+14t0nEnTeY2Jhc8jLZGQaR3H5fP7CFk9iiKpFVuFneiFOTu4dfGPUnDnLAjBtQSvE6XzmZhgZFPVOwTMAJpAR0IfuoUfqJrTOVrjBY4o9cSz+2vMXlWVRghE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495152; c=relaxed/simple;
	bh=wyMUop065AGEuXj2FUPnIZ9Ayur7IMuk6aXC0UUeYtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ju9laKI69JnIaUGSw/TGfZLaJ2ik7GiiRlFDVaCsokwXtU7zftJNMyLoB1eFHgcWCWtFbd6rAyK1ngJzhTECpMCH3LtM+2lsIPs71j2m4dak3IPNnH559QyHzWC1J725F6mp3IxjkxqumxlQCpsz9ZicZTAz8Lb/ocvMMp76m34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kYAoncab; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kYAoncab"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774495151; x=1806031151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wyMUop065AGEuXj2FUPnIZ9Ayur7IMuk6aXC0UUeYtg=;
  b=kYAoncab1lr2xxZyXTP0R0xHX+Rv4yJpKaifww5slozf5q0uvplkiSWy
   y6sF1h2pi4Er98hCW2VMyHWenRMyzwc610HMXFtq5r8d6VHjBahMdHx7e
   J00VfI+KOP++XvGvD+63CYOF6Y0fwHclnpNNdvOC5djVpjug368dmr9e5
   oIlXEdLtIVLgCk+8RBkih3OvhOlSO5blwSZaDTdVAFQkhkcY5EyAnPlG5
   q4Mzl22IvhZF/0XqqMKicbHzZzBWS7XkkDllPqFbD7ycJsWnxbsUwIrud
   SnDZg/13/s4xOtY5jNgltbhtdGRbx5CjY222v3bFWVoeIWXwbwkVMgK2K
   A==;
X-CSE-ConnectionGUID: G5XkS7MeTZ+lfbkTo9HBsA==
X-CSE-MsgGUID: RdGJ+9iFQle+CVBZcDLLOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75659299"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="75659299"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 20:19:10 -0700
X-CSE-ConnectionGUID: v2UdeSH2QIirO/MLDO7XvQ==
X-CSE-MsgGUID: FpZkpFQ+QoWXD2rce+lMuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="224896195"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Mar 2026 20:18:56 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5bFD-0000000083B-3TlK;
	Thu, 26 Mar 2026 03:18:51 +0000
Date: Thu, 26 Mar 2026 11:18:33 +0800
From: kernel test robot <lkp@intel.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	Aaron Ballman <aaron@aaronballman.com>,
	Cole Nixon <nixontcole@gmail.com>,
	Connor Kuehl <cipkuehl@gmail.com>, Fangrui Song <i@maskray.me>,
	James Foster <jafosterja@gmail.com>,
	Jeff Takahashi <jeffrey.takahashi@gmail.com>,
	Jordan Cantrell <jordan.cantrell@mail.com>
Subject: Re: [PATCH v2] rust: allow Clang-native `RANDSTRUCT` configs
Message-ID: <202603261112.bLTUmUGa-lkp@intel.com>
References: <20260323130224.165738-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323130224.165738-1-ojeda@kernel.org>

Hi Miguel,

kernel test robot noticed the following build errors:

[auto build test ERROR on bf074eb6891be799174ff42e0051492681fdc045]

url:    https://github.com/intel-lab-lkp/linux/commits/Miguel-Ojeda/rust-allow-Clang-native-RANDSTRUCT-configs/20260325-210001
base:   bf074eb6891be799174ff42e0051492681fdc045
patch link:    https://lore.kernel.org/r/20260323130224.165738-1-ojeda%40kernel.org
patch subject: [PATCH v2] rust: allow Clang-native `RANDSTRUCT` configs
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260326/202603261112.bLTUmUGa-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603261112.bLTUmUGa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603261112.bLTUmUGa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: kernel-address sanitizer is not supported for this target

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
