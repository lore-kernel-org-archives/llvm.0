Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ADF1C2BE
	for <llvm@lists.linux.dev>; Wed, 13 Dec 2023 08:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z3HRTyZa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702454951; x=1733990951;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rMiaJC8fgXzWBq5kjwXOvMEA3/jbQN1IRhkx7p5yyeY=;
  b=Z3HRTyZai5aWUdYvvv5nltJ4Ibs1lewf/A+PEtLfqrT0Qx58lkls6Obr
   06aDISM072k3i6iMOfJ8sipm/xz8wT0+NnTALEYcFTFDTVNLLzKC31ptd
   VU5pj8dgv7hhtdV349EkDLDHm8o7WBiE4XskqwKLi/7viNG0vrMvTz208
   6ffv0U2pGIkf2hVU3CVVQsQ4+5wssIf0Cduk1nTGJrHWh6HKv7NnLknNW
   iheMQdeNXSI4CO1/oFBcl002AYISP42pe3EHhmKoeoL2GexMbAiP5ICG9
   AYWUwNW6j6LbFh848tPG0GbwaMI112zAiaefX7zw+xYDSffJUtHjOVKZU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="392103663"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="392103663"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 00:09:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="750025415"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="750025415"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 00:09:05 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E8FCC11FC21;
	Wed, 13 Dec 2023 10:09:02 +0200 (EET)
Date: Wed, 13 Dec 2023 08:09:02 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] media: i2c: mt9m114: add CONFIG_COMMON_CLK dependency
Message-ID: <ZXlmnmGepRnMyNfr@kekkonen.localdomain>
References: <20231212213625.3653558-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212213625.3653558-1-arnd@kernel.org>

Hi Arnd,

On Tue, Dec 12, 2023 at 10:18:04PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> With clang-16, building without COMMON_CLK triggers a range check on
> udelay() because of a constant division-by-zero calculation:
> 
> ld.lld: error: undefined symbol: __bad_udelay
> >>> referenced by mt9m114.c
> >>>               drivers/media/i2c/mt9m114.o:(mt9m114_power_on) in archive vmlinux.a
> 
> Avoid this by adding a Kconfig dependency that avoids the broken build.

This sounds like an odd way to fix an issue with udelay(). On which arch
does it happen? Wouldn't it be better to fix the udelay() problem in the
source?

A quick check reveals there are about 2400 files using udelay.

> 
> Fixes: 24d756e914fc ("media: i2c: Add driver for onsemi MT9M114 camera sensor")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/media/i2c/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index aae05142e191..b224c37bfd77 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -228,6 +228,7 @@ config VIDEO_MT9M111
>  
>  config VIDEO_MT9M114
>  	tristate "onsemi MT9M114 sensor support"
> +	depends on COMMON_CLK
>  	select V4L2_CCI_I2C
>  	help
>  	  This is a Video4Linux2 sensor-level driver for the onsemi MT9M114

-- 
Regards,

Sakari Ailus
