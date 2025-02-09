Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25641392;
	Sun,  9 Feb 2025 04:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739074436; cv=none; b=NIr/5dctprBu4nO4z3O5BDArQm0H0NVTV5D5NZ3Myr8Mdl+2rlyoIS3p1RKjaBh8oezHNT2lgjSUGz7Dryu0eXVA1uTexYupsWm0mj/v7a7Nc7gvXYPPv41T3O1Ho4iVho9ELp653GvRiE6lOAqjPaqyfhJe6k5xl6cljW5bbVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739074436; c=relaxed/simple;
	bh=F6FXtsyIzJYLgJPkTFwS6xIQC1lB6GbKK5GzWJ78WtY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uNK/LcH4F3yZ6Rc8jvcjuMM+IR3036t+tOSefGjTlCljfAHBsFSwavV3DAyrn2FBCv+CyDGUjF/nm9bRkYPbsIfpYUk2ezI1dQg03ebgvtCWhnLha2mnKtVaR1XobUs7DDXvWInKN13NY+nhRZPJMry0Lppu6sTt/sqF3CPHGk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YCvnde66; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YCvnde66"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739074435; x=1770610435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F6FXtsyIzJYLgJPkTFwS6xIQC1lB6GbKK5GzWJ78WtY=;
  b=YCvnde662RflKSPXfybkKlmSfh2CeTF3TMsQkVUZrUdwOqYUsreKYn0f
   4tWbduSkD2W+Ezgr4n/nzHpH+1TdDMVgI95TgoSSfRHFQKugrPPcbmaad
   iFPkQdZlReCIaop1cA93PaUoWA9NxLz8IFaBBM+pYH2sW+BB8bE76DlxC
   DWz9toupBuPJviAywEaSTcTj6oSS6FastpmvMgzl69Z4q8x/i56TwZ4Mi
   u9R9t8tXe7CEqSp2EFqumQThTD7P4KOknY4lXbysLi42af68oxCpcU21+
   oSypf7Hzhkc4c79jnKnOsKf854NaJjz15l/GhP1hyur77zoImKgA5M6OV
   w==;
X-CSE-ConnectionGUID: G+OX6rbgS0KpaX7VnjcJ6w==
X-CSE-MsgGUID: ma5kdgCeQQK06HM87+BxiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="38911260"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="38911260"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 20:13:54 -0800
X-CSE-ConnectionGUID: OkpTF8rZRKecJL5TKE5wGw==
X-CSE-MsgGUID: mxw66yELQQ2pofae2PvjUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="111705879"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Feb 2025 20:13:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgyhb-00114B-0d;
	Sun, 09 Feb 2025 04:13:51 +0000
Date: Sun, 9 Feb 2025 12:13:00 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?L=E9o_Paill=E9?= <leo.paille@enseirb-matmeca.fr>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:pr/1142 1/13] error[E0463]: can't find crate for `core`
Message-ID: <202502091239.ef1BATqK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1142
head:   577cf61b408a5196cda82c1cc670758fc8c5cb25
commit: 1a5b54ff560db6b593bbd43135f1304ac6b975cf [1/13] add base driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250209/202502091239.ef1BATqK-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502091239.ef1BATqK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502091239.ef1BATqK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0463]: can't find crate for `core`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
