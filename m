Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480483A5445;
	Tue, 17 Mar 2026 10:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773742265; cv=none; b=Z2tVrN8zL/u49Wyy+8J1qJa8wtYtFaJWHG4QEoZOuzuSvVAdYyWoe8s3wBxPoP9q/+pl+awkbEFkbSe3WpOJAU5PDJ7ioY/+9qPZyjtQgCKuXof1y4Bm8cmY6GtNRO4pHthBMSju3AsvEstPmD+DEE5eOsc+8rVuqeuZ46kee70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773742265; c=relaxed/simple;
	bh=VS5shox7xBvFAPW1FpL4joq45+qOo+6vqaHAWgVWd3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ugNlL+akmprLVvbY0uul6r1itzwyw5GxX+bsYZui4z9LHX9hMFFyxbylarzoqnfwki1awOaBXldrpCDNLeFInVUZqdSKwkSRVJ4BBygjFaJdJmLj911a5tE3v8aPWK5ZPEArQuB1DjvW+YVi4MnWvj4WdBcyQ6W7ViHlkpPXwu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ntkwzJFV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ntkwzJFV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773742259; x=1805278259;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VS5shox7xBvFAPW1FpL4joq45+qOo+6vqaHAWgVWd3Q=;
  b=ntkwzJFVv+1zusZAaoV+DY7sUlvbxjqo5h/G/oQ0rwdbcdgyGFp+1R/d
   aMy9InViSKzZ9vonocpDLwgaIUbf84sLP7EBAru2oJhRjNQU4xETdbw29
   N1PBcszEnswFsmjBsvdGWp3ju3rOZ4iJyPovKJg2GjQERslXv+qDQa+0E
   PyJ+Ff1TGYttOsCc0YXojvcTLhHGF/hMduMzmYmWkPXANTYAoUYxseVWZ
   7bQonpddCYhY8bEKtYuRoD/ES5I2vsPHoFXYbzH+8XmjqzOduwUlUa7ad
   BdC9HozOJ7UiNlZmi9HYhQr0nbv53HYxBUULiOQsDZ1HT0BVKTKqyp1la
   g==;
X-CSE-ConnectionGUID: vIxG86D3QCOA5xRNQgJsVQ==
X-CSE-MsgGUID: XeTOjjbTT1uHBy9SeQSCxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="78374855"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="78374855"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 03:10:58 -0700
X-CSE-ConnectionGUID: KnOA7o/fTAmQ9TxZsvp/iQ==
X-CSE-MsgGUID: M5lclK9vQk6eBLUT04UBjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="222275712"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 17 Mar 2026 03:10:56 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2RO1-000000004Px-2zd4;
	Tue, 17 Mar 2026 10:10:53 +0000
Date: Tue, 17 Mar 2026 11:10:27 +0100
From: kernel test robot <lkp@intel.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>, rppt@kernel.org,
	pratyush@kernel.org, linux-kernel@vger.kernel.org,
	dmatlack@google.com, akpm@linux-foundation.org, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5/6] liveupdate: Make unregister functions return void
Message-ID: <202603171111.YBKWkKnp-lkp@intel.com>
References: <20260317025049.494931-6-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317025049.494931-6-pasha.tatashin@soleen.com>

Hi Pasha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-nonmm-unstable]
[also build test WARNING on akpm-mm/mm-everything linus/master v7.0-rc4 next-20260316]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pasha-Tatashin/liveupdate-Protect-file-handler-list-with-rwsem/20260317-105522
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20260317025049.494931-6-pasha.tatashin%40soleen.com
patch subject: [PATCH 5/6] liveupdate: Make unregister functions return void
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260317/202603171111.YBKWkKnp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603171111.YBKWkKnp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603171111.YBKWkKnp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/kexec_core.c:18:
>> include/linux/liveupdate.h:274:2: warning: void function 'liveupdate_unregister_flb' should not return a value [-Wreturn-mismatch]
     274 |         return -EOPNOTSUPP;
         |         ^      ~~~~~~~~~~~
   1 warning generated.


vim +/liveupdate_unregister_flb +274 include/linux/liveupdate.h

cab056f2aae725 Pasha Tatashin 2025-12-18  270  
e62bd1ab0687a1 Pasha Tatashin 2026-03-16  271  static inline void liveupdate_unregister_flb(struct liveupdate_file_handler *fh,
cab056f2aae725 Pasha Tatashin 2025-12-18  272  					     struct liveupdate_flb *flb)
cab056f2aae725 Pasha Tatashin 2025-12-18  273  {
cab056f2aae725 Pasha Tatashin 2025-12-18 @274  	return -EOPNOTSUPP;
cab056f2aae725 Pasha Tatashin 2025-12-18  275  }
cab056f2aae725 Pasha Tatashin 2025-12-18  276  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
