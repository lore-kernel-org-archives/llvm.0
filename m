Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10A67E1
	for <llvm@lists.linux.dev>; Tue, 27 Sep 2022 09:36:19 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id l18so2081575wrw.9
        for <llvm@lists.linux.dev>; Tue, 27 Sep 2022 02:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=/PlTLjGPSzswYlkSsTRBa4iX8iTXJTu7JK2WCLTfMVI=;
        b=zwOCiH829H9W0MajrUip+/i4V00nILbmKLrgsGXRXIs/H3acOnp1T8Retrgw/XuQnk
         WGAUlUaNiAHW0q1vdy31YzcqavfVoEH4yRocF2uitfJcL3lHXsl6m5keoyqFr3wFIYKb
         4quqBuNZGY8cNnRoPJLx9VgOXPvXosnH/zEQSyQpsXODFOaqfIKqOZRdKXqbZBmyEG4R
         PqeXHMNqDpdjlWJN9tKSDwfcpXT1A9b4mzMpHEdDyTVoVAGBHlc0ILCKTdSQ9yapXD2f
         mTdkn6fVZZcWCWX1hhr0I6Xz6EaaADoMqimQJNW+VoZvzJ0xZyBtnNKYnpeAddTHF2ct
         jplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/PlTLjGPSzswYlkSsTRBa4iX8iTXJTu7JK2WCLTfMVI=;
        b=YV6+CVK3pQnbW8a61sz6gKbhik0e7WjdVQhqBHGifRi/NgIF78vulw3zeeTVEuway0
         eR4p4TjHk/F3IcVNhjqNUxnJJjLEWqBJyCNdo3lwEbtcMAsMMY0DDO7MIs6uXJy1Rv+x
         fOf8RFoVKrU0IR0TuMpzNf7UBoU4biYVQPu4ZD15hggWzPNAztEGJQdby7WKxYN7FP3M
         YT3P8ocdgp2dgjRafH1WVnhY80k7ffwRxMpspaPHxs5Vb6TFydt/IviLJQOiZDoJ4dO2
         wyDOLLaSz1CBsTaElpw7reailVM8Tv3xkXBn/w3Y35sFa4brxWw/8v9I4pAnUAvR8dpL
         NoOA==
X-Gm-Message-State: ACrzQf3AkF/CZ9OYvV8i6aP7yfp5sGRExIdr1DSmMzd2dSIEjy19xEIq
	N3j9pLnhjauRemMsuH+pw3K2LQ==
X-Google-Smtp-Source: AMsMyM7Sbp3KGS9RYk/ygpLZfdjsNmCuCMpLpfCLcKHXR7Gpm06yHTH40B2WCmC9hs7behpb1hhprA==
X-Received: by 2002:adf:de11:0:b0:22c:b5f0:272e with SMTP id b17-20020adfde11000000b0022cb5f0272emr2003308wrm.224.1664271377909;
        Tue, 27 Sep 2022 02:36:17 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 14-20020a05600c028e00b003b3307fb98fsm1180132wmk.24.2022.09.27.02.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 02:36:17 -0700 (PDT)
Message-ID: <29cc25fb-0196-d80d-e3c7-b6aa22d32b1b@linaro.org>
Date: Tue, 27 Sep 2022 11:36:16 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH -next] thermal/intel/int340x: Initialized ret in error
 path in int340x_thermal_zone_add()
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, "kernelci.org bot" <bot@kernelci.org>,
 "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
References: <20220923152009.1721739-1-nathan@kernel.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220923152009.1721739-1-nathan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/09/2022 17:20, Nathan Chancellor wrote:
> Clang warns:
> 
>    drivers/thermal/intel/int340x_thermal/int340x_thermal_zone.c:222:6: error: variable 'ret' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
>            if (!int34x_thermal_zone->ops)
>                ^~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/thermal/intel/int340x_thermal/int340x_thermal_zone.c:279:17: note: uninitialized use occurs here
>            return ERR_PTR(ret);
>                          ^~~
>    drivers/thermal/intel/int340x_thermal/int340x_thermal_zone.c:222:2: note: remove the 'if' if its condition is always false
>            if (!int34x_thermal_zone->ops)
>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/thermal/intel/int340x_thermal/int340x_thermal_zone.c:211:9: note: initialize the variable 'ret' to silence this warning
>            int ret;
>                  ^
>                    = 0
>    1 error generated.
> 
> If kmemdup() fails, -ENOMEM should be returned.
> 
> Fixes: f6f6f9a01374 ("thermal/intel/int340x: Replace parameter to simplify")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1717
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Reported-by: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---

I've folded this patch with the changes introducing the issue

Thanks for the fix


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
