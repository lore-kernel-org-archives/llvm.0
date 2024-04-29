Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADD2126F2C;
	Mon, 29 Apr 2024 17:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714412646; cv=none; b=fjVMjm49DbcZ/eCE6Y5QYMe4a3VkCt9BvaudXD4CeEffDss7HcUt5cHWPyK5SjWASpO6ErsAUJxs07RZ1gIO1wBtvWV2spqyM2ksF9n9codsOtgmLAD7ynPADaAmTCVVP+uJ80IVdA+ZDPcXXAy75x6BZy4+tXRq6IbSMrEW8vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714412646; c=relaxed/simple;
	bh=MUZMSMHIpiOP8dC7+4yHCjtdRf6XBA1Hjwrcb06qLJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yt1EmmSnTlDlsbWeLLELoCAbAknLJnX/4/fo85uVYI5BkbbwKOkXDarwrfwNkoB2rC7RGhqyu7k5TLIPwh7lul3/MsyfnmUzuRTLEwDjTPJtMKE9Yf76ZPJltXUaFRIsPFRR37sHLd9xm6aHA9uXLsiyYTvVn06FzjHp/acCNyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+JwkA4L; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+JwkA4L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714412641; x=1745948641;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MUZMSMHIpiOP8dC7+4yHCjtdRf6XBA1Hjwrcb06qLJ0=;
  b=f+JwkA4Lj9Lg09xuP6u6LosR0FHOC1x6Pj7/3eeWbNH9YtVoHAmTHOB+
   2rXjpxf0DPP1Lsic6o0d6LViIzxUFIkCPgi6pXX94FhgoZK/e5Uo07OkC
   eYcE/Y/QjcfK9nY5VzHDW7DLhqiWPwO9ZT6gwI6V82keXVhIhXXcXgxd9
   xHU1tyHxUhhIuAKy/DsJoT9jD34eXzUaEuQxuQgceesJaiFyeHhh6n29e
   UU/Nt+7b+SBNtCtYwVoaLWPxjYqxDi2SVzoLaXQc8o5qRsDG730Tu4xIE
   Lf9b/OFzQTP6C/41PWdKD862IAHWdUx4vSeio3ouLtNP7T6WC239qE4zy
   g==;
X-CSE-ConnectionGUID: 6shK8VVRSdaeoesDo9BnnQ==
X-CSE-MsgGUID: P45nsWuiQwyoR/fzyw5yfw==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="20705490"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="20705490"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 10:43:58 -0700
X-CSE-ConnectionGUID: q8vDsS95RDK7ltB6Fb5Yuw==
X-CSE-MsgGUID: Nhpj/b/vQ4ab3kKXuFXekQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="26173718"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Apr 2024 10:43:54 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1V2e-0007Lo-0b;
	Mon, 29 Apr 2024 17:43:52 +0000
Date: Tue, 30 Apr 2024 01:42:56 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/4] media: v4l: Support obtaining link frequency via
 get_mbus_config
Message-ID: <202404300105.00zkm4JV-lkp@intel.com>
References: <20240429153704.1005192-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240429153704.1005192-3-sakari.ailus@linux.intel.com>

Hi Sakari,

kernel test robot noticed the following build errors:

[auto build test ERROR on 12e3384b874e9f67c3e98ce501561fe5a54a0add]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-v4l-Support-passing-sub-device-argument-to-v4l2_get_link_freq/20240429-234508
base:   12e3384b874e9f67c3e98ce501561fe5a54a0add
patch link:    https://lore.kernel.org/r/20240429153704.1005192-3-sakari.ailus%40linux.intel.com
patch subject: [PATCH v3 2/4] media: v4l: Support obtaining link frequency via get_mbus_config
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240430/202404300105.00zkm4JV-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404300105.00zkm4JV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404300105.00zkm4JV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-common.c:512:2: error: use of undeclared identifier 'ret'
           ret = v4l2_subdev_call(sd, pad, get_mbus_config, pad->index,
           ^
   drivers/media/v4l2-core/v4l2-common.c:514:6: error: use of undeclared identifier 'ret'
           if (ret < 0 && ret != -ENOIOCTLCMD)
               ^
   drivers/media/v4l2-core/v4l2-common.c:514:17: error: use of undeclared identifier 'ret'
           if (ret < 0 && ret != -ENOIOCTLCMD)
                          ^
   drivers/media/v4l2-core/v4l2-common.c:515:10: error: use of undeclared identifier 'ret'
                   return ret;
                          ^
   4 errors generated.


vim +/ret +512 drivers/media/v4l2-core/v4l2-common.c

   504	
   505	s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
   506				      unsigned int div)
   507	{
   508		struct v4l2_mbus_config mbus_config = {};
   509		struct v4l2_subdev *sd;
   510	
   511		sd = media_entity_to_v4l2_subdev(pad->entity);
 > 512		ret = v4l2_subdev_call(sd, pad, get_mbus_config, pad->index,
   513				       &mbus_config);
   514		if (ret < 0 && ret != -ENOIOCTLCMD)
   515			return ret;
   516	
   517		return mbus_config.link_freq ?:
   518			__v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
   519	}
   520	EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
   521	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
