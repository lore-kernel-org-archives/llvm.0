Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F6A182B5
	for <llvm@lists.linux.dev>; Fri, 18 Aug 2023 16:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F623C433C7;
	Fri, 18 Aug 2023 16:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692374519;
	bh=yjW1SJSFumpPs+wJmIr381ix9dt6xfcRT4QIG0PkQq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cvgCPt9e3kyaPovSv1rYGnIIB0sJqvqbjExtGZHx7BQck9qw5NWRyEpBREMooxnag
	 m2YddmbJjd3RUORT0meLun5nsXOZ9MfoK5w3XyX08bqUVtsvyxgZhcRDaJDCofiDbR
	 qQYQzDUqP1UumKz9gKIfYXpnJNdoFrLuVV6Gua/V9qtEvsZA6Y+1YHj2f3xf38GAkE
	 GjamPP8BZ8MyWig2KAKmpyt8qt1uaGYq/uT72XCTfIhNVz+OVNixmIJLuauXcdVzGb
	 uuRBJPM72KXJS2LoiWwlri6hpE9bU5PVpc2iPIU5y40AzjPEIGzt/vsx3PUQIzEQAP
	 D02LuNKYx48pA==
Date: Fri, 18 Aug 2023 17:01:54 +0100
From: Lee Jones <lee@kernel.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Pavel Machek <pavel@ucw.cz>, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] leds: pca955x: fix -Wvoid-pointer-to-enum-cast warning
Message-ID: <20230818160154.GZ986605@google.com>
References: <20230816-void-drivers-leds-leds-pca955x-v1-1-2967e4c1bdcc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230816-void-drivers-leds-leds-pca955x-v1-1-2967e4c1bdcc@google.com>

On Wed, 16 Aug 2023, Justin Stitt wrote:

> When building with clang 18 I see the following warning:
> |      drivers/leds/leds-pca955x.c:487:15: warning: cast to smaller integer
> |      type 'enum pca955x_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
> |        487 |                 chip_type = (enum pca955x_type)md;
> 
> This is due to the fact that `md` is a void* while `enum pca995x_type` has the
> size of an int.
> 
> Add uintptr_t cast to silence clang warning while also keeping enum cast
> for readability and consistency with other `chip_type` assignment just a
> few lines below:
> |	chip_type = (enum pca955x_type)id->driver_data;
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1910
> Reported-by: Nathan Chancellor <nathan@kernel.org>

A review from Nathan would be good here.

> Signed-off-by: Justin Stitt <justinstitt@google.com>

Also please make checkpatch.pl happy before resending, thanks.

> ---
> 
> 
> leds: pca955x: fix -Wvoid-pointer-to-enum-cast warning
> ---
> Note: I've opted to keep the initial `enum pca955x_type` cast and just
> place the uintptr_t cast first to silence the warning. It seemed weird
> to me to see the same variable being assigned to two different casted
> values within just a few lines.
> ---
>  drivers/leds/leds-pca955x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> index b10e1ef38db0..1d7fa0cd97bf 100644
> --- a/drivers/leds/leds-pca955x.c
> +++ b/drivers/leds/leds-pca955x.c
> @@ -484,7 +484,7 @@ static int pca955x_probe(struct i2c_client *client)
>  	const void *md = device_get_match_data(&client->dev);
>  
>  	if (md) {
> -		chip_type = (enum pca955x_type)md;
> +		chip_type = (enum pca955x_type)(uintptr_t)md;
>  	} else {
>  		const struct i2c_device_id *id = i2c_match_id(pca955x_id,
>  							      client);
> 
> ---
> base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
> change-id: 20230816-void-drivers-leds-leds-pca955x-7002cc67a291
> 
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
> 

-- 
Lee Jones [李琼斯]
