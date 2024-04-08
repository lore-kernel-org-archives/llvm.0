Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDBD1487E0
	for <llvm@lists.linux.dev>; Mon,  8 Apr 2024 21:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712612604; cv=none; b=eEi6Rkjmb/6/Qtjtt4CWEP92/MBr/C15VVMUUru8aAhA6k+YnX4hEpm4xuzSuINrr/jyg0hJhlIPEi7Kz9kSWv010tX76yK2BhlZqBBIbkw/3uI7QIlLnTSgag0a+lxb5SdjhGXF0b6YDRpl/yfollKo2XKx1s39XlVivWbHSNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712612604; c=relaxed/simple;
	bh=apa8Ycj0j8naOvh4JelaV7kxni6AgMh2aaN4ewxznek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jyWPsQWpjOVgnz0U6TmhxUVk9CZsKsMLVYSdnMveDeRxZfhepDh8xNBBZ6JYYjm7pwbaGgF68Zns+0pBh0s3b8CNMvYEAcmHLPjlO/f2aL94Uo9UhbHKL74xa+94KBU76zySKbrU1LDn3gdUAHBpsKG8WCDz+9+b+ETiFFH0RhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4RI5gKdo; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4RI5gKdo"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-56e4a148aeeso613363a12.2
        for <llvm@lists.linux.dev>; Mon, 08 Apr 2024 14:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712612600; x=1713217400; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4vQAFlYG/6Qo7oBuCHhBQsEdbkR4a/vMZEqym2juF0=;
        b=4RI5gKdoakkjRZu75uvzivITKQ+TpPi8GLVUVA6DZ6kzU2BVqIPrqlBKqxYBysdunY
         NUVUKJHf7KxRPxOO91Fjdw7N6ocduYsChovgeX4RlHXJtovuseg6NPMWAx5YvKvk4TKT
         MsFWht1TJ4P+TOrBES+R8+E7OD/5k2KKrT2TtBdi367Hckl6FFiR1ez+rM9eTJHpQ1jj
         XmjVSTOAa9L1OZPQsW3YK/qwiPF0XhJQ2Lc43DtX8GSfbtEYfZW66ixJQXSXJ+raTkW/
         PM+bkm5N/vQqwgrw28OlTHJHBT+d9/FMGStY3gGvmsPwp4cBPbtwEIu2hlUhnBZT0VZo
         UKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712612600; x=1713217400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N4vQAFlYG/6Qo7oBuCHhBQsEdbkR4a/vMZEqym2juF0=;
        b=lOgB2Zd0Rk4PzPJuNaaHC4DpVBZ39PVUhKGXjurh4cg4c3KbQSXWqre72QHT097lA3
         0ZufFcD2az7cTxNN9B3JiWQCfObqmFCzyjzueBARk9qsKIMcW+jA5vEMgIsntBWufNfD
         m5Rsikc/PxUq5QE+RzIErs9DClJpZcKublwWWLXecWJHmkWWEEGeAW6gHhVHRMkAbDS1
         1/z0WaTElEBGBpZm3kJwd5T+ke1JhDRbxZmbBtapu0RQpeFEBggHA8V5buHuJwwbb4ph
         J+aW6K6ooFXxUf+EWuMwTKmqVUZO9kwMfzPJQQJnCvOyLfXJykhyyO58C59IHUyBfrFt
         CVOQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4cOC+gFarBMD+ecGsUpI2kLHZ+TQlQQX626AtZttWI8djVWSS7C0RKxb9mXYVJ63Kznw6iDEOzN1+7KetI5S/+frCig==
X-Gm-Message-State: AOJu0YzXM4mRQ59fyT2pnWJy8yCNamNsxwl26t10aPbrU3vDQk9Q5nJl
	RWOXMWypozMLvM1Kz8kyD+JJ9b/vS5zBsw4R+di4cZySFiWwEnDyLW5EsUdUyNqLHcis+wvaoD7
	aBKDRnWO4GsX7GDE1zHOW/FBs1YlI7R6+by4Z
X-Google-Smtp-Source: AGHT+IEm8jqnicmW5nkOw50duqY7RyFZhzu1CDgPdFVJGHa4FKyz9cRBhBph98h4jvYQzNt8e3LA//leAkZ5o070rS4=
X-Received: by 2002:a50:8d15:0:b0:56e:ddc:17ad with SMTP id
 s21-20020a508d15000000b0056e0ddc17admr8315004eds.30.1712612600330; Mon, 08
 Apr 2024 14:43:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240406142337.16241-1-erick.archer@outlook.com>
 <AS8PR02MB7237E2900247571C9CB84C678B022@AS8PR02MB7237.eurprd02.prod.outlook.com>
 <zrqicnpeu52n42yulmrupxmrejd7mhbsu35ycd2bgfjz6gmm2a@dtpv5qdxhmnu>
In-Reply-To: <zrqicnpeu52n42yulmrupxmrejd7mhbsu35ycd2bgfjz6gmm2a@dtpv5qdxhmnu>
From: Justin Stitt <justinstitt@google.com>
Date: Mon, 8 Apr 2024 14:43:08 -0700
Message-ID: <CAFhGd8pFy5=BYcYr_fa4fkLB54ktXRwS=QVJunzMd5z15RYDaA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] net: mana: Add flex array to struct mana_cfg_rx_steer_req_v2
To: Erick Archer <erick.archer@outlook.com>
Cc: Long Li <longli@microsoft.com>, Ajay Sharma <sharmaajay@microsoft.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Kees Cook <keescook@chromium.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
	Shradha Gupta <shradhagupta@linux.microsoft.com>, 
	Konstantin Taranov <kotaranov@microsoft.com>, linux-rdma@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 8, 2024 at 2:35=E2=80=AFPM Justin Stitt <justinstitt@google.com=
> wrote:
>
> Hi,
>
> On Sat, Apr 06, 2024 at 04:23:35PM +0200, Erick Archer wrote:
> > The "struct mana_cfg_rx_steer_req_v2" uses a dynamically sized set of
> > trailing elements. Specifically, it uses a "mana_handle_t" array. So,
> > use the preferred way in the kernel declaring a flexible array [1].
> >
> > At the same time, prepare for the coming implementation by GCC and Clan=
g
> > of the __counted_by attribute. Flexible array members annotated with
> > __counted_by can have their accesses bounds-checked at run-time via
> > CONFIG_UBSAN_BOUNDS (for array indexing) and CONFIG_FORTIFY_SOURCE (for
> > strcpy/memcpy-family functions).
> >
> > This is a previous step to refactor the two consumers of this structure=
.
> >
> >  drivers/infiniband/hw/mana/qp.c
> >  drivers/net/ethernet/microsoft/mana/mana_en.c
> >
> > The ultimate goal is to avoid the open-coded arithmetic in the memory
> > allocator functions [2] using the "struct_size" macro.
> >
> > Link: https://www.kernel.org/doc/html/next/process/deprecated.html#zero=
-length-and-one-element-arrays [1]
> > Link: https://www.kernel.org/doc/html/next/process/deprecated.html#open=
-coded-arithmetic-in-allocator-arguments [2]
> > Signed-off-by: Erick Archer <erick.archer@outlook.com>
>
> I think this could have all been one patch, I found myself jumping
> around the three patches here piecing together context.

I now see Leon said to combine them in v2. Whoops, sorry to give
conflicting feedback.

>
> Reviewed-by: Justin Stitt <justinstitt@google.com>
>
> > ---
> >  include/net/mana/mana.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/net/mana/mana.h b/include/net/mana/mana.h
> > index 4eeedf14711b..561f6719fb4e 100644
> > --- a/include/net/mana/mana.h
> > +++ b/include/net/mana/mana.h
> > @@ -670,6 +670,7 @@ struct mana_cfg_rx_steer_req_v2 {
> >       u8 hashkey[MANA_HASH_KEY_SIZE];
> >       u8 cqe_coalescing_enable;
> >       u8 reserved2[7];
> > +     mana_handle_t indir_tab[] __counted_by(num_indir_entries);
> >  }; /* HW DATA */
> >
> >  struct mana_cfg_rx_steer_resp {
> > --
> > 2.25.1
> >
>
> Thanks
> Justin
