Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762F0184C
	for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 11:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679313560; x=1710849560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ae9Y8B1H3DR2CpwT8EmI0bUU2kuCt5ev5+Cua1MKlY4=;
  b=jHC6iK+OFy2z0Z76f4N17DCVIT79E+wkRoicV3lM/39El1C+fZ1K/vnH
   wvlBY4mjEu0nD/Gy8OCnhGk54O0ggWB5rUT54ya3eho0/c8cMEgAenKm6
   5+8N69/sbcpsJrQFaDrPSZGnl7H7Lzmyd6dAd++Qcd8uOGaq7jui2Fdjt
   YdRH2bv/XWEg8RuDYXJMPaeJsv/e2VRJT+XNA9OqcmhkyS+kZUml8/3xy
   TOUE/d3cnoXGVgMe2xpRM4qBWzHhNiU9mQxmzrn105AL763INPwTn28gb
   1Jk0Z6+Mp1ju+2ChmUud2dg8Bo8ovroMKmW9a81cHCGr2OslsoT4qzlwZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="403511843"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="403511843"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 04:59:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="824451370"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="824451370"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 20 Mar 2023 04:59:15 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 20 Mar 2023 13:59:14 +0200
Date: Mon, 20 Mar 2023 13:59:14 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Tom Rix <trix@redhat.com>
Cc: linux@roeck-us.net, gregkh@linuxfoundation.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, nathan@kernel.org,
	ndesaulniers@google.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH] usb: typec: tcpci_mt6360: remove unused
 mt6360_tcpc_read16 function
Message-ID: <ZBhKkqqoSkmBueaO@kuha.fi.intel.com>
References: <20230319141053.1703937-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230319141053.1703937-1-trix@redhat.com>

On Sun, Mar 19, 2023 at 10:10:53AM -0400, Tom Rix wrote:
> clang with W=1 reports
> drivers/usb/typec/tcpm/tcpci_mt6360.c:46:19: error: unused function
>   'mt6360_tcpc_read16' [-Werror,-Wunused-function]
> static inline int mt6360_tcpc_read16(struct regmap *regmap,
>                   ^
> This function is not used, so remove it.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpci_mt6360.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_mt6360.c b/drivers/usb/typec/tcpm/tcpci_mt6360.c
> index 1b7c31278ebb..6fa8fd5c8041 100644
> --- a/drivers/usb/typec/tcpm/tcpci_mt6360.c
> +++ b/drivers/usb/typec/tcpm/tcpci_mt6360.c
> @@ -43,12 +43,6 @@ struct mt6360_tcpc_info {
>  	int irq;
>  };
>  
> -static inline int mt6360_tcpc_read16(struct regmap *regmap,
> -				     unsigned int reg, u16 *val)
> -{
> -	return regmap_raw_read(regmap, reg, val, sizeof(u16));
> -}
> -
>  static inline int mt6360_tcpc_write16(struct regmap *regmap,
>  				      unsigned int reg, u16 val)
>  {
> -- 
> 2.27.0

-- 
heikki
