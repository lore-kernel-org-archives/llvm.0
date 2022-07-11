Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E608C4420
	for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 17:42:30 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id ck6so7588843qtb.7
        for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 10:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YRKpkfAENwaPRHhB52Yk4IsL9JC0VBqj2njlYrjdEfc=;
        b=Jjs1SJg9ILwBRwrSz85ksnjxvXlcJlYxLcWsAIFy3D+w2CMbVk02Fy90YtRHuT/Gsc
         7w5I36ok/ezLiv0MwRRSqurKUV8r1WuOn8R/X3vRaSNrl827XgHpwFoNz/xUzBRULcci
         L2aqTcvr+66l1s0HQsMiDICOiSJlXIUIv0TPQlgFJWyNl+vWFrPal7NgW67WfkDXCkSC
         On0BlPDuU6OXJUGyN3dDD3HqfV8lELBhAv1dWi6blk7Or/nGbVhfPLfCUMtASG4f0s/h
         L0SaBtWy0rvA4iVO3GMVZsBuyNVP5u3nC7OLidScTPhquFtAT8UtRBmdn5VFJI0EE9bM
         ilRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YRKpkfAENwaPRHhB52Yk4IsL9JC0VBqj2njlYrjdEfc=;
        b=bOgobamrNt9HPRA5gOJcYNqvfnvsoP9zuzDvcZFSSLUQozC3Z2HSg40aRUr5kxxGU/
         gbVP0AxSLW/PrL1JNUdXIIDm+q2gayxpSCHKgDsVJIvy1AytoL51wrr/9+NV9T2g8X2j
         tZvdKMf0bDKKyyKZzy6BIT2xCQNR5x4sSlge/bEZE9AQoXM0ojURBMpHro/L6aF3JEVw
         A6LQRXoiAgZP7MpgB7c8Ofrqj/HTc9AEUMkXrf4XEb+EBH2VkI/4hoEJGOMYzI68Jfby
         I5vAD0Nlsg5/7nGOWjYwAlLPULy2OWEkMiVLzTaGeV47GBE1EUzNQUh5NBl107XOdxrj
         BNgA==
X-Gm-Message-State: AJIora/P0CRKzSbVAW2T/vpGx2sMiYOX46owin/UbzkyOYj4Smix5qv4
	xC8UprbW9zqgiqqbJfTS8acyT27EYo75oVFZNEq2/Q==
X-Google-Smtp-Source: AGRyM1tj3qzQHBkSDWHhizwUEMCkZdcJezeAfWiG+HXdCs+IB9Axc9y1pe7xCYy9X9g/aH4hH/1YmHn6VmM6eMyPTnI=
X-Received: by 2002:a05:622a:198f:b0:31e:b669:9f29 with SMTP id
 u15-20020a05622a198f00b0031eb6699f29mr3742937qtc.629.1657561349814; Mon, 11
 Jul 2022 10:42:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220711174004.3047516-1-nathan@kernel.org>
In-Reply-To: <20220711174004.3047516-1-nathan@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Jul 2022 20:42:18 +0300
Message-ID: <CAA8EJppiUhkbE2c=ce7AVkgMPZ0Sz-uuws220WYk4GaXZbrQzA@mail.gmail.com>
Subject: Re: [PATCH v2] clk: qcom: gpucc-sm8350: Fix "initializer element is
 not constant" error
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@somainline.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Robert Foss <robert.foss@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Jul 2022 at 20:41, Nathan Chancellor <nathan@kernel.org> wrote:
>
> When building with clang or GCC older than 8, errors along the following
> lines occur:
>
>   drivers/clk/qcom/gpucc-sm8350.c:111:2: error: initializer element is not a compile-time constant
>           gpu_cc_parent,
>           ^~~~~~~~~~~~~
>   drivers/clk/qcom/gpucc-sm8350.c:126:2: error: initializer element is not a compile-time constant
>           gpu_cc_parent,
>           ^~~~~~~~~~~~~
>   2 errors generated.
>
> The C standard allows an implementation to accept other forms of
> constant expressions, which GCC 8+ has chosen to do, but it is not
> required. Just inline the initializer to resolve the error.
>
> Fixes: 160758b05ab1 ("clk: qcom: add support for SM8350 GPUCC")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1660
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>
> v1 -> v2: https://lore.kernel.org/20220711163021.152578-1-nathan@kernel.org/
>
> * Just inline the initializer, rather than using a macro (Dmitry).
>
>  drivers/clk/qcom/gpucc-sm8350.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/qcom/gpucc-sm8350.c b/drivers/clk/qcom/gpucc-sm8350.c
> index d13fa813d190..5367ce654ac9 100644
> --- a/drivers/clk/qcom/gpucc-sm8350.c
> +++ b/drivers/clk/qcom/gpucc-sm8350.c
> @@ -108,7 +108,7 @@ static const struct parent_map gpu_cc_parent_map_0[] = {
>  };
>
>  static const struct clk_parent_data gpu_cc_parent_data_0[] = {
> -       gpu_cc_parent,
> +       { .fw_name = "bi_tcxo" },
>         { .hw = &gpu_cc_pll0.clkr.hw },
>         { .hw = &gpu_cc_pll1.clkr.hw },
>         { .fw_name = "gcc_gpu_gpll0_clk_src" },
> @@ -123,7 +123,7 @@ static const struct parent_map gpu_cc_parent_map_1[] = {
>  };
>
>  static const struct clk_parent_data gpu_cc_parent_data_1[] = {
> -       gpu_cc_parent,
> +       { .fw_name = "bi_tcxo" },
>         { .hw = &gpu_cc_pll1.clkr.hw },
>         { .fw_name = "gcc_gpu_gpll0_clk_src" },
>         { .fw_name = "gcc_gpu_gpll0_div_clk_src" },
>
> base-commit: 0dd8e16bfbc003b009f843e75fae4046daa08fe9
> --
> 2.37.0
>


-- 
With best wishes
Dmitry
