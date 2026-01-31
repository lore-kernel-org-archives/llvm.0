Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8646A30DEA7;
	Sat, 31 Jan 2026 04:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769833610; cv=none; b=YUozm5UNK5iPSLq3fgn8cYzfU9gF17OWdSZtGSvZ8bUkq2QsfVAtIzEBOVppez4ltCGYw6hLTVY15wfhK1pg2klDFDwZ31NELs/n7XBzaRkPjwGcOKQ59VocNE5ZxDFlg4WfGYCdHrLOdkghkEB61tj3wlsaDCt/ydDlSqbrCKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769833610; c=relaxed/simple;
	bh=vDcsGwnWkPsQyHgEkiH5Fter62/Fr9fA+Ew484Uwqac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kwTV/e435vIasEl2BEUBsy9ZM5CQYtxDoZvAf7lGo76ZPA/4K+tUr4VEWw+iY82NuMS4NsvGYU/j7K5nUaAFJNQJaEhRmv9s/hT6527tK76ZnqV5dKuW5XuQYyMS8hgsL16q+2LMSeLDlAhPw3jLL0Sh/1DIJzEZ1hFy4Atb1TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AFA3eMnY; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AFA3eMnY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769833607; x=1801369607;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vDcsGwnWkPsQyHgEkiH5Fter62/Fr9fA+Ew484Uwqac=;
  b=AFA3eMnYEH9NY1F6ajaCoV+4EYv762BQUlMxeHkYSoAfvqwsFQZ6O4q4
   mEEKO1aOJAUWBGQ82f8fta4zI5xguKd2ec+BvQwXoTXUZ43Y3Yt7EvIVh
   eyRXt69t4X2bh9bJmkC3JLr/e4ylg9rruFc5KIYhWU4wfnbRxUKyN99m/
   d+BpUbAk3E6scJSRWCH9+19PhpNeb9fN0hzSu84j17AhfyxQexFqa61B6
   2zWPrW8kL+JNISUKpvgKC1NgcPQAZ+Hzq5K5wKOKLjgRHuqNDzEGhnNIM
   yjjf9N9ZSgDHkx6xE7NlbsqwkR2bK1Jav1y4VnqRcbnXcTVofnvESC0nH
   A==;
X-CSE-ConnectionGUID: Tkk92XMCSryH/jifA4Ujkw==
X-CSE-MsgGUID: NdCNChM7SU2eeD+Doeatjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="58663432"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="58663432"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 20:26:47 -0800
X-CSE-ConnectionGUID: gkFYJ0ngQu2tklQCfqynYg==
X-CSE-MsgGUID: PvKCKtOJQwKTdfPD/6AhFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="240283384"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Jan 2026 20:26:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm2ZG-00000000dds-3bEE;
	Sat, 31 Jan 2026 04:26:42 +0000
Date: Sat, 31 Jan 2026 12:26:42 +0800
From: kernel test robot <lkp@intel.com>
To: Luka Gejak <lukagejak5@gmail.com>, gregkh@linuxfoundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	straube.linux@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Luka Gejak <lukagejak5@gmail.com>
Subject: Re: [PATCH 2/3] staging: rtl8723bs: modernize hex output and WMM
 check
Message-ID: <202601311229.Q4R3mSEP-lkp@intel.com>
References: <20260128171635.39879-2-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128171635.39879-2-lukagejak5@gmail.com>

Hi Luka,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-linus]
[also build test WARNING on linus/master v6.19-rc7]
[cannot apply to staging/staging-testing staging/staging-next next-20260130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luka-Gejak/staging-rtl8723bs-modernize-hex-output-and-WMM-check/20260129-012011
base:   staging/staging-linus
patch link:    https://lore.kernel.org/r/20260128171635.39879-2-lukagejak5%40gmail.com
patch subject: [PATCH 2/3] staging: rtl8723bs: modernize hex output and WMM check
config: i386-randconfig-012-20260131 (https://download.01.org/0day-ci/archive/20260131/202601311229.Q4R3mSEP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601311229.Q4R3mSEP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601311229.Q4R3mSEP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/rtl8723bs/core/rtw_mlme.c:2072:16: warning: unused variable 'i' [-Wunused-variable]
    2072 |         u8 *buff, *p, i;
         |                       ^
   1 warning generated.


vim +/i +2072 drivers/staging/rtl8723bs/core/rtw_mlme.c

554c0a3abf216c Hans de Goede   2017-03-29  2068  
522440e4176a67 Michael Straube 2025-08-01  2069  static void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
522440e4176a67 Michael Straube 2025-08-01  2070  {
522440e4176a67 Michael Straube 2025-08-01  2071  	uint	len;
522440e4176a67 Michael Straube 2025-08-01 @2072  	u8 *buff, *p, i;
522440e4176a67 Michael Straube 2025-08-01  2073  	union iwreq_data wrqu;
522440e4176a67 Michael Straube 2025-08-01  2074  
522440e4176a67 Michael Straube 2025-08-01  2075  	buff = NULL;
522440e4176a67 Michael Straube 2025-08-01  2076  	if (authmode == WLAN_EID_VENDOR_SPECIFIC) {
522440e4176a67 Michael Straube 2025-08-01  2077  		buff = rtw_zmalloc(IW_CUSTOM_MAX);
522440e4176a67 Michael Straube 2025-08-01  2078  		if (!buff)
522440e4176a67 Michael Straube 2025-08-01  2079  			return;
522440e4176a67 Michael Straube 2025-08-01  2080  
522440e4176a67 Michael Straube 2025-08-01  2081  		p = buff;
522440e4176a67 Michael Straube 2025-08-01  2082  
522440e4176a67 Michael Straube 2025-08-01  2083  		p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), "ASSOCINFO(ReqIEs =");
522440e4176a67 Michael Straube 2025-08-01  2084  
522440e4176a67 Michael Straube 2025-08-01  2085  		len = sec_ie[1] + 2;
522440e4176a67 Michael Straube 2025-08-01  2086  		len = (len < IW_CUSTOM_MAX) ? len : IW_CUSTOM_MAX;
522440e4176a67 Michael Straube 2025-08-01  2087  
f053642fd6f8e2 Luka Gejak      2026-01-28  2088  		p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), " %*ph", len, sec_ie);
522440e4176a67 Michael Straube 2025-08-01  2089  
522440e4176a67 Michael Straube 2025-08-01  2090  		p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), ")");
522440e4176a67 Michael Straube 2025-08-01  2091  
522440e4176a67 Michael Straube 2025-08-01  2092  		memset(&wrqu, 0, sizeof(wrqu));
522440e4176a67 Michael Straube 2025-08-01  2093  
522440e4176a67 Michael Straube 2025-08-01  2094  		wrqu.data.length = p - buff;
522440e4176a67 Michael Straube 2025-08-01  2095  
522440e4176a67 Michael Straube 2025-08-01  2096  		wrqu.data.length = (wrqu.data.length < IW_CUSTOM_MAX) ? wrqu.data.length : IW_CUSTOM_MAX;
522440e4176a67 Michael Straube 2025-08-01  2097  
522440e4176a67 Michael Straube 2025-08-01  2098  		kfree(buff);
522440e4176a67 Michael Straube 2025-08-01  2099  	}
522440e4176a67 Michael Straube 2025-08-01  2100  }
522440e4176a67 Michael Straube 2025-08-01  2101  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
