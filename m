Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019033128A5;
	Mon, 22 Dec 2025 08:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391681; cv=none; b=MI1sQgJxCQ1IDVjXSRZxjjFJgy3EO3UfX+J89Bu5bwjClg0M8dyMjra+jD+vvqHsRM7uW8mi77g4KOYvNc6mTlqDmKEIzINVYo3mTqGGaY7SgVAgN+wi2rszUsFfo0c9wfGYIZd4h2QpaHcFbb/QOA7RLathnEOGD1zLHRqQ7eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391681; c=relaxed/simple;
	bh=DikYvWHsTS0gErwwUsi3XlV2R2wCwYBS+8sS1yI1Lsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H1jAEWSt8VucyPoIHAr85Brs16nKeNvm5zL+M8v3iYZ4GBrIrDwpks3pSutCAbJ9XLu9ciZ5j1ZrgJzp0jdiIT+mR5ZZLlLtDDZS+zK5l4THSsBXwlRkXCg5JWhyecSoJeMlVeWqxhOONQaoKoudWzI7kGUeM3sl0WETLbF7qPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O4y7Xo+U; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O4y7Xo+U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766391678; x=1797927678;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DikYvWHsTS0gErwwUsi3XlV2R2wCwYBS+8sS1yI1Lsw=;
  b=O4y7Xo+U06SoG722Jks7vKLTjjMzZylhq/vewyvZfc7dc4YjsFIzt9qS
   NHYXP9LqbeF6ERDhxMJ7+ADLFhbKaGjara0kzLvjarXEFDqIWs1r69bH/
   HG4RtwRNliSGRE7iE4O83808XLPCLa8slCP2PjLcoerVTvSnuLblFoOnk
   bK8TXDQ56Ca7q1N46fx1DalPiMpbWjO/eYbrumpPuJEM2j3zEEVQf6gYi
   cRsfRt22e6jUpoQSaS3JbcCO5O8xatwG9UqokH/eCXXFAlhCXzYGAckMZ
   CZfPzZ/44mQo2bEnapbj1ETUoMj2CQEX3s5aSGyAaxo6/TYh2QEpr0a6k
   g==;
X-CSE-ConnectionGUID: 76FSU7ZJQKi6b1L3JaukEQ==
X-CSE-MsgGUID: TtVhNSnMSRGZ5IcqIDnNug==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="85659673"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="85659673"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 00:21:17 -0800
X-CSE-ConnectionGUID: X4gyqA2MTHOhjFee/DRyXQ==
X-CSE-MsgGUID: Hy3+u999QiS6cCqpTPEnAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="204532086"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 22 Dec 2025 00:21:16 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXbAH-000000005PQ-2vkN;
	Mon, 22 Dec 2025 08:21:13 +0000
Date: Mon, 22 Dec 2025 09:21:09 +0100
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC wireless-next 3/3] wifi: mac80211: add initial UHR support
Message-ID: <202512220959.DI33UtEH-lkp@intel.com>
References: <20251216145903.585df78b9c8a.Ieec940b58dbf8115dab7e1e24cb5513f52c8cb2f@changeid>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216145903.585df78b9c8a.Ieec940b58dbf8115dab7e1e24cb5513f52c8cb2f@changeid>

Hi Johannes,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/wifi-ieee80211-add-some-initial-UHR-definitions/20251216-225003
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20251216145903.585df78b9c8a.Ieec940b58dbf8115dab7e1e24cb5513f52c8cb2f%40changeid
patch subject: [RFC wireless-next 3/3] wifi: mac80211: add initial UHR support
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251222/202512220959.DI33UtEH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220959.DI33UtEH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220959.DI33UtEH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[5]: *** No rule to make target 'net/mac80211/uhr.o', needed by 'net/mac80211/mac80211.o'.
   make[5]: Target 'net/mac80211/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
