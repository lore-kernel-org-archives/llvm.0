Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAE512B71
	for <llvm@lists.linux.dev>; Mon, 22 May 2023 16:47:26 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-75b1975ea18so45735085a.3
        for <llvm@lists.linux.dev>; Mon, 22 May 2023 09:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684774045; x=1687366045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtYZcbQKacTkkwOnNbr0k7FvVbVL4fzfTWwOXkqVav4=;
        b=DmcJi/OcG35j8NGwwuXsQr3VopobdJqXFO0zhgiKpZ9nx+yyMBmR1ZR2MKnPQmt/jt
         y5E19p81y/cmOUbQizusn5nlIzG59cql6X/zy3xzjYBje52Y1g3iUZW2ZYYW3+WtNXDZ
         PrrxKi0bNM7kF9RQVTMnjZhTWb+91sj25c+Qwc3u4kIA7SoVNq4O0+bhUjaZElcLdUW5
         z/nJexHU62dZ4vEz6PspVFHKvP247ivyMTffdVisJEBmlITsUGsy007nBK2cxALN27ia
         PuGkWJ3q9w+2QDuisPKOw+g9VfuwhKYUyrJlNLd+XeBqqKxo4+fk64qU50JqYw4zsjzb
         ffOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684774045; x=1687366045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RtYZcbQKacTkkwOnNbr0k7FvVbVL4fzfTWwOXkqVav4=;
        b=QUpsJtaf/z/IVbQdLa7DqSeqpI6GczpEW+M7u/ygLnBILd2VwaZHEPyzAkaO2NMezB
         zj/Le+xbo+hnwzuGxlN74DjnRBNCpId+KFhnT+e+PzqeDnYg46511aJFueH6jniiv938
         eMLm+WewyXKoWngmB59gf1fdeK2qns3OpcLj68cGSHQUGJ1fo8YpSEQWYDZSMf5h73yT
         wvwCLyJa89GVOpkPXW4H/itZbr7hi0p2Jx/wB1GLY7DELVspxd5n2HT0t5l0g6lLIXT7
         jIaCwBf4ShSkb7bCiX4fIwNazGP9HBPCrlfzbmpELktZYBhCw8DKgCZ/Zhyy9Oi0hAME
         EuPQ==
X-Gm-Message-State: AC+VfDyFnH1sdfwbc1ZPWGkGVFCcNfVEw8yf4tw0xKwOXi+TTRVGZMk7
	TRn4XHv/m8dlFUrvYB92Fn4c1h8/Ypw9Ap+1neO0dw==
X-Google-Smtp-Source: ACHHUZ6W5buVDy/kIOeIyMoEFAvmSJ/P7EkykMBmkr+MDoVlESJiSwTnjP7ULqt2dw5RubCBiuQorIcPzsV0ggE+Fsk=
X-Received: by 2002:a05:620a:b96:b0:75b:23a0:e7c9 with SMTP id
 k22-20020a05620a0b9600b0075b23a0e7c9mr1336547qkh.42.1684774044909; Mon, 22
 May 2023 09:47:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230522171557.32027acf@canb.auug.org.au> <ZGuYeDA9jDlxzfZN@google.com>
 <CADnq5_OoGDVWX5UwV_hQQBfPorBuE2jJymMA-hW+Y3+7ni0f5g@mail.gmail.com>
In-Reply-To: <CADnq5_OoGDVWX5UwV_hQQBfPorBuE2jJymMA-hW+Y3+7ni0f5g@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 22 May 2023 09:47:14 -0700
Message-ID: <CAKwvOdk6cO9L2Km+gBFNGkhdnODMAnizwA-PctJ=FcKTu=XFxw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>, 
	Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>, 
	Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 22, 2023 at 9:36=E2=80=AFAM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Mon, May 22, 2023 at 12:29=E2=80=AFPM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Mon, May 22, 2023 at 05:15:57PM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > After merging the amdgpu tree, today's linux-next build (arm allmodco=
nfig
> > > clang-17) failed like this:
> > >
> > > drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c:146:54: error: format specif=
ies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka '=
unsigned int') [-Werror,-Wformat]
> > >
> > > Caused by commit
> > >
> > >   d020a29b6b58 ("drm/amdgpu: Allocate GART table in RAM for AMD APU")
> > >
> > > Reported by the kernelci.org bot.
> >
> > Alex,
> > This is the third report of linux-next being broken for clang due to th=
e
> > AMDGPU tree.
> > 1. https://lore.kernel.org/lkml/20230522171557.32027acf@canb.auug.org.a=
u/
> > 2. https://lore.kernel.org/lkml/20230522171145.38a8bd4d@canb.auug.org.a=
u/
> > 3. https://lore.kernel.org/lkml/20230522170031.5fb87a64@canb.auug.org.a=
u/
> >
> > Our CI is red as a result.
> > https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs=
/5045716034/jobs/9053211936
> >
> > When will AMD start testing their kernels with Clang?
>
> We have clang as part of our CI system and have had it for a while.
> I'm not sure why it didn't catch these.  Our CI clang builds are
> currently passing.

Can you verify that the driver configs are enabled for those builds?

Looking through my CI reports, it looks like allmodconfig/allyesconfig
is red from this tree for ARCH=3Dx86_64 and ARCH=3Darm64.
Examples:
x86_64: https://github.com/ClangBuiltLinux/continuous-integration2/actions/=
runs/5045594636/jobs/9052932014
arm64: https://github.com/ClangBuiltLinux/continuous-integration2/actions/r=
uns/5045594636/jobs/9052930995

>
> Alex
>
> >
> > >
> > > --
> > > Cheers,
> > > Stephen Rothwell
> >
> > Thanks for reporting these, Stephen.



--=20
Thanks,
~Nick Desaulniers
