Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C082715A7
	for <llvm@lists.linux.dev>; Thu, 21 Sep 2023 17:36:39 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-415155b2796so26331cf.1
        for <llvm@lists.linux.dev>; Thu, 21 Sep 2023 10:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695317798; x=1695922598; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oBzLJvv/ftwfpQgrnjlc3wBvEJtehhEbaRaf34rd/Ho=;
        b=hZKOPUtMV/f42czEAt+Z2TEGPRs41nlWyX8r0hDuVUr3ZuMtDSsH4lZCRFniYMvqKE
         q04jbTr3TMTk/je1FUdFegg0isKX72fURSOm0h4UR6CYkPHqsejICyG+40i8tmgkwrkq
         Hi5k+L7vmjgbAFWTLpJRwu9l3Hp4B+rUgGQPYFDsO4a8zo+SZSGMZUD5ZQ3+or0QY555
         u/HF5CpZU7/LsiQoZN6ive7vC1ziQ8GWfzg/4NXybQIFMM/F5DXn7nIkbAX4vvxZIRrq
         gg+TRNtsDG/SlPwd2SO0QmXOW+x6XfMtsVhHbJTGmniqJKzo2c1Tst+pppnJB4vrjuJU
         LAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695317798; x=1695922598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oBzLJvv/ftwfpQgrnjlc3wBvEJtehhEbaRaf34rd/Ho=;
        b=Wp3JGjYnxGUpf447wV96/egdPpUlYm7HZym2WZg+bhouOrfLweW/fYc11NKutQISHB
         cxB8OT3KmbPSWSoDOV/37vZcnfJkAqiX4NXgA4DIGWbHT6mgw9Akq5TvguCDh9iqZuNo
         Z48sQUdJ9T7MyHHUdxPGe7Lv9br/n02exDGlNSX+nxiSV9UeZ5pYgsadjwPgpGzs9WI8
         ue2R87+NZPy9+tq4gFpW5mMXqWjgcY1mUkZntuClr7nbeigQT5WaHfSqSJlncTvcVtds
         M++QA34KNsC8rKS8ubb+Ypdy0/sM+9MeN6mKcOKbh06mAsB5I0DQrzOn2cYZG3b6UYA5
         sDrA==
X-Gm-Message-State: AOJu0YxvMuS2Zb0LhsYGHyJT/tNNw0PyYuoada+N/bMOLoq95RGmq2Kb
	uhImXTcrA2ru4mUXGbq8o2xc6NWI2/ApRvN/BlQiog==
X-Google-Smtp-Source: AGHT+IFx0+0opFSDfHf+E0ps6Y9eB6I1HH/YKUUXQibtMkDSOHXkECPOMU5yz2XJaI8U9lF5aZ4Obhl7U0RkskYPY+U=
X-Received: by 2002:a05:622a:4889:b0:403:96e3:4745 with SMTP id
 fc9-20020a05622a488900b0040396e34745mr341867qtb.20.1695317798407; Thu, 21 Sep
 2023 10:36:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230920001728.1439947-1-maskray@google.com> <20230921072655.GA14803@noisy.programming.kicks-ass.net>
 <CAFP8O3+_8H+fetuoqwwcfqJLNtYmpsWZhY2arD7HMuPmcN+X_g@mail.gmail.com>
 <20230921153537.GG14803@noisy.programming.kicks-ass.net> <CAFP8O3K6Lgxe=Res9d2GKipRYdXqzv3wa_0PLtDcyn7g7H=z5w@mail.gmail.com>
 <20230921171900.GB29413@noisy.programming.kicks-ass.net>
In-Reply-To: <20230921171900.GB29413@noisy.programming.kicks-ass.net>
From: Fangrui Song <maskray@google.com>
Date: Thu, 21 Sep 2023 10:36:27 -0700
Message-ID: <CAFP8O3JpkWTXnxYxa45uANNMQ34g2VUPnfj7-oWn3oq9egUb-A@mail.gmail.com>
Subject: Re: [PATCH] x86/speculation, objtool: Use absolute relocations for annotations
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 10:19=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Thu, Sep 21, 2023 at 09:26:43AM -0700, Fangrui Song wrote:
>
> > I do not see why absolute things need 12 byte entries.
> > We can freely use `.long .text.foo` even in ELFCLASS64 object files.
> > There is no risk of overflow (the ultimate link .text.foo may have an
> > address of 0xffffffff........) since the section will be discarded.
>
> And you're sure no toolchain is going to be clever and tell me that the
> absolute relocation will want to be 8 bytes and does not fit in the 4
> bytes allotted?
> Because clearly that is something some clever assembler is going to
> complain about any day now.

Well, only if the clever assembler doesn't support 32-bit absolute
relocation for a 64-bit architecture.
I don't know such an architecture. In addition, as long as the
architecture intends to support DWARF32, it has to support 32-bit
absolute relocations for a 64-bit architecture.

Of course, I cannot predict new toolchains for new architectures from
doing insensible thing, but
DWARF32 support and other metadata section uses are pretty strong
arguments for them to add a 32-bit absolute relocation type.

Note: some .discard.* sections before commit 1c0c1faf5692 ("objtool:
Use relative pointers for annotations") used
absolute relocations.



--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
