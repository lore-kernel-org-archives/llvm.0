Received: from mail-yw1-f196.google.com (mail-yw1-f196.google.com [209.85.128.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338254D8C8
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 01:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741051374; cv=none; b=FMh2MUnxTBDdCLDi08jbPKhglqu2pEB0d0CFK7tpkIg4Oixf8vEYBggklMC+cnCP2tr2yzUBbrRP5mvx0kvAVqwRFHGcj9jWTZOMG1XORxe2SuYiLSx5+VBku2zBm7Q4/ZV5IYDJq5y2bx4hKW4eXM5fh4msT+e3Wt9mreYFblE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741051374; c=relaxed/simple;
	bh=sj01G89WSKsFpjf/wy7aY/kOlbTksiMMzEm1e033JpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P87NHfm2nSTb6lX11lpVl5pbrUdVRUBM6zb1zRfiVhjwJ2XwXIUWu9yE90ksnIxjo7Mru4aBFbfwg9rN1snM9+OIIGqB8TCJhpcFhLiFWc5ic4XcB+C2fGERTC83sYpVxDD/gdTpv2gnyyDDwuRtROALe9m1T54egTi1XygfNx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ke/TY6BL; arc=none smtp.client-ip=209.85.128.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ke/TY6BL"
Received: by mail-yw1-f196.google.com with SMTP id 00721157ae682-6fd6f7f8df9so16510647b3.1
        for <llvm@lists.linux.dev>; Mon, 03 Mar 2025 17:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741051372; x=1741656172; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sj01G89WSKsFpjf/wy7aY/kOlbTksiMMzEm1e033JpE=;
        b=ke/TY6BL1EEAjtURV8e1/lSyScqc82VANs9HDOWjIxrRuCNQLhaIwJq6+SeVNF0xRw
         rnkjXI3zzXu8LLNk2u7qGLNqishIT+DkcWYYlNaH2ezerqMybbSINutL2dzRtZDEcJso
         hyaYNQJJ7l0EMuaGT35X/AeTv872rNFbL5p9IS/5wXlcVossVYVJniCimuEfR4mZSXr8
         Xzk/XIrajG0WS25hPsfQ4Yjl4jI91d7l2fjyJHXVmGVOlDRS4sdov1uANr8GwNKMIsWf
         Qvw1w6GHLrH9cJO/Otbe3EOA55iQmWEwuoz/7/C7DfC2lZcHcDPOSuZ6RgUHMCsV6mxY
         Y16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741051372; x=1741656172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sj01G89WSKsFpjf/wy7aY/kOlbTksiMMzEm1e033JpE=;
        b=joVaeBq04SUcWQgL/8asmM7tfDOK2TsbLFsWyqIVRmMHRWxYVLeljDNicW/HmzLqj3
         Q1/NIdEa+9N9od8aux3e0IrTraquxVEitNlxZcNNJ7eXzru2wfJ0n1zy0sogn9R0+BDk
         6w/AF3zT7NGjMJcUWqBwEs04tHQnPw47Puix7fGlZ/tYAhMYFsXd6HsmQDDBvIMwkMLq
         xHrUuMfvane6xrLM7T5T+/t/Ia5uVOtdzZwwxNZtHsxiBR/7pAUUQW+OOmftEDGa+Wni
         +7eIfaljSrSHUYscoJW0Mt71Kgz1FfyGiJeXFcgqA+h9V6ADTvFViT/dErRXtqL/kqqg
         LL/A==
X-Forwarded-Encrypted: i=1; AJvYcCXXOT7EWps0XNVaK8ukghyhPi9B8mgIKaXyeVKHMYrgCavXlAgzLMF74xO457eNehRhLxQF@lists.linux.dev
X-Gm-Message-State: AOJu0YwPYb1gpmMRiIg3Rw24WESVKin+7XIIr2xUDEI+UfGEGjbXBSuC
	xLKjvxfAUbO4p+YxCa3XGRj/S4BbarXdzOd4OCVwpmuHAKFm50sDY049ZKOtArnni52BaI5XbD0
	rKZ8d1u+l6SbYow5u5T6vkBDoQqg=
X-Gm-Gg: ASbGnctrPx5Tr6z4WUl9mUx1utDfhIjjur+s6vSROp8d+bNIahi0Wvi68t0nmdZSLfO
	6N6G8GI94y2/z84LA1Kn/GPPHK1BobzGmqYYA17ODagvcTnfn7Bvq5xP0iXWu/pLz67EM6h/WCF
	yOELsDt2+I8FiB+mKz5ao3iDugdg==
X-Google-Smtp-Source: AGHT+IElMAk21PoBw46zmvLTxOIKzrTm436wI79ItKGnS7B37hL1mh91tHN7JBEL3hC27FIUVigt3qCLJ8UVxsKzHIY=
X-Received: by 2002:a05:690c:802:b0:6f9:5552:6b20 with SMTP id
 00721157ae682-6fd93fe85c0mr16592127b3.0.1741051372144; Mon, 03 Mar 2025
 17:22:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250303132837.498938-1-dongml2@chinatelecom.cn>
 <20250303132837.498938-5-dongml2@chinatelecom.cn> <20250303214048.GA570570@google.com>
In-Reply-To: <20250303214048.GA570570@google.com>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Tue, 4 Mar 2025 09:21:15 +0800
X-Gm-Features: AQ5f1JpZvyop7dLuEaHSyJ9xfDPdFhBsxp1mwPgCCs2RQqwOnwzgm0G2X_76n64
Message-ID: <CADxym3Z76bm9wXPjX=9c95eZtWjODwz70xN1KUR92NuC6vzrwg@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64: implement per-function metadata storage for arm64
To: Sami Tolvanen <samitolvanen@google.com>
Cc: peterz@infradead.org, rostedt@goodmis.org, mark.rutland@arm.com, 
	alexei.starovoitov@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	mhiramat@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, yonghong.song@linux.dev, john.fastabend@gmail.com, 
	kpsingh@kernel.org, sdf@fomichev.me, jolsa@kernel.org, davem@davemloft.net, 
	dsahern@kernel.org, mathieu.desnoyers@efficios.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, kees@kernel.org, 
	dongml2@chinatelecom.cn, akpm@linux-foundation.org, riel@surriel.com, 
	rppt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 5:40=E2=80=AFAM Sami Tolvanen <samitolvanen@google.c=
om> wrote:
>
> On Mon, Mar 03, 2025 at 09:28:37PM +0800, Menglong Dong wrote:
> > The per-function metadata storage is already used by ftrace if
> > CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS is enabled, and it store the pointe=
r
> > of the callback directly to the function padding, which consume 8-bytes=
,
> > in the commit
> > baaf553d3bc3 ("arm64: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS").
> > So we can directly store the index to the function padding too, without
> > a prepending. With CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS enabled, the
> > function is 8-bytes aligned, and we will compile the kernel with extra
> > 8-bytes (2 NOPS) padding space. Otherwise, the function is 4-bytes
> > aligned, and only extra 4-bytes (1 NOPS) is needed.
> >
> > However, we have the same problem with Mark in the commit above: we can=
't
> > use the function padding together with CFI_CLANG, which can make the cl=
ang
> > compiles a wrong offset to the pre-function type hash. He said that he =
was
> > working with others on this problem 2 years ago. Hi Mark, is there any
> > progress on this problem?
>
> I don't think there's been much progress since the previous
> discussion a couple of years ago. The conclusion seemed to be
> that adding a section parameter to -fpatchable-function-entry
> would allow us to identify notrace functions while keeping a
> consistent layout for functions:
>
> https://lore.kernel.org/lkml/Y1QEzk%2FA41PKLEPe@hirez.programming.kicks-a=
ss.net/

Thank you for your information, which helps me a lot.
I'll dig deeper to find a way to keep CFI working together
with this function.

Thanks!
Menglong Dong

>
> Sami
