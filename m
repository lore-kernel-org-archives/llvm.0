Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A5E330322
	for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 16:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792859; cv=none; b=Y8pCEta9sheS26FlOUb9uw1EzUxDekFrYqZ8I5nah2Xc/3S0rhSO15dBXRGgK7naLSUbxXMdFVihjnoCKeDbizIHsDUSEifRknJ/DDvfG+01km942rKcAxQLAG44WYlUKGmyyXLEEBCjk7Cu08pqr10psp5RaLzFiSF5lrT+KrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792859; c=relaxed/simple;
	bh=Nn93pG9GTk907Z5oYvQqtvL4mNR0sTn6esBD4Jp2XFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rCRJEPM8j8RUmupZgw9bGw/gGINAoM3z+fFIvL3RmiVEdZULMPXbvMQGj0O1mTAEvIbz+GbylGGKWE+wl9YjcYoWeyDV/O6xTKjCm28JTczoUynDA+RJvip1w0Cbm5p1pnnXivo6M2m/fJiTu8HlV/UaZBlakxxrjRjXt5YL+no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uvaA+U06; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uvaA+U06"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4b109c6b9fcso25508231cf.3
        for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 08:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762792857; x=1763397657; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ARP0s0P8t6lHLXGPK7oqG4hn2hPk4JBv7/AQ4HrLq7Y=;
        b=uvaA+U06WG/qgJo4hkuF4JDkGmXB2qcV8Cyab/iYtxphyEIiRjQpHaJ4IFJSB2GKY0
         tEfTCbYLQI1dgfSvGKohXMKcRJ+IDbUWWh0VmOrDQe6rOZqeHkkz9q4JqTR43wjorMWS
         Qt4Bn37gAut1WmgYPQEM51Y0Ta5pKWtUMuD0AxoU049F4gavt7Jtg6Hlb90EtLrKUceO
         Fyx5lZ5Jx7hFI0AEzGZRlEHQubDa9ANWjEwJONpqPgYGvX7fUpcTiVcFW+p4GLDMcsJu
         ImaUmNaBeuyX9e/6AaUS8JEVzsrbh6ajHHeJCKabSzDj+gJGxWaPcVMR50RaqIVxPjzy
         ysMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792857; x=1763397657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARP0s0P8t6lHLXGPK7oqG4hn2hPk4JBv7/AQ4HrLq7Y=;
        b=RB1u905iDjCA+zo9F3eZKFacFgvFUpz9WJrwAK+5AsEHxgje1+II5GNK1ANpBLLT3H
         YCukbVB0MMVE/lXcKm0PG52mMYjqbgE/p0Pr1omR6y8dWpGdKCrJ/DdjpR4VPMHWuTwt
         8hMbVHWWxdXW/70c4OGLuTOYX34nHpqxC8mU0qle3XfDp2FmJiIPdKHThjpoVTrrCdCw
         yBISCKzSR+yG1OwcMYH894zn/PGUBdalMIbrKc2P/LeF2oR3zKxUzdVTcezJMG1T/Ow/
         BUR0C+lednqE2XNNB20wLz+ef81zWxUe6q/+pBDsPMcIb11P+G5nV9bGE4/5618hatW7
         cv/A==
X-Forwarded-Encrypted: i=1; AJvYcCWh87OKAtFm2blOHd3bziaYzyjEWbiAkidpYsEhh45NwNsbK8QuRp+43FeOK0O9+JtQXKZS@lists.linux.dev
X-Gm-Message-State: AOJu0YwW8YmxbXdG5e1FWtQBe/jqXapTRSzjd7aNVC2tQWFWDVFvXWSx
	v10ovP8XGFefjm14H7PqDwjkIFzGG07gbAuTv58yRmgqICDjf9HKCFkF2bQKPKeOmJ7fllpAiMX
	N/KVQaxp64JDe5FOFELonbvFwm0j0xfMmfzGkdU+f
X-Gm-Gg: ASbGnctL5An5Eu1rTlPyHeITlTiFUbH+Koae/Rlm7oKmjiM3t2HcL6ySi7ipI0iUAq7
	V5g7vQknjziAlsqAa8gsehIO3CtTalUR4GLBE4uEpojq5asPaVDq6Hyjq2JtjwqpbcN5yo1AghL
	Nv73CmcP8yYsI/NRLJ6f9/cp3HVivcLTtkwZqJwChBwI9qGWpVr0Ok/LbwjOOd3kqM/Paqh9Cns
	RmVNyzW3HpHStITrcjRgz5lH2T/2XgpvG4SHAp2Ai5m2JECTTdYYvye4DG3FQ6d4gr58EOcGcjk
	NikQN1Y5jI6DxGzVa/PVzeEFBg==
X-Google-Smtp-Source: AGHT+IFXtIVYv/1akorIwGTU2TyeYWKo/ZKjasuLxC+KldJLVH++s5nwoozhcb1g1AswN8A4ZgMNuJJXiz33fQE7EOA=
X-Received: by 2002:ac8:5d05:0:b0:4e8:aa15:c96d with SMTP id
 d75a77b69052e-4eda4fec971mr97364671cf.55.1762792856275; Mon, 10 Nov 2025
 08:40:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <932121edc75be8e2038d64ecb4853df2e2b258df.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <932121edc75be8e2038d64ecb4853df2e2b258df.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 10 Nov 2025 17:40:19 +0100
X-Gm-Features: AWmQ_bmi0ifqdxD1pRga8rXt1izLseEvw-FOTscdlGLXMffgSbt_R_kuG7tm2tc
Message-ID: <CAG_fn=V6pbNdN3w0Jr5rCL=M27-bOBt4AK8rB7UvvwT=3g4m7g@mail.gmail.com>
Subject: Re: [PATCH v6 02/18] kasan: Unpoison vms[area] addresses with a
 common tag
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
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, stable@vger.kernel.org, 
	Baoquan He <bhe@redhat.com>
Content-Type: text/plain; charset="UTF-8"

>  void __kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms)
>  {
>         int area;
>
>         for (area = 0 ; area < nr_vms ; area++) {
>                 kasan_poison(vms[area]->addr, vms[area]->size,
> -                            arch_kasan_get_tag(vms[area]->addr), false);
> +                            arch_kasan_get_tag(vms[0]->addr), false);
> +               arch_kasan_set_tag(vms[area]->addr, arch_kasan_get_tag(vms[0]->addr));

Like set_tag(), arch_kasan_set_tag() does not set the tag value in
place, so this line is a no-op.
