Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12E729CA
	for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 16:01:30 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id h16so29882777lfk.10
        for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 09:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O7o8nytLXMUXQdmXcn0J+cx6AmEuTmtKjrOwXucFFVw=;
        b=V9DkA3YxNFNKt+kZfIU6UYrbnjxqTVpU5jxLXsh+y7SsxT3fJ0JPgfzuoszBZZZtTF
         jksmWVGYCq05qzNmFTHTCJ4xcvTQvUtqU1RFlAeKMSohHNvkuV1h+llPH9kBRWDHtj/D
         YVV2qWwx2D8qnjaPYa3v/ADQKFRZwfamoKYegxKGfl6UwF4LF8Mu3e4pIREZ7ee8h3/l
         Wawh0vASCAtz0qH+oEMOx1Uabk4pngW0LUghGESdC/F0a+Yph5g9p/bsTqMU4LDEm1EG
         LJUY7DprzgF9dQ/2pg0hOjZZILp1WIOVJ36rDc5THVEPyPjKCY78FzBo7JvfKxIBnH70
         79RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O7o8nytLXMUXQdmXcn0J+cx6AmEuTmtKjrOwXucFFVw=;
        b=mEZu0eI8hP+Z3TTMzkoXX5iiCTXem7gz7/bOpbf3u8CeCSpHM34nh5wVF/+d3D/agB
         0mhtmbTGvoVdtJtN1IIz6cGAuKaxTSqqtmFQstU7RvtnlrYYXS59LfzH5X8LM0TTtvyw
         S0CyUUHiIeo/uuIsn3ElwG4MqYF67Zh9ReaRJOXVzc8iqcmfCvOKIhhyNwJyQH0eWLJ+
         zC2TSruupe1Ce/70g8tajp+gWiQp1Pqtmll4DJZxE6rPxIWJCNdPUhSLeJH8+k4mry9K
         LUnefae6UHZKDTijsdgMOs+IITqjsdqVdXTrXUIlWa43isBNNHq3iatl84XqzateC0rm
         sBXA==
X-Gm-Message-State: AOAM533j7v1cpjYrXRtxDKKEdk0anje+jM08EiaBctLsRmUZ64z9vZhl
	gIWswtlsZ9YufFpuqSocZc1/3oLZzUIivX05xYBa2LPXS7rP9w==
X-Google-Smtp-Source: ABdhPJwtPU5sKsSabfh0/4yuY25XZ69r6VnK8XAXkSz7SaLhqqmYnXbo0MQ9LZqRpoAguVUswo3zICjPngHSMuQ0+fA=
X-Received: by 2002:a05:6512:3b9e:: with SMTP id g30mr13372286lfv.651.1631635288279;
 Tue, 14 Sep 2021 09:01:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210914154441.1726853-1-andreas@rammhold.de>
In-Reply-To: <20210914154441.1726853-1-andreas@rammhold.de>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 14 Sep 2021 09:01:16 -0700
Message-ID: <CAKwvOdnW8kNHFC2sSOASm63m1D5vULF9-UOy2mJrF2tPdgh6pQ@mail.gmail.com>
Subject: Re: [PATCH] gen_compile_commands: add missing sys import
To: andreas@rammhold.de
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 14, 2021 at 8:44 AM <andreas@rammhold.de> wrote:
>
> From: Andreas Rammhold <andreas@rammhold.de>
>
> The sys.exit was being used at multiple locations within the script but
> never imported. This lead to the script exiting with a error instead of
> with the nicely formatted (useful) error output.
>
> Signed-off-by: Andreas Rammhold <andreas@rammhold.de>

Hi Andreas,
Thanks for the patch. Someone beat you to the punch though:
https://lore.kernel.org/lkml/20210908032847.18683-1-kortanzh@gmail.com/.

This is good; it means folks are playing with this. :)

> ---
>  scripts/clang-tools/gen_compile_commands.py | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> index 0033eedce003e..1d1bde1fd45eb 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -13,6 +13,7 @@ import logging
>  import os
>  import re
>  import subprocess
> +import sys
>
>  _DEFAULT_OUTPUT = 'compile_commands.json'
>  _DEFAULT_LOG_LEVEL = 'WARNING'
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
