Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0391A79DD;
	Tue, 17 Jan 2023 16:24:53 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id j16-20020a056830271000b0067202045ee9so18108464otu.7;
        Tue, 17 Jan 2023 08:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UAzKKb2S5HZ8F5W/im9A84XTnFozNvOOghoD+jxNx1s=;
        b=hSqGug+f4cxMTaCDHiiAXfwAZCIx2vX121sRoH6IFNqvxsV17eLhGEt8akBXXWjVL3
         lI2KYpkquCt/rLXf5ZIMhLCIyriQ2xXmQuK6Jgtiu97Mxxtxx5z6rqwxTPb4dHdkHQ3T
         413pgPsTzd7A1ElxN9jZRbGlCjwbaWHJPbZODGsmv9WvjDrp5iVVqwNyJNXk/8vsgT99
         0RIXh8TPB+ZFTgV4t1TLoI+Ywjv6vZB7lbgc+gHHqUYQ1f9yPqfEMB0q2Zgl2ypccWaf
         qHId0dFJf6tFXZK5bEx0HPsLZg3a52IxdXTuQkc/UzJYTWcurj3AD4yWmmewn2/o25A9
         Pleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAzKKb2S5HZ8F5W/im9A84XTnFozNvOOghoD+jxNx1s=;
        b=PYcEgaPRS0vwR0CYzIm9EjWCaxhJiT6RbnlW/uavXBExvw+PBnfj4WKLSRHN+FWZEj
         LLPFMWbCwJFk7EESe9uauMc5mahLy+3FYoZfqPQj1B7/nxcaJ5Hj8/mf8gJ6YnxrrE8q
         5PLD1mlNjO1BpIGKA8KGeGOrJgzkEotJN5t3b9BYfJyctXbSEH4zjZGGX6x+f5D7jRQS
         aPasNubesMCxeQ9ortqnrPka0FzQ1DiNCEXPZaJ1eoVm3bqnCXXZmBqdS7H515vRpl9P
         kAw1R9ZXsdyQysVo4KDxzYUwJbi3kGW5IsMl8XOSgqtgapg8FqUWxLEfY5LVlZd2s7B4
         nMtw==
X-Gm-Message-State: AFqh2krqJZd8tbo9kV8s5/dr1CD++miAQRPAGVmjH739ajXhUSSF/aHx
	l4nTdb/TNrcUqaSYyvB+HQs=
X-Google-Smtp-Source: AMrXdXsR4Y5MG+qJIUV0FQENUi8WR5bOp3fTjhZzmTCC+k5D6NpsookIw9SwvgW3glyyXBPToaniig==
X-Received: by 2002:a05:6830:4412:b0:66c:4732:3429 with SMTP id q18-20020a056830441200b0066c47323429mr2120482otv.13.1673972692958;
        Tue, 17 Jan 2023 08:24:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bs1-20020a056830398100b00660e833baddsm16818420otb.29.2023.01.17.08.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 08:24:52 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 17 Jan 2023 08:24:51 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_proto: remove big stub objects
 from stack
Message-ID: <20230117162451.GA4097956@roeck-us.net>
References: <20230117080254.2725536-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117080254.2725536-1-tzungbi@kernel.org>

On Tue, Jan 17, 2023 at 04:02:54PM +0800, Tzung-Bi Shih wrote:
> sizeof(struct device) = 680
> sizeof(struct cros_ec_dev) = 720
> 
> They tend to exceed the stack frame size limit in some specific
> environment which results in the following compilation error:
> 
> >> drivers/platform/chrome/cros_ec_proto_test.c:2530:13: error: stack
> frame size (2128) exceeds limit (2048) in
> 'cros_ec_proto_test_get_sensor_count_legacy'
> 
> Remove the big stub objects from stack.
> 
> This is:
> $ sed -i 's/struct cros_ec_dev /static struct cros_ec_dev /' \
>     drivers/platform/chrome/cros_ec_proto_test.c
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/platform/chrome/cros_ec_proto_test.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
> index 08c58d031593..5b9748e0463b 100644
> --- a/drivers/platform/chrome/cros_ec_proto_test.c
> +++ b/drivers/platform/chrome/cros_ec_proto_test.c
> @@ -2371,7 +2371,7 @@ static void cros_ec_proto_test_get_host_event_normal(struct kunit *test)
>  static void cros_ec_proto_test_check_features_cached(struct kunit *test)
>  {
>  	int ret, i;
> -	struct cros_ec_dev ec;
> +	static struct cros_ec_dev ec;
>  
>  	ec.features.flags[0] = EC_FEATURE_MASK_0(EC_FEATURE_FINGERPRINT);
>  	ec.features.flags[1] = EC_FEATURE_MASK_0(EC_FEATURE_SCP);
> @@ -2396,7 +2396,7 @@ static void cros_ec_proto_test_check_features_not_cached(struct kunit *test)
>  	struct cros_ec_device *ec_dev = &priv->ec_dev;
>  	struct ec_xfer_mock *mock;
>  	int ret, i;
> -	struct cros_ec_dev ec;
> +	static struct cros_ec_dev ec;
>  
>  	ec_dev->max_request = 0xff;
>  	ec_dev->max_response = 0xee;
> @@ -2449,7 +2449,7 @@ static void cros_ec_proto_test_get_sensor_count_normal(struct kunit *test)
>  	struct cros_ec_device *ec_dev = &priv->ec_dev;
>  	struct ec_xfer_mock *mock;
>  	int ret;
> -	struct cros_ec_dev ec;
> +	static struct cros_ec_dev ec;
>  
>  	ec_dev->max_request = 0xff;
>  	ec_dev->max_response = 0xee;
> @@ -2494,7 +2494,7 @@ static void cros_ec_proto_test_get_sensor_count_xfer_error(struct kunit *test)
>  	struct cros_ec_device *ec_dev = &priv->ec_dev;
>  	struct ec_xfer_mock *mock;
>  	int ret;
> -	struct cros_ec_dev ec;
> +	static struct cros_ec_dev ec;
>  
>  	ec_dev->max_request = 0xff;
>  	ec_dev->max_response = 0xee;
> @@ -2534,7 +2534,7 @@ static void cros_ec_proto_test_get_sensor_count_legacy(struct kunit *test)
>  	struct cros_ec_device *ec_dev = &priv->ec_dev;
>  	struct ec_xfer_mock *mock;
>  	int ret, i;
> -	struct cros_ec_dev ec;
> +	static struct cros_ec_dev ec;
>  	struct {
>  		u8 readmem_data;
>  		int expected_result;
