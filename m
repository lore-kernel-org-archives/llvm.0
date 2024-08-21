Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4976384E1C
	for <llvm@lists.linux.dev>; Wed, 21 Aug 2024 15:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724252808; cv=none; b=cjFo88B3FuBbAudhRzPYI3ddp4BcvV3CetlVm5Xn9ogwRRnOEvJsrN2qbKy4v5ThtBUXE92vauqRlDSEa2fL8LZuIWLJ2ms9pEU9/ljCwNcQyJ9CHKFuRJBuwCjZbM+AHPk80M0rwA/GacHJQhRXUk1aDMKcRldEN0GNWE56EJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724252808; c=relaxed/simple;
	bh=e60pcqqEQWhVJkjGgiAn6KAQ4psQHcr9lb2LxGz/VHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f53HQt8DgmhobOOBBxVn9cBDd/cciy/eBx3YnaVH7sCdS6cCPPA28I8JfSJpSwF90OL8+ejRoXROP2y8T3KcnVU+2RsttuuGqD0v+t/HiBoiHJVdUjFNH+KEpWwlrk+tFJRWNnrE6Mwuj+t4uq+WykTY89V61r/BU3pWHN9AuwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LZdXntGZ; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LZdXntGZ"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-45029af1408so257201cf.1
        for <llvm@lists.linux.dev>; Wed, 21 Aug 2024 08:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724252805; x=1724857605; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b217j7C4Tggz1DzCx9BorR6jM0+OIdocUTHDXz3fh6c=;
        b=LZdXntGZFgFip7L9wO4BMBAhX9f90qjLgOzq4tsPgJMs0syEzFUVye8oYXLXVN9ufw
         Sjl1h+pWkEpgbJFelH/f77+Ra9mBYbbsJbKze/V6yas+NtLTGY2kP4+GU/Z08x7MI0oT
         hh6xOl/PYLxjVfGsHBPBVtzXlpq+e5nHajDv6jA3FafRsAiD/WFUkCm72cL4v227rexA
         LbTI/bGmCsvMQ4VKy3pq1YbR8heJZKbM0VfBL3NThoHZnbl4NzrsMg4tpiJSNjBj09PX
         YAnyyt80XLGrf7+w8N/ywr7odZfFDK9/Gggr33q6qfaOQ1rIEmgeLfQv49AW//v0cBNF
         ggXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724252805; x=1724857605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b217j7C4Tggz1DzCx9BorR6jM0+OIdocUTHDXz3fh6c=;
        b=MgiIre84InHRrDdsBCsRJqanyUDzfcLoZsFxyW/hRBhjxdKaqN1hqI1R3v48p4+CPy
         v96PUdQQqIUiY9rzkNkCFu0ylZkAkpPpsjQATwq1RC+LElevumWaGnOFD48kdxSvCBm2
         yQdRNhKzv2xpaEHTzWWgYsYbNXyr5+9gLgF8vQpvVSOUD9+ffKDoNJWnb8kvmTwX5QtV
         n7K7iSt77jq4viboi+Cv9+3n+zmH7DAzNIZTu8Zk/jnwABOmAfkHGQT2XisI+tg88qcs
         xEYXPCu+Lcc+wnSTXGKoRz4sh0epBF1JNZHfKV08GwR5pJze111fDvk54jnD4HH/ISBj
         QJOw==
X-Forwarded-Encrypted: i=1; AJvYcCVe+8nDciJ1Ycw1atQCfiLkXS6t7d2WaVKJrVFgltOl7Z2s02T4fxVq9GCCM1vpy6A8oEbQ@lists.linux.dev
X-Gm-Message-State: AOJu0YwayIsRhG9XlGB/Pbjm/oRutf2ICxb9pWVQ++5g/YTqmWpqOzqG
	GaKrPzfN5tOobIYNdUrKehvETwWe2b16fPIFtaKB7PNT0wIlvZcptb9b7XbtPfQoLv+2HSJz+/U
	I5VyuCteX/Tv+duqV+11r07bismRTOU8AadRa
X-Google-Smtp-Source: AGHT+IHDmneMaZKzP/SecJXBvNUGVxswsVHqQQAOiP+buH6ZIBmjD75NyZuDElWo7kDNWqfn8UIgootfNrrbNRKLgLg=
X-Received: by 2002:a05:622a:1825:b0:447:f5de:bd18 with SMTP id
 d75a77b69052e-454e86e97a7mr6218511cf.9.1724252804689; Wed, 21 Aug 2024
 08:06:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240819171152.12f05e0ae5c9472004d1b00a@kernel.org>
 <20240819112902.11451fe8@gandalf.local.home> <20240820005649.dd019cfa70a8955d91cf85a0@kernel.org>
 <20240819120244.5657eb2f@gandalf.local.home> <20240820100330.9ee6f3d51f22bb9bab7c4b83@kernel.org>
 <ZsR0Z6DxSHOI-wNj@J2N7QTR9R3> <CABCJKueKhDVarco4mgNeR0hkAhxDtxBjdpu=QaYVi+TGoiqd2g@mail.gmail.com>
 <20240821070539.981b42e5f3b939c5ce5e3a71@kernel.org> <20240820181109.4203158d@gandalf.local.home>
 <20240821084351.4b1c9d4d52b5aa7e07681d69@kernel.org> <20240821092147.ff26a09cb0a72b8621abe750@kernel.org>
In-Reply-To: <20240821092147.ff26a09cb0a72b8621abe750@kernel.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 21 Aug 2024 08:06:05 -0700
Message-ID: <CABCJKucLewqpZjckFy4mptUq4k_O75ce7f8MXzqoERXGs9UUVg@mail.gmail.com>
Subject: Re: [BUG] tracing: dynamic ftrace selftest detected failures
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Mark Rutland <mark.rutland@arm.com>, 
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	clang-built-linux <llvm@lists.linux.dev>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 5:21=E2=80=AFPM Masami Hiramatsu <mhiramat@kernel.o=
rg> wrote:
>
> On Wed, 21 Aug 2024 08:43:51 +0900
> Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:
>
> > On Tue, 20 Aug 2024 18:11:09 -0400
> > Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > > On Wed, 21 Aug 2024 07:05:39 +0900
> > > Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:
> > >
> > >
> > > > Does the noinline attribute prevent embedding callsite too? I mean
> > > >
> > > > extern callee()
> > > >
> > > > noinline callee()
> > > > {
> > > > ...
> > > > }
> > > >
> > > > caller()
> > > > {
> > > >   callee() // (*)
> > > > }
> > > >
> > > > In this case, does noinline prevent LTO to embed the callee at the =
callsite(*)
> > > > or prevent LTO remove the callee() symbol?
> > > >
> > >
> > > Even though we have it passed as a parameter, I think the compiler an=
d
> > > linker is smart enough to see that and notice its use, and that the
> > > function passed in is a nop, which doesn't break the flow.
> > >
> > > Can you add the __used and see if it fixes it?
> >
> > Adding __used to DYN_FTRACE_TEST_NAME() and DYN_FTRACE_TEST_NAME2() doe=
s
> > not change, the test still fails. Hmm, what about makes the caller
> > (trace_selftest_startup_dynamic_tracing()) called via a function pointe=
r?
> > In that case, wouldn't it be subject to constant propagetion?
> >
> > Let me try.
>
> OK, it is succeeded! Calling `caller` via global function pointer makes
> it run as we expected. It passed the dynamic_ftrace test, but other tests
> still fails. Those need to be called via function pointer too.

I was able to reproduce this with LTO_CLANG_FULL, and it indeed
optimizes away the direct calls to the empty stubs, but the functions
are still there. LTO_CLANG_THIN doesn't perform this optimization,
presumably because it doesn't have full visibility to the other TU.

Sami
