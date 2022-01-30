Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0175D2C80
	for <llvm@lists.linux.dev>; Sun, 30 Jan 2022 18:57:17 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id c24so22734308edy.4
        for <llvm@lists.linux.dev>; Sun, 30 Jan 2022 10:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+c6u7Ofg/2nJE4oe4zIKTdlG+rAyM0F3JywePufjJYM=;
        b=fEzMUc2/lvKVYSd05x4eIJdlkVaBNWpsIvFjP53pZMVz4C1ua+SdBIlF2Y71oRMHUn
         eTNaaAN7jNsnND7UOzgd8hlkdDqwQ8rI8N5+UTu8Gw52Uu9O8kcEHBhM2z4lIkLfPGEm
         9NbMRJGmO2wYFfBLSiPonjo/yrbgPPH6obYSFo6H7noMA/22I6a3BMqjOdxmazzLs7lB
         L3r34PZPKPma0fbwwn69FEQqrD0bnhIxRadjedgFW6botXQsxlTcFsL0k3LmgzR8UW0V
         K+3Wq9Sc+a2NmB4HCJvfkNYXsd6YkrNNE+cHuKsWa7fKRj1Qq4zWPsDXIvWHrBd8sxOp
         UbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+c6u7Ofg/2nJE4oe4zIKTdlG+rAyM0F3JywePufjJYM=;
        b=Z4vRlYMDo/DXmZKvQZzk5GXjLeUGmssy5CWftQjCoa9g0/gCRuK6lrctOyKCgRNkRo
         rGzuC8MtJsFlugJPWiJ2mIpKZAyZ61kNcYXH916Ob1ukRThmdxAIgbjZouMVE3jjwm+c
         YSdHSffN720THVtwHf10iASjcg5dElHYrXr/ui0hUTAeJsZbJau9uhzdmg40QgdDxHI6
         31Pfmea7hvEZaXfPn7Ta6IVZg9kHXrConIfKMYat++U/aWepJtfXqcoQ/3MIkHXZycRf
         Zi8hX8s1VtcbYv9ZpUcSmxvokHovH+6icWej32aHFAcxL6cvuFsuFharYjay1n4QywRk
         NVGw==
X-Gm-Message-State: AOAM530eEhY4/2hSUX6t5/q03bCTWIu44lFcL+bsrzgbrq67Oz4sa7ML
	oJDHVWXHnjh3GeypefHTKp8j5xy3uZI5vgSBYrw=
X-Google-Smtp-Source: ABdhPJzVRnWp5Ug3XCfyDHGbJBpmeid7psZKR+Hl6hMfm198IpT+7MMWxX5JcvBsHEAdRByxtLhrzDdOGgLcCfsP0iI=
X-Received: by 2002:aa7:c743:: with SMTP id c3mr17380336eds.270.1643569036193;
 Sun, 30 Jan 2022 10:57:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220130183653.491292-1-keescook@chromium.org>
In-Reply-To: <20220130183653.491292-1-keescook@chromium.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 30 Jan 2022 20:56:40 +0200
Message-ID: <CAHp75Vf9S8jKQGAYRrmSET7YJQNoHMzUC6VVTAOT7DbwcCcc4Q@mail.gmail.com>
Subject: Re: [PATCH] lib/test_string.c: Add test for strlen()
To: Kees Cook <keescook@chromium.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Peter Rosin <peda@axentia.se>, 
	Andy Shevchenko <andy@kernel.org>, Matteo Croce <mcroce@microsoft.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 30, 2022 at 8:36 PM Kees Cook <keescook@chromium.org> wrote:
>
> Add a simple test for strlen() functionality, including using it as a
> constant expression.

...

> +/*
> + * Unlike many other string functions, strlen() can be used in
> + * static initializers when string lengths are known at compile
> + * time. (i.e. Under these conditions, strlen() is a constant
> + * expression.) Make sure it can be used this way.
> + */
> +static const int strlen_ce = strlen("tada, a constant expression");

So, the compiler will replace this by a constant and then eliminate
the condition completely from the code. Did I understand this
correctly?

> +static __init int strlen_selftest(void)
> +{
> +       /* String length ruler:         123456789012345 */
> +       static const char normal[]   = "I am normal";
> +       static const char *ptr       = "where do I go?";
> +       static const char trailing[] = "hidden NULLs\0\0\0";
> +       static const char leading[]  = "\0\0hidden text";
> +
> +       if (strlen(normal) != 11)
> +               return 0x100001;
> +       if (strlen(ptr++) != 14)
> +               return 0x100002;
> +       if (strlen(ptr++) != 13)
> +               return 0x100003;
> +       if (strlen(trailing) != 12)
> +               return 0x100004;
> +       if (strlen(leading) != 0)
> +               return 0x100005;

> +       if (strlen_ce != 27)
> +               return 0x100006;

...so this part won't ever appear in the assembly (assuming -O2).

Same to the rest? If so, why is this not a part of the compiler tests?

> +       return 0;
> +}


-- 
With Best Regards,
Andy Shevchenko
