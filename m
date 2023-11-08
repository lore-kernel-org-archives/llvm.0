Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802B25254
	for <llvm@lists.linux.dev>; Wed,  8 Nov 2023 18:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oR5spj4/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62616C433C8;
	Wed,  8 Nov 2023 18:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699469288;
	bh=81EVNP5jYzEQtba8wvig6dhqM3BiAejSQ1+IAtE2Cy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oR5spj4/mzTsax2cizNb4PqVv2BA53LvE0Gf1y1iGkeQ6H30hvYff8V9yW1bnYHGI
	 Ej8zR3sdrF7F1h/yZs9CVNYqk+EaZL0souD37Vgk6Fx1/SQ+iwHUYhpHMUU1M5oGBV
	 1F2prjsRStreMVUzIp4jd9VJOSBj7MdWODX6l64oul5aAJ+gtzvKhI8XYli+wIi/FL
	 EGHSGQY5pkqsHgl0V7zlePs585QEqbvNem/uv5UYnUGVVTrRWZJrpuGQEK8BsqgV3M
	 2u+zvgl6L/1eenZ/VXWPy6wBXG9Fr9HQjHMXEHxwPFzv+g9sO12Bwx12qbWnlXlFss
	 ueNNI5VL/gjfA==
Date: Wed, 8 Nov 2023 11:48:05 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Helge Deller <deller@gmx.de>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	llvm@lists.linux.dev
Subject: Re: [PATCH 02/22] fb: atmel_lcdfb: Stop using platform_driver_probe()
Message-ID: <20231108184805.GA1579138@dev-arch.thelio-3990X>
References: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
 <20231107091740.3924258-3-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231107091740.3924258-3-u.kleine-koenig@pengutronix.de>

On Tue, Nov 07, 2023 at 10:17:43AM +0100, Uwe Kleine-König wrote:
> On today's platforms the benefit of platform_driver_probe() isn't that
> relevant any more. It allows to drop some code after booting (or module
> loading) for .probe() and discard the .remove() function completely if
> the driver is built-in. This typically saves a few 100k.
> 
> The downside of platform_driver_probe() is that the driver cannot be
> bound and unbound at runtime which is ancient and also slightly
> complicates testing. There are also thoughts to deprecate
> platform_driver_probe() because it adds some complexity in the driver
> core for little gain. Also many drivers don't use it correctly. This
> driver for example misses to mark the driver struct with __refdata which
> is needed to suppress a (W=1) modpost warning:
> 
> 	WARNING: modpost: drivers/video/fbdev/atmel_lcdfb: section mismatch in reference: atmel_lcdfb_driver+0x4 (section: .data) -> atmel_lcdfb_remove (section: .exit.text)
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/video/fbdev/atmel_lcdfb.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_lcdfb.c
> index a908db233409..b218731ef732 100644
> --- a/drivers/video/fbdev/atmel_lcdfb.c
> +++ b/drivers/video/fbdev/atmel_lcdfb.c
> @@ -1017,7 +1017,7 @@ static int atmel_lcdfb_of_init(struct atmel_lcdfb_info *sinfo)
>  	return ret;
>  }
>  
> -static int __init atmel_lcdfb_probe(struct platform_device *pdev)
> +static int atmel_lcdfb_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct fb_info *info;
> @@ -1223,7 +1223,7 @@ static int __init atmel_lcdfb_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int __exit atmel_lcdfb_remove(struct platform_device *pdev)
> +static int atmel_lcdfb_remove(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct fb_info *info = dev_get_drvdata(dev);
> @@ -1301,7 +1301,8 @@ static int atmel_lcdfb_resume(struct platform_device *pdev)
>  #endif
>  
>  static struct platform_driver atmel_lcdfb_driver = {
> -	.remove		= __exit_p(atmel_lcdfb_remove),
> +	.probe		= atmel_lcdfb_probe,
> +	.remove		= atmel_lcdfb_remove,
>  	.suspend	= atmel_lcdfb_suspend,
>  	.resume		= atmel_lcdfb_resume,
>  	.driver		= {
> @@ -1310,7 +1311,7 @@ static struct platform_driver atmel_lcdfb_driver = {
>  	},
>  };
>  
> -module_platform_driver_probe(atmel_lcdfb_driver, atmel_lcdfb_probe);
> +module_platform_driver(atmel_lcdfb_driver, );
>  
>  MODULE_DESCRIPTION("AT91 LCD Controller framebuffer driver");
>  MODULE_AUTHOR("Nicolas Ferre <nicolas.ferre@atmel.com>");
> -- 
> 2.42.0
> 

For what it's worth, this introduces a warning when building certain
configurations (such as ARCH=arm multi_v5_defconfig) with clang:

  WARNING: modpost: vmlinux: section mismatch in reference: atmel_lcdfb_probe+0x6c4 (section: .text) -> atmel_lcdfb_init_fbinfo (section: .init.text)
  WARNING: modpost: vmlinux: section mismatch in reference: atmel_lcdfb_probe+0x858 (section: .text) -> atmel_lcdfb_fix (section: .init.rodata)

This appears to be legitimate to me? GCC did not warn but I assume that
is due to differences in inlining. The following clears it up for me,
should I send a standalone patch or should this be squashed in?

Cheers,
Nathan

diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_lcdfb.c
index 88c75ae7d315..9e391e5eaf9d 100644
--- a/drivers/video/fbdev/atmel_lcdfb.c
+++ b/drivers/video/fbdev/atmel_lcdfb.c
@@ -220,7 +220,7 @@ static inline void atmel_lcdfb_power_control(struct atmel_lcdfb_info *sinfo, int
 	}
 }
 
-static const struct fb_fix_screeninfo atmel_lcdfb_fix __initconst = {
+static const struct fb_fix_screeninfo atmel_lcdfb_fix = {
 	.type		= FB_TYPE_PACKED_PIXELS,
 	.visual		= FB_VISUAL_TRUECOLOR,
 	.xpanstep	= 0,
@@ -841,7 +841,7 @@ static void atmel_lcdfb_task(struct work_struct *work)
 	atmel_lcdfb_reset(sinfo);
 }
 
-static int __init atmel_lcdfb_init_fbinfo(struct atmel_lcdfb_info *sinfo)
+static int atmel_lcdfb_init_fbinfo(struct atmel_lcdfb_info *sinfo)
 {
 	struct fb_info *info = sinfo->info;
 	int ret = 0;
