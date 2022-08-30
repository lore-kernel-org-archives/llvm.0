Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A932F30
	for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 12:45:49 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id c20so8354185qtw.8
        for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 05:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=mjE/xAmjy9vxfmw5GBlVvKmhsej8si9kPE9vjVE12v8=;
        b=DLo46a2iWTmz9Ets1bGcCAD0mrOEcC3NEJG7PesZjfN6m4Ku0cYMRaA28/5h/R2R+c
         5OlY6oSY/ASo0bc+Mp1iPM6KhfIOdgWjfXEx5PH+RHCQoLU3L809fpMWffuQcOroLjwG
         Y18nLfOFlAs65bHo7sDqkZNYFZ6cZBoVMKUD7CJqXR9ch3ioVIwa1lnuIrAlEkCPM4LV
         fHQ6x3rbrPp4c9mSV9ocxh9ykB+a+UzRZ09FuVr6vsyzSJmZYv4O+ju3HlscgLer6HqG
         29nJxIAduBJURu6mts76NHhooSBTXoogwnWWYg9ICodZaFf6dHy2nCzKHjG9hZ4q+oar
         y0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=mjE/xAmjy9vxfmw5GBlVvKmhsej8si9kPE9vjVE12v8=;
        b=qCNb+O7nPoc/ejIdlzRZzbYzcC7aFClzYTAl4UkG2J0XEGvsnQ1thmZLLBJYJ9koSu
         MbNLLY5m7rXLNKPcn5NLEazyMliBZufTzX2H4qYYQvOb5L8guaaqn67qfYNvTuogyoCf
         Z75CzvvE5nP7lLHO8Vrax0znCe7/Fu3dfxRZScBTQArm9XcRfkztVo/jdRh35i0XnGxY
         MHxtm1/AkIpay2cKtfAPxoYMlgpbe+gRfAow8XRi4sUMWh+LwGu0Hz5i/ei0Lc67XoOL
         yQRGnHqZMGMLEXV/uURpLXDfNneqrgTpknsdonEgu3uxBOe7+gasZ9YvJOdXlmL7lxik
         zt0g==
X-Gm-Message-State: ACgBeo27ddqKM6IaKTTKScMa/1zzV3yZI7v+dIMDGL3XRkf42NxR9RqW
	Uc2rKJrlUQtu76ThHWuQTFEkn9FVMzHo9+jS0qk=
X-Google-Smtp-Source: AA6agR4OjmhM5kcJ5ADJGPx2SAbWHITyh+GFtjTEqgs86DnKRnVWMtDTIf5HPe/hUUF7QEwmllQx/EqVKJ/D6GhCUP8=
X-Received: by 2002:a05:622a:40a:b0:343:77ba:727f with SMTP id
 n10-20020a05622a040a00b0034377ba727fmr14455485qtx.481.1661863548012; Tue, 30
 Aug 2022 05:45:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202208290618.wU7mHfOp-lkp@intel.com> <20220830110329.00000d18@huawei.com>
In-Reply-To: <20220830110329.00000d18@huawei.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 30 Aug 2022 15:45:12 +0300
Message-ID: <CAHp75VfA=w+Q2ccdTiQXeWRw0wSjbkUf6J3+tp-kE50mxdkTNg@mail.gmail.com>
Subject: Re: [jic23-iio:testing 124/129] drivers/iio/accel/msa311.c:993:24:
 warning: format specifies type 'unsigned char' but the argument has type
 'unsigned int'
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: kernel test robot <lkp@intel.com>, Dmitry Rokosov <DDRokosov@sberdevices.ru>, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 30, 2022 at 1:03 PM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
> On Mon, 29 Aug 2022 06:25:53 +0800
> kernel test robot <lkp@intel.com> wrote:

...

> > >> drivers/iio/accel/msa311.c:993:24: warning: format specifies type 'unsigned char' but the argument has type 'unsigned int' [-Wformat]
> >                                               "msa311-%hhx", partid);
> >                                                       ~~~~   ^~~~~~
> >                                                       %x
> >    1 warning generated.

> >    992                msa311->chip_name = devm_kasprintf(dev, GFP_KERNEL,
> >  > 993                                                   "msa311-%hhx", partid);

> I'm thinking intent here was to limit range of what was printed. Maybe better to use
> local u8 variable or cast?
>
> I can fix it up if that's fine with you - or even better send me a patch that fixes
> it however you prefer!

Looking back at what Linus said about those specifiers, I would rather
go with simple %x or %02x.

P.S. Surprisingly many C developers don't know the difference between
%hhx and %02x, which is easy to check by

  char a = -1;
  printf("%hhx <==> %02x\n", a, a);
  a = 217;
  printf("%hhx <==> %02x\n", a, a);

-- 
With Best Regards,
Andy Shevchenko
