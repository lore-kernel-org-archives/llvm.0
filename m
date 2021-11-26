Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DCF68
	for <llvm@lists.linux.dev>; Fri, 26 Nov 2021 20:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BBEDC004E1;
	Fri, 26 Nov 2021 20:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637958623;
	bh=3Ez6hA3NWEj59LlRB6xO3PkLztU9xFstRwP/8ZIKVA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T9FCRVny5e1JIkFI3G1lmXSqqcPcOPcS7T6tIkDpk/NtS5zcn+LPAOJTDnnN2oZ1V
	 PUDPCyAA1pEiacX9GOds6TwlXmVRB8xpkyrFJMZ0GcojhZjxBQKa7301muEHsNDTlC
	 cR1yWKhe7vjR6lxgQpu94posgZ3m8Pi7/2gYeXCBHp0W86gnurL10N3y/HEpP6Tcnj
	 POFF0MArPuvXCSYkZPIEfGtuM5n/Y0M8mZlNwlSgPY0yj0lJ0qkIG8wpddw7cozL+q
	 cj12iZscxh8mMTCSp2BDnSUyQYD/J6DzSP/lueLosi5/B8aKEZILK1gaKQOgmvWbmr
	 pQHKxe3c/UNGQ==
Date: Fri, 26 Nov 2021 13:30:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com,
	Bixuan Cui <cuibixuan@huawei.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 20/20] media: mxl5005s: drop some dead code
Message-ID: <YaFD2RmjE1QlBKr9@archlinux-ax161>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
 <b1b447e2f3e1ec0c3e9716f4f74d056461f69ab3.1637781097.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1b447e2f3e1ec0c3e9716f4f74d056461f69ab3.1637781097.git.mchehab+huawei@kernel.org>

On Wed, Nov 24, 2021 at 08:13:23PM +0100, Mauro Carvalho Chehab wrote:
> As reported by clang (with W=1), the ctrlVal var is never used.
> 
> Yet, there are even some loops to estimate it. As this is dead
> code, remove it. If ever needed, someone could revert this
> patch.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/
> 
>  drivers/media/tuners/mxl5005s.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
> 
> diff --git a/drivers/media/tuners/mxl5005s.c b/drivers/media/tuners/mxl5005s.c
> index f6e82a8e7d37..ab4c43df9d18 100644
> --- a/drivers/media/tuners/mxl5005s.c
> +++ b/drivers/media/tuners/mxl5005s.c
> @@ -3414,9 +3414,8 @@ static u16 MXL_ControlWrite_Group(struct dvb_frontend *fe, u16 controlNum,
>  	u32 value, u16 controlGroup)
>  {
>  	struct mxl5005s_state *state = fe->tuner_priv;
> -	u16 i, j, k;
> +	u16 i, j;
>  	u32 highLimit;
> -	u32 ctrlVal;
>  
>  	if (controlGroup == 1) /* Initial Control */ {
>  
> @@ -3432,9 +3431,6 @@ static u16 MXL_ControlWrite_Group(struct dvb_frontend *fe, u16 controlNum,
>  							(u8)(state->Init_Ctrl[i].bit[j]),
>  							(u8)((value>>j) & 0x01));
>  					}
> -					ctrlVal = 0;
> -					for (k = 0; k < state->Init_Ctrl[i].size; k++)
> -						ctrlVal += state->Init_Ctrl[i].val[k] * (1 << k);
>  				} else
>  					return -1;
>  			}
> @@ -3454,9 +3450,6 @@ static u16 MXL_ControlWrite_Group(struct dvb_frontend *fe, u16 controlNum,
>  							(u8)(state->CH_Ctrl[i].bit[j]),
>  							(u8)((value>>j) & 0x01));
>  					}
> -					ctrlVal = 0;
> -					for (k = 0; k < state->CH_Ctrl[i].size; k++)
> -						ctrlVal += state->CH_Ctrl[i].val[k] * (1 << k);
>  				} else
>  					return -1;
>  			}
> @@ -3477,11 +3470,6 @@ static u16 MXL_ControlWrite_Group(struct dvb_frontend *fe, u16 controlNum,
>  							(u8)(state->MXL_Ctrl[i].bit[j]),
>  							(u8)((value>>j) & 0x01));
>  					}
> -					ctrlVal = 0;
> -					for (k = 0; k < state->MXL_Ctrl[i].size; k++)
> -						ctrlVal += state->
> -							MXL_Ctrl[i].val[k] *
> -							(1 << k);
>  				} else
>  					return -1;
>  			}
> -- 
> 2.33.1
> 
> 
