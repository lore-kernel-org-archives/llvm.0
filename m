Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EE21DB557
	for <llvm@lists.linux.dev>; Thu, 11 Apr 2024 17:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712855179; cv=none; b=fmFu+RiiZCC9IkJ1XPvQip4LCI4NlcYXs6gyne7C1tQENwnbFEj41GsQCBL1rDDgCA1aFggfDHP0IFJjG9tp1h3nTcQipvctOc+PK/6Oq9Xq5wqq25ZD5tb/fNsrC0kwnGV0amTvYrBmYVS8oWaxIDWQttLC0surph2YicmZzFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712855179; c=relaxed/simple;
	bh=lts7IF4O3wh+oACzNnyW3TMbFIhfWZAEPaIt7vwWKBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HLoMydyfZcFsj7mpEfa/YgfOb0vez2Awo31DhZSdPMzTX7nppazXsE2AYPdNY6NlvMLrFm7vj0d9vVBtFap5ewi/0ts+gHHZk9S9m/+oKERKv5VELaFQbrxSMMhMgcb5PlDJxagbkdQADUj4o/fsxaQfEGfmbCAWYPxwUqjQOb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fU1xI6iu; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fU1xI6iu"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-222a9eae9a7so49052fac.3
        for <llvm@lists.linux.dev>; Thu, 11 Apr 2024 10:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712855177; x=1713459977; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lts7IF4O3wh+oACzNnyW3TMbFIhfWZAEPaIt7vwWKBA=;
        b=fU1xI6iuVQcCJHkYoMVDlY8nSav9Ea8ATSLuRdpUnkzCElA2xTeZ0c/+27wxUs4/y9
         WBR3FJWT/enrsdXDR63kd6NARnLMfoFHVnpmdEeiO/LJVtScJTZZ/edCiQnfabt0+KNH
         HlTJ09nzirBpBMPcOk/49mpLcgLF/2duvzrUxFrZgUYHZg8LHA60BPp5HHZS+mWX1Ial
         TNKA7K+iFHavnPoz1TrfWtOI0opbPyDGqEmRf30ntLr5Z7dvtobeu4bkZg6xP5AhOCpK
         H1Y1DFZPfJ4BYoFuI6dggdhHZf1X4uyoj7O6th0PitB30n75prXa9zoN1XaFeinrK19I
         fb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712855177; x=1713459977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lts7IF4O3wh+oACzNnyW3TMbFIhfWZAEPaIt7vwWKBA=;
        b=NVojpcZyn9Z9umnQ3f+4I/h1L6dpYWTuxZZX6ytBST4f1HbZiHCqOqfVOPJhogN7lG
         6+U2ENviiaNaDeZYzcpdrTtw91zfIX4E1qexzBISmNYZukcxm30tr472gkxRfzvJmcce
         glsw3/qVZ+jkiAOhW2pvlwr0v/6zvnCGlwO+/K8BdXWrN2TbRx2dHciNhR4Q7j2C/cvi
         67RxO7X3BAMLXrXvJgQnBUF592IIeD2lXXgjZn/2/Pc6wpSW+7/Ccz9JuZTUV6qa34xa
         OM7Hm4bFU9fWQKqI6CZz2hAnQK/EpO99TGQhbE6lP0Hc/noDOSiC4t2oDOqC3M1Dmwnm
         uInA==
X-Forwarded-Encrypted: i=1; AJvYcCW8njqXS0NN+jkIOad8u4lqPQP7rCq2s411CL5Po4ryRJql02eJ3YrZcDRXiKBIB+nqFIGOJMkCho+PT7vRQyW41zIKvg==
X-Gm-Message-State: AOJu0YwiTNeNDRO5n1cBx0cG+4uHcySoQqoMaa8QK1NGScenZ+hv2cwV
	rrRBRCE/kTEwC1ffU2oZVhgJc02xhV/qe0kaOoUDCGpM3k11nctXN32ubM7B9HmUWAyo+eck4u6
	220mV7wYppyaVFr/MNSPoOs7c2BEhaPbZ4fDN
X-Google-Smtp-Source: AGHT+IFxZAwM5lscGOOxViCGPaFGQ6+rp1WtH1LHvLtTGxM3d+4WQ+OijdKn8+T80A2LN6pU7d0HQjw/vH20HZ1YHlY=
X-Received: by 2002:a05:6871:203:b0:232:fa6d:c5bf with SMTP id
 t3-20020a056871020300b00232fa6dc5bfmr89066oad.45.1712855176417; Thu, 11 Apr
 2024 10:06:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240409061043.3269676-1-debug@rivosinc.com> <20240409061043.3269676-9-debug@rivosinc.com>
In-Reply-To: <20240409061043.3269676-9-debug@rivosinc.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 11 Apr 2024 17:05:38 +0000
Message-ID: <CABCJKud622jAHZGiYed-2veynA6rd_=1mnTwnTT1WNQ6203q6A@mail.gmail.com>
Subject: Re: [RFC PATCH 08/12] riscv: dynamic (zicfiss) shadow call stack support
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
	paulmck@kernel.org, broonie@kernel.org, rick.p.edgecombe@intel.com, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Deepak,

Thanks for the patches!

On Tue, Apr 9, 2024 at 6:12=E2=80=AFAM Deepak Gupta <debug@rivosinc.com> wr=
ote:
>
> Adding support for dynamic shadow call stack on riscv. zicfiss ISA extn.
> enables protection for shadow stack against stray writes. This patch
> enables scs_* macros to use zicfiss shadow stack pointer (CSR_SSP) instea=
d
> of relying on `gp`.

CONFIG_DYNAMIC_SCS implies that runtime patching is used to select
between software SCS and an alternative hardware implementation (in
arm64's case, PAC instead of hardware shadow stacks). I understand
this series is still an RFC, but I didn't see runtime patching
support. Are you planning on implementing this later?

If there's no plan to actually patch between Zicfiss and SCS at
runtime, CONFIG_DYNAMIC_SCS doesn't seem like the appropriate choice
and we might need a separate config option that still allows you to
reuse most of the software SCS code.

Sami
