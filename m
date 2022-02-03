Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAE22F28
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 22:12:01 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id t14so5921519ljh.8
        for <llvm@lists.linux.dev>; Thu, 03 Feb 2022 14:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cvLgSYVGM2996ioEI15ojDQMy+E3HZDVmRKeEYykM40=;
        b=d+00TCXqREwctnhJC2Vz3mHrLurwPMNF8rFaK2ZoUN9UE7RX2igGNvTuW8fgOLewhw
         OOgkfYYCVz4oDaNHM7Ixgb6VHD9qnBfO13Wl3Wq5NapplduLQjYFtBNk1fmjfCBWq00j
         r0vW0gVU8HhLUMGSTdHdrw0WuaBYpz/ZIwSXX7XZ04wGfllcNcJXtLPQYA6/nEWvHccZ
         B0v9/KUCpixTg0BQmk66EiQpUjLMNiscv7khu0X/VkvagSLHNUW1YP6kkSsgKVJORwhW
         F97K+SZup9eAr0XfOrLzhg1tayDXjlpdwrqOic13Od4CADVoDAU/zrEGPWHc0pEmq4wR
         B6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cvLgSYVGM2996ioEI15ojDQMy+E3HZDVmRKeEYykM40=;
        b=NZU+foZcQt6VrDZD7a7QfIoL6c7jaC8S5eTVLVlWRuY49yGKMuyB9GRS7b1LjLiJug
         9CDOmN18OaPgTDWyQwsTc9w5dWh/U8IH7E0LSle2t0pz7mx3haF+UivrtKuoWAZQ3p3S
         QwN16a4hdzwT1jnvNwhP9FrdnfMPPgZeDTzBl4UbOiMUrARkq8jVo2mEFBPJtpCsv4d9
         5oJs8mb+Zbo011czBLkGMTf11CqIEL6JACUGOP+kfzMCsbCtyGN9tSoud8g+xOy2Vc6c
         VtM4Fx5q2h7I2VqRhBiesQYfl+r8A6VFSd5YGuHzVhzG/vX7TypI4G8IwL80qG+cLIiG
         Uqqg==
X-Gm-Message-State: AOAM531EIvHLQJ8JJpc+C3cAC1TpAPa/rMq9Djj51dfydaYLzkOk2mKu
	f2B8sXE2jT0lnAXaSB9ystqOVquaDU8TlBwmv7HbS5if7a427w==
X-Google-Smtp-Source: ABdhPJx4xwSIhl1CWKMd+BeSstYj6x7/c4rQegMzqm29e91gX4A7J7U22wJThBU+MEd0EovNCPT+zJO+7qLu7pGf59A=
X-Received: by 2002:a2e:7c0c:: with SMTP id x12mr34894ljc.526.1643926319521;
 Thu, 03 Feb 2022 14:11:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220203173307.1033257-1-keescook@chromium.org>
 <20220203173307.1033257-3-keescook@chromium.org> <CAKwvOdkU=5q-7Sb4BKYkRsigy_qYjo_7J+A73ZYKn+xArxUwXg@mail.gmail.com>
 <202202031301.437D8FD3@keescook>
In-Reply-To: <202202031301.437D8FD3@keescook>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 3 Feb 2022 14:11:48 -0800
Message-ID: <CAKwvOdm-_uGYrm=2LTGSR7yhGK08NniGdkhLj_sM-QD-xdKVtA@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] Compiler Attributes: Add __overloadable for Clang
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	George Burgess IV <gbiv@google.com>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 3, 2022 at 1:04 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Feb 03, 2022 at 12:26:15PM -0800, Nick Desaulniers wrote:
> > On Thu, Feb 3, 2022 at 9:33 AM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > must be marked as being overloadable (i.e. different prototypes).
> > > This allows the __pass_object_size versions to take precedence.
> >
> > Is this because of the `const` additions to the function signatures?
>
> That might be an issue, but the *real* issue is the implicit mutation of
> the function into an inline with _additional_ arguments. i.e.
>
> char *strcpy(char * POS p, const char * POS q)
>
> is really
>
> char *strcpy(char * const p, const char * const q, size_t __size_of_p, size_t __size_of_q)
>
> (i.e. what I was doing with macros, but all internally and still an
> extern inline)

What do you mean "is really"? 4/4 doesn't change the number of
parameters in strcpy explicitly in the definition AFAICT.
-- 
Thanks,
~Nick Desaulniers
