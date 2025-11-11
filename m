Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6ED277C86
	for <llvm@lists.linux.dev>; Tue, 11 Nov 2025 09:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852997; cv=none; b=FXzgP5+8mqtbXeTd8Cdy0+h/5l9AH8NhGPmeQLFbLSBwWoSFbPmIO+CaYRIDXMnq2VJ3ABr4WN2+9U0bVMnsdnrkjDCxxjN20eYz1lMSiWyVuUNLevG3w0Z43szi7JLZcNnNdxptm7OR7G1DTITvDze98xmnoZZlq1BqSQjXPNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852997; c=relaxed/simple;
	bh=HW+BHIjHuyTX7OAC9AGqEECbSB0U1bNiaGYXhX8ud1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ED+lKgcBY6HJlfEw7TipKGSgPnMpt9AHQ04boYMDPbcUgz9RqLnDzs9S5DGekWNh1iodOuC1DnmDgsuj5aIqcYmVdYcegmI1XTdqptCtzeIVIwy5n/tV+awfWmSAzSLvVOLdB6685k2yADu2YffV17DgoCAryvlr8xfzfG+MLjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZXTB8sJR; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZXTB8sJR"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8823e39c581so33186736d6.3
        for <llvm@lists.linux.dev>; Tue, 11 Nov 2025 01:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762852995; x=1763457795; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HW+BHIjHuyTX7OAC9AGqEECbSB0U1bNiaGYXhX8ud1c=;
        b=ZXTB8sJRmqcTg3e5DRWXBjGKAYRGYu7Zsn1B/RRBX/2ulb6qaC7tT474MjddyCbNPm
         xP8eFD9P5jr0xqLtp5s3KfSoLNz8xWG/S3NXUBiavA7yJ3vgYzmJaS8XEV/AfYJCm7ux
         /LHgSojqN0XvlnUl7Q2t+jb1bwSFIrK9IwhqbCYuQUQyX+TvKIdVCswjDE3LtKLDVIgM
         EzmvZcDs2pw3LDm/yFdbNi3DYmTgT9QQ73YNFjwMJ3Z1TWPBnpGKGmVgK3ylHofdzjlg
         sfMsf76j86w5b/uJ9YkcshhBtnJOAOoan3rUo7ycnDfLOwm467AjLrTT8tqvZhOxcMqK
         1ngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762852995; x=1763457795;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HW+BHIjHuyTX7OAC9AGqEECbSB0U1bNiaGYXhX8ud1c=;
        b=w4Fu90dcD3b6cp3Q7GG34Ozp3yndRSXzjT6h1b2hnw9vry5xo/NWjUAzYKdzUDxxny
         fgb7FlrwHzwV2MXisTxA7cEH7/VaVtMeYEjiXLwDkM5Jt4FzrS4fRpuknce45SivwyPu
         tIDzvgAYulp2LXsy5K4ydBGknb7oBBW/TUiKeTYwqafdQs6aX/j4OIynUFB/KWTxbDfG
         tfrL2LOm63cMIaN/zSPx44CyFnLcsS/2bj2SOLea/PjWzHFrig55OofBgd9lucxilkSh
         xACC90wtUDVeFb0D/MHxWcq2gr67pv9DUx1w/PrPfdQZkRk+uHoU4QzXN+p0UbGfq3yj
         gR0w==
X-Forwarded-Encrypted: i=1; AJvYcCXO1CcTeb80kqJXDuAXs1ULlSsR2Hu3QXPqZZ7yAE4npMPsTNn53/7u7SXz8ZkVC61+93AM@lists.linux.dev
X-Gm-Message-State: AOJu0YyQJcehpy3TIKlampJqhFOCAejKyoviafR7BbZj4+C5aVooTKm+
	kSf7BJlkkNDhUu22P5+TUjyRyY931tGuMWLAz9BEEHClg1Ep3X8tv9NHZQbo7yF0ZvVfFxsL2ru
	59bto81F/LcBPfuk82JdnihIkt3zyDHsnkjVRGD8/
X-Gm-Gg: ASbGncsb2BFS8jY4Ix3+8qUlXJPY3wNPaVVfk0TkTZKVC2jJJAojJ7rMaiTLwHw3Qnp
	aOU6Rsp4yoo+QczWM5ERSDo4+joW+OHhT579xyva7BSpOZA1uRd82bUFudVn7XYnx532ImdO5x1
	hpwbcWnKVwT+F0+Kp4ym2GKzehaN6/SkDaGL+KvM85/YRQBvGgDcebTeHWSS0Hz3JriruP2i5Fi
	QLvif8Uxc2glfakd8tbHUqyvhtlX7D6zaZUkhLTP2U2yUPSSICyh8izg29M3IodlBr/zER3MrWs
	Nb7qaiX2wLTU1vtCSQSXzfvILg==
X-Google-Smtp-Source: AGHT+IE0yzs57LETS85djEZyTYXW5DmddvlcMHLtxP59+D7EFGLVQ5m9xCUc4smiAAZV+t8Cn2za8HGBMs1SjTj1Y9o=
X-Received: by 2002:a05:6214:1310:b0:880:3e92:3d33 with SMTP id
 6a1803df08f44-8823873d584mr174202246d6.34.1762852994390; Tue, 11 Nov 2025
 01:23:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <8681ee6683b1c65a1d5d65f21c66e63378806ba0.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <8681ee6683b1c65a1d5d65f21c66e63378806ba0.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 10:22:37 +0100
X-Gm-Features: AWmQ_bn-gtNt_PIr26xFMqgMDiPlRCOzgcJVubPfw4RNrG4hXg8UIUOVQ0zkb_Q
Message-ID: <CAG_fn=V46UeEvrPb01VRk+60-wL0DA6Y6ZD5HAfVLzHcgRh+VQ@mail.gmail.com>
Subject: Re: [PATCH v6 05/18] kasan: Fix inline mode for x86 tag-based mode
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

>
> Explicitly zero out hwasan-instrument-with-calls when enabling inline
> mode in tag-based KASAN.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
Reviewed-by: Alexander Potapenko <glider@google.com>
