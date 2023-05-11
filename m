Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D83E81F
	for <llvm@lists.linux.dev>; Thu, 11 May 2023 07:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683790362; x=1715326362;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=umE62j3C43M51JL5CsP4pGKSRkWAZ5+mQ783j+j1teg=;
  b=nTqBZGEDw4P0S9OyH3fqRxRUUn9/IK1J3xVz7X/7h9LbOUX58oRK0PI6
   2b8YK7EK1xTMiQqlukxA4ZbaxJZrt0SBPBtJwcQGE7q7RiwxUhF0r0NOP
   Dha8Arp1FQ2QwLCj4IUPxGkvoz5xGfBipuM8pO7/YTgF52rDkkGLtnIoP
   WSyXzXdub5hASlQlwryuj2FD62xntlaRKdiWWAt+OXGBiSB1MOmv+68a9
   FmXfnfYhVfaHJCyCb7saTK2kjUbt0MJheHz+uq0B5HD68fDDLX9uAvvKD
   lG3EylO76g1C+/c0vmiFwwRyjb7iK8/aEWT8muiZA39ABNrlHqpNoJBPz
   w==;
X-IronPort-AV: E=Sophos;i="5.99,266,1677567600"; 
   d="scan'208";a="214820066"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 May 2023 00:32:38 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 11 May 2023 00:32:32 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Thu, 11 May 2023 00:32:32 -0700
Date: Thu, 11 May 2023 09:32:31 +0200
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: Simon Horman <horms@kernel.org>
CC: Wolfram Sang <wsa@kernel.org>, Tharun Kumar P
	<tharunkumar.pasumarthi@microchip.com>, Kumaravel Thiagarajan
	<kumaravel.thiagarajan@microchip.com>, Microchip Linux Driver Support
	<UNGLinuxDriver@microchip.com>, Nathan Chancellor <nathan@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
	<linux-i2c@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: Re: [PATCH] i2c: mchp-pci1xxxx: Avoid cast to incompatible function
 type
Message-ID: <20230511073231.of2uriz4chdmfemq@soft-dev3-1>
References: <20230510-i2c-mchp-pci1xxxx-function-cast-v1-1-3ba4459114c4@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230510-i2c-mchp-pci1xxxx-function-cast-v1-1-3ba4459114c4@kernel.org>

The 05/10/2023 14:32, Simon Horman wrote:
> 
> Rather than casting pci1xxxx_i2c_shutdown to an incompatible function type,
> update the type to match that expected by __devm_add_action.
> 
> Reported by clang-16 with W-1:
> 
>  .../i2c-mchp-pci1xxxx.c:1159:29: error: cast from 'void (*)(struct pci1xxxx_i2c *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>          ret = devm_add_action(dev, (void (*)(void *))pci1xxxx_i2c_shutdown, i2c);
>                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  ./include/linux/device.h:251:29: note: expanded from macro 'devm_add_action'
>          __devm_add_action(release, action, data, #action)
>                                    ^~~~~~
> 
> No functional change intended.
> Compile tested only.

Reviewed-by: Horatiu Vultur <horatiu.vultur@microchip.com>

> 
> Signed-off-by: Simon Horman <horms@kernel.org>
> ---
>  drivers/i2c/busses/i2c-mchp-pci1xxxx.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
> index b21ffd6df927..5ef136c3ecb1 100644
> --- a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
> +++ b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
> @@ -1118,8 +1118,10 @@ static int pci1xxxx_i2c_resume(struct device *dev)
>  static DEFINE_SIMPLE_DEV_PM_OPS(pci1xxxx_i2c_pm_ops, pci1xxxx_i2c_suspend,
>                          pci1xxxx_i2c_resume);
> 
> -static void pci1xxxx_i2c_shutdown(struct pci1xxxx_i2c *i2c)
> +static void pci1xxxx_i2c_shutdown(void *data)
>  {
> +       struct pci1xxxx_i2c *i2c = data;
> +
>         pci1xxxx_i2c_config_padctrl(i2c, false);
>         pci1xxxx_i2c_configure_core_reg(i2c, false);
>  }
> @@ -1156,7 +1158,7 @@ static int pci1xxxx_i2c_probe_pci(struct pci_dev *pdev,
>         init_completion(&i2c->i2c_xfer_done);
>         pci1xxxx_i2c_init(i2c);
> 
> -       ret = devm_add_action(dev, (void (*)(void *))pci1xxxx_i2c_shutdown, i2c);
> +       ret = devm_add_action(dev, pci1xxxx_i2c_shutdown, i2c);
>         if (ret)
>                 return ret;
> 
> 

-- 
/Horatiu
