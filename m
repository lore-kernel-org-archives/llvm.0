Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBD91B87EB
	for <llvm@lists.linux.dev>; Wed, 19 Feb 2025 23:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740007863; cv=none; b=UUPEU6sLkIpdTsZjyvIk82fSEYRVNiXhS53D4iNgy+jJ+Vgiwkm/pqqV+kOtFHbAqHrvNYVQjsbABUxlZ0ttT+jEFOMk7lPN6EnZ3A1qJ0lWLMxw6yrwREC/cHrdzs+rss0EFly2616+cjyXQwUnXVYC1mpbXhkbNb3ugDD4KhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740007863; c=relaxed/simple;
	bh=7BrzSMiKS+jH9/fqTN3DBF4ouoSiL1xdrGmLjC1j7lM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tPLWNS93gCDD+lwTLVfcD4zs/Vaqg6ErXh6yqM/u7x/SEPXyUWDP04OCOgg/LxTUMFSJlAE2EutsFXS8SJvH0Un351oJigz5udoIgpRXcu9/bAPIHBPLMaGAVtRLFPU8dW/s/dbi2U6/hvQvmSau+ftkorjsAG5Fs2DgRMBUGGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crM5ZTwz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crM5ZTwz"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-439a4dec9d5so551155e9.0
        for <llvm@lists.linux.dev>; Wed, 19 Feb 2025 15:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740007860; x=1740612660; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dUybulOhS0kE/3bK++ET9eEzpvtsmycFrLhnO/LKN0=;
        b=crM5ZTwzhiZTgjkEmECLmnDmBHGdzQZL5acHNq/V7JOaFMgieUwjXmGav5tHRpyUEU
         PBntzCH4L/B7JfHD3htDGZs5ABw+fofxi7+Y8jGSvt21zctm2n8X6YqzdgSGTg4hDZNI
         uKwBo3cRljCq8ZAi+tYzH5pG4UBhw0dV/dEaHDdXse9SSxglsnA9dhg34iLsd1uElcBk
         2wiHnrXqSC9qIWX+rueJGyn0/MowRyK5Rdmb7r1Juq/ABuOkdoFu0JgHAptsKGqrlAk8
         PdIUHPPWE5LK2wu3SUX2muv+Nx0dQGKhCvWUenABghhQsyE/LwtSW+Z5zr3ksdhjtZp4
         whpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740007860; x=1740612660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dUybulOhS0kE/3bK++ET9eEzpvtsmycFrLhnO/LKN0=;
        b=Sw2WAy0XoEzlhyvmoa1aRvOS+d/SisAFH9687uUiFgRm9rh88Q6yyzMSR4lULQWTsY
         boWPlKetzUHjPIXTDvzhVWnHezZASHnSa/KJE2vjf30Y+u0Nj9w8FH3OkUTibPcRwK0n
         iao4/CkTDgz8iOaFywhTXRT2B+mcCLFz6tCRKfWss6XeCfLuH2IukBpI84xPlUHhITq2
         6xUHQOVTMvPLjEx/AlQ45bYWAdlTS+n1AnHve0XjNOBsOzK0hcHr0n/HgfiV7Cbj7Ozb
         WvraKOT/ZqIBMnCa/Iu2xlJlpTY3kOOL7AFu2WkHCo/7xJnhAuKXVj9dlE8Rc81qLeis
         oQpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhBBi7x9KuBnzrQnzTkZGgr9Y6z3e7jhybn5DinUqQX11GB+cDSHItiAojUC6s2m4Dwo+X@lists.linux.dev
X-Gm-Message-State: AOJu0YwFmcmFiFU9MvjEXjtgUUMTjpXlSOs1XtspvWi+RQVwG0zP5mds
	avRVhN2UegLSbDICs7itrg1JfACUPOyIsiHZTZje78jzCjUQt4V+dFDNYkI8xbpZMOU2uiMdN8+
	UiY/Of4+pA6UtvmhnD0yr0KQt/IE=
X-Gm-Gg: ASbGnctLfAOp6lJIn6n8yFrLruAl0yL8WlLfNSE3VCycep7JQE603W3chCtCod8qESu
	WY/8uK3yBv4q/4I/xu8eZO0f1Y+USTWAemjMIMmNljEKxCvdQEnljDiqFvo9yRLikX0MtcBuus8
	k=
X-Google-Smtp-Source: AGHT+IG1BHmj8hJr/EIeAG45G5dk1X7q0NRly/wfy8NOAsFrU4xoOf+BepllUdF4Fr5/tdIMeI62DxfMSontKQGQR5s=
X-Received: by 2002:a05:600c:46ce:b0:439:a255:b2ed with SMTP id
 5b1f17b1804b1-439a255b574mr11307125e9.9.1740007860050; Wed, 19 Feb 2025
 15:31:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1739866028.git.maciej.wieczor-retman@intel.com> <7492f65cd21a898e2f2608fb51642b7b0c05ef21.1739866028.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <7492f65cd21a898e2f2608fb51642b7b0c05ef21.1739866028.git.maciej.wieczor-retman@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 20 Feb 2025 00:30:48 +0100
X-Gm-Features: AWEUYZl1gRQjDF8bP12LoQKOk6SUSp8U6yzsjJnNm_UbyNhEUb3N5bt4_wbtQpk
Message-ID: <CA+fCnZdidM3Sj_ftw6pmtzw-tjy0LLD+2aqtzSewQTOUXMs2hw@mail.gmail.com>
Subject: Re: [PATCH v2 12/14] x86: Minimal SLAB alignment
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: kees@kernel.org, julian.stecklina@cyberus-technology.de, 
	kevinloughlin@google.com, peterz@infradead.org, tglx@linutronix.de, 
	justinstitt@google.com, catalin.marinas@arm.com, wangkefeng.wang@huawei.com, 
	bhe@redhat.com, ryabinin.a.a@gmail.com, kirill.shutemov@linux.intel.com, 
	will@kernel.org, ardb@kernel.org, jason.andryuk@amd.com, 
	dave.hansen@linux.intel.com, pasha.tatashin@soleen.com, 
	ndesaulniers@google.com, guoweikang.kernel@gmail.com, dwmw@amazon.co.uk, 
	mark.rutland@arm.com, broonie@kernel.org, apopple@nvidia.com, bp@alien8.de, 
	rppt@kernel.org, kaleshsingh@google.com, richard.weiyang@gmail.com, 
	luto@kernel.org, glider@google.com, pankaj.gupta@amd.com, 
	pawan.kumar.gupta@linux.intel.com, kuan-ying.lee@canonical.com, 
	tony.luck@intel.com, tj@kernel.org, jgross@suse.com, dvyukov@google.com, 
	baohua@kernel.org, samuel.holland@sifive.com, dennis@kernel.org, 
	akpm@linux-foundation.org, thomas.weissschuh@linutronix.de, surenb@google.com, 
	kbingham@kernel.org, ankita@nvidia.com, nathan@kernel.org, ziy@nvidia.com, 
	xin@zytor.com, rafael.j.wysocki@intel.com, andriy.shevchenko@linux.intel.com, 
	cl@linux.com, jhubbard@nvidia.com, hpa@zytor.com, 
	scott@os.amperecomputing.com, david@redhat.com, jan.kiszka@siemens.com, 
	vincenzo.frascino@arm.com, corbet@lwn.net, maz@kernel.org, mingo@redhat.com, 
	arnd@arndb.de, ytcoode@gmail.com, xur@google.com, morbo@google.com, 
	thiago.bauermann@linaro.org, linux-doc@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 9:20=E2=80=AFAM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> Adjust x86 minimal SLAB alignment to match KASAN granularity size. In
> tag-based mode the size changes to 16 bytes so the value needs to be 4.

This 4 should be 16.

>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
>  arch/x86/include/asm/kasan.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
> index 8829337a75fa..a75f0748a4b6 100644
> --- a/arch/x86/include/asm/kasan.h
> +++ b/arch/x86/include/asm/kasan.h
> @@ -36,6 +36,8 @@
>
>  #ifdef CONFIG_KASAN_SW_TAGS
>
> +#define ARCH_SLAB_MINALIGN (1ULL << KASAN_SHADOW_SCALE_SHIFT)

I believe ARCH_SLAB_MINALIGN needs to be defined in
include/asm/cache.h: at least other architectures have it there.


> +
>  #define __tag_shifted(tag)             FIELD_PREP(GENMASK_ULL(60, 57), t=
ag)
>  #define __tag_reset(addr)              (sign_extend64((u64)(addr), 56))
>  #define __tag_get(addr)                        ((u8)FIELD_GET(GENMASK_UL=
L(60, 57), (u64)addr))
> --
> 2.47.1
>
