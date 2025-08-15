Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8EC2192F9
	for <llvm@lists.linux.dev>; Fri, 15 Aug 2025 15:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755270352; cv=none; b=Ql4Rg1BFNp47AXp13xWh5FVdYInGpIPs+6dxHgksXiSFHqd/ZluC+bLPkEHZVCQzG8byDQx8RW4+JahXsYmpYzBoC67Mh3Zkgg91kaSTgnYhefNOUZGBM7fyq+2ivQYlXI1s3m5VWYW6hi66Z1cFPj46sKws8VX1c8vWz7oaY00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755270352; c=relaxed/simple;
	bh=wNfhEAk3rnqID1OBHwaELciuLi86NZwkA7swq1t5JdI=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=LkKMj6VKpd95BrWgDo5petM+P+xaW8E+Dz0aErbUGyYzTkT/ZJuMIdLDxuwIInkjFIRDeq4thrd4IKDqgzZFLhfjVcSlTm1gtTsZD6Plzue/LzVlHHHW5qwNBEbpk+04a6AX1EPaqs3Vs3kmM5kMaB2hD5lBOMQ2hxIT+7MRAUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=mMnNw5zV; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="mMnNw5zV"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b47174aec0eso1326471a12.2
        for <llvm@lists.linux.dev>; Fri, 15 Aug 2025 08:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1755270350; x=1755875150; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=38zqqxNHqbGz3C68JOy9Ugb8wAb711DWGVbxjNinx0U=;
        b=mMnNw5zViTpRlWQJc4pm28Fl9fG6GVbrTc7QvHbRN8mbSW4ftaYavwfxndvLAhEs5B
         GqmUdCN2lKZRoAchaAjwItYStDI04oAoyj3fjahl34HyxlFTvkF8jkAfs3JtutFbmVgm
         nY9KbhiXZfNAxcANtzpEgl/Qr5cZSP87gfkIRGIacAPulo6niq+cItyOpwFkhR8sEQfI
         uOU/nXf+3yNbXDao4gKv1huVp5vtKxY7XdTUHR7AvV8j+jxN9haoUz6NL5m79O4DFKCf
         iKXttbdFOI/hfWrIz3Q+priGCV76emKXdjj/MDhg6/Qn5UzyYVYVcpzOfz1Nc0aEQNby
         Ehhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755270350; x=1755875150;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38zqqxNHqbGz3C68JOy9Ugb8wAb711DWGVbxjNinx0U=;
        b=hSzpjr789QakI2DOAYhl0ZkCHS2GFralHiUodGbruxqSbUlJWNYG+6ZNPaU9dAvqYe
         2kztwo2OjHRxa0l3q3FR3yeHqjsi0bTm3RQd4feAXdc8gumcYwlBtuKnnhv5FwiTOgEM
         h6TFubao+q+Oei0GFIF17w4akpk6+KPtcNy3+GfImbD5hGTmKe8OXTDpk48DXULPmcyi
         bJSb0VJdfWeH4NfLgbW0Fq3fOqAiCHB1hb2EpYzj1zz4ZL0V35Ltrj2MuI49Xr/9rJbc
         XyrKD8oL6IU3dv2ZNQIktAdrkteiAL1+QHzdaZOcl/PlBkiawwT1lGFgXfeMuJqWYGlM
         YloQ==
X-Forwarded-Encrypted: i=1; AJvYcCWo1GavpiU/LhQProtqZt9WzyOF8cmCRhn40UeIt9NTc08xy9RjdVRA6jX91fl+gtS3a0RE@lists.linux.dev
X-Gm-Message-State: AOJu0Yyn2MbqvC2nWct4LVE0GHOaWrn22J+tLhT8eA17VJe8ReDCL8Mh
	0Nu/XCGX8nVTvm0WKBCD1fURTA9AnLpCgLCIrq09mAIN4mn3wEet4/Y24o8kTK2EnQw=
X-Gm-Gg: ASbGnctGnoCMDilV6+gUBqhLcNLESUeujTLYtSe8ANwGMbIxnS9AnEwpdXdUf0Q/ku4
	m5mCFhGjPp42hHXZllD9JI2AJM9KidZzMX42YZJAWVQJqFgQPueVJT9dgtNGHP3b+mUXhRae1CA
	txPsKXJF6WcNQXkEpNJlBTZDJfajoH2xs6CJoqvh8yQSps1P/n3UKZm5TwR2QqN7gtjRBy0Hlfa
	TqlPGWGtrXHBp5RsWZLO/C2kD5XLeXNfwjy4fDyrlAgA8z1XiC+b2WuPzVMaj4aF2JYZSCIXXQ3
	OCR0Wjj6AJlYHjPkCl08JrDH/ysfQ5dCBcSPFAaec/wnrfnmG1FF7EvTfUYLbvKFzDQgpEuonVH
	ioKiw6UNXTMpGt/ihzB6u+b9ttJlRDpEAm8w=
X-Google-Smtp-Source: AGHT+IG3gBMogdOr+spUGY65daTLUVfmz5lhgO/opdXo6UimhkccgL0C2Gx+F8DUbrOBq4AI/2z6Vg==
X-Received: by 2002:a17:903:198c:b0:240:a222:230c with SMTP id d9443c01a7336-2446d5af743mr41307075ad.12.1755270349908;
        Fri, 15 Aug 2025 08:05:49 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2446cadf96fsm16286885ad.41.2025.08.15.08.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 08:05:49 -0700 (PDT)
Date: Fri, 15 Aug 2025 08:05:49 -0700 (PDT)
X-Google-Original-Date: Fri, 15 Aug 2025 08:05:47 PDT (-0700)
Subject:     Re: [PATCH v4 06/24] riscv: elf: Move relocation constants to UAPI
In-Reply-To: <20250812-vdso-absolute-reloc-v4-6-61a8b615e5ec@linutronix.de>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Alexandre Ghiti <alex@ghiti.fr>, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com,
  justinstitt@google.com, luto@kernel.org, tglx@linutronix.de, vincenzo.frascino@arm.com,
  kees@kernel.org, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
  hpa@zytor.com, richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
  linux@armlinux.org.uk, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
  maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
  chenhuacai@kernel.org, kernel@xen0n.name, hca@linux.ibm.com, gor@linux.ibm.com,
  agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, tsbogend@alpha.franken.de,
  ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
  bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
  tmgross@umich.edu, dakr@kernel.org, nicolas.schier@linux.dev, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
  linux-s390@vger.kernel.org, linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org,
  linux-kbuild@vger.kernel.org, jstancek@redhat.com, acme@redhat.com, alexghiti@rivosinc.com,
  thomas.weissschuh@linutronix.de
From: Palmer Dabbelt <palmer@dabbelt.com>
To: thomas.weissschuh@linutronix.de
Message-ID: <mhng-5B6E084E-60EE-440E-BFF9-5E81AAC9A473@Palmers-Mini.rwc.dabbelt.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Mon, 11 Aug 2025 22:44:19 PDT (-0700), thomas.weissschuh@linutronix.de wrote:
> These constants are useful for cross-platform userspace, for example to
> process ELF files during kernel cross-compilation.
>
> Move them from the kernel-private architecture-specific header to the UAPI.
>
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/riscv/include/uapi/asm/elf.h | 66 ---------------------------------------
>  include/uapi/linux/elf-r.h        | 66 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 66 insertions(+), 66 deletions(-)

Acked-by: Palmer Dabbelt <palmer@dabbelt.com>

I'm going to assume you want to take these all together though some 
other tree, thanks!
