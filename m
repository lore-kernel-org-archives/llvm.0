Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D563FC3
	for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 19:13:39 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id p15so4833610ljn.3
        for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 12:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TcDMnxGRTLykeutj8nRuBAPXDOoHE9kaLJ/+ttKjtNM=;
        b=CZ61t5GMQjWweTHrra773s2PYyWsxONxCQ/At3qAROVQsoUIGMUKDFUwHnuXiv/K0Z
         c0MrTb0CXvgOuyFNkn4v4C3PpiBrTDxEl8qkNM1uNybJzdZ2WSTgisUKbq4fwQA4O7zA
         sTkfkn/0Mn0UO5TeP3+aNjCDaFD3JV9on9AGsGMwPcMycwGdzVteVXM1oYo5NqfgZyS4
         A15yvBY+xxFb7NBlA48YXvpIWsWNcXJ221Kh+Td/a9ZEHd+Nsxo6kYOR5DcNJNRWnwLI
         0CLXQuY+Uofrne+ewV6QOj2kWcmAg/KqxgjeO8greMcm0QQOl3DHkwDf/RAMP7jGIRgO
         SDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TcDMnxGRTLykeutj8nRuBAPXDOoHE9kaLJ/+ttKjtNM=;
        b=QoFEHyaqPeHV1ZJwikEkJtpoq94dT2b15DYXEJsiZrpOIb0uUQP5bySFOIyjDx4UGH
         0f/1YyLefAsuXVYcAqd17Xj7/LSxb9S/g2gADUU/N81huzTLmwT2A1A/9VEEcF820Bhl
         flolOyqWl0pjr9Lroo0l/UU5VORYIXz0wyWFMFhqTx1+LPtzSYS9WpMO19zfistKuikW
         XKtG7gPnFsBqp3pA4gHPjxw4U0rEMetkCzK4M8d9VGVY2Drpa8Klq0iaa7NeAsqe6f/O
         wsVPm8jl9gV3/vdH4cNbiQJc5CB2WbrqwdmBbynaTbZHdcvsReu5yQXkVkjSUVqGAq/b
         WK6A==
X-Gm-Message-State: AOAM5337UTS3YOWIfT3LR34lXYoePSQnqnqpaaW+P3e3QxqwWpLe2eBM
	NbovJT8Yc3KELjb7J+PWVubd2m2Zwdojf8umX4Vsqw==
X-Google-Smtp-Source: ABdhPJyH7d4axWSDp/8r15msh1yVcuFa8f9wl/neatKTgGTV/ikwzOMCOznsh9jPfEeCe6tkqEU3Uh1pY/PxGJl4LX0=
X-Received: by 2002:a05:651c:1305:: with SMTP id u5mr5263539lja.198.1631301217056;
 Fri, 10 Sep 2021 12:13:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1723771714.8049.1630601502888@localhost>
In-Reply-To: <1723771714.8049.1630601502888@localhost>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 10 Sep 2021 12:13:25 -0700
Message-ID: <CAKwvOdmSW1Ntom389FD3qOC=iTCwJH=g5MiuRdeftxMdwbRBbg@mail.gmail.com>
Subject: Re: [CI-NOTIFY]: TCWG Bisect tcwg_kernel/llvm-master-aarch64-mainline-allmodconfig
 - Build # 10 - Successful!
To: ci_notify@linaro.org, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>
Cc: tcwg-validation@linaro.org, linaro-toolchain@lists.linaro.org, 
	clang-built-linux@googlegroups.com, arnd@linaro.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Maxim,
We're looking to turn down our old @googlegroups.com mailing list. Any
chance these reports can instead be sent to llvm@lists.linux.dev so
that they are archived by lore.kernel.org?

On Thu, Sep 9, 2021 at 10:20 PM <ci_notify@linaro.org> wrote:
>
> Successfully identified regression in *linux* in CI configuration tcwg_kernel/llvm-master-aarch64-mainline-allmodconfig.  So far, this commit has regressed CI configurations:
>  - tcwg_kernel/llvm-master-aarch64-mainline-allmodconfig
>
> Culprit:
> <cut>
> commit c3496da580b0fc10fdeba8f6a5e6aef4c78b5598
> Author: Slark Xiao <slark_xiao@163.com>
> Date:   Tue Aug 31 10:40:25 2021 +0800
>
>     net: Add depends on OF_NET for LiteX's LiteETH
>
>     Current settings may produce a build error when
>     CONFIG_OF_NET is disabled. The CONFIG_OF_NET controls
>     a headfile <linux/of.h> and some functions
>      in <linux/of_net.h>.
>
>     Signed-off-by: Slark Xiao <slark_xiao@163.com>
>     Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> </cut>
>
> Results regressed to (for first_bad == c3496da580b0fc10fdeba8f6a5e6aef4c78b5598)
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 29873
> # linux build successful:
> all
> # First few build errors in logs:
>
> from (for last_good == a9e7c3cedc2914f63cd135b75832b9bf850af782)
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 29873
> # linux build successful:
> all
> # linux boot successful:
> boot
>
> Artifacts of last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allmodconfig/10/artifact/artifacts/build-a9e7c3cedc2914f63cd135b75832b9bf850af782/
> Artifacts of first_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allmodconfig/10/artifact/artifacts/build-c3496da580b0fc10fdeba8f6a5e6aef4c78b5598/
> Build top page/logs: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allmodconfig/10/
>
> Configuration details:
>
>
> Reproduce builds:
> <cut>
> mkdir investigate-linux-c3496da580b0fc10fdeba8f6a5e6aef4c78b5598
> cd investigate-linux-c3496da580b0fc10fdeba8f6a5e6aef4c78b5598
>
> git clone https://git.linaro.org/toolchain/jenkins-scripts
>
> mkdir -p artifacts/manifests
> curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allmodconfig/10/artifact/artifacts/manifests/build-baseline.sh --fail
> curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allmodconfig/10/artifact/artifacts/manifests/build-parameters.sh --fail
> curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allmodconfig/10/artifact/artifacts/test.sh --fail
> chmod +x artifacts/test.sh
>
> # Reproduce the baseline build (build all pre-requisites)
> ./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh
>
> # Save baseline build state (which is then restored in artifacts/test.sh)
> mkdir -p ./bisect
> rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /linux/ ./ ./bisect/baseline/
>
> cd linux
>
> # Reproduce first_bad build
> git checkout --detach c3496da580b0fc10fdeba8f6a5e6aef4c78b5598
> ../artifacts/test.sh
>
> # Reproduce last_good build
> git checkout --detach a9e7c3cedc2914f63cd135b75832b9bf850af782
> ../artifacts/test.sh
>
> cd ..
> </cut>
>
> History of pending regressions and results: https://git.linaro.org/toolchain/ci/base-artifacts.git/log/?h=linaro-local/ci/tcwg_kernel/llvm-master-aarch64-mainline-allmodconfig
>
> Artifacts: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allmodconfig/10/artifact/artifacts/
> Build log: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allmodconfig/10/consoleText
>
> Full commit (up to 1000 lines):
> <cut>
> commit c3496da580b0fc10fdeba8f6a5e6aef4c78b5598
> Author: Slark Xiao <slark_xiao@163.com>
> Date:   Tue Aug 31 10:40:25 2021 +0800
>
>     net: Add depends on OF_NET for LiteX's LiteETH
>
>     Current settings may produce a build error when
>     CONFIG_OF_NET is disabled. The CONFIG_OF_NET controls
>     a headfile <linux/of.h> and some functions
>      in <linux/of_net.h>.
>
>     Signed-off-by: Slark Xiao <slark_xiao@163.com>
>     Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  drivers/net/ethernet/litex/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/ethernet/litex/Kconfig b/drivers/net/ethernet/litex/Kconfig
> index 265dba414b41..63bf01d28f0c 100644
> --- a/drivers/net/ethernet/litex/Kconfig
> +++ b/drivers/net/ethernet/litex/Kconfig
> @@ -17,6 +17,7 @@ if NET_VENDOR_LITEX
>
>  config LITEX_LITEETH
>         tristate "LiteX Ethernet support"
> +       depends on OF_NET
>         help
>           If you wish to compile a kernel for hardware with a LiteX LiteEth
>           device then you should answer Y to this.
> </cut>
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/1723771714.8049.1630601502888%40localhost.



-- 
Thanks,
~Nick Desaulniers
