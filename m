Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BADD24EF6B
	for <llvm@lists.linux.dev>; Fri,  6 Jun 2025 08:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749197519; cv=none; b=uQlZym17u+ZaS32gTIL/TOzOn/ykp8M19sUpae8428qtsP+rdqrZWpHGtvQid+SYfClG5SlsOtJRfpjmFDdSJ9G2ByMrYab8xZEccMjxkp+4zKoqKVTXSh+41A6pxHMpm/SNgLTVxQjn9daQrynPkuvCahr7ib9WyPFM2FbpaIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749197519; c=relaxed/simple;
	bh=ZuDJMQx0bckQqQYAX8ktUsiM7fLLnYTzUNDL9d0esbs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lv8sokWta3jBAaeXtsSPELUaO9EBllVNOM40Z5U4kvbDP39aBdJfXt/3b+xW1XeFpspHhwcuXuBe4dx1ZDnD7O+6XXyFJBvhazi0zJh9BC6BNxpGHG51BTYmT8kvBPt+7Hl+QniH4X1I3g8kPkjPyikk9b94Mf+7Vw+SsnOp5VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fO7Xv6KR; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fO7Xv6KR"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6077d0b9bbeso425255a12.3
        for <llvm@lists.linux.dev>; Fri, 06 Jun 2025 01:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749197516; x=1749802316; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TgApWI0+BVOjkWxGB075M4gC4i26wr9y4+tNmb0C/Mg=;
        b=fO7Xv6KRO9MZ5hhvTjPT/u6CpnIoXbYUmWmJAsOUk8BO7KtiniVmFtqFotEQx9U86I
         jwIsoCLTT8aa/ofrC7QA/g79zGYigRHpMmUf4VHBTBspdsu7HUO3Ag8oANGEQ92quQMm
         FrweMDP544Nhxr47zwKgvvotCcadqgH8KXgIjakjZ1sQEnILcQ5wY+Rwoh2+o0nliBkr
         S7ZxRHLcZMiI5UTvBOFJIHB5S44cEE4dJ8+TlS8o1hktQ1YsDyb3sGnGor3GyXWZYwca
         weO2JdD8ghDxXiLK8ZuNB9VTpY3N+ApurniyKyYQyEfEt92aQOlBdKC87+ctxjFug4Fy
         8reg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749197516; x=1749802316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgApWI0+BVOjkWxGB075M4gC4i26wr9y4+tNmb0C/Mg=;
        b=gs5y4yV5HVvkNqQHRw+xiBT5CLkyMTQ8D5DbdAmxINWwueB5lEtqXIHF2ztln5/7Cj
         EiXMLNprwb4RdfTP3xIQ/5hr/qkh0TvCWqsGuRHMi1bJCY5UUb+0QimyU/8TDDtFAZjA
         ORkbLPajp9o6AaSl0gRy7IqmjgaCoC+OOTgLBzwT9kKHqED1V7lDQMYHhJw3DP1eFWZu
         0oR6ntxHZQtj7DFyxZ3kMtKoifBqJBZhTsE8Zp/evCXWQfSkpqLvy2p6WWtN3IJRr6gX
         EtmNj+roSSEVzJWFVhMaHNNav0v0/7XOcZqm1961chBCcuVTYIDiTiyMPiHAUMC/Tb/5
         Veyg==
X-Forwarded-Encrypted: i=1; AJvYcCU9RAIt/0v60Q/Tn4mzMSuH/NM4zyGxB3ohaJbPN9tnqDVhOB4fpNI4JaHn9SNzAiVT94nj@lists.linux.dev
X-Gm-Message-State: AOJu0Yyl/FDmwNPG1Dn9ClFpmgic1VrerZdizS6IpknsuW6aKyfkol++
	gh+m0yk8Eb4gGgEHd97Uj2k7+uVg6UNbmihfbltuTqK9CdpdOLV2wm0c2DiapJkho04=
X-Gm-Gg: ASbGncuTTSiGJ7sYxHcjYreVwDxI36jB0gaTb9O7JPabeRw7PwU5Mpsyfphja6+gAK+
	Vl3YoSdhwDjizY1N0larHujq33eO8NPzJGS1ZYgArvberzq0YA/cJnyEE0Rf5c8t+PBPo54Qx5l
	WIrZ0Pm4brHBCrhKmTWSt/07nOMQYxJ2zhEaPTj4JVkxKAMbxEgvmIvTsF1nB5P3zoWoUkwcsh7
	jeOmWe+8H/635pnSM0eJa7w1YHCfBgm4nTyc9FzeODq4G8NSQHn0S+PjacoI2Lu/igY+a199z6N
	7GEZmmeesbw2P9gHlGDdpVi2WW8oHuJ4PH8/xQ==
X-Google-Smtp-Source: AGHT+IHf3kWkZJUnkGKGDtasZxLAsJqT2XOamn0NT4qFa01M0qYWTtrfBtVc1Eqbs4sG8b8aQ7MZtQ==
X-Received: by 2002:a17:907:c25:b0:ad8:8c52:d61f with SMTP id a640c23a62f3a-ade1aab9f4dmr176003166b.35.1749197515955;
        Fri, 06 Jun 2025 01:11:55 -0700 (PDT)
Received: from krava ([173.38.220.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d7542b1sm79027666b.35.2025.06.06.01.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 01:11:55 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 6 Jun 2025 10:11:53 +0200
To: Suleiman Souhlal <suleiman@google.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Masahiro Yamada <masahiroy@kernel.org>,
	Ian Rogers <irogers@google.com>, ssouhlal@freebsd.org,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v2] tools/resolve_btfids: Fix build when cross compiling
 kernel with clang.
Message-ID: <aEKiyUwKGDUAs3sf@krava>
References: <20250606074538.1608546-1-suleiman@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606074538.1608546-1-suleiman@google.com>

On Fri, Jun 06, 2025 at 04:45:38PM +0900, Suleiman Souhlal wrote:
> When cross compiling the kernel with clang, we need to override
> CLANG_CROSS_FLAGS when preparing the step libraries.
> 
> Prior to commit d1d096312176 ("tools: fix annoying "mkdir -p ..." logs
> when building tools in parallel"), MAKEFLAGS would have been set to a
> value that wouldn't set a value for CLANG_CROSS_FLAGS, hiding the
> fact that we weren't properly overriding it.
> 
> Cc: stable@vger.kernel.org
> Fixes: 56a2df7615fa ("tools/resolve_btfids: Compile resolve_btfids as host program")
> Signed-off-by: Suleiman Souhlal <suleiman@google.com>

lgtm

Acked-by: Jiri Olsa <jolsa@kernel.org>

thanks,
jirka

> ---
> v2:
> - "Signed-off-by:" instead of "Signed-of-by".
> 
> v1: https://lore.kernel.org/lkml/20250606052301.810338-1-suleiman@google.com/
> ---
>  tools/bpf/resolve_btfids/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/bpf/resolve_btfids/Makefile b/tools/bpf/resolve_btfids/Makefile
> index afbddea3a39c..ce1b556dfa90 100644
> --- a/tools/bpf/resolve_btfids/Makefile
> +++ b/tools/bpf/resolve_btfids/Makefile
> @@ -17,7 +17,7 @@ endif
>  
>  # Overrides for the prepare step libraries.
>  HOST_OVERRIDES := AR="$(HOSTAR)" CC="$(HOSTCC)" LD="$(HOSTLD)" ARCH="$(HOSTARCH)" \
> -		  CROSS_COMPILE="" EXTRA_CFLAGS="$(HOSTCFLAGS)"
> +		  CROSS_COMPILE="" CLANG_CROSS_FLAGS="" EXTRA_CFLAGS="$(HOSTCFLAGS)"
>  
>  RM      ?= rm
>  HOSTCC  ?= gcc
> -- 
> 2.50.0.rc0.642.g800a2b2222-goog
> 
