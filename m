Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A09817EA
	for <llvm@lists.linux.dev>; Wed, 11 Jan 2023 23:20:24 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id o8so8650261ilo.1
        for <llvm@lists.linux.dev>; Wed, 11 Jan 2023 15:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=82kiV6CT5bY5UwtwlTr9ODnHbyHvh43Y6iajviNHDb0=;
        b=UK3+wgm0lc1kST8z65QsZby2afptNaWNJYkOuEoueXtIuX2G0iMseEJHi0TKnpIQr9
         e2j5juB2iNKYpJhoIC92JD3m9g8VASmQaBmhTBnt/btuVwsQZUrX6h6u9NgWeUQjKQ+6
         XxJuIs8E2gVmO3IdIF+mDiyJw3JH10HGhHlRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=82kiV6CT5bY5UwtwlTr9ODnHbyHvh43Y6iajviNHDb0=;
        b=RZGnyI2N3anKw0t+GEK/JTajnZGdEmMMdoaIy+0tmK1h7cYdicZa6TZ72RPWv7e9uV
         zOJIJ2j2Kc7wl9v58sW6c7IxFMZaWlcz5r9rhDcMsqtEzaXFZGSp7GAY3rAWCbLFVCbJ
         SwQw3fajP5G1smgGg08Fw9Q1rf/LgeOhsrGzQRfzEi1ztPs09tGkymCTf5vCj7/HG0FW
         oQLgoC71UeGYCRZkezva5BUksQIp8GJ+wgOhCmhfoA8h7Pontj3xRgKc9lkMxrqr9aSg
         9SMg/WFg8R8NeifXaNdK5ObMuWMBs1pNT+dq45GgaDcw3jSI/G0rvqGinAYnRJ9uxjKF
         dZDg==
X-Gm-Message-State: AFqh2kqeRaDmBFj4ec5vL9RaK4aN5qxegnduSyNTYtYftNX8uu9J46VL
	8aYyRxhRX+2MMcSw+uBTfIawEg==
X-Google-Smtp-Source: AMrXdXvNBaXGvRgfW9IIO/6VMKJAaGzPIQky+h01RDjk5ybH4GNQ4PE3cOseA2+qBakv4nWCuOpSBg==
X-Received: by 2002:a92:b703:0:b0:30c:1dda:42dd with SMTP id k3-20020a92b703000000b0030c1dda42ddmr6991828ili.1.1673479223936;
        Wed, 11 Jan 2023 15:20:23 -0800 (PST)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id g20-20020a92c7d4000000b0030c661606eesm4877810ilk.63.2023.01.11.15.20.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 15:20:23 -0800 (PST)
Message-ID: <6d3602fd-fdf8-d6f6-56f7-d70eb2d381d8@linuxfoundation.org>
Date: Wed, 11 Jan 2023 16:20:22 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] kselftest: Fix error message for unconfigured LLVM builds
To: Mark Brown <broonie@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20230111-kselftest-lib-clang-fix-v1-1-58ebadd0e090@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20230111-kselftest-lib-clang-fix-v1-1-58ebadd0e090@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/11/23 15:33, Mark Brown wrote:
> We are missing a ) when we attempt to complain about not having enough
> configuration for clang, resulting in the rather inscrutable error:
> 
> ../lib.mk:23: *** unterminated call to function 'error': missing ')'.  Stop.
> 
> Add the required ) so we print the message we were trying to print.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   tools/testing/selftests/lib.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
> index 291144c284fb..f7900e75d230 100644
> --- a/tools/testing/selftests/lib.mk
> +++ b/tools/testing/selftests/lib.mk
> @@ -20,7 +20,7 @@ CLANG_TARGET_FLAGS              := $(CLANG_TARGET_FLAGS_$(ARCH))
>   
>   ifeq ($(CROSS_COMPILE),)
>   ifeq ($(CLANG_TARGET_FLAGS),)
> -$(error Specify CROSS_COMPILE or add '--target=' option to lib.mk
> +$(error Specify CROSS_COMPILE or add '--target=' option to lib.mk)
>   else
>   CLANG_FLAGS     += --target=$(CLANG_TARGET_FLAGS)
>   endif # CLANG_TARGET_FLAGS
> 
> ---
> base-commit: b7bfaa761d760e72a969d116517eaa12e404c262
> change-id: 20230111-kselftest-lib-clang-fix-8936ba376ea1
> 
> Best regards,

Thank you. I will queue this up for the next rc.

thanks,
-- Shuah
