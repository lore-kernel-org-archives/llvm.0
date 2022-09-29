Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8942833FF
	for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 21:20:36 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id c198so2519021pfc.13
        for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 14:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hVuUBdHRNun2PF1xzmThnbMizdtrsxsLtgkxiMk9ltY=;
        b=W+2EuiiJpqD/S2h8tV/F6pXSQKY+JUj+Vneixxc62ca+jIwCSRL0WQWdUXYadGg80b
         Y1OwBqrTPzS1SR00oFZx0dsVjbzSdVSMoDQCcx7C5dbUvFQxq/SMsLCcM79OLEM4Y7uD
         JZwZF1e6iquZYjlkdPOzpWGIvlJgtu+wY6SsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVuUBdHRNun2PF1xzmThnbMizdtrsxsLtgkxiMk9ltY=;
        b=zcWbM3XCjiLNSTe+NUOmKejil95u6W2ujoTrfDoWpP7dB9BuDNVedqTcGT65UfCWi+
         M+94tA9kKKMMMzQcewtfmMn1QhhU+MYhZHlXVpbP8rRPD1R7GsKtaZrqriSIvDD3fSr8
         gAhXWzlv6MJcxpQ0FD5W7mTUOuFQvLSCVpyPMBdMJImxvnXbeVhYMN8DxWv1UwdCqEr9
         lNuXZGUg16tm6KbqGsiCahvsPgEoENJSQ88iW/YAq5UW918IigAEx8e0ZvdEoNZSGYkq
         RXBQ/ttAkdrV7aH2vjyW8Q7kY2PRYHVvJE4cSRtCnQp3ULHx0PlPhTW1FTajrWdOzwVa
         dC+Q==
X-Gm-Message-State: ACrzQf2L7PAALq5oa+AjbGDXEMv3jhaJhWSbZmzbqi5ioF8NqOLdg31n
	2hY1pS892GUAOO5lP+p+LXClvwPXA+m0tA==
X-Google-Smtp-Source: AMsMyM7bRl+yAziz6QsNjIKFwBLQ/smJLj173sl7AlZkLV37faGX7TMzyEU8aoKwovkdcZUywnAZog==
X-Received: by 2002:a05:6a00:80b:b0:545:c0d2:9729 with SMTP id m11-20020a056a00080b00b00545c0d29729mr5283744pfk.66.1664486435789;
        Thu, 29 Sep 2022 14:20:35 -0700 (PDT)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com. [209.85.210.170])
        by smtp.gmail.com with ESMTPSA id b7-20020aa79507000000b0053e85a4a2c9sm148310pfp.5.2022.09.29.14.20.35
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 14:20:35 -0700 (PDT)
Received: by mail-pf1-f170.google.com with SMTP id y136so2539102pfb.3
        for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 14:20:35 -0700 (PDT)
X-Received: by 2002:a63:ff1b:0:b0:43c:e4ee:e5e0 with SMTP id
 k27-20020a63ff1b000000b0043ce4eee5e0mr4439543pgi.540.1664486423681; Thu, 29
 Sep 2022 14:20:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220929161917.2348231-1-rrangel@chromium.org>
 <20220929093200.v6.6.I8092e417a8152475d13d8d638eb4c5d8ea12ac7b@changeid>
 <CAJZ5v0izHjb8vE0ALyYo9yMOExdpCzG8f7-d5SpQnftqJfTEig@mail.gmail.com>
 <CAHQZ30CJyhPK-OriZ5NZ=GjwNbofaCW6GZ_CvPsL0WiJGsxs-Q@mail.gmail.com> <CAJZ5v0gcJRoMSODbTevRdK1zaEZHJcPxvG6XMy9-T_jvwxPFBw@mail.gmail.com>
In-Reply-To: <CAJZ5v0gcJRoMSODbTevRdK1zaEZHJcPxvG6XMy9-T_jvwxPFBw@mail.gmail.com>
From: Raul Rangel <rrangel@chromium.org>
Date: Thu, 29 Sep 2022 15:20:12 -0600
X-Gmail-Original-Message-ID: <CAHQZ30CQd-0YnQgYG_OJVWn9_aUjvDAuT_DRGsxQF-q+bjr5BA@mail.gmail.com>
Message-ID: <CAHQZ30CQd-0YnQgYG_OJVWn9_aUjvDAuT_DRGsxQF-q+bjr5BA@mail.gmail.com>
Subject: Re: [PATCH v6 06/13] ACPI: resources: Add wake_capable parameter to acpi_dev_irq_flags
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: ACPI Devel Maling List <linux-acpi@vger.kernel.org>, linux-input <linux-input@vger.kernel.org>, 
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

On Thu, Sep 29, 2022 at 1:38 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Thu, Sep 29, 2022 at 9:27 PM Raul Rangel <rrangel@chromium.org> wrote:
> >
> > On Thu, Sep 29, 2022 at 1:18 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > >
> > > On Thu, Sep 29, 2022 at 6:19 PM Raul E Rangel <rrangel@chromium.org> wrote:
> > > >
> > > > ACPI IRQ/Interrupt resources contain a bit that describes if the
> > > > interrupt should wake the system. This change exposes that bit via
> > > > a new IORESOURCE_IRQ_WAKECAPABLE flag. Drivers should check this flag
> > >
> > > I would call this IORESOURCE_IRQ_WAKE which is (a) simpler and easier
> > > to read and (b) it sort of matches the "wakeirq" naming convention.
> >
> > It was Dmitry who originally suggested the name. I personally like the
> > CAPABLE in the name. It makes it clear that it's capable of acting as
> > a wake source, not to be confused with being enabled as a wake source.
>
> Well, so be it then.
>
> As I said elsewhere, I can apply this patch too if that's useful at this point.
>

We just need to make sure the ACPI patches 5-8 land before the i2c
patches 9-13. The i2c patches 1-4 can land before or after the ACPI
changes. I'm not sure how things get coordinated across subsystems.

> > >
> > > This is not a big deal if you insist on this name and for a good
> > > reason, but just something I would do differently.
> > >
> > > The patch LGTM otherwise.
> > >
