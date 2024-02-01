Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8D5CA42;
	Thu,  1 Feb 2024 01:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706752548; cv=none; b=CFUwzfNBv+SI8bCM28zY1/zKOBnqpZ1YZsoqZwz5eV2lGMTooTdCNIXfBSSygjTxAYza6ve/ANqR30tsx//O0FQieGvkoXLeCDLPt5JEz/OnmAUc7E2T1bhq9xYzFC5ragwrMQs+4steuZ3P4dSdIIIQbtd2nxyoJiYJlFS2wXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706752548; c=relaxed/simple;
	bh=A0uCMKpiKNtmbFdzwyqw0VC5v0VskYSCcbSSLZj+FQU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SU9m+a+VvjRk2xrCxu0//VNfXQT38Y8GaMNbxA2d3aXllsT6Zd2DxyZ1MM43YA6QCCSHI7CKjIadHXCNIliLzyObH+Pvxut0yIx6IXEKIWA39IQbCvZ2TC635nHYPpAN5rdfnq79k9Ohl4W1YiKp9AYaBe2faTVpPJWqxoMSG1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VumrhoX7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VumrhoX7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706752547; x=1738288547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A0uCMKpiKNtmbFdzwyqw0VC5v0VskYSCcbSSLZj+FQU=;
  b=VumrhoX7u3KGq3BmGKk2f+rSfilTZP6+KIoIlMdBOL32tH8EZp8l6Iz5
   NmUnbVXrAuaFconL0JYcAAxv62BTyxB1ixGxWhD+Hogp9WlTfEobREoVB
   1C6t9RaMzoL0wmsP05TgFjm44/CIrJgHmKONO6Lti1s44g5lv50e9fs5c
   JnlqyBo1rc56eHUrNh6psH+rEdr4dacdA+OiC1dGK4KW0adlenv7X7oQb
   i6FMGdYEnYC6oGQl41T1/8jKq/zzn6l8fBOBzEUQhVa0Yu+p6qFon9Agt
   9X13LT/Jnmuq0j8iD/YS5KDQzRGrSJ5ETinWLD6spP3W95rReWJvl/GBh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10435478"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="10435478"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 17:55:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="908093182"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="908093182"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 31 Jan 2024 17:55:45 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVMIn-0002Ge-2v;
	Thu, 01 Feb 2024 01:55:42 +0000
Date: Thu, 1 Feb 2024 09:54:17 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Sa <nuno.sa@analog.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Nuno Sa <noname.nuno@gmail.com>
Subject: [nsa:dev/iio-backend-axi-dds-test 20/20]
 drivers/iio/dac/adi-axi-dac.c:65:1: warning: non-void function does not
 return a value
Message-ID: <202402010942.619gPo9U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nunojsa/linux dev/iio-backend-axi-dds-test
head:   56a0faf5df7548936623a26c728ff3f0e970ef6a
commit: 56a0faf5df7548936623a26c728ff3f0e970ef6a [20/20] more stuff
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240201/202402010942.619gPo9U-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fdac7d0b6f74f919d319b31a0680c77f66732586)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240201/202402010942.619gPo9U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402010942.619gPo9U-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iio/dac/adi-axi-dac.c:63:24: warning: unused variable 'st' [-Wunused-variable]
      63 |         struct axi_dac_state *st = iio_backend_get_priv(back);
         |                               ^~
>> drivers/iio/dac/adi-axi-dac.c:65:1: warning: non-void function does not return a value [-Wreturn-type]
      65 | }
         | ^
   drivers/iio/dac/adi-axi-dac.c:69:24: warning: unused variable 'st' [-Wunused-variable]
      69 |         struct axi_dac_state *st = iio_backend_get_priv(back);
         |                               ^~
   drivers/iio/dac/adi-axi-dac.c:70:1: warning: non-void function does not return a value [-Wreturn-type]
      70 | }
         | ^
   4 warnings generated.


vim +65 drivers/iio/dac/adi-axi-dac.c

    60	
    61	static int axi_dac_buffer_preenable(struct iio_backend *back)
    62	{
    63		struct axi_dac_state *st = iio_backend_get_priv(back);
    64	
  > 65	}
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
