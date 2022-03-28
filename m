Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEC217D0
	for <llvm@lists.linux.dev>; Mon, 28 Mar 2022 05:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648444919; x=1679980919;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=TssxZi5HbhRuTGitKGwvo5yP8Uu2MNcvCLKPIgM9VQA=;
  b=WRx2J45aQYCMM0cU+rTOVPMx98uSbm1oT/pPDNmnoIwpNYfzWKz2i/vs
   +KIwqx2m/FvCPeO1f86uMgaMN5COUR9+QNIO8Xmxh3RSNYt6VJ21BIAkB
   gJ0/vgwBBDyH2jK3xURo0r/g841QyhSIIP1J84Fje0vMtTD/ECEaow+Wz
   gO9/BIN7UUpcpuqErnZjChi/Shkxzs7G+hsZvyaI+xy6JI2AwoRp60ebf
   l+LZBjgQfwQtluzOI/+3AHhCr4BL0FDwFtY2Pz33EB9TTY9oTRNOyS0vz
   HiWazsEoEk4zd96Mm07OChWJHnoAiTtE50D1um7J1/fip725AZe3zyONy
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="246402835"
X-IronPort-AV: E=Sophos;i="5.90,216,1643702400"; 
   d="scan'208";a="246402835"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2022 22:21:58 -0700
X-IronPort-AV: E=Sophos;i="5.90,216,1643702400"; 
   d="scan'208";a="520873240"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.249.169.179]) ([10.249.169.179])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2022 22:21:56 -0700
Subject: Re: [kbuild-all] Unsigned emails from Intel robot was Re:
 [linux-next:master 9122/14381] drivers/leds/leds-pca955x.c:149:19: warning:
 unused function 'pca95xx_num_led_regs'
To: Pavel Machek <pavel@ucw.cz>, kernel test robot <lkp@intel.com>,
 kernel list <linux-kernel@vger.kernel.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, Linux Memory Management List <linux-mm@kvack.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <202203260634.OFB2IPFf-lkp@intel.com> <20220326092537.GA8704@amd>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <a244acc9-eff3-e666-d703-1ba63d5a037d@intel.com>
Date: Mon, 28 Mar 2022 13:21:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220326092537.GA8704@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/26/2022 5:25 PM, Pavel Machek wrote:
> Hey robot!
> 
>> FYI, the error/warning still remains.
> 
> Could you please sign emails with real name of person responsible for
> this? Was there human writing this?

Hi Pavel,

The report was generated automatically, we continue to optimize the bot
to output the right result.

> 
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
> 
> I'd preffer to credit human if human was involved.
> 
>>>> drivers/leds/leds-pca955x.c:149:19: warning: unused function 'pca95xx_num_led_regs'
>>     static inline int pca95xx_num_led_regs(int bits)
>>     ^
>>     fatal error: error in backend: Nested variants found in inline asm string: ' .set push
>>     .set mips64r2
> 
> This sounds like an compiler problem, not a kernel problem, right?

Yes, it's not related to your commit, sorry for the inconvenience,
we'll take a look at it to avoid false positive next time.

Best Regards,
Rong Chen
