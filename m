Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D4EEEB5
	for <llvm@lists.linux.dev>; Thu, 11 Apr 2024 17:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712857669; cv=none; b=XgbAocyqklPg8K58z9y8lCB4lRMXSFotRb+xzJCDTeTGswKEQFFx9Btys+/9HZ1aU1UdsSLsgYGt3z4U2K3uRku3ZfqwdwFXTSPRT/PqRr7ychbQ4XqxJoZqQw14nCuLA4VmuSamb4ASbIonhezJ6T83Bk+KIuct4JGd//jkNQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712857669; c=relaxed/simple;
	bh=AYwphHubVdavW2q2CfHWSzZcTri349qYwqL0Kaxp6vY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XzAAGeU6OtSw1If2HrjCJ01Ziu94/V6GGZtA+cbcIKICP4FL5Hk7KZAFb4NmUl42rJ/SFRWp6SdRwN5db0eq4vnQCPdCS6iiqd3VYNZdn1XHqqWs6lpdKuZOvW7mVpQ9XsMCvvRg6qpRGkpZRLhTPLFImcnI1mESjchBCDqBei4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TW8C+9se; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TW8C+9se"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-479dc603962so32771137.2
        for <llvm@lists.linux.dev>; Thu, 11 Apr 2024 10:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712857667; x=1713462467; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYwphHubVdavW2q2CfHWSzZcTri349qYwqL0Kaxp6vY=;
        b=TW8C+9seACQy/ecZ6HGbZXno+wUSIOyNRMgbKKNS+xxMli5O5JWU0Hrcx/jqBN0hgI
         /haraPTmwZblSsV02hvScg9nThewj2O9hpIup/baJ9Q85R7bo167LYogR2DrSAwMcKp7
         D6TK1cypIofjDP4qkbCCtSfqltjx3+kvDdVxamhuzOv1niM3+qvdxFriNE0y+/x5zKeH
         naqHWC6Pm1PMX806M3W57eYPII45wDwWgDlv95CYnaqP6/ZCX+MXAC4BGgfRv5nt7xSz
         y90hhfi/5RXEidSM7gzWdGvHC0S104g1i5K7om699iCMZH7GLROywIf37ceEY3zaAR0k
         h60A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712857667; x=1713462467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AYwphHubVdavW2q2CfHWSzZcTri349qYwqL0Kaxp6vY=;
        b=H4O/YWmIfJPzFHjvnednZ6ItaMtwa6+ylaDaMgPuHhCclAJfAJHOg6lREjN+ymVRYF
         0jke9miQN92gfd23BT2/y27PoGgUOMju7o4xWTDllWcPPtSHa0pZV8KfN1d8dRSA1hVD
         QRXZkKrkkPM+nnM2FdvQdC6cDhpRiEOU5nEHTB6ExBlEhZvUhLyZ3iHbCoRfW8OEB6lD
         wSc7VdNyExXX/h21pj7bEGwabiSBe/jT1jhn/iAVcGYwpO+nFI4GMliz45HWTiemnk0U
         cv9eZ1OKmrMftcnX8QJd5/p2jSRjXsEG5bTl1cOHgRCHqOKkuufGGRIaBX+DwtS795aX
         qA3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3Cp4k6L3ehF3ejTlAb8CdmgryVVxozc8iK9AldxrVWy5Uj1Qx4JIZWzDOXJXu74isghTh/MqHdsOimuKHRfVArlmQ3w==
X-Gm-Message-State: AOJu0YznMPHOtOTU3W/iQcR4iuE9r0Qd7PgOSNziKT/1gp1vSIJkT8Xx
	JFDEY3xtysqxrVwoYTuNfTVLxkqv3jq7a2vwB7gpI38S80No6kt0cDLFc0H19C/P50gZygbsGsX
	seFLvDuAki1SyuuHu20HIDAEVsfh+UkIuIIRm
X-Google-Smtp-Source: AGHT+IEcPz+Jddb5/PFC6lnKGjEsh2a3jiEmNwqQxtj0rCsJztkrgOcBLcF0ZJvnbjJt+hL/suTSINeXHC36kW/M7Qw=
X-Received: by 2002:a05:6102:38cb:b0:47a:3da5:e5b1 with SMTP id
 k11-20020a05610238cb00b0047a3da5e5b1mr605945vst.27.1712857666585; Thu, 11 Apr
 2024 10:47:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240409061043.3269676-1-debug@rivosinc.com> <20240409061043.3269676-9-debug@rivosinc.com>
 <CABCJKud622jAHZGiYed-2veynA6rd_=1mnTwnTT1WNQ6203q6A@mail.gmail.com> <ZhgeRA3XplDw7kmm@debug.ba.rivosinc.com>
In-Reply-To: <ZhgeRA3XplDw7kmm@debug.ba.rivosinc.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 11 Apr 2024 17:47:10 +0000
Message-ID: <CABCJKufbEN-iO+nAQFw46Qe61HmfTfMALfz9o=EvmiAFY8+19Q@mail.gmail.com>
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

On Thu, Apr 11, 2024 at 5:30=E2=80=AFPM Deepak Gupta <debug@rivosinc.com> w=
rote:
>
> On Thu, Apr 11, 2024 at 05:05:38PM +0000, Sami Tolvanen wrote:
> >Hi Deepak,
> >
> >Thanks for the patches!
> >
> >On Tue, Apr 9, 2024 at 6:12=E2=80=AFAM Deepak Gupta <debug@rivosinc.com>=
 wrote:
> >>
> >> Adding support for dynamic shadow call stack on riscv. zicfiss ISA ext=
n.
> >> enables protection for shadow stack against stray writes. This patch
> >> enables scs_* macros to use zicfiss shadow stack pointer (CSR_SSP) ins=
tead
> >> of relying on `gp`.
> >
> >CONFIG_DYNAMIC_SCS implies that runtime patching is used to select
> >between software SCS and an alternative hardware implementation (in
> >arm64's case, PAC instead of hardware shadow stacks). I understand
> >this series is still an RFC, but I didn't see runtime patching
> >support. Are you planning on implementing this later?
>
> Since I didn't see any example on selecting PAC when `CONFIG_DYNAMIC_SCS`
> is selected. So I had that confusion but wasn't sure. I thought of doing =
it
> but I don't know how to binary rewrite all the functions. It might be too=
 much.
> So I went ahead with using `CONFIG_DYNAMIC_SCS` in this RFC series.
>
> Question:
> If arm64 were to use PAC with CONFIG_DYNAMIC_SCS, how would it fixup the =
code
> sequences already setup by compiler for shadow stack push and pop in runt=
ime?
> You expect this to be some offline process using some object editing tool=
 or
> a runtime decision?

We use unwind tables for locating instructions to patch, look for
UNWIND_PATCH_PAC_INTO_SCS. The actual patching code is in
arch/arm64/kernel/pi/patch-scs.c. I suspect this is going to be a bit
trickier when patching between two shadow stack options though.

> >If there's no plan to actually patch between Zicfiss and SCS at
> >runtime, CONFIG_DYNAMIC_SCS doesn't seem like the appropriate choice
> >and we might need a separate config option that still allows you to
> >reuse most of the software SCS code.
>
> I wanted to avoid "#ifdef RISCV_SPECIFIC_HW_SHSTK" in arch agnostic scs c=
ode.
> And that's why went with CONFIG_DYNAMIC_SCS which sets dynamic static key=
 once.
> And then I use `is_dynamic` everywhere else in arch agnostic scs code.

We could define arch_ functions for any architecture-specific code
(with a weak default implementation), and maybe add a config option
for specifying which way the shadow stack grows?

Sami
