Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE54521ABD4
	for <llvm@lists.linux.dev>; Mon,  7 Apr 2025 20:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744057527; cv=none; b=oXcUK39bf1pE4+fQNW8a3lVH2PIZLd00zU3I3EAjbS1ltMcmp2p0jJfCmjiK5p1fxGeROegW4tIYxYSP1CCs1inJacYg/YbsPIaZAe2HmNg//E12+coidKwXG449QPcINYTjDNyeWAaLDMSvaHXUqfpP3dFk/SLwUjGgaZtQTGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744057527; c=relaxed/simple;
	bh=LvjjTUBL7nRo0DS6OmeCHChrliSBmLsfHeg9Df9+4bI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IAPhbZpKKVt1VA+IWkNpsm0elSShcWXPurY4oC3FopZvgJIJV8L0ByR2jZWBLdoK6FXap2fhekjIz6jYuEfrLinD8CUwHWte9BaIXL6Nu/3i30PSHwi96spt5484NgFe10BJK8yNrZtOFnXheOhKrcHTQYU8sqsTmZEehf/B61Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=TsOT6ojs; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TsOT6ojs"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso7524916a12.0
        for <llvm@lists.linux.dev>; Mon, 07 Apr 2025 13:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1744057523; x=1744662323; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oZ0zUiXGKdgO4azOtSCYJ2wFMy4AzS9ZbaPfuT4i/eM=;
        b=TsOT6ojsdS/3gsby89+hPpGy/6Ra8VyUOOCuNPVuDLgjTX7DlmPwS9Nf+76+T8mbM6
         77w0umn1YusH7EdgIc+ovn48uM7q/P34Y0Pe1bdSV7uVocUSCf+bn2GgnQ//q52gXFPe
         NhqELBzUzLiOrr84T31gZPXwwnyLD0gzWcvac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744057523; x=1744662323;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZ0zUiXGKdgO4azOtSCYJ2wFMy4AzS9ZbaPfuT4i/eM=;
        b=kv+ICSXGoqFItGZt/b5YEjGxuc+jKAmfbGRBHCImmDkB8q53h8NwA2tMNAngpmPdnt
         llu8gehbnkK+g3D9ka8lu27wTRRZT3EbSkykRNQAmgmwfHhWMpjh8JPjOwF+QlFuYkZU
         BX0pkriFRo3sIEsS+MgOROs543v+LLjrd7omtyLQyJBr5yxO/yzLUXSvcVFWewbJusWV
         D47xTrIHQJYqm0LvoNxULF6evTgCUsXBONyE+KTk4EkWdden4kK/2DM1GoLbFDm4oCK4
         LB3FOF4tDupi747OukYSqZWZYAkbzAhKrAuY8zbc2WXIVmy78+FqutNZr+SDpJa1sGek
         OTrg==
X-Forwarded-Encrypted: i=1; AJvYcCXA21JrX9oI2yFvKqvgMjIkSH+2KxyNj9Yyys31oaY+n8BwG45x3RJj7bJzrjoDC4KX1kaq@lists.linux.dev
X-Gm-Message-State: AOJu0YxWaSlYn/5421js6evMbybPq+gx1wYnF2MkJzNHlRsk1G1L5b50
	nkYn/eKZJqCHC0/8RBtiXD2nMyVgcWM+9v/53r/EG0wRcrNRvX1MPINSZeEFUgRzHfjDb0vZgoi
	9Tyk=
X-Gm-Gg: ASbGnct0+Pfj/2S8Mb6ckqamlmVqENuLkVbleqzxGo5GtRsXkE6hN6ytbYYH5bBly6/
	cGG2/UVfqlYfNh34bv+YzUNA0akSvspFoCw8pNIzIvQo1H2tD+1NPbyotV1Eax8P3CkBlcIrwN1
	Co8pDozTRPZeL63POj7+Z6gxeFkWhWeOX6AV9PXL6UO6GpkKTrLhBvzrETGQFId7u6MZCWUgfEe
	fyz9FwQAwag52lq+asVkW+IxVlXWSbFdM3M8XQQsyp18Phjwq6X7dcCJ4xzP4I06e+m3OiaDfgk
	BUT0mB/xfNjR/W9BTLtB8424VkzYd82HRJJT5KnvxqNNMef618YeSTuxnmermCdHYPyro7JFw7H
	AxxwVZ1E5mqJHGaKZUWU=
X-Google-Smtp-Source: AGHT+IHOiBeVzceNbQ5c0fOs7MLbNIzRGx5xO4Ja8fWBEQuk84eaN8u4G15VuwWlQh57HEknY3dokQ==
X-Received: by 2002:a17:907:3f89:b0:ac6:ba92:79c9 with SMTP id a640c23a62f3a-ac7d6d033bamr1126161366b.18.1744057522919;
        Mon, 07 Apr 2025 13:25:22 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c013f2a7sm803120666b.103.2025.04.07.13.25.21
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 13:25:21 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac25d2b2354so887329566b.1
        for <llvm@lists.linux.dev>; Mon, 07 Apr 2025 13:25:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWPOyut8sKNZ6Xj0Q+MsF1+0j7sz8O0LHQY3GkuPGstH+rHSXPuOtGpIA8Caq3GwyN79Jo1@lists.linux.dev
X-Received: by 2002:a17:907:720e:b0:abf:6cc9:7ef5 with SMTP id
 a640c23a62f3a-ac7d6e07739mr1134446266b.47.1744057521070; Mon, 07 Apr 2025
 13:25:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202504061053.F27227CA@keescook> <CAHk-=whVfxi4KRu-H=tsgSdoGdDz1bvu0_miJT0BTgAf4igpdg@mail.gmail.com>
 <FFE5FB0B-CC92-4A25-8014-E7548AD1C469@kernel.org> <CAHk-=wijG2dSOOFr8CCYygwxZQxdTUj73rfB8=tyZP-3G-8-og@mail.gmail.com>
 <20250407173741.GA3847400@ax162> <CAHk-=wi89ogViEN5oTBmcNQXnMEB5_Qse9G401pSNzocP_dqQQ@mail.gmail.com>
 <20250407192537.GA518371@ax162>
In-Reply-To: <20250407192537.GA518371@ax162>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 7 Apr 2025 13:25:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiQgK1ciFurQcHib8gF5oD8ZrWOaCPLDNLn=7ZvkF4=mQ@mail.gmail.com>
X-Gm-Features: ATxdqUGmNt-Le7y3oz-w0oLuti0mExsYRb0CjSrNEPREpJDOaXWw0kBCxRew8Z4
Message-ID: <CAHk-=wiQgK1ciFurQcHib8gF5oD8ZrWOaCPLDNLn=7ZvkF4=mQ@mail.gmail.com>
Subject: Re: [GIT PULL] string fixes for v6.15-rc1
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Peter Collingbourne <pcc@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

 On Mon, 7 Apr 2025 at 12:25, Nathan Chancellor <nathan@kernel.org> wrote:
>
> or if you do want this for GCC too, unconditionally adding it should be
> fine too.

I think if unconditionally works, that's probably the best option
simply because it's the simplest option.

But I don't see 'wcslen' in the gcc docs, which was why I was assuming
it wanted that "check if it works" thing with "$(call cc-option,...)"

I don't think we need to call out the particular compiler, since the
argument against using it is not compiler-specific per se.

             Linus
