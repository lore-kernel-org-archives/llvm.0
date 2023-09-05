Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF7ED535
	for <llvm@lists.linux.dev>; Tue,  5 Sep 2023 15:56:59 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6bd3317144fso2188636a34.1
        for <llvm@lists.linux.dev>; Tue, 05 Sep 2023 08:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693929418; x=1694534218; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThqjLVnbKtocXxKP/wk16gVb0uDcHwyfytUbqO9ZePQ=;
        b=ZRG9insf0XRkCYh97zil/RKB/IVZdrQCIvzSLnEaq1LSImzEFPogzO64LfK+T7stP9
         RbbXPJXSZMKHumJt++9sxu0ovw+/GQeL9RscZ4rwUjv6Wq/h2gayjhDFRejlfNOVvAxn
         agxv5v2KPouE81QEWCsHPgxrtU0kbhePClLED6RIcLsLz73qe/xwp7FTqD3NeedJxk5R
         jYF0DxP8sX11qOfNepL1TxyS/BxGYV2Tw24yRk5V3drwizfaMaS11OtAXnbOEizWMzf3
         mTiudOlsUj3FMZOIaZeOVJD8wgy67HrJ/5qC/V9wjjNQNeNAQGyEWj9zPN9/ZvsakduN
         0Mgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693929418; x=1694534218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThqjLVnbKtocXxKP/wk16gVb0uDcHwyfytUbqO9ZePQ=;
        b=RHD+8FG4FV16xF3igzAdGrGGJPm8X4NHnwJYTNwB3lkgXx+9TnSZ3Z4QZItokCzIj/
         /m45aWJw3Umi/QVR+XqH7v1qvHaUkA0akQ8x+o4lmndVaAu0DCSJGEkw7Ua/zYkxrbI5
         zKc51HtIt4+oJF5J4/8CIlAPP8tRi9n/vzoieBoR8pYA/iya2MLayLVNniwETibDuSFE
         qfdOSAGc9W8DA/Rj9ByJB8SNNYJkY9k+xjZUqOlTSka9IMXIBfcY9UJvu1pPd5C19dBM
         +PeF+Vnmcnkn1fO/Es9PnhbfYptcRHXqpX5MqDHH77KLmuy+zhia/5uHVNoWfNSvubBL
         ZqtA==
X-Gm-Message-State: AOJu0YzB60Eud12h1vssT7mKbmNpv+J9MqXpmaPXo6wwcdVRdJRI8t3G
	NgcS8flzMGs0o4g1Rcji3vmGUjMdWBFq6eGfJgVaeA==
X-Google-Smtp-Source: AGHT+IEykypgti740Y9Zguj1KwhddZ/MtrTqVC7bHeDUfNC7kmbpd/QpzCpX/NjATKNPnssd70RGnfMB2COzAW39eKc=
X-Received: by 2002:a9d:66c7:0:b0:6bc:bc3e:f40b with SMTP id
 t7-20020a9d66c7000000b006bcbc3ef40bmr14551486otm.19.1693929418610; Tue, 05
 Sep 2023 08:56:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKXUXMzR4830pmUfWnwVjGk94inpQ0iz_uXiOnrE2kyV7SUPpg@mail.gmail.com>
 <2023090548-flattery-wrath-8ace@gregkh>
In-Reply-To: <2023090548-flattery-wrath-8ace@gregkh>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 5 Sep 2023 08:56:47 -0700
Message-ID: <CAKwvOdnUdfG9=P0gaUxou-xYB24sOzF+HhPrm75EWLETOViuNw@mail.gmail.com>
Subject: Re: Include bac7a1fff792 ("lib/ubsan: remove returns-nonnull-attribute
 checks") into linux-4.14.y
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Sasha Levin <sashal@kernel.org>, 
	kasan-dev <kasan-dev@googlegroups.com>, llvm@lists.linux.dev, 
	linux- stable <stable@vger.kernel.org>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, eb-gft-team@globallogic.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 5, 2023 at 3:21=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Sep 05, 2023 at 12:12:11PM +0200, Lukas Bulwahn wrote:
> > Greg, once checked and confirmed by Andrey or Nick, could you please in=
clude
> > commit bac7a1fff792 ("lib/ubsan: remove returns-nonnull-attribute check=
s") into
> > the linux-4.14.y branch?

Seems fine to me (OK2BACKPORT); I didn't see any follow up fixes to
bac7a1fff792.

>
> Now queued up, thanks.
>
> greg k-h



--=20
Thanks,
~Nick Desaulniers
