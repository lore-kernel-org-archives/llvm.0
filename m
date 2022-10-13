Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA8F20F8
	for <llvm@lists.linux.dev>; Thu, 13 Oct 2022 07:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1665647384; x=1697183384;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TW6SOpQjxf8WZxrXeW9B+zZiJfs42MWqJ6VpceHM6xc=;
  b=a90gha1F+6iKGOnAzcTVQugDg4D6jwL5iIYJtdAHuq3JxRcEDWvc41nF
   EQ1lk+i+BjgYlxP2FcuORA24WyenMtrPr9QFgZRHCgdXwv0OV/DI+YZZB
   sM2QL1dOqQc/QPHDKbc1gGb4tizczUpPHoT+c+V4qFGyZQHyEOzBy6E5M
   EfZ+R4LzAsl7z/MwhBw9SwbAfCOYRt2ZLd02JkpwNpPuW6MyL+uUqIc6L
   G4iVkWZvHO4zhD4Iq0tyd/uYSCx8R5VZ+InDR9RWOv5Zw/oG7oHNNiOlE
   tfkp1GjuM/86l6TJpYGotchzhh9JsFO63WN6LMmAtddJzej83eNe5PLoD
   w==;
X-IronPort-AV: E=Sophos;i="5.95,180,1661788800"; 
   d="scan'208";a="212014798"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 13 Oct 2022 15:48:33 +0800
IronPort-SDR: oav0h+nZneoubXiTjrOSrBppKAHma1Cv71/OySere4t0hBHOPmG6pJHuSPZG+xUUYk6cAvEFYl
 QnWXaamriJmlk2S2nAI9zeESXoPbqNbvSQCcG+LogMKA4CJXrhajlJq4h09DfBTTWAbGT4nCqC
 CtLMQ0mMO4CMW6mAu2+MQqmhVj9dAKArt6YOhOzV/daUYL16dSfcj1MouHUZmCKbGSPIQ81l3/
 z/QRgXDRAk0EAk7CbCc07a/dI5Aw3JU2mMCcMVg9jD0f+djO942kEMk/2Y0PtqMP9GmRxbUAP+
 QRLc8vl7r0hEbnMLuiCZb9IX
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Oct 2022 00:08:11 -0700
IronPort-SDR: tmJ3/f3nBMGcM0WM8cWkOC9K5Waqf44sgp65KWWPC8/CBom6jhyVAdXOW65T9SS/DDHcyEBugD
 b/8IJ8k4vPSL1imzsuUKd4RqMAU2mUvlWn/9MA2TS6gklXA3Pu1lCOxHCUfN45DYqrvjTCh3uo
 ZBXKPaQoKtAoEPugx8BKEnN1lYLnevcsuE62GTB6086qKs092eI0dI7IitINFdP+gDvu8FcwRS
 hiBsQC9VqdqMvOs9O91MzY8N+1K752RsqL2/YIvkMOK3BiKI+fjxLKhJ/XIDSpqTh1HUrMmMxA
 2NI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Oct 2022 00:48:34 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mp1q53DS4z1Rwt8
	for <llvm@lists.linux.dev>; Thu, 13 Oct 2022 00:48:33 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1665647312; x=1668239313; bh=TW6SOpQjxf8WZxrXeW9B+zZiJfs42MWqJ6V
	pceHM6xc=; b=O1XznsEJI5uxiWZLiyx9twftJFXWvzo8MQP88H6XIKXwRe47gDd
	4+BWjL7JXL60mkkxmQuIOrwDNdq5+5BVJrMCMPWizFh1RPvq276+WG3eyR0Hwv8X
	1APOUdPtqqyLdHNdzNfh55XmST0Sm+flYBFvVyeJqDlUEBJTv5g+CCZ1emDgd9m2
	cuULYJJXQ6XHan4cusFKyq1kEnxLoF4VNaGBcgvi4hwyZcPo7V2vum0F7VOvfJhq
	t9C7V8XdpbLDNaV/rEIKluZBCsxDk0ty5wlzzyzF0vL1OExxo00cd+dtdCRrO7TU
	5PYKFBoWQ9ivxcsAXKwtftD6ceuDxxCRNsA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id a-sEbCVvSBGL for <llvm@lists.linux.dev>;
	Thu, 13 Oct 2022 00:48:32 -0700 (PDT)
Received: from [10.89.85.169] (c02drav6md6t.dhcp.fujisawa.hgst.com [10.89.85.169])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mp1q36JJGz1RvLy;
	Thu, 13 Oct 2022 00:48:31 -0700 (PDT)
Message-ID: <8f9304d0-5f28-7378-626b-d734fa7a39a0@opensource.wdc.com>
Date: Thu, 13 Oct 2022 16:48:30 +0900
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: drivers/ata/ahci_st.c:229:34: warning: unused variable
 'st_ahci_match'
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org
References: <202210121422.MJsXaw1M-lkp@intel.com>
 <4517c95f-1dad-5a8c-5202-073d0a7eff29@opensource.wdc.com>
 <4429d1ec-579e-4b0d-a8d8-06b9a5877a9c@app.fastmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <4429d1ec-579e-4b0d-a8d8-06b9a5877a9c@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2022/10/13 16:33, Arnd Bergmann wrote:
> On Thu, Oct 13, 2022, at 8:13 AM, Damien Le Moal wrote:
>> On 10/12/22 15:37, kernel test robot wrote:
> 
>> I am at a loss with this one... There are plenty of patterns similar to
>> drivers/ata/ahci_st.c doing something like:
>>
>> static const struct of_device_id st_ahci_match[] = {
>>
>>         { .compatible = "st,ahci", },
>>
>>         { /* sentinel */ }
>>
>> };
>>
>> MODULE_DEVICE_TABLE(of, st_ahci_match);
>>
>> For instance, in drivers/pwm/pwm-sti.c, we have:
>>
>>
>> And countless others like this for STI and other arch too.
>>
>> So if CONFIG_MODULE is not enabled, how come we are not submerged with
>> warnings about unused variables ? Is mips arch special in this regard ?
>> Or am I missing something ?
> 
> It has nothing to do with MIPS, the problem is
> 
>                 .of_match_table = of_match_ptr(st_ahci_match),
> 
> The 'of_match_ptr()' sets the pointer to NULL when CONFIG_OF is
> disabled, which avoids a build failure when st_ahci_match[]
> itself is in an #ifdef.
> 
> In this driver, there is no #ifdef around st_ahci_match[], so we
> simply want
> 
>                 .of_match_table = st_ahci_match,
> 
> The thing with the MODULE_DEVICE_TABLE() is that it would
> create another reference if CONFIG_MODULE is enabled, but not
> for a built-in driver, so you only get this type of warning
> for randconfig builds that have the driver built-in and OF
> disabled.
> 
> It's a common mistake, and we should probably remove most
> of the of_match_ptr() references as you rarely have drivers
> that optionally use OF support but benefit from compiling
> that support out on kernels without OF.

Got it. Thanks for the info !

Will patch this and check other ata drivers for the same issue.


-- 
Damien Le Moal
Western Digital Research

