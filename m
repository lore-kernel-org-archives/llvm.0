Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55E1111B7
	for <llvm@lists.linux.dev>; Tue, 20 Jun 2023 14:38:50 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-440af67aa78so760921137.1
        for <llvm@lists.linux.dev>; Tue, 20 Jun 2023 07:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687271929; x=1689863929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zaXSr3GCbF+rgtawRt7e0ESvKsYpe0KILf+H2QHTse0=;
        b=wb1kq0YKJOiepV4WburbH/IpiRxjuz3oXnEenmYGj5z5DxAEvJjBCxn7+1nIMqhNmq
         I9v4/HNGmg7ZlqnJCkPRsfG/HZedJceg8XaxD6csMrLQ0GRP5+UkzYSIEmgaAb24mwoI
         AodHf0VdBv8+bNP0mDwU7Qc62DCmfulh6gmcvR3jFuse0fo2lxM3A3fUNODlm2+J9k+H
         qNexu/RwSixB95w6vNfB+D+NwQBWNRunJqpDL1SIePTxRK1eqQFXFFCfLO7SBEbnL3xm
         fjQ3KQxLZ5cZdl69pdUnkL5zVwd9FuQbouYONbriAVd2Vv0kN+J/JZ/vd9JqYRnd0ctI
         V2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687271929; x=1689863929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zaXSr3GCbF+rgtawRt7e0ESvKsYpe0KILf+H2QHTse0=;
        b=UZO89KXOV1eZUVsBnxJ3thF4sWMyEfwZ0ioff4nxlF/nqytZScQNwgb29U+FKFMaAO
         hMUQN3D9dKEnKp7OIniAFgbsabj8fMcZVyYxDXNUHsOCS1v+IvvSLnrEf0zYfknO7nYP
         rcdLyQkSxdrIsjLOK8PRsuVcqOWddUYBPWMHVg/8HYFS3a4yzeSli1oYIQ9d9oCT+1Nc
         9xaVn6627oqFgMIP7CBUtAOvZnciESrWhrBp9/qZJr+xgUrjSbBHqUSEwDTnY+5vUS6R
         li9VrqPf17iqFnIQ7FXdXivWIYdbmuBS1b6v5dcR39v6AeLwFtXISmoKY+xW6LkQmhXw
         FAXQ==
X-Gm-Message-State: AC+VfDwf0h0L/IdqM9adO4XNVKA3vlAosxGRvy933MVzyd9u1HEYdWnz
	A7UoPwQaev33vd6fBQoElx77sSqv2Q9QSTbIUSJ5+g==
X-Google-Smtp-Source: ACHHUZ4IEDhKNTHIU5DZE5kPPMKEYjILdUMrYxa8VeNOcyWI7y6zA3wqodFIZGlox6OA54pundl/RrX+vUL9kCo0gnw=
X-Received: by 2002:a67:fb85:0:b0:43f:41ae:46d6 with SMTP id
 n5-20020a67fb85000000b0043f41ae46d6mr3975784vsr.21.1687271929404; Tue, 20 Jun
 2023 07:38:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230615145607.3469985-1-revest@chromium.org> <CAEf4BzbjCt3tKJ40tg12rMjCLXrm7UoGuOdC62vGnpTTt8-buw@mail.gmail.com>
 <CABRcYmK=yXDumZj3tdW7341+sSV1zmZw1UpQkfSF6RFgnBQjew@mail.gmail.com> <c26de68d-4a56-03a0-2625-25c7e2997d45@meta.com>
In-Reply-To: <c26de68d-4a56-03a0-2625-25c7e2997d45@meta.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 20 Jun 2023 10:38:38 -0400
Message-ID: <CAKwvOdnehNwrDNV5LvBBwM=jqPJvL7vB9HwF0YU-X5=zbByrmg@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf/btf: Accept function names that contain dots
To: Yonghong Song <yhs@meta.com>
Cc: Florent Revest <revest@chromium.org>, Andrii Nakryiko <andrii.nakryiko@gmail.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, martin.lau@linux.dev, 
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, song@kernel.org, 
	yhs@fb.com, john.fastabend@gmail.com, kpsingh@kernel.org, sdf@google.com, 
	haoluo@google.com, jolsa@kernel.org, nathan@kernel.org, trix@redhat.com, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 19, 2023 at 2:17=E2=80=AFPM Yonghong Song <yhs@meta.com> wrote:
>
> How many people really build the kernel with
>     LLVM=3D1 LLVM_IAS=3D0
> which uses clang compiler ans gcc 'as'.
> I think distro most likely won't do this if they intend to
> build the kernel with clang.
>
> Note that
>     LLVM=3D1
> implies to use both clang compiler and clang assembler.

Yes, we prefer folks to build with LLVM=3D1.  The problem exists for
users of stable kernels that predate LLVM_IAS=3D1 support working well
(4.19 is when we had most of the assembler related issues sorted out,
actually later but we backported most fixes to 4.19).

>
> Using clang17 and 'LLVM=3D1 LLVM_IAS=3D0', with latest bpf-next,
> I actually hit some build errors like:
>
> /tmp/video-bios-59fa52.s: Assembler messages:
> /tmp/video-bios-59fa52.s:4: Error: junk at end of line, first
> unrecognized character is `"'

Probably because:
1. CONFIG_DEBUG_INFO_DWARF5=3Dy was set or
CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=3Dy and you're using a version
of clang which implicitly defaults to DWARFv5.
2. you're using a version of GAS that does not understand DWARFv5.
3. you did not run defconfig/menuconfig to have kconfig check for
DWARFv5 support.

The kconfigs should prevent you from selecting DWARFv5 if your
toolchain combination doesn't support it; if you run kconfig.

> /tmp/video-bios-59fa52.s:4: Error: file number less than one
> /tmp/video-bios-59fa52.s:5: Error: junk at end of line, first
> unrecognized character is `"'
> /tmp/video-bios-59fa52.s:6: Error: junk at end of line, first
> unrecognized character is `"'
> /tmp/video-bios-59fa52.s:7: Error: junk at end of line, first
> unrecognized character is `"'
> /tmp/video-bios-59fa52.s:8: Error: junk at end of line, first
> unrecognized character is `"'
> /tmp/video-bios-59fa52.s:9: Error: junk at end of line, first
> unrecognized character is `"'
> /tmp/video-bios-59fa52.s:10: Error: junk at end of line, first
> unrecognized character is `"'
> /tmp/video-bios-59fa52.s:68: Error: junk at end of line, first
> unrecognized character is `"'
> clang: error: assembler command failed with exit code 1 (use -v to see
> invocation)
> make[4]: *** [/home/yhs/work/bpf-next/scripts/Makefile.build:252:
> arch/x86/realmode/rm/video-bios.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
> /tmp/wakemain-88777c.s: Assembler messages:
> /tmp/wakemain-88777c.s:4: Error: junk at end of line, first unrecognized
> character is `"'
> /tmp/wakemain-88777c.s:4: Error: file number less than one
> /tmp/wakemain-88777c.s:5: Error: junk at end of line, first unrecognized
> character is `"'
> /tmp/wakemain-88777c.s:6: Error: junk at end of line, first unrecognized
> character is `"'
> /tmp/wakemain-88777c.s:7: Error: junk at end of line, first unrecognized
> character is `"'
> /tmp/wakemain-88777c.s:8: Error: junk at end of line, first unrecognized
> character is `"'
> /tmp/wakemain-88777c.s:81: Error: junk at end of line, first
> unrecognized character is `"'
> /tmp/wakemain-88777c.s:312: Error: junk at end of line, first
> unrecognized character is `"'
> clang: error: assembler command failed with exit code 1 (use -v to see
> invocation)
>
> Potentially because of my local gnu assembler 2.30-120.el8 won't work

It's recorded in lib/Kconfig.debug that 2.35.2 is required for DWARFv5
support if you're using GAS.  My machine has 2.40.

> with some syntax generated by clang. Mixing clang compiler and arbitrary
> gnu assembler are not a good idea (see the above example). It might

I agree, but for older branches of stable which are still supported,
we didn't quite have clang assembler support usable.  We still need to
support those branches of stable.

> work with close-to-latest gnu assembler.
>
> To support function name like '<fname>.isra', some llvm work will be
> needed, and it may take some time.
>
> So in my opinion, this patch is NOT a bug fix. It won't affect distro.
> Whether we should backport to the old kernel, I am not sure whether it
> is absolutely necessary as casual build can always remove LLVM_IAS=3D0 or
> hack the kernel source itself.



--=20
Thanks,
~Nick Desaulniers
