Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF3617FFF
	for <llvm@lists.linux.dev>; Tue, 20 Jun 2023 20:27:06 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-3ff29d0dd1eso13624871cf.2
        for <llvm@lists.linux.dev>; Tue, 20 Jun 2023 13:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687292825; x=1689884825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=joo/oUAWScXUdXgTaCSTcx5W8m20bjJhgiK7mdH4uqM=;
        b=W+9Rv1sZOq6oZr2lDOufXCdjfH1TXAdwRfgbp7OcKuv28uOSUMf274oz1Vj/7FmKdM
         wY/SBudpQcbMbx6VFhL26bqoh7uvomkSTIQnYT9+EzR6ntrnL/tyPhO1wTEWTrjq2Osn
         gTjSunV/8BEM3RWMoWYkzZRdemJaHir+rKWsLH015fOl/7pMufBzismYaTTgCJ0twfc1
         F3vB6FXTyxSWBYN9BA8Ufvd9pEO5ASz2GVxp6sHXRzUhj5JQEssMj0gnyzXhf+AyUeIJ
         IgziBY4mf8nslmvDaPC03iM62I0RuBNahWLSjQjeywCZTGC2vlcPYrIBDk7vgxTtx7/W
         pOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687292825; x=1689884825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=joo/oUAWScXUdXgTaCSTcx5W8m20bjJhgiK7mdH4uqM=;
        b=Z1uvno8n4ulhzLfJzyvNLuKaLmWqPnPlW9DWv8QPKKqv4CvvA2i6l01O+mLJJT5L5Y
         ee2PZzrL0LYmdraovIeszD7hTS63Xakr90p1WYo15uvQ2unx5sg9IYFgdExGVuzJ8tBU
         ykPB/KG522e4GWvR2x8GWw8951KwnKz+p4WorbNc/83TZm70tgaduw4lTr/pqz8m7FYi
         VeijHSHCSsJb2WWVLmejW3BsUVf/VM0lAqyi7kvKlNUuLf6hkmU/1MSJgUewsf/909bn
         Kn1mabowl2WR/yhtVyTn0QAn0K8faURwNJUBXf4kPe8TIngnKaqA4egrKtVeQX1S4o5x
         3XbQ==
X-Gm-Message-State: AC+VfDzgs8WhEnEc2HEBVnBs1xzSkOY+FTgJiiBGJAV/rZwH0kKwU777
	M9XQrABUDDNyxylmztexE+7PjB+ZyeNED1d1ho9PNw==
X-Google-Smtp-Source: ACHHUZ6WUkKcA+wkBZ5oNpUXeh8vRWU3VXOcG+U7JcCReMr8oADvkSp7vl51NZvqEd2fl7N4KzLjLdzciC5xrB2u9i4=
X-Received: by 2002:a05:6214:1d24:b0:632:80f:4734 with SMTP id
 f4-20020a0562141d2400b00632080f4734mr1684835qvd.40.1687292825121; Tue, 20 Jun
 2023 13:27:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZJIIUn8Da15neIwI@google.com> <mhng-ae249af7-37cc-400c-be0d-c1fa6f75c8ef@palmer-ri-x1c9a>
In-Reply-To: <mhng-ae249af7-37cc-400c-be0d-c1fa6f75c8ef@palmer-ri-x1c9a>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 20 Jun 2023 16:26:53 -0400
Message-ID: <CAKwvOdnZ8+CrBGCDhzi8o8UrOjg-CyuRO=OLKpx9X4iGheV77Q@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: Enable dead code elimination
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: falcon@tinylab.org, Conor Dooley <conor@kernel.org>, guoren@kernel.org, 
	linux-riscv@lists.infradead.org, npiggin@gmail.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, paulburton@kernel.org, vincent.chen@sifive.com, 
	tim.bird@sony.com, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 20, 2023 at 4:17=E2=80=AFPM Palmer Dabbelt <palmer@rivosinc.com=
> wrote:
>
> On Tue, 20 Jun 2023 13:13:06 PDT (-0700), ndesaulniers@google.com wrote:
> > On Wed, May 17, 2023 at 04:29:36PM +0800, Zhangjin Wu wrote:
> >> Select CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION for RISC-V, allowing
> >> the user to enable dead code elimination. In order for this to work,
> >> ensure that we keep the alternative table by annotating them with KEEP=
.
> >>
> >
> > Just cross referencing the report from Palmer against v2; I see orphan
> > section warnings from the linker related to the EFI stub when building
> > allmodconfig with this patch applied.
> >
> > v2: thread for reference.
> > https://lore.kernel.org/linux-riscv/CAKwvOdmsgMN5oQpDLh12D0X-CfQDtHC-Et=
xHcBnADkhnyitMKQ@mail.gmail.com/
>
> Sorry for replying to the v2, I'm marking that as superseeded in
> patchwork.  IIUC it is a real issue on your end too?  I'm also not 100%
> sure about the hang, I just let LLD cook for about 10 minutes before I
> noticed it was still running and posted.

Yes; if this is merged, our CI builds of ARCH=3Driscv allmodconfig will go =
red.

I assume a linker script somewhere needs to be updated, but I haven't
found if/where the efi stub's is.

drivers/firmware/efi/libstub/zboot.lds perhaps?

On Tue, Jun 20, 2023 at 4:22=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> Repeating myself for the sake of the archives or w/e, two different
> submitters with differing version numbers. The v2 from Jisheng is more
> recent than the v3 here from Zhangjin, they agreed in this mail thread
> to merge their work.

--=20
Thanks,
~Nick Desaulniers
