Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7E61C84D0
	for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 01:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753406402; cv=none; b=LlgrGJH1/nmn7xSUPqVHRD+FWy4QV3J4TaHHh0/I87Mw1z2dC4c6WW6dYU3NXvGJed2wB90aSzc+1coY/8B9EXNld71SpUxYgnDAPGpVHhn5UzKR0I6lhZ+d2EJMrojuqwj/4i+BGBYJ9lpLplIYAm/pkc1Qjn32rzt2GfK9VFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753406402; c=relaxed/simple;
	bh=KMp+aBJeXGXdSSkn8gWIZscNhYbFENCCJ2WhFi4gnmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tamWpuBKcRDeImzSQCkm1o54vSBEVgdrI2TIOVx0Xs67v7rJSCCMm1bNbkmQ9Q+5vGRhwVFJsp4xNh6lso5jH0qUIVa+LeJxvi1LzSvVHxaIA5v9fLT45I7n9hnWvjer7oLdOo42gGaOG/Iqs540kb9ku4I8gDVL+C+gpFHbOvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3dpQaL+v; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3dpQaL+v"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-87653e3adc6so60906639f.3
        for <llvm@lists.linux.dev>; Thu, 24 Jul 2025 18:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753406400; x=1754011200; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XK/gYnhz8WxypxaXzlzjFNaBe5jgICo9avyYr9Xjlc8=;
        b=3dpQaL+vh1Poov5KDTeY6svTrQGU52dzOR18TjoGO4ZTsMtuEOPs2PE9gGDrEXKwSp
         BbdTQ/a/SkQwHoRknn8rD5j2ADokv0BDO7LT9CPyVNcMGoKvYO4fZlRAHQZW6DWDsluu
         1e1iHYeyCluC7pINBd3Po0uG0T2lWpvz7x++oaXYYYuWg8gIDAfGu3rBV0KqFD2en8VR
         k7pG/DgEQwONk2jB1E+4Id8dffOfIkNh2qXwzGKfpCkvO/AQcghDZ6ujP/v+5e/Kv4zR
         5hkh8iJWxOUUUyzSUE6hqtfWaNnNQsd13ouccOJGc1yv+h9d3y/5R0TonUsfxAZhV9Oz
         6Guw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753406400; x=1754011200;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XK/gYnhz8WxypxaXzlzjFNaBe5jgICo9avyYr9Xjlc8=;
        b=RcBGvy5LM35EkV1u28D98WhP4qb7g0rv5t3OuK/GlD/kLDOMnVDUg1lxDva4e9OzsG
         hPXXKU9mG+I5h0GpbtDdH/xw7OOh5AhEmlDLoOb9ezGYVrYCRKLuEBSgJk0IX6FnCXQf
         O3bf+ITmnB56te8wFLL9I5L7eBkI98eTBk+7RC959uh+H5AYHa7AenvqlcaEKRhPeyBD
         n84BkkCSH3zIZZND0fRmdfEV48h9bD0VihNPkfuealE2M0RhDwVGHHjfpIrOKxDgK6TA
         WFoTvQ0ORplY37c2H/bpu1HNXeDTnXvjFLAOwbZmIeeMSCN5ovqj7x7w+Crz143oWoC4
         ssEw==
X-Forwarded-Encrypted: i=1; AJvYcCU05cZ+Z3JWoHf32/MuJzlKicszvUQrpeLJBMkHL7cC20yR56zRNdHhnMe4Za208cOhcVzj@lists.linux.dev
X-Gm-Message-State: AOJu0Yya6OeLkRcF4DVyTBOlYmJxZfbfyAF9X4G+IU/Z0baRIVW9tHFk
	fkMrKKUVIArl3Ih7FliMpK7RTfV2UGFx6JMQpynJysU5ANEziOHlPeIPaqzK/RvhqQ==
X-Gm-Gg: ASbGncsHNy2C3eR4T4o4CY2EkiSg/rokcpDwcU6LBED6QL4qILQWATVdMHToRG83LbE
	r3RbwfVeb8L0Sdbxf2rO5woDFgF70WSsYQy5+f0YxP4cxnyoE8YvdhJIc8T8q4GsWtUkYXGVF2n
	SEvyBJG/XjTjZKSfPvYGwG14rsUiFedbR9t2UzjBEFlkSlst6pnkJFc92LP+XNyEwdJ7xfqUVPg
	9fDQklnfTItry0X1Fdx1HJ6mzMo2gqCktQ5wty+rRvKGVE7CSTWNJbt8OrB9moQQRyv4r2W3jOP
	oVwikWDCNjLdsjvIfmbfQgmGaje2ZcpimtGNOiM7ZS/4stEaLGmTpoj8cDo7hwV+kdLGr+9Frhu
	+XlhHn9Oqa9HSkvj629iHrhDKF61IQH/EFUvGXf6HqaCqQesyvlWkfE11LAj5XUXjSdU=
X-Google-Smtp-Source: AGHT+IEmFccKRhDDkZ+Zb03HqYIMkjVZNy7vREse+9ncUz0sanXGTB21Co/1U2q+QuC2Ff0zX/sN0g==
X-Received: by 2002:a05:6602:2cd5:b0:873:de29:612f with SMTP id ca18e2360f4ac-87c64f89e6cmr1623090439f.3.1753406399396;
        Thu, 24 Jul 2025 18:19:59 -0700 (PDT)
Received: from google.com (39.173.198.104.bc.googleusercontent.com. [104.198.173.39])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-87e201992fasm28737439f.28.2025.07.24.18.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 18:19:58 -0700 (PDT)
Date: Thu, 24 Jul 2025 18:19:53 -0700
From: Justin Stitt <justinstitt@google.com>
To: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Christopher Covington <cov@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org
Subject: Re: [PATCH 6.1.y] KVM: arm64: silence -Wuninitialized-const-pointer
 warning
Message-ID: <xcwmzitmc5igc3eplgr2uwviitdfmtdknth4a5zpaldamw7png@o22wb4ze3czd>
References: <20250724-b4-clidr-unint-const-ptr-v1-1-67c4d620b6b6@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724-b4-clidr-unint-const-ptr-v1-1-67c4d620b6b6@google.com>

On Thu, Jul 24, 2025 at 06:15:28PM -0700, Justin Stitt wrote:
> A new warning in Clang 22 [1] complains that @clidr passed to
> get_clidr_el1() is an uninitialized const pointer. get_clidr_el1()
> doesn't really care since it casts away the const-ness anyways.
> 
> Silence the warning by initializing the struct.

For posterity's sake, here's the warning message which I meant to
include in the patch:

../arch/arm64/kvm/sys_regs.c:2978:23: warning: variable 'clidr' is uninitialized when passed as a const pointer argument here [-Wuninitialized-const-pointer]
 2978 |         get_clidr_el1(NULL, &clidr); /* Ugly... */

> 
> This patch won't apply to anything past v6.1 as this code section was
> reworked in Commit 7af0c2534f4c ("KVM: arm64: Normalize cache configuration").
> 
> Cc: stable@vger.kernel.org
> Fixes: 7c8c5e6a9101e ("arm64: KVM: system register handling")
> Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e [1]
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
>  arch/arm64/kvm/sys_regs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index f4a7c5abcbca..d7ebd7387221 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -2948,7 +2948,7 @@ int kvm_sys_reg_table_init(void)
>  {
>  	bool valid = true;
>  	unsigned int i;
> -	struct sys_reg_desc clidr;
> +	struct sys_reg_desc clidr = {0};
>  
>  	/* Make sure tables are unique and in order. */
>  	valid &= check_sysreg_table(sys_reg_descs, ARRAY_SIZE(sys_reg_descs), false);
> 
> ---
> base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
> change-id: 20250724-b4-clidr-unint-const-ptr-7edb960bc3bd
> 
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
> 
