Received: from mail-yw1-f194.google.com (mail-yw1-f194.google.com [209.85.128.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887FE1A725A
	for <llvm@lists.linux.dev>; Thu,  6 Mar 2025 08:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741251161; cv=none; b=OfFPRoyLztAbS6GabTXbixI1XB+s7L52Zay8Xs1HqVmMz7MWqlVaombPzVBaSTFvikwLfJRPor7EsQoRqZXH1r8D1f4OCo7XxPjmDB+AkO8WFmY6094QuiZ+xQpuFKisKBpwR+4Ytzj11UMKtqFXAEu3ve28h0nDhBiVRisGlHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741251161; c=relaxed/simple;
	bh=XXs8uZWN9WWnGCHphGrfM+z/OKcBjkW6AX8J7E+t69Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nvWLY5dgc4v0EKiA4C0lVkR/6N00tWO9qOTVlp/SuUlo6DmYh2VwZyBd2mUG8smMFksk1f2HMDf8CNNSybkPjNeLjZJcstoIHMI59nin+VopCXeZM3FEIJUYt668ENrHPmMVXyGWi7+621HjOEuzYs/LcQI3unY/tji+TATz/54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ioyJ/FOR; arc=none smtp.client-ip=209.85.128.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ioyJ/FOR"
Received: by mail-yw1-f194.google.com with SMTP id 00721157ae682-6ef7c9e9592so3532537b3.1
        for <llvm@lists.linux.dev>; Thu, 06 Mar 2025 00:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741251158; x=1741855958; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXs8uZWN9WWnGCHphGrfM+z/OKcBjkW6AX8J7E+t69Y=;
        b=ioyJ/FORUngFq7DIJOILNTd/juevMgvRlvt6e7at22aAc5ok66cu6IO8KD8y2J+D5C
         3GRN95ZlPmiDBWyf2Jr+/BE/Sgch3kJsygE20NoQJBF7Ix9bL+nmmPFzLLp8DrPvzSWn
         4NsM1Xdc3/y+9wWVIUZpaY++T7x4CQnw/HR8ycSsiX9gEdGNtfjFhD+utDxKGzw8GrtY
         84XhxvQfHbiJctsuYGqD2XeaDGqpdVJ7pNImWWgRPN0RiDu7X4uiIAvAt5UWV04UmVlA
         MUjrf+GAqNhxjvlGgtWJwfgiq3HxeYEJ47nXrNy0v3moP7AfymNIaqlbgSbRDmWntNji
         5cQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741251158; x=1741855958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXs8uZWN9WWnGCHphGrfM+z/OKcBjkW6AX8J7E+t69Y=;
        b=f/Ob8L+ZNmt4gxAXC94SUZg6iifCVPU44Qo+bjasotJ6La3q6CN6h2FkvUMUc2Sz/0
         E0c8i3nfGnU8ilXbyfTetgIKCuEPEE3DZ5uxaBCNrSIccHufIC90+nESuZ1tCBQ+nfw4
         cBLlHB/3+Oa7gCDryzf7oUSnM6j3Stkvh1b4dcRhQINWpOuJVa6QH1oOvozEMZSklgde
         nGzy/RVTVUEuTPGswhwMx4dZZLarO3efrVoeX4g86oEs4tMq7nbfKLEju24Ls21PSRXz
         oLcfLyCQYPIPjLH8t4C6biupcRhSxyuhD4lkd4sF2h1bVnIr3W8svopTFPJWQHokIkFf
         JfPw==
X-Forwarded-Encrypted: i=1; AJvYcCVshpP7QPP+RtrfQW/Gl4ztU8dyxv7/PVxXfQEfP/eoGhQR3NTy1f5h+zLWXLBNKM/05LzC@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0p1YHbwE9Qktx6q7AX9UJqjv6J91n4vfSGqNBpChRb2tX6KLe
	ZV1ZCegDsZvPouQmTpJcCgZzIEmFxj9gs8oypb/yGR9qEV7qrzQ+0gHkIGBs+eMO2fiLkB4lROh
	6Yv6ybLD1TttQ33gZKcSaTqV+hSg=
X-Gm-Gg: ASbGncsLZXDKZ+cfuif5tL973O+THsViZ08w0pnBf707wqydpHyNblmlVL/qznheYB+
	bWTEIO2aNuhA23DG0dl9Q1DGZi2MdIPltiXmf5WcJO35toKhjxm0v/HrKIjl5CZFAjnvpiJjC35
	CNytZ+8CT6Y2x+UkKOCU6Z7hjr1g==
X-Google-Smtp-Source: AGHT+IHUPHaw0YZdo+mDMRAkSmdnWIm6D16Vg79ihR5A4Mv8LJil7rF/h/OfZk/ywEv5+Ey8+JWj4dl2X5zMiVr1zBQ=
X-Received: by 2002:a05:690c:2b03:b0:6fe:b88e:4d82 with SMTP id
 00721157ae682-6feb88e57c7mr3700567b3.28.1741251158459; Thu, 06 Mar 2025
 00:52:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250303132837.498938-1-dongml2@chinatelecom.cn>
 <20250303132837.498938-2-dongml2@chinatelecom.cn> <20250303165454.GB11590@noisy.programming.kicks-ass.net>
 <CADxym3aVtKx_mh7aZyZfk27gEiA_TX6VSAvtK+YDNBtuk_HigA@mail.gmail.com>
 <20250304053853.GA7099@noisy.programming.kicks-ass.net> <20250304061635.GA29480@noisy.programming.kicks-ass.net>
 <CADxym3bS_6jpGC3vLAAyD20GsR+QZofQw0_GgKT8nN3c-HqG-g@mail.gmail.com>
 <20250304094220.GC11590@noisy.programming.kicks-ass.net> <6F9EF5C3-4CAE-4C5E-B70E-F73462AC7CA0@zytor.com>
 <CADxym3busXZKtX=+FY_xnYw7e1CKp5AiHSasZGjVJTdeCZao-g@mail.gmail.com>
 <20250305100306.4685333a@gandalf.local.home> <CADxym3ZB_eQny=-aO4AwrHiwT264NXitdKwjRUYrnGJ2tH=Qwg@mail.gmail.com>
 <CAADnVQJ0_+Hij=kf9eVPX_ZND=2=uDHaYPWvv1x-WmR5sZRSmA@mail.gmail.com>
In-Reply-To: <CAADnVQJ0_+Hij=kf9eVPX_ZND=2=uDHaYPWvv1x-WmR5sZRSmA@mail.gmail.com>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Thu, 6 Mar 2025 16:50:58 +0800
X-Gm-Features: AQ5f1JpgFvunO0OQTqf93RDkyeUwF-IllYoHkeBCNOU1pNT2c-N8DSTxA6mOAMI
Message-ID: <CADxym3YMeAPpc+ozM2E7yW1qpB_arKJiDyAcRs8pW8sRqJZOZw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] x86/ibt: factor out cfi and fineibt offset
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eddy Z <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Jiri Olsa <jolsa@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, dongml2@chinatelecom.cn, 
	Andrew Morton <akpm@linux-foundation.org>, Rik van Riel <riel@surriel.com>, 
	Mike Rapoport <rppt@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	linux-trace-kernel <linux-trace-kernel@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 11:39=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Wed, Mar 5, 2025 at 6:59=E2=80=AFPM Menglong Dong <menglong8.dong@gmai=
l.com> wrote:
> >
> > I'm not sure if it works. However, indirect call is also used
> > in function graph, so we still have better performance. Isn't it?
> >
> > Let me have a look at the code of the function graph first :/
>
> Menglong,
>
> Function graph infra isn't going to help.
> "call foo" isn't a problem either.
>
> But we have to step back.
> per-function metadata is an optimization and feels like
> we're doing a premature optimization here without collecting
> performance numbers first.
>
> Let's implement multi-fentry with generic get_metadata_by_ip() first.
> get_metadata_by_ip() will be a hashtable in such a case and
> then we can compare its performance when it's implemented as
> a direct lookup from ip-4 (this patch) vs hash table
> (that does 'ip' to 'metadata' lookup).

Hi, Alexei

You are right, I should do such a performance comparison.

>
> If/when we decide to do this per-function metadata we can also
> punt to generic hashtable for cfi, IBT, FineIBT, etc configs.
> When mitigations are enabled the performance suffers anyway,
> so hashtable lookup vs direct ip-4 lookup won't make much difference.
> So we can enable per-function metadata only on non-mitigation configs
> when FUNCTION_ALIGNMENT=3D16.
> There will be some number of bytes available before every function
> and if we can tell gcc/llvm to leave at least 5 bytes there
> the growth of vmlinux .text will be within a noise.

Sounds great! It's so different to make the per-function metadata
work in all the cases. Especially, we can't implement it in arm64
if CFI_CLANG is enabled. And the fallbacking to the hash table makes
it much easier in these cases.

>
> So let's figure out the design of multi-fenty first with a hashtable
> for metadata and decide next steps afterwards.

Ok, I'll develop a version for fentry multi-link with both hashtable
and function metadata, and do some performance testing. Thank
you for your advice :/

Thanks!
Menglong Dong
