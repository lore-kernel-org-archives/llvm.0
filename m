Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385B22AD16;
	Wed, 17 Sep 2025 03:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758081588; cv=none; b=NVnvGE9OONpa4C1qWA5Yd+N810LQms5SfJecxcdBlH6vXuYznuNj6WWZEWxsYcrFbGRCf80zqcfplw26Qtgo7ceC8tQhLF+e7wVA3g7fykXQj6ydsyoUI4bq2xldklVYv2/747ftJVkez4jqV0AAbouKqz3n21TLE1WJwyzXnnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758081588; c=relaxed/simple;
	bh=H9thyNiLTdBDPl30sbess+15GJm36k6HegAlHIfWnHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uIs0OyA9/25OtBDVe/hhTPl1UWXp3oT40n+zC1y+HjEICWd+IpTHvgGnjUtbSazqnwF1aAv/MeGkvsEycfJmNIG4AZLjAcHT/4JajV2Rr5W05bs+nsXUzYhO6nFB6bPSr8+vcRcnPsCam/HawD8hHILzqCY8yTYf+879ItuWWR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DBelvs2+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DBelvs2+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758081586; x=1789617586;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H9thyNiLTdBDPl30sbess+15GJm36k6HegAlHIfWnHU=;
  b=DBelvs2+fS+ZAGbH8kAqbpxPFhJGtjk71UoA28vZSiSbP7IwWWMgNIFI
   huYn7ORuvDpUP64HZ3IeveXv44fizWvx5W2T5Np2/qny/s0ITxI+3tjo6
   qbCbITWXOY4pwEFhFZ8E4BzBxTH2GWFRNpQ3e4JCseIyz+p8YOl9n0/M7
   A4Zi4+bCXKJ98S75cd+BbcxIvCCA35vKSs/nszHijM0lYcYPBbIXDjN1e
   4nnxZyMfzsh5E0Iku/CadTJtaCaFOG44qTWbWqiKzRVXjHGqU1ux+wQMM
   mJiQ8ViET2f1Jz8j9ca65S96YKDG8kh8+TpMsJBUrKFIcV1Vc7zsp/vYp
   w==;
X-CSE-ConnectionGUID: h7laWN97StqCn5zvRNgzmA==
X-CSE-MsgGUID: VVfwSVZAStmSOGRRL24JTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="60305017"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; 
   d="scan'208";a="60305017"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 20:59:45 -0700
X-CSE-ConnectionGUID: 8r1RW9JuQCOoNSWzEvSMaQ==
X-CSE-MsgGUID: 7cId5LfgQUu8YUrX2ncqBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; 
   d="scan'208";a="180266969"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Sep 2025 20:59:38 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyjKS-000127-0B;
	Wed, 17 Sep 2025 03:59:36 +0000
Date: Wed, 17 Sep 2025 11:59:20 +0800
From: kernel test robot <lkp@intel.com>
To: Ethan Graham <ethan.w.s.graham@gmail.com>, ethangraham@google.com,
	glider@google.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	andreyknvl@gmail.com, andy@kernel.org, brauner@kernel.org,
	brendan.higgins@linux.dev, davem@davemloft.net, davidgow@google.com,
	dhowells@redhat.com, dvyukov@google.com, elver@google.com,
	herbert@gondor.apana.org.au, ignat@cloudflare.com, jack@suse.cz,
	jannh@google.com, johannes@sipsolutions.net,
	kasan-dev@googlegroups.com, kees@kernel.org,
	kunit-dev@googlegroups.com, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lukas@wunner.de,
	rmoar@google.com, shuah@kernel.org, tarasmadan@google.com
Subject: Re: [PATCH v1 03/10] kfuzztest: implement core module and input
 processing
Message-ID: <202509171131.vod7tLWH-lkp@intel.com>
References: <20250916090109.91132-4-ethan.w.s.graham@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916090109.91132-4-ethan.w.s.graham@gmail.com>

Hi Ethan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-nonmm-unstable]
[also build test WARNING on herbert-cryptodev-2.6/master herbert-crypto-2.6/master linus/master v6.17-rc6 next-20250916]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ethan-Graham/mm-kasan-implement-kasan_poison_range/20250916-210448
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20250916090109.91132-4-ethan.w.s.graham%40gmail.com
patch subject: [PATCH v1 03/10] kfuzztest: implement core module and input processing
config: x86_64-randconfig-004-20250917 (https://download.01.org/0day-ci/archive/20250917/202509171131.vod7tLWH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509171131.vod7tLWH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509171131.vod7tLWH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: lib/kfuzztest/main.c:46 struct member 'num_invocations' not described in 'kfuzztest_state'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
