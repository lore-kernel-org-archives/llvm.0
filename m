Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD443314D1A;
	Sat, 12 Sep 2026 01:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789176302; cv=none; b=blF1HtqXpZJGo+XDMG2hEogBi4zD0MPI2v9B25cpRIMTvkHswoBqdAOKybtrdq7j9PjYf8rVkTC8/ti3zdusGlUxb3x3KncKI16biA3MNVE66h+pzh8BmIZoWA/7HjKqRdIELboVDwiU95FAu5Eb7gK5+wTuMksAph83zKhNuo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789176302; c=relaxed/simple;
	bh=kWyKl8nspQAtl9ZLH0jHzigC1FX5K2ydejkIwl5FZXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gCbIiIiVPpmcjn/JqJMg+XAv11Afwd4+cJauX7KS4xjn0lPwAGMYXPw3bZR6Kbe7Rfs/0shSRSJHCocI0gloa5opJY2IyNVOq3EniGOr1Cf2jbceeZXrt2caKLAnCwK7vo4Y+4iKNw5vQtvBb/2SBP7NpX6zDfWiFR6iDTOwNno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HrWgHuUx; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HrWgHuUx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789176294; x=1820712294;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kWyKl8nspQAtl9ZLH0jHzigC1FX5K2ydejkIwl5FZXM=;
  b=HrWgHuUxrQ59/PRfViPgBhhPnv482BsXV+vpjybbDUgkORioElEOcq1g
   q4vdCXHiUehNTJtriWnseAmT7Papr3hzKs8qhOXIQVygu+T2ZCPaHgAYP
   KGy+/aMncIpzSkhAyXX2kjpZhnvLMh8GWS6Asr+ekZAO2hEDvtKQYQhKj
   fAmZ9hD1K4JaL/3pS9++AZBMp3VNwJc3ETBY7DqNIaGKccK8XfAQazpbL
   UFDt94v9A3RCoGn5jg2ydKIF/Y8CDwvTozvVhougsVHXNdeeUQpu21KRx
   AkUW4UpyfnK69t9494b6oVa1/2shd+rydoxw8jPg4Uslmm/A23ZeWv5H+
   g==;
X-CSE-ConnectionGUID: Eg2gUt1LSRyyXkveGn3L9Q==
X-CSE-MsgGUID: 2u3n6lRhSuu9U0+iilAVMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="93337078"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="93337078"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 18:24:54 -0700
X-CSE-ConnectionGUID: CQuzOJr2TEG9R/SXou2QCg==
X-CSE-MsgGUID: L2n3kEUiSQ+y/WITewQn/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="295565944"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 11 Sep 2026 18:24:49 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5CTe-000000002VD-0ZI9;
	Sat, 12 Sep 2026 01:24:35 +0000
Date: Sat, 12 Sep 2026 09:23:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Ingo Molnar <mingo@redhat.com>, Mike Rapoport <rppt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2] x86/mm/pat: use pr_warn() for early W^X warnings
Message-ID: <202609120952.vcYnJp5p-lkp@intel.com>
References: <20260911-fixes-verify-rwx-v2-1-e2cde39b6693@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-fixes-verify-rwx-v2-1-e2cde39b6693@kernel.org>

Hi Mike,

kernel test robot noticed the following build errors:

[auto build test ERROR on ebaf7c9bbb1e16523d7036e7e1225ad2dfcc6482]

url:    https://github.com/intel-lab-lkp/linux/commits/Mike-Rapoport-Microsoft/x86-mm-pat-use-pr_warn-for-early-W-X-warnings/20260911-142843
base:   ebaf7c9bbb1e16523d7036e7e1225ad2dfcc6482
patch link:    https://lore.kernel.org/r/20260911-fixes-verify-rwx-v2-1-e2cde39b6693%40kernel.org
patch subject: [PATCH v2] x86/mm/pat: use pr_warn() for early W^X warnings
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260912/202609120952.vcYnJp5p-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609120952.vcYnJp5p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609120952.vcYnJp5p-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/mm/pat/set_memory.c:708:16: error: expected ')'
     708 |                 pr_warn_once(1, "CPA detected W^X violation: %016llx -> %016llx range: 0x%016lx - 0x%016lx PFN %lx\n",
         |                              ^
   arch/x86/mm/pat/set_memory.c:708:3: note: to match this '('
     708 |                 pr_warn_once(1, "CPA detected W^X violation: %016llx -> %016llx range: 0x%016lx - 0x%016lx PFN %lx\n",
         |                 ^
   include/linux/printk.h:669:2: note: expanded from macro 'pr_warn_once'
     669 |         printk_once(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^
   include/linux/printk.h:650:15: note: expanded from macro 'printk_once'
     650 |         DO_ONCE_LITE(printk, fmt, ##__VA_ARGS__)
         |                      ^
   1 error generated.


vim +708 arch/x86/mm/pat/set_memory.c

   667	
   668	/*
   669	 * Validate strict W^X semantics.
   670	 */
   671	static inline pgprot_t verify_rwx(pgprot_t old, pgprot_t new, unsigned long start,
   672					  unsigned long pfn, unsigned long npg,
   673					  bool nx, bool rw)
   674	{
   675		unsigned long end;
   676	
   677		/*
   678		 * 32-bit has some unfixable W+X issues, like EFI code
   679		 * and writeable data being in the same page.  Disable
   680		 * detection and enforcement there.
   681		 */
   682		if (IS_ENABLED(CONFIG_X86_32))
   683			return new;
   684	
   685		/* Only verify when NX is supported: */
   686		if (!(__supported_pte_mask & _PAGE_NX))
   687			return new;
   688	
   689		if (!((pgprot_val(old) ^ pgprot_val(new)) & (_PAGE_RW | _PAGE_NX)))
   690			return new;
   691	
   692		if ((pgprot_val(new) & (_PAGE_RW | _PAGE_NX)) != _PAGE_RW)
   693			return new;
   694	
   695		/* Non-leaf translation entries can disable writing or execution. */
   696		if (!rw || nx)
   697			return new;
   698	
   699		end = start + npg * PAGE_SIZE - 1;
   700	
   701		/*
   702		 * If the kernel text is still RWX, gently complain, this could be a
   703		 * false positive.
   704		 * Once debug_checkwx() becomes mandatory for CONFIG_STRICT_KERNEL_RWX,
   705		 * the warning can be removed completely.
   706		 */
   707		if (!kernel_set_to_readonly) {
 > 708			pr_warn_once(1, "CPA detected W^X violation: %016llx -> %016llx range: 0x%016lx - 0x%016lx PFN %lx\n",
   709			  (unsigned long long)pgprot_val(old),
   710			  (unsigned long long)pgprot_val(new),
   711			  start, end, pfn);
   712			return new;
   713		}
   714	
   715		WARN_ONCE(1, "CPA detected W^X violation: %016llx -> %016llx range: 0x%016lx - 0x%016lx PFN %lx\n",
   716			  (unsigned long long)pgprot_val(old),
   717			  (unsigned long long)pgprot_val(new),
   718			  start, end, pfn);
   719	
   720		/*
   721		 * For now, allow all permission change attempts by returning the
   722		 * attempted permissions.  This can 'return old' to actively
   723		 * refuse the permission change at a later time.
   724		 */
   725		return new;
   726	}
   727	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
