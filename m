Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23022C82
	for <llvm@lists.linux.dev>; Thu, 28 Oct 2021 22:26:29 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id d63so10188994iof.4
        for <llvm@lists.linux.dev>; Thu, 28 Oct 2021 15:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=69slPYPdxoIP5E1pXozkkOSJJNlQJg/ZybGsQcAlQjU=;
        b=ZvebgKH3pRDT+eHN8yyyqshk7Xwtu0s+RNmQNKAF4bGCFh8HihuoQwIeVuENvHdO95
         K4pfwh4RoUL60H8qNDvbEG+LIbiwhhNCY6AB8N/i63ofgqTMFXz5RCgUwqZQt813ldX8
         xl34jWj15whFLfTX5t4DCQ8y4p545xs63NbwFJlDgG2CyVMvsV+6DPaoKl7czrrymczA
         TkUHOP80lNP15DfhPKvonioyjWR3HaLSrut5ke4tpWu3vINXuVvw27Jal3DQZ+tk+Gtt
         hX0IEZtROh08TtZN4+4mGfm11giUEgwoWxwtDIbMMyyM2KZbz9hRdDivvc2guFYXj9Pj
         N72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=69slPYPdxoIP5E1pXozkkOSJJNlQJg/ZybGsQcAlQjU=;
        b=zjPkwXZpvWZjYkJf8Z6X6Oo1Usb1mgDCl/XMYt25xoWejPtMBJqUS5DN9M4Y9te44s
         4GRADmev8rUvJttBvuOE8dkUjvzUw5r3rvVoEe04IG9uI6HDKpOVF9MvDMKsjTR+ILHe
         CbpSdnPu8l1c+JjwK4Gb9Lmk2HGedPHew8anC0cLaW33jxkc02B5FMSNQKA0QuUeIz1T
         VaJSaHnoQDjt5X/Z01dvo/k4HxcdTMQ7y3CQFNrfiL64qlzkcBw9YStNJcR4afyal7Vt
         uyAhk7fLaI/j5jc0xEaELkdG9j5LhEUbX477JF0uaqgoz4przvoZJkRZuqYqTKr3G3yy
         VC7A==
X-Gm-Message-State: AOAM530WS8CudcvBjBm5So5/daQoy4/JcoB8fZxy2MJqHHUzGo/PAkoX
	Y1ABX4abJo1SPDglZAzVqYiMT4sNu2YlAlFHFxhRWA==
X-Google-Smtp-Source: ABdhPJzNqekMMxyk/B5nOTuy7BzBzfXpYdqoOl1hZ7GQRZVBtPFvvGSBBp2ksLmDaN2z5nG15SHOxsvOfYayG4y1uoE=
X-Received: by 2002:a05:6602:13d3:: with SMTP id o19mr4969665iov.18.1635459988715;
 Thu, 28 Oct 2021 15:26:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211012021321.291635-1-irogers@google.com> <CAFP8O3L_Oi916yOAuPB7MFpa3QoDQtreRbV7oNt2Yh6h1Coq9A@mail.gmail.com>
In-Reply-To: <CAFP8O3L_Oi916yOAuPB7MFpa3QoDQtreRbV7oNt2Yh6h1Coq9A@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 28 Oct 2021 15:26:16 -0700
Message-ID: <CAP-5=fU_Zf4w2K-uEM40Wr0o-v6O+3vQTfEjAJu842HdyotZHw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] tools: Bump minimum LLVM C++ std to GNU++14
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, 
	Namhyung Kim <namhyung@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Leo Yan <leo.yan@linaro.org>, Michael Petlan <mpetlan@redhat.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnaldo,

Is there anything you'd like me to do extra for these two patches?

Thanks,
Ian

On Mon, Oct 11, 2021 at 8:09 PM F=C4=81ng-ru=C3=AC S=C3=B2ng <maskray@googl=
e.com> wrote:
>
> On Mon, Oct 11, 2021 at 7:13 PM Ian Rogers <irogers@google.com> wrote:
> >
> > LLVM 9 (current release is LLVM 13) moved the minimum C++ version to
> > GNU++14. Bump the version numbers in the feature test and perf build.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
>
>
> Reviewed-by: Fangrui Song <maskray@google.com>
