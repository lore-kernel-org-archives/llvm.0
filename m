Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208B4264A90
	for <llvm@lists.linux.dev>; Mon, 24 Feb 2025 17:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740416551; cv=none; b=jdp3FT0wBDvi8E9wWM7Scu9+oykCPh5Ppn5ZOk3eyLXj9nPvpMoha5dyYGngTVlyNLaXlveHwLFj/v8QS1wgF68Bl2lkEdkcXPis+klsuwqHYJxUXcHg8KfRtCpG2VYRnwBS+iwU4qd5w7mIgvaLXM520LcCxqPitDRUTbo2ztM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740416551; c=relaxed/simple;
	bh=YIKvgyamnQgmpSYwaI32gGdN6nJzCowQ2WNOrwnPjRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gwAMdBI3EWJ1rKjABEcoogArMa4IEW6+YXUfddYUbWEwC8whfSrepWs5TljLasDGuJ2e0FamV2XQHINlpLLLddMtN3jTT+o1lTuvI41TOQDIyesQWp5gr4nloABJBlq0YvmdlSrFqUpB/7JzeVj/t8DIMZXK46y1FL7t9CZtElI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UzPVkjzx; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UzPVkjzx"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-471fa3b19bcso467601cf.0
        for <llvm@lists.linux.dev>; Mon, 24 Feb 2025 09:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740416549; x=1741021349; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VR9fYD4ulxXrS8gZJjWrfuiZTIdun+GiiSoBV4GR/Fw=;
        b=UzPVkjzxZjStR7/0WBSRdbdTUO+pjRiCG202e9ekH2CRkTvAB73A+eXFgXZnrs6grH
         DLkHx54EHxgkWOpx+j0ycHchhuWEw25q3yZbnrLFPZXcBktXfsk0tLatQT3ccx8gyHIl
         2I/pv4ERxMp6amWWWFG0L/raYuKkJM2+Il4DzZl8ABR0jpHc//WbwV9mGhc76ovQZ854
         tNo8qW3ThpVNykIXl4Ftwj5+pq0elvR3S6atAddxyo35HMyu+bQHSdxVux3dgzn+oMak
         3Bq4debcgGx1RhLeLdFPhZ9Ea3k3g5mr9Rt+qOxhGDBl+YRTluAzC3I5LXsfEI9Zypvl
         9VMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740416549; x=1741021349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VR9fYD4ulxXrS8gZJjWrfuiZTIdun+GiiSoBV4GR/Fw=;
        b=N5AkssfOsKdJc7wBolJVY4U8k+FoL0qcDGK8wwadpM2RcrvEhCozyoCSvFGXBmwpUy
         l7UQeg7C0RCrwOA1K2kbpXvp2WYUziV8zDtjZmVxMSK2uYtMi76Pk9jmnKNG+08arLfQ
         g1jF4/lInMJxRDARDQn6yeBSTmAIn0A4dkw3GXx+fix9cfHcBdN32p0odFVf52m/xynl
         hKLUYlLcrSsQ8BbzLv1AiiigFnbHDAGeHZdx4Ly5hnZeN2mcMlzjZjt0PLU6bI6HgXpv
         XyWVpW2XRAiIydBVkLFBqJXecHpsBUwH6nUKpUzN8S526ojdJVtvcAIczdUWRMgY6y4v
         bPPg==
X-Forwarded-Encrypted: i=1; AJvYcCVHlFaCnJqLyQMsJ70v0H3uxFmu2eK3GLwNXf0FjS58vG7EeR6R0oIgZqoMAIWWbDGWx6tb@lists.linux.dev
X-Gm-Message-State: AOJu0Yz72epXhbisHR8cbHVmxWrkOLd+SS+ENfQIb4/J1fSMxAQY6Ahm
	rp+6AIbzReaMJEnpE+EEVyd80QpJG9Gdb1F49k+wXSzdrLW/3OeXCfyYIh1mXhDXn4OqKSAl56y
	cP8Az2hybzeAZmYx0p5qfbGpqhHnety6KzUc4
X-Gm-Gg: ASbGncvC/tvCMy0WGL0Or3VZHdnbQLpEZsUq/NINoD7sh5j7opEopi8n4+uX+WdmTNL
	Y2vxYmKaDIvh+ziSnGbLPhEiP/GMSy0FH090yH2S2hjDsR1B9C2Zkgd0k3T44W+vgY287GzDz3b
	2zUqOf
X-Google-Smtp-Source: AGHT+IFVV/QSW2PsYP3VXHqjBpcE4L3RaCpSXY45J/dLEVmzaKzSZI2xSnS/YRNsQjCr3RqPRormupPSqzbPXf0Zgso=
X-Received: by 2002:ac8:5781:0:b0:471:9ece:b13b with SMTP id
 d75a77b69052e-47376e5ae3amr68601cf.1.1740416548614; Mon, 24 Feb 2025 09:02:28
 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250224141120.1240534-1-arnd@kernel.org> <20250224141120.1240534-2-arnd@kernel.org>
In-Reply-To: <20250224141120.1240534-2-arnd@kernel.org>
From: Frank van der Linden <fvdl@google.com>
Date: Mon, 24 Feb 2025 09:02:17 -0800
X-Gm-Features: AQ5f1JqyvF0cZUse3UCnnuocLyu1h_TE-Jmz-aTlK_6A7bNBbcPQf-el1-E8RJg
Message-ID: <CAPTztWauUVnA+ZRytPadKv7oHaRb1xmf_MneiiNXrD1j_1N9xw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm, cma: use literal printf format string
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2025 at 6:11=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Using a variable string as a printf format can be a security issue
> that clang warns about when extra warnings are enabled:
>
> mm/cma.c:239:37: error: format string is not a string literal (potentiall=
y insecure) [-Werror,-Wformat-security]
>   239 |                 snprintf(cma->name, CMA_MAX_NAME, name);
>       |                                                   ^~~~
>
> This one does not appear to be a security issue since the string is
> not user controlled, but it's better to avoid the warning.
> Use "%s" as the format instead and just pass the name as the argument.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  mm/cma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/cma.c b/mm/cma.c
> index ef0206c0f16d..09322b8284bd 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -236,7 +236,7 @@ static int __init cma_new_area(const char *name, phys=
_addr_t size,
>         cma_area_count++;
>
>         if (name)
> -               snprintf(cma->name, CMA_MAX_NAME, name);
> +               snprintf(cma->name, CMA_MAX_NAME, "%s", name);
>         else
>                 snprintf(cma->name, CMA_MAX_NAME,  "cma%d\n", cma_area_co=
unt);
>
> --
> 2.39.5
>

Yes, thanks - not sure why I didn't use "%s" there.

Reviewed-by: Frank van der Linden <fvdl@google.com>
