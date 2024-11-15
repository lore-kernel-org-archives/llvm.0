Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A791632E7
	for <llvm@lists.linux.dev>; Fri, 15 Nov 2024 08:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731659058; cv=none; b=H0q/6I9JDYeEhta00thiugkTXhSw+l7nuzWSrl/tktOMz/kRI/FczhyCz6yyow5zphjvWDPPc+dwpTAGsDdayV0x9KY9A0vw4I4d508wohYC3DTytPUXG8htEbc8onnBU6BQFnwlg0H12vqmo+1ShzaipmH5PwCXBFVV18IutrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731659058; c=relaxed/simple;
	bh=ibYVGR5cGY11jXY5MH7HJGwhiLSdI3f82ZXTv3gR5vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dtcB+Dpn5e6WX+KklGtJI0hob0mdcS6L/e82UFJt25rN+yweCQ4mpjeaw0n41141o6JNShiwfARkRWDrhmj9fJFVSGk0LO6FOqYg3E/GsW3GVJWdbjcj9kpEk6CBEPE4LeCEx3na0BUORsQH4J5j5aPWU6ZDsd/iOWc8Jre9mdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IKt26S0R; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IKt26S0R"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4314b316495so3456085e9.2
        for <llvm@lists.linux.dev>; Fri, 15 Nov 2024 00:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731659054; x=1732263854; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eWRrZUkhxGjMZeY29OrWmdvCo90xdRe7Aypy1R6OUmE=;
        b=IKt26S0R361gZzdC7hhzO1t+JeIsscMNZCrR5pMgKGAhGz8z1DHQ01XvvXMJbEbTbg
         Sw2tJz2GufH83wcFVjXAFjfvbo2dFJyf0TABFiD+ompTIa0q/f1j4XdsNbBv4j2SnGbg
         6cyFlV4AZAfBw5EyrHhR0AkGkez7n5wxls+oMV3UL6wUBbfI7PUrZJr/gbsY2WCOJXYA
         gYbAUPFktM5qp8Rj86nXl+kxeTOs2lyMf6I7ps2EIdx7DreV5aReB/Tz9CCs5KhGLx9Q
         UU+l2TMgCZ3uZsz/0LkTxfPqKV4+O2jYenK5A7LxE4SOYoXaNIAUZTh7olVbgjkDtxUj
         1HAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731659054; x=1732263854;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWRrZUkhxGjMZeY29OrWmdvCo90xdRe7Aypy1R6OUmE=;
        b=gGuM3vlrpJwCba/SK6P7H3o+o/dE6Uur75gESPPPwr4QyYSujFkGD/BiBXXkg0upAp
         IjK9Gbv+YP1nA8BR3NhaTB3pl5Cgw9qJe5rZfceTvwxM1hJsj23wlSS3RXsgPZVOEQIA
         COOjn6zjUqQcn6quSJo5ZDHMGGFwB/plVZV7YlPtKLk+FK/qwJdboYvXgp03S3rbh9Jg
         oMdZ9CH5BD044LvJLcjqwr8O/Z63yS9LYIn4XEe6p8OSGujqkHCSJoYyrbOtmt6U0fK0
         878AJLbVUwHJqccHOQlXxtOrxc8I7cjwXed4g+0Fa/P+Qz7j9Wda13eVwBKYzul8ffFb
         upbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzxMCghDroTeKjvP7zXj2x1M8EtZLobhv4POXhylgRzFBUSN3zmTqkt0jpAVnyYCeFFx5N@lists.linux.dev
X-Gm-Message-State: AOJu0YyBxsRKraCoLvz0WE1zvimgyN/+6/cR6y+OFerupIsoFxy5mkja
	ip5t2bu2n0GvEL87TW/0EUfReCTzo8anzLlRKPfg3wgwFLRYdFpYlz9l8Vv2/Y4=
X-Google-Smtp-Source: AGHT+IE6iZRKIEII2jo7jJBhaHE9KSdI3yml3wTWpJc85CoFNhJyDFKxbpJmnFwfiCV7cb6knB5SAg==
X-Received: by 2002:a05:600c:3d15:b0:432:d797:404a with SMTP id 5b1f17b1804b1-432df78de80mr11268285e9.22.1731659053736;
        Fri, 15 Nov 2024 00:24:13 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab78918sm45682765e9.17.2024.11.15.00.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 00:24:13 -0800 (PST)
Date: Fri, 15 Nov 2024 11:24:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: stuyoder@gmail.com, laurentiu.tudor@nxp.com, nathan@kernel.org,
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 0/2]  bus: fsl-mc: Fix two double free problems in
 fsl_mc_device_add()
Message-ID: <e18e02dc-4628-4205-96da-fff67afae8ab@stanley.mountain>
References: <20241115023206.3722933-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115023206.3722933-1-suhui@nfschina.com>

On Fri, Nov 15, 2024 at 10:32:05AM +0800, Su Hui wrote:
> This patchset fixes two double free problems in fsl_mc_device_add().
> One is reported by clang static checker, another is reported by Dan when
> reviewing the code.
> 
> ps: There is only patch 1 in v1 patch, patch 2 has no v1 version.
> 
> v1: https://lore.kernel.org/all/20241114082751.3475110-1-suhui@nfschina.com/
> 
> Su Hui (2):
>   bus: fsl-mc:  Fix the double free in fsl_mc_device_add()
>   bus: fsl-mc: using put_device() when add_device() failed in
>     fsl_mc_device_add()

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

