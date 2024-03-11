Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D83C53B8;
	Mon, 11 Mar 2024 02:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710124991; cv=none; b=J0UlmGdgYm1bdlrF6dOEHpu5agVIuUMvY97Ro3ZRV52q2v4rF2svjYS1gWvDyamdd4Nn31cSeVfARpjjXrEyY6rBlzySp65koqmgrl+k1TBipHqF4uygT6OikNE6eQqfZgZ5NIc73fes83BDmRnUHcoImp9vQL7ZfcaZWshYnUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710124991; c=relaxed/simple;
	bh=OKTSETOaIf+cDllksWoXnbkZa2TuIPIonIMCuioza3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KRDuy8CQ9oefonxGpqrMWWZaUw4IjhN2jjsesB3w+E/WVEyDONozWYKWhZHGMotDurv3y5IRZ3Y1kmxOgIeJqAGUPqZo5Q948AXCXdyWIqN3NurGFhV3++oCdGTpLf7wCSMY84IZJqiH8ZKfRtzZVSQ8gnNJ+F3tpCZr4haIY4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hwHh9Q+t; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hwHh9Q+t"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4132600824bso3825065e9.2;
        Sun, 10 Mar 2024 19:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710124988; x=1710729788; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kszp2/sHdBYHQM3bCGYoHt7aaVrOE/U3KZlolmgyyrM=;
        b=hwHh9Q+tAiWoBiDqxCmLOcGS25NG4ZBvRUXNetxpAtkZSq0kB2ZzqyDgcP387DjW65
         le/hH56L2T6CYvVJtHHS4hbjyhB+B9jExopzb8FfIxYPk9WafZ7IxIIAlEdIdtl2/8g7
         d9CROsTN2UF/pZ+Xfh4jDUBeaNRO4+HrSOl0e9kMW2bKUEvWDwP0SuekZIopmgmEenm3
         uQdEDoIA5YPIbHTFn7KVRYnMk+JlE3ADH6AiLFdlqT/+EwOs5HWmnetps4fiZSqB+f6m
         +UaUL3oP4qDFK60RIV9qXfPkxZH64dYurerjRUTPHXSKldvGz8n4XWlchDOTWABkHQ5a
         tPIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710124988; x=1710729788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kszp2/sHdBYHQM3bCGYoHt7aaVrOE/U3KZlolmgyyrM=;
        b=eisdGDTFr8al07hE88zuHVltiaAtRGZESnqLTHytsNrFEXuVRjvpHiVoc+3YyIqKQh
         Cj2vCFcAcyf2EvvRzv/ZUsA5r4c20yUy9i6CuzO7ujAv24AaU9H2o+9R4YO8PPKx9nbw
         cjU10zugpV/qvVYg9e7G2gaP8ko3htL45+U90wK3F5nVdi0w+AQ/3Iqf8uPrO3SLbcrm
         Nl7Ask0JJjBRsBc1AWTwO42XeJQOm5wUnpc8VvdkKK0O3QGoylbLRcPiQ6yLsHzsEjWS
         U9Ko9FX6iDhGLQ36rNTEta9+/rCnx33Ldua7K0FQym5P2tuU7V0NHoTHLwy+gvjdXbOc
         A2og==
X-Forwarded-Encrypted: i=1; AJvYcCUP3gyo5x4QQTDzfwe4saC1/RJrwkgZXz3CnotEppT3GAMEwqVfnEkaa8wDgoC1lYu8AMyGELQpRCSvxHUkYUeMAIZ0qB6R3yTYN9U+bssaOziiCmfcLcrgVCqeLmuavCo+ayE=
X-Gm-Message-State: AOJu0YxStdkbuR/qmCeJqWI7qLFPCSTjgIxS1cOi9Xv6LEKFwNusQgTw
	PyH5VoT5qz5jY+X0Xavign+sH6zkcWtCmKxF/ncRq9L7TMDpF12cfmTJbdpHoo53DPUjtc7WtA9
	Z3tKX9P5YrWKrovb0VYBg3Mm6yOI=
X-Google-Smtp-Source: AGHT+IHB1HlCfT26qC9N0aUQ9OmjLBXn3TJesDmw3rjbXRDqU54RdYkSuC4D1f4Y0dJ2cnaEulbkjOI2HJX3V+Jo2e0=
X-Received: by 2002:adf:e40b:0:b0:33e:733b:cd11 with SMTP id
 g11-20020adfe40b000000b0033e733bcd11mr3432241wrm.53.1710124987487; Sun, 10
 Mar 2024 19:43:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202403092219.dhgcuz2G-lkp@intel.com> <CAADnVQJ+6mFs56fu+KEvumQ5uqM-oLpYx0hGxLJfE9XUCtEWEA@mail.gmail.com>
 <CANk7y0gT8bvKuhJvxG1yLTxdRycMKNEBtgEv_PsCA56Nv74cDg@mail.gmail.com>
In-Reply-To: <CANk7y0gT8bvKuhJvxG1yLTxdRycMKNEBtgEv_PsCA56Nv74cDg@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 10 Mar 2024 19:42:56 -0700
Message-ID: <CAADnVQLXFWDDV8xGLVRNd9JXaqOMfCO3ZGtuQUg8CZjrwLjxrA@mail.gmail.com>
Subject: Re: [bpf-next:master 5/7] kernel/bpf/core.c:900:5: warning:
 '__pte_index_size' is not defined, evaluates to 0
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: kernel test robot <lkp@intel.com>, bpf <bpf@vger.kernel.org>, Song Liu <song@kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, oe-kbuild-all@lists.linux.dev, 
	Alexei Starovoitov <ast@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 10, 2024 at 3:05=E2=80=AFPM Puranjay Mohan <puranjay12@gmail.co=
m> wrote:
>
> Hi Alexei,
>
> On Sat, Mar 9, 2024 at 5:38=E2=80=AFPM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > Puranjay,
> >
> > Looks like I have to drop this patch for now,
> > since PMD_SIZE is not a constant on all archs
> > that can be evaluated by a preprocessor.
> >
> > We need to find a different way.
> >
>
> How about we define it like:
> -#define BPF_PROG_PACK_SIZE (PMD_SIZE * num_possible_nodes())
> +/*
> + * PMD_SIZE is really big for some archs. It doesn't make sense to
> + * reserve too much memory in one allocation. Cap BPF_PROG_PACK_SIZE to
> + * 2MiB * num_possible_nodes().
> + */
> +#define BPF_PROG_PACK_SIZE ((PMD_SIZE <=3D (1 << 21)) ? (PMD_SIZE *
> num_possible_nodes())  \
> +
>                              : ((1 << 21) * num_possible_nodes()))
>
> So, it will be computed at runtime. This adds more performance
> overhead but this is called very infrequently
> so shouldn't matter.
>
> Or we can hardcode it as `2MB * num_possible_nodes()` because
> PMD size in most architectures will be 2MB or larger but never smaller.

I think hard coding is cleaner and less surprising.
I'd like to hear what Song thinks about it.
