Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6C62E5437
	for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 17:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762796957; cv=none; b=jZJ9FyEnsIl0weyIfKFjBRWZDuPs2d+q1u5/CiZWw9qI0FEoytJz7hfkPJjn4OM7veva9G9wK8ngqJGO8VXvSYXR2O+uETJwgHgsXoFGPEsqLEDES0qtsGZWVfUV+OZToN3hmLcD9879yNPfTJOKavctErpAiwwosuHPwqPTxDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762796957; c=relaxed/simple;
	bh=O98arH5WjcI5ZayKxsmOANfoxY47t5wDmB6i5QtbFzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZETzqSYdUYRpKIQYDPodSdS0L2+VNQP3zfZRyQXNgxTuVGOkTSzockUg8YtwFIph4XdwUkJv7mZmCUIVdUPd4i8/oNFDD25KMn1jHJc36a19DdTe1GCREh9vpBRjzkIQ5XbKxRiyDG0TMTRo9ME0yEugsmP+4GE1XUIHJYZywdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hs9HQeVN; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hs9HQeVN"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88245cc8c92so12433406d6.0
        for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 09:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762796954; x=1763401754; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BPbi2NPPrBKl69IkN7kcBKOxfNw5kLfKkjmbVe2fGbs=;
        b=hs9HQeVNEYzId4DP0DFGK8VquNoeV7uVRZ7AHmlsztBihVhFueLo+MvyStqWXpM0np
         t7e9o4cAuDiKfm0RepM+XagyfoiJstoe9rcoUpzrxeqNpxl2yQQpSezvjA/peeR7t1+H
         Z90X2Ob9pHan0cuML0ZE6RBsKM3OndE7pFqELN3MfieVzJZyo+lBeO2saaXpOhmWIPel
         OqdYJ62c3RqGcBPQ+GKAJweRGkt/tOcwJabmqfHhK/UvZx7YOmwWqopJjAG5C7XGzX53
         /ZpVOVDblnkWO0wAxRqWRrdqg/MIvphk8Ndf7ItkLHcj461nKp1XgCifnm6excFJzWWn
         E15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762796954; x=1763401754;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPbi2NPPrBKl69IkN7kcBKOxfNw5kLfKkjmbVe2fGbs=;
        b=mXr5n2+TVU/EKijbDKxRXRruHwLQP9fGPH+9YGaaRMM9phk4wID56DHcQoF/lU13wi
         TfU6dFStXO6p79fqWVMLbwHjgPBZottmizHALek0KY0ERerGKV70RDrh7LgBdMVkTCS/
         4mmX5BDArM3dP5n6l+khytVSoK3a389VE/G4EuD3LmkLig+q2CRzxaS68zkhuxqXcAxU
         a2DkhFehsmGAYGwQPGjGpA+EHMecdFOVscgnoxU7GfO9DFCVndXv+c70nG8zenIXor80
         P9CZDKZ0vXQI2z9I4utYlTCRpW3FOmF2lxGh4aIJpLh+9Q/mazpeyYJkJnnA5Qx9KKhF
         O22w==
X-Forwarded-Encrypted: i=1; AJvYcCXaS7eX6youGWP4/fK4Tt9cmQKJ/NR1OjlXLo7xY11t3LS5hrofzhuz4PgFfKMaWvlS7CIj@lists.linux.dev
X-Gm-Message-State: AOJu0YxG6KvrCVoNS5nMoyTgsmzkaoC3x57ldiEonUSXeXhAKg+eqTNl
	bcllF/eWYuJalcA+pUKyD+HIgrk0pFHxRdsqOZo4RHrVF2bURpl+7WFtLau0vp/mAehrjqLu8du
	FDWB8VkiMrwZ0SDpTKyNFI+LIv7YYPEUkFUz6Ns7g
X-Gm-Gg: ASbGncsjPVG2HyidobiIdI1mSYTJVbjxNCHQ5RysPwcXcpOv77s/QFv6UmiwMpwUZxR
	F/rYXTlF/x2g0I3ikDFaN/yfPOef7uxC1wwy7/MUe0CHy3a2mnamwJWvTB61jvqT5a9fY3SGMea
	r8fERpARQwnWIRBVHHWiq2r+DsdjRDTa6TRW0kYF8I8Nnurh3zQf1fmPFa8vEuW0wsoifAx/+Yc
	NWGMbiyq8omoalEPR7jNAzxPF6UuB6HH6esWw07HLoNjs6ny8xVHjTG5fYWtbHM0/BCrfsXgHcr
	/TwXDRys7+0Tlxqi/spLoKNNpQ==
X-Google-Smtp-Source: AGHT+IHaNRtCNWgUYc5RPhLYoD+nULNJ4nH9LNtSZkCbb+Nk0d7DtvBVzdaKV0/uL+kFEgmffI/ryLd+1MDzyV+BJT4=
X-Received: by 2002:a05:6214:1cc2:b0:880:4bde:e0cb with SMTP id
 6a1803df08f44-882385de9demr131074376d6.29.1762796952867; Mon, 10 Nov 2025
 09:49:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <0ca5d46e292e5074c119c7c58e6ec9901fb0ed73.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <0ca5d46e292e5074c119c7c58e6ec9901fb0ed73.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 10 Nov 2025 18:48:35 +0100
X-Gm-Features: AWmQ_bkJUSMUoO8onDW_Kv00mrjnva_voIrMRMQdowErjlplIdY_Q4t-6BqV8ig
Message-ID: <CAG_fn=W033hGM7_jnj0irwW0gc6McLw2nbhfZROWfieqKTxVdQ@mail.gmail.com>
Subject: Re: [PATCH v6 14/18] x86: Minimal SLAB alignment
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

> diff --git a/arch/x86/include/asm/cache.h b/arch/x86/include/asm/cache.h
> index 69404eae9983..3232583b5487 100644
> --- a/arch/x86/include/asm/cache.h
> +++ b/arch/x86/include/asm/cache.h
> @@ -21,4 +21,8 @@
>  #endif
>  #endif
>
> +#ifdef CONFIG_KASAN_SW_TAGS
> +#define ARCH_SLAB_MINALIGN (1ULL << KASAN_SHADOW_SCALE_SHIFT)

I don't think linux/linkage.h (the only header included here) defines
KASAN_SHADOW_SCALE_SHIFT, does it?
