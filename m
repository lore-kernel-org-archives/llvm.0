Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8FE15A84A
	for <llvm@lists.linux.dev>; Mon, 16 Sep 2024 16:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726503334; cv=none; b=ddXzdhHLUf57qAvyAPias0sBnb/skCy4yXz2eL906ad3O/HwJlcXRDhO2dRg4RxRRzF3visxgv3bcbI/o2K9JP7jPHOxh5+ETxZa7OdVfecvFLXf11tc3aw5AV1VmZzM19qc89/8s4xfJbeQHxIsDeeWFoP/rssOF6Bkeh6x/LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726503334; c=relaxed/simple;
	bh=CHfKWPhoLol18DWJjUtfaj5l1Pik2/9uMA+WDq8/wKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YH0uO/1WjqwAuvxVKEovbtufryTx3FNbUVglaMXZxfJ/LMgizPpEFGuqNrObGmeeGBImEfpabHIrEqyDxg2FfjRGpuQP85zMjnqkgyFoAQo7vXELeid2+NXw6phOBCtqjmNF02zjdNs2OvMAafCTFfh6Zj32u9erE6DExEMyLWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICgQ6Ys+; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICgQ6Ys+"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2d8741c85bdso860354a91.1
        for <llvm@lists.linux.dev>; Mon, 16 Sep 2024 09:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726503332; x=1727108132; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UdCaaZaGAuNxnOSLC5REDzZqrguiE6BbNpi1q+AVJDM=;
        b=ICgQ6Ys+1wGKigLpPmar4wgdn9XSW6/bLlPXTlr8jcccN9+wJzEGSGBZMjUFDzaQ9+
         trg/dyYzmAHo5Ckw2fHizaI0v/aDuN88eYZ4fS6sib9R92lu8fMd/AxYkbA1QuKE8VtF
         juVhSkfiUo8vfCb2GFstuyXaExR4RaLmMLzhGp0UD2Sj6Z7dyeq1eaZ7p/NfSLAlLM4c
         i9/qdRHHp8mZl8LrKDNagtzTYNHfyNbcrlkMVH56AfFSPuvrj5moICs/nLk/z3vphmKh
         2eJ65bQW327ui90JwafJ1kGmJFscPFxtAg7CdJrlmdyM/EjBEIdv3s2+AZN2OpEzMD0h
         9Lpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726503332; x=1727108132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UdCaaZaGAuNxnOSLC5REDzZqrguiE6BbNpi1q+AVJDM=;
        b=JflDOEWD3dghf19mA/9aev2MeLF4PtEEPcT1XTH2Prvu3pxzKfXnwZzgIrN/YZE630
         meBlmA1w1P2GhFGoMw3KbCCW/2oOCZWC13BVCTr74Au8KD8ecppLn/fVqfKMQwaFERN1
         lX4dOHEWlyCljMZu4arZmtraGdngXfVf6yH0xnrZGj7Bdbyl3iH8wo1+BClvJJQpuZ20
         uvuZr/njcycJL1EVWqYFe1vCu3Pm2VsE7hyv9XP1fyVtYnGEutefTl1y+OtsMhQkO3nL
         FJrCe1q7zbElVW+jct9XMsTvKc7nUNJo9coBFSUbrU7hgyVzq8okW9++z4FnCrckj+aZ
         mHuw==
X-Forwarded-Encrypted: i=1; AJvYcCUt78iH7dCnNzvS7ypb+SUOV6N1viS+L/cZPEaYZrqGgV4SpAvXMMGn3mDrMNATJPvvpSyf@lists.linux.dev
X-Gm-Message-State: AOJu0YwSe7ptStEAX5ia1SKqPg0ndrUGos/NuFGCgK0UkyrTcfx7YHho
	HTsPNRZeb9Ycf1LFp21eVJyFOi5qlQuNnaWUecyEnPDvbTjA3XrGYZs+jlkygWeARu17dgqRhj3
	P2ux8rILKDxgSds6UllfXLTS4RzI=
X-Google-Smtp-Source: AGHT+IFWqKrB/jwwfMGDT0N94zreaBigF9XO/ixKs8bzKIeBFXv7PUaej4KHwjCw+M371MDTiFimmNQTj/1U22Qe65g=
X-Received: by 2002:a17:90a:f308:b0:2db:60b:9be4 with SMTP id
 98e67ed59e1d1-2dba007b059mr7383255a91.7.1726503332118; Mon, 16 Sep 2024
 09:15:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240820194910.187826-1-mmaurer@google.com>
In-Reply-To: <20240820194910.187826-1-mmaurer@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Sep 2024 18:15:19 +0200
Message-ID: <CANiq72mv5E0PvZRW5eAEvqvqj74PH01hcRhLWTouB4z32jTeSA@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Rust KASAN Support
To: Matthew Maurer <mmaurer@google.com>
Cc: andreyknvl@gmail.com, ojeda@kernel.org, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, dvyukov@google.com, aliceryhl@google.com, 
	samitolvanen@google.com, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	glider@google.com, ryabinin.a.a@gmail.com, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 9:49=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> Right now, if we turn on KASAN, Rust code will cause violations because
> it's not enabled properly.
>
> This series:
> 1. Adds flag probe macros for Rust - now that we're setting a minimum rus=
tc
>    version instead of an exact one, these could be useful in general. We =
need
>    them in this patch because we don't set a restriction on which LLVM ru=
stc
>    is using, which is what KASAN actually cares about.
> 2. Makes `rustc` enable the relevant KASAN sanitizer flags when C does.
> 3. Adds a smoke test to the `kasan_test` KUnit suite to check basic
>    integration.
>
> This patch series requires the target.json array support patch [1] as
> the x86_64 target.json file currently produced does not mark itself as KA=
SAN
> capable, and is rebased on top of the KASAN Makefile rewrite [2].

Applied to `rust-next` -- thanks everyone!

    [ Applied empty line nit, removed double empty line,
      applied `rustfmt` and formatted crate comment. - Miguel ]

    [ Applied "SW_TAGS KASAN" nit. - Miguel ]

I think `TMPOUT` needs to be passed though, i.e. like I did in
https://github.com/Rust-for-Linux/linux/pull/1087#issuecomment-2218445303:

diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index 057305eae85c..0ac8679095f4 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -20,6 +20,7 @@ TMPOUT =3D $(if $(KBUILD_EXTMOD),$(firstword
$(KBUILD_EXTMOD))/).tmp_$$$$
 # Exit code chooses option. "$$TMP" serves as a temporary file and is
 # automatically cleaned up.
 try-run =3D $(shell set -e;              \
+       TMPOUT=3D$(TMPOUT);               \
        TMP=3D$(TMPOUT)/tmp;              \
        trap "rm -rf $(TMPOUT)" EXIT;   \
        mkdir -p $(TMPOUT);             \

Or is there something I am missing?

Cheers,
Miguel
