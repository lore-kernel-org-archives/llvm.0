Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052472C87
	for <llvm@lists.linux.dev>; Wed,  6 Oct 2021 13:24:04 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id z11so2305917lfj.4
        for <llvm@lists.linux.dev>; Wed, 06 Oct 2021 06:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WS14M02mZrzoEQN1o6wiWSulz9IINclcD4VShwS4gQg=;
        b=YTDRHHEgJdBj0D00T9pyOuhm8h1JTZfknempnR79qX1zzj94Mlv701kAUhSavo0rjh
         CGzn+RjcHp7aJKK/6JF+oNFlHAB+xMuIr7cgHYGP8YHn5Bv5nkuR6LmChfrafu1wouTo
         oAxr4kWsGNmDKRLdVEZmj+04ANYmqw+JE9XApzBibmhl9kLmhflektTxBaayHUsJ9ovF
         cRuIQWziI2Frz3JbAhH9mLoVFU0ZBscFngX0yJHmYE99XreF8jPQgdzcGRKi7oizgjER
         q8J810JQMABS6wtH+DefXZh4BL4TNwG80T8zy93Uds4dRc3jmsIMTh4WmXJjkLgZR7ae
         CCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WS14M02mZrzoEQN1o6wiWSulz9IINclcD4VShwS4gQg=;
        b=Xz3otNchC2ajVV+zBizm5vgUt1b7RDLvRgXNVV03SNZRZ1PZWVKAKMKrxkH7A5XMRU
         b3DL+aSZZYysXIHxuOE3XYibIN+uNaMU0esivXqOnRrAP+IgZrXetS3RuCOxrNtrAwBp
         63CJ+JdZRUw/rowGHxmzHUxSvbpY4vhbuomxa43a4vbPuaH4nJO9LD+VByugrlUu7k68
         II6jW2ZJChM6trfsVueojhUbmPN4UldjJaYNvr053wfmtebgOwjpsd3CgsovK/LzJYIX
         TjkQ+17uXPwezLXp8QSWL3PcKpqS9IpF8F2O01za8RHWXZ0KqzqvaZBB17EsjsvyD1h1
         hQAg==
X-Gm-Message-State: AOAM533GI7JlQQvpdmjUalMAX7vpwaOQ0C+5pI8daOR9RM6w3zkkdniS
	8qep5Z4riI9xbsyTJmdhWIsnd7/wmUFJA6C8U63e3A==
X-Google-Smtp-Source: ABdhPJzqyXF9Ww3e4Iwxx3ZQuKiigcWnahMGa+hgZ8jHpihyXxXZCEDMbZbT+30YZE0uf6PZUC44+QO+bSf8Xy99PNY=
X-Received: by 2002:a05:6512:3409:: with SMTP id i9mr9482583lfr.396.1633526642784;
 Wed, 06 Oct 2021 06:24:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdmrOYTxVd1f+=g4e-+q0fD+BZZTBGOkzcRq494bYYCkgw@mail.gmail.com>
 <CAKdWgSyH4tYESpUEBx1SqK0F=ydG_0r=MT0-s5D9zC4rS0EppA@mail.gmail.com>
 <CAKwvOdmSA2LmFXsPPrpBahR7bWXaLH=KdwepwvF+DqA+zGjROA@mail.gmail.com> <CAKdWgSzX9VR-SogD5bG0mgVDTE-fWbO1d1h4Uk7OW5STPsDB3w@mail.gmail.com>
In-Reply-To: <CAKdWgSzX9VR-SogD5bG0mgVDTE-fWbO1d1h4Uk7OW5STPsDB3w@mail.gmail.com>
From: Vishal Bhoj <vishal.bhoj@linaro.org>
Date: Wed, 6 Oct 2021 18:53:51 +0530
Message-ID: <CAKdWgSyKkN5m-qJsAyk9S27xnsV6EjAw8js8WeMfjd6Ose0mFA@mail.gmail.com>
Subject: Re: missing build.log files
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev, tuxsuite <tuxsuite@linaro.org>, 
	Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Oct 2021 at 18:35, Vishal Bhoj <vishal.bhoj@linaro.org> wrote:
>
> Hi Nick,
>
>
> On Fri, 1 Oct 2021 at 23:18, Nick Desaulniers <ndesaulniers@google.com> wrote:
> >
> > On Fri, Oct 1, 2021 at 10:21 AM Vishal Bhoj <vishal.bhoj@linaro.org> wrote:
> > >
> > > Hi Nick,
> > >
> > > I saw the build failures today morning. These builds try to apply
> > > patches and fail to apply them and hence the build is marked as
> > > failed. This info is available in build logs and also as part of
> > > "status_message" field in the build.json file saved by tuxsuite cli
> > > (--json-out option).
> >
> > That makes sense; I was trolling our build logs because Sedat noticed
> > a patch we were carrying made it to mainline. I went to check and see
> > what the failure would look like in our CI when a patch fails to
> > apply.  We want it to fail loudly, for sure, but we may need to update
> > our client to make it clearer what the failure was.  We can add code
> > to check the "status_message" isn't "Unable to apply kernel patch"
> > before trying to fetch the build logs.
> >
> > >
> > > The build.log is generated from tuxmake and since the patching itself
> > > failed, a build.log was not generated. I have opened a bug to track
> > > this issue to publish the build.log:
> > > https://gitlab.com/Linaro/tuxsuite/-/issues/138
> >
> > Ah, or if we just always had the log that would be good, too.
>
> We now publish build.log with "git quiltimport" output for all patched
> builds. Here is an example build:
> https://builds.tuxbuild.com/1yl8XNzEt3MytISR7Lh3gV7ivDX/config

Sorry for the wrong link. Here is how the build.log would look:
https://builds.tuxbuild.com/1z8Lj56Txf3Ibe0tfVlobPFuU39/build.log
https://builds.tuxbuild.com/1z8Lj56Txf3Ibe0tfVlobPFuU39/

> >
> > >
> > > Regards,
> > > Vishal
> > >
> > >
> > > On Fri, 1 Oct 2021 at 22:37, Nick Desaulniers <ndesaulniers@google.com> wrote:
> > > >
> > > > Hi Vishal,
> > > > Last night's run had a few HTTP 404's where the build.log files
> > > > weren't produced, example:
> > > > https://github.com/ClangBuiltLinux/continuous-integration2/runs/3767134165?check_suite_focus=true
> > > >
> > > > download_url: https://builds.tuxbuild.com/1yuAt3oatFT1XZifxO2YoBUadf4/
> > > >
> > > > expected the log file to be at
> > > > https://builds.tuxbuild.com/1yuAt3oatFT1XZifxO2YoBUadf4/build.log
> > > >
> > > > --
> > > > Thanks,
> > > > ~Nick Desaulniers
> >
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers
