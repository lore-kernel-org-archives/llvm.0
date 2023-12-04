Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0750930F9D
	for <llvm@lists.linux.dev>; Mon,  4 Dec 2023 19:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cGfT4WQ6"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6d87cf8a297so864781a34.2
        for <llvm@lists.linux.dev>; Mon, 04 Dec 2023 11:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701717520; x=1702322320; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWNzZv699g9WmaMge8Xt2XGWr8M2fBvBoGU1E608xn8=;
        b=cGfT4WQ674tg+Hkuv08LF7EwtzxcmMqZANopT4/UFthpXIMGGX8M/4pxpCFyYP05HY
         WntXQioAbx29IEr4nfiMuU2QpKPcjkY2gHZC9vf/28eA4Q6ViD2vqrxoZhqGmlaL98Zv
         mif8F7cIKYLHp8b2Ap8BRP7B3mtC33R4NHIRGinzPk6slyap7JC9H/Ugp0lXUfV6OfP4
         1FFrfYa67NEtaZCEx4HnDPLIaHbIq7jx0PLf+PgSy+eXiaZcS07evddmXavuocwDhi50
         TPoE4UU+IwrYOpHOwjxsOsJnRTLWQbTZ5hyDW4nHi+uliaHJPggc8vJUk2OK8ky/qkBD
         HVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701717520; x=1702322320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWNzZv699g9WmaMge8Xt2XGWr8M2fBvBoGU1E608xn8=;
        b=l81WMXmXPBABOrnfs/Jz5FYgcS6i1TZA4nsmxIa4zLGXfBfeUj83c59RkI77VHrSCb
         Qedbn76FJuVUcWrS6MQQ9YgHbsF8zvogAg7/U9i/oZ4T3V3n04i4tORRNxyH8Dm4Ys0F
         inJSGl8O3Pg3lHCLpZcr3Ma7t58400n7GkPokq0wQ9CPmyRjdSVZgS3WG4TYhVSNgPS8
         5VUkAYCPFkPpHHYW61I1A6bDBqmkBhv605B5OuUzFl+Eteod2EWOFOVHvACoaLwBOMBF
         0vAKo7qM44yVPfHURVHBXe2+gSdqmElaj047u+GPCMCeS2me7yuRxzNUA0HDYcUuMqvz
         LH2w==
X-Gm-Message-State: AOJu0Yy4lkXz1pgPBDzrYbYr6JDuxt6ts9vXXOQ75XvGeqmKY8yCGsvo
	+QeDZq8Fw4RvFmmw04wxN1JOSpSrWgWhh9P7BzNjdw==
X-Google-Smtp-Source: AGHT+IHyqGlUNEc09zfk+7C7spFR2KrAlLytNjHQMZMVaTcBh0jkMo0aAva0Taxeji7L30FkvzDde4ybRx0p4piiiZw=
X-Received: by 2002:a9d:4d02:0:b0:6d8:75a8:8455 with SMTP id
 n2-20020a9d4d02000000b006d875a88455mr2668679otf.50.1701717519644; Mon, 04 Dec
 2023 11:18:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231130133630.192490507@infradead.org> <20231130134204.026354676@infradead.org>
In-Reply-To: <20231130134204.026354676@infradead.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 4 Dec 2023 11:18:03 -0800
Message-ID: <CABCJKufv1z0-+an7iws8J2v-c_Jg1Nfu47Um9rhCnVLxQfC6ug@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] cfi: Flip headers
To: Peter Zijlstra <peterz@infradead.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	davem@davemloft.net, dsahern@kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@google.com, haoluo@google.com, jolsa@kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, keescook@chromium.org, nathan@kernel.org, 
	ndesaulniers@google.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org, 
	linux-arch@vger.kernel.org, llvm@lists.linux.dev, jpoimboe@kernel.org, 
	joao@overdrivepizza.com, mark.rutland@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 5:43=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> Normal include order is that linux/foo.h should include asm/foo.h, CFI ha=
s it
> the wrong way around.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  arch/riscv/include/asm/cfi.h |    3 ++-
>  arch/riscv/kernel/cfi.c      |    2 +-
>  arch/x86/include/asm/cfi.h   |    3 ++-
>  arch/x86/kernel/cfi.c        |    4 ++--
>  include/asm-generic/Kbuild   |    1 +
>  include/asm-generic/cfi.h    |    5 +++++
>  include/linux/cfi.h          |    1 +
>  7 files changed, 14 insertions(+), 5 deletions(-)

Looks good to me, thanks!

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
