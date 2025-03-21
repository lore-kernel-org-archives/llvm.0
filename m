Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA7B1D54D1
	for <llvm@lists.linux.dev>; Fri, 21 Mar 2025 19:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742585345; cv=none; b=T4FPXoLYqrOkbYVBEeviXU1Xv2TuLFiSqgz64qkWhAG+RWrQ0lVYuJqcrpurWMA4nTqn6hWRGP+GJseC4pBXRaoxat4ezYwXfjrRgeXCijKfWBzs1Yr6CebFqkf4owqiI57a2AD86RWAYaA9e3iXVleUY8Pcf1RUpdeAxeT+Y74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742585345; c=relaxed/simple;
	bh=BuvsGhJHZ8Xw+48Ecwh+fuc4DRA4GXHKSEgROs4+XPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nHWf/JVsEDxPzh6Dv8eW0rDNywuENiGwfHI8NjEtljJwl/csIqgXTQfjd7q44n91wmObNhsaczygpmCsLLFl2+ifhWxB5xSEpKzgL8FnBh0+DUzt30DM7mHwfkJXroFzluWvurqfTN9KNOaHp9DXHCynOXWcabshh9V3Yz/Q6dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LQmWXCNf; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LQmWXCNf"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac3b12e8518so511825466b.0
        for <llvm@lists.linux.dev>; Fri, 21 Mar 2025 12:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742585342; x=1743190142; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2hED09Hatc/530rZzT/g3h0VUVivrA2PSH7ts/rtDc=;
        b=LQmWXCNfuYYfAfNp4vbv/4Lqut5MeQ7Loz77eVldu+ZHUvS2Zl4FuL/Ob3lTam+IL/
         gdRXb/A9geI2Yg2QXwWe3Nukea8sYKB8tKePVRGytUx3yIMKbuyJCf+Z8R2lbCDGU7E8
         uzjrnXwG8rTDsFZLf8MlMTlI5SpUv75Tm4lzhE+OK46xKpdLJhKnAFrXQpW6xEBLhQWZ
         JPbClwotn7PkD6qAQ2K4+GDoj+TSxUKcYyY0FM2J2w3AHlM//A5ECkxwTVEBaawIgWWP
         OF4bRUCN83BmSa+OjsLP9oYwmVxxuoXg82Fzo9csGEHs00h5otOmTN6/cPJO8l3VYmae
         SfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742585342; x=1743190142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2hED09Hatc/530rZzT/g3h0VUVivrA2PSH7ts/rtDc=;
        b=rgurfnWy0NgSPzc10gKsMN067BVtdzQP/6eP+wa+nxjseeMR+KLYt9CbFRLr5E0spV
         141y/txFYYnn2fP2NuTL5k2JDuTRlhMCfgjRivEUzLyQWgq5kDaRdjh+TMi9XxNWzli/
         ItsTG5pZ/a5PRpfLIpBzvu1I9BwS1qbFZHVpMQs0PpxldIaKU5ApZep6w6gC/F/5QteZ
         04GXb4krf27uVRvSFSS4+acEchSmbt/wBuTcJdvWzXbV0WFrcQMjk4cQPRkhD+3bj3c+
         EwumeXbu4gVwTvPwuFxIDWekRqWwMr0WEhi3jTDW5EyZkyn+Ny/JPjFG2FvnQ4TN81KX
         xXBg==
X-Forwarded-Encrypted: i=1; AJvYcCXUFUdEtpjXm315WY0rJ6ammdY9e70aetilGIunrGMn/HfH2W1sl2Vylsq7hezEESGmnXJe@lists.linux.dev
X-Gm-Message-State: AOJu0YykdY7ZGw8UYsTG2enUL/N0PfOs2Ex0iMOd+ozAHsVYApEw3zEF
	GLY7OEzFoIbPy9PmzaQi7hjav7ezfftjaKtR796aG91QUwQnwZpR5pM9/roy17D+mYjPIIM0upS
	WAagLBjtQbWzAWUvJH6gCAePW9t2HvxWfsxo=
X-Gm-Gg: ASbGncujQtRdEEGqZMOwt0VKxZ6YpVBmrk5rIwQk91lHG/wohlQcjO3ZzCP/onGuLmZ
	seWny95VHFOp7w5+UGSIDS3Gax0/by38Kj85XAa0MWHg6dNZgAflvTGIVUOznBF3eviDg3GXPBS
	wlUt9iNJGkhJ+pnfL2uLowtPM=
X-Google-Smtp-Source: AGHT+IFr6DHIIXCK2jv2tQeCJB9flyjvB19jQyVNG+m61yysVbGI2vUqrhw0CPy/4k7NDizCoPraQg+p9VazXzLcBqg=
X-Received: by 2002:a17:907:c7cd:b0:ac3:da3:a1b1 with SMTP id
 a640c23a62f3a-ac3f2238346mr451667366b.26.1742585341652; Fri, 21 Mar 2025
 12:29:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250320235910.334620-1-changyuanl@google.com>
In-Reply-To: <20250320235910.334620-1-changyuanl@google.com>
From: Bill Wendling <morbo@google.com>
Date: Fri, 21 Mar 2025 12:28:44 -0700
X-Gm-Features: AQ5f1Jpu1bzXyoskz236qYXLKL_6cPSKwyh10XNtASrfDEnHoVGM76uniVMGG08
Message-ID: <CAGG=3QUEY_Gmu-6K7rk6-y8AB7HVuV2V9sP5K3h379teAZXyHQ@mail.gmail.com>
Subject: Re: [PATCH] clang-format: add for_each macros from libfdt
To: Changyuan Lyu <changyuanl@google.com>
Cc: ojeda@kernel.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	Daisuke Nishimura <nishimura@mxp.nes.nec.co.jp>, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 4:59=E2=80=AFPM Changyuan Lyu <changyuanl@google.co=
m> wrote:
>
> Add two for_each macros from scripts/dtc/libfdt/libfdt.h.
>
> Signed-off-by: Changyuan Lyu <changyuanl@google.com>
> ---
>  .clang-format | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/.clang-format b/.clang-format
> index fe1aa1a30d40..4decda7474e1 100644
> --- a/.clang-format
> +++ b/.clang-format
> @@ -210,6 +210,8 @@ ForEachMacros:
>    - 'evlist__for_each_entry_from'
>    - 'evlist__for_each_entry_reverse'
>    - 'evlist__for_each_entry_safe'
> +  - 'fdt_for_each_property_offset'
> +  - 'fdt_for_each_subnode'

Could you alphabetize these please?

>    - 'flow_action_for_each'
>    - 'for_each_acpi_consumer_dev'
>    - 'for_each_acpi_dev_match'
> --
> 2.49.0.395.g12beb8f557-goog
>
