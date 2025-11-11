Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A892877CB
	for <llvm@lists.linux.dev>; Tue, 11 Nov 2025 09:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762854220; cv=none; b=XglORlFOy7VYmmeiBX/+NTQe98sejRLZieFneWPfr+3Ii5Y/DlRnHpIDLdAyU0zOcMqb0glSy9Kk6ljR4kcVuSokdmnOpAPcu+us05Hb65thEigDZHu+hLaGzVcxGu4NAQzvHEreAE44QY/Sv9pt8KWdTr/apwlCyKAOelIoub4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762854220; c=relaxed/simple;
	bh=pIXt5RY2avngREVQV/WVzy+4eYrZh/+QLtTn4Iny2dI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KdGjeYHWnDYmgOk74p3dqA9Dx9kmdxw7ngKGkC9ZtqmwAsOERTLygKBhpWuUB12byb/Do3HHz6CFw0ALx0boAooCk/tSBUSF7LXXSmQz9HPs0N9+Je9g+Fa/Qy/phJNnCa1qJfils7sHPKLHalGr8nlDk59HQ5cUjmtOSQU3zjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4m6PBn9n; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4m6PBn9n"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-343806688c5so2317716a91.0
        for <llvm@lists.linux.dev>; Tue, 11 Nov 2025 01:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762854218; x=1763459018; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIXt5RY2avngREVQV/WVzy+4eYrZh/+QLtTn4Iny2dI=;
        b=4m6PBn9nizl8EZtUBiORY9mzO/CV0RA3vD0JwHvYX2IwNIGc4eDA8/INcMDBji0Wd4
         s4V1xKimGOGw7FGUkTtE8vbRftYS7L+t2vQD2ewT2/o5IgnLHjWDiPD7CgEp8hDEdW+O
         wVbBRrdnEHX4ad2o79R7GIbAhJeOCJfxf+4wU/+llIM1JDMBxrJbbvXmOCIbe3p56DPt
         5/Dpm8V7yPAfHM0Xyowf8nOpJleB8sFqoM4v6CBb1Zj3C2aXI3xOr1crz9gt8uzRWh8G
         34THQolHxVGdXujkL41vlipLm5ds+I0man/M3L1C4CiqBcalezk7hrwuQvVYLBgL6gKc
         mHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762854218; x=1763459018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pIXt5RY2avngREVQV/WVzy+4eYrZh/+QLtTn4Iny2dI=;
        b=InpfRUZmH56HWc5skd0XvYSCVQb3GXrDGttBocBCFrkOQJeOloZOeQcQON/39KJHSE
         KSNR9IAzuCpWNYyhh7nohgecr1+SW2OKpOYD5fPLqLW4azU6qt/cPr4zPdPDTDd8CPd1
         3hxUJxvD0G/uUBpiHefLrxiNdA9FrTsEag57nLh7Cu8OgiBVkITj1F3b0uw5z7Cgf4oO
         vipc5c8a+qPUznDBMIC95GF92GopIMbIN7RBjzwhZIksrtFlL4xYViyWots2oZShFW4k
         cMG4TU2ERFOsRAKSvSadyO37k8NcEs7OlJeT6v7U9fFkqFq48Oc7TJ34DcZnM5MWEQRM
         jS/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIVBPNHBtL/ROFNoxJr9gAZf4NeaTdC6pOHsHm9q7cmQWyTw1yixSgd8zbleAv9WBM7WEq@lists.linux.dev
X-Gm-Message-State: AOJu0YyC5jHAEdzxxCV21Vz/WHaiE0US8p4oIuYiP++f/GwjCOv8qt24
	GE0B79hzPJ9jIcaa5ghAlrQhBmF5vwujGaj14R1wiOvy//gNNUk0+LUS/sVUEZltNJ1dZzVWySz
	1DQW5TY01kJWp8PGSkkg8e4I/qmAtu3pU5jZact5d
X-Gm-Gg: ASbGncta6lSS7D2/hlIjIdlZB9pOm53Hp6DwWF2XjU4Lq4LRWjZat8yEC3TiK0Jzbpm
	JR2oQRVus1lTfiFEmT8RbHRn7lX4O7qH2E5pUuuQ8sjqgAkN4Y7x+2e9lpc6vQWGn5ZbY8YWo5W
	gqoJbdKM66G3mKDZXwCaDQwOo1bj6kAXZk++BnMXcdT4PHftXcaHJc51V46MFk4mGSdtTjwH1IR
	su2zEWgpx0NER6RFxsk/q61ZLAHiPTbILgI7BE05fXc2FJ3ssdE6K4EX40IeHD4VvDD8R0xD5NS
	iQQOWYuS/GraAY2OjoW9BCY95ijzH6tyCBvZ
X-Google-Smtp-Source: AGHT+IEXo9sAHez4NR7EbhnospiZemL/LvJQCJ/Qa++0OXR1ORpXnOCB1WU1DKZb7CVWmG9+mXoqaQaxouu4ZLKngmU=
X-Received: by 2002:a17:90b:6c3:b0:340:5b6a:5bb0 with SMTP id
 98e67ed59e1d1-3436ccfd8dfmr13988152a91.26.1762854218118; Tue, 11 Nov 2025
 01:43:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <d030a07c956c1e7cbf8cd44d6b42120baaa41723.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <d030a07c956c1e7cbf8cd44d6b42120baaa41723.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 10:42:59 +0100
X-Gm-Features: AWmQ_bkUJ_QlWZiGCG2FxZvthHc4c4y_090hZyMeaaw5jt0Qf6xk9VB1Qerb_Pc
Message-ID: <CAG_fn=VUzLi1C9jss1eHV=pPh4QFmWk-fQUbhNwrGNSUk-yKaw@mail.gmail.com>
Subject: Re: [PATCH v6 08/18] x86/mm: Reset tag for virtual to physical
 address conversions
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, 
	kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, 
	ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, 
	morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, 
	baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, 
	wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, 
	fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, 
	ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, 
	brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, 
	mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, 
	thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, 
	jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, 
	mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, 
	vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com, 
	ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, 
	ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, 
	maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, 
	rppt@kernel.org, will@kernel.org, luto@kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 8:07=E2=80=AFPM Maciej Wieczor-Retman
<m.wieczorretman@pm.me> wrote:
>
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>
> Any place where pointer arithmetic is used to convert a virtual address
> into a physical one can raise errors if the virtual address is tagged.
>
> Reset the pointer's tag by sign extending the tag bits in macros that do
> pointer arithmetic in address conversions. There will be no change in
> compiled code with KASAN disabled since the compiler will optimize the
> __tag_reset() out.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Acked-by: Alexander Potapenko <glider@google.com>
