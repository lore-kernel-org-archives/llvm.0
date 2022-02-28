Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23E17C
	for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 16:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1646064676; x=1677600676;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qQF75t3gcJ8otswdA/PKU2/l+dYNyJI3cyfi3dETkyM=;
  b=dIYKdXYlcimnxYG8aSY/vXDA/0vuL+w0T8JaN6UDxh3DRP1oQgsECdv7
   9dzbR7e6BMbk/IQVd7X8AJNw7yLW7zzOKPZGDjmYBaEOgIGudNN30nBhC
   HwDXc8F4+G5lbSxDBZs7iLxS6S3E79akhsSO00I+gLHjS6C/051MlThHl
   0teYpDG/hEBuR10tlcnuLdtkgSQ7qZaEPPBhl35SM2kHsb/tgPooD7WVZ
   Y0gjQDQuRSOdmLmUIcFPLCC1T/a0K1/bL9atlSSaZpRM43pyL9cP7pIs/
   G2AjB3qqv7yn7ZaRsDiurwSP1Z7bJCE0pXugK1MlgxQAc0pZqjdrnecpy
   g==;
X-IronPort-AV: E=Sophos;i="5.90,142,1643698800"; 
   d="scan'208";a="147518055"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Feb 2022 09:09:54 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 28 Feb 2022 09:09:53 -0700
Received: from [10.12.72.64] (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 28 Feb 2022 09:09:50 -0700
Message-ID: <3fedb4c6-baa5-2107-934d-31f8205176b4@microchip.com>
Date: Mon, 28 Feb 2022 17:09:50 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] SoC: polarfire: fix build warning
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Conor Dooley <mail@conchuod.ie>
CC: Lewis Hanly <lewis.hanly@microchip.com>, Nathan Chancellor
	<nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Conor Dooley
	<conor.dooley@microchip.com>, Arnd Bergmann <arnd@arndb.de>, "kernel test
 robot" <lkp@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>, linux-riscv
	<linux-riscv@lists.infradead.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
References: <20220228152658.3367506-1-arnd@kernel.org>
 <b8eb2e55-b5a8-4a39-86cb-93cadbd67922@conchuod.ie>
 <CAK8P3a1NWuoHVWXVZUGJxSg=D0d3umrMzWqZ75devfOwO-JhuQ@mail.gmail.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <CAK8P3a1NWuoHVWXVZUGJxSg=D0d3umrMzWqZ75devfOwO-JhuQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 28/02/2022 at 16:41, Arnd Bergmann wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Mon, Feb 28, 2022 at 4:35 PM Conor Dooley <mail@conchuod.ie> wrote:
>>
>> I had sent a fix for the build warning on saturday morning - but I guess
>> you missed it.
>>
>> Thanks for fixing it anyway :)
> 
> Thank you for your quick reply. I had indeed missed that fix. You did the
> right thing here by sending it to Nicolas, but he hasn't had a chance to forward
> it to soc@kernel.org yet, so it was not visible in patchwork.
> 
> As it turns out, your patch is correct and mine was wrong anyway, so I
> have now replaced my patch with yours.
> 
> Nicolas, I hope that doesn't cause you extra work. If you have picked it
> up into your tree, you can drop it again from there.

No problem on my side: I was planning to add it to another PR to you but 
it's far easier if you already took it directly.

Thanks Arnd, best regards,
   Nicolas


-- 
Nicolas Ferre
