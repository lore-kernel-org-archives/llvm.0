Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A6B435A80
	for <llvm@lists.linux.dev>; Sun, 27 Sep 2026 19:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790537002; cv=pass; b=mDLjkGuCypyHfcIIC3h/Vwwfx4o4xcfDtOMUbVCA1knLhabcY78c2sjzsT57kYbSCL6wVvQHPiOa4MVeiMKjlwkJz8K66sP4S3yhzqf6wEsky7UZrSFufDHse1IUZNI6R4RFu/LeyJwbDP1QGkG7njpYhrEp/MEwo2VhH6ycWkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790537002; c=relaxed/simple;
	bh=JxpCDu+yGAq3x+LaLrqPzWBYldA8v+H1aqRDcrTIXZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ELM8dyktVh2lxI9bXxAEvdEOaDZZ+RxwvRlgaCA394WwtUKDav3pibjaoTSu4+t36wXNhW+LtnWs860y2FaAnuSVYfYSkfVHo+JzxUkDdn3J+Iq5bPv7GxiuG0glXgUk0hUgnKTEkCmBpRLmexLI4ICWzKe4qhR1HuOqRyeuST8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W558hrZH; arc=pass smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W558hrZH"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-141a5cf1371so137357c88.2
        for <llvm@lists.linux.dev>; Sun, 27 Sep 2026 12:23:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790537000; cv=none;
        d=google.com; s=arc-20260327;
        b=fFDjukZcRrIZ2IINeCLeH2wil9ReSeqXaShm7mTAhCGTtf4g4D56rYMeTgvgHG96qa
         Bxz3fCammPnKFsGD1oo0wmfjPVhBI6CaYy00ujMWU14nANT9hnYeVs+aY0oz8oFPFfVN
         xMDpujXbdJGX/z+N4rMc1zsHLzR/+IP0GU/ipbvbkVUiP8ILf3q+xjZWQ2LLPjBn8pXX
         4nRWV9tsWmXqQMCBGsCLlIpkn/Qh0jOua/iPCCUraG88tf/DLbuNsRbJ4v1SxWlw107z
         onxOCpnLApcMQZ+cefL5UbCo/rAgM4goID+Dw/RwxuwIe4WvjFiOYfKuRPhTRiLb6Jro
         qGgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GQ1aNNlcd5tc7JMvOSQAmrryeFFMB3Nt+WvcOu7O2ZQ=;
        fh=RXJKf75ZAgVaTOO1PKDQlGMFaVW20SZXD5Up7Q/fh7I=;
        b=q0dql875RLzQlAgixhUAVgTAmXOasCxAgJm8dFJEi3MS0qMUQs3/rufxTh6EzKLoqd
         NbVzGaV6u+aUdKitmZb+hRtpHzVK5wMD8Xkpe3EZ1tljUlmRJMFd1DJ7sLLdmbcAJGaw
         c34IUB1BdxZ3RQ9XYbnFat16NlqiElq9qK0Iqnjo2ajSDq8g3UAiPnHpHg38/m23q714
         etVBaqGtRWoDW4QfIvGrBIoZj/0R7llmWrpouHvyeE0tO2Qg4Xq6fqbsYfM3dI2YtyqU
         vABuO2RAlDPxj11FA3vygPio/tpGLOMqzz0utmbClDkSOzRoN/QvZYrqdFDlJLqUbsQd
         BMWQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790537000; x=1791141800; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GQ1aNNlcd5tc7JMvOSQAmrryeFFMB3Nt+WvcOu7O2ZQ=;
        b=W558hrZHNw2REjiePBzepZ+mLnfjNXEdeaT7VcDg4rkeYT6ab3gyysaKNzMEci+Ffm
         6f5fqBCgxyE8H4vyXuCWR9YWEpLbKuWeOblfgIbfTB/+ylkWQaAiT9AN7XH1TgGwotbY
         8I5b64doSySvYw8S+MEWU2w8FjWJvuLsm90PRpHDx14T0LJKZBA+cIwcpJTNLMFzclNl
         F9M6jSu3Z1d29yF7MbADsgpPlt6AJuchvT0MLLl/Jd/mYDborw7Tr2RgcuA+/OCedKrc
         wPybz3kWDljvHxMOjcRDOK609E5Br21Y0kXAZ2TSimpu+TGjjCQ1HlLt6H7aJ2hsg3gs
         TYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790537000; x=1791141800;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQ1aNNlcd5tc7JMvOSQAmrryeFFMB3Nt+WvcOu7O2ZQ=;
        b=yE9Xnbc65EsBf35RMc34ownW62AVy5q7P0CcAtethIxE0CdlcUb+rl4OzNtitUpWSq
         GW6Xsx4CSsCr+ADWcOZP28gb6JXQYZLbqnRb54LLM1LRR7rE4j359CLkqg0MKZZQz2qQ
         40arlewVYzDZ+Koi/FlQJf9xVUFaWdQvBUHHXE/CLyB+otIbwpOGQPg8dESHLVQ2E0q9
         ORijAV3/0lKzHqULJEb5NOqRifdi435ipNs8vXJnw4+5PWoh+zXp1cs8rvGlIX/KGH+S
         cbEdgq4+7EwlVE+c8VopBKRU3/t/TLM8YDrAc12vNoY7ok+nUODTRfKByRuURJvzlm1i
         mCow==
X-Forwarded-Encrypted: i=1; AKwUvBx4epnB3+AFWsZ1WC4xODedPwOaOYrFgTiL+ggYm5zUPxdFNoNC7vCBL1DuAvWYKQs7csRN@lists.linux.dev
X-Gm-Message-State: AFuF++lmLhTEdobxgD7ff3dmR7QFXmubfU9oztvCYEh/SL7g2EPNa7qg
	0LuYamIOZwEhqAIngEymt2BdluQRLexWpWuMEKF8JcHPz8kTiH+7f+0e1tku8Ta67H7zf0BWEk8
	7g6wZp/e6Mt+2MJ3IFT8La9a/JiM9Ots=
X-Gm-Gg: AYBFou1UJjJXbOpANwBbPa/zUzwyNoFG+Ak7SqQr7Xm2OHkX/c1touPN/O8I7GVJZbO
	iIK7uhvNQrW6gIi9NB/iSbHN0oNA8/CbWz3sQi7JKRLwbIL0Oh+mxZDKDm6s+eYjk5Rxhx0g5E/
	U0HGrhgvZu2ZTCFWn/pQwhfLgvVhwOD2bg77pRZZQYPNzY9jcohcyGdvLfXi7CdJq9DkPMUoRUb
	mN0VkYLTJGPwOFpSQiczFA/c1Vv4cgLAbzfOTtupFp79lDQlziIe4LTDdqL500E7ngRfv5x53jO
	nzeyDKxLiViZCKH0vjPwI8q18ATBazdQPe5fIeqO64LTwwHaXCqxEvkMNAYf6+Rm1NUq2pvM/En
	jFdh8I6buLtww0xttt6c8Z9zGaxBiWZl3xsdyfiqyLg==
X-Received: by 2002:a05:701b:4542:20b0:139:81c6:67a1 with SMTP id
 a92af1059eb24-146cf7ee6efmr11412357c88.1.1790536999746; Sun, 27 Sep 2026
 12:23:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260927161601.1183525-1-sashal@kernel.org>
In-Reply-To: <20260927161601.1183525-1-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Sun, 27 Sep 2026 15:23:08 -0400
X-Gm-Features: AclHuK8wUu5keriArIOfnqcjTa0PI5BDk7mnauwk6N-t9qf1EcExXFN7ZB-zoKE
Message-ID: <CADnq5_PBt-8TZ2i90m9fs8OKWQHmdpLqCx9+my32duvb78Yaiw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix sanitizer check for the DML frame
 size limit
To: Sasha Levin <sashal@kernel.org>
Cc: Austin Zheng <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nathan Chancellor <nathan@kernel.org>, Alex Hung <alex.hung@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks.  Will include this in my -fixes PR later this week.

Alex

On Sun, Sep 27, 2026 at 12:26=E2=80=AFPM Sasha Levin <sashal@kernel.org> wr=
ote:
>
> Building x86_64 allmodconfig with clang fails:
>
>   .../dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:10491:13:
>   error: stack frame size (3128) exceeds limit (3072) in
>   'dml_core_mode_programming' [-Werror,-Wframe-larger-than]
>
> That config enables both KASAN and UBSAN, and should get the 4096
> byte limit meant for clang COMPILE_TEST sanitizer builds. The check
> in the dml and dml2_0 Makefiles concatenates the three symbols with
> no separator:
>
>   ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)$(CONFIG_UBSAN)),y)
>
> KASAN and KCSAN cannot be enabled together, so before UBSAN was
> added the string was at most "y". UBSAN can be enabled alongside
> either of them, and with both set the string becomes "yy",
> $(filter y,yy) is empty, and the build falls through to the
> non-sanitizer limit of 3072. Adding UBSAN to the check therefore
> lowered the limit for the most heavily instrumented builds instead
> of raising it.
>
> Separate the symbols with spaces so that $(filter) sees individual
> words, and test for a non-empty result. Only the configs with two
> sanitizers enabled change behaviour.
>
> Found by KernelCI builds of the linus-next tree.
>
> Fixes: ebf8b0fd8508 ("drm/amd/display: Relax DML frame limit with UBSAN")
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/gpu/drm/amd/display/dc/dml/Makefile    | 2 +-
>  drivers/gpu/drm/amd/display/dc/dml2_0/Makefile | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/dr=
m/amd/display/dc/dml/Makefile
> index 91465ac05c971..eb4ce5b1ecfbb 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@ -29,7 +29,7 @@ dml_ccflags :=3D $(CC_FLAGS_FPU)
>  dml_rcflags :=3D $(CC_FLAGS_NO_FPU)
>
>  ifneq ($(CONFIG_FRAME_WARN),0)
> -    ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)$(CONFIG_UBSAN)),y)
> +    ifneq ($(filter y,$(CONFIG_KASAN) $(CONFIG_KCSAN) $(CONFIG_UBSAN)),)
>          ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_COMPILE_TEST),yy)
>              frame_warn_limit :=3D 4096
>          else
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2_0/Makefile b/drivers/gpu=
/drm/amd/display/dc/dml2_0/Makefile
> index e8bd061be05c1..2181079c89d0e 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2_0/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml2_0/Makefile
> @@ -28,7 +28,7 @@ dml2_ccflags :=3D $(CC_FLAGS_FPU)
>  dml2_rcflags :=3D $(CC_FLAGS_NO_FPU)
>
>  ifneq ($(CONFIG_FRAME_WARN),0)
> -    ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)$(CONFIG_UBSAN)),y)
> +    ifneq ($(filter y,$(CONFIG_KASAN) $(CONFIG_KCSAN) $(CONFIG_UBSAN)),)
>          ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_COMPILE_TEST),yy)
>              frame_warn_limit :=3D 4096
>          else
> --
> 2.53.0
>
