Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1912F28
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 21:04:14 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id z5so3283783plg.8
        for <llvm@lists.linux.dev>; Thu, 03 Feb 2022 13:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AXCyJIfbpLGxYBIbWAc7Goy/U+/enGtkfIUDufgG5no=;
        b=RN+nNTd2KY08ojmx+rurrM8Bco9OeNs0WRScp2CK+r9LCNzp64NTOEMjXnQVm24qyo
         wO7H8nt7ZgWhWAxYuOVShnWUfDiM9/1AiVV6vNCyTVEdoHah5R8ZjkopBY+8uUL+h7Eo
         pOaE/TaH1Ss7lgkxTUQQORRBFTEXe9mi1T54M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AXCyJIfbpLGxYBIbWAc7Goy/U+/enGtkfIUDufgG5no=;
        b=j4hGG2kEyfceBC4S9EE4K0g8mSp7LA8S78UZ5rzh9/jab8uFHjH8QBCpNpWsrin+0C
         vfvPsoIMGiy9MloCfcbvfLapywS9ZMzmc6n3Xe/Bn/j1KSOJnc+ES+n47IBqd1JOQ3A8
         LusLkFcea7PFEE3+QkQe666jWZtaCaQGF14WIBIrfwihJI8zgyUZTyFeO3CQJRt/y/rK
         Q9XwRpCag30Yy6fpWEoDh6FU5CmdkTL9GaOWyU2eIt+vsxOJ2FVDZVuu64xMrU05DfGR
         T686QavJ3NdohUV1pbcqKZl7uIKD39pZovIHRNHIJOsL1cS+wRq+jU9vSpGU157VgZkc
         z0/g==
X-Gm-Message-State: AOAM532Q0jxMul+GqC8BEHyYP7PjygUTQoGhtJ4tizLfnK7VqzkYPTHF
	ymgeqT/VzoZTT5HvKcWHUzmYRQ==
X-Google-Smtp-Source: ABdhPJzHdXzL/QHbPAYTIAbR5kUmDhbNvKJm0lPvrYqdexCUwxFUHuGjIxkP9nZ73WuTSjfPXxN9BQ==
X-Received: by 2002:a17:90b:1d0a:: with SMTP id on10mr15687871pjb.167.1643922253959;
        Thu, 03 Feb 2022 13:04:13 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o9sm18049411pfw.86.2022.02.03.13.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 13:04:13 -0800 (PST)
Date: Thu, 3 Feb 2022 13:04:12 -0800
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	llvm@lists.linux.dev, George Burgess IV <gbiv@google.com>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v6 2/4] Compiler Attributes: Add __overloadable for Clang
Message-ID: <202202031301.437D8FD3@keescook>
References: <20220203173307.1033257-1-keescook@chromium.org>
 <20220203173307.1033257-3-keescook@chromium.org>
 <CAKwvOdkU=5q-7Sb4BKYkRsigy_qYjo_7J+A73ZYKn+xArxUwXg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdkU=5q-7Sb4BKYkRsigy_qYjo_7J+A73ZYKn+xArxUwXg@mail.gmail.com>

On Thu, Feb 03, 2022 at 12:26:15PM -0800, Nick Desaulniers wrote:
> On Thu, Feb 3, 2022 at 9:33 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > In order for FORTIFY_SOURCE to use __pass_object_size on an "inline
> > extern" function, as all the fortified string functions are, the functions
> 
> s/inline extern/extern inline/

I will update that. :)

> 
> Yes, they're the same thing, but it sounds backwards when I read it.
> 
> > must be marked as being overloadable (i.e. different prototypes).
> > This allows the __pass_object_size versions to take precedence.
> 
> Is this because of the `const` additions to the function signatures?

That might be an issue, but the *real* issue is the implicit mutation of
the function into an inline with _additional_ arguments. i.e.

char *strcpy(char * POS p, const char * POS q)

is really

char *strcpy(char * const p, const char * const q, size_t __size_of_p, size_t __size_of_q)

(i.e. what I was doing with macros, but all internally and still an
extern inline)

-- 
Kees Cook
