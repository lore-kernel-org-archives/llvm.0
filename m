Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C96C2C88
	for <llvm@lists.linux.dev>; Tue, 19 Oct 2021 06:27:21 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id r19so5016339lfe.10
        for <llvm@lists.linux.dev>; Mon, 18 Oct 2021 23:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+Hz18V9cmevixb6yPJp+xhm9+FmsVtQxvQp4KWS9Xn0=;
        b=MaQGIQasM+dLV7KwlcsE5Cl9HFetE/vzwFHktseUxeQcmw5PdeCbgreOiQxEbNmFt4
         dnLQIc2SvagaUe91R1lrfZl+mhDwAH/5cNO7uFEDcK1cxss/qgvbSTzqirsdRKsLf/ix
         x+1OQif8898d3tVTgUGcnvsSybigNO3qRv1Cs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Hz18V9cmevixb6yPJp+xhm9+FmsVtQxvQp4KWS9Xn0=;
        b=dReccI2uDnAFz6Jj+i9EYZC1NZSLzdYyD1G4sQrG9bHLKIvOg+umm7Vlc+RvwB0ASU
         2p35ayEtC1vWMXkXPCOJEImWw9m53oZuk8YtyySFC61Jg10Ksf/Tv4QVCaaWinUT/gsi
         na/972k2kWZO1toh5UysRXP7tWKffsAto4tphMmttystYUSkqYYounFSAs/YRABfXP40
         yFN5x7ZzyhBlmFqRXRvf9NDzAolFyKcHsDXeAkNR0ywGwpr/z9DIRYADZ+o60Xtz1qW5
         wtmMV7qDm5dtUC+sIq/Wb2ww9Z6/d1clPoqRYN01IPcO4ei62SNFoL9FIg0hzhbzuBST
         4Rgg==
X-Gm-Message-State: AOAM533Jdnm6QNKGlsrzv0NOOp57Uz+6K7zXUiJS/y4nnreXXkw0KtVE
	VwnYD+um+W+KSgDjJaQ6h3kBXlICMR/Q6g==
X-Google-Smtp-Source: ABdhPJzm18s94J045x8+ljuCgLJu4KBf7pvFrI3mKwSY63FqC9xrUbJS0ePC1muX8hVGrKpXBiu76w==
X-Received: by 2002:a05:6512:1194:: with SMTP id g20mr4299820lfr.43.1634624839507;
        Mon, 18 Oct 2021 23:27:19 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id p9sm1787304ljc.64.2021.10.18.23.27.18
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 23:27:19 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id q16so4155766ljg.3
        for <llvm@lists.linux.dev>; Mon, 18 Oct 2021 23:27:18 -0700 (PDT)
X-Received: by 2002:a2e:1510:: with SMTP id s16mr4766664ljd.56.1634624838613;
 Mon, 18 Oct 2021 23:27:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211018182537.2316800-1-nathan@kernel.org> <CAKwvOdn4_DrgaZoAo-v7CbYurNUpfAK5tnzT023=WCDzkmYQVg@mail.gmail.com>
 <CAHk-=wi7hUsTTcmPfZCkUEw51Y3ayq3JJxzFsNgodsxxDyk9Ww@mail.gmail.com>
 <CAKwvOd=wGjd_L1703Y9Kngcr9-_wTvcRLToiydXYkR=S_9xWDw@mail.gmail.com>
 <CAHk-=wjwOnrHXDSqnmhiKujk=5XieJFvfnQwc2WKOKFwzcqvaA@mail.gmail.com> <YW5Q253s0Y+zYxdi@archlinux-ax161>
In-Reply-To: <YW5Q253s0Y+zYxdi@archlinux-ax161>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 18 Oct 2021 20:27:02 -1000
X-Gmail-Original-Message-ID: <CAHk-=wi-UJAGo6uwYx8XKydSEsnQ33mW4t+kUnb+CNY+Oxobjg@mail.gmail.com>
Message-ID: <CAHk-=wi-UJAGo6uwYx8XKydSEsnQ33mW4t+kUnb+CNY+Oxobjg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix bitwise vs. logical warning
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
	Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
	ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Tor Vic <torvic9@mailbox.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 18, 2021 at 7:00 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> For what it's worth, the suggested fix is the '||' underneath the
> warning text:
>
> In file included from arch/x86/kvm/mmu/tdp_iter.c:5:
> arch/x86/kvm/mmu/spte.h:318:9: error: use of bitwise '|' with boolean operands [-Werror,-Wbitwise-instead-of-logical]
>         return __is_bad_mt_xwr(rsvd_check, spte) |
>                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>                                                  ||
> arch/x86/kvm/mmu/spte.h:318:9: note: cast one or both operands to int to silence this warning
> 1 error generated.

Hmm. That's not at all obvious.

The *much* bigger part is that

   note: cast one or both operands to int to silence this warning

which is what I'm complaining about. That note should die. It should
say "maybe you meant to use a logical or" or something like that.

> Perhaps that hint should also be added to the warning text, like:
>
> In file included from arch/x86/kvm/mmu/tdp_iter.c:5:
> arch/x86/kvm/mmu/spte.h:318:9: error: use of bitwise '|' with boolean operands; did you mean logical '||'? [-Werror,-Wbitwise-instead-of-logical]
>         return __is_bad_mt_xwr(rsvd_check, spte) |
>                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>                                                  ||
> arch/x86/kvm/mmu/spte.h:318:9: note: cast one or both operands to int to silence this warning

I don't understand why you seem to continue to ignore the "note"
message, which makes a completely crazy suggestion.

                 Linus
