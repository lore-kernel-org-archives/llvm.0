Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A40B1B3950
	for <llvm@lists.linux.dev>; Tue, 21 Jan 2025 09:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737452811; cv=none; b=nOB/1K6v9A/wsh6e5ism0g9juOSU9qEYuetBW6cMRvO+O0liZyOd5B46BtYuHLtr0h5GYYIadvunHWtJzdrHQDvk9sDTRzpV+1r4rgv8tzV+cfVSqaBKPRROePqPeyLkH26L4MFfuL2UMKAhKoHIGDZuF0a3s9VGOQMDJekwX6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737452811; c=relaxed/simple;
	bh=1I+Uuama9ugZyQKsEohJdKjjc55GB3IcqY9SnNbolsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SKGa7+kWt/2AJlc3anToT4MI0KTgoZLaAD+ymC4MjcHKFG6prdEOj5O/4HN6jLcIvEN2/yjB1BJcHTUM7PlHawnowivuFyZk3OY+GPSQnB8YwS18uxYqHpyB2NrHAndNfxMTb0fkH+iZJ1ucRZYpJQ5E0wehfP/owjRTZ3fHbAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y/IzR21L; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y/IzR21L"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e3a26de697fso8427530276.3
        for <llvm@lists.linux.dev>; Tue, 21 Jan 2025 01:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737452807; x=1738057607; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xCznPro7DzazvTiUhQrmITM+It7rrjrCA9i0Q4NMQd0=;
        b=Y/IzR21L6fpn3jsGhO7wjVnQrdCRprFkttpA7Aveicrsn4V2dFCRA12EJ4+l7YtedQ
         cL8JZo3KVIlEHo5d6hFm6C+SA8xPd0v+Klm27rm4HvQCRNLk3AX3u2q/9B86B4LTpZk5
         B+Lt3j1IjxJYrWQU57CtSVmnrty94Mh9BB2VKemBhvfQwBrK7k8yUpQ+iKfHUOmv+Udo
         gFjnACbAM0oWuVSBq8XyEStisZPbImEdKVDcy3n8Gu3s8AZIZUqD+eKBE50UXbDfdMRT
         QOWt9w9bCOSjen9Kx0/t6tnMVNnXH9ajiU33jG2oxWXKrGeUDagbiSFRYBdkwL2yCUPP
         Z/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737452807; x=1738057607;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCznPro7DzazvTiUhQrmITM+It7rrjrCA9i0Q4NMQd0=;
        b=UWbBnSJxMxlhOQ5KuqHzmQnHoXtaNOpvosdSSmsSvdZIC9+SmWin20fKfuewtm0LVm
         +XVTG3dTKbGCPNd/AML2A9l5NV15DS0cQ3isqLohloUfQ+Iq/eIC2Af0fCyiw3UVbZut
         9pgXxC1l5Jr6Ixm4v3h34F6m5vd1u+guG+73mgKiYdq8OyXjfSZ9RIe/xiDGHx6jDSeC
         y1SRUFkKtADBMF1fLYC8hupQxJoosiML19smYWOmgRlzVYGkyNGiZkws7XVoz6+V8ZRc
         7RBOZ70RSfrwz3i+myQFwOLdPo+H5pmW94pIB3CU9j2NEE1fDJHefJUThS/hY6Cu1PH6
         xNlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVf6HkEmh4LhSFV3AJ30cNPot89xZCIH/5jJGXuwzuk0YDABGRvUBMIy5yv+4K4MsG6xIEj@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8EmRzpXgjKIoImu+gtO+zwlYOS21UxEaubUx1bBk3RA26t1B8
	999YEIQNEze47c1vAYpz5J/kW/VMgeg5R6NbmxS4Nn7iYJnvanrhkz797xYQNb/k3oM+Ru5pma3
	nDLxgyIn2VQdAkmMGj3/lxT5XqS/reVUPhSrumQ==
X-Gm-Gg: ASbGncty402esk8xfqynObiDVdBxyAcS7oNgcjsNO4MAbxPiXVYOC3nQ6nMPBmzJVqc
	udbfSrYA/jo9ZuTdHjL+Zt8G+lz6EspLjfs8kXOtOmvc7BHK9cBs=
X-Google-Smtp-Source: AGHT+IE4NvWjhVwcZefMFMPsNF1/yZL/+GizgE7O5W0l1UUq/sk+Rp9xLLX7buviHENqfSARwR8NAFZJ6rRHBgoskwA=
X-Received: by 2002:a05:690c:7344:b0:6ef:5ab8:2c53 with SMTP id
 00721157ae682-6f6eb68695cmr133051747b3.19.1737452807535; Tue, 21 Jan 2025
 01:46:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250120153817.11807-1-ansuelsmth@gmail.com>
In-Reply-To: <20250120153817.11807-1-ansuelsmth@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 21 Jan 2025 10:46:11 +0100
X-Gm-Features: AbW1kvZ21pVNkI7qM7rGH-9wFnhv5SdIw9t28_ewxvHO8LS13hlMrra20J6gTIc
Message-ID: <CAPDyKFpBtnsEfMg73UHdXzZvSNHaL8H4N1h6-2wAMnFWNTM75w@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: airoha: Fix compilation error with Clang-20 and
 Thumb2 mode
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev, 
	Sudeep Holla <sudeep.holla@arm.com>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Jan 2025 at 16:38, Christian Marangi <ansuelsmth@gmail.com> wrote:
>
> The use of R7 in the SMCCC conflicts with the compiler's use of R7 as a frame
> pointer in Thumb2 mode, which is forcibly enabled by Clang when profiling
> hooks are inserted via the -pg switch.
>
> This is a known issue and similar driver workaround this with a Makefile
> ifdef. Exact workaround are applied in
> drivers/firmware/arm_scmi/transports/Makefile and other similar driver.
>
> Suggested-by: Sudeep Holla <sudeep.holla@arm.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501201840.XmpHXpQ4-lkp@intel.com/
> Fixes: 82e703dd438b ("pmdomain: airoha: Add Airoha CPU PM Domain support")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  drivers/pmdomain/mediatek/Makefile | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/pmdomain/mediatek/Makefile b/drivers/pmdomain/mediatek/Makefile
> index 0f6edce9239b..18ba92e3c418 100644
> --- a/drivers/pmdomain/mediatek/Makefile
> +++ b/drivers/pmdomain/mediatek/Makefile
> @@ -2,3 +2,10 @@
>  obj-$(CONFIG_MTK_SCPSYS)               += mtk-scpsys.o
>  obj-$(CONFIG_MTK_SCPSYS_PM_DOMAINS)    += mtk-pm-domains.o
>  obj-$(CONFIG_AIROHA_CPU_PM_DOMAIN)     += airoha-cpu-pmdomain.o
> +
> +ifeq ($(CONFIG_THUMB2_KERNEL)$(CONFIG_CC_IS_CLANG),yy)
> +# The use of R7 in the SMCCC conflicts with the compiler's use of R7 as a frame
> +# pointer in Thumb2 mode, which is forcibly enabled by Clang when profiling
> +# hooks are inserted via the -pg switch.
> +CFLAGS_REMOVE_airoha-cpu-pmdomain.o += $(CC_FLAGS_FTRACE)
> +endif
> --
> 2.47.1
>
