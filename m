Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6E129CA
	for <llvm@lists.linux.dev>; Mon, 18 Oct 2021 19:41:36 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id g8so1751030ljn.4
        for <llvm@lists.linux.dev>; Mon, 18 Oct 2021 12:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ItTJzIFWSeB5rmBU+FendnKoekV76l/1a/X4v9add+Q=;
        b=H4wXr5SRERJdoNSWITjR7bS9JJ8gLITCpg+vMJXq4qXSwFNbSx+gnHK00Jms65B6jT
         6Yv6vYSSgJewe1TqJXzXQnFNcavuIwp7zfz/BmMtcec0LgF/iFtBPT749K8tZ6/mkEEz
         q4Dmw54k4oY18+0+EyRdL5k2D8dBprCxl9S4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ItTJzIFWSeB5rmBU+FendnKoekV76l/1a/X4v9add+Q=;
        b=yPxsrADNT1BDVqMdOr4YrAktfZRyDGH4yf3y6WLj201uIT+33+2xnXVntqlLMyCZsI
         ql2gvBUM2S4K9xamIGipdumHuRM43u8+a5QktEebbGJESa7/1/ThO9o3TQO73Q1cR2sp
         U9ddRhbTSxVd4CTjun3sQsxOVcPmXWUPxmDbZVqbys6NgOLAOWmtlbP8Hh10GxwgHG2g
         pYU+9FnQNYiUrQMCoyjsRZ2JPbqkFniE+2ROHy4Hz1fCauAVHC8Ee6eDL/7xo4IUZmCd
         ILXOhnRYwNx1qQdKYJ39fK1e8H03r0eCPzWKUZh63NTG8Bf4l2MxZse/UJ4rrd6OxuGk
         ElyQ==
X-Gm-Message-State: AOAM530jTP2bC4tT4QL3fuk8IPiRcfifFFJnqfO0oJIyFEpKiRLDpD1w
	o10iLHim7aCXvZu56d1H3/ai4VH+fqZD+hCz
X-Google-Smtp-Source: ABdhPJxuzw/kjomt/IMtqgD2DDHYaC3UldTmawH/0JUGNjq1iWNCCuAv0lqCIrrgEt35THB8LkpvJA==
X-Received: by 2002:a05:651c:114b:: with SMTP id h11mr1779215ljo.193.1634586093466;
        Mon, 18 Oct 2021 12:41:33 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id d20sm837750lfg.8.2021.10.18.12.41.31
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 12:41:32 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id s19so1690039ljj.11
        for <llvm@lists.linux.dev>; Mon, 18 Oct 2021 12:41:31 -0700 (PDT)
X-Received: by 2002:a2e:5cc7:: with SMTP id q190mr1848523ljb.494.1634586091557;
 Mon, 18 Oct 2021 12:41:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211018182537.2316800-1-nathan@kernel.org> <CAKwvOdn4_DrgaZoAo-v7CbYurNUpfAK5tnzT023=WCDzkmYQVg@mail.gmail.com>
In-Reply-To: <CAKwvOdn4_DrgaZoAo-v7CbYurNUpfAK5tnzT023=WCDzkmYQVg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 18 Oct 2021 09:41:15 -1000
X-Gmail-Original-Message-ID: <CAHk-=wi7hUsTTcmPfZCkUEw51Y3ayq3JJxzFsNgodsxxDyk9Ww@mail.gmail.com>
Message-ID: <CAHk-=wi7hUsTTcmPfZCkUEw51Y3ayq3JJxzFsNgodsxxDyk9Ww@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix bitwise vs. logical warning
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
	Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
	ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Tor Vic <torvic9@mailbox.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 18, 2021 at 8:34 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> LGTM, thanks for the patch! I guess this would be the first
> "interesting" case this warning has found in kernel sources?

The patch looks obviously correct (tm), but I'm not convinced that the
warning is actually all that interesting.

The thing is, using bitwise operators for booleans is _exactly_ the
same as using logical ones as long as there are no side effects. In
fact, any compiler worth its salt will already convert some cases
between the two as an optimization just as part of code generation.

Of course, that "as long as there are no side effects" is the big
thing - then the short-circuiting of the actual logical operations
clearly matters. But that wasn't actually the case in this situation
(or in the kvm situation elsewhere).

So in both of these cases, the difference between "|" and "||" ends up
purely being a hint to the compiler.

In this case, even if there are no side effects, it's clearly
pointless to do the second strlencmp() if the first one already
matched, and the "||" is unquestionably the right hint (and honestly,
most compilers probably wouldn't even be able to tell "no side
effects" because it's a fairly complex expression - but since it's
inlined and uses compiler intrinsics, the compiler _might_ actually be
able to see that the two are equivalent).

But no, I don't think that warning is very interesting. In fact, the
warning might be overall detrimental, in case the hints were
intentional (like the kvm case - although I'm not convinced the kvm
hinting was actually meaningful).

                 Linus
