Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BF71D7E2F
	for <llvm@lists.linux.dev>; Fri, 21 Feb 2025 20:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740170196; cv=none; b=T6AeAAosywdPJqQ1vQa3T2OqS4wmh7UyBzcfT4HZF6oCaqCGHpRM23U4cqHHpirQ4FCJ6b5fWiYtOhgAcK6xRCc7GmmqzhqDaEDrgyhgUd5PjfL1vKglS6+f1uLuxFSvkXxreaMIZqC2usH4+XyS2fIXUUkern88dVhtS/sY4tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740170196; c=relaxed/simple;
	bh=IWMvonBG+KnGNLyuoaKqjMosPNOq8YfwaQsVw0V4EEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lZxk8PYTKP60fKqCpnXOY/4Gysy5j1KLjVMQI7bJ4Y+F995CYeF3zBYuLl+SXiVVKie6Ot5sEXPV2SsfaRoNpanYqK6nJ2jxMwrlascAc/pV18yhieb2LAllUkdEHUgcHOduwDYQ9bRQAEf6NvBiJfJVqUgekM6q9g3/gClYKyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRMFnliK; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRMFnliK"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-abb75200275so400136266b.3
        for <llvm@lists.linux.dev>; Fri, 21 Feb 2025 12:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740170193; x=1740774993; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWMvonBG+KnGNLyuoaKqjMosPNOq8YfwaQsVw0V4EEI=;
        b=FRMFnliKVsL0LOP/tgpujPW6rof3qYiTXArNWPpispjYFICb4h7cteE8nboqRvfTEl
         SAWLhGAWOzV0mO1Do3CuVb2F9xKzP+7EkWIHrlgzD3whPnYiNTVdTKA/xztlFwyMduBG
         2aBn8JGxCM/WZ6da+/vLFfNa0BDjnvB/f44fgh7DsFVzYTLufdaDiz0sE5YugfdKjY44
         b0PWWw9LLEzizyjwyUH3OVfOuEDP0RcavPM2XBH6GNSjText/Ow0BbWa4mZ9o1MDy1U+
         7ufPpf+CVA918wv+E5TPGa/ekIqBZhTZ/ua749eLKrh78FJDwX4rWLxWQqnDAu4eUHd+
         jBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740170193; x=1740774993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWMvonBG+KnGNLyuoaKqjMosPNOq8YfwaQsVw0V4EEI=;
        b=MxWUpslwaPXXFG/GfOyBHkrsTWMEN5dukfeWJ6Q1QxlIJ+8vkVk4VWI+w32UDJHmk9
         Uty+dednNDv2KQMO84wXuZf/iYX0iINHrFsHqZU5tWF6BzU+EAdWJ12WqQz+msGD0EJj
         SSpAcXpQmumVMGkg6MoaXGu4Es5TjZWPDnU22ppJ/ApxabRjF2se+tRC7VZHOB8Us+Vo
         4W79Mqg3e7hNY5xTupvje1dP5aUGg+W4ZAwgWeguU+hybpX2MDsyTAb+qD0bQw5X0cJG
         DQG+aoFmx5TKxj6jLKQH6gJu/xlBYMgxxN7uin/hgney/2LPAvW8nefkvYdqitt2BIXM
         NLVA==
X-Forwarded-Encrypted: i=1; AJvYcCWvnuE3cJaTTArozDLYMpRcgfPPEXGEdxHNBsS27HA1fVvgShnzy/oqBS37MLfgTmDWSSc1@lists.linux.dev
X-Gm-Message-State: AOJu0YyB/mRpCWdLID78CVG0D0yAI/d5Wism45NF6qFzzPsAGdWZKdhx
	Uu2x2W1K2EshUxIX9yKWoB7s2awMWUHStVOqqoHnRoYk2hf6fwSl+GfRlL8e+mtEA93i2wXfLlg
	SXN87z+90mzdDTQiuH0bHzq083bY=
X-Gm-Gg: ASbGnct3M2HWkPHCo09K4MMQKtiZy16/0xkkD61OcpjOWxr2n1DZZp8HPsPw6Tl3zLa
	uNKTr1grQ7UmhL1ClFd1xNnZXwYdTksyYj9TnxmaAVqMLKxBZXNcv7KHVYyXjYYAN8ydXIC/Y8/
	zT3w7ym3Sjfksb3E4a1R7W28kPfLXVNR9lYkOY9SzjeA==
X-Google-Smtp-Source: AGHT+IETtMfsp+oxVVvJtgbE795zNbuHaeWF8ofCjtDM153d6TyT0rI+Niqk7EWeS2I9xBqTyLh7p3er1/ZJuxxHIcQ=
X-Received: by 2002:a17:907:1c07:b0:aa6:7a81:3077 with SMTP id
 a640c23a62f3a-abc09e394a1mr453579866b.54.1740170193331; Fri, 21 Feb 2025
 12:36:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250213-ww_mutex-kunit-convert-v2-1-4a60be9d5aae@gmail.com>
 <20250213115951.GF28068@noisy.programming.kicks-ass.net> <CAJ-ks9mzYWSvVD=PCvCBohXg77BdFODq4ePMNstkL+70tkU5RA@mail.gmail.com>
 <20250214094856.GD21726@noisy.programming.kicks-ass.net> <CAJ-ks9kG6g8v7ADJkpuwekg_87iDVq-hPcYR+Oobrrjb-a8hfg@mail.gmail.com>
In-Reply-To: <CAJ-ks9kG6g8v7ADJkpuwekg_87iDVq-hPcYR+Oobrrjb-a8hfg@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 21 Feb 2025 15:35:57 -0500
X-Gm-Features: AWEUYZmTNrzRMQDfcvC1uKAS9y2OW_n7SKmU92RpVTg0NimjM8ab7XRa3qA78u8
Message-ID: <CAJ-ks9=BjaQJh0L3K2ywPFhP4XBxZiY9mqJzu1TsmpiH-AG9uA@mail.gmail.com>
Subject: Re: [PATCH v2] ww_mutex: convert self-test to KUnit
To: Peter Zijlstra <peterz@infradead.org>
Cc: David Gow <davidgow@google.com>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 7:37=E2=80=AFAM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> On Fri, Feb 14, 2025 at 4:48=E2=80=AFAM Peter Zijlstra <peterz@infradead.=
org> wrote:
> >
> > On Thu, Feb 13, 2025 at 10:42:24AM -0500, Tamir Duberstein wrote:
> > > On Thu, Feb 13, 2025 at 6:59=E2=80=AFAM Peter Zijlstra <peterz@infrad=
ead.org> wrote:
> > > >
> > > > On Thu, Feb 13, 2025 at 06:40:20AM -0500, Tamir Duberstein wrote:
> > > > > Convert this unit test to a KUnit test. This allows the test to b=
enefit
> > > > > from the KUnit tooling. Note that care is taken to avoid test-end=
ing
> > > > > assertions in worker threads, which is unsafe in KUnit (and wasn'=
t done
> > > > > before this change either).
> > > >
> > > > So this was something simple, and now I need to know how to operate=
 this
> > > > kunit nonsense :-(
> > > >
> > > > How is that an improvement?
> > >
> > > Hi Peter,
> > >
> > > David enumerated some of the benefits of KUnit in another
> > > thread: https://lore.kernel.org/all/CABVgOS=3DKZrM2dWyp1HzVS0zh7vquLx=
mTY2T2Ti53DQADrW+sJg@mail.gmail.com/.
> > >
> > > My personal reason for preferring KUnit is that it's much easier to
> > > run from userspace; the tooling takes care of building, starting the
> > > VM, running the tests, and producing a human-friendly report.
> >
> > Wait what -- you have to run a VM just to use Kunit? That's a hard pass=
.
> >
> > If I can't simply run it natively on my test box, its a no go. And it
> > using python also don't help, you shouldn't be needing that to load a
> > module.
>
> The tooling I mention is all optional. You can still use modprobe to
> run the test as a module or at boot. In this case you'd set:
>
> CONFIG_KUNIT=3Dy
> CONFIG_WW_MUTEX_KUNIT_TEST=3Dm
>
> and then run the test via:
>
> ```
> modprobe ww_mutex_kunit
> ```
>
> or to run at boot:
>
> CONFIG_KUNIT=3Dy
> CONFIG_WW_MUTEX_KUNIT_TEST=3Dy
>
> Link: https://www.kernel.org/doc/html/latest/dev-tools/kunit/running_tips=
.html#running-built-in-tests
> Link: https://www.kernel.org/doc/html/latest/dev-tools/kunit/running_tips=
.html#running-tests-as-modules

Gentle ping. Peter, does the above address your concerns?
