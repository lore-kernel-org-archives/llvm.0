Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F68481DB;
	Sun,  8 Sep 2024 10:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725789973; cv=none; b=C6wNj/KIBAQaLzSVGYfiwW4ywExpOfovVtbL6BSbzLuOWgC0n1ddfL+7lhlLwX4y/zKb0zlt2nm7VtTb8pzKqcrwryDN/Iv1wQc13WypF2rzC+4TGvsKofAnvyhjTVcKbGe3QcKpRyqXwopJ8DNF5bItiHJkjTCEroHeiZ2LZSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725789973; c=relaxed/simple;
	bh=HsNfp0m1q1ji5xVb6ut0rp9Pz5DZyMxha7K6nrcV3kY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4Ae+6yEUgOBYBCjA/jsZL2AUBGxdcZa/7SdlcdPPq6AWobqUIE3zlQcOA72Rw5mQXbX2yo+hWKP86Z3mbPJLyHrpvNfVPcUTshGoyYFlnrMS29tZ2n5+lnCuC0N+bHcuMlALI4sn4oJ3OSvJJO4qV6Bow4P+hNkpU6Td2ekwyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Apcbnn0X; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Apcbnn0X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725789972; x=1757325972;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HsNfp0m1q1ji5xVb6ut0rp9Pz5DZyMxha7K6nrcV3kY=;
  b=Apcbnn0XPavsfRHFmjaOckyShOTMMv8H/UREYxmNuMSRIcFa9GAxs8Fp
   Z/iskIajTBLIRBb3WpW0eIS/gkxF10OxX2iyDERKZU1aoOUOOWuFlj7Pr
   FabuIYheLDsiCiz4fWqWDauFekByFPlWvjHhK/bPbCBbE1d94JTm/nxDa
   NR7KDDC6eSjdu1L1CVlv0ZLOodV8cZOkDZQANqPENx7ElHRV2GE5NFthv
   IZAtpEpUXDs9Zex1FZkMtiGGOsDfvzHfwFurJkQB8onaUaaywAM9deuHq
   qxJTwZ9LmYNIbIfH59eEzbyaWOkBlvIYMdNeGHJIn0mfPAx4undubmxyi
   Q==;
X-CSE-ConnectionGUID: gsFgjr6MTAag3yB2j5WeJQ==
X-CSE-MsgGUID: 4OTkKl4iQpGGwNPNZBq/ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="24043637"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="24043637"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 03:06:11 -0700
X-CSE-ConnectionGUID: /Lz/KiqER/SFKAsirg6XlA==
X-CSE-MsgGUID: XivoA3U6RW2a2gZVRlV0Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="66618395"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Sep 2024 03:06:04 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snEny-000DQh-06;
	Sun, 08 Sep 2024 10:06:02 +0000
Date: Sun, 8 Sep 2024 18:05:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <siyanteng@loongson.cn>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/3] rust: Introduce HAVE_GENERATE_RUST_TARGET config
 option
Message-ID: <202409081703.CUljfXjY-lkp@intel.com>
References: <20240905-mips-rust-v2-1-409d66819418@flygoat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905-mips-rust-v2-1-409d66819418@flygoat.com>

Hi Jiaxun,

kernel test robot noticed the following build errors:

[auto build test ERROR on 469f1bad3c1c6e268059f78c0eec7e9552b3894c]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiaxun-Yang/rust-Introduce-HAVE_GENERATE_RUST_TARGET-config-option/20240905-213538
base:   469f1bad3c1c6e268059f78c0eec7e9552b3894c
patch link:    https://lore.kernel.org/r/20240905-mips-rust-v2-1-409d66819418%40flygoat.com
patch subject: [PATCH v2 1/3] rust: Introduce HAVE_GENERATE_RUST_TARGET config option
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240908/202409081703.CUljfXjY-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409081703.CUljfXjY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409081703.CUljfXjY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: /opt/cross/rustc-1.78.0-bindgen-0.65.1/rustup/toolchains/1.78.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/num/f32.rs:804:6: in function _RNvMNtCs5QSdWC790r4_4core3f32f7next_up float (float): SSE register return with SSE disabled

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
