Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A62E33556E;
	Tue, 10 Feb 2026 09:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770715221; cv=none; b=KPtGICc8i5BymZFHw9sH5iLXS8rxUm08jKYfVAz315zuJKPH1YpmnHqqf06Y2/QCEPFxuAeeg+Xt7NSt2LQu5T03WxfY6L4LOTpTplyBQ/KkL/e6Kf1nYNkYz0cDWdjUjdOuFJLkQInemGjlJaqTRWKQsfLxiMr5SEyCCcc1z6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770715221; c=relaxed/simple;
	bh=eQgsNikdLA9WGtV+2Jc8iCxtoz8PhA8OzOuvWT7p0vA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RsB/7aABUJZ1teARaFyEBlL66jZAbRgUmD7Gr2ztNkIGOeEQpc5DdldIEqBWf6aCoQ6PLmIA3f/sr4j0EqZewKUhw3r+OTBFTsPjwU0A7L6nQ/Vj3McFZvygPcnw2lRmsxP4r5keWxDwmw1UwDKYw4eo9IriNyYZX3/0/17MW+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TIKYfris; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TIKYfris"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770715219; x=1802251219;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eQgsNikdLA9WGtV+2Jc8iCxtoz8PhA8OzOuvWT7p0vA=;
  b=TIKYfriskIE7uZwbQ79AYMjDUtfUvBi+D3T8OTmHJNcC89hZe7Ti56bE
   4bsRCQidedekRJsp3poPYaVh4hLIhPvWeSwEsqwj2e0C66dXJvf+LOy/w
   vYEB06XUjQRFqYf7lBGYE4FbYNXHMUddTtd1fmscbPK7IE/GsgCxG5BOr
   vc56V8D7bTK/yd0lxxm7YymleZCgvq0kfe/MQr5fdSnPygaG0lq2QMLZo
   3TnDK0ILbSPLd9npQm2e5TjuP8DUBF10/ph4roCk/LiXYohf4OMklMyzt
   lR6G5Ioew/P9rTtfzPo9eeUl+U1Pvts9S6Z4GTr+1M9E4jEfz/x2DROUH
   Q==;
X-CSE-ConnectionGUID: Ysf53ykDTLuhde63bR1rRg==
X-CSE-MsgGUID: SJjpcy+tQgyhUfZ22mUGzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71907999"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71907999"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 01:20:18 -0800
X-CSE-ConnectionGUID: X9Ft9ZWpQxOKN25NCH+yPg==
X-CSE-MsgGUID: ugjiqRXdTyWfnyhzJcwVwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211190798"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 10 Feb 2026 01:20:12 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpjuj-000000000kb-36fu;
	Tue, 10 Feb 2026 09:20:09 +0000
Date: Tue, 10 Feb 2026 10:19:57 +0100
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	willy@infradead.org, david@kernel.org, ziy@nvidia.com,
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
	byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com,
	apopple@nvidia.com, lorenzo.stoakes@oracle.com,
	baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz,
	jannh@google.com, rppt@kernel.org, mhocko@suse.com,
	pfalcato@suse.de, kees@kernel.org, maddy@linux.ibm.com,
	npiggin@gmail.com, mpe@ellerman.id.au, chleroy@kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 1/1] mm: replace vma_start_write() with
 vma_start_write_killable()
Message-ID: <202602101014.tdhEXT8X-lkp@intel.com>
References: <20260209220849.2126486-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209220849.2126486-1-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a1a876489abcc1e75b03bd3b2f6739ceeaaec8c5]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/mm-replace-vma_start_write-with-vma_start_write_killable/20260210-061104
base:   a1a876489abcc1e75b03bd3b2f6739ceeaaec8c5
patch link:    https://lore.kernel.org/r/20260209220849.2126486-1-surenb%40google.com
patch subject: [PATCH 1/1] mm: replace vma_start_write() with vma_start_write_killable()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260210/202602101014.tdhEXT8X-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101014.tdhEXT8X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101014.tdhEXT8X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/memory.c:381 duplicate section name 'Note'
>> Warning: mm/memory.c:381 duplicate section name 'Note'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
