Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684674A84
	for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 18:51:57 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id p17so5191603plo.9
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 11:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vw3XaM6v46z2MuOTuiLDtIikE5mFUpXQTggdnZPb20Q=;
        b=YNQzE2c4U8b/woj51/ICQ9KfXeN9biR00rtSvs3CeHEc5pKderDQ+lRx0Pc4Se4eDG
         MdjX1//yOBAcpbxT94It7UqzBzhtdndBEZgvISaNEyw9iG83yAlLsuMJpWjh9ZIGm/ef
         CX5do56FUQ7IEDTgEUxBzfZpjMXbWfJKlzuNcD27yRmMdX9iE7m1OFlKyC7b8cGWb6tF
         ENwQ1kHdJyUTwjFXpQzJt5KM/MBHKbjjXVlh7Neopn2YpSGU+1zqyBmhnZeKFwwdzL6B
         dbRSftw+MU//29I2CZWQdUiZpuuql6sVSA/pGsUpnRyaIJnFBoSGfQOotN7gJo19/xuv
         Rkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vw3XaM6v46z2MuOTuiLDtIikE5mFUpXQTggdnZPb20Q=;
        b=url0oxga16wjJB7MzeULpfAWId8R2dx9gpV8LtAfLGbvm7C/n5Xa9ydVM5Uis9idwr
         j634mNKxc7MBVjsUnZA54WkDjubqPx4Po+eV7fsDyRjtNCxTchsg8SkdK16dpnt4PQBd
         VHbCVTLg6J4Ix8SHydGsC9I8XiCCjlOpJdRESP0TxVX5mlgvYF+c5ck9z4yHIU+YTNoI
         S1YBoS5F26EGPLv60RRgtkHtH+tUHq9ZFThnjTden4FonUg4Py7rHKG7F+QaEcXo8Dbw
         j/Nj9vww9XYzNDtsAKrtId+3Wfd030rLrqkaupkqP+h2qRLVsTeIrVfVYB/H50KbmYqg
         YOmA==
X-Gm-Message-State: AOAM532YGHu1MgbInQ5t2OFe0leqOHMYiuSy4EZvoaYj6d1aTI4TrbS0
	FCpDVT+jtp6H598GKzYXRJNZ2JrN4hqpLO8ssfar
X-Google-Smtp-Source: ABdhPJwqBUNPutkqf0ZNA9iXOQ6U8fxduS3yLPrsiTJ0HTunQXu2ts8GnvQ/f5rybTBoEVsneLLdoiD3ctaUsdhl4S4=
X-Received: by 2002:a17:902:ec89:b0:153:f480:5089 with SMTP id
 x9-20020a170902ec8900b00153f4805089mr3655434plg.166.1647543116685; Thu, 17
 Mar 2022 11:51:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220316213109.2352015-1-morbo@google.com> <AM9PR04MB8397B7734E38A4E60C6965DB96129@AM9PR04MB8397.eurprd04.prod.outlook.com>
In-Reply-To: <AM9PR04MB8397B7734E38A4E60C6965DB96129@AM9PR04MB8397.eurprd04.prod.outlook.com>
From: Bill Wendling <morbo@google.com>
Date: Thu, 17 Mar 2022 11:51:45 -0700
Message-ID: <CAGG=3QXGZKy2HCs=khGbmWC5MWs47S654p1b7SCD+sRqMv2DPQ@mail.gmail.com>
Subject: Re: [PATCH] enetc: use correct format characters
To: Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 17, 2022 at 10:37 AM Claudiu Manoil <claudiu.manoil@nxp.com> wrote:
>
> > -----Original Message-----
> > From: Bill Wendling <morbo@google.com>
> > Sent: Wednesday, March 16, 2022 11:31 PM
> [...]
> > Subject: [PATCH] enetc: use correct format characters
> >
> > When compiling with -Wformat, clang emits the following warning:
> >
> > drivers/net/ethernet/freescale/enetc/enetc_mdio.c:151:22: warning:
> > format specifies type 'unsigned char' but the argument has type 'int'
> > [-Wformat]
> >                         phy_id, dev_addr, regnum);
> >                                           ^~~~~~
> > ./include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
> >                 dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
> >                                                     ~~~     ^~~~~~~~~~~
> > ./include/linux/dev_printk.h:129:34: note: expanded from macro
> > 'dev_printk'
> >                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
> >                                         ~~~    ^~~~~~~~~~~
> >
> > The types of these arguments are unconditionally defined, so this patch
> > updates the format character to the correct ones for ints and unsigned ints.
> >
> > Link: ClangBuiltLinux/linux#378
> > Signed-off-by: Bill Wendling <morbo@google.com>
>
> Reviewed-by: Claudiu Manoil <claudiu.manoil@nxp.com>
> Fixes: ebfcb23d62ab ("enetc: Add ENETC PF level external MDIO support")
>
Thanks Claudiu.

Could you change the Link about to this one? It's a valid URL.

Link: https://github.com/ClangBuiltLinux/linux/issues/378

> Can be also net-next material. It's up to you. Thx.
