Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963AF13AF9
	for <llvm@lists.linux.dev>; Tue,  8 Aug 2023 16:27:31 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-63f7bb12050so14646436d6.1
        for <llvm@lists.linux.dev>; Tue, 08 Aug 2023 09:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691512050; x=1692116850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JoWzrCMANPjnlj2cvgK7d043Ga9JDouQ0JU9bziv+Vs=;
        b=aoX21WBggS/4XosYG0HYLIKnJ7c7QmjOo9JOVS5jS9Qk8gIoraTfS8Lb4jlP3ng4/S
         nctO0uW56++SiRwWIDxn2eqcf67alPUNwPhsVpCQQ3TTyccURL0mUptq2wWAUFptt1GL
         hlj8Q50IjofgrBXgbY9XAQgzJuvg8mjfos48sd3VRUSPz9IHKk3XE/2y/zQMdLFFbHU2
         cjJXk0bdZIO/QTUJvDiTUZNMGazUTawXnhvtWaqSWI+idWPmzPVMXpZ6zO5mVfh7TDmf
         o+2EFmlEPQkzUioTfn9saJw+QvTfEUkoVRdA6mYqAyVyJmZsTRmt/WPFWkzLZBD+ByzQ
         bHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691512050; x=1692116850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JoWzrCMANPjnlj2cvgK7d043Ga9JDouQ0JU9bziv+Vs=;
        b=X1kQCJRsK9mqhAM7dOryNy3VF8QJhhQskH2brBtK/dyzeVRUsyGOA6Q41pzZINCRD9
         qPckm6QuE7/H8SvufG6CIwGlEJAJEgqxpclYIrr0wb6ZPGnvUiRj403cEeKHhCrWTZrH
         g1ZTkRcCr+FhP6M4xk/AGGoldwDa3IgXxNCSUGNaeyckqHSVd7A6F3jqVjDZmXqfiHeo
         vSI6mY0HqrrrqHe+f92SHW38b3l3I0Uty7SUvRWq9ChLbM+MqbhlnDClGSNFP0n1a8IN
         7XJdhigEWfEcw8ipswoj+PbmyayxAWvl620VQ+LRCYnOORGOfI0SdJG27roFizu1j4eO
         W0zg==
X-Gm-Message-State: AOJu0YyGwDVAQFTZ/QayOwTJOIIMlq4/Doa+QEi1qkVq+ZTukQrnzRDu
	8DYwprBDRmZrPdv8euJB6L0pIrlaZlsniny8LMVn/w==
X-Google-Smtp-Source: AGHT+IFE1mPg+bhXgiG77u3yQqApnKpoE4FunmLDF9Q9WwsTSf+Qi6ptI0RPfwZ4AzBJM8DZgQeG+mmHAo9n23G6KkM=
X-Received: by 2002:a0c:dd13:0:b0:63c:fb87:625d with SMTP id
 u19-20020a0cdd13000000b0063cfb87625dmr10181036qvk.3.1691512050315; Tue, 08
 Aug 2023 09:27:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230808-riscv_static-v1-1-9f3dc99dafe8@google.com> <20230808162412.GA2172017@dev-arch.thelio-3990X>
In-Reply-To: <20230808162412.GA2172017@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 8 Aug 2023 09:27:19 -0700
Message-ID: <CAKwvOd=93QE6d1Runn9EO9A4KBAKvhx4RwZTpWNNFcf2eW1kWQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: mm: fix 2 instances of -Wmissing-variable-declarations
To: Nathan Chancellor <nathan@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Tom Rix <trix@redhat.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 8, 2023 at 9:24=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> On Tue, Aug 08, 2023 at 09:15:41AM -0700, Nick Desaulniers wrote:
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/=
pgtable.h
> > index 75970ee2bda2..4c8c0f83a974 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -188,6 +188,7 @@ extern struct pt_alloc_ops pt_ops __initdata;
> >  #define PAGE_KERNEL_IO               __pgprot(_PAGE_IOREMAP)
> >
> >  extern pgd_t swapper_pg_dir[];
> > +extern pgd_t trampoline_pg_dir[];
>
> Missing early_pg_dir too? It looks like there is already a declaration
> in arch/riscv/mm/kasan_init.c that could be hoisted here?

Yep, will respin. Good catch!

--=20
Thanks,
~Nick Desaulniers
