Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625B4334374;
	Thu, 30 Apr 2026 15:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777563492; cv=none; b=U6DUXSmrT589vMWDenHBcMHHFIy89p09SpDCsfZTfbLHcqbKmZpRPKzefK01H4+Fvcgkg/DJWaOeggHMQj7qEansLo/PeNwKrpW9j0QRwjwZywUnKzDr+hXBfxL6vtCnq6vQsLHDLRomV4S2MnTtuZLX2MaaLsZg6/i2QzcwTlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777563492; c=relaxed/simple;
	bh=cas+fx9QXakeDSvStqAi7Mu9SLnLX6s+1H6MiiTcWN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2t0WXTJosw+9U9xWPAXrLEG5jZDRYm3F3i+fLHjr5O9g0uxvao3i8U1K1wjPB0TSaOLXRiqtrb+nvUUA8u5rdp6XeNdT+6MGmaPhgQV0njPpkobvPk/61lcoKtyg3TpYd9ke63ScLDo5VAo9mTljP5lv8kSrfCvn2HD77457OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KAu6CO/j; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KAu6CO/j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777563489; x=1809099489;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cas+fx9QXakeDSvStqAi7Mu9SLnLX6s+1H6MiiTcWN4=;
  b=KAu6CO/jiife/dVS4YSBB3AiGZU1YzY9xiwxRiyS7h1oaQpSWbYnyBSj
   sOkWJWHd4Vyr7RF27Jvo7NHhok8s76AIF4z+f+de/GZOj6NkGPECdgafS
   aQtNAQN8kRMD1D7VYB+PNiFVsROCKX6EDvcbmtLDEPCh6s72HHq52cOWu
   9F97l7NgXAj0fvCApYhcXpMzvmOiwp2fMDfhcHmS9cI19XDD7afwqLQ25
   DzMIaX7e8a73aV9gl2cGWViT50xTSYm7scCo+KtW169txqQGwUh53wNaD
   R37nNbgHDEtb8SHr1bSVKCk/fPgO1Lka4hss4OgMqRjJEKJARlxEWioCk
   Q==;
X-CSE-ConnectionGUID: 1LKAlbEBTri2fDlTyTARNA==
X-CSE-MsgGUID: czLjHTnWTnSj8s7ai6OsBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="78711874"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="78711874"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 08:36:41 -0700
X-CSE-ConnectionGUID: 0mtNTPv5QliVKNuQbrjNuQ==
X-CSE-MsgGUID: dPci9gAPRvmQGjxZuj+76g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="230261005"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Apr 2026 08:36:38 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wITRK-00000000CXY-2GqI;
	Thu, 30 Apr 2026 15:36:34 +0000
Date: Thu, 30 Apr 2026 23:36:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ren Wei <n05ec@lzu.edu.cn>, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, jbenc@redhat.com,
	yuantan098@gmail.com, yifanwucs@gmail.com, tomapufckgml@gmail.com,
	bird@lzu.edu.cn, lx24@stu.ynu.edu.cn, caoruide123@gmail.com,
	n05ec@lzu.edu.cn
Subject: Re: [PATCH net 1/1] net: nsh: handle nested NSH headers during GSO
Message-ID: <202604302359.kU59LnTI-lkp@intel.com>
References: <6112cce99b4e3571444a616d0fb19e91e2fcca72.1776597598.git.caoruide123@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6112cce99b4e3571444a616d0fb19e91e2fcca72.1776597598.git.caoruide123@gmail.com>

Hi Ren,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Ren-Wei/net-nsh-handle-nested-NSH-headers-during-GSO/20260423-084001
base:   net/main
patch link:    https://lore.kernel.org/r/6112cce99b4e3571444a616d0fb19e91e2fcca72.1776597598.git.caoruide123%40gmail.com
patch subject: [PATCH net 1/1] net: nsh: handle nested NSH headers during GSO
config: i386-randconfig-003-20260430 (https://download.01.org/0day-ci/archive/20260430/202604302359.kU59LnTI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604302359.kU59LnTI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604302359.kU59LnTI-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "skb_network_protocol" [net/nsh/nsh.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
