Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC4329CA
	for <llvm@lists.linux.dev>; Wed, 29 Sep 2021 23:28:59 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id g41so17435427lfv.1
        for <llvm@lists.linux.dev>; Wed, 29 Sep 2021 16:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wu7M9DqJBeP0nkRCi2RNd2jpALrZarew4V0B2j/Hy5M=;
        b=bhHpZyvcnjj667ISJMLub0celi+kt+zVqfIzcCPfZukUu5XefTPXRfdWC8knj6kXPc
         jgMg2WV5OIO31aRDSyVX4N6krkVbNHuqKLNa4W/V101X8LhdVflUZwttL6myDyzVAHJM
         XI3kq/uqBUUwVKgeHOH6PKPwESm35JtMrexfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wu7M9DqJBeP0nkRCi2RNd2jpALrZarew4V0B2j/Hy5M=;
        b=ODEvGyH8MFJ3+JCPxR27MzTZptQINk65/AMXsYJ4FukP02tcWRUU/Z0LrSfNyF5zJM
         dNSftwHIb64cu/+LDJkDFtYGVB++ZhvcjN8QL/x4ybBXD6rxMChrJzsJtaCTsaV/2Swz
         Zc5+AhGD/51lByeeqYdBiEo4Uobghb9M3jsnpbc0x2CuA72ca6nwLr5Ey3wLsFpLrjE8
         k6zznIuay2dOiXyxsPc3WziqAY6acRo6SGE4Y8RhYPE8PJnnNjjIrRk4Yvd1m4xEXBQf
         If0NQjgvXDRFrf3Lj4T2/JfJYmfLCVOaoHBr2cMzdCX2cwPsEbCLPRC9NOiKcR9i1nwx
         VGcQ==
X-Gm-Message-State: AOAM531zpqDQ8ohj+fNd8YeW2+a/PllbCKpmhTsAhVFNLkM+U6R7LIfl
	ikfNZChUOU3VXzxg5K/NAmfVzQ49StoaUdXT2C8=
X-Google-Smtp-Source: ABdhPJw//vEHdXIaFjduQl8eFM+nhMKu0jCGugC9neRFIvrE9MsfZMiVzNm6oKJ3xcMSdxGZKljNTQ==
X-Received: by 2002:ac2:5195:: with SMTP id u21mr2279102lfi.91.1632958137389;
        Wed, 29 Sep 2021 16:28:57 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id i3sm139933lja.47.2021.09.29.16.28.56
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 16:28:56 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id i4so17600083lfv.4
        for <llvm@lists.linux.dev>; Wed, 29 Sep 2021 16:28:56 -0700 (PDT)
X-Received: by 2002:a2e:4e01:: with SMTP id c1mr2701754ljb.31.1632958136150;
 Wed, 29 Sep 2021 16:28:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210929225850.3889950-1-ndesaulniers@google.com>
In-Reply-To: <20210929225850.3889950-1-ndesaulniers@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 29 Sep 2021 16:28:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh0BNEDz+uOdJWG8iW=n0PeOEjZpHyuSN2g0pKSCj+6iQ@mail.gmail.com>
Message-ID: <CAHk-=wh0BNEDz+uOdJWG8iW=n0PeOEjZpHyuSN2g0pKSCj+6iQ@mail.gmail.com>
Subject: Re: [PATCH] modpost: add allow list for llvm IPSCCP
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Michal Marek <michal.lkml@markovi.net>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 29, 2021 at 3:59 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> +static const struct secref_exception secref_allowlist[] = {
> +       { .fromsym = "__first_node", .tosym = "numa_nodes_parsed" },
> +       { .fromsym = "__next_node", .tosym = "numa_nodes_parsed" },
> +       { .fromsym = "__nodes_weight", .tosym = "numa_nodes_parsed" },
> +       { .fromsym = "early_get_smp_config", .tosym = "x86_init" },
> +       { .fromsym = "test_bit", .tosym = "numa_nodes_parsed" },
> +};

This list is basically made-up and random.

Why did those functions not get inlined? Wouldn't it be better to make
them always-inline?

Or, like in at least the early_get_smp_config() case, just make it be
marked __init, so that if it doesn't get inlined it gets the right
section?

It seems silly to add random source mappings to a checking program.

It was bad for the gcc constprop hack, but at least there it was a
clear case of "this inlining failed". This ad-hoc list has cases of
things that are clearly wrong in general ("test_bit()" must not use
initdata), and that "ok, the function just doesn't have the right
section marker.

(All of get_smp_config/early_get_smp_config/find_smp_config should be
__init, since they most definitely cannot work after __init time - but
why a compiler doesn't just inline them when they are one single
indirect call, I don't really get)

         Linus
