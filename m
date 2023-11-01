Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B68168B0
	for <llvm@lists.linux.dev>; Wed,  1 Nov 2023 18:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XdTQtcpv"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4084de32db5so929175e9.0
        for <llvm@lists.linux.dev>; Wed, 01 Nov 2023 11:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698862981; x=1699467781; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0JUcDMKCp6UaJEgSwy37RwBZzUyMCPTfpmmTNlGciQ=;
        b=XdTQtcpv9Sec9sK+vDUYfzoiYt2DkBXBOpq2pR5pgloyqAU8e+Shv3VcduLl0nHfLG
         t1+UlD549CjJtFtnLeg2eUgjOqIOVFnyCjTFpQzVH2jWymzpZldmxqUIEV8xKxcjGPPs
         HYRP1jat1//7ReBsZfQAEJsVxiDN4CudEnwYEyzfKDLCsowbNsV0cRZqS0DcR5ZKB3X7
         Kq7bnPo4CwxcyRLOlYMmm/eO98fzByAI+v2SVm081o23gs8LdR+t3cVk9bQAatEp20Dh
         jQjXpA/ftAmDPYxhcb35pfhLS11x+TZ01zk0HC/xdRcSdmfYkW0/gNSAiHBOeFUFpiYM
         nX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698862981; x=1699467781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q0JUcDMKCp6UaJEgSwy37RwBZzUyMCPTfpmmTNlGciQ=;
        b=V0Vs7OxMMrcjbvjdKMmROzRLBN2HvsckWqEUKDVSt5hqjVdLCdhgllqhAsVAa3qpGg
         VrykthpIHdSYEnmV/BCDCh834nw8qRjV/ZMMSiMMdwQ4avuAQsWRUAKOZcFAirxMnBiw
         ffe4MXB/j2IkpI7iodhx0+8ZIsyxZqwnrxz6PqPRQmcG0kNg1bhfWo6eDvXd0STslgQq
         xuwiCKG5OjczdHnpyJYHD0UNb5dTEz95+pKFCWXaT3KSUbtFCTU+hJEAzzvjxCRwJao4
         H4kFs9Qp0m58vknJ2QJHflwz5GsbPB/xWp2ty/caDS3wmEgrv538dua7kZYe0VAn4J33
         Msrg==
X-Gm-Message-State: AOJu0YzIVdEaWIlLKi9iqUQeHMSFeIvR6c+hyolwdQAK6hZTEa/pTXch
	JIcWrfQn1iLwPpenxH30hHcQox7Sr0AmOXvUf6IaTw==
X-Google-Smtp-Source: AGHT+IEwIVXTWjMN8zIeAQdD9GM/XSkn9ANwmo7TYpqAO9rWjlzR2CSsXRqlMxbbHG96nKoSHYCQb28rDo7i3uQHaGc=
X-Received: by 2002:a05:600c:46ce:b0:409:4e8f:4b27 with SMTP id
 q14-20020a05600c46ce00b004094e8f4b27mr5201528wmo.33.1698862980839; Wed, 01
 Nov 2023 11:23:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1310397379.52558.1698849730427@jenkins.jenkins>
 <CAKwvOdmomdYWFxZO+61kFN9soaxiOGAr8dM_G80HSufJa=XGdQ@mail.gmail.com>
 <20231101172208.GA1368360@dev-arch.thelio-3990X> <F802D6D3-CB3A-43AC-99EF-1220585F49D8@linaro.org>
In-Reply-To: <F802D6D3-CB3A-43AC-99EF-1220585F49D8@linaro.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 1 Nov 2023 11:22:46 -0700
Message-ID: <CAKwvOdn0F4SzeT0bSFHUD1QKsT=fkqfUBbsq+q1r_3Y7o9kHLg@mail.gmail.com>
Subject: Re: [Linaro-TCWG-CI] v6.6-rc1-17-g1c6fdbd8f246: Failure on arm
To: Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Linaro Toolchain Working Group <linaro-toolchain@lists.linaro.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 11:02=E2=80=AFAM Maxim Kuvyrkov
<maxim.kuvyrkov@linaro.org> wrote:
>
> Hi Nick,
> Hi Nathan,
>
> I don't see mistakes from CI here.  Are you using tip-of-trunk LLVM?
>
> This report was generated for LLVM revision llvmorg-18-init-10263-g1abd8d=
1a8d96 and linux revision v6.6-rc1-17-g1c6fdbd8f246 .  The build log with e=
rrors is at [1].
>
> It seems that a later commit in Linux kernel fixed some of the errors in =
[1], but still with the current linux.git:master 2 errors remain (see [2]):
>
> 00:28:15 fs/bcachefs/chardev.c:655:6: error: stack frame size (1032) exce=
eds limit (1024) in 'bch2_fs_ioctl' [-Werror,-Wframe-larger-than]
> 00:28:15   655 | long bch2_fs_ioctl(struct bch_fs *c, unsigned cmd, void =
__user *arg)
> 00:28:15       |      ^
> 00:28:15 1 error generated.
> 00:28:15 make[4]: *** [scripts/Makefile.build:243: fs/bcachefs/chardev.o]=
 Error 1
> 00:29:39 fs/bcachefs/fs-common.c:356:5: error: stack frame size (1128) ex=
ceeds limit (1024) in 'bch2_rename_trans' [-Werror,-Wframe-larger-than]
> 00:29:39   356 | int bch2_rename_trans(struct btree_trans *trans,
> 00:29:39       |     ^
> 00:29:39 1 error generated.

These are different warnings in different object files than from the
initial report.

Maybe bisection started due to those, but didn't notice different
warnings going further back, because of -Werror, and reported the
initial commit that was problematic (even if the warnings differed and
were since fixed).

>
> These errors are near-misses, so if you are using a different LLVM revisi=
on, they can disappear.
>
> [1] https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-mainline-allmo=
dconfig-build/110/artifact/artifacts/06-build_linux/console.log.xz
>
> [2] https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-mainline-allmo=
dconfig-build/111/artifact/artifacts/06-build_linux/console.log.xz
>
> --
> Maxim Kuvyrkov
> https://www.linaro.org
>
> > On Nov 1, 2023, at 21:22, Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Wed, Nov 01, 2023 at 08:54:26AM -0700, Nick Desaulniers wrote:
> >> On Wed, Nov 1, 2023 at 7:42=E2=80=AFAM <ci_notify@linaro.org> wrote:
> >>>
> >>> Dear contributor, our automatic CI has detected problems related to y=
our patch(es).  Please find some details below.  If you have any questions,=
 please follow up on linaro-toolchain@lists.linaro.org mailing list, Libera=
's #linaro-tcwg channel, or ping your favourite Linaro toolchain developer =
on the usual project channel.
> >>>
> >>> In CI config tcwg_kernel/llvm-master-arm-mainline-allmodconfig after:
> >>
> >> ok, so ARCH=3Darm allmodconfig on mainline...
> >>
> >>>
> >>>  | commit v6.6-rc1-17-g1c6fdbd8f246
> >>>  | Author: Kent Overstreet <kent.overstreet@gmail.com>
> >>>  | Date:   Thu Mar 16 22:18:50 2017 -0800
> >>>  |
> >>>  |     bcachefs: Initial commit
> >>>  |
> >>>  |     Initially forked from drivers/md/bcache, bcachefs is a new cop=
y-on-write
> >>>  |     filesystem with every feature you could possibly want.
> >>>  |
> >>>  |     Website: https://bcachefs.org
> >>>  |
> >>>  | ... 1 lines of the commit log omitted.
> >>>
> >>> Results changed to
> >>> # reset_artifacts:
> >>> -10
> >>> # build_abe binutils:
> >>> -9
> >>> # build_kernel_llvm:
> >>> -5
> >>> # build_abe qemu:
> >>> -2
> >>> # linux_n_obj:
> >>> 23730
> >>> # First few build errors in logs:
> >>>
> >>> # 00:23:16 fs/bcachefs/btree_cache.h:45:43: error: array index 0 is p=
ast the end of the array (that has type 'const __u64[0]' (aka 'const unsign=
ed long long[0]')) [-Werror,-Warray-bounds]
> >>> # 00:23:17 fs/bcachefs/alloc.c:332:9: error: call to undeclared funct=
ion 'COUNT_ARGS'; ISO C99 and later do not support implicit function declar=
ations [-Wimplicit-function-declaration]
> >>
> >> ^
> >> $ file fs/bcachefs/alloc.c
> >> fs/bcachefs/alloc.c: cannot open `fs/bcachefs/alloc.c' (No such file
> >> or directory)
> >>
> >>> # 00:23:17 make[4]: *** [scripts/Makefile.build:243: fs/bcachefs/allo=
c.o] Error 1
> >>> # 00:23:29 fs/bcachefs/btree_cache.h:45:43: error: array index 0 is p=
ast the end of the array (that has type 'const __u64[0]' (aka 'const unsign=
ed long long[0]')) [-Werror,-Warray-bounds]
> >>> # 00:23:30 make[4]: *** [scripts/Makefile.build:243: fs/bcachefs/bset=
.o] Error 1
> >>
> >> ^
> >> $ make LLVM=3D1 ARCH=3Darm allmodconfig fs/bcachefs/bset.o
> >>  CC [M]  fs/bcachefs/bset.o
> >> $
> >>
> >>> # 00:23:33 fs/bcachefs/btree_cache.h:45:43: error: array index 0 is p=
ast the end of the array (that has type 'const __u64[0]' (aka 'const unsign=
ed long long[0]')) [-Werror,-Warray-bounds]
> >>> # 00:23:33 fs/bcachefs/btree_cache.h:45:43: error: array index 0 is p=
ast the end of the array (that has type 'const __u64[0]' (aka 'const unsign=
ed long long[0]')) [-Werror,-Warray-bounds]
> >>> # 00:23:33 fs/bcachefs/btree_cache.c:67:9: error: array index 0 is pa=
st the end of the array (that has type 'const __u64[0]' (aka 'const unsigne=
d long long[0]')) [-Werror,-Warray-bounds]
> >>> # 00:23:33 fs/bcachefs/btree_cache.c:120:2: error: array index 0 is p=
ast the end of the array (that has type '__u64[0]' (aka 'unsigned long long=
[0]')) [-Werror,-Warray-bounds]
> >>> # 00:23:33 fs/bcachefs/btree_cache.c:201:6: error: array index 0 is p=
ast the end of the array (that has type 'const __u64[0]' (aka 'const unsign=
ed long long[0]')) [-Werror,-Warray-bounds]
> >>
> >> $ make LLVM=3D1 ARCH=3Darm allmodconfig fs/bcachefs/btree_cache.o
> >>  CC [M]  fs/bcachefs/btree_cache.o
> >> $
> >>
> >> ... what's up with this report?
> >
> > I cannot tell exactly from the information in this report but I suspect
> > ARCH=3Darm allmodconfig is broken in mainline for other reasons (perhap=
s
> > https://github.com/ClangBuiltLinux/linux/issues/1953?) and in trying to
> > uncover that breakage in an automated fashion, it hit this build
> > breakage and the bisect inadvertently switched to tracking down this
> > already fixed set of warnings. I think this particular issue is resolve=
d
> > by Kent's recent array bounds fixes commit:
> >
> > https://git.kernel.org/linus/5cfd69775eb5460ef78bb5034a37eb0dc52ab65d
> >
> > Cheers,
> > Nathan
> >
> >>>
> >>> From
> >>> # reset_artifacts:
> >>> -10
> >>> # build_abe binutils:
> >>> -9
> >>> # build_kernel_llvm:
> >>> -5
> >>> # build_abe qemu:
> >>> -2
> >>> # linux_n_obj:
> >>> 32815
> >>> # linux build successful:
> >>> all
> >>> # linux boot successful:
> >>> boot
> >>>
> >>> The configuration of this build is:
> >>> CI config tcwg_kernel/llvm-master-arm-mainline-allmodconfig
> >>>
> >>> -----------------8<--------------------------8<----------------------=
----8<--------------------------
> >>> The information below can be used to reproduce a debug environment:
> >>>
> >>> Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-=
arm-mainline-allmodconfig-build/110/artifact/artifacts
> >>> Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-=
arm-mainline-allmodconfig-build/109/artifact/artifacts
> >>>
> >>> Reproduce last good and first bad builds: https://git-us.linaro.org/t=
oolchain/ci/interesting-commits.git/plain/linux/sha1/1c6fdbd8f2465ddfb73a01=
ec620cbf3d14044e1a/tcwg_kernel/llvm-master-arm-mainline-allmodconfig/reprod=
uction_instructions.txt
> >>>
> >>> Full commit : https://git.linaro.org/kernel-org/linux.git/commit/?id=
=3D1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a
> >>>
> >>> Latest bug report status : https://linaro.atlassian.net/browse/LLVM-1=
015
> >>>
> >>> List of configurations that regressed due to this commit :
> >>> * tcwg_kernel
> >>> ** llvm-master-arm-mainline-allmodconfig
> >>> *** Failure
> >>> *** https://git-us.linaro.org/toolchain/ci/interesting-commits.git/pl=
ain/linux/sha1/1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a/tcwg_kernel/llvm-ma=
ster-arm-mainline-allmodconfig/details.txt
> >>> *** https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-mainline-a=
llmodconfig-build/110/
> >>
> >>
> >>
> >> --
> >> Thanks,
> >> ~Nick Desaulniers
>
>


--=20
Thanks,
~Nick Desaulniers
