Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8961AE851;
	Wed, 14 Aug 2024 10:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723633175; cv=none; b=Py8H39PLMdxAibWtgj8jSWkXIw1xhxYqY79z0d4yPSVfkV8kpgCur8S/OZcFoV0ydz9luXB7Bbp7Wm2exe8XBwV/XcAvjxmIodt5F5wOM8iOIYgGhkHDWtvn6KJwQXH6lRGWw0/t8gyXGpBrUTymxgWXd6UnsuygMxzRrS7mWYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723633175; c=relaxed/simple;
	bh=+qzqXOCXksMPS4Y1uQDXb+Hw//NwCn9OgHYtA0Pd3gg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=o1JVKITn7BWzMIlsTKd0kC6usjpVv6DgAjrdC8JFELkfWa/Uw0J2QdBptRU8/Nv0x3+i47WbBEdPCAsQfnGW+0nMoUqHEvfKae2wuBlAGqxAc4+XjT898mRQaD7mGBeGltOZby+v3a+TfwxhH2CXvT3FJUpKqSgpXrqjQ6NH4Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ntHVdeXG; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ntHVdeXG"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47E5j9ch020215;
	Wed, 14 Aug 2024 05:59:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=XSwe9riWP+5wqjSrpRpNfYDY6LkOSBAzHkBT0fVjPbM=; b=
	ntHVdeXGKQQDgFvAgrJd+Ob0laucVJkWfmE8hHYE9VYuQFJpHceRBgyCeOwYJjMW
	vRJpYCE8OiR92XApWuoGgDp5M5MOq3LI9Dc+lxcy1Ep4q8TWq8EKaPQE6dx/mZ4m
	XUppVhrlU9jY0hySwn93S/g3Ek2rR7FMlFf9nDlZ+k1E95ADtPOsFdPyI9uY0DAJ
	X+dPTQyY3Ddn3DoSURIbdVUPPsWGEpktmOR8I876vCvACHvbb90ctoTszhRjhgDS
	l5vxRlhXHZcxrjP9Pa1qyIKTHNLSqoSassgI3xGoM2xLQPnRpQGrGisxfGEAmWjo
	8iAhQCQMgSv9BFMRpX7pmg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 40x5kwmeg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 05:59:32 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 Aug
 2024 11:59:29 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 14 Aug 2024 11:59:29 +0100
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id CFB55820241;
	Wed, 14 Aug 2024 10:59:29 +0000 (UTC)
Message-ID: <5681baf9-af8e-49e1-bf64-fc4ac4e28618@opensource.cirrus.com>
Date: Wed, 14 Aug 2024 11:59:29 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [tiwai-sound:for-linus 2/7] ld.lld: error: undefined symbol:
 i2c_acpi_client_count
To: Takashi Iwai <tiwai@suse.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
        <linux-sound@vger.kernel.org>
References: <202408141333.gYnaitcV-lkp@intel.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <202408141333.gYnaitcV-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8yjg7XDpAv-cXnF9UZcl96ECfaVo-oxD
X-Proofpoint-GUID: 8yjg7XDpAv-cXnF9UZcl96ECfaVo-oxD
X-Proofpoint-Spam-Reason: safe

On 14/08/2024 06:08, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-linus
> head:   8475a1d9bb7acf1cb15842dd24baab0e8ea4e4ff
> commit: 03c5c350e38d9346b69357d0e52c3c40495c14a0 [2/7] ALSA: hda/realtek: Add support for new HP G12 laptops
> config: i386-randconfig-013-20240811 (https://download.01.org/0day-ci/archive/20240814/202408141333.gYnaitcV-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240814/202408141333.gYnaitcV-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408141333.gYnaitcV-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> ld.lld: error: undefined symbol: i2c_acpi_client_count
>     >>> referenced by patch_realtek.c:6891 (sound/pci/hda/patch_realtek.c:6891)
>     >>>               sound/pci/hda/patch_realtek.o:(cs35lxx_autodet_fixup) in archive vmlinux.a
> 

I'll be sending a fix for this soon, I'm just testing it.
Despite our testing of various combinations we missed CONFIG_I2C=m,
CONFIG_ACPI=y. For reasons I can't explain I thought that CONFIG_I2C
is a boolean.
