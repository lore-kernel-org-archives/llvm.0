Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C8E1850AF;
	Fri, 23 Aug 2024 12:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724416530; cv=none; b=ak+RlMaUOlqFQEd8m2SghuLtpvGaE6dQ2f8S8WLdaqdGWNZOPhm0VBR0jkUqhNvqVsUFjucj33q/15TfMvebsGcmlvksTsSbMWj88zRns4cjLkk743GTkm0TUVZ0BM1/+PWhQ3wmpSFyjuYN7SigDH23lj1PD9DKK6yR8gzZPnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724416530; c=relaxed/simple;
	bh=ix6vXKCUbnKnqPEkpF9Bih2vIgrDcu1Z3BK9hyeomeA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ed23Xp008mRS2qcsw4j8LAvLCcyMm+yQjAIhuUQYxUjFXhP6x40ogvOjU3vqHXKY+Urtyb/Fseq2QduJF/PW0PLcPluwkptIgwcc6svQ/qKvHjW2TjW6QyGFnfnt9ZlJDo1c9gh7cswSJG479G2Zub3ziwSvUAZxJYtLNks4OBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RGUtSxEf; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RGUtSxEf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724416528; x=1755952528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ix6vXKCUbnKnqPEkpF9Bih2vIgrDcu1Z3BK9hyeomeA=;
  b=RGUtSxEfQefIMagxyWMNPksCy4QFU4ysqaFqbdpcCkPcLPw2OcFBLIow
   qKKcYetKRdHomhwuUegXhLJKlg5ocRfrWVsu1sBgY7D1RQySlbyR2hkUc
   ALES57VTwFlXbJwJTA8O2nipThdxsi4Ivg5vjTRVZczvYLvoM9+ZsdIma
   wPhvYgCx300O6IZrsf5ebrx0Qr/dCiUws8fmhMOPF/atFCezIkAZKeN1G
   XoL0tGMGlooSkQwQG7NLj2St5PC6wfNwiBXmyyCs82ZGrHra3Sb8ARtwx
   VcJCCF03lGR1Bxvq8nCWTziFcauxLH2m8/UVRmYQSalbAkj59E8r7Lnmc
   w==;
X-CSE-ConnectionGUID: /EX4kYU7SlS9wwHcXo9DeQ==
X-CSE-MsgGUID: t6Y3BuBySuyKLL7HleJtbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33505131"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="33505131"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 05:35:28 -0700
X-CSE-ConnectionGUID: SHAeHeDoSGWSMIRPnDqBMA==
X-CSE-MsgGUID: 99cntAGlTJWmRrCGIMPVgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="62303847"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Aug 2024 05:35:26 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shTVj-000Dhc-2t;
	Fri, 23 Aug 2024 12:35:23 +0000
Date: Fri, 23 Aug 2024 20:35:15 +0800
From: kernel test robot <lkp@intel.com>
To: Simon Horman <horms@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [staging:staging-testing 36/53]
 drivers/staging/rtl8192e/rtllib_crypt_tkip.c:640:7: warning: variable 'iv16'
 set but not used
Message-ID: <202408232049.UJef268y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-testing
head:   5315266844ea3b0b8b6be9842d5901e439fa838a
commit: 5f1a6826ea4900f8540d5eeb29f97796860f2d08 [36/53] staging: rtl8192e: remove set but otherwise unused local variable iv32
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240823/202408232049.UJef268y-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408232049.UJef268y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408232049.UJef268y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/rtl8192e/rtllib_crypt_tkip.c:640:7: warning: variable 'iv16' set but not used [-Wunused-but-set-variable]
     640 |                 u16 iv16 = tkey->tx_iv16;
         |                     ^
   1 warning generated.


vim +/iv16 +640 drivers/staging/rtl8192e/rtllib_crypt_tkip.c

ecdfa44610fa18 drivers/staging/rtl8192e/ieee80211/ieee80211_crypt_tkip.c Greg Kroah-Hartman 2009-08-04  626  
94a799425eee82 drivers/staging/rtl8192e/rtllib_crypt_tkip.c              Larry Finger       2011-08-23  627  static int rtllib_tkip_get_key(void *key, int len, u8 *seq, void *priv)
ecdfa44610fa18 drivers/staging/rtl8192e/ieee80211/ieee80211_crypt_tkip.c Greg Kroah-Hartman 2009-08-04  628  {
94a799425eee82 drivers/staging/rtl8192e/rtllib_crypt_tkip.c              Larry Finger       2011-08-23  629  	struct rtllib_tkip_data *tkey = priv;
ecdfa44610fa18 drivers/staging/rtl8192e/ieee80211/ieee80211_crypt_tkip.c Greg Kroah-Hartman 2009-08-04  630  
ecdfa44610fa18 drivers/staging/rtl8192e/ieee80211/ieee80211_crypt_tkip.c Greg Kroah-Hartman 2009-08-04  631  	if (len < TKIP_KEY_LEN)
ecdfa44610fa18 drivers/staging/rtl8192e/ieee80211/ieee80211_crypt_tkip.c Greg Kroah-Hartman 2009-08-04  632  		return -1;
ecdfa44610fa18 drivers/staging/rtl8192e/ieee80211/ieee80211_crypt_tkip.c Greg Kroah-Hartman 2009-08-04  633  
ecdfa44610fa18 drivers/staging/rtl8192e/ieee80211/ieee80211_crypt_tkip.c Greg Kroah-Hartman 2009-08-04  634  	if (!tkey->key_set)
ecdfa44610fa18 drivers/staging/rtl8192e/ieee80211/ieee80211_crypt_tkip.c Greg Kroah-Hartman 2009-08-04  635  		return 0;
ecdfa44610fa18 drivers/staging/rtl8192e/ieee80211/ieee80211_crypt_tkip.c Greg Kroah-Hartman 2009-08-04  636  	memcpy(key, tkey->key, TKIP_KEY_LEN);
ecdfa44610fa18 drivers/staging/rtl8192e/ieee80211/ieee80211_crypt_tkip.c Greg Kroah-Hartman 2009-08-04  637  
ecdfa44610fa18 drivers/staging/rtl8192e/ieee80211/ieee80211_crypt_tkip.c Greg Kroah-Hartman 2009-08-04  638  	if (seq) {
ecdfa44610fa18 drivers/staging/rtl8192e/ieee80211/ieee80211_crypt_tkip.c Greg Kroah-Hartman 2009-08-04  639  		/* Return the sequence number of the last transmitted frame. */
ecdfa44610fa18 drivers/staging/rtl8192e/ieee80211/ieee80211_crypt_tkip.c Greg Kroah-Hartman 2009-08-04 @640  		u16 iv16 = tkey->tx_iv16;
3a6b70c3f3558a drivers/staging/rtl8192e/rtllib_crypt_tkip.c              Matthew Casey      2014-08-22  641  
ecdfa44610fa18 drivers/staging/rtl8192e/ieee80211/ieee80211_crypt_tkip.c Greg Kroah-Hartman 2009-08-04  642  		iv16--;
ecdfa44610fa18 drivers/staging/rtl8192e/ieee80211/ieee80211_crypt_tkip.c Greg Kroah-Hartman 2009-08-04  643  		seq[0] = tkey->tx_iv16;
ecdfa44610fa18 drivers/staging/rtl8192e/ieee80211/ieee80211_crypt_tkip.c Greg Kroah-Hartman 2009-08-04  644  		seq[1] = tkey->tx_iv16 >> 8;
ecdfa44610fa18 drivers/staging/rtl8192e/ieee80211/ieee80211_crypt_tkip.c Greg Kroah-Hartman 2009-08-04  645  		seq[2] = tkey->tx_iv32;
ecdfa44610fa18 drivers/staging/rtl8192e/ieee80211/ieee80211_crypt_tkip.c Greg Kroah-Hartman 2009-08-04  646  		seq[3] = tkey->tx_iv32 >> 8;
ecdfa44610fa18 drivers/staging/rtl8192e/ieee80211/ieee80211_crypt_tkip.c Greg Kroah-Hartman 2009-08-04  647  		seq[4] = tkey->tx_iv32 >> 16;
ecdfa44610fa18 drivers/staging/rtl8192e/ieee80211/ieee80211_crypt_tkip.c Greg Kroah-Hartman 2009-08-04  648  		seq[5] = tkey->tx_iv32 >> 24;
ecdfa44610fa18 drivers/staging/rtl8192e/ieee80211/ieee80211_crypt_tkip.c Greg Kroah-Hartman 2009-08-04  649  	}
ecdfa44610fa18 drivers/staging/rtl8192e/ieee80211/ieee80211_crypt_tkip.c Greg Kroah-Hartman 2009-08-04  650  
ecdfa44610fa18 drivers/staging/rtl8192e/ieee80211/ieee80211_crypt_tkip.c Greg Kroah-Hartman 2009-08-04  651  	return TKIP_KEY_LEN;
ecdfa44610fa18 drivers/staging/rtl8192e/ieee80211/ieee80211_crypt_tkip.c Greg Kroah-Hartman 2009-08-04  652  }
ecdfa44610fa18 drivers/staging/rtl8192e/ieee80211/ieee80211_crypt_tkip.c Greg Kroah-Hartman 2009-08-04  653  

:::::: The code at line 640 was first introduced by commit
:::::: ecdfa44610fa18678c3dd481af75368b9800c6c7 Staging: add Realtek 8192 PCI wireless driver

:::::: TO: Greg Kroah-Hartman <gregkh@suse.de>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
