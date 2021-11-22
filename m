Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3287E2C86
	for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 07:50:39 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id ay21so34666555uab.12
        for <llvm@lists.linux.dev>; Sun, 21 Nov 2021 23:50:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kT5Hh6yPK9g0/wKHmuficJ8QC8SNf9TRKWAOYqxbSfY=;
        b=X52DdLP+iquS55FHacbg51207cni7ck3U1XSw8pqrOr3b9AAPvRx5y+bWDcYn7Uc2g
         NX90kPfRZkByaCTPpkYdZ0run2lkIvIaRsw7ceG0f2KgjwWyHFIWJVKiDnl513O78Slm
         119G0foiaWqk/77A5DkraBw5/MznVMmU4MlT02rp9LLaIQBkmPU2/SYOjKiuE5+9PAiP
         bTZduJmu1hC8qfFrhHZgcGnh5QK9Wb+RlmT/o4fH6VL/lPhEXKL2RBQBjZbMTs0nmm3B
         WBlFzWhv5jPfaCNQqtxlI95o/PkLvrDtCZ3DlhUrwG1I8XUKAdRbqlsoXzQgzwFkKNh3
         Jikg==
X-Gm-Message-State: AOAM5303OL7LGSs5oGDN4dhndoLZgz5rxkz3v7Qn9SwxgFQaqHAdMBKf
	IzQGKoiBIgWxx5DDrOWLY6sgPG04qxjIBA==
X-Google-Smtp-Source: ABdhPJxYjkC1lPCuOHxpY0h430bZRdvYypipP1JDyxkQjGmqX0CIAVx6k/gfqXIlILUvgo3G39Q7Vw==
X-Received: by 2002:a05:6102:3911:: with SMTP id e17mr117036972vsu.40.1637567437919;
        Sun, 21 Nov 2021 23:50:37 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id y24sm4346710uaq.17.2021.11.21.23.50.37
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Nov 2021 23:50:37 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id i6so34696610uae.6
        for <llvm@lists.linux.dev>; Sun, 21 Nov 2021 23:50:37 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr127486612vsj.50.1637567437054;
 Sun, 21 Nov 2021 23:50:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211121180155.9062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211121180155.9062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Nov 2021 08:50:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUTLYn=14RzJORp1mn-TSwC1rk1BO_9L6TG4g9JhH27JA@mail.gmail.com>
Message-ID: <CAMuHMdUTLYn=14RzJORp1mn-TSwC1rk1BO_9L6TG4g9JhH27JA@mail.gmail.com>
Subject: Re: [PATCH] memory: renesas-rpc-if: Silence clang warning
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Sun, Nov 21, 2021 at 7:05 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> This patch silences the following clang warning:
>
> | drivers/memory/renesas-rpc-if.c:253:14: warning: cast to smaller integer
> | type 'enum rpcif_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
> |           rpc->type = (enum rpcif_type)of_device_get_match_data(dev);
> |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Fixes: b04cc0d912eb8 ("memory: renesas-rpc-if: Add support for RZ/G2L")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/memory/renesas-rpc-if.c
> +++ b/drivers/memory/renesas-rpc-if.c
> @@ -250,7 +250,7 @@ int rpcif_sw_init(struct rpcif *rpc, struct device *dev)
>                 return PTR_ERR(rpc->dirmap);
>         rpc->size = resource_size(res);
>
> -       rpc->type = (enum rpcif_type)of_device_get_match_data(dev);
> +       rpc->type = (enum rpcif_type)(uintptr_t)of_device_get_match_data(dev);

While correct, the cast to "enum rpcif_type" is not stricly needed anymore.

>         rpc->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
>
>         return PTR_ERR_OR_ZERO(rpc->rstc);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
