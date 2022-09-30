Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891245A7C
	for <llvm@lists.linux.dev>; Fri, 30 Sep 2022 17:13:49 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id h28so3223975qka.0
        for <llvm@lists.linux.dev>; Fri, 30 Sep 2022 10:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=/wx9U+dObGcu3vd67LH5xUyn1SE13wYoTWeTVT1V/Xk=;
        b=PQWPLnzGf5ePRq3EmA5VWPTxyzAWLJ8M85srjEMV4lsovMAGSokifxY119rXDaVej/
         u4fuLUrHp98JYgUbK846OzBgTn4IGTtM7loG/98sji7ErATyYtUP4ZvEYx2JpE1N8PCh
         s/U31MrZGEA+0B9XvqO5TvWUKFTGB/HylxcaKQP5MWQh4sOCMkMKTUgwi9RH2Zc2b7pX
         iRcDojLjz+qaCcVEujasOOlOCYo1aJNwSrmD/gkBhrf4eQolYK/FCQLxWqDIQJD+9VlN
         DXpwbPNvCa2z90dgS3RXTfif7cCh2DuIF6DYNcfyAZC23Es/p1IWkJspfeBJazdI26oz
         gw+Q==
X-Gm-Message-State: ACrzQf3XGD0HVZPKj3t0W1kIxlcSHWIHa37Wydtz9nvMZaswwzoTwGAC
	WfJ8eIJIgFsUyIpqet85LDbkzfIFf26a8X7mS2s=
X-Google-Smtp-Source: AMsMyM6JZ4b6gxDDEv2hOrUMsgceqPELInWBc5V8VaaTUwAfQPUvRJjifLHwS5Zy8GMSTiimX+3A1JeQCZkKLJlJsrQ=
X-Received: by 2002:a05:620a:4008:b0:6ce:8725:cb7 with SMTP id
 h8-20020a05620a400800b006ce87250cb7mr7047317qko.480.1664558028487; Fri, 30
 Sep 2022 10:13:48 -0700 (PDT)
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
 <CAHQZ30CQd-0YnQgYG_OJVWn9_aUjvDAuT_DRGsxQF-q+bjr5BA@mail.gmail.com> <YzYowYJpRTImmg4m@google.com>
In-Reply-To: <YzYowYJpRTImmg4m@google.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 30 Sep 2022 19:13:37 +0200
Message-ID: <CAJZ5v0i+QYcMuqsK9y6qy9qzJdUp503Sidr1e4V_ROyumLKCsw@mail.gmail.com>
Subject: Re: [PATCH v6 06/13] ACPI: resources: Add wake_capable parameter to acpi_dev_irq_flags
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Raul Rangel <rrangel@chromium.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, 
	linux-input <linux-input@vger.kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Tim Van Patten <timvp@google.com>, 
	Linus Walleij <linus.walleij@linaro.org>, "jingle.wu" <jingle.wu@emc.com.tw>, 
	Dan Williams <dan.j.williams@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Len Brown <lenb@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Terry Bowman <terry.bowman@amd.com>, Tom Rix <trix@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 30, 2022 at 1:22 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Thu, Sep 29, 2022 at 03:20:12PM -0600, Raul Rangel wrote:
> > On Thu, Sep 29, 2022 at 1:38 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > >
> > > On Thu, Sep 29, 2022 at 9:27 PM Raul Rangel <rrangel@chromium.org> wrote:
> > > >
> > > > On Thu, Sep 29, 2022 at 1:18 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > > > >
> > > > > On Thu, Sep 29, 2022 at 6:19 PM Raul E Rangel <rrangel@chromium.org> wrote:
> > > > > >
> > > > > > ACPI IRQ/Interrupt resources contain a bit that describes if the
> > > > > > interrupt should wake the system. This change exposes that bit via
> > > > > > a new IORESOURCE_IRQ_WAKECAPABLE flag. Drivers should check this flag
> > > > >
> > > > > I would call this IORESOURCE_IRQ_WAKE which is (a) simpler and easier
> > > > > to read and (b) it sort of matches the "wakeirq" naming convention.
> > > >
> > > > It was Dmitry who originally suggested the name. I personally like the
> > > > CAPABLE in the name. It makes it clear that it's capable of acting as
> > > > a wake source, not to be confused with being enabled as a wake source.
> > >
> > > Well, so be it then.
> > >
> > > As I said elsewhere, I can apply this patch too if that's useful at this point.
> > >
> >
> > We just need to make sure the ACPI patches 5-8 land before the i2c
> > patches 9-13. The i2c patches 1-4 can land before or after the ACPI
> > changes. I'm not sure how things get coordinated across subsystems.
>
> I am fine with all input stuff going through ACPI tree to ease landing.
> Or I can pick up everything if Rafael and Jiri/Benjamin agree.

I think that patches [5-8/13] from this series are significant
framework changes, so it would make sense to route them via the ACPI
tree.

If this is fine with everybody, I will queue them up for merging into
6.1 (probably in the second half of the upcoming merge window).
