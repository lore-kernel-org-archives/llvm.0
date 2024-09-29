Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF6633F6;
	Sun, 29 Sep 2024 13:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727618134; cv=none; b=NwThBOvkQDk2QU1tPwFCKI7PfHrw5E+89ms9e5EjzNLElI61Fbm0Y4UUSY9jQKZmN2jh65eLqKNMORFzGF182aDeJWTTFdSoRKtZPF6e4wjPtzj9drJi/0ByXB7tnKA4FiOrhcUEDtWu6gGmgyczRROUiAT3DIwYdbjcnT7DmkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727618134; c=relaxed/simple;
	bh=1ZU7O1WMtBTD/n4HGNPq7NJ5uFG+u/UGbZQ5fX5XCHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bbhENBPNwqHRTwdlMz4h4Ke+sU885FpP0RXsU5+VovCxEpNkB1nb0jnB1AB+HaQj5n4fe4lu+qgJVZJ8+2k9ZZVGF3J1pP3cZpOiiXVvElrQ6zAe07I0qzjDC7sHGlGFteQcUdnniyh17FaNQDsxy8Or2XwMCSiZ4fvHp0Ilu2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SFGAHEwL; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SFGAHEwL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727618132; x=1759154132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ZU7O1WMtBTD/n4HGNPq7NJ5uFG+u/UGbZQ5fX5XCHo=;
  b=SFGAHEwL97u3ajU9OGU4mQ8xMkyVpd6qAelvp+JPUFe8i7o+mBeLcXYV
   C0wAOzyFhGf1Bp5BwFHwaL6HXmjXzTSL20qzPZaKgUigRpAiDY1Meh1Af
   ssx1453yIgI3LVe2zLRvB8oylZko/HnmxiJBWkFDUB3FMZvIWwQ9eQ0mb
   5LpjjFoD8H3Ib6kPwd2KZhU8vYDhIyYNJovWGQ5EM8lID6h9ORCtX5asM
   +6PTKMpRS3AQFBe5EyqVpsMctmrz76WkUG6lk9sq26y+GYbLsd4dPbXGP
   yvDO6iLmLsitXUS0dWlhgsvy0Jqf0ffT/a1h46KocSK4qkezgdLNGqZJP
   g==;
X-CSE-ConnectionGUID: NECQ7LvNQ++ETfsNA4CEJg==
X-CSE-MsgGUID: Rc3JjRARQ9Ctu3oLzM8Abw==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="14330514"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="14330514"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 06:55:31 -0700
X-CSE-ConnectionGUID: z2o1rvdHQb+uXJgjiSph5Q==
X-CSE-MsgGUID: ObcJJbQnSX+UKKLvUvKRBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="73010633"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Sep 2024 06:55:30 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suuOW-000OK1-0k;
	Sun, 29 Sep 2024 13:55:28 +0000
Date: Sun, 29 Sep 2024 21:54:43 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/070-audio 15/122]
 sound/soc/codecs/cs42l84.c:1019:34: warning: unused variable
 'cs42l84_of_match'
Message-ID: <202409292101.JLd8OAAh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   fca8dbbece94487c99eca8777789842962e4e1d9
commit: 9ee029babce6b9f263a0cf514395750176e4ff48 [15/122] wip: ASoC: cs42l84: Start new codec driver
config: i386-buildonly-randconfig-003-20240929 (https://download.01.org/0day-ci/archive/20240929/202409292101.JLd8OAAh-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409292101.JLd8OAAh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409292101.JLd8OAAh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/cs42l84.c:1019:34: warning: unused variable 'cs42l84_of_match' [-Wunused-const-variable]
    1019 | static const struct of_device_id cs42l84_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~
   1 warning generated.


vim +/cs42l84_of_match +1019 sound/soc/codecs/cs42l84.c

  1018	
> 1019	static const struct of_device_id cs42l84_of_match[] = {
  1020		{ .compatible = "cirrus,cs42l84", },
  1021		{}
  1022	};
  1023	MODULE_DEVICE_TABLE(of, cs42l84_of_match);
  1024	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
