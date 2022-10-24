Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAD7440E
	for <llvm@lists.linux.dev>; Mon, 24 Oct 2022 18:38:05 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id q9so7242559ejd.0
        for <llvm@lists.linux.dev>; Mon, 24 Oct 2022 11:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=doqa4EeZOoEkCz3v/Ifi0EexCSSeWFL40vnfB1aKvKE=;
        b=AsZMAmxS03NKVEIg+HuhIyqgg6rlZtH3e/5Ee4sg8xX72fBlj+AQoF5z7j2UAbTtq8
         yQ7feVRHBrlTtXAQ74dDtI5Ke56iuYfd4RA5JFM4oYTSUmEqqE6XLfsdM44+nVqAffZq
         MfVKZw0Dm4aOUDQFIpiV0VncbU3fbgQMIT/j2FYqEP0rYpTF3zfS1rTAhEG/7/Jok5au
         d2GFvsowV+1pP6YT0QH3MWsGxRs0ya+FNGU2cZnF0N73QVw7tI/5wND8F2kVWeDBiE+E
         F5dp6hdXr/8Q1Ya3TgLI4ptsr2eEKqWLwvqye2GfT7C7G4dbPHT7dcE2GHB+IxdH84sz
         QZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=doqa4EeZOoEkCz3v/Ifi0EexCSSeWFL40vnfB1aKvKE=;
        b=koHc45YNciZ/qsf5NDl/7kyD2rQYo31NfPyt7i4QXo7SFDTTi1ISas8uF4w+K1lshw
         BjaZvJHCxcQ0+sR86rIx4Tj6kf738800J5hTlFeQFl2TwAtLvzJvSd2xWp90MAyC2sPj
         ufXF23R47QM98zlnZhvQrZzNa/a0xqnTAQLvVevEQlMbiDB3daRZBZ/QJWQ9oQdaaXOP
         AP6g5MPKM6E+YF4z6RVxNab5WlasAZW7IjeMv75J/mniZvnFgXlznnVa5coQLagv/OWG
         1Prwgvxp6SPBJ6X7yc8dQCjBJy+zLyxDxZHvjcaGdyQzS8Th3YB/leiQZfaSz0XPMWiA
         i1MQ==
X-Gm-Message-State: ACrzQf11YeU/oECSzEHBnllPc2F2OByV3xKA0He9jc+Z/sjPb5Sa+msV
	gv35hNbcli0cn2Yt5yC03ssSxzTnbFyeRYExapT80A==
X-Google-Smtp-Source: AMsMyM5Cb44xF9/qC90Ybayrk8RK0+khUadnsPNGIz8OQPxvw8SCc8EsBU5ZxxSVih8sSnXTzO7fFrehicEmYwMd+kw=
X-Received: by 2002:a17:907:843:b0:73a:5b0e:8352 with SMTP id
 ww3-20020a170907084300b0073a5b0e8352mr29213052ejb.438.1666636683926; Mon, 24
 Oct 2022 11:38:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y1LBGZPMfCZ8A1bl@FVFF77S0Q05N> <CABCJKuf=OB_3ZR_rwaG3H5kHKmTTDk+sihjJXYmyWgZjUX2yTQ@mail.gmail.com>
 <CAFP8O3JuC9HL1-G23vGJO=jjN7Tsgz7c8TB1_F6UQ-MqCyGNLQ@mail.gmail.com> <Y1Z0gvscALn2br2q@FVFF77S0Q05N>
In-Reply-To: <Y1Z0gvscALn2br2q@FVFF77S0Q05N>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 24 Oct 2022 11:37:27 -0700
Message-ID: <CABCJKucCa8VRgwiYBCm+tiAeX9Hneg3iH6bbvtt1Sk_ALXRprQ@mail.gmail.com>
Subject: Re: kCFI && patchable-function-entry=M,N
To: Mark Rutland <mark.rutland@arm.com>
Cc: Fangrui Song <maskray@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Joao Moreira <joao@overdrivepizza.com>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 24, 2022 at 4:18 AM Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Fri, Oct 21, 2022 at 09:14:41PM -0700, Fangrui Song wrote:
> > On Fri, Oct 21, 2022 at 10:39 AM Sami Tolvanen <samitolvanen@google.com> wrote:
> > >
> > > On Fri, Oct 21, 2022 at 8:56 AM Mark Rutland <mark.rutland@arm.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > For arm64, I'd like to use -fatchable-function-entry=M,N (where N > 0), for our
> > > > ftrace implementation, which instruments *some* but not all functions.
> > > > Unfortuntately, this doesn't play nicely with -fsanitize=kcfi, as instrumented
> > > > and non-instrumented functions don't agree on where the type hash should live
> > > > relative to the function entry point, making them incompatible with one another.
> > >
> > > Yes, the current implementation assumes that if prefix nops are used,
> > > all functions have the same number of them.
> > >
> > > > Is there any mechanism today that we could use to solve this, or could we
> > > > extend clang to have some options to control this behaviour?
> > >
> > > I don't think there's a mechanism to work around the issue right now,
> > > but we could just change where the hash is emitted on arm64.
> > >
> > > > It would also be helpful to have a symbol before both the hash and pre-function
> > > > NOPs so that we can filter those out of probes patching (I see that x86 does
> > > > this with the __cfi_function symbol).
> > >
> > > Adding a symbol before the hash isn't a problem, but if we move the
> > > hash and want the symbol to be placed before the prefix nops as well,
> > > we might need a flag to control this. Fangrui, what do you think?
> > >
> > > Sami
> >
> > Since the kcfi code expects the hash to appear in a specific location
> > so that an instrumented indirect jump can reliably obtain the hash.
> > For a translation unit `-fpatchable-function-entry=N,M` may be
> > specified or not, and we want both to work. Therefore, I agree that a
> > consistent hash location will help. This argument favors placing M
> > nops before the hash. The downside is a restriction on how the M nops
> > can be used. Previously if M>0, the runtime code needs to check
> > whether a BTI exists to locate the N-M after-function-entry NOPs. If
> > the hash appears after the M nops, the runtime code needs to
> > additionally knows whether the hash exists. My question is how to
> > reliably detect this.
>
> That's a fair point.
>
> For detecting BTI we can scan the binary for BTI/NOP at M instructions into the
> patch-site, but a similar approach won't be reliable for the type hash since
> the type hash itself could have the same bit pattern as an instruction.

We could always change the compiler to ensure the hash doesn't match
specific instructions. For example, if the hash can never be a NOP,
you could just skip any non-NOP instructions after the initial prefix
NOPs, right?

> > If there is motivation using M>0, I'd like to know the concrete code
> > sequence for `-fpatchable-function-entry=N,M` and how the runtime code
> > detects the NOPs with optional hash and optional BTI.
>
> For the BTI case alone, I have code at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?h=arm64/ftrace/per-callsite-ops&id=272a580fd5b7acc31747505d71530cee7cc2837d
>
> ... the gist being that it checks the instruction M insns after the start of
> the patch site.
>
> For the type hash, I think there are a few options, e.g.
>
> * Restricting the type hash to a set of values that can be identified (e.g.
>   encoding those as a permanently-undefined UDF with a 16-bit immediate).

Which would be quite similar, except instead of restricting hash
values to a specific range, we'd just have a list of unallowed hash
values.

Sami
