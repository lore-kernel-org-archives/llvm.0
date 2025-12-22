Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CB21F91D6
	for <llvm@lists.linux.dev>; Mon, 22 Dec 2025 08:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766393770; cv=none; b=SBx/phWvVDgLlOFhyyHHrofCiFbK/7KzqrBLo5AqXhqGrB3PrR6mEQwqYsbJ2CwMDjKubfAikGhJdl9uJWT11DYPzgR6Hfh2UoqZu2jZubz0/9uQzSAtcx2FJ9ZsfOETP8IYB0G/WqOeI5n2Tk86pD0BMppqJZJgyn6jQ4jLW2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766393770; c=relaxed/simple;
	bh=7JbjUpfRtcJDQTbUr/o8/MBhec59OcUt6gwi4/rdI/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nmImRifFLetb6Qmg1hLXvCfU5IWmgWlRi+1PLKCI/M6pEiXLpONs8TlvX/7Po2o8avs42tz21sTZFVuFuggBdmOGHVj2D5EAPZs6q8qMa1bEimNSB/t7TIk1FRfL5mDnODzVF2u/rj2/Ba0jkyW0cw0e7cKFtIAdkE1bD8Ouluw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BSiHoiig; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BSiHoiig"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b7697e8b01aso697412366b.2
        for <llvm@lists.linux.dev>; Mon, 22 Dec 2025 00:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766393765; x=1766998565; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pwRJY48dxTPs1oTrj8n5Xyh/tYuVrBXkK07zh9sBwxs=;
        b=BSiHoiigugVY8zRdBZw4mLcFC0zSMXWlzR6DDgMx1T8zDORcIYM6E5UfMj3AjAngEH
         untj0YloSjVMUs/tku6eurnUOacURnSGoodkR5QutkKbOeKp9PdzQ/hnbP7J7b2aOYFj
         IXXVX+eCfxGTbRwTrhb/Tcy/meQtwZslEmxUugp2MhHwaOuVv3DAwNlFo/dt5u7qUK81
         z59sJp1sL++pu1vaY3x/jheavKF677eSjAE98ATM8jRxm/ML4res7SUl+FSGYRBnH/E8
         nDcmDeOgUTpQizpc+htNj00WqqoM/CQOrpZPx/ZSiXnK7V8G8fIt77r3/lG3TMmlXNlQ
         VYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766393765; x=1766998565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pwRJY48dxTPs1oTrj8n5Xyh/tYuVrBXkK07zh9sBwxs=;
        b=LqiGfaZ8UoR0mDEKRD0ur+SJ0IUGAhXV5eDWY6zGuOCsyqOk2m2UNL99Fyn6VwkrVa
         NsLI4T/G0Ly+3DFktUrUvWbmtlCiK2Rag8P5auD3pG/4JAMrSNPqWPdFp90cwiK5ACEL
         N5ORFFfEH68uN3qI0mXLI++kA4C7C07r2DDzob7CERI8dGETnUQpJjz5osQk++nh4s+v
         pbZ54e306p1uoNHPnwKR0+B9ryuua5Mn93xKMj69AHZa0iTxFuZc/Dlel60TE0/sIfey
         5AL2K2Jh+cKcKLiG+yGuyOSTmkAASsASiLmdPRyvawoW7kBi7sVs2/sPgv3/60+mS+3Q
         fL9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQS8rhNXQI8UPjosSI1FPZYnbIU21uIQhEKPx8IRGEXDc4ojYX/Bw/bRxIFEb95O70rnNl@lists.linux.dev
X-Gm-Message-State: AOJu0YxysKi/L2cQFQfc1pfE+pC6hA9hsRaH27DkmUk1u1PROtQflzyt
	uek2Hsrt1FCk+kHGvccaPI7wQskotvy2Eh8oAjvMwFxdDwB0wqmXFZgPR+MIQ6Rt
X-Gm-Gg: AY/fxX6bBVqrBORDAUPcmgXE83bsT+z+R9OY2dT/k9XRNT+Xm5n9AFXmRuHxBDUDpGN
	DsqI7j1wHd96Zy1isWPlkDK1vqVuYSPIbOOakF+q3HMOg7RbNjVSa0+lS6LZyciERfNBH6VyzMb
	Zq+9v1S2VQBb01VKQsJ8FCg9TKTJpjePEP63CqEEBvg0qn/aR3Ctyh7RdULVX7yS9Dp7YUuiVFj
	Z6KFOkDJEpC2+tgeQj+lsCLtcbR0/NJ/vKJCxSvpMA9XsVY9CTVvXhZc/bSjeygZBxzJhe3w1CY
	FjNeVWwD6cPWD8R2/GPulGqROZmP2/WUDeduzYful9S8oSuC5oG+72U/ayKTK9dAuSMTdpdYfEk
	bElHg/AW/XBXsRBfylCN7al4/qD6n/f17QVyDMoYp/BVQNTjP6Q4d3+TVfjb4cg2HhoFF1BCcPR
	6b7HcbxjufENy9oE/JIyPMFftGwCHL6gEN2R8maJQ7VIozlfGJLcgXeINBUPAeve2r4ue+SbwJk
	CjNkSYBsYGF+j9069NqwFYiuThnQN4Lu7/sRTnhLCsBTg==
X-Google-Smtp-Source: AGHT+IF7ALpzL1gY8Ty9xkngtZeIfTvDYqIusKSKXf4paJFRSQtinRQWNbOMeFi5eWxXfYNiL8nLvg==
X-Received: by 2002:a05:600c:3b07:b0:47a:814c:eea1 with SMTP id 5b1f17b1804b1-47d195917d2mr96907475e9.35.1766386967128;
        Sun, 21 Dec 2025 23:02:47 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:c9b3:3e5c:bfa7:af26? (p200300dfbf2de300c9b33e5cbfa7af26.dip0.t-ipconnect.de. [2003:df:bf2d:e300:c9b3:3e5c:bfa7:af26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm20819355f8f.27.2025.12.21.23.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Dec 2025 23:02:46 -0800 (PST)
Message-ID: <5521e98b-e12d-4af1-adcd-2dc56863f90b@gmail.com>
Date: Mon, 22 Dec 2025 08:02:44 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pci: provide pci_free_irq_vectors() stub when CONFIG_PCI
 is disabled
To: Liang Jie <buaajxlj@163.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:RUST:Keyword:b(?i:rust)b" <rust-for-linux@vger.kernel.org>,
 "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b"
 <llvm@lists.linux.dev>
Cc: liangjie@lixiang.com, kernel test robot <lkp@intel.com>
References: <20251222034415.1384223-1-buaajxlj@163.com>
Content-Language: de-AT-frami
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20251222034415.1384223-1-buaajxlj@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.25 04:44, Liang Jie wrote:
> From: Liang Jie <liangjie@lixiang.com>
> 
> When building with CONFIG_PCI=n, clang reports:
> 
>   In file included from rust/helpers/helpers.c:40:
>   rust/helpers/pci.c:36:2: error: call to undeclared function 'pci_free_irq_vectors';
>   ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>           pci_free_irq_vectors(dev);
>           ^
>   rust/helpers/pci.c:36:2: note: did you mean 'pci_alloc_irq_vectors'?
>   include/linux/pci.h:2161:1: note: 'pci_alloc_irq_vectors' declared here
>   pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
>   ^
>   1 error generated.
> 
> The root cause is that include/linux/pci.h provides inline stubs for
> pci_alloc_irq_vectors() in the CONFIG_PCI=n fallback, but does not provide
> any declaration for pci_free_irq_vectors(). As a result, callers that invoke
> pci_free_irq_vectors() under CONFIG_PCI=n (e.g. Rust PCI helpers) hit an
> implicit function declaration error with clang.
> 
> Fix this by adding a no-op pci_free_irq_vectors() stub to the CONFIG_PCI=n
> fallback section of include/linux/pci.h, keeping the alloc/free API pair
> consistent and avoiding implicit declaration build failures.
> 
> Fixes: 473b9f331718 ("rust: pci: fix build failure when CONFIG_PCI_MSI is disabled")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512220740.4Kexm4dW-lkp@intel.com/
> Signed-off-by: Liang Jie <liangjie@lixiang.com>
> ---
>  include/linux/pci.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 864775651c6f..b5cc0c2b9906 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -2210,6 +2210,10 @@ pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
>  {
>  	return -ENOSPC;
>  }
> +
> +static inline void pci_free_irq_vectors(struct pci_dev *dev)
> +{
> +}
>  #endif /* CONFIG_PCI */
>  
>  /* Include architecture-dependent settings and functions */

We have this from Boqun already

https://lore.kernel.org/rust-for-linux/20251215025444.65544-1-boqun.feng@gmail.com/

?

Dirk
