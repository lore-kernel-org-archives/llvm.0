Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4753E488
	for <llvm@lists.linux.dev>; Wed, 20 Sep 2023 16:57:32 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-773ac11de71so386760885a.2
        for <llvm@lists.linux.dev>; Wed, 20 Sep 2023 09:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695229051; x=1695833851; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rE6msmUqmGcfVIIk5iKjgmbNuSZmm7Q5B7TAvprOzeg=;
        b=pPgy8ndkWR05VRLUh+n/DYA3sBrKut8p+90swkDWsPIdv9bd+2Y6LjnlHFgZ9MR/l/
         NTAGIJ6ELYI6ubJQa5CVu/fGIdNM/dteKn9mAo6EJbjiDNsg7KmgtrYKa1n/NTR/HJ1l
         0G2MG8HheXtqmbb3lhrS1CPuhKqt5raV7oJ1VaXYLFn2GJUHbHJT3257XEqi4m5CYIFT
         nmvgCqZ78i78Roq29+vYQY3xWbaaElwvn3SSZz3aoFhy5ALo5Ps7qEqhlpjMQXIvq3Sj
         PWl8iunlAXceH3PHNQrVElA1RuhTmyp9vM+apFv9O2anMsLcNqMdrAo/WDamWm94znJR
         Qjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695229051; x=1695833851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rE6msmUqmGcfVIIk5iKjgmbNuSZmm7Q5B7TAvprOzeg=;
        b=MgROjchqTEb1btplKjM1S6hU0MOl8s1IpC7+IOarLrDDIG+GcSdOqXNF+VGNshzaKc
         odj1tusBU4CItUfle52v+uGlUqtmqN9j7DaLYCCzhRLDOvsG92fDesGoKCO0zlFdwxOR
         hpPCfQMSQYJVhyrX4SeIgI47Nrc2c8rZycmnuz8cW4wYhHUBHMOAZeFa0UAjIdoLiESZ
         R2L/KS36oLT7p8dj0sV6Wqg3iLwBokqZTZ/p/5Nr7SmIorPMuoxD9NxFYoC8kyE1kNA5
         u0kZ7KFFr3KE0yrOX2Nzc7uPeX5ZgeIujxilt964w4TnoXNNFahSlpbEIH0B0fSl+M/h
         S+wQ==
X-Gm-Message-State: AOJu0YzlkRZlz2zbuahKwxL4A0iHHinKUV8EB/3YGV69rwc2CLNZNXV8
	PMs82yltD9ZtVHkuyohn1N+0EaX3Ud7nc3yqE+3bhg==
X-Google-Smtp-Source: AGHT+IH1Mgmwmw/RXkmel6yA1q5k12TlxQn+FD3HEwMcGWZoHvHTjly0JMF75R4tNml/EEPhv3kAJr88IyhrJZFpptY=
X-Received: by 2002:a05:6214:4185:b0:658:708c:4d56 with SMTP id
 ld5-20020a056214418500b00658708c4d56mr3087170qvb.17.1695229051379; Wed, 20
 Sep 2023 09:57:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHRSSEzrL6uPEvrhW692=+=17EJt+6_-p2z0K5esG4Ff57MSpw@mail.gmail.com>
 <a94cd4e0-7092-04fb-9b89-da236bfec57f@collabora.com> <CAHRSSEzMo=-eS8KRqHjSMcBqWCsK2mU4zWg=5KFYx2XyL29Z0w@mail.gmail.com>
 <CAHRSSEzasi7ZRSe3t_ij26cYCc_58eALNn_mMn6B5HFqEbU9EQ@mail.gmail.com>
 <ffab5719-e6f4-4e21-1095-c129928076af@collabora.com> <CAHRSSEzo0cSQCp_zk4h2BP2EGdqVHSbZOLC-3gf7c6+uOK9R4g@mail.gmail.com>
 <CAHRSSEw6Vv+3R0OOva8qY3pF-00TZdQku3MxN2OFSaZkN2di+Q@mail.gmail.com>
 <CAKwvOdmni7Vqo0W1qgGkVx8GH4+D7JXO5QTQgqGv8D=Go4oPAA@mail.gmail.com>
 <CAHRSSEz=S_c=KmgDNL_FenUJ25jLmwKe-QXo7-_nUC-7avD0Gg@mail.gmail.com>
 <CAKwvOdkHE7rXgOUyUSCKZ690bjV88E9yVfmG-7vLH6iqqr2G-Q@mail.gmail.com> <CAHRSSEzD=nMKjnmJxsGuPdMy2iqc-jxcppna_eKOb8PH0SQOXA@mail.gmail.com>
In-Reply-To: <CAHRSSEzD=nMKjnmJxsGuPdMy2iqc-jxcppna_eKOb8PH0SQOXA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 20 Sep 2023 09:57:20 -0700
Message-ID: <CAKwvOdk5qut5-EX9N2eJQ7KiaUNFv4CBo_Hh2BJOD+bnupKvQA@mail.gmail.com>
Subject: Re: Please add new Android branches
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Viktor Martensson <vmartensson@google.com>, Betty Zhou <bettyzhou@google.com>, 
	kernelci@lists.linux.dev, clang-built-linux <llvm@lists.linux.dev>, 
	Todd Kjos <tkjos@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 5:12=E2=80=AFPM Todd Kjos <tkjos@google.com> wrote:
>
> On Tue, Sep 19, 2023 at 4:19=E2=80=AFPM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > Half of the red exclamation marks on that link are are "0 warnings - 0
> > errors".  What's up with that?
>
> This more recent build has "0 warnings - 0 errors":
> https://linux.kernelci.org/build/android/branch/android15-6.1/kernel/ASB-=
2023-07-05_14-6.1-2620-gf2d0380464d3/
>
> Here is the error (not sure why it bubbled up as 0/0):
>
>   AR      drivers/base/power/built-in.a
> ../fs/namei.c:2172:13: error: use of bitwise '|' with boolean operands
> [-Werror,-Wbitwise-instead-of-logical]
>         } while (!(has_zero(a, &adata, &constants) | has_zero(b,
> &bdata, &constants)));
>
> ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>                                                    ||
> ../fs/namei.c:2172:13: note: cast one or both operands to int to
> silence this warning
>   CC      drivers/base/firmware_loader/builtin/main.o
> 1 error generated.
> make[3]: *** [../scripts/Makefile.build:250: fs/namei.o] Error 1
> make[3]: *** Waiting for unfinished jobs....
> make[2]: *** [../scripts/Makefile.build:500: fs] Error 2

Guillaume,
Any idea what's up with that? Seems like the existence of diagnostics
is detected correctly; the number of warnings and errors is not.


--=20
Thanks,
~Nick Desaulniers
