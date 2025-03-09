Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DCF1FB3;
	Sun,  9 Mar 2025 09:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741513645; cv=none; b=LihVfJiw/RW6UsZVHGxi8XDcr8XxfWa1eMoZH6pDEH8nTGTtPdGIjqcjDgybj6btKnmE5A0XlanXqTPz0rQpArfoeWHpYbYfaMbN2Fd+rXyUkTg1Qu9tHfLARgbXzOTj+t5G4Sy+cxoomtxom5D+nLI3ARkvCdLa06abs0wLGuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741513645; c=relaxed/simple;
	bh=/5tOJ6dvoZUKrdt5kC3lD2gIF7ApQ8RlCheMP9lRgR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZQxIwQ1O1NNyuKrT6xnsF7cGlPqC65q9JLCwZ6cR/KwOJAxbm92gckxJ2R67P7nnHUHr5c9VDloe5s7YJyqwEqtZL4cLJnCRntRR+pSnBHsggLMe18VqfveaNLnGlfF6wf/RSaZGpAPdJrgrmBqzT/9piD08XjcnQKtEoenEy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aaKoP8bc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aaKoP8bc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741513643; x=1773049643;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/5tOJ6dvoZUKrdt5kC3lD2gIF7ApQ8RlCheMP9lRgR0=;
  b=aaKoP8bcDymMhd9ypdVaw3gQEBc0TPWsPsHYkksQK+GXqJM3wG6sX8HO
   nSP/axPwZ9D8aHI0e+xPeJTOOVxGzER17Xz7gUtu/kVAlMxcnrXP+JJt9
   8dRbMmCe3tNEd9G+sqCR8JAX9NZJy7Geb6rxkmnLj9XYdvaz+70tNk2y0
   UrMg3pvQPPsjwpz7NEgdYVg+dL7CEP6Nu99oGxgpfGHn4Dcd9zPbozlaR
   XltvHnB4MMKk2sqs64ngbwSKvohOWCYPuJy3gUl0fWhrBycv65dgp/7u1
   Ib9vpgmOdX485fWtWk2V3G5x4YkLSetoRUD3xRHXYmjzcQuyMSCFT2I2c
   Q==;
X-CSE-ConnectionGUID: qsqAc3yFTj2UFqL6R8x4pA==
X-CSE-MsgGUID: EOCoX7luStuRYFLjlqsXnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="42431819"
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="42431819"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 01:47:22 -0800
X-CSE-ConnectionGUID: p+g5kU1nRYaC0TUJw/nphA==
X-CSE-MsgGUID: us1zPSDCTnSTDV5V6lYFRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124976344"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 09 Mar 2025 01:47:22 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trDFf-0002tw-1K;
	Sun, 09 Mar 2025 09:47:19 +0000
Date: Sun, 9 Mar 2025 17:46:40 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 15/26] landlock: Log scoped denials
Message-ID: <202503091759.e9RGYFVV-lkp@intel.com>
References: <20250308184422.2159360-16-mic@digikod.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250308184422.2159360-16-mic@digikod.net>

Hi Mickaël,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7eb172143d5508b4da468ed59ee857c6e5e01da6]

url:    https://github.com/intel-lab-lkp/linux/commits/Micka-l-Sala-n/lsm-Add-audit_log_lsm_data-helper/20250309-025251
base:   7eb172143d5508b4da468ed59ee857c6e5e01da6
patch link:    https://lore.kernel.org/r/20250308184422.2159360-16-mic%40digikod.net
patch subject: [PATCH v6 15/26] landlock: Log scoped denials
config: i386-buildonly-randconfig-006-20250309 (https://download.01.org/0day-ci/archive/20250309/202503091759.e9RGYFVV-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503091759.e9RGYFVV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503091759.e9RGYFVV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> security/landlock/fs.c:1816:24: error: no member named 'fown_layer' in 'struct landlock_file_security'
    1816 |                 landlock_file(file)->fown_layer = handle_layer;
         |                 ~~~~~~~~~~~~~~~~~~~  ^
   security/landlock/fs.c:1821:24: error: no member named 'fown_layer' in 'struct landlock_file_security'
    1821 |                 landlock_file(file)->fown_layer = 0;
         |                 ~~~~~~~~~~~~~~~~~~~  ^
   2 errors generated.
--
>> security/landlock/task.c:412:48: error: no member named 'fown_layer' in 'struct landlock_file_security'
     412 |                 .layer_plus_one = landlock_file(fown->file)->fown_layer + 1,
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~  ^
   1 error generated.


vim +1816 security/landlock/fs.c

  1792	
  1793	static void hook_file_set_fowner(struct file *file)
  1794	{
  1795		static const struct access_masks signal_scope = {
  1796			.scope = LANDLOCK_SCOPE_SIGNAL,
  1797		};
  1798		const struct landlock_cred_security *new_subject;
  1799		struct landlock_cred_security *fown_subject;
  1800		struct landlock_ruleset *prev_dom;
  1801		size_t handle_layer;
  1802	
  1803		/*
  1804		 * Lock already held by __f_setown(), see commit 26f204380a3c ("fs: Fix
  1805		 * file_set_fowner LSM hook inconsistencies").
  1806		 */
  1807		lockdep_assert_held(&file_f_owner(file)->lock);
  1808	
  1809		fown_subject = &landlock_file(file)->fown_subject;
  1810		prev_dom = fown_subject->domain;
  1811		new_subject = landlock_get_applicable_subject(
  1812			current_cred(), signal_scope, &handle_layer);
  1813		if (new_subject) {
  1814			landlock_get_ruleset(new_subject->domain);
  1815			*fown_subject = *new_subject;
> 1816			landlock_file(file)->fown_layer = handle_layer;
  1817		} else {
  1818			static const struct landlock_cred_security empty = {};
  1819	
  1820			*fown_subject = empty;
  1821			landlock_file(file)->fown_layer = 0;
  1822		}
  1823	
  1824		/* Called in an RCU read-side critical section. */
  1825		landlock_put_ruleset_deferred(prev_dom);
  1826	}
  1827	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
