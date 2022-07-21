Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2BA4680
	for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 16:22:00 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-31e45527da5so22753647b3.5
        for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 09:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4tuVfX9bKKufRa9+rIEczxOme0B9PbnJssWHNEU67L8=;
        b=nddXXZUblxcqQl35LaB7jXwXaCOr2Zu6UwDWbmQ9vfgZ7LuJUQpffh9J7VyrVuLUtQ
         F6TytvJvX1pj8wbdnTuGK16jhRNUlcLCl1qKW0zgFX1alQFOp0LCADyrIvbbuTdsHxTn
         7GdsyINDdG1y8qaimVj9TUF3eBfR1mgEjOrrIFRwQw4ls6wT8B/nU0FxZixA856NhWAA
         MHddAd+BZclZQff1/C56g2gZ+Gi+1ttfGT66RCNrZ9s9kj2TAFlUbrqPX9prsMzjJeJ7
         NEdf0PlkvxbrAP+VdKWzcJO+7EzRmDQIBicrpsy1Dw+8BBrwYRxtdEGyd7hVYrUzAG0z
         yyrA==
X-Gm-Message-State: AJIora8PlbENEtzKVlESoxRaTiOTmPZ3Ug2GJoIlGcXFkekXhFlHzAyw
	s6Zs1Q5/CZH5Qh87toHqCaVuc1uJgMjL7/3Ap2A=
X-Google-Smtp-Source: AGRyM1s0j5C7KrwKVl0xitO8o0mGA4aHRoHTICik/N5JCVKPzDCOlvNHTuvVd9Dlk8MJG/2azgZTjqSgngDu5QqLX3o=
X-Received: by 2002:a81:8349:0:b0:31e:732a:258a with SMTP id
 t70-20020a818349000000b0031e732a258amr7468400ywf.518.1658420519100; Thu, 21
 Jul 2022 09:21:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220721161526.930416-1-trix@redhat.com>
In-Reply-To: <20220721161526.930416-1-trix@redhat.com>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Fri, 22 Jul 2022 01:21:48 +0900
Message-ID: <CAMZ6Rq+di4CYnZ6eDgBS68qGuPLvGHfxP0JYWJFkgH4c-riSmw@mail.gmail.com>
Subject: Re: [PATCH] can: pch_can: move setting of errc to before use
To: Tom Rix <trix@redhat.com>
Cc: wg@grandegger.com, mkl@pengutronix.de, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, nathan@kernel.org, 
	ndesaulniers@google.com, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri. 22 juil. 2022 =C3=A0 01:18, Tom Rix <trix@redhat.com> wrote:
> clang build fails with
> drivers/net/can/pch_can.c:501:17: error: variable 'errc' is uninitialized=
 when used here [-Werror,-Wuninitialized]
>                 cf->data[6] =3D errc & PCH_TEC;
>
> The commit in the fixes moved the use without moving the setting. So move
> the setting of errc to before the use.
>
> Fixes: 3a5c7e4611dd ("can: pch_can: do not report txerr and rxerr during =
bus-off")
> Signed-off-by: Tom Rix <trix@redhat.com>

Sorry, you are a couple minutes late. You are actually the third to
submit the same patch:
https://lore.kernel.org/linux-can/20220721155228.3399103-1-mkl@pengutronix.=
de/
https://lore.kernel.org/linux-can/20220721160032.9348-1-mailhol.vincent@wan=
adoo.fr/

But thanks for this!


Yours sincerely,
Vincent Mailhol
