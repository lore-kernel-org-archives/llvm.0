Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C68346FD0;
	Thu, 13 Nov 2025 17:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763055713; cv=none; b=GZxhhlzUoApMAeQCFne8090St7tOL8532358OBglnULvCTFZ378zWXjm1MVoOv7SW/2t62V4bkd6LMLZFszsqcaqQS/wGC+jN90dSNzODzSVYf5NqF0nZdqZsov2eEUszgo21Z7oNRY9u2ix+SXVp2T4PWxrxCpqAb8fnKLWXpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763055713; c=relaxed/simple;
	bh=8X64zAaFXl3geT0arelAsUTK93dGwICD5uohc9BDrto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nddN815U7LRQJCVsFovVod8k7yxy3a7aIJg4YoxP6GQsMAcfUwLeXVzRcZgUfktf/RIbJPHu0DYcU8qdykXQqkoEtw5H9j6dmcVYUkSNZiEKl2iGbdrwA7NBmOtunhRZL0P3kDnPFZ7y5z6aBC63q778bHDuuoMQO95WanjDJVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JWw6yUfV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JWw6yUfV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763055710; x=1794591710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8X64zAaFXl3geT0arelAsUTK93dGwICD5uohc9BDrto=;
  b=JWw6yUfVkkVw061RH6NnE1aAbmD0GaJ1bvpnrBwbfiT/uHSdg7euDbeX
   fb0TFSgZ4OFmtkkGpuB3UliZgC+etMkRS4GzjknoV7xXVTJRI80VYtuye
   f9QdVbNYqwf4eegTyhdg5pzjz2Ls0YcP2HsG1ST3SCmDT19b64DEIyLzw
   VGYSRBFh955J1KVIAVzOQmp4n9Ve5z89aMBHXul9a7B1twoOkbl5c04Cd
   rKVfrzl+3v0IBS3uot7QxlVF53xqjaUiCuisUjFocq938AiaKegygQOuA
   MTddlzxgussBz1UMruDBaG+sBbjMRZs5f4/LNLp3MRQ3lWzfuBYQpJWmg
   A==;
X-CSE-ConnectionGUID: dxflnlO1RAGFDE3YD1fIQA==
X-CSE-MsgGUID: vbe5JuMTTKifilwtsrOQTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="76488348"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="76488348"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 09:41:50 -0800
X-CSE-ConnectionGUID: saeQ497RQXK/C93XNml1gA==
X-CSE-MsgGUID: h1ob4ERESXmdZ9rQyEpaqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="193996579"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Nov 2025 09:41:45 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJbKI-0005fj-0Z;
	Thu, 13 Nov 2025 17:41:42 +0000
Date: Fri, 14 Nov 2025 01:41:09 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yury Norov <yury.norov@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>, Burak Emir <bqe@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH v5 2/6] rust: bitmap: add BitmapVec::new_inline()
Message-ID: <202511140146.shdRx5TZ-lkp@intel.com>
References: <20251112-binder-bitmap-v5-2-8b9d7c7eca82@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-binder-bitmap-v5-2-8b9d7c7eca82@google.com>

Hi Alice,

kernel test robot noticed the following build errors:

[auto build test ERROR on 211ddde0823f1442e4ad052a2f30f050145ccada]

url:    https://github.com/intel-lab-lkp/linux/commits/Alice-Ryhl/rust-bitmap-add-MAX_LEN-and-MAX_INLINE_LEN-constants/20251112-205752
base:   211ddde0823f1442e4ad052a2f30f050145ccada
patch link:    https://lore.kernel.org/r/20251112-binder-bitmap-v5-2-8b9d7c7eca82%40google.com
patch subject: [PATCH v5 2/6] rust: bitmap: add BitmapVec::new_inline()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251114/202511140146.shdRx5TZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511140146.shdRx5TZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511140146.shdRx5TZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   kernel/sched/sched.h:3743:18: warning: variable 'cpumask' set but not used [-Wunused-but-set-variable]
   3743 |         struct cpumask *cpumask;
   |                         ^
   1 warning generated.
>> error[E0599]: no associated item named `NO_ALLOC_MAX_LEN` found for struct `bitmap::BitmapVec` in the current scope
   --> rust/kernel/bitmap.rs:239:31
   |
   154 | pub struct BitmapVec {
   | -------------------- associated item `NO_ALLOC_MAX_LEN` not found for this struct
   ...
   239 |             nbits: BitmapVec::NO_ALLOC_MAX_LEN,
   |                               ^^^^^^^^^^^^^^^^ associated item not found in `BitmapVec`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
