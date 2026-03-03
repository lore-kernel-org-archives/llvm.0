Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6677C3537E7
	for <llvm@lists.linux.dev>; Tue,  3 Mar 2026 23:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772580717; cv=pass; b=HI+CJpnJI3ELCNO/CMnDIMYtm9rguvSHGIs6ryd7BOOvyz4qaDwrZlr8bNVQVct02/G9TwUdlaLBwTVaCsZxbUm3JiZ+geD+ApKnSuav6c2eLsKPITBk+apM2tPZ0NKSF59KlMx5Lqm5KkMrUNogvZyHUdgxwp0+TUiD59A9vzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772580717; c=relaxed/simple;
	bh=bofI28OJ76B/B4IckMv6egQDwwMkWPATnXo6F3bO/UU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nJtSk48IPde9AIkJ2rNen33RShiE7OTVPoZorFfIvciIEqFbiFtWdwog+tDGzE/qL+yOLPl3zDeKfpvg5fdcCe1pPDWxuAGVNKXDLYj8Mx3AwftpFx/2hx75pyZtHXJkdMNpefWuB53L9Pwjn/mB1i22441OQMyhkBqh0Y4zH2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NS1XOmk5; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NS1XOmk5"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ae49120e97so117115ad.0
        for <llvm@lists.linux.dev>; Tue, 03 Mar 2026 15:31:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772580716; cv=none;
        d=google.com; s=arc-20240605;
        b=grVrT1ikC4KPsa0u7hytO5tL0EPFqETBNpqxbCrQ6mEv3W9/C3YfBqw2J81EI5V9yo
         kDz7bZfSHl6dcvwuSKmqqqnAi1Gq7e4hEcsAmDzL9wK2pl1kEywptECPult8mo45gMec
         HgnY1DwZ5KVUe/UoymCwRzIF6xeRnCcRh5SG/a0gVOMnVKeu6aNJQpwRX70TPk/unLHx
         1UkeEyAe4Kwg0fi5RA3vIkvDMvPKlY2EvF/1yj5XxeciHGRVkLhJMYdPYf88SnVSZVYG
         yAjKXLN+e65VY0AmUxwnGnvwtnZcM40Jy2iJe0uhxwEMtgmsraTSiVEnDh5KMyPjHIqj
         XK1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZoP5lJCySjDFDGvNofXisL5k6RJclVDwCVopLRWlctE=;
        fh=xYp5mVKkEuDZQD0bOkL9dVwHZoBAmLvP2yB3rBZRGMA=;
        b=cekmJpMk3emVkx56fsZ2PGFmb6njfjJq3Jf0kGZuxx2VZKX66MT4ftyMkM2Bp6KdVr
         QoN83bpszjE0bmk9UvHtuXeUoc6zJtjqfU9JBknfUQCSt/RSgqRrpeH58MOxbGkEHVlT
         7zOxEvx/iYnwuchIYRub/DO9p2a8J+f2tlkquJonxySPBtkFvHKYFUwZcx6LHNI6oTVg
         cWOhvrrTIFyLNTwSCQXN+NNb7tHJ3S5/0PiYUzFrk4uLPwmxpxHw+xNs4ciqB8etFpp6
         exdy5LStLYfgUmNNISpuhsa5NMycSjRyNLh1YIMNFwxMYnJsBYQtvJVm58LxQ+Uo1R0c
         Dtcw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772580716; x=1773185516; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZoP5lJCySjDFDGvNofXisL5k6RJclVDwCVopLRWlctE=;
        b=NS1XOmk5tuBr/bdgLSjuubleDRyCB7DSHHn7AaMGf7PLEcNtKFD/serd5Z91pnqFCy
         CfmZmGoOCda93jWWo/y1Fgz+S2G5YCfZmCdhW3kHz3pejUsHJmwHneQ6U1PIsaoaX1L+
         sJsbu5B80vyxKQ6IzHQwP0b6USfcnNaVx5ZVjODyKi+pOqKjM9jv/bwMJyk60wrFnKBN
         44JzUD0Z9HVz+CFje+dShNs9YSeOiofF7L6PRECjUYdeR7zCMk6ZQL+M0PGBleYoSLD5
         SaFP3SGPtelRIXXVuQylG6cCTifLWKtls16S93GCH/PL201W6ZMWibTQbCXzrp8AphNW
         zNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772580716; x=1773185516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZoP5lJCySjDFDGvNofXisL5k6RJclVDwCVopLRWlctE=;
        b=AUt4Xw6vL/qvXzqHMpITKa1fiWfrOBS42tP/DjeEn4rlsKyqosdw4VBOppF5/+UnDk
         q9t2LSNf86C2I4smCGC+dUQ71x7G1JfJOgQ385pFtx+nFP4yNkV/Djwqxiw82Az1XSgm
         wkJ0xk2Z5HxrL+RMTYiM63b9aKy5AfsRk5le38uTFDAmqQL99HhMz86qeYdULbp7VQHO
         kHn9QM7mCrttrsAPd4qZDQ3nrdcrncTiHf/QmOAiO5DDVLMonc8QTRtlSCqDGxtdYFMP
         twJy93nRcIQ30yiMRqu6ZAE41BOjDDqAQkUU3CNb3L35PF5lsuPsjD5SGdHtrRZ6AbMR
         U5Rw==
X-Forwarded-Encrypted: i=1; AJvYcCX6K5sj8yLy0dLNLRywqSCebQWDRDR2SmgC0sDkXYzxrBfWs9YA70plyPinL1zA/vnLF76w@lists.linux.dev
X-Gm-Message-State: AOJu0YzWxM6k+neD2SpeFBeQISgatPh48oKYFgjQIDo3X0gyOPn+3h85
	a3Jegg5cuqdhHkBgEdRi0fwmQCI92mn2df2HHjKGlRWh+c756jLJv1Dyw2PclQW1q+uLIzaepbJ
	oyQp+mnQdhykoGTaIOEd/4XUQ5v2HKMjOL4XaZx2h
X-Gm-Gg: ATEYQzwwJMQ2Jb7fubDqgy276P/cz9eTcMHg/XIWaq56sZHCL2XqmT1pnUHD8BgmnFO
	Mey8TcTiNm3psj25OOTWiJAcouhkTCYTJCUWv3HyrQ4l0ZSR2nlqINeqCYUTktzXNO8STbw5fqa
	QtwaFrbrGhmJXaYqg2IMJzHlFhQgUSA91zU0vU6pORuSaLppRE1oKW5T+DBhtAwYRgJ0pETh3gd
	+69RlYtzrkR46ivAKEWsQMBOKDKNh+9TPITmTWf1NTeQvuoANYVIAjjhYmdmWUcDx/8+vu7F04f
	RdL7ze55R8QyWytE5MRlB7skuWE/h63N9IlEhA==
X-Received: by 2002:a17:903:244a:b0:2ae:51c1:7ee2 with SMTP id
 d9443c01a7336-2ae51c18afdmr5453565ad.24.1772580715265; Tue, 03 Mar 2026
 15:31:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260303230056.2074898-1-pcc@google.com>
In-Reply-To: <20260303230056.2074898-1-pcc@google.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 3 Mar 2026 15:31:42 -0800
X-Gm-Features: AaiRm53SL-tyeSl7wCDJ6z9QW0IPppvtX-zGyhjceHAreaAvWIBmIxLfEmGkBIo
Message-ID: <CAP-5=fVUv7bJTfyJYheKqXcJFzz3f0-auXYFmOGYfjtCCQSA9A@mail.gmail.com>
Subject: Re: [PATCH] perf llvm: Specify features="+all" for aarch64
To: Peter Collingbourne <pcc@google.com>, James Clark <james.clark@linaro.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 3:01=E2=80=AFPM Peter Collingbourne <pcc@google.com>=
 wrote:
>
> This is consistent with what llvm-objdump does (see [1]) and allows
> the LLVM disassembler to disassemble instructions not in the base
> instruction set.
>
> [1] https://reviews.llvm.org/D127741
>
> Link: https://linux-review.googlesource.com/id/I52e4fef18d2e12b45f875231f=
a9d3efff2538fd4
> Signed-off-by: Peter Collingbourne <pcc@google.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/util/llvm.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/tools/perf/util/llvm.c b/tools/perf/util/llvm.c
> index 87fceae8488a7..44eff99970fe2 100644
> --- a/tools/perf/util/llvm.c
> +++ b/tools/perf/util/llvm.c
> @@ -153,11 +153,17 @@ int symbol__disassemble_llvm(const char *filename, =
struct symbol *sym,
>                                           /*get_op_info=3D*/NULL, symbol_=
lookup_callback);
>         } else {
>                 char triplet[64];
> +               const char *features =3D NULL;
>
>                 scnprintf(triplet, sizeof(triplet), "%s-linux-gnu",
>                           args->arch->name);
> -               disasm =3D LLVMCreateDisasm(triplet, &storage, /*tag_type=
=3D*/0,
> -                                         /*get_op_info=3D*/NULL, symbol_=
lookup_callback);
> +               if (args->arch->id.e_machine =3D=3D EM_AARCH64)
> +                       features =3D "+all";
> +               disasm =3D LLVMCreateDisasmCPUFeatures(triplet, /*cpu=3D*=
/"",
> +                                                    features, &storage,
> +                                                    /*tag_type=3D*/0,
> +                                                    /*get_op_info=3D*/NU=
LL,
> +                                                    symbol_lookup_callba=
ck);
>         }
>
>         if (disasm =3D=3D NULL)
> --
> 2.53.0.473.g4a7958ca14-goog
>
