Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CAE5674D
	for <llvm@lists.linux.dev>; Sat, 22 Feb 2025 15:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740236921; cv=none; b=GQnLucQssjVqK+oDow06K4SBv1WaB0hkq1dPCtmgherheVPuamUkaQQ1MP8iem6DegCJKr/2g/3WgYGiwAdWCHBuHwIVDsuLUVmDEM2c6VUkdIFJlGN6pdsuqW2slqWSYFIcq9FsQpv3/Xhkm016AyoB+AI4jwFHAPljD9OuLmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740236921; c=relaxed/simple;
	bh=QtuG/5BcoUsjSrbU4qpV+q15VbeQ71cUAi9kEK9SiH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gFfRuWd8chrbgskVJBJc6YhLwhwJZaE0QwpICd/eW1CRvR2mcW0gzxmN6SijzQR1Q9gcN77y737lPaNv1alF2MGUvd5tYmGaKtMqPIS2dzLmaGY+QYN+QEkHSk/jC4OM3DMi5Ue/a3FSYhwhI6oayaxrzfVQgxpehyG077yGcJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmPmgkGa; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmPmgkGa"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e17d3e92d9so25123836d6.1
        for <llvm@lists.linux.dev>; Sat, 22 Feb 2025 07:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740236918; x=1740841718; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtuG/5BcoUsjSrbU4qpV+q15VbeQ71cUAi9kEK9SiH8=;
        b=lmPmgkGaqWky5Kpdx3FwxfYyGsmF2pfSV9BVJfc+eWEbIn0gP7ZtDFAENMHEyJGKYP
         5JcC+3cVSfKaciGRnUZC6p1UHZEw15r8P6abOzgltsW+3qnpqbzAtFlnO/QccSF9j/ul
         Qrf/csC08F6QRPEFs9bbcpoe5yG0eH7WryLnIcEcNH5XqaNFLFbwobZVsRKvOT4lHB93
         A/SmGh1XxGrY87va0oWXTZ9aTj/UE5vlQ1n2R4zg2tRo0CCIoSR3dsqu80xhWs7mQjtz
         jIjKpA/xwzSz+ZLYXpqX9DwSi2bNv3PO9jmi9daB0hkZ1aOtZiMmsgQM9pj8hiaQZwp6
         naig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740236918; x=1740841718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QtuG/5BcoUsjSrbU4qpV+q15VbeQ71cUAi9kEK9SiH8=;
        b=aT5GWsq4o+XyLYgJZdWboWitVFWQWvmRQUd4WOn2ZFLFZF1hyHSY64kJXuhivrmmD0
         Y3K5IVe9EZy/sjFCeuevIbxGboloELoWSsO7lvrLS65fDU5Zmk2ITuAZbpsjbkOlcCkZ
         0rqkF2wiANLqz2t7gQiq6yfqJxHtATwvnc7kkHeUaPZpmSOT1Nb4fu9XEl4dqofzxggB
         serf4UJrb4Sc2CpQSf5BzzOJ38pHFZGIu0nGpnAqyQHkpoQ+g4SHRPjHd1/0yb3EFT5b
         uxRus8ljpSjNuG4btFiXQM7h36cVrXsFXLHk0foevLOnHqvvpdxUtTplxWHQuwp2rW66
         boIw==
X-Forwarded-Encrypted: i=1; AJvYcCXc3mOHyzG6zxeNSR2ymcvbvpwAk+6WDE9nj8uuDTRORbGhhCLKpWs9lfyyTmfwCx/0cxGl@lists.linux.dev
X-Gm-Message-State: AOJu0YwO4WOXlWbavncPuk+4d5uBM0Lf2RYISE2/Wf+laYsyFtddzyxW
	tqXFfQOdgUob2DTzCFbIIQk6w4fnG7t00yZlStFu02Cv+IQakCnYN+qZZEeMSnS7nnN81Kilv4m
	JAMp9DkZsoMyrE8Jmo8XMbxuLYNs=
X-Gm-Gg: ASbGncvZg3A9Ehc+OxsRGd+1qhTeU/NV0w6MGzqNrgY6euO5rSTDavUIZjuIrVa9Y6f
	ThW90pfXiJz4FqwGFMMmM7g6y9kcUNqwzkCjEYF9BtSTgVtS3ulm/9n3zo1bdvFqRyKYagN3BPl
	7SWBclMLTnBg==
X-Google-Smtp-Source: AGHT+IEJ2JsBIFft6qtbntZmh6AxGF+u51NNVilXV5V7bSD/sZi1cOS+hJiUD4Pv6rAwQGUfSVoXl46LYmb2ewIlxz0=
X-Received: by 2002:a05:6214:400d:b0:6e4:3de6:e67a with SMTP id
 6a1803df08f44-6e6ae967571mr77225696d6.30.1740236918641; Sat, 22 Feb 2025
 07:08:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1739866028.git.maciej.wieczor-retman@intel.com>
 <2a2f08bc8118b369610d34e4d190a879d44f76b8.1739866028.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZdtJj7VcEJfsjkjr3UhmkcKS25SEPTs=dB9k3cEFvfX2g@mail.gmail.com>
 <lcbigfjrgkckybimqx6cjoogon7nwyztv2tbet62wxbkm7hsyr@nyssicid3kwb> <ffbyaler57cdwgs5axtdpnwg52jtwx7tx2rykjro755c45mihl@czmbriuhg3to>
In-Reply-To: <ffbyaler57cdwgs5axtdpnwg52jtwx7tx2rykjro755c45mihl@czmbriuhg3to>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sat, 22 Feb 2025 16:08:25 +0100
X-Gm-Features: AWEUYZkHzCChafiSRX_ILBVkyvuq6LP-GPRD5NbeLAJBmqWSC9A2XvM186wgsYI
Message-ID: <CA+fCnZe1U_nV_ByK2+XjBdXq0WNYzB0f30BsrsZKcxyOSu9cTg@mail.gmail.com>
Subject: Re: [PATCH v2 13/14] x86: runtime_const used for KASAN_SHADOW_END
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

On Fri, Feb 21, 2025 at 4:27=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> Also I was wondering if you know what "hwasan-mapping-offset-dynamic" opt=
ion is?
> I noticed it in the llvm docs but can't find a good description what it d=
oes,
> even from looking at the code in HWAddressSanitizer.cpp. If
> hwasan-mapping-offset is not implemeneted for x86 I doubt this is but may=
be it
> could help in a cleaner makefile for x86 at least? Especially once these =
options
> will be working in x86 llvm.

Yeah, reading the code [1] works better to understand these options.

My understanding is that specifying
-hwasan-mapping-offset-dynamic=3Dglobal without -hwasan-mapping-offset
would make the generated code get the shadow memory address from the
__hwasan_shadow_memory_dynamic_address global variable. This option is
in the common code, so it should work on x86 too. But I believe it's
intended for userspace, not sure if it would work for the kernel.

Even if we use this option, I don't get how it would make the Makefile
cleaner - to me it already looks clean tbh :) But it will possibly
make KASAN work slower.

[1] https://github.com/llvm/llvm-project/blob/llvmorg-21-init/llvm/lib/Tran=
sforms/Instrumentation/HWAddressSanitizer.cpp#L1929
