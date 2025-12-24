Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41998345CD8;
	Wed, 24 Dec 2025 15:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766589022; cv=none; b=Ojxhoems5xdycYLeSTslCdbYK2mRNe5GGoO/EEidN7j43uFBUu7Y0VWnMqltWMRE60lO6UJSQiRlOglWRfaW2sm/33Q3LkYb9eCiX2ybImI4FwFUby4q5xWcaUE/pg9JV7jPYh+AhlRI6C5/pFZJLizGLpCFr35wN60JFrU16TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766589022; c=relaxed/simple;
	bh=6w4suvYy3Yd5Tthp96Im37P1lvbu9wNR0ef6oInsMTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hT/dAPbQl/DLp3TL76ql3O/E/k74GLIiCW7pLzPtJgPdMBPy2wQZyrWkEu1l/OigFskqzVTHP6LOb7TleD5swEqQje3W1w36vSehlWBBRUk1ZmGll9v5umpqiUD+Nq6oOi14/vWaizk4GzLjzFWNPV+iSNy3q0dlwbglc7o7YuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O/n8Ys/Z; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O/n8Ys/Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766589017; x=1798125017;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6w4suvYy3Yd5Tthp96Im37P1lvbu9wNR0ef6oInsMTM=;
  b=O/n8Ys/ZO6BSWITqpzNyENjpSF+nR0qACnC5cm4mSRLklM+AFKL1aMMC
   88Pz+cQdO20MupXlnRQAR2chgnGWt5wnQ62JL+B64ZtI94H7ShGKK8IKm
   zs4uT8LgaxNRdkTS0QuPpGSSfSG085YtClEBlCxBevf7fNsCHW9zI2Piv
   RX20khfMJd2RhYPfOrH2jzFgzKEkfqaxpPdLsblkoH3sxz7PlVsHleS57
   L0wBqvPud2LgihaDNy0+jrdNyu/0ndntpaE6UcFzE0IFAHoxpTz9THQjW
   7kUaeVMRGEBRy0xg6+gO+9uB8vN+bBNsaIlu3AWggdlN90henntXpB8sW
   A==;
X-CSE-ConnectionGUID: qtyIwNwPSmqhfedwyV2Hxw==
X-CSE-MsgGUID: At/8QMlDQNGdvEhwYPYhEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68408027"
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="68408027"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 07:10:16 -0800
X-CSE-ConnectionGUID: X4WSqm+SR7KqqHHrwYTqZA==
X-CSE-MsgGUID: q5YeptrTSkCjGWlbAZ5V7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="237425597"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 Dec 2025 07:10:16 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYQVB-000000003B3-25kb;
	Wed, 24 Dec 2025 15:10:13 +0000
Date: Wed, 24 Dec 2025 23:09:27 +0800
From: kernel test robot <lkp@intel.com>
To: Gladyshev Ilya <foxido@foxido.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/3] rust: sample driver for WMI demonstrations
Message-ID: <202512242235.PPZwsyor-lkp@intel.com>
References: <905217b6dc4dda707e3596737b4ade9a210aa445.1766331321.git.foxido@foxido.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <905217b6dc4dda707e3596737b4ade9a210aa445.1766331321.git.foxido@foxido.dev>

Hi Gladyshev,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 9094662f6707d1d4b53d18baba459604e8bb0783]

url:    https://github.com/intel-lab-lkp/linux/commits/Gladyshev-Ilya/rust-implement-wrapper-for-acpi_object/20251222-064506
base:   9094662f6707d1d4b53d18baba459604e8bb0783
patch link:    https://lore.kernel.org/r/905217b6dc4dda707e3596737b4ade9a210aa445.1766331321.git.foxido%40foxido.dev
patch subject: [RFC PATCH 3/3] rust: sample driver for WMI demonstrations
config: i386-randconfig-014-20251224 (https://download.01.org/0day-ci/archive/20251224/202512242235.PPZwsyor-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512242235.PPZwsyor-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512242235.PPZwsyor-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: target file "./scripts/target.json" does not exist

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
