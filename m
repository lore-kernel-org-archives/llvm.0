Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03A02C3257;
	Fri,  6 Feb 2026 11:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770378898; cv=none; b=MwbvblkL+Ryg+moOXIoIN4GwZNAb0gzoqdFQ1wPHWH5fXAvw5hZES1TU+NxXChnuu57vdicTz8bfcdAdpK6H0G+FZpNSmVUX1lwGyQ1ZSzZZcUmBmWmohzGAaTo1veU4sBsn43cwey5e3W05xiu6y2APBZxJY/JI3D3Ohzf+h2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770378898; c=relaxed/simple;
	bh=qsXLwVZy4/VVnuNspRFxlTP1RY/GLQndT3ByUlPXVv8=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qXkWHZuJDG276as+lMfPvItKqqOfq8pzIe6UXObSChykc2N4qNFS9vJnJzl4dP6V2Bdo9Sy99CjU+SNhHOHA2q3GL4Qu/l2NA+6kIEIJlJ7L9ghI+j8U97erZFSX+TOw0SLjhg61nQkjFS7u4zK50VE8JFQBXkew8ucNtmLkTLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gp1JDh8c; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gp1JDh8c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770378898; x=1801914898;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qsXLwVZy4/VVnuNspRFxlTP1RY/GLQndT3ByUlPXVv8=;
  b=Gp1JDh8cL9jVfxJ22dOTol/oH3RBtGjktu4bozvQS6P7dgAJ7XmPdmKC
   lOoTnjuJobsjODKI8ccVlwhiyuQuaEflT2TnTMNWCVLKdZ51pyr/NuTLp
   QJaq19etN+8LFQu3ePJyWnQRyQUmTM8C8nOnfpQtOOPiOhD1ZxwGVEM8s
   urwXFDB0x4S5Famr8AqBr/P1AnK+pw7Uk07CwRdSGucImZrb6PVgodBcP
   PlBR40ChExhC64ylibUl+d0ipWLMRXQsADytlYQB63LxaGZxlAS2eO0MX
   7my1Jf8HdZLOpK0QGDeIsrtGWRo+wKqnusbMZKsAeh0IHxaO9kPlNaDyB
   g==;
X-CSE-ConnectionGUID: mXUe3czKSzWODSQ/DyEA/g==
X-CSE-MsgGUID: /TO+3P6iQ2iOP7ccq2RpTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71477518"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="71477518"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 03:54:57 -0800
X-CSE-ConnectionGUID: dj9OEVc4Rj2pvityXwKqAQ==
X-CSE-MsgGUID: v4a3i822Sj+lI7svkHaK2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="209944916"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Feb 2026 03:54:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voKQH-00000000ki4-2Qpc;
	Fri, 06 Feb 2026 11:54:53 +0000
Date: Fri, 6 Feb 2026 19:54:45 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH v2 1/4] rust: io: Add big-endian read and write functions
Message-ID: <202602061941.ODjAiGHN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

In-Reply-To: <20260204040505.8447-2-linkmauve@linkmauve.fr>
References: <20260204040505.8447-2-linkmauve@linkmauve.fr>
TO: Link Mauve <linkmauve@linkmauve.fr>
TO: rust-for-linux@vger.kernel.org
CC: Link Mauve <linkmauve@linkmauve.fr>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Nicholas Piggin <npiggin@gmail.com>
CC: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
CC: Srinivas Kandagatla <srini@kernel.org>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Boqun Feng <boqun@kernel.org>
CC: Gary Guo <gary@garyguo.net>
CC: "Björn Roy Baron" <bjorn3_gh@protonmail.com>
CC: Benno Lossin <lossin@kernel.org>
CC: Andreas Hindborg <a.hindborg@kernel.org>
CC: Alice Ryhl <aliceryhl@google.com>
CC: Trevor Gross <tmgross@umich.edu>
CC: Danilo Krummrich <dakr@kernel.org>
CC: Daniel Almeida <daniel.almeida@collabora.com>
CC: Ard Biesheuvel <ardb@kernel.org>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Eric Biggers <ebiggers@google.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Lyude Paul <lyude@redhat.com>
CC: Asahi Lina <lina+kernel@asahilina.net>
CC: Viresh Kumar <viresh.kumar@linaro.org>
CC: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: Tamir Duberstein <tamird@kernel.org>
CC: FUJITA Tomonori <fujita.tomonori@gmail.com>
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
CC: officialTechflashYT@gmail.com

Hi Link,

kernel test robot noticed the following build errors:

[auto build test ERROR on rust/rust-next]
[also build test ERROR on driver-core/driver-core-linus powerpc/next powerpc/fixes linus/master v6.19-rc8]
[cannot apply to driver-core/driver-core-testing driver-core/driver-core-next next-20260205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Link-Mauve/rust-io-Add-big-endian-read-and-write-functions/20260204-120734
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20260204040505.8447-2-linkmauve%40linkmauve.fr
patch subject: [PATCH v2 1/4] rust: io: Add big-endian read and write functions
config: x86_64-buildonly-randconfig-002-20260206 (https://download.01.org/0day-ci/archive/20260206/202602061941.ODjAiGHN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602061941.ODjAiGHN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602061941.ODjAiGHN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from rust/helpers/helpers.c:32:
>> rust/helpers/io.c:56:9: error: call to undeclared function 'ioread64be'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   56 |         return ioread64be(addr);
   |                ^
>> rust/helpers/io.c:95:2: error: call to undeclared function 'iowrite64be'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   95 |         iowrite64be(value, addr);
   |         ^
   2 errors generated.
   make[3]: *** [rust/Makefile:639: rust/helpers/helpers.o] Error 1 shuffle=2603731126
>> rust/helpers/io.c:56:9: error: call to undeclared function 'ioread64be'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> rust/helpers/io.c:95:2: error: call to undeclared function 'iowrite64be'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> Unable to generate bindings: clang diagnosed error: rust/helpers/io.c:56:9: error: call to undeclared function 'ioread64be'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> rust/helpers/io.c:95:2: error: call to undeclared function 'iowrite64be'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]


vim +/ioread64be +56 rust/helpers/io.c

    52	
    53	#ifdef CONFIG_64BIT
    54	u64 rust_helper_ioread64be(const void __iomem *addr)
    55	{
  > 56		return ioread64be(addr);
    57	}
    58	#endif
    59	
    60	void rust_helper_writeb(u8 value, void __iomem *addr)
    61	{
    62		writeb(value, addr);
    63	}
    64	
    65	void rust_helper_writew(u16 value, void __iomem *addr)
    66	{
    67		writew(value, addr);
    68	}
    69	
    70	void rust_helper_writel(u32 value, void __iomem *addr)
    71	{
    72		writel(value, addr);
    73	}
    74	
    75	#ifdef CONFIG_64BIT
    76	void rust_helper_writeq(u64 value, void __iomem *addr)
    77	{
    78		writeq(value, addr);
    79	}
    80	#endif
    81	
    82	void rust_helper_iowrite16be(u16 value, void __iomem *addr)
    83	{
    84		iowrite16be(value, addr);
    85	}
    86	
    87	void rust_helper_iowrite32be(u32 value, void __iomem *addr)
    88	{
    89		iowrite32be(value, addr);
    90	}
    91	
    92	#ifdef CONFIG_64BIT
    93	void rust_helper_iowrite64be(u64 value, void __iomem *addr)
    94	{
  > 95		iowrite64be(value, addr);
    96	}
    97	#endif
    98	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
