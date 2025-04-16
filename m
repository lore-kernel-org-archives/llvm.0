Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D42224244
	for <llvm@lists.linux.dev>; Wed, 16 Apr 2025 18:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744829053; cv=none; b=G377+jg9sTIJZ169k71u1fYjaHnG+MIGGMhITDpsfSCtm+Y1xqt4yxI/EXqPRkYVFS/ft6oKTM+1SVzXh+Z8+wFNzvSVYgmd6+TsNZZanrzZs/STCuldtnMPspeTWCUPP6Ps+IqrGEITtiehYGb5irE9G0vvSbIESdvdhQfy8zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744829053; c=relaxed/simple;
	bh=xvCR5iVQAHk4Tvf6E441jur/WH6gyOI6MT643z7GMqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R4dg7auKh4EoKZNgl/CzJrxzBR5JsULH8+nKTbMOVi6Op0BPqRiO39wW51t/c52Cj5e+gvYAgwTCKz3QGvvPMHABqTCO85TxiB97lOFWAZ+Hw0cT2lpheAoRKkAmdtsBP/x7/hGTpVl5Hd46f68C/EztTsZJQCFI4ApheQFpDeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2E0Urxq; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2E0Urxq"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3032a9c7cfeso1281653a91.1
        for <llvm@lists.linux.dev>; Wed, 16 Apr 2025 11:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744829052; x=1745433852; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvCR5iVQAHk4Tvf6E441jur/WH6gyOI6MT643z7GMqk=;
        b=e2E0UrxqMbiMpoKPaEMIPWLXwffyEZR4cBJRQTQeBPnzFL/9jg2/pl3T3LajVmBOZh
         ixSOZI8cnGlEldtFb5nwFczdkeTxPQfX7pW+KBWGV3K6qwWyVz6K/f9mwhGT8juHUkkk
         1vuLAWVhQ5uP6QyPN2X8bJcLw02SwPxX2VW2HcbIc6yXu7LuKoMi0Yn9Kuea9kW6uC60
         duBuCNtth4gGIFM/xT87pL0n3KaWIdZdcF+Sud9GtQp+4/92Eqy36rZdq3XL/otFyI4X
         EKwkVMkNtOMnkOIaulm3OFOf53Tl3iqkIHBpVxDe4qQjawrUWAmoUZZrC5jtOL1tN9fp
         Z8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744829052; x=1745433852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvCR5iVQAHk4Tvf6E441jur/WH6gyOI6MT643z7GMqk=;
        b=BeUjp7WnUyTUQ093i0ytSlV7CRIlJaL9nY6zWuigkAGQToe4AxKd9pVDbSqEfMWoXV
         xg0I7BcaZf+6fdRmHfFEJIWwIkLXOql6tNI6qRPCrNN+cj56szryEHmJ6Kh1BXUAlNbs
         ZjZEAypHr4kAmDJmHwULy0triBKgRX2rplqN0ssg/afJT/o9vRP9ilOHxmLD0643uRUq
         KIELs49tk8+XxulPlfMo6eyWWRgvJulA/0XXzoGrK4ZR+XCCDbAS7WsxH7C8HF60Q+QN
         h6mXyF8DrrTV0FezAnCKdz8N8kIV4kjsQ+ulx5DI6NLHN0F1rPcHvSooY2rsGdPgw90G
         QYfg==
X-Forwarded-Encrypted: i=1; AJvYcCV6ztPYfsjDXqb9d/0Qqlz9DoFz4zBO5Wz7AxhaJY8pJqNkdCxhZTCo/5uGoZOjgwg+Outt@lists.linux.dev
X-Gm-Message-State: AOJu0Yx15dOmDIKR0RxhQ2otuZ56+RbRTZX+4EjHvXn7fjdV5ISlIpFo
	jwmw3VkRl3nJSTlUWCvX+B9NWwsx/s4a+7ttCSikD3uykkxpE6TDh0FSpoG09dEWOmKe8tEp0Ad
	03IfsGSH9I2GqZZ+EUy70NMJAeuM=
X-Gm-Gg: ASbGncswxvZxNp5d8B0LXutgypavDvbqNfYoyRFK2IMzUxOHWJXIZBi66rQkUeYd4gS
	A8fBNfnjYDE5YhpUWdkPTsaXFFIlwi61zC1ckbY/ltpCmy68XzImQ+7BhqsE5upqKups05eWi4w
	KL0GBlTnrAiuF5wxd/SQA91w==
X-Google-Smtp-Source: AGHT+IGz/z+KUxXc0G33wVCMhaj0SKBILS+bup38MKz4IGI65K2wAnc340DmtbFbjrtGqJWq1M1fbmkQ1lCjHd+vde4=
X-Received: by 2002:a17:90b:4a4f:b0:2ff:4be6:c5bd with SMTP id
 98e67ed59e1d1-3086eff3792mr78829a91.8.1744829051661; Wed, 16 Apr 2025
 11:44:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250416172016.work.154-kees@kernel.org>
In-Reply-To: <20250416172016.work.154-kees@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 16 Apr 2025 20:43:58 +0200
X-Gm-Features: ATxdqUGibHpjNZ3ZNK7NgImsJdoOgHlkWudDRmL9Gskw_Ayg7Z7YSleG2ywgKQM
Message-ID: <CANiq72=2Y1NYVkEYR=Q5_HDbLu=P6KRsOzDKGw-8Zw6U-_KtYA@mail.gmail.com>
Subject: Re: [PATCH] compiler_types: Identify compiler versions for __builtin_dynamic_object_size
To: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Marco Elver <elver@google.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, llvm@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Jan Hendrik Farr <kernel@jfarr.cc>, 
	Tony Ambardar <tony.ambardar@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Uros Bizjak <ubizjak@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 7:20=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> Clarify when __builtin_dynamic_object_size() is available. All our
> supported Clang versions support it. GCC 12 and later support it. Link
> to documentation for both.
>
> Signed-off-by: Kees Cook <kees@kernel.org>

Looks good to me, thanks!

If you/someone is taking it through their tree:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
