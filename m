Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C54D2C9C
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 20:26:28 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id z19so8329142lfq.13
        for <llvm@lists.linux.dev>; Thu, 03 Feb 2022 12:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3oi0WT6RtKYSCLVVcErN1iJ2hhuFG+VqgwHQjpgyVFs=;
        b=Mm52phJLNfjcK4ovXq4DsaG3QHiwJomSpW1FBRJS7+EIygSIgR+8+Qt2oh1fIrTcgo
         O9iHBnuNuft30SObwRl7eNJqy6H2fnWlwqO3XdreGjOYOA+YgbOEVnI8OCh2ZN4BlFo4
         mk2AlVTaTVCeIG8ityYF9mthVuflkz6V+ZKCwGFo95FG1yo+Y7pOueVTW+OmEtiQrmth
         zHOob3/aUidTR+XrYAtwwEURcBuTFGTEX3F9sTN3rL+g+cT0rWp1aBLBh8eUfxvReqz6
         Kq23PWEjmuaRyQuz7VLcQCjvtegaTyjP+Irm6fF8CvBl/2S6I5nGVikD0lHaICoiXdKK
         DUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3oi0WT6RtKYSCLVVcErN1iJ2hhuFG+VqgwHQjpgyVFs=;
        b=Dpx1GsRtRxrBQKr4Bi6cbWcqb+zr6bnIgC4UYATtlK9pmWTnPXOcTEyPGgc0vnC17t
         cInncGDyLq4pXAdTs+7SzWB11sopuQT6NfqZMQiI2myc/EDjpV/tY0I80bpaa58ZKxcX
         Yii6+bD7+SYvkqjkQWLlS78mom45uDLHumgPLQXtCjrBXbqMLlOJSmr9h7xXGPfqT/6q
         ypoUeAd6WoysuYIO0xk9a5ehHVuXqcOP/5I0P/vb326VuxDgRohD6SDhJ5YYB+uZrrpQ
         EK/OK4JQgXTNDDYQHXtvt6EitadyaAO0umetb2W+YuMj8uB8u0wJGp2YMhbLUK4Ky4Je
         Yeyg==
X-Gm-Message-State: AOAM5311sioy3iEwk4YVGomDR1Ey3cI5E3sd9eUMvvbaoR31uXzX9aXM
	VguYH1e9zTEEDzoHed6SYSowpGmsxGP2kk3bb4bp4g==
X-Google-Smtp-Source: ABdhPJwGX975SvZnco4SUKPWlUpkyOX2+VfEHMxaO8GXGqai82myWhS4bR9uSWdSt+Ib4rMIxpNgB7rcdFzNsoAXY3g=
X-Received: by 2002:a19:6449:: with SMTP id b9mr28110189lfj.82.1643919986917;
 Thu, 03 Feb 2022 12:26:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220203173307.1033257-1-keescook@chromium.org> <20220203173307.1033257-3-keescook@chromium.org>
In-Reply-To: <20220203173307.1033257-3-keescook@chromium.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 3 Feb 2022 12:26:15 -0800
Message-ID: <CAKwvOdkU=5q-7Sb4BKYkRsigy_qYjo_7J+A73ZYKn+xArxUwXg@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] Compiler Attributes: Add __overloadable for Clang
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	George Burgess IV <gbiv@google.com>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 3, 2022 at 9:33 AM Kees Cook <keescook@chromium.org> wrote:
>
> In order for FORTIFY_SOURCE to use __pass_object_size on an "inline
> extern" function, as all the fortified string functions are, the functions

s/inline extern/extern inline/

Yes, they're the same thing, but it sounds backwards when I read it.

> must be marked as being overloadable (i.e. different prototypes).
> This allows the __pass_object_size versions to take precedence.

Is this because of the `const` additions to the function signatures?

-- 
Thanks,
~Nick Desaulniers
