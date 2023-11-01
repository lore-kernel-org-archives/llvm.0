Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495CC15E8E
	for <llvm@lists.linux.dev>; Wed,  1 Nov 2023 18:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nZVlzQJg"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50944102316so127957e87.1
        for <llvm@lists.linux.dev>; Wed, 01 Nov 2023 11:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698861733; x=1699466533; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNlx/Uln7TfsvBnQnifWkoWRhGovRQp/Lk3Y0E8sAuU=;
        b=nZVlzQJgzzpv7xQCQIvOaavX/slABV7Pwzhyr8tDH3mRz/sERmcTBkHXbiPGn4KxNP
         KOouafY7ux67PgjkdD2FaYpp1Qf2Eofa5AOrf6XUX7M3V3hy0uZuWzwCmLm1Nt0iSYjj
         pAohOWXBKMxoovi1a4Xq5I+jtc6wbv63ucEZ/OzWsdQPt086tmUrpAGdQbd1LCGqAxHR
         1bhmunTuf1xW8QylGSJPivLEnaL46PfwS54NnN9dLldH7Mqf0feEYwhdTvsWSr+sJVps
         bZHF0gQGqeIClIi9h6CTiH1n3jGBnTNoRiGZmdl2nhKt7vKa+mS8wV+t2lAtN9d/dI0k
         YHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698861733; x=1699466533;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNlx/Uln7TfsvBnQnifWkoWRhGovRQp/Lk3Y0E8sAuU=;
        b=QZoKo3NtpMMhDJ6vKQjNMY5HR17ZLeXRkXWREZIcZ4oSZRxodcar3GeFFC4frdhKBg
         oPeMcLfPlgJkkwDKcljXPlHYnP7HYXF15MB3eSAET2y0qaFclMagCwcrVYfA85USOkK3
         osB4xuq3EWgydnLw2UQUOunjUxjxBZraKbvn1fPdEoAyS6TVkEqHfwICUEKYe2Kh9mIY
         HR+vgvbdCcQEnPt4WPXpoSJPhdx5DNJOgBxYyo4ACOt2tiIuo+/TFDJDcAK/QoYX/1oM
         Z6AYeojPAgcef9twy4qb6S2d+f632rHr1n/Ndw3nm3BNZYN9+RmqLc4cqDsO4GYL6Rpp
         3ZFQ==
X-Gm-Message-State: AOJu0YwzRdZu+YDU7BBDAmm+1+vVpLw0Vb4Hmv/qvpPm+mNpkafLDlWq
	BRAudDL6JE0ys2EVPq5aDTUE
X-Google-Smtp-Source: AGHT+IEo6C7P7fDxx3his4w1yE7R2BzrvvjuqtTNSzLstMg7guo6+Gz2QHIgudVEn7DKQvETAwCXqQ==
X-Received: by 2002:a05:6512:2388:b0:509:3806:b86 with SMTP id c8-20020a056512238800b0050938060b86mr3211292lfv.3.1698861733023;
        Wed, 01 Nov 2023 11:02:13 -0700 (PDT)
Received: from smtpclient.apple ([37.252.80.67])
        by smtp.gmail.com with ESMTPSA id 30-20020a50875e000000b0053e07fe8d98sm1356899edv.79.2023.11.01.11.02.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Nov 2023 11:02:12 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [Linaro-TCWG-CI] v6.6-rc1-17-g1c6fdbd8f246: Failure on arm
From: Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>
In-Reply-To: <20231101172208.GA1368360@dev-arch.thelio-3990X>
Date: Wed, 1 Nov 2023 22:02:00 +0400
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 Linaro Toolchain Working Group <linaro-toolchain@lists.linaro.org>,
 llvm@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <F802D6D3-CB3A-43AC-99EF-1220585F49D8@linaro.org>
References: <1310397379.52558.1698849730427@jenkins.jenkins>
 <CAKwvOdmomdYWFxZO+61kFN9soaxiOGAr8dM_G80HSufJa=XGdQ@mail.gmail.com>
 <20231101172208.GA1368360@dev-arch.thelio-3990X>
To: Nathan Chancellor <nathan@kernel.org>
X-Mailer: Apple Mail (2.3731.700.6)

Hi Nick,
Hi Nathan,

I don't see mistakes from CI here.  Are you using tip-of-trunk LLVM?

This report was generated for LLVM revision =
llvmorg-18-init-10263-g1abd8d1a8d96 and linux revision =
v6.6-rc1-17-g1c6fdbd8f246 .  The build log with errors is at [1].

It seems that a later commit in Linux kernel fixed some of the errors in =
[1], but still with the current linux.git:master 2 errors remain (see =
[2]):

00:28:15 fs/bcachefs/chardev.c:655:6: error: stack frame size (1032) =
exceeds limit (1024) in 'bch2_fs_ioctl' [-Werror,-Wframe-larger-than]
00:28:15   655 | long bch2_fs_ioctl(struct bch_fs *c, unsigned cmd, void =
__user *arg)
00:28:15       |      ^
00:28:15 1 error generated.
00:28:15 make[4]: *** [scripts/Makefile.build:243: =
fs/bcachefs/chardev.o] Error 1
00:29:39 fs/bcachefs/fs-common.c:356:5: error: stack frame size (1128) =
exceeds limit (1024) in 'bch2_rename_trans' =
[-Werror,-Wframe-larger-than]
00:29:39   356 | int bch2_rename_trans(struct btree_trans *trans,
00:29:39       |     ^
00:29:39 1 error generated.

These errors are near-misses, so if you are using a different LLVM =
revision, they can disappear.

[1] =
https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-mainline-allmodconf=
ig-build/110/artifact/artifacts/06-build_linux/console.log.xz

[2] =
https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-mainline-allmodconf=
ig-build/111/artifact/artifacts/06-build_linux/console.log.xz

--
Maxim Kuvyrkov
https://www.linaro.org

> On Nov 1, 2023, at 21:22, Nathan Chancellor <nathan@kernel.org> wrote:
>=20
> On Wed, Nov 01, 2023 at 08:54:26AM -0700, Nick Desaulniers wrote:
>> On Wed, Nov 1, 2023 at 7:42=E2=80=AFAM <ci_notify@linaro.org> wrote:
>>>=20
>>> Dear contributor, our automatic CI has detected problems related to =
your patch(es).  Please find some details below.  If you have any =
questions, please follow up on linaro-toolchain@lists.linaro.org mailing =
list, Libera's #linaro-tcwg channel, or ping your favourite Linaro =
toolchain developer on the usual project channel.
>>>=20
>>> In CI config tcwg_kernel/llvm-master-arm-mainline-allmodconfig =
after:
>>=20
>> ok, so ARCH=3Darm allmodconfig on mainline...
>>=20
>>>=20
>>>  | commit v6.6-rc1-17-g1c6fdbd8f246
>>>  | Author: Kent Overstreet <kent.overstreet@gmail.com>
>>>  | Date:   Thu Mar 16 22:18:50 2017 -0800
>>>  |
>>>  |     bcachefs: Initial commit
>>>  |
>>>  |     Initially forked from drivers/md/bcache, bcachefs is a new =
copy-on-write
>>>  |     filesystem with every feature you could possibly want.
>>>  |
>>>  |     Website: https://bcachefs.org
>>>  |
>>>  | ... 1 lines of the commit log omitted.
>>>=20
>>> Results changed to
>>> # reset_artifacts:
>>> -10
>>> # build_abe binutils:
>>> -9
>>> # build_kernel_llvm:
>>> -5
>>> # build_abe qemu:
>>> -2
>>> # linux_n_obj:
>>> 23730
>>> # First few build errors in logs:
>>>=20
>>> # 00:23:16 fs/bcachefs/btree_cache.h:45:43: error: array index 0 is =
past the end of the array (that has type 'const __u64[0]' (aka 'const =
unsigned long long[0]')) [-Werror,-Warray-bounds]
>>> # 00:23:17 fs/bcachefs/alloc.c:332:9: error: call to undeclared =
function 'COUNT_ARGS'; ISO C99 and later do not support implicit =
function declarations [-Wimplicit-function-declaration]
>>=20
>> ^
>> $ file fs/bcachefs/alloc.c
>> fs/bcachefs/alloc.c: cannot open `fs/bcachefs/alloc.c' (No such file
>> or directory)
>>=20
>>> # 00:23:17 make[4]: *** [scripts/Makefile.build:243: =
fs/bcachefs/alloc.o] Error 1
>>> # 00:23:29 fs/bcachefs/btree_cache.h:45:43: error: array index 0 is =
past the end of the array (that has type 'const __u64[0]' (aka 'const =
unsigned long long[0]')) [-Werror,-Warray-bounds]
>>> # 00:23:30 make[4]: *** [scripts/Makefile.build:243: =
fs/bcachefs/bset.o] Error 1
>>=20
>> ^
>> $ make LLVM=3D1 ARCH=3Darm allmodconfig fs/bcachefs/bset.o
>>  CC [M]  fs/bcachefs/bset.o
>> $
>>=20
>>> # 00:23:33 fs/bcachefs/btree_cache.h:45:43: error: array index 0 is =
past the end of the array (that has type 'const __u64[0]' (aka 'const =
unsigned long long[0]')) [-Werror,-Warray-bounds]
>>> # 00:23:33 fs/bcachefs/btree_cache.h:45:43: error: array index 0 is =
past the end of the array (that has type 'const __u64[0]' (aka 'const =
unsigned long long[0]')) [-Werror,-Warray-bounds]
>>> # 00:23:33 fs/bcachefs/btree_cache.c:67:9: error: array index 0 is =
past the end of the array (that has type 'const __u64[0]' (aka 'const =
unsigned long long[0]')) [-Werror,-Warray-bounds]
>>> # 00:23:33 fs/bcachefs/btree_cache.c:120:2: error: array index 0 is =
past the end of the array (that has type '__u64[0]' (aka 'unsigned long =
long[0]')) [-Werror,-Warray-bounds]
>>> # 00:23:33 fs/bcachefs/btree_cache.c:201:6: error: array index 0 is =
past the end of the array (that has type 'const __u64[0]' (aka 'const =
unsigned long long[0]')) [-Werror,-Warray-bounds]
>>=20
>> $ make LLVM=3D1 ARCH=3Darm allmodconfig fs/bcachefs/btree_cache.o
>>  CC [M]  fs/bcachefs/btree_cache.o
>> $
>>=20
>> ... what's up with this report?
>=20
> I cannot tell exactly from the information in this report but I =
suspect
> ARCH=3Darm allmodconfig is broken in mainline for other reasons =
(perhaps
> https://github.com/ClangBuiltLinux/linux/issues/1953?) and in trying =
to
> uncover that breakage in an automated fashion, it hit this build
> breakage and the bisect inadvertently switched to tracking down this
> already fixed set of warnings. I think this particular issue is =
resolved
> by Kent's recent array bounds fixes commit:
>=20
> https://git.kernel.org/linus/5cfd69775eb5460ef78bb5034a37eb0dc52ab65d
>=20
> Cheers,
> Nathan
>=20
>>>=20
>>> From
>>> # reset_artifacts:
>>> -10
>>> # build_abe binutils:
>>> -9
>>> # build_kernel_llvm:
>>> -5
>>> # build_abe qemu:
>>> -2
>>> # linux_n_obj:
>>> 32815
>>> # linux build successful:
>>> all
>>> # linux boot successful:
>>> boot
>>>=20
>>> The configuration of this build is:
>>> CI config tcwg_kernel/llvm-master-arm-mainline-allmodconfig
>>>=20
>>> =
-----------------8<--------------------------8<--------------------------8=
<--------------------------
>>> The information below can be used to reproduce a debug environment:
>>>=20
>>> Current build   : =
https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-mainline-allmodconf=
ig-build/110/artifact/artifacts
>>> Reference build : =
https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-mainline-allmodconf=
ig-build/109/artifact/artifacts
>>>=20
>>> Reproduce last good and first bad builds: =
https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/linux=
/sha1/1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a/tcwg_kernel/llvm-master-arm=
-mainline-allmodconfig/reproduction_instructions.txt
>>>=20
>>> Full commit : =
https://git.linaro.org/kernel-org/linux.git/commit/?id=3D1c6fdbd8f2465ddfb=
73a01ec620cbf3d14044e1a
>>>=20
>>> Latest bug report status : =
https://linaro.atlassian.net/browse/LLVM-1015
>>>=20
>>> List of configurations that regressed due to this commit :
>>> * tcwg_kernel
>>> ** llvm-master-arm-mainline-allmodconfig
>>> *** Failure
>>> *** =
https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/linux=
/sha1/1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a/tcwg_kernel/llvm-master-arm=
-mainline-allmodconfig/details.txt
>>> *** =
https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-mainline-allmodconf=
ig-build/110/
>>=20
>>=20
>>=20
>> --=20
>> Thanks,
>> ~Nick Desaulniers


