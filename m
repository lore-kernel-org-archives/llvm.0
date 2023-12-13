Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1422C1BC
	for <llvm@lists.linux.dev>; Wed, 13 Dec 2023 13:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ryxcv3p0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1702472584; x=1734008584;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=haSX0tbr6yXtmrKq5D0/IHoQGGhGGvZ70eGFTY33y5k=;
  b=ryxcv3p0RTQi+88XKWHK7VdAi6T8mq0PFaXOpCwoycINKaUxuxkoZ+75
   EWBSt+ZacJJXUl8RVlOLpjykWjEsb12IkNA/kp1rWZ1kCar0WLdGEv09i
   dE4BrioEjLQ8nRu3+5I4jyFM3Jdfe+VQciOTziFRhbnNBPN3neriIh3fq
   0AT/qxlfWbWIjaJH1v+G3darwL3JRE07aFaLlr3cuJdkg2tEDzxUitHSS
   TJKmAE7NwWVXSK81mZ6M/hyyliokdBbI2KvwkAovxUsi1mzjZBeljaqGC
   U+tZPAS2d7fkJQd2pScsZAGrnoqWiBYTw+QtACC4fM5V5RBpMaCHa+9fn
   Q==;
X-CSE-ConnectionGUID: 05LR7F6bQ9qnL0D+1qr56w==
X-CSE-MsgGUID: 7bg/nqvNSM6QxELaojNYqg==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="243933255"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Dec 2023 06:02:56 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 06:02:16 -0700
Received: from [10.171.248.29] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 13 Dec 2023 06:02:13 -0700
Message-ID: <d9b7c682-97f7-4a09-a534-9954865cfc29@microchip.com>
Date: Wed, 13 Dec 2023 14:01:30 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] power: reset: at91: mark at91_wakeup_status non-__init
Content-Language: en-US, fr-FR
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Nathan
 Chancellor <nathan@kernel.org>, Sebastian Reichel <sre@kernel.org>
CC: Arnd Bergmann <arnd@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>, Yangtao Li <frank.li@vivo.com>,
	<linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
References: <20231212214658.213510-1-arnd@kernel.org>
 <20231212215002.GA3300655@dev-arch.thelio-3990X>
 <20231213072521.z7a37uayjide7ui4@pengutronix.de>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20231213072521.z7a37uayjide7ui4@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 13/12/2023 at 08:25, Uwe Kleine-König wrote:
> On Tue, Dec 12, 2023 at 02:50:02PM -0700, Nathan Chancellor wrote:
>> On Tue, Dec 12, 2023 at 10:46:49PM +0100, Arnd Bergmann wrote:
>>> From: Arnd Bergmann<arnd@arndb.de>
>>>
>>> Two copies of the at91_wakeup_status() function are called by the
>>> respective probe() callbacks and are marked __init, but the probe
>>> functions are no longer annotated that way. This works with gcc because
>>> the functions always get inlined, but clang keeps them separate, which
>>> can lead to executing freed memory:
>>>
>>> WARNING: modpost: vmlinux: section mismatch in reference: at91_poweroff_probe+0x80 (section: .text) -> at91_wakeup_status (section: .init.text)
>>> WARNING: modpost: vmlinux: section mismatch in reference: at91_shdwc_probe+0xcc (section: .text) -> at91_wakeup_status (section: .init.text)
>>>
>>> Drop the incorrect annotation on these.
>>>
>>> Fixes: 099806de68b7 ("power: reset: at91-poweroff: Stop using module_platform_driver_probe()")
>>> Fixes: dde74a5de817 ("power: reset: at91-sama5d2_shdwc: Stop using module_platform_driver_probe()")
>>> Signed-off-by: Arnd Bergmann<arnd@arndb.de>
>> Thanks, I sent the same change three weeks ago at this point:
>>
>> https://lore.kernel.org/20231120-fix-at91-modpost-warnings-v1-1-813671933863@kernel.org/
>>
>> Your commit message is a little better than mine and I don't really care
>> which one goes in but it would be good if this could get cleared up
>> soon...
>>
>> Reviewed-by: Nathan Chancellor<nathan@kernel.org>
> I don't care either. Given the change is identical (Nathan's submission
> even has "index 126e774e210c..93eece027865 100644" which exactly matches
> Arnd's patch), I'll forward my Reviewed-by: tag to here:
> 
> Reviewed-by: Uwe Kleine-König<u.kleine-koenig@pengutronix.de>

Likewise:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Use whichever is preferred.
Regards,
   Nicolas
