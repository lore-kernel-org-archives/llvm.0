Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEBC2D24A0;
	Thu, 20 Nov 2025 12:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763643134; cv=none; b=GfVKq8et+wqOuufTej4U950TLLcmSkCc0Xz9JWEyIEHnb/ZBXGHoetXQmlJqps6mjZDslwOe5gv+nj5ZO1I4OD9tCwbPblcPZFNNzHkQs0Dn9KHUDypMPfMIABt83LSpkQLNdTdoRMAsrD/gu9IiF89W9pMCsmhO9WPf7v5+R6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763643134; c=relaxed/simple;
	bh=5ILxYBsGFpbcNrcTKLSOYFqCfCANKwBbW0exq6e1c7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HYAoBgMkvV3rLmoH6RkeuObstqslXVK8SmSo1nY6uYnvNU/wftuUnKkhjHx21ZPvG2Xt14DzJNinu3q4IDIPVJvGRAGDjvf+AShTcI50Ly/LY+W7sYhZDG+DCZ5XXKrt34c4xJ86S/VS/zUPTg5AgtNgOYmHF8bIWcVLBxTU2RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/J91Ut4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/J91Ut4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763643132; x=1795179132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5ILxYBsGFpbcNrcTKLSOYFqCfCANKwBbW0exq6e1c7g=;
  b=m/J91Ut4FosWQ9/2u79mrCL+ksf8HrLa0YWkV8D5uJh3XxsGlQo5a7x5
   +HiTmbG6eL5C6E0btWt03jyIIqs5HcdP8AjNTJkvWNgnYjatR4h2g8ZFk
   v58Elqse4CYJb3RCy8e/CYH3KSB80zYMf74pkuN0NiNoB50BqWp/Cjhza
   mSnvDecPiByvZvMS+esvX8//PqZTBkR+df6N3gLDNr+GC7cfV/J+G3/8D
   G6JpDJFRY3TUFxCZNn1OgaJrorvY1BDI3nsrBBbQTWL5eHOH4MRp7yf3f
   7kp+8R3KjV63AsB/u1l8w8HxAKQ/7DTswcrF3Gon8W9rQbTqvVCsgvx5B
   Q==;
X-CSE-ConnectionGUID: fAQDuh9XQzesde5l/b0UxQ==
X-CSE-MsgGUID: kldygCVYQSqTmMc4M1S9sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65603349"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="65603349"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 04:52:11 -0800
X-CSE-ConnectionGUID: 3up7XwbaQwCEnxSPEAXXiw==
X-CSE-MsgGUID: jBKFzKiLR0yWSVzjXOV/3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="191478466"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Nov 2025 04:52:10 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vM48t-00040R-1t;
	Thu, 20 Nov 2025 12:52:07 +0000
Date: Thu, 20 Nov 2025 20:52:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alice Ryhl <aliceryhl@google.com>
Subject: [linux-next:master 7315/10599] ld.lld: error: undefined symbol:
 _copy_from_user
Message-ID: <202511202005.7GzetV3D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
commit: d99dc586ca7c7729450af2ed39ca1483c0eb7b5c [7315/10599] uaccess: decouple INLINE_COPY_FROM_USER and CONFIG_RUST
config: loongarch-randconfig-6002-20251120 (https://download.01.org/0day-ci/archive/20251120/202511202005.7GzetV3D-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511202005.7GzetV3D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511202005.7GzetV3D-lkp@intel.com/

Note: the linux-next/master HEAD 88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: _copy_from_user
   >>> referenced by uaccess.rs:306 (rust/kernel/uaccess.rs:306)
   >>>               samples/rust/rust_misc_device.o:(<kernel::uaccess::UserSliceReader>::read::<i32>) in archive vmlinux.a
   >>> referenced by uaccess.rs:306 (rust/kernel/uaccess.rs:306)
   >>>               drivers/android/binder/rust_binder_main.o:(<kernel::uaccess::UserSliceReader>::read::<rust_binder_main::defs::BinderWriteRead>) in archive vmlinux.a
   >>> referenced by uaccess.rs:306 (rust/kernel/uaccess.rs:306)
   >>>               drivers/android/binder/rust_binder_main.o:(<kernel::uaccess::UserSliceReader>::read::<rust_binder_main::defs::BinderFreezeInfo>) in archive vmlinux.a
   >>> referenced 24 more times
--
>> ld.lld: error: undefined symbol: _copy_to_user
   >>> referenced by uaccess.rs:458 (rust/kernel/uaccess.rs:458)
   >>>               samples/rust/rust_misc_device.o:(<kernel::uaccess::UserSliceWriter>::write::<i32>) in archive vmlinux.a
   >>> referenced by uaccess.rs:458 (rust/kernel/uaccess.rs:458)
   >>>               samples/rust/rust_misc_device.o:(<rust_misc_device::RustMiscDevice as kernel::miscdevice::MiscDevice>::ioctl) in archive vmlinux.a
   >>> referenced by uaccess.rs:458 (rust/kernel/uaccess.rs:458)
   >>>               drivers/android/binder/rust_binder_main.o:(<kernel::uaccess::UserSliceWriter>::write::<rust_binder_main::defs::BinderVersion>) in archive vmlinux.a
   >>> referenced 15 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
