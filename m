Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8287B257831
	for <llvm@lists.linux.dev>; Tue, 11 Nov 2025 09:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762853513; cv=none; b=fKe6wTg4x9hOIzKSaIC2pMwE3OpoOSQr5TqDOtoYuu5RRljN557Omw3ldjXuzZjzsoIQwVa89cWr91TbY//Mx+MhvgNUkmaKMIzLsz2YK1/fWzKIQf1N453jP5k35NGLzvTENpb5QBxr3YMP+LUlSQU8KwlsCx293/1Wv3OG0zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762853513; c=relaxed/simple;
	bh=r+hEOA78AhLgodINgHVsRcE9W9flQIP3sthYAhVWiZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=liMZP9XTzc7gmrptomzJ+q0b6r13wHMNQjU5lkwsBGKWxPM4NQEu0nKFeYNhfZ3Db9aGLMqTm49gIljz55BWop++cBL4Lkn4ROIU2XKJfs12lfXARTV6PBPrCk27pZ/VFv0zZXMioA6KUsCnXyhI7lZyf6BsvsBU3NFi4cnG8e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QAQGvhpo; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QAQGvhpo"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ed9c19248bso32560281cf.1
        for <llvm@lists.linux.dev>; Tue, 11 Nov 2025 01:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762853510; x=1763458310; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mcuXePJv9UMRmDbNyzI2WPi4AQ0WM2JROyTQZuxeHnI=;
        b=QAQGvhpolI7U5nt4AVAuKIkO0j6+W6Ha4LF1PpkwsUCclZ6ROh0qY1D5yfiO0GNZPG
         uKYI3dCGypuJqOi1BxgnsgaHtvjpmwhFAbdh2BPMG6aVA/+Rg/oKY67z/bct+uEROg/i
         rM7BfUyF2NVOWG1wMmdpHfeDR/nam83afT/4B+IqgOKxdoBEz+1T5L0OJwcDsDudBknP
         71WSjzWPRGv4Zg/+SjZSwsdzwQpIt37pRH2bWbBnDWd8UsaVlpki3muYtu5ieP8uXmKk
         s06RwEcdhVh0t5HY7FtXvHHBfc6Qc25GvAtKj94ZZ0tWNLaO+qIBFL0bPgyYwEluMQyA
         kTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762853510; x=1763458310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mcuXePJv9UMRmDbNyzI2WPi4AQ0WM2JROyTQZuxeHnI=;
        b=BaOtEB7+mTEJRx2CWw+sz17BUoGYVFVCB8DmxFTPKpb3YsRDwuXeFTgGLr1tk37UmN
         RxHjHaaPHTOkXSO+Izjxx5gwX+GYlHbsIOMwiA72w6fXYV4YV78+CPPPtD9PJskQ2cca
         4x2Y510YDd2wARt5MwOBrlLz1n2mlZOzaizekkR7r/Qv/S/j4Eh3rwr1UdGorvjqTQEb
         XJfYEH1uua/EO5+M7K5+EmaliIoF7iyZ1+zXdmHVI5e8J24QOkqe9vB/UfTKQC0iFFse
         uFZ8WZQ+mOKHLYonV3wiIQVcsbQFzxrtpGdhjN8tRDOefO/BBaOhkyds8RrbffizQKL0
         nuOg==
X-Forwarded-Encrypted: i=1; AJvYcCXevzL3AuvOFia0fNFuvA7msJXD/05+C6VawSGYh6pxk2UiOvvNZn/CtH6JAjG2UbW2iTx7@lists.linux.dev
X-Gm-Message-State: AOJu0YzacIwbIlR75kx/FI/05oAcKWsv4VNhTsKje5EgmGGNFHd9dvDq
	JkQdzvS9spwiWYHDvKdL7DAdYas8QX/EFiIoGMMSx8ASrpHZI0Z5yvP8xM1dIGu1iifVnPCSD7W
	pnqOB8GEL5zMqTDS9q1HkbpQHCq8qbz6Y2jhJxvdD
X-Gm-Gg: ASbGncv2WIuZ+TNRaiK7O8BRdmGEILF3UERw8wOMAezBVfwIK5rRN9dPFHYrlwe0viE
	IlMDsbTTL1yYxMb0LU3qZ4bJMO40Cke94wifumlar7OqBXhsUNk0zyZq3xOPt4Y/KVRbUlSGlat
	m/kBWnD3PZfC/eLsB1ktO+oW9ibjUNJtbVQro144DC/dnZWBvtajnA2NndCtnW0X2q7BWa9pYsz
	IioxdxDp8lqMSk+kMW/nWswvISNNFB0wfYi/YXnikIH5lvYOvVD2qe0cH9iHVeYfqxoBZHIXaXW
	AqJkG7pngYA/jyZmuZE3U415E6JuVOvTkMmC
X-Google-Smtp-Source: AGHT+IEzr91NsU9OUC24gjDEzFi/WJBgPa8H1cJUF2UmeUnuLOth+gagFxzFFCqIthcpMbxe1OUruDtNQIgW1/7rFEY=
X-Received: by 2002:a05:622a:2c1:b0:4ed:6d2c:dbf2 with SMTP id
 d75a77b69052e-4eda4edae35mr142374501cf.32.1762853509963; Tue, 11 Nov 2025
 01:31:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <5be986faa12ed1176889c3ba25852c42674305f4.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <5be986faa12ed1176889c3ba25852c42674305f4.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 10:31:13 +0100
X-Gm-Features: AWmQ_bnBejbyt9xhMGcc96j04H3RtNf27KB78uQcmIocgSxJqcCqkGPoQwhXWUQ
Message-ID: <CAG_fn=XFXFAvKS2+bc66FR+gw7rfSybETAOBUR_vneaVdF5F9A@mail.gmail.com>
Subject: Re: [PATCH v6 06/18] x86/kasan: Add arch specific kasan functions
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

> +#ifdef CONFIG_64BIT
> +static inline void *__tag_set(const void *__addr, u8 tag)
> +{
> +       u64 addr = (u64)__addr;
> +
> +       addr &= ~__tag_shifted(KASAN_TAG_MASK);

KASAN_TAG_MASK is only defined in Patch 07, does this patch compile?
