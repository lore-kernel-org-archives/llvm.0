Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D0C3FF0
	for <llvm@lists.linux.dev>; Thu,  9 Sep 2021 17:22:39 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id l10so5165218lfg.4
        for <llvm@lists.linux.dev>; Thu, 09 Sep 2021 10:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pf0sRl8GXCP8dz4WMUu5tGxz1KupPTUSRLTXOLgH9SU=;
        b=daKTLDBvTN5qMOW0vOaEkHQg4/ZsrtihPsz6YVNP0kYXHwUiYsbXYMn5llV712jFEs
         ZOfDTsSc3X+W8b0ARaG41CZ7yM1F4kQJvfjfPIynsgelm+Qi2jJbS+UKD93oh9dHk54v
         /Ce0lj2gwvzaRE2LZQM69aFFd/Y9x7Rfpgy5s3lL+R6HZ0LH71fmVYi7K5RNPEP1Cmgk
         Gb1avWRyW13ODPiwB4R586e12yqY1QSBx7BLX8EC03SQeKvOLtV4+yE3anQK+R5cVENa
         m0OxekpciEuc3h395jhA1GSXpVRhKd+XqjHVggplMObVpgKpn/cvVA45k81c9iHt62sr
         T+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pf0sRl8GXCP8dz4WMUu5tGxz1KupPTUSRLTXOLgH9SU=;
        b=INuCQ9+Y+ZCyzfM8MFRq0EkJrtImeRr74zO4Yu7mPG6F18tdyp01PZcv93vB1XMYdw
         EdvXZvsOMkMLO58VzTI7n+kzTPDmELXevM7AYdxyqG5cK2mQnk8oxc3QOQhqn6cLFsGU
         w6G1CUG5qdGPur5AA8cASSiqzTJvOTRMFyjHCvAk7aU+V6anF0cssNBlWwt1LTcKEDvr
         lxvlkNsKFHVrHvrZFwMuZnP+BUoUXLFxsrvbNd3rb4lsMFFRDQnGTURzo8JcMXzuOzDV
         RjS6oQTHHSY3hthXNM5Q4BEMcI+IgRJKjqeXmLQEROYROsKs9xMf/VPza0jFpCCb39XH
         D0DQ==
X-Gm-Message-State: AOAM533Lusb2dZqWw5S/qaVHFlpJohW4UHnjC/LXM1027MT7pbQRHpp0
	POOWZUkrSCsAVtBb0E47XuH/i4IZ1sU3gAT48cJ69Q==
X-Google-Smtp-Source: ABdhPJxPnUFGnHCFACHUOS5JkTg4Je24SkkSbC9505ix4KQDPJriLY181s+I1NSidhRL8eaex1JEKrBepc6IZqYy9P8=
X-Received: by 2002:a05:6512:139c:: with SMTP id p28mr649503lfa.523.1631208157162;
 Thu, 09 Sep 2021 10:22:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210908032847.18683-1-kortanzh@gmail.com>
In-Reply-To: <20210908032847.18683-1-kortanzh@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 9 Sep 2021 10:22:26 -0700
Message-ID: <CAKwvOdnReHxf7ysorwTZtN65Hbw4dTk-z8fAQUaKCvEQ_a97eg@mail.gmail.com>
Subject: Re: [PATCH v2] gen_compile_commands: fix missing 'sys' package
To: Kortan <kortanzh@gmail.com>
Cc: nathan@kernel.org, masahiroy@kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, clang-built-linux@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 7, 2021 at 8:30 PM Kortan <kortanzh@gmail.com> wrote:
>
> We need to import the 'sys' package since the script has called
> sys.exit() method.
>
> Signed-off-by: Kortan <kortanzh@gmail.com>

I'm quite sure I've run this script before; how have we not noticed
such an issue before?

> ---
> Changes v1 -> v2:
> * Fix commit title.
> * Improve commit message.
>
>  scripts/clang-tools/gen_compile_commands.py | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> index 0033eedce003..1d1bde1fd45e 100755
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
> 2.33.0
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210908032847.18683-1-kortanzh%40gmail.com.



-- 
Thanks,
~Nick Desaulniers
