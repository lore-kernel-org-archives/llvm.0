Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC8C2C80
	for <llvm@lists.linux.dev>; Fri,  5 Nov 2021 18:00:26 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id t127so4971592vke.13
        for <llvm@lists.linux.dev>; Fri, 05 Nov 2021 11:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=au20GLB/AwFB4ER6edB7mFBdjMKbP9KemXLMUAQRuws=;
        b=USZvWXpImUPWQVoDuz5qj1PaYT2WvHKnNkJVkvcJsnzwZSIDlcPsyA/28OGyIw8oGq
         4dkkiloGMUwUI8nIT1U4sxK8MWwT9rcTwX7w2ntjCeEjULVLZnvCdUPruUoLdMfVZ0Im
         Cqa2pRmsGeIPXBtzuWQBJLoUj1ReHiPoaz6qHaVo6DF4B0sg6c97KHlajgBkXFtyHlv5
         cv+jEHvsba0OHAk9xeJQAe7nwq808psYMePpNaIynLLfn+4lqDnARCtwlGec3biU1aSA
         VIs9EQQNa+ANN2D4gIJL2culKIB0M0YkFyRamSXY07NZvcldjijzgp5er2sda8wlOMeA
         JrAA==
X-Gm-Message-State: AOAM5314m9jt/4mcTxN+rzy7rM6C3kf8bQ7La7uEM/qrfpFVrL8jHi4i
	wYWprH64EisDyoGNa7aiaBEoWsvjxEXuwg==
X-Google-Smtp-Source: ABdhPJz9r5fgpAHNFsQjgltqKNqM+X1pdf0JHKSoSKT94E8oa1JD1FNYsQHmVHisvC3Ufu+Meny/Pw==
X-Received: by 2002:a05:6122:208c:: with SMTP id i12mr44515926vkd.5.1636135224523;
        Fri, 05 Nov 2021 11:00:24 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id i27sm1432099uab.8.2021.11.05.11.00.23
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Nov 2021 11:00:23 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id ay21so18511002uab.12
        for <llvm@lists.linux.dev>; Fri, 05 Nov 2021 11:00:23 -0700 (PDT)
X-Received: by 2002:ab0:15a1:: with SMTP id i30mr56283928uae.122.1636135223241;
 Fri, 05 Nov 2021 11:00:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211003002801.GA5435@gondor.apana.org.au> <YV0K+EbrAqDdw2vp@archlinux-ax161>
 <20211019132802.GA14233@gondor.apana.org.au> <alpine.DEB.2.22.394.2111021636040.2330984@ramsan.of.borg>
 <DM6PR04MB708155E447FD9A79AB89686DE78D9@DM6PR04MB7081.namprd04.prod.outlook.com>
 <CAMuHMdW1wLAt9Y=-GMMuk8HWE3UnRgKNMmD9fq34Rq8J7QyrzQ@mail.gmail.com>
 <20211104121612.GA8044@gondor.apana.org.au> <CAMuHMdWAAWWS+TgeN1AajHBS5w9-datMEeXqAN8RjxRd9bX63Q@mail.gmail.com>
 <20211104133044.GA8563@gondor.apana.org.au> <YYP5ypSPOcP4WGCr@shredder> <20211105072608.GA13584@gondor.apana.org.au>
In-Reply-To: <20211105072608.GA13584@gondor.apana.org.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Nov 2021 19:00:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVg5X00xhsYOnC84md-dNADGGL3mT3qqn3925AJFmqbMw@mail.gmail.com>
Message-ID: <CAMuHMdVg5X00xhsYOnC84md-dNADGGL3mT3qqn3925AJFmqbMw@mail.gmail.com>
Subject: Re: crypto: api - Fix boot-up crash when crypto manager is disabled
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Ido Schimmel <idosch@idosch.org>, Damien Le Moal <Damien.LeMoal@wdc.com>, 
	Nathan Chancellor <nathan@kernel.org>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Vladis Dronov <vdronov@redhat.com>, 
	Simo Sorce <ssorce@redhat.com>, Eric Biggers <ebiggers@kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, kernel test robot <lkp@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"

Hi Herbert,

On Fri, Nov 5, 2021 at 8:26 AM Herbert Xu <herbert@gondor.apana.org.au> wrote:
> Could you all try this patch please?
>
> ---8<---
> When the crypto manager is disabled, we need to explicitly set
> the crypto algorithms' tested status so that they can be used.
>
> Fixes: cad439fc040e ("crypto: api - Do not create test larvals if...")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reported-by: Ido Schimmel <idosch@idosch.org>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

Thanks!

Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
