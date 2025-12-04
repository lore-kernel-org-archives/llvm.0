Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B65341670;
	Thu,  4 Dec 2025 13:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764855253; cv=none; b=k3HN4s0keAcbfdWQDbiPjO2G37c9ruTbfL5mcJRCbywdZgSW9SH+9FVjBDGNaXsA2//dUi2iAl9THiYK37uznh6R9Xp2rhxXdOdguAYlyX93n45hznYm1lhSNd8eEGyarpauFQlY0Wk8huk0RKCgJMeA09cBpb69dNgC6NF4U7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764855253; c=relaxed/simple;
	bh=WZgJsV+lw5jopvOOKh1sLomId2siFWRmsj1voPvhdLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAYlczACQeGA9I057XDVb+7Du8Sw+Xfd0o3IOohsKa02mC8WPCcLk3PfmpwTGDf+NKLJXE7ybVnMEzFyPj2W0XmbugA8xLnrcDjva8d/5YJJ2EqHfZ0vOoGOOE/gEjCok3PTD9RXjyKrdvN73AwdH2DHnGtrDhl5HCzMUemyVqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N7KhuI1x; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N7KhuI1x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764855251; x=1796391251;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WZgJsV+lw5jopvOOKh1sLomId2siFWRmsj1voPvhdLA=;
  b=N7KhuI1xRDLMfIfAVu0oSZw0j0wCB7h/aZIII7laEB3uJBKoMH13U8xe
   fufPN5GEziHlZgSINMTbQXv4591Lq1cMg1rXzWUJHyE7+L2qCBgmjw8nJ
   jNrDYHIxNq8IaK1fV3h5Uq1w6yGdCCgAGTuSwOZWio3R6ogAa225Il+Xe
   GJXUXLWC7WyyrBUHpyltAgCo7w8FKSrGJubohKKZURIdofCxEOJecLbVR
   nJ5Db2E5CTHX04cyEEZVzhZ9k2++BzwHFDFAWYL9Fk2JvfJkLes4QZ/Zx
   cuqf1X9MQ51ozfDHYU8GLNEeciuGxL02aDZXJy69hc/6mS9lt++X3CYsB
   Q==;
X-CSE-ConnectionGUID: GbYeYRIuSR6ES/mlOx2Wvw==
X-CSE-MsgGUID: EtOxiKQKSfa2NPY8XrPj6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="77493557"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="77493557"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 05:34:10 -0800
X-CSE-ConnectionGUID: vxhhKezUSb+FonzoazLFoA==
X-CSE-MsgGUID: nrUnOA8IS32t9lXiklycCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="195409599"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Dec 2025 05:34:09 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vR9TD-00000000DpF-14PH;
	Thu, 04 Dec 2025 13:34:07 +0000
Date: Thu, 4 Dec 2025 21:33:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/4] tpm2-sessions: fix out of range indexing in
 name_size
Message-ID: <202512042132.PC26URPL-lkp@intel.com>
References: <20251202202643.107108-2-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202202643.107108-2-jarkko@kernel.org>

Hi Jarkko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20251202]
[also build test WARNING on v6.18]
[cannot apply to char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.18 v6.18-rc7 v6.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jarkko-Sakkinen/tpm2-sessions-fix-out-of-range-indexing-in-name_size/20251203-042945
base:   next-20251202
patch link:    https://lore.kernel.org/r/20251202202643.107108-2-jarkko%40kernel.org
patch subject: [PATCH v2 1/4] tpm2-sessions: fix out of range indexing in name_size
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251204/202512042132.PC26URPL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512042132.PC26URPL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512042132.PC26URPL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/char/tpm/tpm2-sessions.c:66:
   In file included from drivers/char/tpm/tpm.h:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
     167 |         int mapping_size;
         |             ^
>> drivers/char/tpm/tpm2-sessions.c:161:46: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
     161 |                 pr_warn("tpm: invalid name algorithm: 0x%04\n", hash_alg);
         |                                                         ~~~^
   include/linux/printk.h:565:29: note: expanded from macro 'pr_warn'
     565 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ^~~
   include/linux/printk.h:402:21: note: expanded from macro 'pr_fmt'
     402 | #define pr_fmt(fmt) fmt
         |                     ^~~
   include/linux/printk.h:512:53: note: expanded from macro 'printk'
     512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ^~~
   include/linux/printk.h:484:11: note: expanded from macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   2 warnings generated.


vim +/x0a +161 drivers/char/tpm/tpm2-sessions.c

   142	
   143	#ifdef CONFIG_TCG_TPM2_HMAC
   144	/*
   145	 * Name Size based on TPM algorithm (assumes no hash bigger than 255)
   146	 */
   147	static int name_size(const u8 *name)
   148	{
   149		u16 hash_alg = get_unaligned_be16(name);
   150	
   151		switch (hash_alg) {
   152		case TPM_ALG_SHA1:
   153			return SHA1_DIGEST_SIZE + 2;
   154		case TPM_ALG_SHA256:
   155			return SHA256_DIGEST_SIZE + 2;
   156		case TPM_ALG_SHA384:
   157			return SHA384_DIGEST_SIZE + 2;
   158		case TPM_ALG_SHA512:
   159			return SHA512_DIGEST_SIZE + 2;
   160		default:
 > 161			pr_warn("tpm: invalid name algorithm: 0x%04\n", hash_alg);
   162			return -EINVAL;
   163		}
   164	}
   165	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
