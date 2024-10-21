Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9221E2309
	for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 21:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729545155; cv=none; b=heKHC6nhRNQAR7igndD1wm705ozMM0zJw6Z+98iVbzf0Tf7gam7sDjuqcx2xNGpRY/AadNMgmHjRHppsB/7sjyUr5PtNdtHzhkZBK7N6TKUXB+WAA3xZCb82/hXU5+EFEMsHsy2VJevkmTZkowTV9g/NnLzciGV8aKKthQ8fkw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729545155; c=relaxed/simple;
	bh=vT8uNYu+6v08jfCmB1LZB7EQjXInFV7mAuG4Z1WlmKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gJEVA36DPOozujD2R+H7dLBSBQTXRDNRtlgDuDrwykBMZqQtpJplDIFP13OZilexp7Tj78B5CnZTDavReW8EVkoNj/dEbGXYko6cD1WerTkS6ZkIL7ky95DnCtQbOLqbPozwcPE8rh9iMdD3wz1ZlygpZjj6GDN6GBhDfo+8LxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n8pCtxXK; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n8pCtxXK"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-460a8d1a9b7so42731cf.1
        for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 14:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729545152; x=1730149952; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9SgtYJ7ruMEHetOUIPlHgPbj24nHZho9hMlB1OIKsU=;
        b=n8pCtxXKtBaPzVGj6cK6YlX6CNSUimGTFMygFGB4AsC3sEeRvZB7IXtdKn+cMbgSvC
         C1YRb8r74Z5KCWu3kXQt/G6hCgLF69/BCpVax18RIHOL+Ku5YUBLqT5MN7VLzzUuKGDX
         R2hvme9rljbkV0P4HR1XaB29MHsy8y5W09kcRlPmReynEcUzNHb5y6WOHhJd8YYeX4+U
         k4VJtdNzRsCAjFNjuYvpu3+7OVfE0ptxai4z4cCKMbN3+Sd/UaiJiQ8WvvcScXsOmfiN
         X73w93V05VWOZFVMoX/01EI9UFQwqBytqTRl3VUw9Xr0S6nUuYO1OPexbg3aeLvWP1VM
         STwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729545152; x=1730149952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9SgtYJ7ruMEHetOUIPlHgPbj24nHZho9hMlB1OIKsU=;
        b=XTHOwy9zYp6btqzjuX+UpAG2HphBST7qAFfB5R9DEAm+ScorDPqoth+dsdGuOOVlFR
         oURsrbaOD9ptU3TMlyAtaN78CYW+JgwdvFFJ3GY0X1bIW+/yZL3+GRMeq3QqkdXJITGt
         AcvS7PIIhHD5RwzfQkMoO1+saUV/j5LptK6Y0fR3YPQWzjSmUM9/Y5fXsLZR6VAY0FNU
         UZSTt/W+HWt4xjKvTGSVnZ9nGE425cAggWZ1iDu+jD48lgmKh/cq5vsmQDLXkVWIAp68
         OOEU1zShyUpddLBRhPnOIiODtt4BQFy7okk1dI0Nsq4jcUROySwFDm/d6iYFMD5O5VID
         /0hw==
X-Forwarded-Encrypted: i=1; AJvYcCUa4nhxXRbPcR0R6udkzBEmUHKKjfineMzs5j3sDHq/0oLNzII/CdhrPCwLtz6XK9/kn4dg@lists.linux.dev
X-Gm-Message-State: AOJu0YxU6tZHt2T+W3Euv+Z1ERLWWk+urI1sVjkYkCSzL0BBK/ChpFo+
	meY+1qu0KxCAe2BGUTXhtfThn8BbuOcGOPMZvricx8K/E6GE//qoaLhXrFjV29T73FbrbF5TATA
	8SoMz4bXGhgU+FZnZj49DQSH9aZ1UBy7+qQun
X-Google-Smtp-Source: AGHT+IGzo2TISqKT3Jl9CfeQZcohbh2s1lnUXzilu8k+T0K2sU2TWbK8wa3xZAwv92x9q/+t8oEme9GGEjWaFA3FT2U=
X-Received: by 2002:a05:622a:4b08:b0:460:afbd:4101 with SMTP id
 d75a77b69052e-46100a7fcd1mr1133581cf.4.1729545151682; Mon, 21 Oct 2024
 14:12:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241014213342.1480681-1-xur@google.com> <CAF1bQ=SQ9rFdwRk_waQvn4PW7x6T1uJmJ8qNqj04oRKmujkCQw@mail.gmail.com>
 <20241020032523.GA3652325@thelio-3990X>
In-Reply-To: <20241020032523.GA3652325@thelio-3990X>
From: Rong Xu <xur@google.com>
Date: Mon, 21 Oct 2024 14:12:19 -0700
Message-ID: <CAF1bQ=QYnC+0EREWcp1-NXCtCC6KqJf7k0LRxqaTY7fxWSOZ8A@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] Add AutoFDO and Propeller support for Clang build
To: Nathan Chancellor <nathan@kernel.org>, Stephane Eranian <eranian@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, Yabin Cui <yabinc@google.com>, x86@kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 19, 2024 at 8:25=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Rong,
>
> On Fri, Oct 18, 2024 at 11:20:02PM -0700, Rong Xu wrote:
> > Thanks to all for the feedback and suggestions! We are ready to make an=
y further
> > changes needed. Is there anything else we can address for this patch?
>
> I will reply in a separate thread for visibility but I think one of the
> biggest open questions at the moment is trying to find someone to
> shepherd this code into mainline.
>
> > Also, we know it's not easy to test this patch, but if anyone has had a=
 chance
> > to try building AutoFDO/Propeller kernels with it, we'd really apprecia=
te your
> > input here. Any confirmation that it works as expected would be very he=
lpful.
>
> I went to take this series for a spin in a virtual machine first as a
> smoke test before attempting to boot on bare metal. This was done on a
> server with an Intel Xeon Gold 6314U. The kernel booted fine but when I
> went to run the command to generate the perf data from the
> documentation, I get an error.
>
>   $ perf record -e BR_INST_RETIRED.NEAR_TAKEN:k -a -N -b -c 500009 -o /tm=
p/perf.data -- make -j$(nproc) O=3Dout mrproper defconfig all
>   Error:
>   BR_INST_RETIRED.NEAR_TAKEN:k: PMU Hardware or event type doesn't suppor=
t branch stack sampling.
>
> Do you know if this is expected for a virtual machine setup? I will
> attempt to test the series on real hardware here soon, it is currently
> tied up with investigating a regression in -next at the moment.

We have never tested this patch in a KVM setup.

As far as we know, LBR support in KVM is currently limited, and varies
depending on the PMU virtualization model:
(1) For legacy mode, LBR profiling might work under LBR virtualization
(VLBR). However, we have not tested this.
(2) For the new "Mediated vPMU passthru' mode, there is no LBR
virtualization support at this point. So LBR profiling is not working.

I've included Stephance here. He should have more expertise on this topic.

>
> Cheers,
> Nathan
