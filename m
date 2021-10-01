Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117FF29CA
	for <llvm@lists.linux.dev>; Fri,  1 Oct 2021 17:48:04 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id g41so41443296lfv.1
        for <llvm@lists.linux.dev>; Fri, 01 Oct 2021 10:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s4DCq/SL+0pzR+f05QcJy4s8pIeom8elV/jmmuJRofY=;
        b=alwG9T4t9LMLGhDVpUrSGu70LA+myA6nRYFBA6QZj+URP2cEPLWxHW8u19Kqx8jqnf
         623WEKwdlCcU9/t85/hdPjeq5klZWJi544a4UmBIoKSopTkDNeE1Ucl8ll3YTH7mq8da
         lsaVQPjA4NP9maPfCSWKfjWHH45gjdeMTIsouhPxWFxkKEZCycCB6U+6wnU+MyOvblKZ
         rcyEv8uPZ5lkJaXoLgXJPklpABwB+TcWSvC6VbP33yM44cr6JDkVTe2URYF6h/sTcOtw
         L+y2ATVIPsKo24PBuH1XszLtuk66pKKKcW/kxMlLwyVf8zi0njRXqmo4hExAvvjBxLLP
         gYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s4DCq/SL+0pzR+f05QcJy4s8pIeom8elV/jmmuJRofY=;
        b=MtROTVoCAVlR2xHqy4KOYx0islZa104fTjx/QFYxaCVkyr/4fMUM3S7BZCM8OW7Rkc
         KsramgR5h+kX1Hn6aLsyO7o3+OXj+vTnCIhxXMdPcgLNZ3ckNji6ppNC+I5vSd0xtKmV
         dR7gsVVaknqsKwLVlTDwebCA1gaWn2t1KMPa2sg51P+m2jquzoliNpj1e2AJza0fYLB2
         8bU0JvrrVy67EJPuYr5c8UH2sZ7wuGGZzKj6JYEtcy1TxNN+58DJbQjNE4OFjDBz5X5d
         0pnkNgPIrI2a+Rue3/DnIAvfmzBzswmZzs6Vi1qMrxt351OLT9SEwEiKWNGXdqOfL9mx
         GXJQ==
X-Gm-Message-State: AOAM531qlOPI4MboWHzTnOKbF3l9+aaHT+tECFT9M2LYFZQMUtb6Jg4e
	uFFArIUK5XEIgBqhAOn16S96j3bczI+c8D6dlVxO4A==
X-Google-Smtp-Source: ABdhPJzXS3QNigZNqBcfBGLHLfQpXltfshXLki57pm3OPFzY7e+K6FhzQvh1vWXdq09CQaUvaz3Blv1zDnQX0ayhpzs=
X-Received: by 2002:a05:6512:3ba5:: with SMTP id g37mr6529539lfv.651.1633110482681;
 Fri, 01 Oct 2021 10:48:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdmrOYTxVd1f+=g4e-+q0fD+BZZTBGOkzcRq494bYYCkgw@mail.gmail.com>
 <CAKdWgSyH4tYESpUEBx1SqK0F=ydG_0r=MT0-s5D9zC4rS0EppA@mail.gmail.com>
In-Reply-To: <CAKdWgSyH4tYESpUEBx1SqK0F=ydG_0r=MT0-s5D9zC4rS0EppA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 1 Oct 2021 10:47:50 -0700
Message-ID: <CAKwvOdmSA2LmFXsPPrpBahR7bWXaLH=KdwepwvF+DqA+zGjROA@mail.gmail.com>
Subject: Re: missing build.log files
To: Vishal Bhoj <vishal.bhoj@linaro.org>
Cc: llvm@lists.linux.dev, tuxsuite <tuxsuite@linaro.org>, 
	Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 1, 2021 at 10:21 AM Vishal Bhoj <vishal.bhoj@linaro.org> wrote:
>
> Hi Nick,
>
> I saw the build failures today morning. These builds try to apply
> patches and fail to apply them and hence the build is marked as
> failed. This info is available in build logs and also as part of
> "status_message" field in the build.json file saved by tuxsuite cli
> (--json-out option).

That makes sense; I was trolling our build logs because Sedat noticed
a patch we were carrying made it to mainline. I went to check and see
what the failure would look like in our CI when a patch fails to
apply.  We want it to fail loudly, for sure, but we may need to update
our client to make it clearer what the failure was.  We can add code
to check the "status_message" isn't "Unable to apply kernel patch"
before trying to fetch the build logs.

>
> The build.log is generated from tuxmake and since the patching itself
> failed, a build.log was not generated. I have opened a bug to track
> this issue to publish the build.log:
> https://gitlab.com/Linaro/tuxsuite/-/issues/138

Ah, or if we just always had the log that would be good, too.

>
> Regards,
> Vishal
>
>
> On Fri, 1 Oct 2021 at 22:37, Nick Desaulniers <ndesaulniers@google.com> wrote:
> >
> > Hi Vishal,
> > Last night's run had a few HTTP 404's where the build.log files
> > weren't produced, example:
> > https://github.com/ClangBuiltLinux/continuous-integration2/runs/3767134165?check_suite_focus=true
> >
> > download_url: https://builds.tuxbuild.com/1yuAt3oatFT1XZifxO2YoBUadf4/
> >
> > expected the log file to be at
> > https://builds.tuxbuild.com/1yuAt3oatFT1XZifxO2YoBUadf4/build.log
> >
> > --
> > Thanks,
> > ~Nick Desaulniers



-- 
Thanks,
~Nick Desaulniers
