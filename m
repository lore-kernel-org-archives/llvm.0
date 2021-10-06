Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDBC2C87
	for <llvm@lists.linux.dev>; Wed,  6 Oct 2021 13:05:57 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id z11so2049455lfj.4
        for <llvm@lists.linux.dev>; Wed, 06 Oct 2021 06:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/IgSGISrLLUeljDdfRQxqNI3cXo9BvxEDoaRtM9UJlE=;
        b=gObytGQzprlN3h0TvqVq/+qiawabXPacKlqKNnBol8MGTvhqjtBlZtMIj0im5O19zu
         KhaoSW6RaTwaZz0cI++KJXIpFwbyFrZO94mWjKIViBX+qTek/4y54qsiBJT0V3aJmzZs
         LAMebB8E7a5TrfayVlx6gMIMAFtjfwOoMdefg9eKp0gaEtyzuUS+XL3f679M77yyJyv+
         +Tjb0BHSp/mIFm69zIJiWZkKc26Ui0Gw7A7k717oh5qakg5Bpzo08cJa9WW998rWieik
         vEZj0EArsFnFZYqKa6tiKcml66qFoonwgzU6usSwdXF4rl/HY/4fm5+Dcovn1s9i/8Jc
         qgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/IgSGISrLLUeljDdfRQxqNI3cXo9BvxEDoaRtM9UJlE=;
        b=zG0X2Qj28ca4n1aF0fJ0bPV+6wi5vYFCHoXEZBUbe/BhrzxI+9bzYF5o+V9qNkkeUc
         7kxH8916g2LRwlTYaF44uaFZs4jwwPyC1dS8so1EMrlsUfu+M/0YsG/0VQxCDNsLauuf
         8BS1JLueVYI5Eo37opEQG9OufHKIrRnVHIwL1uHrY1gGy0J4XMNczwNmFSWHPpXTOI9l
         N392ot6exDr2JXt36aHhWEf1ku0Hd3P0hcTjZFWyReEh7RhQ5Ou9Tw5A7J11zAgw4O8q
         FzKvWaFYJYL4q6NIzBR4drPGKExtxRE4ORsqzngqmgbVj9DAI+UonFQlxKc3dkdeMHQi
         AGLg==
X-Gm-Message-State: AOAM531USJkaSLLUnfux5qjWabHC5XECV9swKtH/eAOduVdzyBExScNj
	MSNN24PO6CdRK2QbrpgUKwbOdLZQ+m6PEe5yniysEmteLA7QDw==
X-Google-Smtp-Source: ABdhPJylPdbHvvvcR0fo4P55PjUsQbIQTnkFYZcsZq0N0/KXqoOsCfHxblqjQE1cf7ZLHHi5YZKQX2DFzh5QHxeyLzs=
X-Received: by 2002:a19:4f05:: with SMTP id d5mr9709919lfb.672.1633525551069;
 Wed, 06 Oct 2021 06:05:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdmrOYTxVd1f+=g4e-+q0fD+BZZTBGOkzcRq494bYYCkgw@mail.gmail.com>
 <CAKdWgSyH4tYESpUEBx1SqK0F=ydG_0r=MT0-s5D9zC4rS0EppA@mail.gmail.com> <CAKwvOdmSA2LmFXsPPrpBahR7bWXaLH=KdwepwvF+DqA+zGjROA@mail.gmail.com>
In-Reply-To: <CAKwvOdmSA2LmFXsPPrpBahR7bWXaLH=KdwepwvF+DqA+zGjROA@mail.gmail.com>
From: Vishal Bhoj <vishal.bhoj@linaro.org>
Date: Wed, 6 Oct 2021 18:35:39 +0530
Message-ID: <CAKdWgSzX9VR-SogD5bG0mgVDTE-fWbO1d1h4Uk7OW5STPsDB3w@mail.gmail.com>
Subject: Re: missing build.log files
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev, tuxsuite <tuxsuite@linaro.org>, 
	Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Nick,


On Fri, 1 Oct 2021 at 23:18, Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Fri, Oct 1, 2021 at 10:21 AM Vishal Bhoj <vishal.bhoj@linaro.org> wrote:
> >
> > Hi Nick,
> >
> > I saw the build failures today morning. These builds try to apply
> > patches and fail to apply them and hence the build is marked as
> > failed. This info is available in build logs and also as part of
> > "status_message" field in the build.json file saved by tuxsuite cli
> > (--json-out option).
>
> That makes sense; I was trolling our build logs because Sedat noticed
> a patch we were carrying made it to mainline. I went to check and see
> what the failure would look like in our CI when a patch fails to
> apply.  We want it to fail loudly, for sure, but we may need to update
> our client to make it clearer what the failure was.  We can add code
> to check the "status_message" isn't "Unable to apply kernel patch"
> before trying to fetch the build logs.
>
> >
> > The build.log is generated from tuxmake and since the patching itself
> > failed, a build.log was not generated. I have opened a bug to track
> > this issue to publish the build.log:
> > https://gitlab.com/Linaro/tuxsuite/-/issues/138
>
> Ah, or if we just always had the log that would be good, too.

We now publish build.log with "git quiltimport" output for all patched
builds. Here is an example build:
https://builds.tuxbuild.com/1yl8XNzEt3MytISR7Lh3gV7ivDX/config
>
> >
> > Regards,
> > Vishal
> >
> >
> > On Fri, 1 Oct 2021 at 22:37, Nick Desaulniers <ndesaulniers@google.com> wrote:
> > >
> > > Hi Vishal,
> > > Last night's run had a few HTTP 404's where the build.log files
> > > weren't produced, example:
> > > https://github.com/ClangBuiltLinux/continuous-integration2/runs/3767134165?check_suite_focus=true
> > >
> > > download_url: https://builds.tuxbuild.com/1yuAt3oatFT1XZifxO2YoBUadf4/
> > >
> > > expected the log file to be at
> > > https://builds.tuxbuild.com/1yuAt3oatFT1XZifxO2YoBUadf4/build.log
> > >
> > > --
> > > Thanks,
> > > ~Nick Desaulniers
>
>
>
> --
> Thanks,
> ~Nick Desaulniers
