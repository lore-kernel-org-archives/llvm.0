Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BBC7A
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 16:10:26 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id y129so47541470ybe.7
        for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 08:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7cG3DtS4AFRpk5Ytg8SebP0tvlPwMV13yDhdJ92f6j8=;
        b=nkY8OC1guEp+iBvvAKdH8uX4DHWKDUYifZMG7fUcaVU5dGlMpe0ROTjrfcTYl5ikh9
         cF17s9gZMl/Flw+7Bw/CDtMSY4YAJ6zQ3Dg5e3qel/uDjE53fEPXceT9l0RqCIxIUs0s
         Tn34nIqD8jvG/EeL4seiSbzkA4VH1+IjamxBwWyJzxUfKFmSxbeSKVp1glLpwisZ/vOu
         EFbI+K6ea432x1R3uVsUDH/Jdva4B7BcKmQygfhCrpH68Dgbzr3iu3ZHO8GEAygm2Vil
         ZO+H9mdL79k3ldSQpcV415Cx/rZf1bQIg+vnVjaq73QoJniq8v6l33qdN1tBIwNiFS8C
         BetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7cG3DtS4AFRpk5Ytg8SebP0tvlPwMV13yDhdJ92f6j8=;
        b=Z6vhYdviaBgRrjjRS/5LWpbpLzyKpCEVTfoJzAxNGEv2t54GvkenTCFotwP5rMGjir
         U/J7UJzSweYUvYxb16diKy6lbqm+HCsdwqExf1p3zms8xXTYktGjTxXW/pydeKEjX2JD
         lMhWe0GxG+3mYbOKqwCKrBzluNM4iqa7v7b2bIlujwit/ySWzQ00hjVH2UMDHq4TEWwr
         gVYGBimxeWZBXxtGqbjakW+6bSc+xmi8N69edgZvYJAS+sRUFgq4PCbI4q0BMdTFkHgs
         RjFWFKEi0eI/wqjIsqxUahOGJOiZX5hvEmc7CZD+spdQ1z+wRBAnt2gBDU0RSO/Vcbo/
         zRIQ==
X-Gm-Message-State: AOAM532qsMKo+tmwl/3fF5gcPBOHxp7oYlT4U1IzswMXfrZp8yO3NsxE
	8ZdP+1uYYjNSLxY5rOxKBsLK4GhUlpfZJbLshBUhzQ==
X-Google-Smtp-Source: ABdhPJxmeN0Mu0nfPv7jQg7fnM5tK8qeTcOwoiKNnS1LECVetrm3mNP8Yu3R/CnlqIPtPQaboKVejM8GSgVVJp7zzC4=
X-Received: by 2002:a81:ff10:: with SMTP id k16mr314507ywn.321.1644855025825;
 Mon, 14 Feb 2022 08:10:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220211014313.1790140-1-aik@ozlabs.ru> <CAKwvOdkKsoYw9KOfwdHYg7OkTz0TQ6YgZZcqQ5PNg+_O1Q5bgg@mail.gmail.com>
In-Reply-To: <CAKwvOdkKsoYw9KOfwdHYg7OkTz0TQ6YgZZcqQ5PNg+_O1Q5bgg@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 14 Feb 2022 08:10:16 -0800
Message-ID: <CABCJKudj5VJ-f+QU0qmnODoadEzpVME2rXhtUZbzrEV8o69hqQ@mail.gmail.com>
Subject: Re: [RFC PATCH kernel] trace: Make FTRACE_MCOUNT_USE_RECORDMCOUNT configurable
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Kees Cook <keescook@chromium.org>, llvm@lists.linux.dev, 
	Alexey Kardashevskiy <aik@ozlabs.ru>, LKML <linux-kernel@vger.kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Nathan Chancellor <nathan@kernel.org>, Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 11, 2022 at 4:11 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> + Sami, Kees
>
> Do you guys remember why we don't support
> FTRACE_MCOUNT_USE_RECORDMCOUNT with LTO?

It's because recordmcount cannot distinguish between calls and other
references to mcount/fentry, which is a problem with LTO where we have
to process the entire vmlinux.o and cannot ignore individual
translation units. Instead of resorting to workarounds, Peter was kind
enough to implement a smarter mcount pass in objtool, which we now use
on x86_64 with LTO.

Alexey, which architecture are you trying to fix here?

Sami
