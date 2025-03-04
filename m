Received: from mail-yw1-f194.google.com (mail-yw1-f194.google.com [209.85.128.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B143D172767
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 03:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741057714; cv=none; b=Mi0YRjcY6ALTTnsxvJ++6LKq6viasre8aVdtMUk0cmmnsZGyU2pHPWwbjM38Un5FBbODHaXsLqtKrvq6zNJglChCtuzvzMPN8fJn4KcX1o/8XwPP/nL4d6M2IyGxGenxYmaouO8iq51xl6jsA28Q3q7D8JRwW4Jmk5kDAqweiik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741057714; c=relaxed/simple;
	bh=zd2kXp2LW9rFB0BwWOdHQwKVUln9e8unlctAyne2dUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jGuR6jm3ocsXTyJi58xxSVkDKB1Ld2Y5glZDdhgGv4u3oK3SSF7QYSBa9qjrO//9NvzrdJXX1fPwr2R0XSoFHMUw3p37v6BEFgdD+tl7p6e0WwAsJJ/sjuhdvrI6F8X+9Szh7UtNF6L3T03bWRfbeSdsJGG3x1wJE5NhHNSrf2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/HusAHI; arc=none smtp.client-ip=209.85.128.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/HusAHI"
Received: by mail-yw1-f194.google.com with SMTP id 00721157ae682-6f77b9e0a34so40253497b3.2
        for <llvm@lists.linux.dev>; Mon, 03 Mar 2025 19:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741057711; x=1741662511; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJdTuc12hE8xNboldJDtY0tNQVyNe2iG7pRWAnla1E8=;
        b=Q/HusAHI8fg5Vo3z5jy4iYuOro3IQKYgA3eIbuU4iK33FfQVQGSDJ2rjecttyrXVWb
         ey0jCRazIywXj+QKSpvukfoLs2BmoLT1L5owp/yc9D9rNMJO9bqERj3sRaIC1SmPhc1k
         EtjiAOrvNBanAuwb9PR+2z9Qwcs1D/CYxqI+TPK8eKiZSkaTK/yutS96x5ZgtwR9OUTW
         OwnJ5sZcbWSwQ9gs+WHwcVgwqjd/SS9DDKHcX8hsqO6hsT7I6R6Mn3Lulas9WT+cazB2
         kz6KpXWz1dIUuhemk59Jl30KDDIf9yGs/txEnQmr4WrHxMGIpa/EOa7i9URN1AbdyDun
         413g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741057711; x=1741662511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJdTuc12hE8xNboldJDtY0tNQVyNe2iG7pRWAnla1E8=;
        b=mYrsrF8Z/5uuO7Ks/AMV/NA6sHpE1rIsd25sxGsV5/UCVfcS5HoYR9zOcrAwgV5a9P
         PQsiCXkTR8C6XhF7zscFqOh+wIGMvJNha7sGWrWp150RaJlk50UPI8YcOBzKVTdbcg9e
         h2Hh5ePbRiqZSUJ3BvgI9HmLWaX17T6GUhJZb5Pt+CZSUk/1EEqAjk7qgINNPs4uJLBV
         21jnMbh9xrRADZigHICCQiijNPJiLAkZBdBLejHAoGJPhkv/SCM8s+8pHHeq4qrzoHKF
         3J16x9AzTAamyM+kV4sdfO+SpBTwY2sFwgdp11bYgi1JtrKPtfaf+MJLw3/QmbO4Huvj
         k/mg==
X-Forwarded-Encrypted: i=1; AJvYcCXC+hF4uh07SkSkV1Es4QYJXBtXFbIpIDKmxeHN4c2jGxX4JF0rDnmbT4wjH95OUewCRlqm@lists.linux.dev
X-Gm-Message-State: AOJu0Yytw8e8TSf+rcwv90q2R8lhffD0qcg+dFruG9fBjGUnW04mqGA+
	7ML2a/DzbAPV74yPzrSdDHj4bVLirqVHz+vEpCKRXa61BHldSaPTDJIEoqN4Ws2rAbum0QVhV3a
	4W/Duivl6Kz+dsYfV9TsljEM5bLk=
X-Gm-Gg: ASbGncvqInH99vvSRairygQN1ygdzUDsKFPpxloEvNpwc8nGprPpGeRaF2kABUPjhDV
	MiopgDZuAPO++WC9utqCM6l5SFv0dK774axMk4IP6rUE+jvy2BVWf8wVPoyhAfNBvhSs2BtJP5/
	5vd+CyhCGm+m1pRRTL6cjQxzIrXw==
X-Google-Smtp-Source: AGHT+IGjpE37/D8VFUXwtx1+vTlIBKGMhPsHyscBlEpff0BYVERCrQfJXRrs4afpX4s/+1NgBA8mJU+Be8nzIuYC69Q=
X-Received: by 2002:a05:690c:3708:b0:6f9:447d:d1a2 with SMTP id
 00721157ae682-6fd4a1b56d0mr207861007b3.29.1741057711592; Mon, 03 Mar 2025
 19:08:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250303065345.229298-1-dongml2@chinatelecom.cn>
 <20250303065345.229298-4-dongml2@chinatelecom.cn> <20250303110559.5a584602@gandalf.local.home>
 <CADxym3ZJf3TEMwCy4JVT1gs9GP=U1n1qss3ycnuMZVyp9TfDdw@mail.gmail.com>
In-Reply-To: <CADxym3ZJf3TEMwCy4JVT1gs9GP=U1n1qss3ycnuMZVyp9TfDdw@mail.gmail.com>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Tue, 4 Mar 2025 11:06:55 +0800
X-Gm-Features: AQ5f1JrQ2Vfag3gyvkNKHuCTcxmUnHFiO3c2filqEDv803CK-Q1LsulYa_DCrkw
Message-ID: <CADxym3bNxGb-FPtkbjiLfEXBRnVT7HBM8nbQBWvcHoLhYrKKgw@mail.gmail.com>
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

On Tue, Mar 4, 2025 at 10:07=E2=80=AFAM Menglong Dong <menglong8.dong@gmail=
.com> wrote:
>
> On Tue, Mar 4, 2025 at 12:05=E2=80=AFAM Steven Rostedt <rostedt@goodmis.o=
rg> wrote:
> >
> > On Mon,  3 Mar 2025 14:53:44 +0800
> > Menglong Dong <menglong8.dong@gmail.com> wrote:
> >
> > > In the third case, we make the kernel function 32 bytes aligned, and =
there
> > > will be 32 bytes padding before the functions. According to my testin=
g,
> > > the text size didn't increase on this case, which is weird.
> > >
> > > With 16-bytes padding:
> > >
> > > -rwxr-xr-x 1 401190688  x86-dev/vmlinux*
> > > -rw-r--r-- 1    251068  x86-dev/vmlinux.a
> > > -rw-r--r-- 1 851892992  x86-dev/vmlinux.o
> > > -rw-r--r-- 1  12395008  x86-dev/arch/x86/boot/bzImage
> > >
> > > With 32-bytes padding:
> > >
> > > -rwxr-xr-x 1 401318128 x86-dev/vmlinux*
> > > -rw-r--r-- 1    251154 x86-dev/vmlinux.a
> > > -rw-r--r-- 1 853636704 x86-dev/vmlinux.o
> > > -rw-r--r-- 1  12509696 x86-dev/arch/x86/boot/bzImage
> >
> > Use the "size" command to see the differences in sizes and not the file=
 size.
> >
> > $ size vmlinux
> >    text    data     bss     dec     hex filename
> > 36892658        9798658 16982016        63673332        3cb93f4 vmlinux
>
> Great! It seems that the way I tested has something wrong. I'll
> compare the text size with "size" command later.

With the size command, the text size with 32-bytes padding is:

  text    data     bss     dec     hex filename
48299471        14776173        18345936        81421580
4da650c x86-dev/vmlinux

And with 16-bytes padding is:

  text    data     bss     dec     hex filename
46620640        14772017        18458396        79851053
4c26e2d x86-dev/vmlinux

It increases about 3%, which I think is acceptable in this case.

I'll post the message in the commit log of the next version.

Thanks!
Menglong Dong

>
> Thanks!
> Menglong Dong
>
> >
> > -- Steve
