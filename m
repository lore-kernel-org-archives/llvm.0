Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDD618E35
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 15:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FzpKPAkg"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5032a508e74so6522e87.1
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 08:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696866337; x=1697471137; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfVtaRDig7D+Ty8+FieODZ141554VQ+ssPrPXjaViV4=;
        b=FzpKPAkgYu2EFm/x+J6hELZRHnxDfxm1wOElkIYE5ZwaZP/Yd6pZo3gJkvSfeJo5vk
         dsUZdy1M2NGDgLi9LlEYYaaDxa2NXmGoh/VDasegkIOvUniSQHhU6aVvo5p55Esx1yOu
         aNrxmtKNyBYpVuBm4M0ZdnrsbWMCpaco8vlX+x23pIHX0h6YSeGliVVhaULDWPRPdw10
         ISuvn9ebNqXzgOZ/hitJxKmn7mFsFddAf80Lg2quIkhB8KqHIT8GXxek0boMqif354/x
         wDRIEn3j9YNONC6n7YdtD82PqXQZ+rZqofYKKzwAc0700kPE7/oXSOid2JCZqRAehvaU
         4hPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696866337; x=1697471137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TfVtaRDig7D+Ty8+FieODZ141554VQ+ssPrPXjaViV4=;
        b=E/FLZXArq8Q2MtNFjMN1/ylsJDNfsfqX9/xYRoVIOcBsf6O57qqE/ivcrwBOg3D3oE
         eUdX5roA38HmJjPy7fCf/qyh5Kj6KYO0KYVldYEIGj/8zZKy7QgptiRc3rOmdPU56bL7
         keNVF8ocKm+berjz1sXoT05yLFTXJ3IFAYGUEZ1EA0F0iQCdIWhkrJJl+8HEImEyo5RH
         2rOlu67I1nkWgwaOAviX2Bo0zeEIkDoBWcMMPzIZFFz9mnIh2KldTwqACyQKuoGOnZk/
         4sUodK+4de4ayRH4K4E72RSJrqJaUYnFyunX7LStEcSzmb70LlBcPh/uazbigq/eJopc
         dWiQ==
X-Gm-Message-State: AOJu0YwQRIs6TsdCxoZDwvwkJZauzKnLyK7jf6BEA0rrlDrAv8FwrJfN
	HCO+ih6T7r8Nr1DigB5r/GwWRAtbFclIbP4+gmekyw==
X-Google-Smtp-Source: AGHT+IHyqimkAN/ZGin5q4+q2QxBs1Lei/HTv3/YCpCfU6KTN/Jvvy/WxyiYZnOsxUwM84s6ifYLH255oUoVtofxu+M=
X-Received: by 2002:ac2:51a5:0:b0:501:a2b9:6046 with SMTP id
 f5-20020ac251a5000000b00501a2b96046mr220584lfk.7.1696866336692; Mon, 09 Oct
 2023 08:45:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231005230851.3666908-1-irogers@google.com> <20231005230851.3666908-5-irogers@google.com>
 <CAM9d7ch4SLLbORdhkanCoPQZX=f-p-HxsYX2YWYbtLR4beD4wg@mail.gmail.com>
In-Reply-To: <CAM9d7ch4SLLbORdhkanCoPQZX=f-p-HxsYX2YWYbtLR4beD4wg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Oct 2023 08:45:25 -0700
Message-ID: <CAP-5=fXtx20VWAVpxAB-HHONx-8MUQKyFm9iSf7ohNBhoESoYg@mail.gmail.com>
Subject: Re: [PATCH v2 04/18] perf hisi-ptt: Fix potential memory leak
To: Namhyung Kim <namhyung@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Ming Wang <wangming01@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Yanteng Si <siyanteng@loongson.cn>, 
	Yuan Can <yuancan@huawei.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	James Clark <james.clark@arm.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 8, 2023 at 10:41=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Thu, Oct 5, 2023 at 4:09=E2=80=AFPM Ian Rogers <irogers@google.com> wr=
ote:
> >
> > Fix clang-tidy found potential memory leak and unread value:
> > ```
> > tools/perf/util/hisi-ptt.c:108:3: warning: Value stored to 'data_offset=
' is never read [clang-analyzer-deadcode.DeadStores]
> >                 data_offset =3D 0;
> >                 ^             ~
> > tools/perf/util/hisi-ptt.c:108:3: note: Value stored to 'data_offset' i=
s never read
> >                 data_offset =3D 0;
> >                 ^             ~
> > tools/perf/util/hisi-ptt.c:112:12: warning: Potential leak of memory po=
inted to by 'data' [clang-analyzer-unix.Malloc]
> >                         return -errno;
> >                                 ^
> > /usr/include/errno.h:38:18: note: expanded from macro 'errno'
> >                  ^
> > tools/perf/util/hisi-ptt.c:100:15: note: Memory is allocated
> >         void *data =3D malloc(size);
> >                      ^~~~~~~~~~~~
> > tools/perf/util/hisi-ptt.c:104:6: note: Assuming 'data' is non-null
> >         if (!data)
> >             ^~~~~
> > tools/perf/util/hisi-ptt.c:104:2: note: Taking false branch
> >         if (!data)
> >         ^
> > tools/perf/util/hisi-ptt.c:107:6: note: Assuming the condition is false
> >         if (perf_data__is_pipe(session->data)) {
> >             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > tools/perf/util/hisi-ptt.c:107:2: note: Taking false branch
> >         if (perf_data__is_pipe(session->data)) {
> >         ^
> > tools/perf/util/hisi-ptt.c:111:7: note: Assuming the condition is true
> >                 if (data_offset =3D=3D -1)
> >                     ^~~~~~~~~~~~~~~~~
> > tools/perf/util/hisi-ptt.c:111:3: note: Taking true branch
> >                 if (data_offset =3D=3D -1)
> >                 ^
> > tools/perf/util/hisi-ptt.c:112:12: note: Potential leak of memory point=
ed to by 'data'
> >                         return -errno;
> >                                 ^
> > /usr/include/errno.h:38:18: note: expanded from macro 'errno'
> > ```
>
> We already have
>
>   https://lore.kernel.org/r/20230930072719.1267784-1-visitorckw@gmail.com

Agreed. There is a written to but not read addressed in this one, but
I think that is okay to clean up later and to drop this patch.

Thanks,
Ian

> Thanks,
> Namhyung
>
>
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/util/hisi-ptt.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/tools/perf/util/hisi-ptt.c b/tools/perf/util/hisi-ptt.c
> > index 45b614bb73bf..ea297329c526 100644
> > --- a/tools/perf/util/hisi-ptt.c
> > +++ b/tools/perf/util/hisi-ptt.c
> > @@ -98,18 +98,18 @@ static int hisi_ptt_process_auxtrace_event(struct p=
erf_session *session,
> >         int fd =3D perf_data__fd(session->data);
> >         int size =3D event->auxtrace.size;
> >         void *data =3D malloc(size);
> > -       off_t data_offset;
> >         int err;
> >
> >         if (!data)
> >                 return -errno;
> >
> > -       if (perf_data__is_pipe(session->data)) {
> > -               data_offset =3D 0;
> > -       } else {
> > -               data_offset =3D lseek(fd, 0, SEEK_CUR);
> > -               if (data_offset =3D=3D -1)
> > +       if (!perf_data__is_pipe(session->data)) {
> > +               off_t data_offset =3D lseek(fd, 0, SEEK_CUR);
> > +
> > +               if (data_offset =3D=3D -1) {
> > +                       free(data);
> >                         return -errno;
> > +               }
> >         }
> >
> >         err =3D readn(fd, data, size);
> > --
> > 2.42.0.609.gbb76f46606-goog
> >
