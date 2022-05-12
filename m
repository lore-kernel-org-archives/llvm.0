Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5150C17FB
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 08:35:24 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id gh6so8809126ejb.0
        for <llvm@lists.linux.dev>; Thu, 12 May 2022 01:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asbradbury-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6JtWs7RSdHsbfSTu16o6pg57zg9dX7Xy00LanH4+FX4=;
        b=Ma1lHg5+GZH75MgULlpr4+OUxpjkeEIbQuI3J2nDp8o/kS4DMTBXnkty/iTzwWo9Dl
         GlZ85NV/w7ozfW4aohFlD9z6uc4mgWgXcSP1i5YeedWbYzQKXWl6DHpWVkbKG4ytwzxP
         lGp3PQ7oN8HXQExyjfv93EzwiNIzuK5Wlto/QLPe1skezqrvGEVXlRBHvwAXeWnmLEvl
         fvhPdEtPNF8zOT/PhTzOTb7lqWV/Lkt1BHNIvTJQOPrbU6OXv9vJjXH65LRIE99nt8Ed
         FAzlnA8qgE22csLMKNwdZ/WaYwGX28fly83iX9VXN3D6q0Bh+rThToR2zNd52Y01yoe5
         Kjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6JtWs7RSdHsbfSTu16o6pg57zg9dX7Xy00LanH4+FX4=;
        b=AIg4yhBaSv+Dkt4LIw3grZIOly9KQ1ydxmODJwo2XoMKN7riR8SeqDQvptazKh1bkL
         YBqgGjXyKu0SQedlMuARfStpO6tvLCvu+R9iwMgzmhbqiyExI86VEv7lARuDOuGgy9Nw
         xQs96BzGz3TkcKgA9m3mpWyF1e25SbGaHdXxwd1ivjT2cR1LptuvD8TvCxAFu7geTc8m
         sMBrkXDgzZQ0DGkSLxN04M5jLUqvwegbgxa0SIr1xrTaeKF+57iar7uy5YuT14Qs5NU3
         iYZkpSB2C1mejQ41m9wbNnqS2i5PxWINsZmThUJO2vZfZBHm/KUss0SGtpA/yFt3FhtX
         QtDw==
X-Gm-Message-State: AOAM533U0K2rhKKykjW6yLETOYHfNsh+XPc4dksIc92ovxvKBT0z4eKi
	oPXN8UNHoYZ+vY6/Jm1JC+zfPbdTmMTyh+5UwUk=
X-Google-Smtp-Source: ABdhPJx38rk2Qe4QHhSx3hg3bQRVaC58SevkU69o48CC1yIC3kcOGwHGmEF9gSf2Ed7L7w2yfjVXvg==
X-Received: by 2002:a17:907:7ea6:b0:6f4:9d64:8e20 with SMTP id qb38-20020a1709077ea600b006f49d648e20mr28432200ejc.634.1652344521882;
        Thu, 12 May 2022 01:35:21 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id s6-20020a05640217c600b0042617ba63c1sm2288372edy.75.2022.05.12.01.35.20
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 01:35:20 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id z19so5345906edx.9
        for <llvm@lists.linux.dev>; Thu, 12 May 2022 01:35:20 -0700 (PDT)
X-Received: by 2002:a05:6402:2932:b0:425:d7b3:e0d1 with SMTP id
 ee50-20020a056402293200b00425d7b3e0d1mr33664329edb.141.1652344520348; Thu, 12
 May 2022 01:35:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220510065336.hlfjrc25ajed5zj4@M910t> <CAKwvOd=OnJ=ZhsbX+epzbhg3sWg9yOaR=zQ4jF_Deo=B8Nx9Og@mail.gmail.com>
 <10BD31AB-C9F3-45FD-9A4A-EF7DC07C94D5@sifive.com> <20220512083007.gdvlaq7ar2tyarza@M910t>
In-Reply-To: <20220512083007.gdvlaq7ar2tyarza@M910t>
From: Alex Bradbury <asb@asbradbury.org>
Date: Thu, 12 May 2022 09:35:03 +0100
X-Gmail-Original-Message-ID: <CA+wH296d8p06E6LU4HUxcGZEf6ZkcUS_oEUY4k_zcC-Y6+-1+Q@mail.gmail.com>
Message-ID: <CA+wH296d8p06E6LU4HUxcGZEf6ZkcUS_oEUY4k_zcC-Y6+-1+Q@mail.gmail.com>
Subject: Re: riscv: llvm-compiler: calling convention violation: temporary
 register $t2 is used to pass the ninth function parameter
To: Changbin Du <changbin.du@huawei.com>
Cc: Craig Topper <craig.topper@sifive.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Steven Rostedt <rostedt@goodmis.org>, hw.huiwang@huawei.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, codegen-riscv@discourse.llvm.org, 
	llvmproject@discourse.llvm.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 12 May 2022 at 09:30, Changbin Du <changbin.du@huawei.com> wrote:
>
> On Wed, May 11, 2022 at 01:07:14PM -0700, Craig Topper wrote:
> > I=E2=80=99m guessing that because the function is static, the calling c=
onvention was changed to fastcall which allows us to ignore the ABI.
> >
> I think so. But the mcount function assumes the ABI is not changed.

It feels like this is a problem that would be encountered on other
architectures with clangbuiltlinux as well, due to dropping the ABI
requirements for local functions. Have you seen something similar
elsewhere Nick?

Best,

Alex
