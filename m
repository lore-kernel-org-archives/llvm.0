Received: from mail-yw1-f196.google.com (mail-yw1-f196.google.com [209.85.128.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6B02AE8C
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 02:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741054141; cv=none; b=cMV8GOV8I4Basgi0etEg2CHJ+Pb0GGZo1JLL+zN0j7tVywfhfhYmXyUf4I2yqAeBigYq8XEV62daajfOG/3uYspjECkBS0hKyoPfoccGJnmO6oD9cglyI/sFn9jIa1lS8Vp1vAWh9vj98IrOfCqSdn2+wt8yr1xWqat2ESq/zWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741054141; c=relaxed/simple;
	bh=CMTlN2042F1cPygssJ1pVpNt6nZSTMZWYy14BylY0bg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SqjnS2VxhdgMdPiYLCRlgHYKgyI+QYWkXoy57NtCAgkRLqPh48vU8xnA7ZXfmK8WXWCboZgZvE9i+0fRduyQi3B/ID4mGvW+mDuIRtF1GUQgoSCi1dgUikTV3/7578w6Eunb2/VA8g64Ppwk4AQi3islRzHidd/IXSgMzrSazvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNErQceC; arc=none smtp.client-ip=209.85.128.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNErQceC"
Received: by mail-yw1-f196.google.com with SMTP id 00721157ae682-6ef9b8b4f13so43866557b3.2
        for <llvm@lists.linux.dev>; Mon, 03 Mar 2025 18:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741054139; x=1741658939; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uprm3w7QSLW+3a1cofYW+cceQk8H3e14YKGxf9c5SEc=;
        b=TNErQceChZxwV1nUAHs2uUQx6+XcVvxXVgrtHRfgNaq8xnaRy7dtOo+2941VIGXzz0
         kNYdp2+PwEx7OLippZMbEotdQC9tOMAg7V4IouP6B53Em+HdRnTBgumfKJJkP3K8t56z
         ueLdjih4gcABPrT02kePZQ+G6G7Dx0jA2mAvcTnqdaCpqmgBGLLIEFOYAzGBIfm7ANuH
         JD3No9BljS6KsFQ2bG+ZJzVKmDOtff1YkfT092gBe/XyZFhHK3Xhp4NL8R0qlLShjDEd
         6NYg4K9af2wpJFTCgcjY2PIPtviP8VNu/IMWXXhUCDBGgOqYe4zZTN1ahiMeZCzVwZq+
         BOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741054139; x=1741658939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uprm3w7QSLW+3a1cofYW+cceQk8H3e14YKGxf9c5SEc=;
        b=OmiIEGJYMl9SmqhaKhn/SQEin2eum8Oo40b4a5+lREciogtH63m/TB0Zn7EKGWFLJx
         76rzpu67e7YmE15+3n1vZQ4ElIywXC+8jnZ+TwAMMHo3TNrCqpWpAuPU1l6yL2FNOaxY
         z2+RoFydQMacx2O+9nCDJEZTh51oqg0/ld17HZ9vQGcuf+1+Eau6Atk7c/gBLXQH97uB
         5cYZ7uyM6YCRRmf4y+pFn8vnL3RFXOoqH9Q28l0fXTE+VG0na0aH4YmUToUsKg9WpAXA
         +1+7GdFGomgUm22u7IkFzohp8za3Qz7Wf0J8TQC2DnUEjeKQO8+XJjoy0dlWPvPjINC2
         1CNw==
X-Forwarded-Encrypted: i=1; AJvYcCUzVoCvRX2B9xyXBPS/UMMmRLSp3wAV5xAlN/nv3k/9NyA/+9kyA9OblW0JVjD2TRt6G7uN@lists.linux.dev
X-Gm-Message-State: AOJu0Yw83PbmjOzGsycXEF/U9d8vyfktrESEE2gxtz75JaREfHs07eYn
	EdYJEt1kTNIkEfv/ZnnauaNPS5Rc/Lb5yCvrPr9J/OIWqDViWqLH5JltXd6W5x+SjJvURintHmp
	hnr41Q3vb2b6FBh7j+7GXw7rf100=
X-Gm-Gg: ASbGncvoJe/FEAtYE1ql9jsFnM1u0hinoP4MIYLoDeyMDBManl7VVD5wB9haMI0uQpv
	1XHez1P/AOdNCL3zBoh9UZJf4K11qXLPWAL4I8qpaWFnVabGVnqpOxDAGoQ5LiC4V3w11SuexBF
	Qjwq73djEO0fAJndfgMGcxXQ5vGg==
X-Google-Smtp-Source: AGHT+IGNh2K54VaqDxAbwZPq6ghZwf/0d9iTd28qnutLtwuc/n0G9myX7k8yUwefwHhFhOUKlgvRS6Iy3hX/wt2iX1c=
X-Received: by 2002:a05:690c:3506:b0:6ef:6fef:4cb6 with SMTP id
 00721157ae682-6fd49ea038fmr219227267b3.0.1741054138974; Mon, 03 Mar 2025
 18:08:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250303065345.229298-1-dongml2@chinatelecom.cn>
 <20250303065345.229298-4-dongml2@chinatelecom.cn> <20250303110559.5a584602@gandalf.local.home>
In-Reply-To: <20250303110559.5a584602@gandalf.local.home>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Tue, 4 Mar 2025 10:07:22 +0800
X-Gm-Features: AQ5f1JqbmerWbAPhQH3CompG0G6GUmmcqJsAR9G321CVuef2yZdxRX3kR81QiyY
Message-ID: <CADxym3ZJf3TEMwCy4JVT1gs9GP=U1n1qss3ycnuMZVyp9TfDdw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 3/4] x86: implement per-function metadata
 storage for x86
To: Steven Rostedt <rostedt@goodmis.org>
Cc: peterz@infradead.org, mark.rutland@arm.com, alexei.starovoitov@gmail.com, 
	catalin.marinas@arm.com, will@kernel.org, mhiramat@kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, yonghong.song@linux.dev, john.fastabend@gmail.com, 
	kpsingh@kernel.org, sdf@fomichev.me, jolsa@kernel.org, davem@davemloft.net, 
	dsahern@kernel.org, mathieu.desnoyers@efficios.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, samitolvanen@google.com, 
	kees@kernel.org, dongml2@chinatelecom.cn, akpm@linux-foundation.org, 
	riel@surriel.com, rppt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 12:05=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Mon,  3 Mar 2025 14:53:44 +0800
> Menglong Dong <menglong8.dong@gmail.com> wrote:
>
> > In the third case, we make the kernel function 32 bytes aligned, and th=
ere
> > will be 32 bytes padding before the functions. According to my testing,
> > the text size didn't increase on this case, which is weird.
> >
> > With 16-bytes padding:
> >
> > -rwxr-xr-x 1 401190688  x86-dev/vmlinux*
> > -rw-r--r-- 1    251068  x86-dev/vmlinux.a
> > -rw-r--r-- 1 851892992  x86-dev/vmlinux.o
> > -rw-r--r-- 1  12395008  x86-dev/arch/x86/boot/bzImage
> >
> > With 32-bytes padding:
> >
> > -rwxr-xr-x 1 401318128 x86-dev/vmlinux*
> > -rw-r--r-- 1    251154 x86-dev/vmlinux.a
> > -rw-r--r-- 1 853636704 x86-dev/vmlinux.o
> > -rw-r--r-- 1  12509696 x86-dev/arch/x86/boot/bzImage
>
> Use the "size" command to see the differences in sizes and not the file s=
ize.
>
> $ size vmlinux
>    text    data     bss     dec     hex filename
> 36892658        9798658 16982016        63673332        3cb93f4 vmlinux

Great! It seems that the way I tested has something wrong. I'll
compare the text size with "size" command later.

Thanks!
Menglong Dong

>
> -- Steve
