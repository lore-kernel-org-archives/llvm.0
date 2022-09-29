Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE8753B5
	for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 19:27:43 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id n7so2101978plp.1
        for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 12:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/2GwsSTauJmjYfkTPtC2/6DT6emkrfoGXZJnJAKA7Q4=;
        b=foDx98KEnUwOdRff85G0E13/0WM6bs/iCCF+h2oxTRfhB7Y8cg42aTZN6jyESeGP+M
         SMXoHJxaNBf/dU4aqoq9XMjty27bRq6o4egGu9mjF8HT6/tzgOCXTI19ixxEOtuJv4Hq
         BZNIv06QP3dxoJFec7uxD64LNaJdcxUwDvWos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/2GwsSTauJmjYfkTPtC2/6DT6emkrfoGXZJnJAKA7Q4=;
        b=u/K85Gjm/1OT7cv4F1twsNiS/PoLOl7PrvCWI2xNT31PWboFyWAMix83ncQXce4GB8
         z17C9A5x0i9ZTnirqThlW0eSEGLkcjR80xj5Eqk1wjB8L2mS5oOS9SzWNLSEPxT2Ekhm
         GLPAbp1GJPnwxc8Qkw1AsI5q2l4l1Q3IgSDSKLG0xD7m2AGqj2gmltad8VpjR8/huJjV
         kiYw9gGsk1hShW5BOZ4k2Wkqk+76i33aW5iZ2bGzRd57cRJj2cZmQbQRi4AvrIb2qPtd
         2Rg/yXFl/DT92G8lyXbBH7sRWo3tQeENuuPKimQ6PsWABoCf3+F/zJqvPCG9Vsjy+BZH
         a2pw==
X-Gm-Message-State: ACrzQf3Si5YjOoQph1VHkei5Sa8N5vD6iImm0TSpirQzKAYPE6CN8h/K
	bXrN1dg4HYKJPmRUWugdb6jxLAI+NzMiuw==
X-Google-Smtp-Source: AMsMyM665cvOb3HTv7sg8lgOvRp1MQW8B/UlYAQJsw9Cdiw0jnBamf+jTBKYHtv+CnwTWAxIWd2ZUA==
X-Received: by 2002:a17:902:ccc2:b0:178:29f9:5c5c with SMTP id z2-20020a170902ccc200b0017829f95c5cmr4908638ple.19.1664479662576;
        Thu, 29 Sep 2022 12:27:42 -0700 (PDT)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com. [209.85.215.176])
        by smtp.gmail.com with ESMTPSA id d18-20020a170903231200b001728ac8af94sm229159plh.248.2022.09.29.12.27.42
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 12:27:42 -0700 (PDT)
Received: by mail-pg1-f176.google.com with SMTP id 3so2319757pga.1
        for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 12:27:42 -0700 (PDT)
X-Received: by 2002:a63:e16:0:b0:43b:d646:1bb7 with SMTP id
 d22-20020a630e16000000b0043bd6461bb7mr4327148pgl.53.1664479651010; Thu, 29
 Sep 2022 12:27:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220929161917.2348231-1-rrangel@chromium.org>
 <20220929093200.v6.6.I8092e417a8152475d13d8d638eb4c5d8ea12ac7b@changeid> <CAJZ5v0izHjb8vE0ALyYo9yMOExdpCzG8f7-d5SpQnftqJfTEig@mail.gmail.com>
In-Reply-To: <CAJZ5v0izHjb8vE0ALyYo9yMOExdpCzG8f7-d5SpQnftqJfTEig@mail.gmail.com>
From: Raul Rangel <rrangel@chromium.org>
Date: Thu, 29 Sep 2022 13:27:19 -0600
X-Gmail-Original-Message-ID: <CAHQZ30CJyhPK-OriZ5NZ=GjwNbofaCW6GZ_CvPsL0WiJGsxs-Q@mail.gmail.com>
Message-ID: <CAHQZ30CJyhPK-OriZ5NZ=GjwNbofaCW6GZ_CvPsL0WiJGsxs-Q@mail.gmail.com>
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

On Thu, Sep 29, 2022 at 1:18 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Thu, Sep 29, 2022 at 6:19 PM Raul E Rangel <rrangel@chromium.org> wrote:
> >
> > ACPI IRQ/Interrupt resources contain a bit that describes if the
> > interrupt should wake the system. This change exposes that bit via
> > a new IORESOURCE_IRQ_WAKECAPABLE flag. Drivers should check this flag
>
> I would call this IORESOURCE_IRQ_WAKE which is (a) simpler and easier
> to read and (b) it sort of matches the "wakeirq" naming convention.

It was Dmitry who originally suggested the name. I personally like the
CAPABLE in the name. It makes it clear that it's capable of acting as
a wake source, not to be confused with being enabled as a wake source.

>
> This is not a big deal if you insist on this name and for a good
> reason, but just something I would do differently.
>
> The patch LGTM otherwise.
>
