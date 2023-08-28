Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B611FA3
	for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 22:53:30 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-44d3db0f56cso1319664137.2
        for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 15:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693263209; x=1693868009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rPp/OBCbyvFuIsHpW2W/8NQ9YGESVReCdBvNabrZPc=;
        b=PmlCkaLnq/9d+ZnDSOIUY8W62gfd1Q4PDaWiXBTWNtBqBxYKE0gyPz8TTHoby2nbd2
         hw7d1NxYT8IfYsrUgaU4vmdj7yC/f37TtpJKdoKKajqtzT0PxJFhfWfiVvqLdcj36VyQ
         zzRd+gduere0MLd8tVzamhFXpcsOpDoWyG8ITbEttncN9w/gQYVubKGK6R/hk9enDdVc
         KuoAasgQXK6fWagBTZNNNPYuiwZM1ErU/dzEuhbMpEdWCSepeH1B2Sd8lVyra99gSHqa
         AmBGiUfY/IrrFEybNYJsSUxFjFyL5vyEQd09jeisfTE7jMdZ5P+gMQZwwcOt4qBalOEt
         3NbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693263209; x=1693868009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rPp/OBCbyvFuIsHpW2W/8NQ9YGESVReCdBvNabrZPc=;
        b=jt6FtmTAOukuEUXpytEtarBh+Fql5m+F2TBiNNGfYNMSDMfcec1LAoNZfzXkU8vHMn
         guzYp6yHzFVr1vzXTrRjP1LGn9twUMJH+MN2Bl/49cB5gMlvKhiAeN5B8jUFLoLzwJzP
         2aZ7PxDWJ5Y9d70PY2aL7mVhXykEdyKZZlPebZP1ucMHRzLagB/Us6KK+XVjXJZWnjUY
         UaJRDxuyA+zlw1Q5MQ7+3yvRgOQj2BWGQ0acCv9oIUqNFJ57SnvRPIBC9WJEhsgFcmQg
         ZDAXAjCEuGn9lGbPCsnwcwAngLd2hNRoIDabBpLg5S9Afeqld2rKp/NZtlR4e7XYouLh
         yEAA==
X-Gm-Message-State: AOJu0Yy4DAFSS1llIysSLonzM4d3K2D5npVo+Jud12lnHkIjL4Dgxp1e
	kfjP3eYRs3frjktCNz6to4WfHhggoPxhMRaBXXvJTw==
X-Google-Smtp-Source: AGHT+IGrZ5DKqPE2cjwP21nhG3fcsE8gMLdq/0yZ6jUtdfaFjIXOh1d5/lBcvYIomLGq7Sd4rp173jQCHPoyaeaI+uM=
X-Received: by 2002:a67:fb49:0:b0:44e:8e28:284f with SMTP id
 e9-20020a67fb49000000b0044e8e28284fmr11952083vsr.18.1693263208813; Mon, 28
 Aug 2023 15:53:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230828153142.2843753-1-hca@linux.ibm.com> <20230828153142.2843753-2-hca@linux.ibm.com>
 <ZO0j3M8KFWeEznXy@google.com>
In-Reply-To: <ZO0j3M8KFWeEznXy@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 28 Aug 2023 15:53:17 -0700
Message-ID: <CAKwvOd=MG6KdE9fTGBV317s9-RkjcUWednkC1akpODGE2iuvgQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] s390/dasd: fix string length handling
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Jens Axboe <axboe@kernel.dk>, Stefan Haberland <sth@linux.ibm.com>, 
	=?UTF-8?B?SmFuIEjDtnBwbmVy?= <hoeppner@linux.ibm.com>, 
	Peter Oberparleiter <oberpar@linux.ibm.com>, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, nathan@kernel.org, 
	llvm@lists.linux.dev, David Laight <David.Laight@aculab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 28, 2023 at 3:46=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Mon, Aug 28, 2023 at 05:31:42PM +0200, Heiko Carstens wrote:
> > Building dasd_eckd.o with latest clang reveals this bug:
> >
> >     CC      drivers/s390/block/dasd_eckd.o
> >       drivers/s390/block/dasd_eckd.c:1082:3: warning: 'snprintf' will a=
lways be truncated;
> >       specified size is 1, but format string expands to at least 11 [-W=
fortify-source]
> >        1082 |                 snprintf(print_uid, sizeof(*print_uid),
> >             |                 ^
> >       drivers/s390/block/dasd_eckd.c:1087:3: warning: 'snprintf' will a=
lways be truncated;
> >       specified size is 1, but format string expands to at least 10 [-W=
fortify-source]
> >        1087 |                 snprintf(print_uid, sizeof(*print_uid),
> >             |                 ^
> >
> > Fix this by moving and using the existing UID_STRLEN for the arrays
> > that are being written to. Also rename UID_STRLEN to DASD_UID_STRLEN
> > to clarify its scope.
> >
> > Fixes: 23596961b437 ("s390/dasd: split up dasd_eckd_read_conf")
> > Reviewed-by: Peter Oberparleiter <oberpar@linux.ibm.com>
> > Signed-off-by: Heiko Carstens <hca@linux.ibm.com>
>
> Thanks for the patch! Nathan just reported a bunch of these. I took a
> look at these two and thought "yeah that's clearly a bug in the kernel
> sources." Fix LGTM.
>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://github.com/ClangBuiltLinux/linux/issues/1923
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Meant to add:

Tested-by: Nick Desaulniers <ndesaulniers@google.com> # build

>
> I also like David's idea of passing `char ident [DASD_UID_STRLEN]`, too,
> but I don't feel strongly either way.



--=20
Thanks,
~Nick Desaulniers
