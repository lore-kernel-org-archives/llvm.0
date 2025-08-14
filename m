Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DCB2248BE;
	Thu, 14 Aug 2025 06:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755151878; cv=none; b=nKPxdi6BEgN11pjiD6YJ+JHQ4RpCjsPPsnuTU18EZyU8Aid0LSaQiYn6Z2q9MoZ2dD++4mOCC/XGse4jYHoL9KwCHm5+lGpZu6ZQkpg2AYVowNZMNYZjiqEt/G8IE93hB3j11953i+wUYHLxx13e2S2CKs342LPOSbb4uRSzTkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755151878; c=relaxed/simple;
	bh=Vqzf3jYO0hk0HCapcZuofsufNC86hpZ+tKxzV8FJKXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ptAhG2aq5oBpOoDGx+dIgtNGlh9swpFXn+scEp5wrKBQs4jVVzD7Oeu3cv5Y/TylZ54rrmPDHr1ubOXAMndM+krtoBP4pFXrBd0QyyGsDha6kdM8gRtCXs5tlFPw7usS361r0ysJ7mNYnhq9dn/GVmsSIixeDUZAVRE+1Clfrgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hgDs7Ro2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hgDs7Ro2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755151877; x=1786687877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vqzf3jYO0hk0HCapcZuofsufNC86hpZ+tKxzV8FJKXA=;
  b=hgDs7Ro2dYvKmk50U2me5ySHJcfsm7GIISMN77lhYe5aIrnjszEUjEP0
   FRGffot9IS6/GDYFteGUKvmdL2XgwdjG9zURkPQ9jYD0PNA+lJlUk0oV9
   HNOeqFZ/d12YU1GjR+hfttjfB+KTYjUKPJ/SsKzmCxzEhwyc2wNvifEo8
   AfQVgbhk9JX1Sd5Y6YinavSpRnT0BYBpbqSN2rJJiR5exgsAx+Zxcg+Qa
   /EWLDG2jgupKjuSJTtOCmKb8PJ8p/dIGOzzMAS5vcl+KmMFz4MNop4VbA
   bS7vET7uhe+Dlma1CYRJE8afkr+BfCqbhEuFlCj81CqlYal+WngATP7DT
   A==;
X-CSE-ConnectionGUID: pWTHoMbtRui07dVa/chLPw==
X-CSE-MsgGUID: JBk9eZN+R/a6eOLsgoAuFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="67730424"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="67730424"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 23:11:16 -0700
X-CSE-ConnectionGUID: 5rSQ3uN0RRuIMibDI9x1nQ==
X-CSE-MsgGUID: D9uRtprpR96Rh5SG/weQzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="197531409"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 13 Aug 2025 23:11:14 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umRBA-0000DH-0f;
	Thu, 14 Aug 2025 06:11:12 +0000
Date: Thu, 14 Aug 2025 08:10:24 +0200
From: kernel test robot <lkp@intel.com>
To: Alex Markuze <amarkuze@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ilya Dryomov <idryomov@gmail.com>,
	Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>
Subject: [linux-next:master 2350/2527] Warning: fs/ceph/mds_client.c:2703
 function parameter 'path_info' not described in 'ceph_mdsc_build_path'
Message-ID: <202508140809.TGOyvOA3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   931e46dcbc7e6035a90e9c4a27a84b660e083f0a
commit: 7128e41a490709c759fde32898eade197acd0978 [2350/2527] ceph: fix race condition validating r_parent before applying state
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250814/202508140809.TGOyvOA3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508140809.TGOyvOA3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508140809.TGOyvOA3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/ceph/mds_client.c:2703 function parameter 'path_info' not described in 'ceph_mdsc_build_path'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
