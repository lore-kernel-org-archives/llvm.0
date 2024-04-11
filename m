Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974E341A91
	for <llvm@lists.linux.dev>; Thu, 11 Apr 2024 18:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712860451; cv=none; b=BY0K5l13/gr0OMU9bCanlxyxOXqtHqkgQpm6gYT2mAKPhB3M7EqwtWb4omCm5KYo0lCug8rgl6hRN7hs9PG0PJ0chVgdcy4D5AXYofEjw6GipSaWQ4vl/eb83wA5dPnleY+4gevWhgU62GAXACPriL3ozM+rx2x+xMIqx4sr8nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712860451; c=relaxed/simple;
	bh=stMEsNBdhDZHN0AAsq6vgx6+Ts1oyq4oANVAhdK9098=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fBQjwlA0RF68rvHuyQncbq/LsWunle8Fmy/4Q/6WM6sAhSmlUJkN9PyOEiIW7ulfKLMLW35sdbB0rtCIqQzPMkDC0+GuSteCWrnggxqss2aWkNLhbh2Qc1JIpOA4X0joJ0WhMKaELo8xVN0zcmOtGTzClDxlXLw9pG0TNNHYSZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vYKo03GB; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vYKo03GB"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-47a21267aa8so50914137.3
        for <llvm@lists.linux.dev>; Thu, 11 Apr 2024 11:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712860449; x=1713465249; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stMEsNBdhDZHN0AAsq6vgx6+Ts1oyq4oANVAhdK9098=;
        b=vYKo03GBVQWyyoj1rvPLOzUiPx1Bd3LaMGjxSw9G99jPoRfg3nB07d72tgkIIZfxcI
         R09e7LFLQp41U/IHWYaFjtGj3YFanuSJx7U38bPDWwyS2VYnnDm2jjA0RyXqxr1FLcL3
         NS9sv5JV/Kg1l+W6VFHaizygHyorXxhgDUmPRdKj/n5iIaEIJg6zdsYbwOGS+plfVz0C
         PTw3iuX4HSuJxDQkaDZgTciaYZJCz7NGiYjvmTk13uPTwD1l2MXYnJv1Ic2ey5bfBCUL
         YAlTX0DO55f5JYAdtqQJfz2ev7NtjE7YVKDhiCTsGJz/qnx+zBgVA//GrPCXn/q/qIez
         keXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712860449; x=1713465249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=stMEsNBdhDZHN0AAsq6vgx6+Ts1oyq4oANVAhdK9098=;
        b=NXc5GDp/AdDcwYzK+6TUdhpySi1T7sfbQbkxerW7IdHOQcUv8EeIis/uhkA9hWCUil
         yu3FWbXm2onYi1co9MQyyYEqgopWnjfFVHn54Cgy5h+tJfLaEJc6tAhGiSKNYa7G2DQO
         Dp/XVFRqnfJUJS/MSyfW6dlcyjs6xXkJKd/Vv5qcR4Jhto6N/q4MVYINRz7PgSbR2L0m
         hlJyhlJdk94QZ98pi06812WFSKxtNW6/EkmGDMrwTYJ/kqwBsaThuNLPv+ga6ziJ0hJB
         sCdtVzAp3SXIOrFVdWBTxZOEK6+s1acVBdO8hBRmCXppIpABL5fiGjSj9lFCFS9VObhy
         tZTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGy4fF5z7A2NOQPYJaJS4hQ5cmamT34NhpxGIL0a3dDjofsTJN4sYNqgLfTf0sao0gE7jmZCGi8iIVVIIJ/4f1w5G7Ug==
X-Gm-Message-State: AOJu0YxQbuO1Ui/FO+EtPK5Sbs5N9Oz6Z4Wbnm1h63EEBfr/tAn5SYlE
	xKP0/gjEvDr7JrEOmhJ73zZ+bMerDZTkaGJOqkggIjLmd+mmIj4oaw5/1j8N+PVg17AvyTbP13t
	pJexCiWLcQTaevGqFU3eDR74L6leY3U8W93ki
X-Google-Smtp-Source: AGHT+IFfuK5+fQsC0QczQeo6WuoykTwpS5Kk4PpmnlC1hN0dL/Pi0+fTSQq1O1Njt6aog/wFbvvhl3lV/7VPrJZJ6bQ=
X-Received: by 2002:a05:6102:b08:b0:47a:36b9:160b with SMTP id
 b8-20020a0561020b0800b0047a36b9160bmr819522vst.16.1712860449222; Thu, 11 Apr
 2024 11:34:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240409061043.3269676-1-debug@rivosinc.com> <20240409061043.3269676-3-debug@rivosinc.com>
 <CABCJKuee-6GGDDjvByCkikR02gka2BNhwRVBw6UAwEcmSQposQ@mail.gmail.com> <ZhgjoyObf+nMihA4@debug.ba.rivosinc.com>
In-Reply-To: <ZhgjoyObf+nMihA4@debug.ba.rivosinc.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 11 Apr 2024 18:33:33 +0000
Message-ID: <CABCJKuf5Jg5g3FVpU22vNUo4UituPEM7QwvcVP8YWrvSPK+onA@mail.gmail.com>
Subject: Re: [RFC PATCH 02/12] riscv: add landing pad for asm routines.
To: Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, andy.chiu@sifive.com, 
	hankuan.chen@sifive.com, guoren@kernel.org, greentime.hu@sifive.com, 
	cleger@rivosinc.com, apatel@ventanamicro.com, ajones@ventanamicro.com, 
	conor.dooley@microchip.com, mchitale@ventanamicro.com, 
	dbarboza@ventanamicro.com, waylingii@gmail.com, sameo@rivosinc.com, 
	alexghiti@rivosinc.com, akpm@linux-foundation.org, shikemeng@huaweicloud.com, 
	rppt@kernel.org, charlie@rivosinc.com, xiao.w.wang@intel.com, 
	willy@infradead.org, jszhang@kernel.org, leobras@redhat.com, 
	songshuaishuai@tinylab.org, haxel@fzi.de, samuel.holland@sifive.com, 
	namcaov@gmail.com, bjorn@rivosinc.com, cuiyunhui@bytedance.com, 
	wangkefeng.wang@huawei.com, falcon@tinylab.org, viro@zeniv.linux.org.uk, 
	bhe@redhat.com, chenjiahao16@huawei.com, hca@linux.ibm.com, arnd@arndb.de, 
	kent.overstreet@linux.dev, boqun.feng@gmail.com, oleg@redhat.com, 
	paulmck@kernel.org, broonie@kernel.org, rick.p.edgecombe@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 5:53=E2=80=AFPM Deepak Gupta <debug@rivosinc.com> w=
rote:
>
> In principle, I agree it should converge with software based kcfi scheme
> as much as possible. However blocker that I see is `hash` is placed just
> before function. This breaks for code mapped as execute only scenarios.
> And ideally would like to have immediates at callsites instead of loads
> (purely perf reason and not security).

I'm not saying the schemes have to be compatible, just that it would
be great to avoid reinventing type annotations etc. For example, when
you implement the fine-grained variant, you could simply override
SYM_TYPED_ENTRY (defined in include/linux/cfi_types.h) to move
__CFI_TYPE inside the function, and then redefine __CFI_TYPE to emit a
landing pad with the correct label. This allows SYM_TYPED_* in
assembly code to work with both KCFI and fine-grained Zicfilp. For the
coarse-grained variant, your current macros are perfectly fine.

> But yes in next version, I'll take a look and try to converge as much as
> possible.

Great, sounds good!

Sami
