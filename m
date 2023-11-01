Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7D814A8A
	for <llvm@lists.linux.dev>; Wed,  1 Nov 2023 15:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rl+oxToe"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2c59a4dd14cso96217051fa.2
        for <llvm@lists.linux.dev>; Wed, 01 Nov 2023 08:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698854078; x=1699458878; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxpLhJ0zp+a9DVvh6xhHV0sFg67pwiRTGsIwUbqzpnE=;
        b=Rl+oxToeVNuxGK/xg19b69l+Lk62aX+E5PGaeEShJRM9j5NnXZyg6uHstdC0Q60gNW
         xhdUKUF+h0bRvHJxhzUGzFodoR5ZIiftQ5n1z5bcFprH9a15C8GarP4MkeqeDv37202s
         VpGFsdsmc4vv5CLb/W4/TOrxGsm6I1tkSfeaEy1/j6xpaI0lyojVcmKb8PW/zCKwOOYE
         DA+2bb1Tc9pa8G4D9uMXMXVWjZ0+CHp7G/Y09WWTnzT3n1oIu0CUs/cqV8OonEfGGrPf
         xymTSwwcGHX+Hl00piPIvFjdzSDOd8yE/cwXUY8b/tSWl/58Qfy0kR83/fK8w/BX/DM3
         V0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698854078; x=1699458878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxpLhJ0zp+a9DVvh6xhHV0sFg67pwiRTGsIwUbqzpnE=;
        b=O+5VsjO/CCV77xAzmlO7GRHHWtTqZbxhTDJdBoFk0KwLYAljKQ5B3ugDNZe1nAI+/F
         TXky+nUfMZy05+Cq8RUD4guFhPiKHw1oHpxEUMPq8uokjIjzLD9/jhWbiBAHlhkXFVIo
         2usToRVSCn188opJB2zC1lJOJv+zBAZ1ikAlCVxxG6fOua3TZDbqYogYdco2XUJdqh3n
         SPoLSZJ7c9GzqTFoBLWb1oblUiZMn+rc9NgVNoS8dtNYH7xtihSdJm1EuS39UPU7by+e
         xVqbyvrJwnY1GfMPX4+Pk+WvsiBn0iw6WkYc1KhBGX9ZxU+e3qh+aWyt8+XmE2b3lgin
         4Mbg==
X-Gm-Message-State: AOJu0Yxmrd+HXD4FoWAG4dTThqF/UD1sXxXkxKLz0wdHeCFnb1snh50C
	0tgTPxkOa1IiphLl8FlQ3TID+LUgQZVcYiltYS03mw==
X-Google-Smtp-Source: AGHT+IGiHnt00fYkQkO7qF1acI7ITnNWFug72r7xBpxWXPyoQtiIb9rgvA2hABMA6B+4hTlLHJUTO8pzXABOQ97FsTI=
X-Received: by 2002:a2e:9909:0:b0:2c5:137d:6baa with SMTP id
 v9-20020a2e9909000000b002c5137d6baamr12485544lji.14.1698854077548; Wed, 01
 Nov 2023 08:54:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1310397379.52558.1698849730427@jenkins.jenkins>
In-Reply-To: <1310397379.52558.1698849730427@jenkins.jenkins>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 1 Nov 2023 08:54:26 -0700
Message-ID: <CAKwvOdmomdYWFxZO+61kFN9soaxiOGAr8dM_G80HSufJa=XGdQ@mail.gmail.com>
Subject: Re: [Linaro-TCWG-CI] v6.6-rc1-17-g1c6fdbd8f246: Failure on arm
To: linaro-toolchain@lists.linaro.org, Nathan Chancellor <nathan@kernel.org>, 
	Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>
Cc: llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 7:42=E2=80=AFAM <ci_notify@linaro.org> wrote:
>
> Dear contributor, our automatic CI has detected problems related to your =
patch(es).  Please find some details below.  If you have any questions, ple=
ase follow up on linaro-toolchain@lists.linaro.org mailing list, Libera's #=
linaro-tcwg channel, or ping your favourite Linaro toolchain developer on t=
he usual project channel.
>
> In CI config tcwg_kernel/llvm-master-arm-mainline-allmodconfig after:

ok, so ARCH=3Darm allmodconfig on mainline...

>
>   | commit v6.6-rc1-17-g1c6fdbd8f246
>   | Author: Kent Overstreet <kent.overstreet@gmail.com>
>   | Date:   Thu Mar 16 22:18:50 2017 -0800
>   |
>   |     bcachefs: Initial commit
>   |
>   |     Initially forked from drivers/md/bcache, bcachefs is a new copy-o=
n-write
>   |     filesystem with every feature you could possibly want.
>   |
>   |     Website: https://bcachefs.org
>   |
>   | ... 1 lines of the commit log omitted.
>
> Results changed to
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 23730
> # First few build errors in logs:
>
> # 00:23:16 fs/bcachefs/btree_cache.h:45:43: error: array index 0 is past =
the end of the array (that has type 'const __u64[0]' (aka 'const unsigned l=
ong long[0]')) [-Werror,-Warray-bounds]
> # 00:23:17 fs/bcachefs/alloc.c:332:9: error: call to undeclared function =
'COUNT_ARGS'; ISO C99 and later do not support implicit function declaratio=
ns [-Wimplicit-function-declaration]

^
$ file fs/bcachefs/alloc.c
fs/bcachefs/alloc.c: cannot open `fs/bcachefs/alloc.c' (No such file
or directory)

> # 00:23:17 make[4]: *** [scripts/Makefile.build:243: fs/bcachefs/alloc.o]=
 Error 1
> # 00:23:29 fs/bcachefs/btree_cache.h:45:43: error: array index 0 is past =
the end of the array (that has type 'const __u64[0]' (aka 'const unsigned l=
ong long[0]')) [-Werror,-Warray-bounds]
> # 00:23:30 make[4]: *** [scripts/Makefile.build:243: fs/bcachefs/bset.o] =
Error 1

^
$ make LLVM=3D1 ARCH=3Darm allmodconfig fs/bcachefs/bset.o
  CC [M]  fs/bcachefs/bset.o
$

> # 00:23:33 fs/bcachefs/btree_cache.h:45:43: error: array index 0 is past =
the end of the array (that has type 'const __u64[0]' (aka 'const unsigned l=
ong long[0]')) [-Werror,-Warray-bounds]
> # 00:23:33 fs/bcachefs/btree_cache.h:45:43: error: array index 0 is past =
the end of the array (that has type 'const __u64[0]' (aka 'const unsigned l=
ong long[0]')) [-Werror,-Warray-bounds]
> # 00:23:33 fs/bcachefs/btree_cache.c:67:9: error: array index 0 is past t=
he end of the array (that has type 'const __u64[0]' (aka 'const unsigned lo=
ng long[0]')) [-Werror,-Warray-bounds]
> # 00:23:33 fs/bcachefs/btree_cache.c:120:2: error: array index 0 is past =
the end of the array (that has type '__u64[0]' (aka 'unsigned long long[0]'=
)) [-Werror,-Warray-bounds]
> # 00:23:33 fs/bcachefs/btree_cache.c:201:6: error: array index 0 is past =
the end of the array (that has type 'const __u64[0]' (aka 'const unsigned l=
ong long[0]')) [-Werror,-Warray-bounds]

$ make LLVM=3D1 ARCH=3Darm allmodconfig fs/bcachefs/btree_cache.o
  CC [M]  fs/bcachefs/btree_cache.o
$

... what's up with this report?

>
> From
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 32815
> # linux build successful:
> all
> # linux boot successful:
> boot
>
> The configuration of this build is:
> CI config tcwg_kernel/llvm-master-arm-mainline-allmodconfig
>
> -----------------8<--------------------------8<--------------------------=
8<--------------------------
> The information below can be used to reproduce a debug environment:
>
> Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-=
mainline-allmodconfig-build/110/artifact/artifacts
> Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-=
mainline-allmodconfig-build/109/artifact/artifacts
>
> Reproduce last good and first bad builds: https://git-us.linaro.org/toolc=
hain/ci/interesting-commits.git/plain/linux/sha1/1c6fdbd8f2465ddfb73a01ec62=
0cbf3d14044e1a/tcwg_kernel/llvm-master-arm-mainline-allmodconfig/reproducti=
on_instructions.txt
>
> Full commit : https://git.linaro.org/kernel-org/linux.git/commit/?id=3D1c=
6fdbd8f2465ddfb73a01ec620cbf3d14044e1a
>
> Latest bug report status : https://linaro.atlassian.net/browse/LLVM-1015
>
> List of configurations that regressed due to this commit :
> * tcwg_kernel
> ** llvm-master-arm-mainline-allmodconfig
> *** Failure
> *** https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/=
linux/sha1/1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a/tcwg_kernel/llvm-master=
-arm-mainline-allmodconfig/details.txt
> *** https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-mainline-allmo=
dconfig-build/110/



--=20
Thanks,
~Nick Desaulniers
