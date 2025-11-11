Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A426220F21
	for <llvm@lists.linux.dev>; Tue, 11 Nov 2025 09:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852109; cv=none; b=LhHYOzF/cNZC0eVBTlz3r/73av+RAIW3Wf6ogcq/jotJt8kV/q1x4gxs9JQQafur+ubTlVhsBV2TZvfix6UCt3JQO4E0Or/Dl7nQwPLSTBoMfxDUK8MPVQai4p9yICF5BNT/2etpi7a42bkBCLuAswYJYjlQHIFcT1aJKl4DDUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852109; c=relaxed/simple;
	bh=T+mH9+7PNLYr6Z/2ln9TuMbRS+qcoVyhy39YsWeg6dI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sxvq6Dst1wmWqrntaCq5T8zcb6mzXSe6DaEtQS57m+UBqfnFegPYUKmQSxrX0kwyvnyc97o/XHe1OutgPRxVcfE7UGmN3ZAXPaKY3oLozN99DV2qooeLbKn2YeZXIZ/a6MMXWT8gCHwWATV0M9918bNbHcrfWGehQCwZZ1S6eL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vdy71rul; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vdy71rul"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4ed861eb98cso45651721cf.3
        for <llvm@lists.linux.dev>; Tue, 11 Nov 2025 01:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762852107; x=1763456907; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+mH9+7PNLYr6Z/2ln9TuMbRS+qcoVyhy39YsWeg6dI=;
        b=Vdy71rulvvrYdrfQm66nrjGH0phzgk5iZkDKgQZ8rq4HsxGwzX7WUJbDRi0AEZr2dR
         cskAPvLGWRILMt3FMUPNB2kYOdE0Oul1ie/s4Jngj9UKWxouvtAOiW0p8ToFps6C5Aou
         bVprJ//6MTe0D87TRHNk7omhw94yrG0M7LSKu0dU7zUXtsB2ZJDnTRfm1JR9oOX2gO60
         MsOrucPM4+aZnZiXHJqNwwpziW/uPCN47nBU/X0HynEIYbKLWnS2eOnMwJr7NRWd1GiD
         gJnTaJVR8X6eDBlbLLEAB0lf0DzIPbH9ZErjSwd7EMegncN0cmUVCeaoguxetymITNBG
         wqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762852107; x=1763456907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T+mH9+7PNLYr6Z/2ln9TuMbRS+qcoVyhy39YsWeg6dI=;
        b=DVRLftyOu/8EMjBP0WVyAG8hEhxP9n5Lwk7SvPiCLkTrB0cUCpi5u2iYLEnYj5BoPO
         kDGX9HkiGk2Y08jGUg1M1S0H9IplzP5Lkt1xNsGgEDQSI6pEDX8ErpbBxxjSLb2PkZhf
         eE19yWqO3d8c5dr0qsUDUIJATb1qoxjcq/m1b7PpU5Z1eekY1diHvNBjw+Ve6Prh6rQw
         anc5NExcKjGECwXN63JwL06NZLfRkwtn/sApNuY+rmeYhR3RWccShC3dng8WtEQad+pA
         szpqtHRNSpCq0gYUigEM8JbP0fraNY47/pLypsy8I2uGZlhMWnEimqenRcr6TuWt4qD/
         b/UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaXDx/UK0AK53NYyyyXrR0RbfgLyFPyZlFm1pli8181KKFj5Se6BV6A3PKizdC3pA0AqN7@lists.linux.dev
X-Gm-Message-State: AOJu0YyGrShIGWaSzauKFkNXdD7UvVRWaJO1HvKIM/fp/fhbARlgb9ks
	PbgTS/Grxr49v1fuYOruWz9361JHHCoEWieqTLYo6WD2DGU7t/wLsIAex/1LUw9uxLWSPhzBFKa
	NgvLuU0nICxTnfaNvn9PN8xmxxcsQH05dltMG7HMn
X-Gm-Gg: ASbGnctTipLQwLst/bSNiHoH+663pI14TCHjZAZABVDYmvMZY+z3t8jWJ9bAxo2w327
	yzDdTgFLdVVg4jcQS6rimJP+slxPzzBdcLSLv72vKUIAFQ1PN4WlsrxnSIx3TazF7bUDxVEh1V1
	tv+lOpypSeifgATwEXINiIdMQKIUtQRM+Y6zgNYcwoGXrcs1eORv/ruJSaAlIavuPy308ARm5Yk
	7wnowUFJaTQrf0enQ4nsC2+gsHNqatH5xuaUqG9ynZM0BmCvGLFYOli6TdNeKfguIWr869af7Wk
	saS3X+rpiqYvSvEfO/wqhBmP4TJHClhB+x/1
X-Google-Smtp-Source: AGHT+IGGiGzNQ2eAyJqdaO9JyMrXkP7w+emfDXwZMPoyyY2gy1i/zUBgnLRf870LMq5UXpv/uG8YRTM2WfKUuwW/Bjc=
X-Received: by 2002:ac8:5751:0:b0:4ec:f4be:6b12 with SMTP id
 d75a77b69052e-4eda4fd3621mr141844221cf.72.1762852106635; Tue, 11 Nov 2025
 01:08:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <56d9203b1fcb6281b0d29b44bc181530e5c72327.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <56d9203b1fcb6281b0d29b44bc181530e5c72327.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 10:07:50 +0100
X-Gm-Features: AWmQ_bksKNIR8oRrvQW5ElnBBjqadCFUKWpQKwYmKonXZ13JEF-XHOSa5ehktsY
Message-ID: <CAG_fn=U3SLOoy_K-2ShOMYf80i4AE1tB1AL4w7wcJAXBxi+PtA@mail.gmail.com>
Subject: Re: [PATCH v6 12/18] x86/mm: LAM compatible non-canonical definition
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

On Wed, Oct 29, 2025 at 9:08=E2=80=AFPM Maciej Wieczor-Retman
<m.wieczorretman@pm.me> wrote:
>
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>
> For an address to be canonical it has to have its top bits equal to each
> other. The number of bits depends on the paging level and whether
> they're supposed to be ones or zeroes depends on whether the address
> points to kernel or user space.
>
> With Linear Address Masking (LAM) enabled, the definition of linear
> address canonicality is modified. Not all of the previously required
> bits need to be equal, only the first and last from the previously equal
> bitmask. So for example a 5-level paging kernel address needs to have
> bits [63] and [56] set.
>
> Change the canonical checking function to use bit masks instead of bit
> shifts.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Acked-by: Alexander Potapenko <glider@google.com>
