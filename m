Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF3B2C80
	for <llvm@lists.linux.dev>; Thu, 10 Feb 2022 17:16:58 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id 189-20020a4a03c6000000b003179d7b30d8so7172025ooi.2
        for <llvm@lists.linux.dev>; Thu, 10 Feb 2022 09:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=tF0IdRUabJmaRRus95Z5p3zXuerNa3bJdG4Z4g7kpaM=;
        b=bj6FstknEB+9jp9dj1+019eCXf0aBLIaXydcqCv0+JZFxQigw8HmhH0wAIdoRdx3KS
         zCSVNTbiKOMmQzlhkOeLbSwLT0DruSZldtOc8Qy2Xsn7fwWQM2c6CnC4FdvjtCnFrk0M
         /d/kmxRWu1Z+wr/A1oVo5lzAT+sUGqLZPx7An6Put7ftUjgRr5Pc5XlulzfydclHO8id
         j12f/kvxNAM8OLNMRpZV5ZSBxn8QOIdg9wy/BDAzU9dSxk/AGqaKnDpcC6QwRMvleTeF
         2ovQx2tZD61aS6pd4bmEBiJJ0fJ4v0NM+HannzBAYMUt/hyboiuMqPmb5HJ6CubM+Ep9
         RQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=tF0IdRUabJmaRRus95Z5p3zXuerNa3bJdG4Z4g7kpaM=;
        b=LmGxDYqWEPwNWQWn5Mgw8EcOKJGvZbdX5dt6RW6QaLoC1LUw0/gQULo4Q/tAz+3W2c
         J2EM3LfpZ/u9IqBfellV0TTVje2RHMwG7cX3xAOY1RlCnrvtmS8PMkIz77ccd+CPRq08
         n/Pmzw10LZ2D3dWmUjiYLbecw0QkyNRR7gB2bTOX3y5gViyauhcgQNovbZsiii1jaYmr
         sCbkldv6akOCbCRZ/i/+I6LGcmz2Pajo39CAx0R+6QgnbcllcD0VUCwhZJHwmjNdIMys
         U7Ae6LjbNbJCF5ikcdJ8v4M4aCdEzqQ7OgvzRuhKsm6oNGoiCxPsYHsT2UblME0TE3um
         2KBg==
X-Gm-Message-State: AOAM532fXcVl5tvXUR2AVv3ZhtQFFYuE+nyNYHy0OG8r9D13EPWUichD
	O/m3+ff0Cjxps6Cd78EjBz9aeA==
X-Google-Smtp-Source: ABdhPJxjo9lvXq6I9MNP74kftoBexd5upGA6NC1hRTD65S023g7x7juqcYs3jJfa3uxBEV5cV3N8Dw==
X-Received: by 2002:a4a:d583:: with SMTP id z3mr3124619oos.68.1644513417581;
        Thu, 10 Feb 2022 09:16:57 -0800 (PST)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id u32sm4239140oiw.28.2022.02.10.09.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 09:16:56 -0800 (PST)
Date: Thu, 10 Feb 2022 09:16:39 -0800 (PST)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.anvils
To: ci_notify@linaro.org
cc: Hugh Dickins <hughd@google.com>, llvm@lists.linux.dev, arnd@linaro.org
Subject: Re: [TCWG CI] Regression caused by linux: mm/munlock: mlock_page()
 munlock_page() batch by pagevec
In-Reply-To: <1721993191.23462.1644511416102@jenkins.jenkins>
Message-ID: <b01f8da4-4140-68a6-ae59-fb71f4d324ca@google.com>
References: <1721993191.23462.1644511416102@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Feb 2022, ci_notify@linaro.org wrote:

> [TCWG CI] Regression caused by linux: mm/munlock: mlock_page() munlock_page() batch by pagevec:
> commit cbaf47432c909044db94fbbf45a0870f6d2f169e
> Author: Hugh Dickins <hughd@google.com>
> 
>     mm/munlock: mlock_page() munlock_page() batch by pagevec
> 
> Results regressed to
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 553
> # First few build errors in logs:
> # 00:00:47 mm/swap.c:637:2: error: implicit declaration of function 'mlock_page_drain' [-Werror,-Wimplicit-function-declaration]
> # 00:00:47 make[1]: *** [mm/swap.o] Error 1
> # 00:00:47 make: *** [mm] Error 2

Thank you, yes, expected to be fixed by

https://lore.kernel.org/linux-mm/8eae6026-098-befb-92d3-b9ad2ad57776@google.com/

Hugh
