Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6437720C476
	for <llvm@lists.linux.dev>; Thu,  1 May 2025 20:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746130055; cv=none; b=Qv68uPLwAXmGaUWIPj2G0557zR9l94Po1uA3x+AE6Vunjf7Q5e1hVR3tIEcP/esCtqdIUVwM7Dl3BrPPrpeZkCgA/ZUIonRgx1kwew9OTxQ95tL1oa4wWbNvo4uiIuPcUj0bSHEr1fWOuBWVD3nazvz2+E6Jn4Ug3e0V72oa8RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746130055; c=relaxed/simple;
	bh=BrxaEXoYWGKXg2PGmFg5c8S5Eq4HVZ4HIKaULdVdahc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ObsnO+PiYo7YKSLzhYq7Rk1nDzVV/zIS2zJq2yBWf0IpiIn0m4TXB7acdbOMUp/yXSyX6ZPCrJsgod9OxymfACcDRH13q3xXKhMl8/kWIHT9FRqce+fYGL1szei7nrfVMLZrlIOm9KrtoMuPzECdHO5voHa++j+an/N8e5w50iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1tePtOS; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1tePtOS"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c30d9085aso776586f8f.1
        for <llvm@lists.linux.dev>; Thu, 01 May 2025 13:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746130052; x=1746734852; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOOEqm/pPCgs6BsMyD9s2dYK/FTS1v1KVmaovonx3qw=;
        b=N1tePtOS9/6BdMwBVX5Q04QPptGq3V4z9PsAAkC2wz7LdENcBT4ssXXU+BF96ekj35
         rBpZ60ti10/U36dQ/4fn+Tu4pyBuSTtnn3SNYCzHdDJ6ooO+ezmqWeyJQfD+IjGbwAgl
         q4a+Yx5gdd9F2pQ2BL/SYGXOE8FE+gR/oS6zRzJMfeJ2544nYyVeh9Dz3iD/dnxWVL/W
         Mxe4Wk3KBGFCwKMD66up6rt0PYIT7S/OBBvaX0qVjxy/J/8G05FUEbqfQ4Kv0KviB3uN
         1aj+ScTT1eVyXXVRtXMCZk8JHOTQQtQOMaankOP6vO5ujWx0wox8eAzw2qrG6l/KG8wa
         Rg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746130052; x=1746734852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gOOEqm/pPCgs6BsMyD9s2dYK/FTS1v1KVmaovonx3qw=;
        b=rfEQP1IGJSu2HCHT7MtJiblYAIUhxmU2lZ0p9ouIGvc6pt6+q0kjmqJ04WEArfMBeN
         6pdFd2CQpf9V6Z14sZBX4wVTF/Di0ntXL2EmHE/p1AmGUIm985gO9BlkU09UFz5ZIHU+
         L0tCx+t1Q+vGCj5MMg6Z6sBJF5VCa7jBfCW/nqwPzcaoKqpGsQc13E/UnBqdACtdX7XY
         uk5VXCExMsupUlO6DjtXRHqL5nFXrkQWYrtw6Ycj7rVFZ+TPI5VpoOHCL07UI+dqjMBL
         OLtVvdLRl6OrPmWLJQzigMKBYSq7TL55mgXevG7HgZXKm9V2mDYZnZiJN7PgJ89m61SG
         KVnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNgLz6UuC0Oqxwu6gigcLzOVNdDTslqSSXRbgbIbzb2CuMGrbjGXMjX2mLgooWQcOoReFd@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0EWCMDxnnRKwz58vQ59DwG2CpdpiiwNiqe3FciiWI1UhVYgx5
	qX7CxOMuQD3wZqkiD8G3fFbJiqZAWuAOsPFJejkvt5Xl9Xbq/xNa
X-Gm-Gg: ASbGncshZs8v5pz8OAZrssJIDlup3dI5Cp1yXt1sXgpFx3LYTRzEB9oSjZPt7zWYebL
	AeI4TricUPgltEYrXvV8sKHcwYxjNcUfbjwU7qu89Jt01NstGF4mQ7RehM6DaieWD1pHuRaS94f
	oPO3jcGkEn2wyT4W5O/T634Fjokw0GkhF7Rf1V4fvxInjMVw5snHz6WzuG4V/UCT7tVPUlk7r1L
	w+3Bmwb5CXXi2IpqHBdps3c1dXt20Oy3kVtzeqBeFjNcV3gh9QRVR20xnsdguGGV0NCR5vVK1pL
	qdcKLyY+58eS3Odsjiixl81yxGhXQAfXsvBVqBzdVuwZHaKqiMLOHMyoM6z17yYfGglKNwpXhFO
	Gs8Q=
X-Google-Smtp-Source: AGHT+IH8a1pUJQSeh3X4FAtelAZ88iDsLxyl67Hy088a9nJih1+Ck1krTw97wj9Uh1G2vDiZtUQVcg==
X-Received: by 2002:a05:6000:4203:b0:3a0:7a8f:db22 with SMTP id ffacd0b85a97d-3a099ad7aebmr128136f8f.24.1746130051567;
        Thu, 01 May 2025 13:07:31 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae7a35sm117740f8f.43.2025.05.01.13.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 13:07:31 -0700 (PDT)
Date: Thu, 1 May 2025 21:07:29 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Arnd Bergmann <arnd@arndb.de>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jakub Kicinski <kuba@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Leo Yan
 <leo.yan@arm.com>
Subject: Re: [PATCH v2 4/5] math64: Silence a clang -Wshorten-64-to-32
 warning
Message-ID: <20250501210729.60558b33@pumpkin>
In-Reply-To: <20250430171534.132774-5-irogers@google.com>
References: <20250430171534.132774-1-irogers@google.com>
	<20250430171534.132774-5-irogers@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 30 Apr 2025 10:15:33 -0700
Ian Rogers <irogers@google.com> wrote:

> The clang warning -Wshorten-64-to-32 can be useful to catch
> inadvertent truncation. In some instances this truncation can lead to
> changing the sign of a result, for example, truncation to return an
> int to fit a sort routine. Silence the warning by making the implicit
> truncation explicit. This isn't to say the code is currently incorrect
> but without silencing the warning it is hard to spot the erroneous
> cases.

Except that the extra casts make the reader think something 'extra'
is going on.
For readability you want as few casts as possible.

	David


> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  include/linux/math64.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/math64.h b/include/linux/math64.h
> index 6aaccc1626ab..f32fcb2a2331 100644
> --- a/include/linux/math64.h
> +++ b/include/linux/math64.h
> @@ -179,7 +179,7 @@ static __always_inline u64 mul_u64_u64_shr(u64 a, u64 mul, unsigned int shift)
>  #ifndef mul_u64_u32_shr
>  static __always_inline u64 mul_u64_u32_shr(u64 a, u32 mul, unsigned int shift)
>  {
> -	u32 ah = a >> 32, al = a;
> +	u32 ah = a >> 32, al = (u32)a;
>  	u64 ret;
>  
>  	ret = mul_u32_u32(al, mul) >> shift;

