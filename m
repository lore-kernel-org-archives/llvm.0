Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950267E
	for <llvm@lists.linux.dev>; Wed,  2 Aug 2023 01:07:29 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-99bf1f632b8so717561566b.1
        for <llvm@lists.linux.dev>; Tue, 01 Aug 2023 18:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1690938447; x=1691543247;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FXkdVovEwsRXfv+Dg7OQg7KZYMXc3NVjQ9UsNbCmbkM=;
        b=h2oAqqiZHA1I7+7KJ4qkiD6c+sb34x9IKFRrWiIgIKCjYGnQ9LY5YfGQeIXDkWDb7n
         gaC4QjEwJE9EC56qPqcn+iDm0F8zZ/suBTIWB7KirvXY9IApXagyXhHGhA16U9vBIiRf
         g4LVUfyHUdi2IVB2eTF2vDKxmPMNA7awbpXws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690938447; x=1691543247;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXkdVovEwsRXfv+Dg7OQg7KZYMXc3NVjQ9UsNbCmbkM=;
        b=BHAoiNPsx3HyHjlen05iGvaraCdujz4NfLPwl15/b0DpYCFf1eIi3O/8AvWGTIAjDQ
         bRSmOcf/ws/FsWXChEKPjHo6mVX5cXx/MrL6KTOwaQOhPe5OzABzR88MGiU/vt1mcByD
         6noXQZI6ZqhWPB2WOUsH/YUxN0GMrma8Y4U52hKvM6N003kTpWODqbgd7PFAUpK5hAOn
         gSgfla38BY3h3avtTeoQMlbinkqT/FmCKznfZR6MzNbPB3phQAbiRXOTnW9vAxLm/S87
         dDJknHuO/o6heoJ2J7SclhfE/a9I0ATMcgfryy0YKbyfObaJXje2DehWS4wPEzndwsK9
         nw+g==
X-Gm-Message-State: ABy/qLbngh7GX7ZIAQrLs9zQbg/bg8Q+r5o3EvDO13g9mVIlZr8cNFvI
	V6BBEqcnpPpq2vASjlO7ed9m0dq6j039V6iwxz2Xjtuu
X-Google-Smtp-Source: APBJJlF8nejDA+XDB94rAKJeeW6sCPI0JVgJAF4OLpdfHBkY/gmY80t+cdCx3PVLsJ+Bi812T+NWrA==
X-Received: by 2002:a17:906:8459:b0:99b:eeeb:84a1 with SMTP id e25-20020a170906845900b0099beeeb84a1mr3578262ejy.27.1690938447594;
        Tue, 01 Aug 2023 18:07:27 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id mf25-20020a170906cb9900b0099251a40184sm8314044ejb.99.2023.08.01.18.07.25
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Aug 2023 18:07:26 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5222c5d71b8so8864451a12.2
        for <llvm@lists.linux.dev>; Tue, 01 Aug 2023 18:07:25 -0700 (PDT)
X-Received: by 2002:aa7:df18:0:b0:522:289d:8dcd with SMTP id
 c24-20020aa7df18000000b00522289d8dcdmr3129466edy.35.1690938445668; Tue, 01
 Aug 2023 18:07:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230801-bitwise-v1-1-799bec468dc4@google.com>
In-Reply-To: <20230801-bitwise-v1-1-799bec468dc4@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 1 Aug 2023 18:07:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgkC80Ey0Wyi3zHYexUmteeDL3hvZrp=EpMrDccRGmMwA@mail.gmail.com>
Message-ID: <CAHk-=wgkC80Ey0Wyi3zHYexUmteeDL3hvZrp=EpMrDccRGmMwA@mail.gmail.com>
Subject: Re: [PATCH] word-at-a-time: use the same return type for has_zero
 regardless of endianness
To: ndesaulniers@google.com
Cc: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Aug 2023 at 15:22, <ndesaulniers@google.com> wrote:
>
> Compiling big-endian targets with Clang produces the diagnostic:
>
> fs/namei.c:2173:13: warning: use of bitwise '|' with boolean operands
> [-Wbitwise-instead-of-logical]
> } while (!(has_zero(a, &adata, &constants) | has_zero(b, &bdata, &constants)));

Gaah.

Yes, I think that 'has_zero()' should return the 'unsigned long' bits
on big-endian too, because I do think we always want the bit ops, and
turn it into a boolean only at the very end.

> It appears that when has_zero was introduced, two definitions were
> produced with different signatures (in particular different return types).

Big-endian was kind of a later addition, and while that file is called
"generic", it's really "little-endian has an easier time of this all,
but let's do the 'generic' file for the more complicated case".

Who ends up being affected by this? Powerpc does its own
word-at-a-time thing because the big-endian case is nasty and you can
do better with special instructions that they have.

Who else is even BE any more? Some old 32-bit arm setup?

I think the patch is fine, but I guess I'd like to know that people
who are affected actually don't see any code generation changes (or
possibly see improvements from not turning it into a bool until later)

            Linus
