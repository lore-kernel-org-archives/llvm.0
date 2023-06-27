Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C685F4A27
	for <llvm@lists.linux.dev>; Tue, 27 Jun 2023 19:53:16 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-40079620a83so67971cf.0
        for <llvm@lists.linux.dev>; Tue, 27 Jun 2023 12:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687895595; x=1690487595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLuI5nD00PYdmR0TV738RD1rmcrLwafP6/VBiaRjU1Q=;
        b=cSzqkm1d1b4AFhkJhViS8sDaJIf+PxUmJXSE1RGhTP6iCCCv38N0BIynlZA09gF4vP
         CpD6cB948INT3shzg+B7IOADAv1mqcb/d284GyeFR7u9Nxq4fDQ/N55DBiaX1FAvlzfk
         Diqjm5prhKaUtRZovQzs1wF6v5Q6+/PTGp2bJ1qMeOcIgAPHCQA7qRmQdIafxnNqmWqw
         MmjY3XWZjlu7Udq8ZL4PTQmd0SnSMlK0whx7TLERo3Mx3XYKbbGU17QRSaLVpQvt3Swx
         Vpc3OrS2B1C1fo8P7o8jU3KS9Lj2Cj+HHmHBerMNwmv6JLhJCO1FQ9ZNhdOIV5ceoHUs
         sJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687895595; x=1690487595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLuI5nD00PYdmR0TV738RD1rmcrLwafP6/VBiaRjU1Q=;
        b=EHo1iulGI2hINvgCm+1KlEUl6bQsonoelZIRpiOozaJof/43CDmuOdmfUhX5n3Hf3G
         EfaV/NBExNt1RwR8mKgcs6yjXXx8gD4dsuddtiaqnJEanjPCpDbYggu8sJDiQ9EBn3vj
         DxAAgyu/6KMtoDLJyIbN4xEnR5fxn9jNvBkZdavSROmlC/AoxkQ/8y+SUhSg0fQryqnN
         0AKrHmd1KvzRaSinp15/0D40cOobX98gbeoMPBl7ZUg/QfKTxN7SQ6Mf7u+O6GNdHL0E
         IRPmz4Iqf1StGakZ9TEG71ArYrqSpdhiUxnHlmvF1TUF3mjiTwY2TE5W5FAODn6uDF9m
         4Wpg==
X-Gm-Message-State: AC+VfDxL5AtwUXt7NxbTHF20dfbwEUcd6qUl+H7ALs0d7WTrpiE0gaL1
	Qks0cmdlP/SglS1gn+NVXXBRYvm3ILa6vpycba7dJw==
X-Google-Smtp-Source: ACHHUZ4WywyCYGtPMuvdFcpW2dqCRu0tWKd63P8E6CytwoFeUoTgkNgf73pWryoHaPsc+KPEWJlGKZA+hMjAqZ0nE+U=
X-Received: by 2002:a05:622a:285:b0:3f8:175a:4970 with SMTP id
 z5-20020a05622a028500b003f8175a4970mr37184qtw.18.1687895595463; Tue, 27 Jun
 2023 12:53:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230624002708.1907962-1-maskray@google.com> <ff7c875a-8893-9b7d-e2fa-200f1601e666@meta.com>
 <CAM9d7cjyKmKk+z1z8qatjaC7xwwJa_PFE0DJzJ=_mFjS6taz_A@mail.gmail.com>
In-Reply-To: <CAM9d7cjyKmKk+z1z8qatjaC7xwwJa_PFE0DJzJ=_mFjS6taz_A@mail.gmail.com>
From: Fangrui Song <maskray@google.com>
Date: Tue, 27 Jun 2023 12:53:04 -0700
Message-ID: <CAFP8O3L_fGJWAcNEhFGBZF4mRi6ObOyupto5o4z80Zaa3x7PDw@mail.gmail.com>
Subject: Re: [PATCH] perf: Replace deprecated -target with --target= for Clang
To: Namhyung Kim <namhyung@gmail.com>
Cc: Yonghong Song <yhs@meta.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 27, 2023 at 12:29=E2=80=AFPM Namhyung Kim <namhyung@gmail.com> =
wrote:
>
> Hi Fangui and Yonghong,
>
> On Sun, Jun 25, 2023 at 11:25=E2=80=AFAM Yonghong Song <yhs@meta.com> wro=
te:
> >
> >
> >
> > On 6/23/23 5:27 PM, Fangrui Song wrote:
> > > -target has been deprecated since Clang 3.4 in 2013. Use the preferre=
d
> > > --target=3Dbpf form instead. This matches how we use --target=3D in
> > > scripts/Makefile.clang.
> > >
> > > Link: https://github.com/llvm/llvm-project/commit/274b6f0c87a6a1798de=
0a68135afc7f95def6277
> > > Signed-off-by: Fangrui Song <maskray@google.com>
> >
> > Acked-by: Yonghong Song <yhs@fb.com>
>
> After 10 years of deprecation, time to change. :)
>
> Applied to perf-tools-next, thanks!

Thank you!


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
