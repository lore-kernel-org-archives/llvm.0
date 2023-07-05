Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC552F38
	for <llvm@lists.linux.dev>; Wed,  5 Jul 2023 20:42:27 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-634efb81e8dso732096d6.1
        for <llvm@lists.linux.dev>; Wed, 05 Jul 2023 13:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688589746; x=1691181746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9IOBh2dErzq5pc0UHadZ7sAXf6kWe3n0/dn9RfHGYo=;
        b=dh4WoR3tlKTcrXQJem35j9FNYUIenpsZPsRsu3o2yL/euzR3wgpNzFqRsyPvjtniX9
         BGsTSgz5HwMiKXmztwf6HK4vEMBgpB3lkyj2Cz211Vf4iA518z0wdqt9dCU0H2kDwDO7
         0tDgNaFk3pNdxVbcagamldZztzPyJDuioE1zv9d4+rARk5gQ3SJC+ChUBasjRWHRlwe3
         D126qlNKwo+q/dkpU41pQ2FTa+o3P/2ij5eqp4c71aNUxifzhGntBeO1zSGWy1Je06Kx
         1FuuX3Tky8IM1L5vLiI/e3mB66822aXFocZSTtzWT5cFoQ9Pq3Nn0sUAB/1QwATZD6N+
         M+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688589746; x=1691181746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k9IOBh2dErzq5pc0UHadZ7sAXf6kWe3n0/dn9RfHGYo=;
        b=RALqZHZGKwiWK+Yt6WHH8zADkNCMrCig5djS2yjREzBCzgihwpn16gXU8KgvdtryvP
         Xp0CFSekv+RrogmIzbTKPMELELpa7AKGikuPeTsFMLCo53gfZ14cW0uMZqXjpjecX8H7
         Y1I3PXnDY+WQpKAmzRzs8645hwu06DnKDE4H5BAdLl07If58fqrux1aJZRcPJBRSafPb
         dpKm9OlmPWDNZ0JlRmUP46HW6qpdLwCVGsMfOwwZaTfgOP6KhmDOBSR9Fbmx95Q9tBTm
         jMqBGyi23htvFRQMGx8siKLYwlzBuGxkYucMxj08rjXpqRHKiZfF/x5+hpGue5W7xPKq
         zICw==
X-Gm-Message-State: ABy/qLa4wzVaKh5xOyKGPgYk4FKd3HvlekvsnLGJh/OtWUyL+hAk0VNq
	pxGmjVtL1opRx3X/30HjtpJCt1yLwG4Rz2S8NSRQ7Q==
X-Google-Smtp-Source: APBJJlGWRpwfhA4itLA+4UG2F5/nsuTLfZv6whI8ChgzNcaYXQwv2I0wbKEv2ceM7nlvKMw4nMyhYlyjVDw07pw7s9E=
X-Received: by 2002:a05:6214:b6c:b0:636:cc82:8cb4 with SMTP id
 ey12-20020a0562140b6c00b00636cc828cb4mr12099439qvb.33.1688589746277; Wed, 05
 Jul 2023 13:42:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230629234244.1752366-8-samitolvanen@google.com> <20230630-phrasing-strung-12e53988ad81@spud>
In-Reply-To: <20230630-phrasing-strung-12e53988ad81@spud>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 5 Jul 2023 13:41:49 -0700
Message-ID: <CABCJKue+4E7mbzkZqsUYzwUf9VY4+nY6+5E1aF_XyQito_399g@mail.gmail.com>
Subject: Re: [PATCH 0/6] riscv: KCFI support
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Fri, Jun 30, 2023 at 11:48=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> Hey Sami,
>
> On Thu, Jun 29, 2023 at 11:42:45PM +0000, Sami Tolvanen wrote:
> > This series adds KCFI support for RISC-V. KCFI is a fine-grained
> > forward-edge control-flow integrity scheme supported in Clang >=3D16,
> > which ensures indirect calls in instrumented code can only branch to
> > functions whose type matches the function pointer type, thus making
> > code reuse attacks more difficult.
>
> > base-commit: c6b0271053e7a5ae57511363213777f706b60489
>
> Could you please rebase this on top of v6.5-rc1 when that comes out?
> This base-commit is some random commit from Linus' tree, that because we
> are currently in the merge window has is not in the RISC-V trees yet,
> and means the series wasn't applied by our CI stuff.

Sure, I'll send v2 rebased on top of -rc1 once it's out. The random
commit was the ToT at the time this series was sent out.

Sami
