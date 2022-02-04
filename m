Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A7C2F26
	for <llvm@lists.linux.dev>; Fri,  4 Feb 2022 01:07:52 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id e79so5505782iof.13
        for <llvm@lists.linux.dev>; Thu, 03 Feb 2022 17:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rqefIdeVL2wI+DwvB62OMGgdDa6H4u4FEw5VtwaQZaY=;
        b=Besvg7YSquJmk8Q/loW/yn4blaDryem68uUPME0EqybIjflP/f/MEmM1VJuCa0l9Qp
         o/lcjmMPouZ8HqTTh7cfDVSwZXn0hYBUBa7Nln9ThLI54zllCE9armDl3n6BQ9Q2xhmr
         DMSN2Z0mLfSqkeyIYamT7k+WhWDi4KwvSPf+CEN3LVyY3MI2/4ui1/Kku+oImpyTCen4
         ijyIQoLsYJmu1oCiOh5Zl6nhShMCeVnxFbidTsSyWVvATQeqne8eQt0UPjA/oR0Cz0xy
         NZfeEVUGoKu8lNfvPzfUKRwoBlOalQItVQsibSwj1CZiGWIyMxT8nZCER4hUGmQvHx32
         Y/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rqefIdeVL2wI+DwvB62OMGgdDa6H4u4FEw5VtwaQZaY=;
        b=V2IxxaZDEYuKSFns46ohvP6vNp9z+YGcJ5WQHX6BiziE5iqPy6UDL6YT4fvJ0pl5l2
         fCYRJbQQS9AY47LKoq4kCM1fFQTcaSRmdAKlyQhfeKXhQD/+Elp7u8YduQCadhWDLOAR
         HTuLpe19Gyy9mh6B9/rfGoP/qO4v4VTYeugmHliDpADZowGfgRd/CXpFfHuZR02ZS0sF
         quFaeVjBHZ7OS4mC3r3T0TBlHvg18Fl+6V/QmLG1qiwVh6U1Apg4R+IZOpoyPVk+z3sY
         KizcDSeobsZpF9r/p+yyC148rJAuCEuszL8rwnn3HJVVafH7f35853qQ5O7ir1DhabPm
         ldSg==
X-Gm-Message-State: AOAM531wFg7Q7/8MQidNOcHkr/Y1+ydrcaHQ3Nat9TPJwoIkB9zIgN8e
	YIYdcoahybTd+AYrVgbXgsJLZxZW7yGdLeJulNE=
X-Google-Smtp-Source: ABdhPJzEN5d0Bt98thIEc9Uezwh/6R+2lP9mNdmyVMD/wnvEdrfVANxAknyo0cLuI0CB10D33HGHz6jAlL20NuOJ5BA=
X-Received: by 2002:a05:6638:134a:: with SMTP id u10mr282776jad.264.1643936871675;
 Thu, 03 Feb 2022 17:07:51 -0800 (PST)
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
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Feb 2022 02:07:40 +0100
Message-ID: <CANiq72nYuWJDESJKOzgtarM5QeGVe3DVik3HZyOEXUdNK8QfeA@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] Compiler Attributes: Add __overloadable for Clang
To: Kees Cook <keescook@chromium.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	George Burgess IV <gbiv@google.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 3, 2022 at 10:04 PM Kees Cook <keescook@chromium.org> wrote:
>
> That might be an issue, but the *real* issue is the implicit mutation of
> the function into an inline with _additional_ arguments. i.e.
>
> char *strcpy(char * POS p, const char * POS q)
>
> is really
>
> char *strcpy(char * const p, const char * const q, size_t __size_of_p, size_t __size_of_q)

Shouldn't that be

  char *strcpy(char * const p, size_t __size_of_p, const char * const
q, size_t __size_of_q)

? i.e. the docs point at this but say:

  "...and implicitly pass the result of this call in as an invisible
argument of type `size_t` directly after the parameter annotated with
`pass_object_size`."

Cheers,
Miguel
