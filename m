Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4561FC5
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 05:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1c9a1762b43so1852505ad.1
        for <llvm@lists.linux.dev>; Sun, 08 Oct 2023 22:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696830111; x=1697434911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RX7tLaR5cxlZGvCt5yVuBVmtnOHN5nH9geYt6ELosk=;
        b=B07exWjkW04NSGCtnIdSkKOZMvZ/pZZHVjC7o+WEO+63QH1d/btodO5v0wD4c3B/DE
         45l5mPCKtNGSWNP5TmoEc8VtKd7BD5Yc3uCINAqEFzhBoA6pqnRNRzF3RblAkfvJU2cg
         SRYx8WWybhpq4Mp/NWDZfZ4dvzQaOK3iPUhk7m5Y+h1l6Mh2SsElFvA52zidDEsqPTpl
         xajs1Nxo/LN0Y15G3v9qgsbgNyUbtxquD4eLu61+CqUFNQjkIFdfiU95opyevRLagUxx
         fBqlMOu+ORscjCnEUEjCyVTnGnOkwoJvgb1FLDDBe1pbYmf0MQywsUCuFfDtra8IosbW
         2VWg==
X-Gm-Message-State: AOJu0YzILqg1V2wMK02nOTmk9/Hoee8tIGKbh/2IYmutbjntDOVlpa5T
	SNajAG2yXBd0roIzDM+E6OP2hjAKAR0PQEH4F3I=
X-Google-Smtp-Source: AGHT+IGE0tedBFfLbmKhVN5DwRDxqT1mpIyYE7VWdPjl5uPqunimpunTgmJdNT28U9fMQdA+O0b56HxncBIqBMuQf5M=
X-Received: by 2002:a17:90b:3e87:b0:274:755b:63b8 with SMTP id
 rj7-20020a17090b3e8700b00274755b63b8mr14069468pjb.43.1696830111351; Sun, 08
 Oct 2023 22:41:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231005230851.3666908-1-irogers@google.com> <20231005230851.3666908-5-irogers@google.com>
In-Reply-To: <20231005230851.3666908-5-irogers@google.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Sun, 8 Oct 2023 22:41:40 -0700
Message-ID: <CAM9d7ch4SLLbORdhkanCoPQZX=f-p-HxsYX2YWYbtLR4beD4wg@mail.gmail.com>
Subject: Re: [PATCH v2 04/18] perf hisi-ptt: Fix potential memory leak
To: Ian Rogers <irogers@google.com>
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

On Thu, Oct 5, 2023 at 4:09=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
>
> Fix clang-tidy found potential memory leak and unread value:
> ```
> tools/perf/util/hisi-ptt.c:108:3: warning: Value stored to 'data_offset' =
is never read [clang-analyzer-deadcode.DeadStores]
>                 data_offset =3D 0;
>                 ^             ~
> tools/perf/util/hisi-ptt.c:108:3: note: Value stored to 'data_offset' is =
never read
>                 data_offset =3D 0;
>                 ^             ~
> tools/perf/util/hisi-ptt.c:112:12: warning: Potential leak of memory poin=
ted to by 'data' [clang-analyzer-unix.Malloc]
>                         return -errno;
>                                 ^
> /usr/include/errno.h:38:18: note: expanded from macro 'errno'
>                  ^
> tools/perf/util/hisi-ptt.c:100:15: note: Memory is allocated
>         void *data =3D malloc(size);
>                      ^~~~~~~~~~~~
> tools/perf/util/hisi-ptt.c:104:6: note: Assuming 'data' is non-null
>         if (!data)
>             ^~~~~
> tools/perf/util/hisi-ptt.c:104:2: note: Taking false branch
>         if (!data)
>         ^
> tools/perf/util/hisi-ptt.c:107:6: note: Assuming the condition is false
>         if (perf_data__is_pipe(session->data)) {
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> tools/perf/util/hisi-ptt.c:107:2: note: Taking false branch
>         if (perf_data__is_pipe(session->data)) {
>         ^
> tools/perf/util/hisi-ptt.c:111:7: note: Assuming the condition is true
>                 if (data_offset =3D=3D -1)
>                     ^~~~~~~~~~~~~~~~~
> tools/perf/util/hisi-ptt.c:111:3: note: Taking true branch
>                 if (data_offset =3D=3D -1)
>                 ^
> tools/perf/util/hisi-ptt.c:112:12: note: Potential leak of memory pointed=
 to by 'data'
>                         return -errno;
>                                 ^
> /usr/include/errno.h:38:18: note: expanded from macro 'errno'
> ```

We already have

  https://lore.kernel.org/r/20230930072719.1267784-1-visitorckw@gmail.com

Thanks,
Namhyung


>
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/util/hisi-ptt.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/tools/perf/util/hisi-ptt.c b/tools/perf/util/hisi-ptt.c
> index 45b614bb73bf..ea297329c526 100644
> --- a/tools/perf/util/hisi-ptt.c
> +++ b/tools/perf/util/hisi-ptt.c
> @@ -98,18 +98,18 @@ static int hisi_ptt_process_auxtrace_event(struct per=
f_session *session,
>         int fd =3D perf_data__fd(session->data);
>         int size =3D event->auxtrace.size;
>         void *data =3D malloc(size);
> -       off_t data_offset;
>         int err;
>
>         if (!data)
>                 return -errno;
>
> -       if (perf_data__is_pipe(session->data)) {
> -               data_offset =3D 0;
> -       } else {
> -               data_offset =3D lseek(fd, 0, SEEK_CUR);
> -               if (data_offset =3D=3D -1)
> +       if (!perf_data__is_pipe(session->data)) {
> +               off_t data_offset =3D lseek(fd, 0, SEEK_CUR);
> +
> +               if (data_offset =3D=3D -1) {
> +                       free(data);
>                         return -errno;
> +               }
>         }
>
>         err =3D readn(fd, data, size);
> --
> 2.42.0.609.gbb76f46606-goog
>
