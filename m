Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93603FD0
	for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 16:00:45 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id l18so18187606lji.12
        for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 09:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tnso6ZagMQK9pK7YlwLa0K1RsHVORZGH60a5gBpaGlI=;
        b=e0r2tpsDwdbWMHqRYYycTuAs/igasHt0vklO4CrLKHVSC2sT1mMecSU59nYOqL7IuK
         jsa0Od/qAEpc5jDylRTgA3K7RepFI2pdLpZxgfz9ZmBkQci7oNNU0E6oZaZe7e9JC2dV
         EdlIq1OX2lLHIcrQn6k3DSeQsHbxd5X3kbUgTxpvEXLCLANYC9h5gy82UuvZXcxcIVS0
         iAPcg1/rKxOX3Suub9B02wPUf7PMrXGWWPY0e1DexAjXXBAoWeE4iPKsoLfjRdecAQdt
         akuWY22kPKFcaIwGRtyj+N7Qw2Wew2D6bLzOUatFArUm5TfBh0jnA4KDO7z6YDbSef49
         FXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tnso6ZagMQK9pK7YlwLa0K1RsHVORZGH60a5gBpaGlI=;
        b=eYDFFSpPpiieYrE/3G6EQHB8fSIr/dehrV1os2ss5cD+i8rwEcoGvpV9Me04Du9xWj
         cJ4S7/rjx3zamW9/ohxBBHjaFbR+dWRA6S4LiP0/ZUC7SNa2a6iUTLP+jhI9JJgN4azI
         B7JPR0HevqyOu3938C8KE+miTMtAZLbd6xYVqsrqypsKmprzdGPMQW1AChAwo0cS1eR9
         Kocl5tWFdtekY091QvK6ghPZ7x8VMRKiBpTJlraP5evzf7I+qfFCDE84RLlHcHl52XL/
         0IcuDxQPOke3xyb6BywELGg7Lw139C6uASnUeYQO+wkXZXPTqsvwxutrB2MQy9B6dF/K
         3Urw==
X-Gm-Message-State: AOAM532NnWagvG6j3njNnqFIlTP2TvLBgTLZNDzriiCCI+BylqK4/6yA
	IMc74Oe4cX5n7ToeatE99AniCGTQ6YOGhxIpjGZo1A==
X-Google-Smtp-Source: ABdhPJzwxNehhDgdc7NG25AtQhh/6ceP6pcGAemKEXDbdz4RMy9zcqz2YB5/RmK+c1OQO7MFW3XSVaoyc9tQX06yY48=
X-Received: by 2002:a05:651c:1305:: with SMTP id u5mr10831205lja.198.1631548843315;
 Mon, 13 Sep 2021 09:00:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1723771714.8049.1630601502888@localhost> <CAKwvOdmSW1Ntom389FD3qOC=iTCwJH=g5MiuRdeftxMdwbRBbg@mail.gmail.com>
 <CAFYwA27_YcNO3zebCAXNZ+Emb2vYNtjeTaoDqm17KMh=23H3DQ@mail.gmail.com>
In-Reply-To: <CAFYwA27_YcNO3zebCAXNZ+Emb2vYNtjeTaoDqm17KMh=23H3DQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 13 Sep 2021 09:00:31 -0700
Message-ID: <CAKwvOdndJA-6jEAka9Zzsto==D49=Kk=YyPMf6ZYpFPwHCuriQ@mail.gmail.com>
Subject: Re: [CI-NOTIFY]: TCWG Bisect tcwg_kernel/llvm-master-aarch64-mainline-allmodconfig
 - Build # 10 - Successful!
To: Diana Picus <diana.picus@linaro.org>
Cc: ci_notify@linaro.org, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, 
	tcwg-validation@linaro.org, clang-built-linux@googlegroups.com, 
	llvm@lists.linux.dev, arnd@linaro.org, 
	Linaro Toolchain Mailman List <linaro-toolchain@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 13, 2021 at 12:13 AM Diana Picus <diana.picus@linaro.org> wrote=
:
>
> Hi Nick,
>
> We have changed our infrastructure to email llvm@lists.linux.dev on the 6=
th of September [1]. The email you reported seems to have been sent before =
that (on the 2nd of September). Newer emails ought to go to the right place=
, please let us know if you find emails to @googlegroups from jobs started =
after the 6th of September.

Ah, thanks!

>
> Cheers,
> Diana
>
> [1] https://git.linaro.org/toolchain/jenkins-scripts.git/commit/?id=3D18e=
73813f104f4d93b8f2b91c9c676b23cb6adea
>
> On Fri, 10 Sept 2021 at 21:13, Nick Desaulniers <ndesaulniers@google.com>=
 wrote:
>>
>> Hi Maxim,
>> We're looking to turn down our old @googlegroups.com mailing list. Any
>> chance these reports can instead be sent to llvm@lists.linux.dev so
>> that they are archived by lore.kernel.org?
>>
>> On Thu, Sep 9, 2021 at 10:20 PM <ci_notify@linaro.org> wrote:
>> >
>> > Successfully identified regression in *linux* in CI configuration tcwg=
_kernel/llvm-master-aarch64-mainline-allmodconfig.  So far, this commit has=
 regressed CI configurations:
>> >  - tcwg_kernel/llvm-master-aarch64-mainline-allmodconfig
>> >
>> > Culprit:
>> > <cut>
>> > commit c3496da580b0fc10fdeba8f6a5e6aef4c78b5598
>> > Author: Slark Xiao <slark_xiao@163.com>
>> > Date:   Tue Aug 31 10:40:25 2021 +0800
>> >
>> >     net: Add depends on OF_NET for LiteX's LiteETH
>> >
>> >     Current settings may produce a build error when
>> >     CONFIG_OF_NET is disabled. The CONFIG_OF_NET controls
>> >     a headfile <linux/of.h> and some functions
>> >      in <linux/of_net.h>.
>> >
>> >     Signed-off-by: Slark Xiao <slark_xiao@163.com>
>> >     Signed-off-by: Jakub Kicinski <kuba@kernel.org>
>> > </cut>
>> >
>> > Results regressed to (for first_bad =3D=3D c3496da580b0fc10fdeba8f6a5e=
6aef4c78b5598)
>> > # reset_artifacts:
>> > -10
>> > # build_abe binutils:
>> > -9
>> > # build_llvm:
>> > -5
>> > # build_abe qemu:
>> > -2
>> > # linux_n_obj:
>> > 29873
>> > # linux build successful:
>> > all
>> > # First few build errors in logs:
>> >
>> > from (for last_good =3D=3D a9e7c3cedc2914f63cd135b75832b9bf850af782)
>> > # reset_artifacts:
>> > -10
>> > # build_abe binutils:
>> > -9
>> > # build_llvm:
>> > -5
>> > # build_abe qemu:
>> > -2
>> > # linux_n_obj:
>> > 29873
>> > # linux build successful:
>> > all
>> > # linux boot successful:
>> > boot
>> >
>> > Artifacts of last_good build: https://ci.linaro.org/job/tcwg_kernel-ll=
vm-bisect-llvm-master-aarch64-mainline-allmodconfig/10/artifact/artifacts/b=
uild-a9e7c3cedc2914f63cd135b75832b9bf850af782/
>> > Artifacts of first_bad build: https://ci.linaro.org/job/tcwg_kernel-ll=
vm-bisect-llvm-master-aarch64-mainline-allmodconfig/10/artifact/artifacts/b=
uild-c3496da580b0fc10fdeba8f6a5e6aef4c78b5598/
>> > Build top page/logs: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect=
-llvm-master-aarch64-mainline-allmodconfig/10/
>> >
>> > Configuration details:
>> >
>> >
>> > Reproduce builds:
>> > <cut>
>> > mkdir investigate-linux-c3496da580b0fc10fdeba8f6a5e6aef4c78b5598
>> > cd investigate-linux-c3496da580b0fc10fdeba8f6a5e6aef4c78b5598
>> >
>> > git clone https://git.linaro.org/toolchain/jenkins-scripts
>> >
>> > mkdir -p artifacts/manifests
>> > curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/jo=
b/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allmodconfig/10/arti=
fact/artifacts/manifests/build-baseline.sh --fail
>> > curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/=
job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allmodconfig/10/ar=
tifact/artifacts/manifests/build-parameters.sh --fail
>> > curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-b=
isect-llvm-master-aarch64-mainline-allmodconfig/10/artifact/artifacts/test.=
sh --fail
>> > chmod +x artifacts/test.sh
>> >
>> > # Reproduce the baseline build (build all pre-requisites)
>> > ./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-ba=
seline.sh
>> >
>> > # Save baseline build state (which is then restored in artifacts/test.=
sh)
>> > mkdir -p ./bisect
>> > rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifac=
ts/ --exclude /linux/ ./ ./bisect/baseline/
>> >
>> > cd linux
>> >
>> > # Reproduce first_bad build
>> > git checkout --detach c3496da580b0fc10fdeba8f6a5e6aef4c78b5598
>> > ../artifacts/test.sh
>> >
>> > # Reproduce last_good build
>> > git checkout --detach a9e7c3cedc2914f63cd135b75832b9bf850af782
>> > ../artifacts/test.sh
>> >
>> > cd ..
>> > </cut>
>> >
>> > History of pending regressions and results: https://git.linaro.org/too=
lchain/ci/base-artifacts.git/log/?h=3Dlinaro-local/ci/tcwg_kernel/llvm-mast=
er-aarch64-mainline-allmodconfig
>> >
>> > Artifacts: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-mast=
er-aarch64-mainline-allmodconfig/10/artifact/artifacts/
>> > Build log: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-mast=
er-aarch64-mainline-allmodconfig/10/consoleText
>> >
>> > Full commit (up to 1000 lines):
>> > <cut>
>> > commit c3496da580b0fc10fdeba8f6a5e6aef4c78b5598
>> > Author: Slark Xiao <slark_xiao@163.com>
>> > Date:   Tue Aug 31 10:40:25 2021 +0800
>> >
>> >     net: Add depends on OF_NET for LiteX's LiteETH
>> >
>> >     Current settings may produce a build error when
>> >     CONFIG_OF_NET is disabled. The CONFIG_OF_NET controls
>> >     a headfile <linux/of.h> and some functions
>> >      in <linux/of_net.h>.
>> >
>> >     Signed-off-by: Slark Xiao <slark_xiao@163.com>
>> >     Signed-off-by: Jakub Kicinski <kuba@kernel.org>
>> > ---
>> >  drivers/net/ethernet/litex/Kconfig | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/drivers/net/ethernet/litex/Kconfig b/drivers/net/ethernet=
/litex/Kconfig
>> > index 265dba414b41..63bf01d28f0c 100644
>> > --- a/drivers/net/ethernet/litex/Kconfig
>> > +++ b/drivers/net/ethernet/litex/Kconfig
>> > @@ -17,6 +17,7 @@ if NET_VENDOR_LITEX
>> >
>> >  config LITEX_LITEETH
>> >         tristate "LiteX Ethernet support"
>> > +       depends on OF_NET
>> >         help
>> >           If you wish to compile a kernel for hardware with a LiteX Li=
teEth
>> >           device then you should answer Y to this.
>> > </cut>
>> >
>> > --
>> > You received this message because you are subscribed to the Google Gro=
ups "Clang Built Linux" group.
>> > To unsubscribe from this group and stop receiving emails from it, send=
 an email to clang-built-linux+unsubscribe@googlegroups.com.
>> > To view this discussion on the web visit https://groups.google.com/d/m=
sgid/clang-built-linux/1723771714.8049.1630601502888%40localhost.
>>
>>
>>
>> --
>> Thanks,
>> ~Nick Desaulniers
>> _______________________________________________
>> linaro-toolchain mailing list
>> linaro-toolchain@lists.linaro.org
>> https://lists.linaro.org/mailman/listinfo/linaro-toolchain



--=20
Thanks,
~Nick Desaulniers
