Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC979EDC
	for <llvm@lists.linux.dev>; Sat, 18 Mar 2023 14:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679151094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ric6rrq7vGEm9xb0r4Sa8eTDN4DF7YKXYHcMI7FI7XE=;
	b=OO8kmj5J7MzkhevLqNTe0LgYaTh9ceUzKbnXNuY/Lc4s3SdQvtUuaC/LctdebTASz22dw6
	dVF6sNgxpKHRhHsotyWe7+TBaRDWgS2XAYcCKgp/xt9X/RX4drOW0dNtAqYoYNLxUxb1Ks
	0QIAy82O1ybz6MPX79h5sNcbkCRtPFo=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-L30E5T9eNZyfi2g6dyKsbg-1; Sat, 18 Mar 2023 10:51:33 -0400
X-MC-Unique: L30E5T9eNZyfi2g6dyKsbg-1
Received: by mail-qv1-f71.google.com with SMTP id g14-20020ad457ae000000b005aab630eb8eso4259355qvx.13
        for <llvm@lists.linux.dev>; Sat, 18 Mar 2023 07:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679151092;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ric6rrq7vGEm9xb0r4Sa8eTDN4DF7YKXYHcMI7FI7XE=;
        b=a5+PNQc5E1zKKBhEcMCTuesTKhzgcZogdU1ez8gofzkIdoxo1YDHh32G0Z4whjJqOK
         TYodTqx9YcvUqw4KFPYDQGWb269yAEMCZ8/acyWCQhJZIghZQpwMdnqmjHRQCbJeUt4U
         QiGxrbIGX1IHoUt/5igtCfx06ClVKuEWKRUdMG6voTcvQbZ1vOF9Ei1/DHoS2Nw/6vox
         SHCMX7vkz/MY6GdrKGEWYTWemDdwj3iQ0VMd2ZVo3iqgkMZc5H/3Fq8vmF8uqDf06SHm
         l71DWW0P5y+HlJs6wfdXDcDa1408/vnR8f3LOp6X+gp/PO7u9xHR7uX8Oe4UZySPeeZw
         N9Ww==
X-Gm-Message-State: AO0yUKVL0tOljROnsagYirUT6NdYNJ2eg1r2vMLWW0rZAUOphBIRte6g
	CoR/ZiZf4q2EqLjC9DlD2gk7lkYG8Gno91SBVZ9qEEz+Ojbo4T2WBq6/OjzZi9DOBIWgGVdgv2f
	l0AKluRclC0U0Ww==
X-Received: by 2002:ac8:7dc6:0:b0:3bf:e05a:f2f2 with SMTP id c6-20020ac87dc6000000b003bfe05af2f2mr17551027qte.31.1679151092486;
        Sat, 18 Mar 2023 07:51:32 -0700 (PDT)
X-Google-Smtp-Source: AK7set9ZDp5u9lmhVI2qPCcpmBGFzfulEDfgCvtscb10T98V7E/KIdzQazhy7kKih42X2QbSVFfU5g==
X-Received: by 2002:ac8:7dc6:0:b0:3bf:e05a:f2f2 with SMTP id c6-20020ac87dc6000000b003bfe05af2f2mr17551007qte.31.1679151092223;
        Sat, 18 Mar 2023 07:51:32 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id n185-20020a3740c2000000b007402fdda195sm3729155qka.123.2023.03.18.07.51.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Mar 2023 07:51:31 -0700 (PDT)
Subject: Re: [PATCH] serial: imx: remove unused imx_uart_is_imx* functions
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, nathan@kernel.org, ndesaulniers@google.com,
 llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230317205710.1672232-1-trix@redhat.com>
 <20230318143041.n6rymackf6p776rq@pengutronix.de>
From: Tom Rix <trix@redhat.com>
Message-ID: <b5c61356-02e8-76f1-3e2c-9388aa18462c@redhat.com>
Date: Sat, 18 Mar 2023 07:51:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230318143041.n6rymackf6p776rq@pengutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 3/18/23 7:30 AM, Uwe Kleine-König wrote:
> On Fri, Mar 17, 2023 at 04:57:10PM -0400, Tom Rix wrote:
>> clang with W=1 reports
>> drivers/tty/serial/imx.c:292:19: error:
>>    unused function 'imx_uart_is_imx21' [-Werror,-Wunused-function]
>> static inline int imx_uart_is_imx21(struct imx_port *sport)
>>                    ^
>> drivers/tty/serial/imx.c:297:19: error:
>>    unused function 'imx_uart_is_imx53' [-Werror,-Wunused-function]
>> static inline int imx_uart_is_imx53(struct imx_port *sport)
>>                    ^
>> drivers/tty/serial/imx.c:302:19: error:
>>    unused function 'imx_uart_is_imx6q' [-Werror,-Wunused-function]
>> static inline int imx_uart_is_imx6q(struct imx_port *sport)
>>                    ^
>> These static functions are not used, so remove them.
>>
>> Signed-off-by: Tom Rix <trix@redhat.com>
> Funny, is_imx6q_uart() was introduced in
> a496e6284c482555db8078190bb689594d129fa9 and never used. Since that
> commit is_imx21_uart() also unused. And the imx53 variant was also never
> used.
>
> Looking at that a bit more, the following cleanup is also possible (only
> compile tested):
>
> diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
> index 8308a23c55a7..a38ee0ed2210 100644
> --- a/drivers/tty/serial/imx.c
> +++ b/drivers/tty/serial/imx.c
> @@ -178,8 +178,6 @@
>   enum imx_uart_type {
>   	IMX1_UART,
>   	IMX21_UART,
> -	IMX53_UART,
> -	IMX6Q_UART,
>   };
>   
>   /* device type dependent stuff */
> @@ -241,30 +239,21 @@ struct imx_port_ucrs {
>   	unsigned int	ucr3;
>   };
>   
> -static struct imx_uart_data imx_uart_devdata[] = {
> -	[IMX1_UART] = {
> -		.uts_reg = IMX1_UTS,
> -		.devtype = IMX1_UART,
> -	},
> -	[IMX21_UART] = {
> -		.uts_reg = IMX21_UTS,
> -		.devtype = IMX21_UART,
> -	},
> -	[IMX53_UART] = {
> -		.uts_reg = IMX21_UTS,
> -		.devtype = IMX53_UART,
> -	},
> -	[IMX6Q_UART] = {
> -		.uts_reg = IMX21_UTS,
> -		.devtype = IMX6Q_UART,
> -	},
> +static const struct imx_uart_data imx_uart_imx1_devdata = {
> +	.uts_reg = IMX1_UTS,
> +	.devtype = IMX1_UART,
> +};
> +
> +static const struct imx_uart_data imx_uart_imx21_devdata = {
> +	.uts_reg = IMX21_UTS,
> +	.devtype = IMX21_UART,
>   };
>   
>   static const struct of_device_id imx_uart_dt_ids[] = {
> -	{ .compatible = "fsl,imx6q-uart", .data = &imx_uart_devdata[IMX6Q_UART], },
> -	{ .compatible = "fsl,imx53-uart", .data = &imx_uart_devdata[IMX53_UART], },
> -	{ .compatible = "fsl,imx1-uart", .data = &imx_uart_devdata[IMX1_UART], },
> -	{ .compatible = "fsl,imx21-uart", .data = &imx_uart_devdata[IMX21_UART], },
> +	{ .compatible = "fsl,imx6q-uart", .data = &imx_uart_imx21_devdata, },
> +	{ .compatible = "fsl,imx53-uart", .data = &imx_uart_imx21_devdata, },
> +	{ .compatible = "fsl,imx1-uart", .data = &imx_uart_imx1_devdata, },
> +	{ .compatible = "fsl,imx21-uart", .data = &imx_uart_imx21_devdata, },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, imx_uart_dt_ids);
>
> If you feel like squashing that into your commit or put it into a
> separate commit with a nice commit log (after convincing yourself that
> the change is fine), feel free to do so.
>
> If you don't:

My interest is not in imx specifically, but rather cleaning up all the 
unused functions.

I _think_ I can get the list of around 70 down to around 10 but it will 
take a while.

Tom


>
> Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>
> Best regards
> Uwe
>

