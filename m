Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7829A2F37
	for <llvm@lists.linux.dev>; Mon,  7 Nov 2022 18:36:31 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id z26so11459078pff.1
        for <llvm@lists.linux.dev>; Mon, 07 Nov 2022 10:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/yoRrsDL4rjZUsiXxqy6NkYQLHd5ebMM1o8RAy5KU7k=;
        b=Esfsrl296DK0gl8bWsolF/ZyGX0HPlftAEWIoja/4VX/5Q6Kcx1dlwnI5YXcw55HQP
         RXXZ9jJcIW+a7KYCQyZ9OE8qexU2K0Rz/STr7a0eVefP+Uhg6arVNVzfK17vesBxIsZf
         9xVhEy4I+4Gm4qroCe+CNKqgak+NCJAvddY8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/yoRrsDL4rjZUsiXxqy6NkYQLHd5ebMM1o8RAy5KU7k=;
        b=TF4WyGvqHSNMB2jN8z0mfuvcE0lxCfcYipPAYurzNRb/T6S+0T6qILsVQPzYeBv+3t
         F5N6bmF/PH7ZXPTcWOrb3fxqxiNmCxDXyJDLqYjFTp7O71UJofTgfgKBgqqQnlFYdff2
         MX3W6Q63BrOr+3bTMc4fmRam5itTzYWV4ggd0e6fsnnDVjrYOW0y2BOwr5UacpHTZfac
         qFTOWZ4KBng6lckOcjNCxuzvS2Gkb/zOZPMq1dWGhsMSbqXiftQOd+Twi6nEF1Repgf/
         vcJsCJFOyoam/wkUuIwwwTGla003nDTfi/fAF/o7b1pSXampoRIwYXvBFSkeg4Lbfdo3
         w1IA==
X-Gm-Message-State: ACrzQf2xOrVtPUGnooK1FZ3DwE2AUkg2amToG84MsgIs2bOliSLpQpQ+
	2MHrt3+AvKxO3t5ElS99f4uTtaqCsMZc0Q==
X-Google-Smtp-Source: AMsMyM6ivzdP4B4XCuyFrS9RCW2Uy4DPJ3qgTWLu5J8NZpomImFoBmUnAslz+BHfz8dMOzNogdhtlA==
X-Received: by 2002:a63:d149:0:b0:46f:d4b7:5120 with SMTP id c9-20020a63d149000000b0046fd4b75120mr33809142pgj.579.1667846190687;
        Mon, 07 Nov 2022 10:36:30 -0800 (PST)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com. [209.85.216.43])
        by smtp.gmail.com with ESMTPSA id e18-20020a63e012000000b00470275c8d6dsm4416466pgh.10.2022.11.07.10.36.30
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 10:36:30 -0800 (PST)
Received: by mail-pj1-f43.google.com with SMTP id u8-20020a17090a5e4800b002106dcdd4a0so15512172pji.1
        for <llvm@lists.linux.dev>; Mon, 07 Nov 2022 10:36:30 -0800 (PST)
X-Received: by 2002:aa7:8d17:0:b0:560:485a:e242 with SMTP id
 j23-20020aa78d17000000b00560485ae242mr51617419pfe.31.1667846178911; Mon, 07
 Nov 2022 10:36:18 -0800 (PST)
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
 <YzcqdTxLMF5028yz@smile.fi.intel.com> <YzcthIfnpi8E6XVk@google.com>
 <CAJZ5v0iKXWBGYPmmg9__g3oHK2GhY+xFMnSA6c5KctOv2kTfNQ@mail.gmail.com> <CAHQZ30D0NmVytkmiVYYZdGMEOChsO93hYRrG6SNbFiRO4S=YGA@mail.gmail.com>
In-Reply-To: <CAHQZ30D0NmVytkmiVYYZdGMEOChsO93hYRrG6SNbFiRO4S=YGA@mail.gmail.com>
From: Raul Rangel <rrangel@chromium.org>
Date: Mon, 7 Nov 2022 11:36:07 -0700
X-Gmail-Original-Message-ID: <CAHQZ30D-vBHQG9tDXy_upKHzfFMA9ttUT72K4hqKNS+CtEek3w@mail.gmail.com>
Message-ID: <CAHQZ30D-vBHQG9tDXy_upKHzfFMA9ttUT72K4hqKNS+CtEek3w@mail.gmail.com>
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
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Alexis Savery <asavery@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 17, 2022 at 8:53 AM Raul Rangel <rrangel@chromium.org> wrote:
>
> On Sat, Oct 15, 2022 at 10:56 AM Rafael J. Wysocki <rafael@kernel.org> wrote:
> >
> > On Fri, Sep 30, 2022 at 7:55 PM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > On Fri, Sep 30, 2022 at 08:42:13PM +0300, Andy Shevchenko wrote:
> > > > On Fri, Sep 30, 2022 at 07:13:37PM +0200, Rafael J. Wysocki wrote:
> > > > > On Fri, Sep 30, 2022 at 1:22 AM Dmitry Torokhov
> > > > > <dmitry.torokhov@gmail.com> wrote:
> > > >
> > > > ...
> > > >
> > > > > I think that patches [5-8/13] from this series are significant
> > > > > framework changes, so it would make sense to route them via the ACPI
> > > > > tree.
> > > > >
> > > > > If this is fine with everybody, I will queue them up for merging into
> > > > > 6.1 (probably in the second half of the upcoming merge window).
> > > >
> > > > I believe it's fine from GPIO ACPI perspective (there shouldn't be conflict,
> > > > but if you wish you always may take this PR [1] to your tree (it's already in
> > > > GPIO tree pending v6.1), it may be considered as immutable tag.
> > > >
> > > > [1]: https://lore.kernel.org/linux-gpio/Yym%2Fj+Y9MBOIhWtK@black.fi.intel.com/
> > >
> > > Yeah, having an immutable branch hanging off 6.0-rcN would be awesome -
> > > I could pull it and this would avoid any potential conflicts later.
> >
> > This material is in the mainline now, but the branch is still there in
> > case you need it:
> >
> >  git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
> >  acpi-wakeup
> >
> > It won't be necessary any more after 6.1-rc1 is out, though, I suppose.
>

>
> Awesome, thanks for merging in the ACPI patches!

Dmitry,
 What are the next steps to getting the I2C patches landed? Should I
push out a new series that's rebased on 6.1-rc1?
