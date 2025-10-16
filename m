Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA842AD3D
	for <llvm@lists.linux.dev>; Thu, 16 Oct 2025 08:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760604517; cv=none; b=KnKrsGgNZJRRVSo9ogZw03yOpylYb9hEZ6iA1+avxDawAGbDQd/PqCg88gQrh8jI/GjTI5mBEQI7VV9NMp9n56Taq/S/wX+gJ9Vdwzy/w/9j/Yr6ijHLiktlqTwMdpmPCeIcb77ck8cr+pXYHgv1KwIiwae7wUb5dgob31GM0tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760604517; c=relaxed/simple;
	bh=kkrnDxMYNrznAE3Hee5XF8MX8bDoYkPgWg1IrtAOtqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jCg7S9+YFP/Qt8IFMNCmK9hMZ87W90fF5qtHEpD7nzBaNufyVZ7q1PMjo1hgvdViWJg0b5G3pqR9oWyF4iklF5FY1PaE7xpjMoxSB6G/ISa0ItY4Pzh6Jfmy+TRgwhswlIzDjz1H8f7oCi/HIbSvXeELAZls1kQBxWTvHixXHHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hO51urWq; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hO51urWq"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso483605f8f.2
        for <llvm@lists.linux.dev>; Thu, 16 Oct 2025 01:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760604513; x=1761209313; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AVEUrQi9cWOpaDRyBLGip7wyDUSKU6wiRqunzh1l3BU=;
        b=hO51urWqEPBz+QTpUaLt+2Uc+xhoOWNtgwxybsP8NYLLRuixU6JajwCSJhl7bBWRGA
         bPimi66UU7ks4sFFCIShre9j4kWTgRAnJj7ih8MWTS1+apzPLjq1+idthm5RR3hV766s
         i8SM7CbirFZdU+tfE4X4q6w0Z4IDmHdebkU+5468Av2GjPyosixm3udU87ecLV0ElBZs
         MVv+71OxNyK+UWxjWVXKFaAyEPazBt8hv387uXiQ26LrbQY8ZP1WLimI8msnG/R5OIAV
         xYnG9+j8HXrrwCs8nUKXsz47nw9Jc8ihvMWU3sVK0YECkc3gJrkjO6AdE7wzJh7saEzK
         7qbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760604513; x=1761209313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AVEUrQi9cWOpaDRyBLGip7wyDUSKU6wiRqunzh1l3BU=;
        b=BYLzm798rFoJ91giAo1vyc7PCxnziFJOlg0GBWj3jEc19rXtSgoEKWMsmB5k8S29GE
         eO1rHcy7lFy5sbCorDR9lYVMmey8Zz+fXzhK2Hi5pnRSmCZPVVzPJAyhyvPImXttgVJX
         4827H0LFGDC6sJDmI9opkWcZWJFjblgc7XHhXD9weS+9NNZowmK7ucSq4Cydv5w0pmD5
         M1BqXZRingcodtXO/WTV/K+DzPpA4+iNy0cufrUPkoeWgIjyGBgHpyCULSa25Zas+BXa
         eLjkRsUkSn65LpxSEqd2uJDhkyf6BQ4RvmA0DbQ8JcEtjgU90qPJIJUTeoUNM9lxDbES
         oTeg==
X-Forwarded-Encrypted: i=1; AJvYcCUpfpAsziw9Ob2s+EF1HxUHvc9BxfYZbXhiemuL5FaO+boMQrani8PqlpwQzJ7POwXEFOMv@lists.linux.dev
X-Gm-Message-State: AOJu0YyJ6hONo2kbAdKHqMagNRgDKo6UIn0hJDdRZ4dgkob36df8JL1U
	OITAGHAoWzq/rYXR+RoG5KqWlMkAJWUCr/TukyZ4F5o8vJZjSx/6lVJw
X-Gm-Gg: ASbGnctKrSGoqf3mhDJ6od3ODPhfnirpI1hozwBpiiL84S0CB3p9iotV9wcegTNyfya
	vQra3zq61aZHugHvd9L5FT5+1yOgh77cPzAFLWiygHRstCzW5ncsNzA0y2OcSwTRfZBMrg/hTu9
	XJ3PjPKGArsRT1tmkNR4UYdiIsWRjiX/hAU+WwlLI1L2s6j4BFDPxJTdaOteJqSpJXTHBHS98i+
	yn4rbibTXW8sPAgoFuq+818ckn89VIioYhwLenFPd8zSBct9FOC6fdT4OrK0SUUGb/+9zP0fy75
	NmTuXbNB5arrVcq9gbwvHQ7YtKW67GKGn/ud1jWaOM3Mcho+mg0MEfjTd8rhPH56O/6pmEuDDQK
	H2i2ewHK/MXH3/Ai+7Um2/wgBNEtPYr9/nz3utd9Kb4qBzUaiDJFP4n+ZJ68uQF+WPq/TQmF5sP
	8/oEiDTaKEy6Yirut5ogNpt+Pa5OP5LG1ijX4=
X-Google-Smtp-Source: AGHT+IFcjkeuZRpv+IRzVM4XciTTJue0s3dCI3MiZ144Kh9FyQmKyef1x1llDDTMWlEp/vC66d5XcA==
X-Received: by 2002:a05:6000:2010:b0:402:4142:c7a7 with SMTP id ffacd0b85a97d-42666ac6f35mr23068224f8f.16.1760604512220;
        Thu, 16 Oct 2025 01:48:32 -0700 (PDT)
Received: from [10.221.203.215] ([165.85.126.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42704141cdfsm42311f8f.4.2025.10.16.01.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 01:48:31 -0700 (PDT)
Message-ID: <abe2f4c3-086e-4023-911d-f2ecbdff24cd@gmail.com>
Date: Thu, 16 Oct 2025 11:48:30 +0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net/mlx5e: Return 1 instead of 0 in invalid case in
 mlx5e_mpwrq_umr_entry_size()
To: Nathan Chancellor <nathan@kernel.org>, Saeed Mahameed
 <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 netdev@vger.kernel.org, linux-rdma@vger.kernel.org, patches@lists.linux.dev,
 llvm@lists.linux.dev
References: <20251014-mlx5e-avoid-zero-div-from-mlx5e_mpwrq_umr_entry_size-v1-1-dc186b8819ef@kernel.org>
Content-Language: en-US
From: Tariq Toukan <ttoukan.linux@gmail.com>
In-Reply-To: <20251014-mlx5e-avoid-zero-div-from-mlx5e_mpwrq_umr_entry_size-v1-1-dc186b8819ef@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/10/2025 23:46, Nathan Chancellor wrote:
> When building with Clang 20 or newer, there are some objtool warnings
> from unexpected fallthroughs to other functions:
> 
>    vmlinux.o: warning: objtool: mlx5e_mpwrq_mtts_per_wqe() falls through to next function mlx5e_mpwrq_max_num_entries()
>    vmlinux.o: warning: objtool: mlx5e_mpwrq_max_log_rq_size() falls through to next function mlx5e_get_linear_rq_headroom()
> 
> LLVM 20 contains an (admittedly problematic [1]) optimization [2] to
> convert divide by zero into the equivalent of __builtin_unreachable(),
> which invokes undefined behavior and destroys code generation when it is
> encountered in a control flow graph.
> 
> mlx5e_mpwrq_umr_entry_size() returns 0 in the default case of an
> unrecognized mlx5e_mpwrq_umr_mode value. mlx5e_mpwrq_mtts_per_wqe(),
> which is inlined into mlx5e_mpwrq_max_log_rq_size(), uses the result of
> mlx5e_mpwrq_umr_entry_size() in a divide operation without checking for
> zero, so LLVM is able to infer there will be a divide by zero in this
> case and invokes undefined behavior. While there is some proposed work
> to isolate this undefined behavior and avoid the destructive code
> generation that results in these objtool warnings, code should still be
> defensive against divide by zero.
> 
> As the WARN_ONCE() implies that an invalid value should be handled
> gracefully, return 1 instead of 0 in the default case so that the
> results of this division operation is always valid.
> 
> Fixes: 168723c1f8d6 ("net/mlx5e: xsk: Use umr_mode to calculate striding RQ parameters")
> Link: https://lore.kernel.org/CAGG=3QUk8-Ak7YKnRziO4=0z=1C_7+4jF+6ZeDQ9yF+kuTOHOQ@mail.gmail.com/ [1]
> Link: https://github.com/llvm/llvm-project/commit/37932643abab699e8bb1def08b7eb4eae7ff1448 [2]
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2131
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2132
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>   drivers/net/ethernet/mellanox/mlx5/core/en/params.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/params.c b/drivers/net/ethernet/mellanox/mlx5/core/en/params.c
> index 3692298e10f2..c9bdee9a8b30 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en/params.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en/params.c
> @@ -100,7 +100,7 @@ u8 mlx5e_mpwrq_umr_entry_size(enum mlx5e_mpwrq_umr_mode mode)
>   		return sizeof(struct mlx5_ksm) * 4;
>   	}
>   	WARN_ONCE(1, "MPWRQ UMR mode %d is not known\n", mode);
> -	return 0;
> +	return 1;
>   }
>   
>   u8 mlx5e_mpwrq_log_wqe_sz(struct mlx5_core_dev *mdev, u8 page_shift,
> 
> ---
> base-commit: 4f86eb0a38bc719ba966f155071a6f0594327f34
> change-id: 20251014-mlx5e-avoid-zero-div-from-mlx5e_mpwrq_umr_entry_size-e6d49c18a43f
> 
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
> 
> 

Thanks for your patch.
Reviewed-by: Tariq Toukan <tariqt@nvidia.com>



