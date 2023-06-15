Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A34E379;
	Thu, 15 Jun 2023 01:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 122B1C433D9;
	Thu, 15 Jun 2023 01:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686793796;
	bh=13gtF2bZglg63yrcK3lxW+cPS0rix6IFq+4QbpuaVqI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TrlgT4GOuYdBNGCPlMo9ywNESPLLc7CKzgW6t5gXJMa0raksWYB5YJY5qu3FlKI78
	 TquE6itIMX2cKgBWrrBSp39ywmQopGttDJBsw3/F/pSTo79cOeq87JSkabZqaKIOpP
	 HI9dBr2vEd0mlKhYY264myATYH5wZlkQ+9DKxjZdmT7yuM81F/GKVfNxWsrCsFmQ8B
	 hmM9PZ90SeWywDztrUp16XHnMfvajCtAn7ysclVCC7WQpurGtMTEo7EVoiXsMZkTOC
	 5BOgQ8OZslQtHrXlk70mb93JDkKfERK7XO8zhl6H78bVJEeAxYTI9hyTZ4EwcgaOoj
	 jMyiw6Pn4NqWQ==
Message-ID: <38de9e99-593b-f852-190c-e843869694b3@kernel.org>
Date: Thu, 15 Jun 2023 10:49:55 +0900
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [linux-next:master 9063/9793] drivers/ata/pata_octeon_cf.c:835:7:
 error: call to undeclared function 'of_property_read_reg'; ISO C99 and later
 do not support implicit function declarations
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>
References: <202306141702.ZaO9V2lk-lkp@intel.com>
 <ff92e980-a531-d37e-448d-c85a106a725a@kernel.org>
 <CAL_JsqLjp-hSULp8xFb1zpwdO7OdYDwH+XtgRjhsKfG2R-0Z3g@mail.gmail.com>
 <9be724b6-9b3c-51fd-ca20-634603a9145e@kernel.org>
 <CAL_JsqL1=gPcRRmqhYK_nnxim5m4NJcYxCVO1wy-eLh0pWnwzA@mail.gmail.com>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <CAL_JsqL1=gPcRRmqhYK_nnxim5m4NJcYxCVO1wy-eLh0pWnwzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/15/23 10:34, Rob Herring wrote:
>> Something like this works for ahci_octeon:
>>
>> diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
>> index 4572f837e504..6b115685a86e 100644
>> --- a/drivers/ata/Kconfig
>> +++ b/drivers/ata/Kconfig
>> @@ -239,7 +239,7 @@ config AHCI_MVEBU
>>
>>  config AHCI_OCTEON
>>         tristate "Cavium Octeon Soc Serial ATA"
>> -       depends on SATA_AHCI_PLATFORM && MIPS && (CAVIUM_OCTEON_SOC || COMPILE_TEST)
>> +       depends on SATA_AHCI_PLATFORM && ((MIPS && CAVIUM_OCTEON_SOC) ||
>> COMPILE_TEST)
>>         default y
>>         help
>>           This option enables support for Cavium Octeon SoC Serial ATA.
>> diff --git a/drivers/ata/ahci_octeon.c b/drivers/ata/ahci_octeon.c
>> index 5021ab3ede49..2e6b28bf43f4 100644
>> --- a/drivers/ata/ahci_octeon.c
>> +++ b/drivers/ata/ahci_octeon.c
>> @@ -15,8 +15,13 @@
>>  #include <linux/platform_device.h>
>>  #include <linux/of_platform.h>
>>
>> +#ifdef CONFIG_MIPS
>>  #include <asm/octeon/octeon.h>
>>  #include <asm/bitfield.h>
>> +#else
>> +#define cvmx_readq_csr(csr)            (0)
>> +#define cvmx_writeq_csr(csr, cfg)      do { } while (0)
>> +#endif
> 
> That's kind of ugly...

Yes :)

> 
>>
>>  #define CVMX_SATA_UCTL_SHIM_CFG                0xE8
>>
>> But it is not that simple for pata_octeon...
> 
> I copied you on mine[1]. It doesn't build for !MIPS, but at least
> doesn't depend on a specific config. Should be good enough for 0-day
> to build somewhat quickly.

Yes, replied to that. The patches look good to me. An Ack from the MIPS folks on
patch 1 would be nice though.

> 
> Rob
> 
> [1] https://lore.kernel.org/all/20230614173633.2430653-2-robh@kernel.org/

-- 
Damien Le Moal
Western Digital Research

