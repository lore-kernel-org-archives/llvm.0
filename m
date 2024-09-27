Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AF9158552;
	Fri, 27 Sep 2024 05:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727413742; cv=none; b=aDbBB8SEYtKb/4ZLHBEngFCrnRnpRiQETqMldTcaXkC0p/3rCOYGDSYwq+flDNHU/2e//qNaSljqZmgx6NYBYrelI1reACo+cAP+cdTj0WZ+/gR0SFL7wVgU/rMdYRG3ph61WZD418Msb4huOCeXjhgkTD+AH2DkreHPrae1Htk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727413742; c=relaxed/simple;
	bh=l3nfVL0eqxDLWYwxoVXic2cGxWPf/a9OL+E74o+Tfrs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WPiGZaMlfqLnAoM1rZfzCy7ZgQg6PKwkzTwueRbMAZiXLJ9fRtOHS6qDabCbQ3gubteV/Hm/hIy4MYqs5NPrKUhvAm1kgFFNSIg20WgQoI+OpQbVan5CtKYhY+2chivQd+2+vBo/hmjcPb/JvwFqq5ttStx/Z6tDsT9ld7K8Rjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nyPYGEiO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nyPYGEiO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727413741; x=1758949741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l3nfVL0eqxDLWYwxoVXic2cGxWPf/a9OL+E74o+Tfrs=;
  b=nyPYGEiO4DJH4sBOnUlRixoAEm8UcdwSb5KSzoaFPlAzDZH6mzpa63vc
   gnOIYyHTRSXSYjy1VPehHQkEQhy1IC65IXzP98sCgRS+f4UEvE/LXS1LG
   fGWs56TvpXJHQXovd2fO6eSDHhnmmc6p5/r8JFw1v3z8ebPpw967bOWAs
   kFvRzU0l5MX+08XiZE4sLmziAXotLURfU7noVElVx3Xv7svxLd212XqRR
   JdQGhU6d6iIOkyen7PJxk+nnYjf663oBT3wHulwpExtyxmc635mPUBnxn
   bV25mxL3tzB3PqZ6kPEQKiEzQI3reky7Mph5ZlI45vgdNtIHl5hHls9Le
   Q==;
X-CSE-ConnectionGUID: cDH1AB3xQbOlzco7nJnrJA==
X-CSE-MsgGUID: K3pcYXVcQ2G2eLHzyzadMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26056001"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="26056001"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 22:08:58 -0700
X-CSE-ConnectionGUID: jkVDIDjOToKKHprxznmiPA==
X-CSE-MsgGUID: 7jSsb75iSQ6u4q/J6JbX6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="72062957"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Sep 2024 22:08:56 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su3Dq-000LVD-0U;
	Fri, 27 Sep 2024 05:08:54 +0000
Date: Fri, 27 Sep 2024 13:07:57 +0800
From: kernel test robot <lkp@intel.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Davor Joja <davor.joja@logicbricks.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 230/1001]
 drivers/media/i2c/adv7511-v4l2.c:2221:21: warning: no previous prototype for
 function 'adv7511_subdev'
Message-ID: <202409271334.DDXpAubC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: c1d6baee0952a986dc51e9ca168acc6143b4a417 [230/1001] drivers: media: Customized adv7511 for Xylon LogiCVC (deprecated)
config: i386-buildonly-randconfig-001-20240927 (https://download.01.org/0day-ci/archive/20240927/202409271334.DDXpAubC-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271334.DDXpAubC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271334.DDXpAubC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/adv7511-v4l2.c:2221:21: warning: no previous prototype for function 'adv7511_subdev' [-Wmissing-prototypes]
    2221 | struct v4l2_subdev *adv7511_subdev(struct v4l2_subdev *sd)
         |                     ^
   drivers/media/i2c/adv7511-v4l2.c:2221:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2221 | struct v4l2_subdev *adv7511_subdev(struct v4l2_subdev *sd)
         | ^
         | static 
   1 warning generated.


vim +/adv7511_subdev +2221 drivers/media/i2c/adv7511-v4l2.c

  2220	
> 2221	struct v4l2_subdev *adv7511_subdev(struct v4l2_subdev *sd)
  2222	{
  2223		static struct v4l2_subdev *subdev;
  2224	
  2225		if (sd)
  2226			subdev = sd;
  2227	
  2228		return subdev;
  2229	}
  2230	EXPORT_SYMBOL(adv7511_subdev);
  2231	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
