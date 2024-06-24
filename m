Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198321A00FC
	for <llvm@lists.linux.dev>; Mon, 24 Jun 2024 19:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719257229; cv=none; b=JSYnD8sPNr2eS2dYmN+/CK+r7GFNoeYAshVfydv8VNaK2n97ZdQp0ESfEmZrhSImvGpiV+6buNhg4aBRJHqgoRSocpYZKk1pGWRP6OImu1hxa0DdfTVcKGSOFA1oPULOvKtzi0t7ctDDmQxwiEISKqJ8ALOpQS7XT7P9Xky+Pms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719257229; c=relaxed/simple;
	bh=aQZfSwoa+l4IMNsVymSrA1l1JRzJlII9rqUvP9kMBqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OYqwlvq9IDlPUTVtc1gIkSE9ZpStIJhpLr8QAksF3fG2ddvziac0dZ299MDOvW5e9SpZGhTTjTjKcomHxdXZp5Pznmzzx7cIeXc5uPwhCNwpVKbEz361xPH/EZtwU3vHdehlg5UF1rN9I8QQyQoicnlbiJf5xHL79WArl20eZmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CAcgV4Zc; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CAcgV4Zc"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f64ecb1766so35773305ad.1
        for <llvm@lists.linux.dev>; Mon, 24 Jun 2024 12:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719257227; x=1719862027; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6NPcKWdrsF0ORnPMJ9lUOl+tIOO+xgUu7dqqnj8kWQ=;
        b=CAcgV4ZcftWxRMSXZSaaBQC5/hk6CRxcjH4Nvv7bjMWBrFgQz9n2Mqe6tovrgqz4UQ
         5otWv1Eg9RA/T8GSuUf1HNA5G9Etku1t5bUcbHEhV97c7PIXmYwIsbcuklTGqqSsBgsz
         brwCRiosS5rEe6eskjOk9fCUmYQobf6heQh4hQYe1QPDMosK86pAWaZqsD1FcZv5QJgO
         79bjR6LTHnyeIjyHMsnhAtT+MmFyQteuKPMBXHDCqYc0Z1KJqRpaz+rdXByPaLKUb8Nr
         7v0vJsSw7wkDv1UTkfqIdoCTsHSkb0trAlH9p3kheSRXX/MWkqKkn2y8o7gRN7C/rECM
         VClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719257227; x=1719862027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6NPcKWdrsF0ORnPMJ9lUOl+tIOO+xgUu7dqqnj8kWQ=;
        b=mHeZ8PPptIe6BOx9SnSJk8wBCNZzuAFHsBT/N2sYcYwxNSLmaM0jLluQyVa40k30P1
         m1IDBCyfomRfLABd6Vumroh6ox9tJ6kK9hFTzZeJfpyeKMGfDzghtDobkpoX/WjFpF6d
         pzsPJ0avK/TAdR+ADVKDHcwslesyHhBqV9LwoHTVQdMiTjkwapn68wYRDcaPpcDEljlH
         4r1Yyy3/6Ec9abzw2Pq6quvK5KVPTVHcaz0admLz5lzLFxKcQkl0F/PO+YZ/pUsGMKks
         qeVV4zzrgMj53CtqDfQKxLT1QzK2bdKpmr/15ETuDam7Z7e8/qONdJH8rOm++ie6ATTb
         EknA==
X-Forwarded-Encrypted: i=1; AJvYcCXiAd3tyoRyY2DHp+2QeWTeLToPUXJUyq05Tg+D2KeavbLmLQblv+I9bjHw/g1YazBYmowzkrgNPgz+75GrnNWI0tlNMg==
X-Gm-Message-State: AOJu0YxjXllo2c62Ph+4gQJbYgufAz1svaixS/SUScpkP+d/5YWX0ChR
	tOkwl0PIIhpjbfeRebF1J3eFjVxJKhZdMMy4mRvau4YqTkLD3lRmNTNmaQGt75jC+wwwpSgwlUm
	cIeAAeRNIEKISBBT20bSinX439jo=
X-Google-Smtp-Source: AGHT+IGBtjhDC6P3cpTyHX222A40DKzkhUa9Vlp3o09LRMLRvr5RdM7GaIGSlUL3/mDyjjHLONQXobYxheRm3w1BZ2o=
X-Received: by 2002:a17:90b:1e43:b0:2c2:e175:4076 with SMTP id
 98e67ed59e1d1-2c85829117dmr4566018a91.32.1719257227334; Mon, 24 Jun 2024
 12:27:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240624185312.94537-1-sj@kernel.org> <20240624185312.94537-5-sj@kernel.org>
In-Reply-To: <20240624185312.94537-5-sj@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Jun 2024 21:26:55 +0200
Message-ID: <CANiq72nBOG-oVZxMPC-XqVrYSQ95Aj-=FQFTb2y8kG2ioej=4w@mail.gmail.com>
Subject: Re: [PATCH 4/7] Docs: Move clang-format from process/ to dev-tools/
To: SeongJae Park <sj@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Federico Vaga <federico.vaga@vaga.pv.it>, Carlos Bilbao <carlos.bilbao.osdev@gmail.com>, 
	Avadhut Naik <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <siyanteng@loongson.cn>, Hu Haowen <2023002089@link.tyut.edu.cn>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, workflows@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 8:53=E2=80=AFPM SeongJae Park <sj@kernel.org> wrote=
:
>
> 'clang-format' is on 'Other material' section of 'process/index', but it
> may fit more under 'dev-tools/' directory.  Move it.
>
> Signed-off-by: SeongJae Park <sj@kernel.org>

Happy either way -- thanks!

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
