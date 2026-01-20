Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86BE441055
	for <llvm@lists.linux.dev>; Tue, 20 Jan 2026 17:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768931703; cv=pass; b=uatkevSwqsKSxb8UkV6OYWLP9/CRbpGacoQxE3l+OTid1HuRhKtnxpllK9UyHShFB5Yyj6MOLLYmZFwlVb+lETly/awQ/mbaWMsDeNDoRfDAxgJdfX+ph8MbPLWOBYhT033+RUJyzlBEGdvNrty9HvkCaMaNFBCjhD0vTeVVRFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768931703; c=relaxed/simple;
	bh=oHcdxkzTnAC7Ywax8Vckvgjp4LUCRYz+0yKN85C0sUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f5sPpqA6ixLj5xu7J9PDjm4y4HpnElRZqiyup2zDS8MEct+hCNYhyJeIDXAgwCjXTZ4UOcDalQsawYb7bntduhN5QDZw4EMjPo9EG8vgfDu1f8VUEiLyGfymMNWbGOiowTTYM18bm3GiJFdRDwrnq55N6emR9EuFuEy1BP7VoOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYu2RIBc; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYu2RIBc"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47ee07570deso39729295e9.1
        for <llvm@lists.linux.dev>; Tue, 20 Jan 2026 09:55:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768931699; cv=none;
        d=google.com; s=arc-20240605;
        b=Z/ogpMrm8GrdmEcmcuJVNR3wOGRQD+JKD57y/1TqBt3CNX4s/pL1zHHlTLoChvwIhv
         FLOTA+u60L7Sd/9C/QchTUQaPHm2Xo+KfuE+nfn9FTeXh8o1iQTTa3bUK9/udA6BASAL
         Ig+tgf0v5uVhJDRsUnOFo3RppVvSe6mFkJYiVqCVz+Pjx80sLhmHioeKxQlnIsBo9//S
         Gxx62vyDRInlHE96QW/BgPZ4lq6zyhG0hEzp/GK5t2Yb8ZoBN8I6N5sAn9RaGL2Ojoba
         /d8QEQOWZ8kT7L3T6hFgK8iCXT2/GBTTclTWYFzNULGQsQTV69hScrwz/vYCBrNCWs/w
         nV2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CSI8A4TsHJKLPFzycUoWUfFc682TNPoMjAF0fDDKMCo=;
        fh=Fom22wU5uOedY3tDjCy4JEokZE3uU9WAl7OiaiJwxO4=;
        b=hM2rXyb+CXnk6fn5K764Y/dRWCkCwwC3MVObeM59kO3nndsi59mDZ8QK6TwMn5b2WW
         M50liUYV1P7EVS9IvKVmdYTmvMNBgc5P4D6McN5az3H0cCNMSciIVYaNgdPlQHUdJ3Aw
         pqmuXYsGIKoUMvuiCD6L6LcIkTzyTqQlB8fVtBmN6NzPmb9J7QLlwqnSIIKgERHjWj7/
         A/vOV6ParkAgJmQsxISdO/9AVmaD1vKGIoiqIGUlX7D/yDTKnzkGiuQcGp/0Ip6ZOIeR
         amq4fzfXf3lrD9IG5/8Q9a/gF+OSyP9JFd8BFJRgnxeaDeABdnmmKTR88qURhfQafvvb
         6vVA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768931699; x=1769536499; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSI8A4TsHJKLPFzycUoWUfFc682TNPoMjAF0fDDKMCo=;
        b=XYu2RIBc4DT+PSjndz5kRXU4huhVdov6vZkWgEHHub1av4rE8welHJu39krMSPCH84
         PSfGE13mhBeKWIAjkmEb57qoKeJAP0HRPZlKhSSDQCgW44sGxcSdY/OsZcRftZUwmjin
         6Z+MOVb3ooRpDh5b5h6zCZAo1d7auFzUt6EXxXJaWw7aux47ByCMSubXigOpJj6BfNp9
         mxaJ8bCJHapTi6vfKnse+T1WH/+iYDXVFS58mRc5elPTnQUFeGhFoVeC1SXLkkq0mE00
         j5zMcu5xS5okHt41njc20GKJ8WM4uqQYCR0em1KvURYhPZy3uPYAYKA5ZZYIhU7lcgul
         1/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768931699; x=1769536499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CSI8A4TsHJKLPFzycUoWUfFc682TNPoMjAF0fDDKMCo=;
        b=GQuMopt3HrsME6+j7kSXeYfxhM6S2uzSVKIjN2904+cH5aRLTsBpyg++VEUCUvzMWf
         dZz8d7UKzZ/nXZWFDy+C/FMK7APkdQY5gBqOwi+YbtUim8eIgcjCebkGWcCuA7Nw1nE3
         5rcB2ATzP5JziTfibngKv5QtynvXrtiO/zSs/2tWD06XpjqYjFN+apNjwpQw08CVTXU1
         3gTDNU3+YEGaeBQN9HPP/BH8epNz16SKdz4I5ikiUVCB84zhTeOAannENuyIYMp9Rpzt
         YFCGqOci1vvgasfQUVTZ6sVguIyQH10J8mS+5XSxlNuL8Iw2HOP3MN2AR3KHNIRZ/JV0
         yF+A==
X-Forwarded-Encrypted: i=1; AJvYcCVXrZCOPf2F7vcPZt+QWFX/ogAGQ3cvTz+HOFyydDU5ARLBvHEKNxxEPEaDytg2MGknC8uc@lists.linux.dev
X-Gm-Message-State: AOJu0YxRG3TONcaMsqAFR9H7iSwUWhbpd8eNyLtn5nDFNJ/9d3vmRRpn
	KEokXX6b0XQmAXUH2BoVtupV8dhjG/9WWN5VJDjmnPbKezOovRxs2q3o5QFZB8cw52aV5y0WruW
	taplf4/OLQmmqolqS4DjxqMltVlMswnI=
X-Gm-Gg: AZuq6aK0BzacAX/RtCqfSPuLMZhIlur1A02VZxA2hXu+Oi8W5YExvqPDwgzaarxdUm/
	UldnUbgRrrJJeBsDVK1JK6h9O+wA/vfEHtXBzkM0TcXI7eIHgc3FEPmC9dWK84uaYAdEvemDy2z
	4la2iKhU4B92JDX4Ji4vpB8nXfpykpPeAEaBICgPYBS7K7ul3C0FEp2IDxu4Tkr2kUpwh6mGvSN
	f0rkzkeM8ACVZ7Qi52RQocr5jGhimKmfJk5t5/f0Jo0ac1m3WXYfBK2jst9uxbDHZWWV/F2ySNJ
	uzC3Y4sGxfS1nq6oN3yf5a2Ebl2SPw==
X-Received: by 2002:a05:6000:310d:b0:430:f58d:40e5 with SMTP id
 ffacd0b85a97d-4356a051bbamr17722513f8f.30.1768931698830; Tue, 20 Jan 2026
 09:54:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1768845098.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1768845098.git.m.wieczorretman@pm.me>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 20 Jan 2026 18:54:48 +0100
X-Gm-Features: AZwV_QjKpw6bSXc49tC7Ft6D0ET5YLTkUvlrSRTXNNU3JrK5sgQbId38njXfil8
Message-ID: <CA+fCnZf+U3RhmMeGxQ-UypJw2yGd8RJ0gFKrCXsC1eQ5YO-eXw@mail.gmail.com>
Subject: Re: [PATCH v9 00/13] kasan: x86: arm64: KASAN tag-based mode for x86
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: chleroy@kernel.org, surenb@google.com, justinstitt@google.com, 
	nsc@kernel.org, jan.kiszka@siemens.com, trintaeoitogc@gmail.com, 
	dave.hansen@linux.intel.com, ryabinin.a.a@gmail.com, kees@kernel.org, 
	maciej.wieczor-retman@intel.com, urezki@gmail.com, will@kernel.org, 
	nick.desaulniers+lkml@gmail.com, brgerst@gmail.com, ubizjak@gmail.com, 
	rppt@kernel.org, samitolvanen@google.com, thuth@redhat.com, mhocko@suse.com, 
	nathan@kernel.org, osandov@fb.com, thomas.lendacky@amd.com, 
	yeoreum.yun@arm.com, akpm@linux-foundation.org, catalin.marinas@arm.com, 
	morbo@google.com, jackmanb@google.com, mingo@redhat.com, jpoimboe@kernel.org, 
	vbabka@suse.cz, corbet@lwn.net, lorenzo.stoakes@oracle.com, 
	vincenzo.frascino@arm.com, luto@kernel.org, glider@google.com, 
	weixugc@google.com, axelrasmussen@google.com, samuel.holland@sifive.com, 
	kbingham@kernel.org, jeremy.linton@arm.com, kas@kernel.org, tglx@kernel.org, 
	ardb@kernel.org, peterz@infradead.org, hpa@zytor.com, dvyukov@google.com, 
	yuanchu@google.com, leitao@debian.org, david@kernel.org, 
	anshuman.khandual@arm.com, bp@alien8.de, Liam.Howlett@oracle.com, 
	kasan-dev@googlegroups.com, linux-kbuild@vger.kernel.org, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 3:40=E2=80=AFPM Maciej Wieczor-Retman
<m.wieczorretman@pm.me> wrote:
>
> Maciej Wieczor-Retman (11):
>   kasan: Fix inline mode for x86 tag-based mode
>   x86/kasan: Add arch specific kasan functions
>   x86/mm: Reset tag for virtual to physical address conversions
>   mm/execmem: Untag addresses in EXECMEM_ROX related pointer arithmetic
>   x86/mm: Use physical address comparisons in fill_p*d/pte
>   x86/kasan: Initialize KASAN raw shadow memory
>   x86/mm: Reset tags in a canonical address helper call
>   x86/mm: Initialize LAM_SUP
>   x86: Increase minimal SLAB alignment for KASAN
>   x86/kasan: Use a logical bit shift for kasan_mem_to_shadow
>   x86/kasan: Make software tag-based kasan available
>
> Samuel Holland (2):
>   kasan: sw_tags: Use arithmetic shift for shadow computation
>   kasan: arm64: x86: Make special tags arch specific
>
>  Documentation/arch/arm64/kasan-offsets.sh |  8 ++-
>  Documentation/arch/x86/x86_64/mm.rst      | 10 ++-

Still missing Documentation/dev-tools/kasan.rst updates. Feel free to
send as a separate patch to avoid resending the whole series.



>  MAINTAINERS                               |  4 +-
>  arch/arm64/Kconfig                        | 10 +--
>  arch/arm64/include/asm/kasan-tags.h       | 14 ++++
>  arch/arm64/include/asm/kasan.h            |  7 +-
>  arch/arm64/include/asm/memory.h           | 14 +++-
>  arch/arm64/include/asm/uaccess.h          |  1 +
>  arch/arm64/mm/Makefile                    |  2 +
>  arch/arm64/mm/kasan_init.c                |  7 +-
>  arch/arm64/mm/kasan_sw_tags.c             | 35 ++++++++++
>  arch/x86/Kconfig                          |  4 ++
>  arch/x86/boot/compressed/misc.h           |  1 +
>  arch/x86/include/asm/cache.h              |  4 ++
>  arch/x86/include/asm/kasan-tags.h         |  9 +++
>  arch/x86/include/asm/kasan.h              | 79 ++++++++++++++++++++++-
>  arch/x86/include/asm/page.h               |  8 +++
>  arch/x86/include/asm/page_64.h            |  1 +
>  arch/x86/kernel/head_64.S                 |  3 +
>  arch/x86/mm/init.c                        |  3 +
>  arch/x86/mm/init_64.c                     | 11 ++--
>  arch/x86/mm/kasan_init_64.c               | 24 ++++++-
>  arch/x86/mm/maccess.c                     |  2 +-
>  arch/x86/mm/physaddr.c                    |  2 +
>  include/linux/kasan-tags.h                | 21 ++++--
>  include/linux/kasan.h                     | 13 ++--
>  include/linux/mm.h                        |  6 +-
>  include/linux/mmzone.h                    |  2 +-
>  include/linux/page-flags-layout.h         |  9 +--
>  lib/Kconfig.kasan                         |  3 +-
>  mm/execmem.c                              |  9 ++-
>  mm/kasan/kasan.h                          |  7 ++
>  mm/kasan/report.c                         | 15 ++++-
>  mm/vmalloc.c                              |  7 +-
>  scripts/Makefile.kasan                    |  3 +
>  scripts/gdb/linux/kasan.py                |  5 +-
>  scripts/gdb/linux/mm.py                   |  5 +-
>  37 files changed, 312 insertions(+), 56 deletions(-)
>  create mode 100644 arch/arm64/include/asm/kasan-tags.h
>  create mode 100644 arch/arm64/mm/kasan_sw_tags.c
>  create mode 100644 arch/x86/include/asm/kasan-tags.h
