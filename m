Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E267F
	for <llvm@lists.linux.dev>; Wed, 14 Jun 2023 16:43:51 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-62fe1e6dc65so7755506d6.0
        for <llvm@lists.linux.dev>; Wed, 14 Jun 2023 09:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686761030; x=1689353030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwxcE8abfYw4UDD2GwaIyR5gbC93lb1+WlKxHZUaJK4=;
        b=YnaAofNwG+L1xpWJDFLiuB3ppaQpvkRQa5GmJ1Fo9B8EAI2N4K/P7cYjUjwwfY1RoK
         sggYy4X+kAkcjfERRLyXJg+XwoOAKf8mKT04iTG2rEVFPkCJ0/qeFlPchkVdwV1tIS1B
         YRZzWRvoCO9rr4zorVfdnBsD3p8Kf/2b60y5/Ki8sXkwt/Y52brl+5Ri1PuqUSD9dECe
         M1UYr7AA7KRhPKwuJUV+45mg2ao2CA80CXq8rM7YrS6Z8471zIRwrG1qFf6jYJeugoc5
         w7tsyWdbp+7K75JdJEtNFv0yyjWfDQFAjo6k1AaX0PZhb34Rqj3ECmIgiMgiC9/8B8Bj
         3ImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686761030; x=1689353030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cwxcE8abfYw4UDD2GwaIyR5gbC93lb1+WlKxHZUaJK4=;
        b=RSVEoByHcLfA4M63rz38dLe1JpApiccZ67wVejyyqIOQHBU+uqyXzBUfFyjIBF35G3
         Fq/FJSjFud0oRHEthT653PI02nqqG8LPfDBDUK7j9kBQX39F6LQnYIgwEcGq5itYVcAf
         FPsGnhJQeM4xpuk/QzcZqMVdWHVpiK66ygR8T9aMpTA6pU5wfiTV6Tko9SHReo6fNaHZ
         mR76vf6bsVSB+9WVAQvVCkH2Lj7JoIN9te+K+iv6Y7CaYko/hT7ijW6OlXbX0VGs9vgC
         inHRKjDaZYOzFyl5lBWRbzEbRd7O3BEXvWZtOsclR8d0piOf7WSUhigpV8JS7wEDa6XP
         913g==
X-Gm-Message-State: AC+VfDwRpwlsmA+vlOZCQAuDW2r8epGN1v0V/aiq+S4xIuKOAva/Cn2g
	vJ/FwSOxq3XqpheuV87eQ1eVEHtY7Ob1hxj03GKSsw==
X-Google-Smtp-Source: ACHHUZ5o8sqdC4i4keALJfqNYXtPDam68Ipa/08xsOY3XLPJwD3/x42L275UgzABPRHZJgKAd+xS3V+jUiSWv462VUc=
X-Received: by 2002:ad4:5f8e:0:b0:62a:d642:df29 with SMTP id
 jp14-20020ad45f8e000000b0062ad642df29mr20295870qvb.39.1686761030496; Wed, 14
 Jun 2023 09:43:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOd=qxNfPDo-=bxzyzmY3YmsBtxv686rr9Q_thrfC6ni3eg@mail.gmail.com>
 <262df5fd-d8c4-47aa-a65d-dd79a303a9ca@sirena.org.uk> <dfa85ccc-693b-00cb-a4d9-af32e0dfbed8@collabora.com>
In-Reply-To: <dfa85ccc-693b-00cb-a4d9-af32e0dfbed8@collabora.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 14 Jun 2023 12:43:39 -0400
Message-ID: <CAKwvOd=8eZbQWngCs1V_o9Z8ecd5vx39k=FJUE_P2wuXxu2HXA@mail.gmail.com>
Subject: Re: kernelci: please upgrade clang-17
To: Guillaume Tucker <guillaume.tucker@collabora.com>, Mark Brown <broonie@kernel.org>
Cc: kernelci@lists.linux.dev, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ack - thanks!

On Tue, Jun 13, 2023 at 6:35=E2=80=AFAM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> On 12/06/2023 17:11, Mark Brown wrote:
> > On Fri, Jun 09, 2023 at 01:50:13PM -0700, Nick Desaulniers wrote:
> >> Starting a new thread because gmail cannot handle replying to an email
> >> w/ >45k warnings.
> >> https://lore.kernel.org/llvm/6482b7dd.170a0220.a93c3.9102@mx.google.co=
m/
> >>
> >> instances of -Wbuiltin-macro-redefined have been fixed in ToT llvm.
> >> Updating clang-17 should resolve most of the error spew.
> >>
> >> Does kernel CI update ToT clang builds on a fixed cadence?
> >
> > The containers with the tools should be being rebuilt during the
> > production update which normally happens every Monday.  There's some
> > disruption at the minute due to some infrastructure rebuilding that's
> > going on so today's update of the containers might be delayed.
>
> Yes the LLVM-17 update has now trickled down into production and
> warnings are all gone:
>
>   https://storage.kernelci.org/next/master/next-20230613/arm/multi_v7_def=
config/clang-17/logs/kernel.log
>
> compared with the previous linux-next build which had all the warnings:
>
>   https://storage.kernelci.org/next/master/next-20230609/arm/multi_v7_def=
config/clang-17/logs/kernel.log
>
> We skipped the regular production update last Monday to focus on
> migrating VMs to the new Azure subscription, sorry for the
> inconvenience.  We're back on the regular schedule now.
>
> Thanks,
> Guillaume
>


--=20
Thanks,
~Nick Desaulniers
