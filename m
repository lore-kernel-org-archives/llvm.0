Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C8E1106
	for <llvm@lists.linux.dev>; Tue, 26 Dec 2023 18:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YulVpeFy"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-427b515c2bbso788621cf.0
        for <llvm@lists.linux.dev>; Tue, 26 Dec 2023 10:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703616440; x=1704221240; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FiJwBW/7K1qBcXH+9J8bQ7mf/uov1uwXgkCpJ4/LnIE=;
        b=YulVpeFy9+bFsTnFauIgSVvtgQO2egttYohB4IXNwDnqKCoZ5dIj+aMzii5kE24H9o
         S4B7PjNY29qBpAlHNC8OMpzHswCs0L5u9bOsilSI2ygVf+bCLpmaCwVEWCtibD0jqD7A
         mPANB8Matn5qELl5Bm1RJ1SMnWqNL+MHXm0pvresu9IFMpzup7J9KtdD481zRzGkEHbI
         5eFUX7auhsqdOOsLLGsORqS5W4CjdiMaxq23+m1F8iCWxwk1OuQgY6R90pCbm2FU2eiZ
         iavWkEcw+XyE/Zc4FtJFNbO2dPQuuFR8qaw8zTNEhlnfteiVUtRrXOP6JKhq6vXIL0Zc
         9upQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703616440; x=1704221240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FiJwBW/7K1qBcXH+9J8bQ7mf/uov1uwXgkCpJ4/LnIE=;
        b=hMW5a54QZwOWCvgBiO6dRwtcFd/8orZPUcmS3PgUoz6jBOIdkMcrLbjDoKGzz0k20G
         moiRFZHU1n6Ig76jXTKG2FLGrnCVUzWXsn34srpBedf1ykWORgf7pjLzIQqszmEwiL+3
         eFUZ52qKoMSnhU7euKPHrhqesguOT5O2zrXtmYX7KhmI6s/QJSRlrNjNEsS+NsyYYT1v
         UjqwMwi6X3hgRDq8vaDO0j3p1enz0jfHrO7uBKEaJLjhutPiQcEXEN5lTHdMEfcrr3R7
         2J+lOQYYGP7isoxGoxdx4NqE3CRIwaPCsM7kqvK/n1HBtFr87VHu3kWOV64kE325Amcu
         T+/A==
X-Gm-Message-State: AOJu0YxEgufdf3oQSoRJp+qtEjzNvAyllbgBV3qXS1dUjFhKyjH5b/A4
	Fhd4WmyLGr7mMhNAbztBVHIOoK9JMwnlHLbajLn+1jReyRnhvKkx4WttGUHFBg==
X-Google-Smtp-Source: AGHT+IEYBwyPvzBQv8GdFUrmTLbOocq9WgF0k2bz6g2BBEu2Eob8+NO71K+QvEgSeux3dfF6mm5LchW+yBQf+nVfP6c=
X-Received: by 2002:a05:622a:1b8d:b0:425:758d:7279 with SMTP id
 bp13-20020a05622a1b8d00b00425758d7279mr624418qtb.0.1703616440295; Tue, 26 Dec
 2023 10:47:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231226-libstringheader-v6-0-80aa08c7652c@google.com>
 <20231226-libstringheader-v6-2-80aa08c7652c@google.com> <CAHp75VfXWev7Z-tHRPAuWzaLj7ogiECW2arFc4CdcxUE87Ld0A@mail.gmail.com>
In-Reply-To: <CAHp75VfXWev7Z-tHRPAuWzaLj7ogiECW2arFc4CdcxUE87Ld0A@mail.gmail.com>
From: Tanzir Hasan <tanzirh@google.com>
Date: Tue, 26 Dec 2023 10:47:08 -0800
Message-ID: <CAE-cH4rche0dbKWXHQ89YUZzs6Q6XwRPrfdy5+uox9YnQ-5VXA@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] lib/string: shrink lib/string.i via IWYU
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Kees Cook <keescook@chromium.org>, Nick Desaulniers <nnn@google.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Greg KH <gregkh@linuxfoundation.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 26, 2023 at 10:35=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Dec 26, 2023 at 8:00=E2=80=AFPM Tanzir Hasan <tanzirh@google.com>=
 wrote:
> >
> > This diff uses an open source tool include-what-you-use (IWYU) to modif=
y
> > the include list, changing indirect includes to direct includes. IWYU i=
s
> > implemented using the IWYUScripts github repository which is a tool tha=
t
> > is currently undergoing development. These changes seek to improve buil=
d
> > times.
> >
> > This change to lib/string.c resulted in a preprocessed size of
> > lib/string.i from 26371 lines to 5321 lines (-80%) for the x86
> > defconfig.
>
> Why did you ignore my tag?

I'm sorry. I forgot you had already reviewed this one. In a future
revision I will include this:
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Best,
Tanzir
