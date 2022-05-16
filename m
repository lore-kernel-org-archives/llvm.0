Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0202110E0
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 15:45:20 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-2ef5380669cso157872867b3.9
        for <llvm@lists.linux.dev>; Mon, 16 May 2022 08:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fnKHIkN0TU++izapmIFi8Ty+LNPCPzgGOdIpl087eMA=;
        b=iTcoOlahc6mNkkH9KN1UbL8/FqrKWmwWC3yXua2GycFg92x6rtngNdWTVZd0vbWmvo
         IS31fC3vbQgVufrjL9knZDTJqUptFr2aaqDFIneUmpWLvFJa+Wu+UxrjhyP7Rgj7bYw6
         zGYLwfOJbeMXxZZo4hcNGWPwaUtzNrt3Su/koMOjF0/lJfcxtgYk49vf4uomzBQ/y5my
         1yNpaUl8mO2poMKwfULV989QV1N1BB5iZDEFJA+CXZ4MAPWqN9ygMf71IFgVuS2VYweH
         bgcJ++RWpGXf45WXPIGOJztqFDbRlw5pqIk7yfMCXeIH15TdPWKecQfiVFMacIT+G95P
         EkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fnKHIkN0TU++izapmIFi8Ty+LNPCPzgGOdIpl087eMA=;
        b=SQ0ZZ7bmROjbyYET34pe9kLvQ+k/NJHQeEDG6IYztCUZuTr4GczW49HjA4tAbulZ38
         mKSTpLGxRt1ShQZiYzRtYBqtOKgvAhJ98jISGqrFU8UW9YEWjUPUeyM6LKBVwoElMxyk
         E96Ly8e5cReLgu8sTbxahnNkg0OFtIhJF3ARf0SkOvCK0wmS9jd5CCCIKvLN8u4LgXmt
         BuZjZXTMFT3jZwUpVu6ponVVDXgvVq00KhEKPqZ7FiQiYzYIk16kepaGDtLKa20IWK7t
         q26H1foZ6fk9mkPU7DPVWVZqik93RaL01wncj0ws0gK15Q9ENVmhujBc5U+2A2SJhDZV
         Wipw==
X-Gm-Message-State: AOAM531v9wzclwow2NjuTtIEJwQ1gfFQRS6FkpmoECZ0hLWNHev9z1Sq
	z4awRhwcIT82P41lN/Sroik1ZnDmIUh4e4mle96t6Q==
X-Google-Smtp-Source: ABdhPJwi/PDSBCPu8w13weeGP3GKG4Kc/dHnqpDwTulTE1xr8903vsYGeGb18xGWe7Di7/TDqqAZCDtrmcivBggYEX4=
X-Received: by 2002:a81:4ecf:0:b0:2fe:d9f2:15b3 with SMTP id
 c198-20020a814ecf000000b002fed9f215b3mr10749397ywb.305.1652715919792; Mon, 16
 May 2022 08:45:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-9-samitolvanen@google.com> <202205141449.87738FDF@keescook>
In-Reply-To: <202205141449.87738FDF@keescook>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 16 May 2022 08:44:44 -0700
Message-ID: <CABCJKuc82+92BEjPU+5_7Y45cBAZ_J0Nyjvn_FtFroqsJjs_Gg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 08/21] psci: Fix the function type for psci_initcall_t
To: Kees Cook <keescook@chromium.org>
Cc: linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Joao Moreira <joao@overdrivepizza.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, May 14, 2022 at 2:50 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Fri, May 13, 2022 at 01:21:46PM -0700, Sami Tolvanen wrote:
> > Functions called through a psci_initcall_t pointer all have
> > non-const arguments. Fix the type definition to avoid tripping
> > indirect call checks with CFI_CLANG.
> >
> > Reported-by: Mark Rutland <mark.rutland@arm.com>
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
>
> This could land separately from this series, too, yes?

Correct.

Sami
