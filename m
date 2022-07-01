Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1350A3C00
	for <llvm@lists.linux.dev>; Fri,  1 Jul 2022 22:05:17 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id t19so5358266lfl.5
        for <llvm@lists.linux.dev>; Fri, 01 Jul 2022 15:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=26m3QrqDOEetx8CkGkMNVENfZC6JApBC8b4D3WMfsqY=;
        b=PHG7MYwuMLYjj6+14AcnjpSzpFo5v7V6cjn2MuZ887lLw24RKH8Av0rnK3qntWEsWq
         P/DkZdiv3ZI+1US/j7Zn+xQbLqMQm4kJ4aopjXaHZQPzo76ycGzdyL0IQpaPf+3GLaDi
         qtA7fciGyvzv9jLr4ocVSBm0OmY14IFNAD5tSL7aqyDR8+5toM/8Re3hTkIeNGnG7L/B
         Ipv9Zuvxn6AYdzlfwzPftqUvsU5PaFXAF64C2bvQjpYeTMPB0KcnkJJCp2eS0ucTjIts
         9HQUoXe2BtbWiQ0p5bhqebbzpF1jAsnMsMwcGcd4Yf+jXaSGLoQHUVcEnjNpnHAZ54lb
         Mn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=26m3QrqDOEetx8CkGkMNVENfZC6JApBC8b4D3WMfsqY=;
        b=4qhLX/hPQFoHWCQDxXGEbOUWA2dLIlsi/xG3850BuJh0fY8ftUjXbafbOJI+mr5Qtv
         Th17nd2/Cx6/nH+Uhj8IKgbobdH+AasjdfrsDTqYi4nxBkaJ3R/1pWjYTe8YJpBnGPVF
         7UM3De/akoG9s51rDgJSf4pNAg8PazSDS3cgDkvBezgvzX2o2WWvxGJ6zPcL/dtDTTDa
         nG4XtFuz1+SLczS6O1KB+AUWC0f5mz1H7QZaeBHX0Dzm3x0z2x4EBkl9jOqdYFTTQje6
         oyDjebZ/XY8WHkUNJrtQibP/jMQuI2WvDIwdSfGvNweOcEmuCFMLUFTDtLOplDUqObMH
         SGcQ==
X-Gm-Message-State: AJIora8Kp5uv9E4iWcyXaM4S5E72Sl8qbwXMaQk8rWQQcUzg+Y3Du6iW
	boYeq//CDP7oVYOCbKvH4BEDrSmhH3LyUiqeOKyyjw==
X-Google-Smtp-Source: AGRyM1sk/RELW5TrL/N4TtgXDUTQaosHEdmojIwAlf799F2Uauf6sAJCI6KQBsdsb6ppiSECv5V0YqEKpAtb2jETcaA=
X-Received: by 2002:ac2:4d22:0:b0:47f:65b5:35ec with SMTP id
 h2-20020ac24d22000000b0047f65b535ecmr10770649lfk.432.1656713115906; Fri, 01
 Jul 2022 15:05:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220316213118.2352683-1-morbo@google.com> <20220321174912.164113-1-morbo@google.com>
 <Ypp3MA9s01bWrm2i@penguin>
In-Reply-To: <Ypp3MA9s01bWrm2i@penguin>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 1 Jul 2022 15:05:03 -0700
Message-ID: <CAKwvOdnwCVFpMgOih4bf1RAzb6n0Q0+AqaHZxGfnafT+XzAL4A@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: smem: use correct format characters
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bill Wendling <morbo@google.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Justin Stitt <jstitt007@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,
Would you be able to merge this patch through the arm-soc tree? The
maintainers appear to be MIA here.
https://lore.kernel.org/lkml/20220321174912.164113-1-morbo@google.com/

On Fri, Jun 3, 2022 at 2:03 PM Justin Stitt <jstitt007@gmail.com> wrote:
>
> On Mon, Mar 21, 2022 at 10:49:12AM -0700, Bill Wendling wrote:
> > When compiling with -Wformat, clang emits the following warnings:
> >
> > drivers/soc/qcom/smem.c:847:41: warning: format specifies type 'unsigned
> > short' but the argument has type 'unsigned int' [-Wformat]
> >                         dev_err(smem->dev, "bad host %hu\n", remote_host);
> >                                                      ~~~     ^~~~~~~~~~~
> >                                                      %u
> > ./include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
> >         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
> >                                                                ~~~     ^~~~~~~~~~~
> > ./include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
> >                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
> >                              ~~~    ^~~~~~~~~~~
> > drivers/soc/qcom/smem.c:852:47: warning: format specifies type 'unsigned
> > short' but the argument has type 'unsigned int' [-Wformat]
> >                         dev_err(smem->dev, "duplicate host %hu\n", remote_host);
> >                                                            ~~~     ^~~~~~~~~~~
> >                                                            %u
> > ./include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
> >         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
> >                                                                ~~~     ^~~~~~~~~~~
> > ./include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
> >                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
> >                              ~~~    ^~~~~~~~~~~
> >
> > The types of these arguments are unconditionally defined, so this patch
> > updates the format character to the correct one and change type of
> > remote_host to "u16" to match with other types.
> >
>
> This patch LGTM and fixes -Wformat warning.
>
> Tested-by: Justin Stitt <jstitt007@gmail.com>
> Reviewed-by: Justin Stitt <jstitt007@gmail.com>
>
> > Link: https://github.com/ClangBuiltLinux/linux/issues/378
> > Signed-off-by: Bill Wendling <morbo@google.com>
> > ---
> >  drivers/soc/qcom/smem.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> > index e2057d8f1eff..9dd325df5682 100644
> > --- a/drivers/soc/qcom/smem.c
> > +++ b/drivers/soc/qcom/smem.c
> > @@ -819,7 +819,7 @@ qcom_smem_enumerate_partitions(struct qcom_smem *smem, u16 local_host)
> >       struct smem_partition_header *header;
> >       struct smem_ptable_entry *entry;
> >       struct smem_ptable *ptable;
> > -     unsigned int remote_host;
> > +     u16 remote_host;
> >       u16 host0, host1;
> >       int i;
> >
> > @@ -844,12 +844,12 @@ qcom_smem_enumerate_partitions(struct qcom_smem *smem, u16 local_host)
> >                       continue;
> >
> >               if (remote_host >= SMEM_HOST_COUNT) {
> > -                     dev_err(smem->dev, "bad host %hu\n", remote_host);
> > +                     dev_err(smem->dev, "bad host %u\n", remote_host);
> >                       return -EINVAL;
> >               }
> >
> >               if (smem->partitions[remote_host]) {
> > -                     dev_err(smem->dev, "duplicate host %hu\n", remote_host);
> > +                     dev_err(smem->dev, "duplicate host %u\n", remote_host);
> >                       return -EINVAL;
> >               }
> >
> > --
> > 2.35.1.894.gb6a874cedc-goog
> >
> >
>


-- 
Thanks,
~Nick Desaulniers
