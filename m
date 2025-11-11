Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B1B2586E8
	for <llvm@lists.linux.dev>; Tue, 11 Nov 2025 09:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762851700; cv=none; b=SAtXDXXtg145x9jy9ncdJZoPZEjQYRcMqpqLVpDXD6RiZleSCHPKZmVYbFBsGRivKjNzbyszY2bzDJplpoL8GXcEjrAH4JxUAPPsefkq9eC1AWt4m73HdVEDBMa3QEGrt7ZczLJV0YI7V9XzDA30rdtjRoGVUfDpRxC/RLZuZWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762851700; c=relaxed/simple;
	bh=LQ/YVcrasx9+XZH+uzfM5+gmHZwPvR4UMJFJLgRCMmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GTWLstIig1w4coD73xY41LigByRwRNRxrAB1t1/jL8/kguPdNnW1y7dncQlIUMghoIlAFBvAtLE2dL4Pkw4zOl5D6OiLziXYchNR5JMkgFMvqpdQqcJ4tUW7gYwMaR6E92DwSkHQg5u6h7rJYHlDVVAkvz+xSTgo127p2ZHMCiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3vCg467W; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3vCg467W"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8824ce98111so25179276d6.0
        for <llvm@lists.linux.dev>; Tue, 11 Nov 2025 01:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762851697; x=1763456497; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3GiAAjmzQ/VspCqloDpIt+ugCtvSToogOEL/VpV0Ws=;
        b=3vCg467Wx6qTXWdtnTKXR6PJUEwiCuHUlwY1mizppRULmqZqslreiPRH6SlQ8DvurT
         5bFxbFXEEgGbBo+Z5Pri1oP/yVOuvuE1hmisjIVJYukkh6QNsQzjLLiSXtdRH8wishxD
         fFtDKGBJ8Gc6GkB29JxOwb+PdzfQMVmb9rsPDV/P+uHT6agGYQOA+KPnbZ9Khh17x0hg
         UL888Sy5nppbXizYW5qbeKV/FEw5s+8CI6dsqBqwQcPyKUILd08WgTj0cPo8ngToOPVp
         Lk3suRRTgZQ1pA3wJ70iTacFARN3F5vLJKsDgaCMQPlsX1T+R6vvBFevFbGwEFjsLbxR
         S3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762851697; x=1763456497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s3GiAAjmzQ/VspCqloDpIt+ugCtvSToogOEL/VpV0Ws=;
        b=OQdvXpJGcJEuRLmbw2Jcu+Enp9OhE6Zb0GssgJy/rX4ON6yPwk7zfFCEvQgk1QdtsY
         0tv+c9fpBteH/PQP2BkaPyr01eXgLWk21xCROd0iUyw0HIDjUDARRjq9zplD+39KMGV6
         O9D/r1VoJv1TnXVOECX2MfQ8ZXKKdKa5dhk2WvjxC45qYQWxKqAqW+hv6qQEgh5A5bWu
         gbgjlVq17EZ2CeKARQrgcmW83DNDdI3NvkHx+C1ohwkNI5gYx93o3kAjg8H3CE1QwklF
         iBL5+oSgh9rfZloj3LUnRfQ4r4htEuse3UU7fW95NrF54CRquxGrzfiahciyprM9+mQv
         l7eA==
X-Forwarded-Encrypted: i=1; AJvYcCWumK2tInizA3HfOOykKhebKq/NHm+9nanwq4SpdgWHa8VTllaNmgJviWnYnagXJcU4jvrc@lists.linux.dev
X-Gm-Message-State: AOJu0YxIY0u8PpQDOiWKdLB6wstbw7hcLmhCsL8dCFYnKkI4PD21dLjV
	WmmDaptdV10WXTaOtMwqN020x13KrQTACxF3onymAgsRF6Wqkq2PLAnRuy2w0ajF7ah0bOw9IDJ
	AQSjJ6FOWnNXsxZ0vA5ECFOePn66Yoe8yRj5jDZgn
X-Gm-Gg: ASbGnctrtKPpwMl3mktGwTk2fs4jtAwxWkTMhgYq/R+f0QfFHa8Ra7kDcQOvJGLh/uO
	C8tZG6VFhAfu4wRBJODAq8DFNaFB/2K4KLjR6sryrgzNbYROXW2j4m4dlffesE0ofdR+u7REkQQ
	h57iZPksDhtP+ivOcmMc1zATZT/Oki/3Jx76T8Dck5ayWlHhAaW3e9NbOEJJLfwpUshdXrrlBpb
	uSC3MaQtY4othcoExldtyzMFBrrkH21diFvMj7P19iJ05cNLVXpgwNL5QFRoSGwt0oCw5l/pK2A
	SXk6HOKn/REzGEFcOoB8h5OCVFLEWPpj47/F
X-Google-Smtp-Source: AGHT+IHmbNWz4nrBYzIA6dULAnEplmbnkhIWWkrftwGIkZuDmlgOtFs93CqEkgKXIfWxtOJB7Fa7kj8HnLkgxuZShy0=
X-Received: by 2002:ad4:5f07:0:b0:880:42a7:7730 with SMTP id
 6a1803df08f44-88238731aaamr156015206d6.53.1762851696507; Tue, 11 Nov 2025
 01:01:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <d98f04754c3f37f153493c13966c1e02852f551d.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <d98f04754c3f37f153493c13966c1e02852f551d.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 10:00:59 +0100
X-Gm-Features: AWmQ_bku8cq-CFmbh2Cbwbizm47o3PsCv7pQitKRdKmveqfrADnJlpnymR3GFhA
Message-ID: <CAG_fn=WPQZ4ti3Lb+A3jSXFWLtn6291sTKJBwKBiLD2E9YbuKA@mail.gmail.com>
Subject: Re: [PATCH v6 18/18] x86/kasan: Make software tag-based kasan available
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

On Wed, Oct 29, 2025 at 9:11=E2=80=AFPM Maciej Wieczor-Retman
<m.wieczorretman@pm.me> wrote:
>
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>

> -   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN sh=
adow memory
> +   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN sh=
adow memory (generic mode)
> +   fffff40000000000 |   -8    TB | fffffbffffffffff |    8 TB | KASAN sh=
adow memory (software tag-based mode)
>    __________________|____________|__________________|_________|_________=
___________________________________________________


> +   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN sh=
adow memory (generic mode)
> +   ffeffc0000000000 |   -6    PB | fffffbffffffffff |    4 PB | KASAN sh=
adow memory (software tag-based mode)
>    __________________|____________|__________________|_________|_________=
___________________________________________________

> +       default 0xeffffc0000000000 if KASAN_SW_TAGS
>         default 0xdffffc0000000000

Please elaborate in the patch description how these values were picked.
