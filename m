Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4577C29CA
	for <llvm@lists.linux.dev>; Fri,  1 Oct 2021 17:21:05 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id y23so6501820lfj.7
        for <llvm@lists.linux.dev>; Fri, 01 Oct 2021 10:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HJnFNb3CDActUMG2hAdodoJwvrAARSNpvDnVT1GM2T4=;
        b=BB2TD44ilqf9UrUAmWKCL6W7ZGIlR2IbWXTSaBvcapYH/jeu3+qRtS8E7ovfiFLxCX
         8JBM/1oPFfIfpEonWN5bDkBHYE0FrnpqfJjzNRtUKGger0rckCwBhMExNB4jIHVh2ND/
         B0m5S+cvkiegJ5pk7QI3VJIdiBQh/jjsKyJlsb/f+mlQeuHMSIj8yyj3M2ePp6n41LEf
         vqJ5KTj78FHFiOAvDluzLzHTbt/Xi/KjLck/jYMrPVBZ2APE3l3yo/00jmEbCudmYo65
         uC06YZfGRziWCvjnfL8RV4xTe+D18WuQSdWUiqsD8EkzycH8TqkUZQNx4TNgIc+lGyU8
         2dFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HJnFNb3CDActUMG2hAdodoJwvrAARSNpvDnVT1GM2T4=;
        b=lMR1W3fdH1lYYFAi3y7uClv21d2norUngwi6XUCocwAxts/mrwzYVLUzCkIK5skaSJ
         hEjUJx3NxmGu8OdMasc/DbvIRNWzHSz7h3ySdncmO4D1xwA0pzH5pZmqvCLXxSDaMRec
         OlZJI+s4Qzvi5JHC5u+pD1pobouSs+DuVgciNagcT40aqa0bznaiRWIpKmGiLP1ouWoG
         0hl3FKLwc4F5TpjCaLGWDLFMQapBwUwkelTgoj59koQcwvzQci0H7UXh495V3H/krJJQ
         l+9Y63XANRdBDhp1+PsF583B7YQ2RH6FdBpPVPyzvYSMNUnK7FrFTRvlZK/qQKxNDxSV
         Nykw==
X-Gm-Message-State: AOAM532cwHEAI/XeDUcOPtAR3X4HhgAg5tGXtgbsJUDk2UczGN17cwzg
	/KK1PhVGEVlflqEb/BYTnriWQ5zSgHLB/GTrfCs5k8DSIB2qdA==
X-Google-Smtp-Source: ABdhPJyRtyesOGj0ZfIWNqprHUFV1IY6aHmOjwg4fkT13m5X+6JMDOQPiOQ4MsafNBqGIEuNrLvchkPs8ihVsWR22d4=
X-Received: by 2002:a2e:984d:: with SMTP id e13mr13088286ljj.392.1633108863316;
 Fri, 01 Oct 2021 10:21:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdmrOYTxVd1f+=g4e-+q0fD+BZZTBGOkzcRq494bYYCkgw@mail.gmail.com>
In-Reply-To: <CAKwvOdmrOYTxVd1f+=g4e-+q0fD+BZZTBGOkzcRq494bYYCkgw@mail.gmail.com>
From: Vishal Bhoj <vishal.bhoj@linaro.org>
Date: Fri, 1 Oct 2021 22:50:52 +0530
Message-ID: <CAKdWgSyH4tYESpUEBx1SqK0F=ydG_0r=MT0-s5D9zC4rS0EppA@mail.gmail.com>
Subject: Re: missing build.log files
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev, tuxsuite <tuxsuite@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Nick,

I saw the build failures today morning. These builds try to apply
patches and fail to apply them and hence the build is marked as
failed. This info is available in build logs and also as part of
"status_message" field in the build.json file saved by tuxsuite cli
(--json-out option).

The build.log is generated from tuxmake and since the patching itself
failed, a build.log was not generated. I have opened a bug to track
this issue to publish the build.log:
https://gitlab.com/Linaro/tuxsuite/-/issues/138

Regards,
Vishal


On Fri, 1 Oct 2021 at 22:37, Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> Hi Vishal,
> Last night's run had a few HTTP 404's where the build.log files
> weren't produced, example:
> https://github.com/ClangBuiltLinux/continuous-integration2/runs/3767134165?check_suite_focus=true
>
> download_url: https://builds.tuxbuild.com/1yuAt3oatFT1XZifxO2YoBUadf4/
>
> expected the log file to be at
> https://builds.tuxbuild.com/1yuAt3oatFT1XZifxO2YoBUadf4/build.log
>
> --
> Thanks,
> ~Nick Desaulniers
