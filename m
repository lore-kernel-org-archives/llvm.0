Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD613200
	for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 12:51:40 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id f14so8293687qkm.0
        for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 05:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=PpqfiNqNN/v5riSi++yk8rU9hwXl2SDNhJUenWsoXaE=;
        b=NFXeVzjXZKNKv6uOvgSArxATA39WpGM/i+P+jv7OCZJJ4TkwgxlfNbJmVEVo5ZXCFn
         0CC7+XRqZ1EBEJDfqmcMMCCLDk9cHU3ZMr29YiPvar/VfBwycOJBk44Ojx9fPV+e6Of0
         3cCcCxuhio+PScyKl9Ia8rhf6tWg3ulIGJhV6h6MLAi4uyLxOTlzwz/0Y9XtzCW9zAvu
         SuiY+Rcx0nbFXEe4A8nvXZX8eAwblRvEvH7P9bqcO6UP9xbjdtaJ0urtJ+Fls3o93gz0
         EC13owlkOf5sYUf5qbmSVrMZad+TsOw0sUH6bGXg50QdT+MwM4J1ele2P+quGgWsXIx9
         yfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=PpqfiNqNN/v5riSi++yk8rU9hwXl2SDNhJUenWsoXaE=;
        b=LXydkjN67IlXAqgIZ7xFjdR1U/4wOqCo9vYkY0vkwKglIh3tHuNIbGJ25aDTwwL4BI
         YBkOoPzxhfHwZ9VUZJr6C8ijvnR1pW/iy9+FHFygSCPQ/misGgKBmINE74kGeqoe8KyW
         R9+piDyRajO8GRgYEPtSJ8htzwLfv37iKo5G+qVA2bLA1eSefXtPAPFIV32xwmaHad4y
         ow9T0bC8yHlFEOdKkW8D+KK5xUgNqoMR/B0fh4OfNttBWaeBrobzReujsuwWMq90YGVy
         HwYRe80Iabtp11+c8OzNPhVkEvaEvYnuANhdhrG1Hog35As671Nm7fZUPLA8CIt1UjgI
         vVdQ==
X-Gm-Message-State: ACgBeo2jY0hccRBvMNxPr0EZcGB0Rdq4dypxZqEBNEN/IwWzBw6SqSyH
	hyXsg5+dh6uW1iojiMFhw5MJ/u+URttLCeNlujM=
X-Google-Smtp-Source: AA6agR5MRDg0uXFkiu9jiPXUdGAiYPIRrWu1u3iavC/ytYH+BiJYu4tRF4tMPknyct0Hh7oH38fJSzX1z7Q8XaOsij8=
X-Received: by 2002:a05:620a:254d:b0:6ab:84b8:25eb with SMTP id
 s13-20020a05620a254d00b006ab84b825ebmr11696681qko.383.1661863899956; Tue, 30
 Aug 2022 05:51:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202208290618.wU7mHfOp-lkp@intel.com> <20220830110329.00000d18@huawei.com>
 <CAHp75VfA=w+Q2ccdTiQXeWRw0wSjbkUf6J3+tp-kE50mxdkTNg@mail.gmail.com>
In-Reply-To: <CAHp75VfA=w+Q2ccdTiQXeWRw0wSjbkUf6J3+tp-kE50mxdkTNg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 30 Aug 2022 15:51:04 +0300
Message-ID: <CAHp75Vc_Jz+APmJ7tQgYGbk-LrNebR26f9YzDc-Lvib-weAESg@mail.gmail.com>
Subject: Re: [jic23-iio:testing 124/129] drivers/iio/accel/msa311.c:993:24:
 warning: format specifies type 'unsigned char' but the argument has type
 'unsigned int'
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: kernel test robot <lkp@intel.com>, Dmitry Rokosov <DDRokosov@sberdevices.ru>, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 30, 2022 at 3:45 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Aug 30, 2022 at 1:03 PM Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
> > On Mon, 29 Aug 2022 06:25:53 +0800
> > kernel test robot <lkp@intel.com> wrote:
>
> ...
>
> > > >> drivers/iio/accel/msa311.c:993:24: warning: format specifies type 'unsigned char' but the argument has type 'unsigned int' [-Wformat]
> > >                                               "msa311-%hhx", partid);
> > >                                                       ~~~~   ^~~~~~
> > >                                                       %x
> > >    1 warning generated.
>
> > >    992                msa311->chip_name = devm_kasprintf(dev, GFP_KERNEL,
> > >  > 993                                                   "msa311-%hhx", partid);
>
> > I'm thinking intent here was to limit range of what was printed. Maybe better to use
> > local u8 variable or cast?
> >
> > I can fix it up if that's fine with you - or even better send me a patch that fixes
> > it however you prefer!
>
> Looking back at what Linus said about those specifiers, I would rather
> go with simple %x or %02x.
>
> P.S. Surprisingly many C developers don't know the difference between
> %hhx and %02x, which is easy to check by
>
>   char a = -1;
>   printf("%hhx <==> %02x\n", a, a);
>   a = 217;
>   printf("%hhx <==> %02x\n", a, a);

And additional part

    unsigned int b = 7, c = 1027;
    printf("%02x(b) %02x(c)\n", b, c);


-- 
With Best Regards,
Andy Shevchenko
