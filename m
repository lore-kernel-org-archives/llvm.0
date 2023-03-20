Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23411E4EA
	for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 11:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679313517; x=1710849517;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LCPIvBrCQGAh7elfEB0JA5c+vVsNp7NghGe8xccRXjY=;
  b=Rh21FYDL1XAz1+texpAxYF7opGYYT3X3njWbm+146MefJoD/vXzT7YwU
   E60tQcIuKEqiifsM422M4LAY0Mbp7UdpfmkgvjsNOE5U1OVaiWLzQYWjE
   H2EZXYeBTfPucWZ88f4hsZKlr7/wvfKMIXH6ozzvmgHoP3lyO+oGyAHvz
   NCB2tvXTkBtqglYfX+HKql3ogwmYZYD94gFnGQZsoKD4+Oct9nhmt5bU+
   7WKgsx0dla7a+iR0YwNNj7ZWvqsQfOQt07R7f7Et3yZRv4n3o1KmPKUQN
   IOTiV3LjGJ7tRUj5CGYC57U5qJQnez7irHz8BOWLo9M6LYXE+olCXwJt3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="403511677"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="403511677"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 04:58:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="824451129"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="824451129"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 20 Mar 2023 04:58:32 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 20 Mar 2023 13:58:31 +0200
Date: Mon, 20 Mar 2023 13:58:31 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Tom Rix <trix@redhat.com>
Cc: gregkh@linuxfoundation.org, nathan@kernel.org, ndesaulniers@google.com,
	sven@svenpeter.dev, agx@sigxcpu.org, Jonathan.Cameron@huawei.com,
	jun.nie@linaro.org, u.kleine-koenig@pengutronix.de,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] usb: typec: tipd: remove unused tps6598x_write16,32
 functions
Message-ID: <ZBhKZ3gVjLnblezP@kuha.fi.intel.com>
References: <20230319133732.1702841-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230319133732.1702841-1-trix@redhat.com>

On Sun, Mar 19, 2023 at 09:37:32AM -0400, Tom Rix wrote:
> clang with W=1 reports
> drivers/usb/typec/tipd/core.c:180:19: error: unused function
>   'tps6598x_write16' [-Werror,-Wunused-function]
> static inline int tps6598x_write16(struct tps6598x *tps, u8 reg, u16 val)
>                   ^
> drivers/usb/typec/tipd/core.c:185:19: error: unused function
>   'tps6598x_write32' [-Werror,-Wunused-function]
> static inline int tps6598x_write32(struct tps6598x *tps, u8 reg, u32 val)
>                   ^
> These static functions are not used, so remove them.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tipd/core.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index 485b90c13078..af6ecb54b52c 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -177,16 +177,6 @@ static inline int tps6598x_read64(struct tps6598x *tps, u8 reg, u64 *val)
>  	return tps6598x_block_read(tps, reg, val, sizeof(u64));
>  }
>  
> -static inline int tps6598x_write16(struct tps6598x *tps, u8 reg, u16 val)
> -{
> -	return tps6598x_block_write(tps, reg, &val, sizeof(u16));
> -}
> -
> -static inline int tps6598x_write32(struct tps6598x *tps, u8 reg, u32 val)
> -{
> -	return tps6598x_block_write(tps, reg, &val, sizeof(u32));
> -}
> -
>  static inline int tps6598x_write64(struct tps6598x *tps, u8 reg, u64 val)
>  {
>  	return tps6598x_block_write(tps, reg, &val, sizeof(u64));

thanks,

-- 
heikki
