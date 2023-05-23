Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1421F92A
	for <llvm@lists.linux.dev>; Tue, 23 May 2023 15:57:15 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-19a77e4c8dcso2731524fac.1
        for <llvm@lists.linux.dev>; Tue, 23 May 2023 08:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684857434; x=1687449434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eRQKQx8o7pYZMBO/dPIhBa/weTc59LxA8RBQRRvbAww=;
        b=nIEgy4xsmB+3hYy0CDH3MPkPWE5BrLDU5tN7cSIz3IzgJBvUH63E7oD9+J8dFGHW9L
         FBZbFIgKNh8FcUIK+6hwQfqH84IMyWxuYNPVjHn+W1EB9utNHces2xfBTPye8n7jt8Tq
         0M8B3LQCzG2nX5FKJV/Tgx3TrxVg+uNFPJ6ZBLP0xSSdPeXhuv+JU9S7B+REPf7DKtFJ
         KEvlWJocc0Ml50bYDpWW+Qn4erdWJqgeHE9UPd/j4CCJUhgFIZzzEVhqh5p3fCV+rOIV
         uwSe4xyITKa9BhftK4hXho1frTE+zqE820is8Ci3xzkG9ZEEVVaL4jV5XuDAqCDQDU5x
         kxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684857434; x=1687449434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eRQKQx8o7pYZMBO/dPIhBa/weTc59LxA8RBQRRvbAww=;
        b=EpLQUJdAQz6BHRml4x4aHJRT5tez0B8I5KsM51kOnx1LdV7aqG2Qbdk3byuMmy5Eyr
         M4z2y9FbkRHwHcIJjM8LRRdI7IKG3lAMqPRly0Z1Iuv0Ojuzq2S9Nv18a3V1eiknAUtI
         /BJKBuvfTJ4tGrbTbsBOEiyR+Sj/wTlu4AbkDbn4nPlivx/3dbf0yl5C67yBc4htaUF7
         VGn7uI6rzdyPpANgJvBy5h6gqIrAL0+fQUT1nMmaQD0WxL3LwoqxgQfo+5NNJ96niJQ9
         qnoTcQuBsZsAZQoSLVU0dEtbOoHzcTbKox2JZai6YdWKv3a5/Tt1y0yjdqC9Biq5w8HS
         n76g==
X-Gm-Message-State: AC+VfDyJ+InchwRljsL4gGyw4zllGs9sJpcL3OfJE5h+7L9wYRJA/VCT
	gKZzV7YVshUYce63SlAeLEV7NnsZnmsyJ4J2SfQ=
X-Google-Smtp-Source: ACHHUZ7DHxeQXuGbDyGY66H9cdMMYdFh6mTJpvChsFzqktlYAXoSFaO4ugdpNPumCfSnl1H7T26HF1Xrnt8cWO29BAg=
X-Received: by 2002:a05:6808:6393:b0:398:af5:a18a with SMTP id
 ec19-20020a056808639300b003980af5a18amr3200495oib.59.1684857434503; Tue, 23
 May 2023 08:57:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230523031709.19673-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20230523031709.19673-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 May 2023 11:57:03 -0400
Message-ID: <CADnq5_NKuq8ZO0mBMmogwTesr1gWa=aXO9BJFp0bnfWhYj7X7A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Modify mismatched function name
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: alexander.deucher@amd.com, linaro-mm-sig@lists.linaro.org, 
	llvm@lists.linux.dev, trix@redhat.com, Xinhui.Pan@amd.com, 
	ndesaulniers@google.com, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, sumit.semwal@linaro.org, nathan@kernel.org, 
	Abaci Robot <abaci@linux.alibaba.com>, dri-devel@lists.freedesktop.org, 
	christian.koenig@amd.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Mon, May 22, 2023 at 11:17=E2=80=AFPM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> No functional modification involved.
>
> drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:426: warning: expecting prototyp=
e for sdma_v4_4_2_gfx_stop(). Prototype was for sdma_v4_4_2_inst_gfx_stop()=
 instead.
> drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:457: warning: expecting prototyp=
e for sdma_v4_4_2_rlc_stop(). Prototype was for sdma_v4_4_2_inst_rlc_stop()=
 instead.
> drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:470: warning: expecting prototyp=
e for sdma_v4_4_2_page_stop(). Prototype was for sdma_v4_4_2_inst_page_stop=
() instead.
> drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:506: warning: expecting prototyp=
e for sdma_v4_4_2_ctx_switch_enable(). Prototype was for sdma_v4_4_2_inst_c=
tx_switch_enable() instead.
> drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:561: warning: expecting prototyp=
e for sdma_v4_4_2_enable(). Prototype was for sdma_v4_4_2_inst_enable() ins=
tead.
> drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:798: warning: expecting prototyp=
e for sdma_v4_4_2_rlc_resume(). Prototype was for sdma_v4_4_2_inst_rlc_resu=
me() instead.
> drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:814: warning: expecting prototyp=
e for sdma_v4_4_2_load_microcode(). Prototype was for sdma_v4_4_2_inst_load=
_microcode() instead.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D5283
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/a=
md/amdgpu/sdma_v4_4_2.c
> index bf47eb33c12e..590b08585901 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> @@ -415,7 +415,7 @@ static void sdma_v4_4_2_ring_emit_fence(struct amdgpu=
_ring *ring, u64 addr, u64
>
>
>  /**
> - * sdma_v4_4_2_gfx_stop - stop the gfx async dma engines
> + * sdma_v4_4_2_inst_gfx_stop - stop the gfx async dma engines
>   *
>   * @adev: amdgpu_device pointer
>   *
> @@ -446,7 +446,7 @@ static void sdma_v4_4_2_inst_gfx_stop(struct amdgpu_d=
evice *adev,
>  }
>
>  /**
> - * sdma_v4_4_2_rlc_stop - stop the compute async dma engines
> + * sdma_v4_4_2_inst_rlc_stop - stop the compute async dma engines
>   *
>   * @adev: amdgpu_device pointer
>   *
> @@ -459,7 +459,7 @@ static void sdma_v4_4_2_inst_rlc_stop(struct amdgpu_d=
evice *adev,
>  }
>
>  /**
> - * sdma_v4_4_2_page_stop - stop the page async dma engines
> + * sdma_v4_4_2_inst_page_stop - stop the page async dma engines
>   *
>   * @adev: amdgpu_device pointer
>   *
> @@ -494,7 +494,7 @@ static void sdma_v4_4_2_inst_page_stop(struct amdgpu_=
device *adev,
>  }
>
>  /**
> - * sdma_v4_4_2_ctx_switch_enable - stop the async dma engines context sw=
itch
> + * sdma_v4_4_2_inst_ctx_switch_enable - stop the async dma engines conte=
xt switch
>   *
>   * @adev: amdgpu_device pointer
>   * @enable: enable/disable the DMA MEs context switch.
> @@ -548,7 +548,7 @@ static void sdma_v4_4_2_inst_ctx_switch_enable(struct=
 amdgpu_device *adev,
>  }
>
>  /**
> - * sdma_v4_4_2_enable - stop the async dma engines
> + * sdma_v4_4_2_inst_enable - stop the async dma engines
>   *
>   * @adev: amdgpu_device pointer
>   * @enable: enable/disable the DMA MEs.
> @@ -786,7 +786,7 @@ static void sdma_v4_4_2_init_pg(struct amdgpu_device =
*adev)
>  }
>
>  /**
> - * sdma_v4_4_2_rlc_resume - setup and start the async dma engines
> + * sdma_v4_4_2_inst_rlc_resume - setup and start the async dma engines
>   *
>   * @adev: amdgpu_device pointer
>   *
> @@ -802,7 +802,7 @@ static int sdma_v4_4_2_inst_rlc_resume(struct amdgpu_=
device *adev,
>  }
>
>  /**
> - * sdma_v4_4_2_load_microcode - load the sDMA ME ucode
> + * sdma_v4_4_2_inst_load_microcode - load the sDMA ME ucode
>   *
>   * @adev: amdgpu_device pointer
>   *
> --
> 2.20.1.7.g153144c
>
