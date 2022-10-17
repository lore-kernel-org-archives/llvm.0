Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADBD2568
	for <llvm@lists.linux.dev>; Mon, 17 Oct 2022 14:53:53 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id g28so11300215pfk.8
        for <llvm@lists.linux.dev>; Mon, 17 Oct 2022 07:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jveD8Fr76glp1DYxH8RBX8//jU+rwCCAw4goKV+WEYA=;
        b=UJIoHx/gk4qgZaNeRdbeKXp0RWtmWsifoNxgVvBVZKdSitOOLM8ii0b5MMfBMYzdY2
         OrEpEtj7HKemElQL9lCXKCVZrZD1jDtjbVsrQnOtOUOPW2Ny+9R8g/0uALspK835lnWR
         fWGTsdbdlq1DJI8l3MHLMVIF7b/28sgZW9zZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jveD8Fr76glp1DYxH8RBX8//jU+rwCCAw4goKV+WEYA=;
        b=6HcfXOfn0UJxCBCk6aGNL7YINPcm9QvrVzrMv1J/VzPvS3hkHBKvt2rrZQoghmkv5u
         j9CyPj2+DUd6ORzIIb1ZZd7YZRIcxfY9f7b4ZBM11vA7y9nw6olUWSBPbL/6nHheXlqr
         xKfgruZZvDY+LALFeN4vqDDjxKRgt13umGxzTvTJobM1NgNFGskAOwaZSwDxuMbgUAAO
         XPupeWDgYEM0MAVJA9CIOiPbVZNhR90Z3mBiMb56zOJveFg7bapprlADr8gSqR/Ae5to
         vpjPsu3qJn720O0QNnCRba8Cp3A77N40kszo6kk8FUpu3OnOT0hB+U4w53w56xEjE/P6
         AwMQ==
X-Gm-Message-State: ACrzQf11mTeXn24CMPUH/77ONPITTSE9ZxHHpL2HcLCCMb+9UJBfTpXp
	8nmW4VfyyoOo9Yu93NL9BRU3K8XMUlVX4Q==
X-Google-Smtp-Source: AMsMyM4dz30XH8LminEjMj9w8/LltTqZ8BaEb9UUZGZWVNysfpRtMOpq/8zShNs4Mi4f4fmbyhcakw==
X-Received: by 2002:a05:6a00:1707:b0:566:15a1:8b07 with SMTP id h7-20020a056a00170700b0056615a18b07mr13040497pfc.34.1666018432946;
        Mon, 17 Oct 2022 07:53:52 -0700 (PDT)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com. [209.85.210.181])
        by smtp.gmail.com with ESMTPSA id a11-20020aa7970b000000b00562664d5027sm7164241pfg.61.2022.10.17.07.53.52
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 07:53:52 -0700 (PDT)
Received: by mail-pf1-f181.google.com with SMTP id 67so11292444pfz.12
        for <llvm@lists.linux.dev>; Mon, 17 Oct 2022 07:53:52 -0700 (PDT)
X-Received: by 2002:a63:1326:0:b0:439:40b5:77cc with SMTP id
 i38-20020a631326000000b0043940b577ccmr11277758pgl.473.1666018421795; Mon, 17
 Oct 2022 07:53:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220929161917.2348231-1-rrangel@chromium.org>
 <20220929093200.v6.6.I8092e417a8152475d13d8d638eb4c5d8ea12ac7b@changeid>
 <CAJZ5v0izHjb8vE0ALyYo9yMOExdpCzG8f7-d5SpQnftqJfTEig@mail.gmail.com>
 <CAHQZ30CJyhPK-OriZ5NZ=GjwNbofaCW6GZ_CvPsL0WiJGsxs-Q@mail.gmail.com>
 <CAJZ5v0gcJRoMSODbTevRdK1zaEZHJcPxvG6XMy9-T_jvwxPFBw@mail.gmail.com>
 <CAHQZ30CQd-0YnQgYG_OJVWn9_aUjvDAuT_DRGsxQF-q+bjr5BA@mail.gmail.com>
 <YzYowYJpRTImmg4m@google.com> <CAJZ5v0i+QYcMuqsK9y6qy9qzJdUp503Sidr1e4V_ROyumLKCsw@mail.gmail.com>
 <YzcqdTxLMF5028yz@smile.fi.intel.com> <YzcthIfnpi8E6XVk@google.com> <CAJZ5v0iKXWBGYPmmg9__g3oHK2GhY+xFMnSA6c5KctOv2kTfNQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0iKXWBGYPmmg9__g3oHK2GhY+xFMnSA6c5KctOv2kTfNQ@mail.gmail.com>
From: Raul Rangel <rrangel@chromium.org>
Date: Mon, 17 Oct 2022 08:53:29 -0600
X-Gmail-Original-Message-ID: <CAHQZ30D0NmVytkmiVYYZdGMEOChsO93hYRrG6SNbFiRO4S=YGA@mail.gmail.com>
Message-ID: <CAHQZ30D0NmVytkmiVYYZdGMEOChsO93hYRrG6SNbFiRO4S=YGA@mail.gmail.com>
Subject: Re: [PATCH v6 06/13] ACPI: resources: Add wake_capable parameter to acpi_dev_irq_flags
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, linux-input <linux-input@vger.kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Tim Van Patten <timvp@google.com>, 
	Linus Walleij <linus.walleij@linaro.org>, "jingle.wu" <jingle.wu@emc.com.tw>, 
	Dan Williams <dan.j.williams@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Len Brown <lenb@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Terry Bowman <terry.bowman@amd.com>, Tom Rix <trix@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 15, 2022 at 10:56 AM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Fri, Sep 30, 2022 at 7:55 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Fri, Sep 30, 2022 at 08:42:13PM +0300, Andy Shevchenko wrote:
> > > On Fri, Sep 30, 2022 at 07:13:37PM +0200, Rafael J. Wysocki wrote:
> > > > On Fri, Sep 30, 2022 at 1:22 AM Dmitry Torokhov
> > > > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > ...
> > >
> > > > I think that patches [5-8/13] from this series are significant
> > > > framework changes, so it would make sense to route them via the ACPI
> > > > tree.
> > > >
> > > > If this is fine with everybody, I will queue them up for merging into
> > > > 6.1 (probably in the second half of the upcoming merge window).
> > >
> > > I believe it's fine from GPIO ACPI perspective (there shouldn't be conflict,
> > > but if you wish you always may take this PR [1] to your tree (it's already in
> > > GPIO tree pending v6.1), it may be considered as immutable tag.
> > >
> > > [1]: https://lore.kernel.org/linux-gpio/Yym%2Fj+Y9MBOIhWtK@black.fi.intel.com/
> >
> > Yeah, having an immutable branch hanging off 6.0-rcN would be awesome -
> > I could pull it and this would avoid any potential conflicts later.
>
> This material is in the mainline now, but the branch is still there in
> case you need it:
>
>  git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
>  acpi-wakeup
>
> It won't be necessary any more after 6.1-rc1 is out, though, I suppose.

Awesome, thanks for merging in the ACPI patches!
