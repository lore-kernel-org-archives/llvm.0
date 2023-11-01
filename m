Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F0D11185
	for <llvm@lists.linux.dev>; Wed,  1 Nov 2023 18:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oY6xlD+E"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9bf0bee9f2fso3131866b.1
        for <llvm@lists.linux.dev>; Wed, 01 Nov 2023 11:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698863685; x=1699468485; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3GGkfxqwdjoUlB1u6QrfUCCcixv1yQ3C2k6dlFPH6Q=;
        b=oY6xlD+EjJlQIcmeGVkT23+rnwKVXi8xma/2aec/+Ek/0JG83TO4YPB5deIwfX2pXF
         w+HkM01FTjBjF73Qc958UzMCmlpQ2cDe84P5jtI/gKZaZJoDSMoFsMRkvXtYvj3DH0AE
         Dmdyfx/N0jnXfKVs8Nko5ViM/Jqc0wgls/GjYuLZ2bP2PLM83I8KWH8Wnt7pzWPun0Kw
         GYiN5/g9JhLZnRWPYGhk8yOF7XTRWNh2viabtGRZMDurPzThO3KMedTnDnNfMRee0OO7
         xNjwsfeqM4q8nHLOrWvmXpBKr6gTvB0EkaqYRxC+95+F5DyFZ6+g3LjTc+lHHHADlOzh
         icXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698863685; x=1699468485;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3GGkfxqwdjoUlB1u6QrfUCCcixv1yQ3C2k6dlFPH6Q=;
        b=kh/t6pMInUtnQg8alG2/1zoENCWs6Oev2e4etVQy6dnZHx1uw24XulPhW1k9wFa8vn
         pAozI2Kxw14FMc4jjKbXJkE8Zsdlqck/xzhvR7H0/2VJ30F0wB2qGUuckSfqM9b5e5Sq
         3VWekkWAld7kl3XwZyyqRrnYB8IeTvPli/JB2MfTb6wyJKrotOKfMiLkKp46k7KPKhNh
         SIMTfQ+/Lc5saW4byEONAly0/N+vzmZccJMieS+FedVgpTWHDI9aBanqQLce88m/lnPk
         GxbFeSdvNhGI3l+jkzq5P0HLB1+EKWPtZgFnzWwADziXP1bh0PdvHOBuC3sOjs2VmJbo
         S98w==
X-Gm-Message-State: AOJu0YwQkx9GjM/Tp/FtiRVYDGC7rDvsJi49OYQ0VViXu+W7ycsUlzxi
	anmYfH+xTiq4IAR+W3yflgRJ0xXoMFFdYEtwenzMdt4=
X-Google-Smtp-Source: AGHT+IFNBzVg2piLwm963cQQkXmbigT60GpnAtsYutmDT1cJyiGcDGSLDE8otv/fPjH730AHseLJrA==
X-Received: by 2002:a17:907:1c92:b0:9be:8de2:a56c with SMTP id nb18-20020a1709071c9200b009be8de2a56cmr14911124ejc.0.1698863685398;
        Wed, 01 Nov 2023 11:34:45 -0700 (PDT)
Received: from smtpclient.apple ([37.252.80.67])
        by smtp.gmail.com with ESMTPSA id v23-20020a1709064e9700b009ade1a4f795sm227573eju.168.2023.11.01.11.34.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Nov 2023 11:34:44 -0700 (PDT)
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
In-Reply-To: <CAKwvOdn0F4SzeT0bSFHUD1QKsT=fkqfUBbsq+q1r_3Y7o9kHLg@mail.gmail.com>
Date: Wed, 1 Nov 2023 22:34:33 +0400
Cc: Nathan Chancellor <nathan@kernel.org>,
 Linaro Toolchain Working Group <linaro-toolchain@lists.linaro.org>,
 llvm@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <0B1B406F-9E5E-4E23-A710-21A8B49A196D@linaro.org>
References: <1310397379.52558.1698849730427@jenkins.jenkins>
 <CAKwvOdmomdYWFxZO+61kFN9soaxiOGAr8dM_G80HSufJa=XGdQ@mail.gmail.com>
 <20231101172208.GA1368360@dev-arch.thelio-3990X>
 <F802D6D3-CB3A-43AC-99EF-1220585F49D8@linaro.org>
 <CAKwvOdn0F4SzeT0bSFHUD1QKsT=fkqfUBbsq+q1r_3Y7o9kHLg@mail.gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
X-Mailer: Apple Mail (2.3731.700.6)

> On Nov 1, 2023, at 22:22, Nick Desaulniers <ndesaulniers@google.com> =
wrote:
>=20
> On Wed, Nov 1, 2023 at 11:02=E2=80=AFAM Maxim Kuvyrkov
> <maxim.kuvyrkov@linaro.org> wrote:
>>=20
>> Hi Nick,
>> Hi Nathan,
>>=20
>> I don't see mistakes from CI here.  Are you using tip-of-trunk LLVM?
>>=20
>> This report was generated for LLVM revision =
llvmorg-18-init-10263-g1abd8d1a8d96 and linux revision =
v6.6-rc1-17-g1c6fdbd8f246 .  The build log with errors is at [1].
>>=20
>> It seems that a later commit in Linux kernel fixed some of the errors =
in [1], but still with the current linux.git:master 2 errors remain (see =
[2]):
>>=20
>> 00:28:15 fs/bcachefs/chardev.c:655:6: error: stack frame size (1032) =
exceeds limit (1024) in 'bch2_fs_ioctl' [-Werror,-Wframe-larger-than]
>> 00:28:15   655 | long bch2_fs_ioctl(struct bch_fs *c, unsigned cmd, =
void __user *arg)
>> 00:28:15       |      ^
>> 00:28:15 1 error generated.
>> 00:28:15 make[4]: *** [scripts/Makefile.build:243: =
fs/bcachefs/chardev.o] Error 1
>> 00:29:39 fs/bcachefs/fs-common.c:356:5: error: stack frame size =
(1128) exceeds limit (1024) in 'bch2_rename_trans' =
[-Werror,-Wframe-larger-than]
>> 00:29:39   356 | int bch2_rename_trans(struct btree_trans *trans,
>> 00:29:39       |     ^
>> 00:29:39 1 error generated.
>=20
> These are different warnings in different object files than from the
> initial report.

Oh, indeed.

>=20
> Maybe bisection started due to those, but didn't notice different
> warnings going further back, because of -Werror, and reported the
> initial commit that was problematic (even if the warnings differed and
> were since fixed).

This is exactly right.

--
Maxim Kuvyrkov
https://www.linaro.org


>=20
>>=20
>> These errors are near-misses, so if you are using a different LLVM =
revision, they can disappear.
>>=20
>> [1] =
https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-mainline-allmodconf=
ig-build/110/artifact/artifacts/06-build_linux/console.log.xz
>>=20
>> [2] =
https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-mainline-allmodconf=
ig-build/111/artifact/artifacts/06-build_linux/console.log.xz
>>=20
>> --
>> Maxim Kuvyrkov
>> https://www.linaro.org
>>=20
>>> On Nov 1, 2023, at 21:22, Nathan Chancellor <nathan@kernel.org> =
wrote:
>>>=20
>>> On Wed, Nov 01, 2023 at 08:54:26AM -0700, Nick Desaulniers wrote:
>>>> On Wed, Nov 1, 2023 at 7:42=E2=80=AFAM <ci_notify@linaro.org> =
wrote:
>>>>>=20
>>>>> Dear contributor, our automatic CI has detected problems related =
to your patch(es).  Please find some details below.  If you have any =
questions, please follow up on linaro-toolchain@lists.linaro.org mailing =
list, Libera's #linaro-tcwg channel, or ping your favourite Linaro =
toolchain developer on the usual project channel.
>>>>>=20
>>>>> In CI config tcwg_kernel/llvm-master-arm-mainline-allmodconfig =
after:
>>>>=20
>>>> ok, so ARCH=3Darm allmodconfig on mainline...
>>>>=20
>>>>>=20
>>>>> | commit v6.6-rc1-17-g1c6fdbd8f246
>>>>> | Author: Kent Overstreet <kent.overstreet@gmail.com>
>>>>> | Date:   Thu Mar 16 22:18:50 2017 -0800
>>>>> |
>>>>> |     bcachefs: Initial commit
>>>>> |
>>>>> |     Initially forked from drivers/md/bcache, bcachefs is a new =
copy-on-write
>>>>> |     filesystem with every feature you could possibly want.
>>>>> |
>>>>> |     Website: https://bcachefs.org
>>>>> |
>>>>> | ... 1 lines of the commit log omitted.
>>>>>=20
>>>>> Results changed to
>>>>> # reset_artifacts:
>>>>> -10
>>>>> # build_abe binutils:
>>>>> -9
>>>>> # build_kernel_llvm:
>>>>> -5
>>>>> # build_abe qemu:
>>>>> -2
>>>>> # linux_n_obj:
>>>>> 23730
>>>>> # First few build errors in logs:
>>>>>=20
>>>>> # 00:23:16 fs/bcachefs/btree_cache.h:45:43: error: array index 0 =
is past the end of the array (that has type 'const __u64[0]' (aka 'const =
unsigned long long[0]')) [-Werror,-Warray-bounds]
>>>>> # 00:23:17 fs/bcachefs/alloc.c:332:9: error: call to undeclared =
function 'COUNT_ARGS'; ISO C99 and later do not support implicit =
function declarations [-Wimplicit-function-declaration]
>>>>=20
>>>> ^
>>>> $ file fs/bcachefs/alloc.c
>>>> fs/bcachefs/alloc.c: cannot open `fs/bcachefs/alloc.c' (No such =
file
>>>> or directory)
>>>>=20
>>>>> # 00:23:17 make[4]: *** [scripts/Makefile.build:243: =
fs/bcachefs/alloc.o] Error 1
>>>>> # 00:23:29 fs/bcachefs/btree_cache.h:45:43: error: array index 0 =
is past the end of the array (that has type 'const __u64[0]' (aka 'const =
unsigned long long[0]')) [-Werror,-Warray-bounds]
>>>>> # 00:23:30 make[4]: *** [scripts/Makefile.build:243: =
fs/bcachefs/bset.o] Error 1
>>>>=20
>>>> ^
>>>> $ make LLVM=3D1 ARCH=3Darm allmodconfig fs/bcachefs/bset.o
>>>> CC [M]  fs/bcachefs/bset.o
>>>> $
>>>>=20
>>>>> # 00:23:33 fs/bcachefs/btree_cache.h:45:43: error: array index 0 =
is past the end of the array (that has type 'const __u64[0]' (aka 'const =
unsigned long long[0]')) [-Werror,-Warray-bounds]
>>>>> # 00:23:33 fs/bcachefs/btree_cache.h:45:43: error: array index 0 =
is past the end of the array (that has type 'const __u64[0]' (aka 'const =
unsigned long long[0]')) [-Werror,-Warray-bounds]
>>>>> # 00:23:33 fs/bcachefs/btree_cache.c:67:9: error: array index 0 is =
past the end of the array (that has type 'const __u64[0]' (aka 'const =
unsigned long long[0]')) [-Werror,-Warray-bounds]
>>>>> # 00:23:33 fs/bcachefs/btree_cache.c:120:2: error: array index 0 =
is past the end of the array (that has type '__u64[0]' (aka 'unsigned =
long long[0]')) [-Werror,-Warray-bounds]
>>>>> # 00:23:33 fs/bcachefs/btree_cache.c:201:6: error: array index 0 =
is past the end of the array (that has type 'const __u64[0]' (aka 'const =
unsigned long long[0]')) [-Werror,-Warray-bounds]
>>>>=20
>>>> $ make LLVM=3D1 ARCH=3Darm allmodconfig fs/bcachefs/btree_cache.o
>>>> CC [M]  fs/bcachefs/btree_cache.o
>>>> $
>>>>=20
>>>> ... what's up with this report?
>>>=20
>>> I cannot tell exactly from the information in this report but I =
suspect
>>> ARCH=3Darm allmodconfig is broken in mainline for other reasons =
(perhaps
>>> https://github.com/ClangBuiltLinux/linux/issues/1953?) and in trying =
to
>>> uncover that breakage in an automated fashion, it hit this build
>>> breakage and the bisect inadvertently switched to tracking down this
>>> already fixed set of warnings. I think this particular issue is =
resolved
>>> by Kent's recent array bounds fixes commit:
>>>=20
>>> =
https://git.kernel.org/linus/5cfd69775eb5460ef78bb5034a37eb0dc52ab65d
>>>=20
>>> Cheers,
>>> Nathan
>>>=20
>>>>>=20
>>>>> From
>>>>> # reset_artifacts:
>>>>> -10
>>>>> # build_abe binutils:
>>>>> -9
>>>>> # build_kernel_llvm:
>>>>> -5
>>>>> # build_abe qemu:
>>>>> -2
>>>>> # linux_n_obj:
>>>>> 32815
>>>>> # linux build successful:
>>>>> all
>>>>> # linux boot successful:
>>>>> boot
>>>>>=20
>>>>> The configuration of this build is:
>>>>> CI config tcwg_kernel/llvm-master-arm-mainline-allmodconfig
>>>>>=20
>>>>> =
-----------------8<--------------------------8<--------------------------8=
<--------------------------
>>>>> The information below can be used to reproduce a debug =
environment:
>>>>>=20
>>>>> Current build   : =
https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-mainline-allmodconf=
ig-build/110/artifact/artifacts
>>>>> Reference build : =
https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-mainline-allmodconf=
ig-build/109/artifact/artifacts
>>>>>=20
>>>>> Reproduce last good and first bad builds: =
https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/linux=
/sha1/1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a/tcwg_kernel/llvm-master-arm=
-mainline-allmodconfig/reproduction_instructions.txt
>>>>>=20
>>>>> Full commit : =
https://git.linaro.org/kernel-org/linux.git/commit/?id=3D1c6fdbd8f2465ddfb=
73a01ec620cbf3d14044e1a
>>>>>=20
>>>>> Latest bug report status : =
https://linaro.atlassian.net/browse/LLVM-1015
>>>>>=20
>>>>> List of configurations that regressed due to this commit :
>>>>> * tcwg_kernel
>>>>> ** llvm-master-arm-mainline-allmodconfig
>>>>> *** Failure
>>>>> *** =
https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/linux=
/sha1/1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a/tcwg_kernel/llvm-master-arm=
-mainline-allmodconfig/details.txt
>>>>> *** =
https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-mainline-allmodconf=
ig-build/110/
>>>>=20
>>>>=20
>>>>=20
>>>> --
>>>> Thanks,
>>>> ~Nick Desaulniers
>>=20
>>=20
>=20
>=20
> --=20
> Thanks,
> ~Nick Desaulniers


