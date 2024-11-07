Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44AC1F8EFF;
	Thu,  7 Nov 2024 14:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730989822; cv=none; b=nUwEPHI7NA9/jiyU9qZ17YFRReK1d4Gl32eY4X69ohilsudmmSP/xThmnrI71zuKFLf1+BOa9z0ku6eulEnFzEfXvHk3VQ4Kixm9om1BehfMP6WBF7z+0ZlKggwE1F384yo9jMXs2stcXdyG9++uS2VcA/IlOBSrst0iXN6y/MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730989822; c=relaxed/simple;
	bh=sx1AB983x+ysd8rtm0xmyCQrPxnNHDAugcultwR1RZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fgFAFdy4iglJH970nMfoioaMBMjCS3OzIfQdKPOAKUq7zc0K50HdK5kZWrVihTd/vHufTmYNW+HJo49+yHicUnNN7JvEaN15+ZwAmWid0Clys+rZgL2eFIshG5sYCQXjIJofdhQ/7+VAd/DYi1BrIgsoYP7gKftuan2Muk4J5mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ivHcCI3r; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ivHcCI3r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730989819; x=1762525819;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sx1AB983x+ysd8rtm0xmyCQrPxnNHDAugcultwR1RZg=;
  b=ivHcCI3rmKoB4mKTMweUQC0b9YYDtkUBy8iNQHXD6ZuvnnA/THymc1C8
   bDyZTyGiOZ7TdwjRhU7hT2IDJo+pDgi8CosUQHfuxub6SIvZ2bn+i1F1n
   cZWIafgNj/8Dm1TyHNswbg0v2fiLhCRien0fVrNnGO6v4+lWaLPSM66Qq
   sdyBdckwRhTUnnU0lYiOccDuViMtykvXxZHH5F2BlBGU2Trh1g/1leAPX
   uCi3stzJJairBBK/41+5qzftwr1S+RT+lU51R9G7lps2qWNd9e7wJ3muj
   0NKGlwjtWnOfgzYR9rEpzGDpCGxzcR5dmaqz2vSnwwysUaNFNTEWSoSSu
   A==;
X-CSE-ConnectionGUID: 1Ys/J0p+TDi1OqYMa6Lp4w==
X-CSE-MsgGUID: jqjYO1otQbG70hhJm4AdQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="31055512"
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="31055512"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 06:30:19 -0800
X-CSE-ConnectionGUID: u94g9OayR56ImobS0P0fmw==
X-CSE-MsgGUID: p8Wb9B1zRMG69S09nuHFvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="115933258"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Nov 2024 06:30:16 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t93WX-000qLQ-29;
	Thu, 07 Nov 2024 14:30:13 +0000
Date: Thu, 7 Nov 2024 22:29:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Korinth via B4 Relay <devnull+jens.korinth.tuta.io@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Dirk Behme <dirk.behme@gmail.com>,
	Jens Korinth <jens.korinth@tuta.io>
Subject: Re: [PATCH v2 2/3] rust: print: Add pr_*_once macros
Message-ID: <202411072242.YQFMjUwb-lkp@intel.com>
References: <20241107-pr_once_macros-v2-2-dc0317ff301e@tuta.io>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107-pr_once_macros-v2-2-dc0317ff301e@tuta.io>

Hi Jens,

kernel test robot noticed the following build errors:

[auto build test ERROR on ae7851c29747fa3765ecb722fe722117a346f988]

url:    https://github.com/intel-lab-lkp/linux/commits/Jens-Korinth-via-B4-Relay/rust-print-Add-do_once_lite-macro/20241107-073105
base:   ae7851c29747fa3765ecb722fe722117a346f988
patch link:    https://lore.kernel.org/r/20241107-pr_once_macros-v2-2-dc0317ff301e%40tuta.io
patch subject: [PATCH v2 2/3] rust: print: Add pr_*_once macros
config: arm64-randconfig-003-20241107 (https://download.01.org/0day-ci/archive/20241107/202411072242.YQFMjUwb-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411072242.YQFMjUwb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411072242.YQFMjUwb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: cannot find macro `pr_err_once` in this scope
   --> rust/doctests_kernel_generated.rs:3782:1
   |
   3782 | pr_err_once!("hello {}n", "there");
   | ^^^^^^^^^^^
   |
   help: consider importing this macro
   |
   3    + use kernel::pr_err_once;
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
