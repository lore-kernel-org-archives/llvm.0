Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B33E4409
	for <llvm@lists.linux.dev>; Fri, 23 Sep 2022 18:06:19 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso524522otb.6
        for <llvm@lists.linux.dev>; Fri, 23 Sep 2022 11:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=7MxhNKa1pvBKJp28Xv5e7IbSBJSuN9UMxkwoiOtIFKY=;
        b=Uus7wQdUDWk44FDSQwJEpQB43nLtULU3gyubvF9ig6sLMhsYrBW/fT2eLkiDXP/j6F
         P8xdVmW3N/dGsk8WF9zq/xPDaInuSjL/UbWGHKH4lK2Gs07qj03YePC6fPmCyOZPJojh
         hz5XN5aYK3eXpYOOVGRIC5XgtO0t1EVMFkDuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=7MxhNKa1pvBKJp28Xv5e7IbSBJSuN9UMxkwoiOtIFKY=;
        b=dFThp9DV1HWfzommv5+Mz5+MqbVPAjJxrVsz43IPs2S4k1/PFty3Rprh4iw/1dyk/o
         m4ORLKCpbyXsH/hJfZC8dk5SFlI+2DBVtHq9q6uZma89S71OaFkpDAv93tu1M77n/D06
         ozaXxLmHHvDjId6ef2Vjl6REcp1MvyH/vKEQCxMTGEPl39XViuvYdFPWI9Ppk2XUSFr4
         870NlAmw9mei4mSw+slsjAUvTvmugv3EthPUiFKCEh5vyiPA8zKb99SdpEuOndIffwgO
         kF9XQvTfX8oYxCSaWYTSN/J8TMZmxVbTlI49TxGXjBIvWNL1AzobPz/gE3V5JUbs1n9Q
         8L2w==
X-Gm-Message-State: ACrzQf3kTuDyN6fBSNBNYo9m67LXsujOpuukOffMaBYhXoIX1S+J9qnM
	Do6xv0rxl+a9qRsgBwYjXl6E0RGG1HDTbg==
X-Google-Smtp-Source: AMsMyM5T1mR7rEPxddbeRGBp17Uz2V3mIqKkDVgWBsOI1GXyzFxlRcBJOubYjSSHyttEeEpM/VQxCw==
X-Received: by 2002:a9d:6c58:0:b0:65b:e62a:cdcf with SMTP id g24-20020a9d6c58000000b0065be62acdcfmr3820700otq.331.1663956377653;
        Fri, 23 Sep 2022 11:06:17 -0700 (PDT)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com. [209.85.160.45])
        by smtp.gmail.com with ESMTPSA id t6-20020a05683014c600b00655bc7c4522sm4462848otq.81.2022.09.23.11.06.15
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 11:06:16 -0700 (PDT)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1278a61bd57so1320060fac.7
        for <llvm@lists.linux.dev>; Fri, 23 Sep 2022 11:06:15 -0700 (PDT)
X-Received: by 2002:a05:6870:c0c9:b0:127:c4df:5b50 with SMTP id
 e9-20020a056870c0c900b00127c4df5b50mr5725740oad.126.1663956375518; Fri, 23
 Sep 2022 11:06:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220923170218.1188423-1-ndesaulniers@google.com>
 <CAHk-=wiAwEA5KekL4+t+v6qAdKLSOQvBkGbumvk+Rxhaay8aFg@mail.gmail.com> <CAKwvOd=r+9X6JkikpuTvjdTn7DXusevoJBFjXtGQ1SZYCZ6f6g@mail.gmail.com>
In-Reply-To: <CAKwvOd=r+9X6JkikpuTvjdTn7DXusevoJBFjXtGQ1SZYCZ6f6g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 23 Sep 2022 11:05:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=whknQuJCqbzjtBrkjGOPrZPX6fjv8HSms2p0kw-NTdMZA@mail.gmail.com>
Message-ID: <CAHk-=whknQuJCqbzjtBrkjGOPrZPX6fjv8HSms2p0kw-NTdMZA@mail.gmail.com>
Subject: Re: [PATCH] x86, mem: move memmove to out of line assembler
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Kees Cook <keescook@chromium.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 23, 2022 at 10:55 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> We could remove __HAVE_ARCH_MEMMOVE from
> arch/x86/include/asm/string_32.h for ARCH=i386 then rip this
> arch-specific definition of memmove out.
>
> Might performance regressions be a concern with that approach?

memmove() isn't particularly common, but it does happen for some paths
that can be hot - the usual case of moving parts of an array around. I
see filesystems and networking paths doing that.

The generic memmove() is a horrendous byte-at-a-time thing and only
good for bring-up of new architectures. That's not an option.

But I'm looking at that x86-64 memcpy_orig, and I think it looks
fairly good as a template for doing the same on x86-32. And we could
get rid of the duplication on the x86-64 side.

That said, your patch looks fine too, as a "minimal changes" thing.

                Linus
