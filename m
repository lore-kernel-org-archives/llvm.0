Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A307A;
	Sun, 24 Apr 2022 17:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DEA5C385A7;
	Sun, 24 Apr 2022 17:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650821494;
	bh=jjxwm4sbDuaBN4rFT9BE+jraiy9tujTIunLpi1T1TEI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bgGcfKBQJSA9ZTmvok+gWbgQBWcu8FBdj6HJ7gStN+DRw7spivYeG6PBklcWTaiSF
	 XJcIqflG8yO9nabBJlZfoT23DGTVezq74ofTTQbWK/7oq24cyZ9X82IftHDg76WQuf
	 9o2bCyLtV6Nti0ikA3P2/RlzeCMGfF/Hbl9fGDCtflaL3hGm1eGgEHUCPu/E/Ak2ml
	 irUOx9E3zWAPLed9T3l2cnvouu0NT6glhQJxLcmWfC9EjPm/GTJlhKHG4T1Nz5YUxH
	 f7bTrHsaXYymy1xORDRUE/7fsEmgd5D3Pc674vZHBqrIIWQctQf6S403EDync8Fwgu
	 BsEu1G69WinVg==
Date: Sun, 24 Apr 2022 18:39:40 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org,
 linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] staging: iio: ad2s1210: remove redundant assignment to
 variable negative
Message-ID: <20220424183940.3b209ee5@jic23-huawei>
In-Reply-To: <20220418134603.81336-1-colin.i.king@gmail.com>
References: <20220418134603.81336-1-colin.i.king@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 18 Apr 2022 14:46:03 +0100
Colin Ian King <colin.i.king@gmail.com> wrote:

> Variable negative is being assigned a value that is never read, it is
> being re-assigned later. The assignment is redundant and can be removed.
> 
> Cleans up clang scan build warning:
> drivers/staging/iio/resolver/ad2s1210.c:502:3: warning: Value stored
> to 'negative' is never read [deadcode.DeadStores]
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Seems that someone decided to match again against the endian converted
version so indeed this is pointless.

Applied to the togreg branch of iio.git and pushed out as testing for 0-day
to see if it can find anything we missed.

Thanks,

Jonathan

> ---
>  drivers/staging/iio/resolver/ad2s1210.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
> index 74adb82f37c3..c0b2716d0511 100644
> --- a/drivers/staging/iio/resolver/ad2s1210.c
> +++ b/drivers/staging/iio/resolver/ad2s1210.c
> @@ -499,7 +499,6 @@ static int ad2s1210_read_raw(struct iio_dev *indio_dev,
>  		ret = IIO_VAL_INT;
>  		break;
>  	case IIO_ANGL_VEL:
> -		negative = st->rx[0] & 0x80;
>  		vel = be16_to_cpup((__be16 *)st->rx);
>  		vel >>= 16 - st->resolution;
>  		if (vel & 0x8000) {

