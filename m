Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610982FFDCF
	for <llvm@lists.linux.dev>; Sat, 25 Oct 2025 15:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761405248; cv=none; b=hQ7jmIk43HE54q1LTFTASzdd+XHWGef+gLiPI/T+HQLBHWpB/apNG60GMiSMlQD5lBRLs3Rp0sggqNYRGHthOrbHxyNArpNj5sPTjci0dFwAkLNzw7RAzUvAtlpFua2fwO6wssBUZ/n27242BHMEF5PblY8wdzpUqn0//dom968=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761405248; c=relaxed/simple;
	bh=CL675AwnhszTvchkoKww0pB3s+a1NTfUgwGopybj9qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pw9BhYCGkc/vcbKPUTdvEj11a+rsCE8l7kACKv4649ZSgMJx/o5o68M2uj7TQQe3mH3ShmN6ftQYcTI+sTLzUgJgwXOpDkLvpVPQd7VYgwtBIFHqXvOOlZC26Oso3iBc1STU6NYO5ubhpuhf1stX/lqxxS5AiG55W2L0GExxwhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=PdQXU03k; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="PdQXU03k"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b4539dddd99so644493266b.1
        for <llvm@lists.linux.dev>; Sat, 25 Oct 2025 08:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1761405245; x=1762010045; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6ZApRvRb7vW0G2zoc1eEE/W2po0au9F5FmCvI0sheY=;
        b=PdQXU03kEfE+IGdXYK7s08GrvcYwfgbEu+PN0R5cnhz5zPN9x1BfcJb+rLwKxcvKkJ
         IophMaJrE1mUwF34DfzYqJFTzuWzXh9KX4E/KQp+MFY7hqoe1hTF/lqA737zrawuw/oI
         j8zZQuW8BB1Ydvm6WMK+K/IHHU+F3pKHdrhizT3uujOR/2kCFJILRCp5amnzBHoUwHtl
         u5P6tZWhXj39IYuZUEA3zT+cgIXeKgF0ZxYA/9z9damQ4slhwaRk3jRVEivVnFE/a3K6
         xd3AO+cWmMcTbJWy2W8KLHK5eJnikc4cGL0fe2AMf4MRVXSlR44Ql+VGsLcBAqY1qBwR
         75Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761405245; x=1762010045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6ZApRvRb7vW0G2zoc1eEE/W2po0au9F5FmCvI0sheY=;
        b=CCkt/Fi7a0J57Z5PapNYFV2FwXeBQNRtN8QdIvMEYP0MtRs9XG3sykGSRPM3gvrbxG
         MrSTjvkkT3bzhdA7lfh8sywod487Cs/QeWDacPiNPvurSZyjfGzFFZk8ZfPfUmgs9R0+
         Izxc7iTeabYwA7sxpZJ6yDZ7bxPu6gqh8s6qY67RmGWVGFodDS5eyUu9zjvhUUPWYKAl
         4iCMzLOPTQr/OAy11PNv0xhK/6BaHBQobnt9QzM9oZ4+6wK9B3sHZrhowp+br48CzCxd
         V9XYJ+WBjDVdvWipdRkEnUGuY4XXHuJKxcsCydLAq9YjQXbg6AFps4hq8cor0NGtJhn9
         qcFw==
X-Forwarded-Encrypted: i=1; AJvYcCVy4v1TjpEZkh6XwCn4ym3c6G4jCCfSa87M4I8U8qt4n8vIvJ7hXTBIpLNOhg2APCnyGxEA@lists.linux.dev
X-Gm-Message-State: AOJu0YwN79jHuvxSGJ5eN3u6opS9koVvE10UwwKmjlWhuUYPADuqHHAw
	WMIv70Gzx27pyZij66omQr1u5skvKUT1St3EwC66cI0+uSw4J1IGobHYePyCvcaLixUtizcqBuN
	qwhAF0XM5CPRu1vBoZjBexxUat4UA7Nbnps+bZ0KZhg==
X-Gm-Gg: ASbGncth86FCGI4JaDodEYNcQjQQH/5RuAfXyNZKQXM8LCySnOqF2CbB0KcvuO9y2xB
	+FrHJu3Ipj7i8S3zE7bGJwepwlLk2yM+PbbbUTqf9Vct6NPl4mjDrCcH4pNBcKzA9B+OVpGTt7t
	ycxCa9sYcPDLwZon8Zp0vVEaehfSwCt9crm+qbAZyvTKN6FN100F2uBgUILsgdVe28ePoHanhCl
	2m8pwdI43/5k5XcTxZGLUniDtYQ1C9p6tDvW+nmiZPr0S9aJieYVXCCp/WrDZcie/fFL6p5Av0k
	//KGM3X5KDKdyVxE9hXembJSv+Ix
X-Google-Smtp-Source: AGHT+IHaV1ZPy0NcxBjvZpBvRmdUs/H93j26P98BKr5SgBmvXnyMy41VvCYN1RoSAKCw4YXmnyQMwoR6KSlG6St14Q0=
X-Received: by 2002:a17:907:86a0:b0:b3f:f822:2db2 with SMTP id
 a640c23a62f3a-b6d51aeff2amr1161620066b.11.1761405244508; Sat, 25 Oct 2025
 08:14:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com> <1-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
In-Reply-To: <1-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 25 Oct 2025 11:13:28 -0400
X-Gm-Features: AWmQ_bnwA61ouglJ0muhK3QYt2JBH2l0zMaAEi3nbw0px0nYabPLbrggddVDt6k
Message-ID: <CA+CK2bB8JTN8qcSumb_tmY2gzmbahoDCeWS88W-Fh7P68pDhjg@mail.gmail.com>
Subject: Re: [PATCH v7 01/15] genpt: Generic Page Table base API
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev, 
	Joerg Roedel <joro@8bytes.org>, Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, Bill Wendling <morbo@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Will Deacon <will@kernel.org>, 
	Alexey Kardashevskiy <aik@amd.com>, Alejandro Jimenez <alejandro.j.jimenez@oracle.com>, 
	James Gowans <jgowans@amazon.com>, Kevin Tian <kevin.tian@intel.com>, 
	Michael Roth <michael.roth@amd.com>, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 2:21=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> The generic API is intended to be separated from the implementation of
> page table algorithms. It contains only accessors for walking and
> manipulating the table and helpers that are useful for building an
> implementation. Memory management is not in the generic API, but part of
> the implementation.
>
> Using a multi-compilation approach the implementation module would includ=
e
> headers in this order:
>
>   common.h
>   defs_FMT.h
>   pt_defs.h
>   FMT.h
>   pt_common.h
>   IMPLEMENTATION.h
>
> Where each compilation unit would have a combination of FMT and
> IMPLEMENTATION to produce a per-format per-implementation module.
>
> The API is designed so that the format headers have minimal logic, and
> default implementations are provided if the format doesn't include one.
>
> Generally formats provide their code via an inline function using the
> pattern:
>
>   static inline FMTpt_XX(..) {}
>   #define pt_XX FMTpt_XX
>
> The common code then enforces a function signature so that there is no
> drift in function arguments, or accidental polymorphic functions (as has
> been slightly troublesome in mm). Use of function-like #defines are
> avoided in the format even though many of the functions are small enough.
>
> Provide kdocs for the API surface.
>
> This is enough to implement the 8 initial format variations with all of
> their features:
>  * Entries comprised of contiguous blocks of IO PTEs for larger page
>    sizes (AMDv1, ARMv8)
>  * Multi-level tables, up to 6 levels. Runtime selected top level
>  * The size of the top table level can be selected at runtime (ARM's
>    concatenated tables)
>  * The number of levels in the table can optionally increase dynamically
>    during map (AMDv1)
>  * Optional leaf entries at any level
>  * 32 bit/64 bit virtual and output addresses, using every bit
>  * Sign extended addressing (x86)
>  * Dirty tracking
>
> A basic simple format takes about 200 lines to declare the require inline
> functions.
>
> Tested-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
