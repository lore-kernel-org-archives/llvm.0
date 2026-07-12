Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B56D265620;
	Sun, 12 Jul 2026 21:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783893263; cv=none; b=Qc8BLrBBcymnAi5RLQiBLBXLPmn4btXK7X3kpnkyZgUnSMD174N1g5uwh1sqNM70egFS6Kr4PNz9jyYA+Jds+JK+83EFR71O0nzdBGn5WX+A726U4bh7nlfR1aBV9lyGZ5t8ayuSjH46azaLqNeCJfJVH6bKTHtkdlQV9wrKA70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783893263; c=relaxed/simple;
	bh=DbGZsyri15+TeAvgWca1+4vW5rtsEbCwpy5OsSpjdoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ogg1r6hJwJw23YGD6WDtEVXj+YJute9fHK1TvtuRwIj9qSVmKZ6zoSWqm9NJ5u+ulGtnuSW0m/TbVA6b6CPipVKhScv17VwJ1ouAtGaEwZ6J3Ny7JDBMHjTp2pg2X9XF+SWhRvKwREA2T5DIHRThdi3/pZOU9Y6VsVD8FhUWxRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CF4L+vS9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CF4L+vS9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783893260; x=1815429260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DbGZsyri15+TeAvgWca1+4vW5rtsEbCwpy5OsSpjdoQ=;
  b=CF4L+vS9YbmN7dZEVRMHfPh1bSinDdLU5dN0toePlurNU2TEJQr8dULa
   zrO7M8yr0LnSq81qmDwW4w5VwyQvOBzVYAT/c/YvKALZnt5Yj5pD9a1Hl
   zQWhr4vhYlRWamefXAZ/H2JH5I97NPrHo0znMOTy80F+emIlZcnZt8uqu
   wdLsczQNnyTmcmp3DaH7nn3+cOxp0T2r00RKqQWlDo+i8QunDaIKW83HI
   AOMrJB8+VLrozpR0B8StnlSye1v2Is/i4g6fDitlzGIfPNOtv0twWY3Uo
   zKDoroJ0n9KenkwcR32/KsDJNGePZcSzdx05d1kUtzKJaC05EJwsty6y8
   w==;
X-CSE-ConnectionGUID: b7w8FGXQTwyTLynz/n768A==
X-CSE-MsgGUID: xYJhJNyMQu6+48s1ShJegw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="110049952"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="110049952"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 14:54:19 -0700
X-CSE-ConnectionGUID: AGXEr7GiRwS6CHaig+Eg0A==
X-CSE-MsgGUID: TETWxDTVTn6lIBWwpLyzGA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 12 Jul 2026 14:54:15 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wj27n-00000000LAE-2D5a;
	Sun, 12 Jul 2026 21:54:11 +0000
Date: Mon, 13 Jul 2026 05:53:51 +0800
From: kernel test robot <lkp@intel.com>
To: FUJITA Tomonori <tomo@flapping.org>, ojeda@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	gregkh@linuxfoundation.org, a.hindborg@kernel.org,
	acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com,
	boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
	gary@garyguo.net, lossin@kernel.org, tamird@kernel.org,
	tmgross@umich.edu, work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v3] rust: bug: Add bug macro
Message-ID: <202607130448.hVx2H0N9-lkp@intel.com>
References: <20260712102802.3013600-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712102802.3013600-1-tomo@flapping.org>

Hi FUJITA,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dc59e4fea9d83f03bad6bddf3fa2e52491777482]

url:    https://github.com/intel-lab-lkp/linux/commits/FUJITA-Tomonori/rust-bug-Add-bug-macro/20260712-183026
base:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
patch link:    https://lore.kernel.org/r/20260712102802.3013600-1-tomo%40flapping.org
patch subject: [PATCH v3] rust: bug: Add bug macro
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260713/202607130448.hVx2H0N9-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260713/202607130448.hVx2H0N9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607130448.hVx2H0N9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: _RNvCsGIExRX8pES_7___rustc17rust_begin_unwind+0x47: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
