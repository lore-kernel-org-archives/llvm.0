Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0DA6AD0
	for <llvm@lists.linux.dev>; Tue, 16 Aug 2022 20:50:42 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id tl27so21135633ejc.1
        for <llvm@lists.linux.dev>; Tue, 16 Aug 2022 13:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=RO5o1zeDBrbGGgJvigCNf9N1FTIpLD7LsdR8FYAUFCA=;
        b=mbX6DctOgYFtFo87NIsVH6sCTW5XCGD7g/WUQ50Jx9DEGnIygGgzlyAhWZDWVsI6M8
         smAAFtMa3exakMnltpq8T7dxRMzBG2pwz9164F9LalzD4IbgieCepjXRrXPhfWWoae4z
         o+G4TZzVamOcu9v9ovcbWbd/AV7nQbuKQHsRBqo/GFzMEdPG2pgfbrRdaf22EdH2ZQ/9
         1vrjYAjg+18lO17dFBMcUc20I9huOs5sk0CdN4zjoLOQ0l57P5ylIX3coxFr6Ijfkr/m
         UQfCsdy1IGBqrnqLjeG/ybPyxTV0Wt4XpJV5NijX32crbQJN54oIv1EmOvsngHXl9U+T
         pDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=RO5o1zeDBrbGGgJvigCNf9N1FTIpLD7LsdR8FYAUFCA=;
        b=cSCzkp3vTJdQ/k6L28SmTbOtCq9D/4KlnytKq+OaKYqbWnNBU/3zIzRdKK4DhR+ewH
         AV5A7ifFwOnJFautnNyw+tzz0BU37CniRckV67KUKxR2q8c5cR9D7U8bEroyLLPmuWb8
         OBbIvghuG0ZaqkHjtOvYoTduhy9wEGOB978/cOUpVongFCQ3E/wtgIlEA19ETQB9MgVt
         igbAM0DEw3LSR9aGCJdUB6wg3b9WaJl0IcU+6apYTQbxQEj59BMPwMGzxFeHnYcT+WaG
         8FTypiQZtMXvhA8YyfeoDZgOyvCwROQbdvQ5CsOnYGSx0Uw0sAeei7KD3W/3+PuMV0v2
         GX+w==
X-Gm-Message-State: ACgBeo0lwqmiPkrcRlwi42OjVQzCf87N8bHmdap0B3xyevuUYr7gyQdP
	FoQir+7ArweiAjsRhXpm7BNwyeaPggVyK9nutgMjrw==
X-Google-Smtp-Source: AA6agR5xeSAOjjzSY3u1UNusAfZ85+ssmMsNDrZIKPKiBG6aJaZr+H1+HfTdBJX+iAMFcv/AhR8JfftZ91By+JjVnV8=
X-Received: by 2002:a17:907:9628:b0:731:1e3:b168 with SMTP id
 gb40-20020a170907962800b0073101e3b168mr15076465ejc.526.1660683040495; Tue, 16
 Aug 2022 13:50:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220816130823.97903-2-linus.walleij@linaro.org> <202208170316.UKonQfhi-lkp@intel.com>
In-Reply-To: <202208170316.UKonQfhi-lkp@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 16 Aug 2022 22:50:29 +0200
Message-ID: <CACRpkdbHvQm-_X4cpRRfeRSNUpTQbeyyQpBPD6TfeomY0nzSsg@mail.gmail.com>
Subject: Re: [PATCH 2/2 v3] regmap: mmio: Support accelerared noinc operations
To: kernel test robot <lkp@intel.com>
Cc: Mark Brown <broonie@kernel.org>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	linux-kernel@vger.kernel.org, linux-hexagon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 16, 2022 at 9:45 PM kernel test robot <lkp@intel.com> wrote:

> >> drivers/base/regmap/regmap-mmio.c:212:3: error: call to undeclared function 'writesb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>                    writesb(ctx->regs + reg, (const u8 *)val, val_count);
>                    ^
>    drivers/base/regmap/regmap-mmio.c:212:3: note: did you mean 'writeb'?
>    arch/hexagon/include/asm/io.h:122:20: note: 'writeb' declared here
>    static inline void writeb(u8 data, volatile void __iomem *addr)
>                       ^
> >> drivers/base/regmap/regmap-mmio.c:366:3: error: call to undeclared function 'readsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>                    readsb(ctx->regs + reg, (u8 *)val, val_count);
>                    ^
>    drivers/base/regmap/regmap-mmio.c:366:3: note: did you mean 'readb'?
>    arch/hexagon/include/asm/io.h:83:18: note: 'readb' declared here
>    static inline u8 readb(const volatile void __iomem *addr)
>                     ^
>    2 errors generated.

Yeah Hexagon breaks the <asm/io.h> contract and does not provide
readsb/writesb.

OK I just fix Hexagon as part of patch 2, I hope.

Yours,
Linus Walleij
