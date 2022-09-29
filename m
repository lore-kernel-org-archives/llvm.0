Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3CD53B5
	for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 19:38:18 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id ay9so1451111qtb.0
        for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 12:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=jPC3WVw4976dpKvKKCFdU/lc0ZuMPbNLKCqStUeM09s=;
        b=WhoA/DI2yYL72s2TCUrGxv+9azaGUkvm+rGLO7jJNeptSzsUN9MHcz6/MOE1IxO5ab
         2mN4WJ8KkCxoC0Eff8pLt+ZcTat4hM4NCAsjesORipA1Ukb4Stx4G4GHJy16kxwMZEpw
         WEp0rb6bmqt3xVjs926fkBD3YwsgMpgoLsXj7rDLH+iwuvEEC1h3dkRxLSktBrkI9WmX
         CkRjsUQZp3GAgC4Uh8vLzOvL8YsGIB6ndu1p+DtrZ21Zkh1Hbd/0hokL1dv3UjfOrT3I
         hEodzpNh4MX0af5OKIzn6jMOTULxfZ2KvqQh7yWhHlYEJn8R6dB3rO8hL0qCtBFIqtiV
         VddQ==
X-Gm-Message-State: ACrzQf2581gwdRumQ/UK+PD/htxKJmObMt/drXMVhDgLpQ39t+2gc570
	dEqaP2bcmdAR5EuXMwK3yLt0SIAFZ0uBcV8yOmk=
X-Google-Smtp-Source: AMsMyM5G7CeP5pzAjJNsf6JlxYv6iJeuEdMrT888CC84awqhVlhiietKyxD+8M2ROSANmCXZJIPVS8Qujfwyj3EdZ4k=
X-Received: by 2002:a05:622a:64e:b0:35d:5213:284f with SMTP id
 a14-20020a05622a064e00b0035d5213284fmr3863424qtb.49.1664480297559; Thu, 29
 Sep 2022 12:38:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220929161917.2348231-1-rrangel@chromium.org>
 <20220929093200.v6.6.I8092e417a8152475d13d8d638eb4c5d8ea12ac7b@changeid>
 <CAJZ5v0izHjb8vE0ALyYo9yMOExdpCzG8f7-d5SpQnftqJfTEig@mail.gmail.com> <CAHQZ30CJyhPK-OriZ5NZ=GjwNbofaCW6GZ_CvPsL0WiJGsxs-Q@mail.gmail.com>
In-Reply-To: <CAHQZ30CJyhPK-OriZ5NZ=GjwNbofaCW6GZ_CvPsL0WiJGsxs-Q@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 29 Sep 2022 21:38:06 +0200
Message-ID: <CAJZ5v0gcJRoMSODbTevRdK1zaEZHJcPxvG6XMy9-T_jvwxPFBw@mail.gmail.com>
Subject: Re: [PATCH v6 06/13] ACPI: resources: Add wake_capable parameter to acpi_dev_irq_flags
To: Raul Rangel <rrangel@chromium.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, 
	linux-input <linux-input@vger.kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Tim Van Patten <timvp@google.com>, 
	Linus Walleij <linus.walleij@linaro.org>, "jingle.wu" <jingle.wu@emc.com.tw>, 
	Dan Williams <dan.j.williams@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Len Brown <lenb@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Terry Bowman <terry.bowman@amd.com>, Tom Rix <trix@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 29, 2022 at 9:27 PM Raul Rangel <rrangel@chromium.org> wrote:
>
> On Thu, Sep 29, 2022 at 1:18 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> >
> > On Thu, Sep 29, 2022 at 6:19 PM Raul E Rangel <rrangel@chromium.org> wrote:
> > >
> > > ACPI IRQ/Interrupt resources contain a bit that describes if the
> > > interrupt should wake the system. This change exposes that bit via
> > > a new IORESOURCE_IRQ_WAKECAPABLE flag. Drivers should check this flag
> >
> > I would call this IORESOURCE_IRQ_WAKE which is (a) simpler and easier
> > to read and (b) it sort of matches the "wakeirq" naming convention.
>
> It was Dmitry who originally suggested the name. I personally like the
> CAPABLE in the name. It makes it clear that it's capable of acting as
> a wake source, not to be confused with being enabled as a wake source.

Well, so be it then.

As I said elsewhere, I can apply this patch too if that's useful at this point.

> >
> > This is not a big deal if you insist on this name and for a good
> > reason, but just something I would do differently.
> >
> > The patch LGTM otherwise.
> >
