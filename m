Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF588AD47
	for <llvm@lists.linux.dev>; Thu,  6 Apr 2023 20:03:09 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-545e907790fso644620847b3.3
        for <llvm@lists.linux.dev>; Thu, 06 Apr 2023 13:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680811389; x=1683403389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFrdCeDCOJkHQGDyFu7yRUwnrgoVUUx7k0c1Neje6RM=;
        b=fkVai4FnC0lB+EnDg9FQsFrd/PbAgdmTtU6AOiIa8YwIAlVMTCf0R3kWHL9ZGmsE40
         IwBT6ePo/Rz23Sr8X0MftHYStPGTuXDN6BiWGM0qB3QPD+xedt6G9QHbExJlEH6AgrQP
         kR37B350cFN4uLxmlRpeGNV9g/h0DhphVVUZ5zFl4VROMjbqbcKRX3vox69dHOKkwCto
         rlj3IyC9KTiyekNYFcRSTOGGRwgBzIKpuudtjNArayKwSOHjPAjN5B0e7fyQ7K/0AJBA
         q0tx5DE4PetsJdBUwvgyXmCuAclVdiVhLisQ2kfLxUnzFSruzelRAUA4GPghTSdCbFYK
         zy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680811389; x=1683403389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFrdCeDCOJkHQGDyFu7yRUwnrgoVUUx7k0c1Neje6RM=;
        b=Aa1qzht9mQJTN2Qoj77VIo9Xy+xecLcEvMcvso606S8C1pWqjLE90mR7PoVEn1bNms
         VXrVMA7U6hOXELOTp155tLNZkmG8YUFGvE218663sgfp7tdYamGoDpeqJEYCCXjn/uOR
         3y6JUbvuZEmpe4DvY0EFRM49vaRC4cX0icptIRgJ1+i43wmUzinvYOTNHdS480+fSaUv
         lOAv0T2I/VnfBTPZ0FDNNSpQ+2VV95u98i741kNUNh8unKO44wF4IwDCQynqATqRBR2q
         4zUvUwhPuCDX6SpcCJICs35At1nkFd7jK25LIB/bUrknEBuWbowDnWToh1hmLLPqudZe
         Xi4Q==
X-Gm-Message-State: AAQBX9cGxAr7P77teKaF3JvrpZqBFWQdyhjJ+rirtX7sRU47Nu4uaFZW
	Ewg9RtkDAw7rCKwhGnGozHZMF2/42vAED7qiieo=
X-Google-Smtp-Source: AKy350aANX+UTxPTPh2+zIsCbbdQdpecQ1XqZIGaIBnAYEiVmox+pwYQ2BDIID4Tc/Vw0OZ3VsJGHNzZDnE+tHV9BAg=
X-Received: by 2002:a81:c509:0:b0:52e:e095:d840 with SMTP id
 k9-20020a81c509000000b0052ee095d840mr6802785ywi.0.1680811388797; Thu, 06 Apr
 2023 13:03:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221125154947.2163498-1-Liam.Howlett@oracle.com>
 <CANiq72ntFXb+ZhBqgBAMu2n8wcgJLZRZC1rmBVvL5m+K1Nhw2w@mail.gmail.com> <20230406195830.ieiozetmk7qjllol@revolver>
In-Reply-To: <20230406195830.ieiozetmk7qjllol@revolver>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Apr 2023 22:02:57 +0200
Message-ID: <CANiq72=C4OCcbX4C-ap3YTm5Ni6RdskQ67rt4iWs0_1hTe1rkw@mail.gmail.com>
Subject: Re: [PATCH] tools: Rename __fallthrough to fallthrough
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	"linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 6, 2023 at 9:58=E2=80=AFPM Liam R. Howlett <Liam.Howlett@oracle=
.com> wrote:
>
> Any chance of this being accepted?  I'm looking to use this in the radix
> test suite and would rather not duplicate code.

That would be up to the `tools/perf/` maintainers.

Cheers,
Miguel
