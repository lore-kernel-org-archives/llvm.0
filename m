Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9DE302CA7
	for <llvm@lists.linux.dev>; Sat, 25 Oct 2025 15:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761406231; cv=none; b=rR7reQcRtaW5Lr+wbDzL2pCyPgMk5IqRajcopYPGVhwkeVZfZUcr4MgillM/ZZV+reCLH6lptgeuqcZAaw5U+UXBWWQmQkUJY3v8PPZiWt8Jg423zAAECzJFwLo7B8Z/wl4DOcZqqIjIppazhSYbiP/ju3p/Lj0C/qsy0zvFY3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761406231; c=relaxed/simple;
	bh=YQe91ROlP9epeFIBAVeb7AxK2YjKLaeOQX5QP76voII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ApX5DOqNoTd+mBSOp91JLpAjIKW2x3moQMe9gDEowujy7/47cVjzsHJI95f4kN8aV16CyZnsZn8yXGbSqKXC+VWIAJyHS1ILdDULB6E3LEacJG2ULCGxHu3XWf+UqkkFMRESkoEHEde4RkPZwN3rthpk4hwhRXwBqe1sro8+/T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=LjG7MzXA; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="LjG7MzXA"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6399328ff1fso5611811a12.0
        for <llvm@lists.linux.dev>; Sat, 25 Oct 2025 08:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1761406228; x=1762011028; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQe91ROlP9epeFIBAVeb7AxK2YjKLaeOQX5QP76voII=;
        b=LjG7MzXAPjqtnvCn3OJO0gaiIS0BXh6jeqWpG+fmNWStQa7Yeu3OBIxuiUmpMTB4XK
         m2WXtzYIWlAgOXmF62Ap4+PYDzA5B5zr7VQOAP5ZRrPtQvhvkQYvkWi/ssgYtxO7iH0x
         GBxl2YAZ4FiBvTsOCdG3HzGUys1lU/tbq50euwGL25k4A0rZS8irYiOcbQi6u56i28sx
         YusWZeXlO+IoJ9949Pc615oIYVnEPLu2LLV0aRzNG5YJi5DY/bYxDzliSKHW4JozxW7i
         lhv60b4F/wlJYeLrZPN8GDBlGZGJGfr4SJ+6u7TVOrzJ0qaBrhyHG1dp7XLYBQzccjFz
         U3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761406228; x=1762011028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQe91ROlP9epeFIBAVeb7AxK2YjKLaeOQX5QP76voII=;
        b=B5gfPPdo+54Ed1u8nODGjK9sbdNWUncAWyqiU+CXiAc/lBiteVNmNePeVu9wIVczYa
         GfxLM5LoZLYVdSykyWLsMeMBxdMFFZxQZp/9myJ3sVmnSLUlXgj1gtl9VTyd9uWyQJ2D
         UHfiRlkGWBSWUDbhykYOmTuPU6toVW2sg4679KlkPEuLwe2a36LtwCbG4WkoaCc0fBT5
         iKbX4Dq9hHY/FXeue+5v5NDgjnZm34lwFmlzqJmVaLPgm/gRoyWv8g/4zjqUYg2dBnc2
         nN51w+DfDHJUQh254I/c6+tyqLt1OaqUXgDNlbpqLLEOhPpP2DrfpoXUAShD218XEDHO
         2wPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTPnUjc8EtnRVAXU7IniIR52L4LTUQLiF0rC9frM4IUnu6ZGsPcNNivmGzvT2UVdDNxp1a@lists.linux.dev
X-Gm-Message-State: AOJu0Yws6Y3pWmiPbK0UGewgedFmBBqC7pmsuvk9kQSpo2KKJhVRVSR3
	eQYlJYi7+lji4WLzKHTgvHtjKvPqxDt96y5EaBPqgaVMaMZcgNa+6KaUUWvb8+cCRdlqGv4rj8v
	PrDNVh+/C6qDyTRGAjoOeGI/LJqiJxNyGkTfKp0O02A==
X-Gm-Gg: ASbGnctgHJKr8MhTSEZ3p2oaX8ipXqqSd+UL39HjBZRzVbdzW8QYiHPF1MCZQBgYF4A
	NGaVD0ytvLfbfYvo/iozsbD1jeI9eYphF26t4m5iS7fqJ1+2ZmGbyLM0FrjjITnpBm5PEvK58z4
	HLhx5BGZH/5b5wS8ZjHo1n5iXV6YpwQ+ShO/P4lQVAMMCZqhl4T9B37oRVNb1Vdnwmh0i3BwfLE
	s7b3D034oHsRisZJm8xBmVUafr+rAD9T50X4EjB7nSvBKA8nz62zZAaoDCBBzV1ZKP29ZF+2GGQ
	ldkyZBUs0jd0M36z9CEV0b1Ab9xr
X-Google-Smtp-Source: AGHT+IHyii/MACqqA1gMbxyh8CZfZM/MVeB0dSh2M8XUI9vv6+1k3VQ9IQ7FPNSu6S0HuT0ITqx9emJSEDbCLG+Yc0Y=
X-Received: by 2002:a05:6402:350c:b0:61c:cf8d:e51d with SMTP id
 4fb4d7f45d1cf-63e6007d198mr5362602a12.22.1761406228044; Sat, 25 Oct 2025
 08:30:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com> <5-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
In-Reply-To: <5-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 25 Oct 2025 11:29:51 -0400
X-Gm-Features: AWmQ_bmUOgV3_0ASbOM3QoMzXfGDVzgu3GeEUS2HtNMs-zqEXMaBdqidVXde5tM
Message-ID: <CA+CK2bBHzGi-4dqXeQn+OvahYfm5miKEhSuVmYCpo=Z4cUdONw@mail.gmail.com>
Subject: Re: [PATCH v7 05/15] iommupt: Add iova_to_phys op
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

On Thu, Oct 23, 2025 at 2:20=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> iova_to_phys is a performance path for the DMA API and iommufd, implement
> it using an unrolled get_user_pages() like function waterfall scheme.
>
> The implementation itself is fairly trivial.
>
> Tested-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
