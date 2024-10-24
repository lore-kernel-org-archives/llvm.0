Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85DF482EB
	for <llvm@lists.linux.dev>; Thu, 24 Oct 2024 03:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729739215; cv=none; b=MJCYN6w/Es1CGZzkQGAMKc+WWX1hCvyh9Hy0TJqe5kMJtovS4rYBWKwH/SpaOIGzMT52/8TzNNq/S0oouJzSKARRyiCuHHudZvibVP3X0GidyoXStY+SPsYkCrkKT/8FlkD5Bys8stG7NES7uJrUbucM+ZuinjrE2uzvhJUsS9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729739215; c=relaxed/simple;
	bh=CeS6D+1QUXlEuEpzlKrZVqshJgh+wIneCWMkJ3VrhIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u1VevOnbwm8Vj7BlvLeRQbaxSU7zDoblguGUm7pG45Ol5VAApdktdLMNUC5bPEPMWrFY/mcyNgmEblEByltp6Pp5PtK7Wf0t/hVbuVZryTo9onBGYEsLRjHyivfMTvw6gcTucNCjWq9dLTlxTQ/d9RsXLAoOmPYnUVV92hfBqLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esTMqDRX; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esTMqDRX"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5ebc0e13d25so152957eaf.1
        for <llvm@lists.linux.dev>; Wed, 23 Oct 2024 20:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729739213; x=1730344013; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CeS6D+1QUXlEuEpzlKrZVqshJgh+wIneCWMkJ3VrhIA=;
        b=esTMqDRXyEMuyGnEqi7BzEz8tnoa811Q/bBYovNtlaazWNBHgpelWkPAwjy5gZjuwC
         VxcoA9y2AQroN6Pyyw4a9G9iBGG2BfKqBxyvhZX4q/2jdpiwsenryzQVwQjoZch7vFCR
         fx++ePr1W7gqJ5aZCIljILcXRTZCgI0vinxREoYqdjSt44CAWOE/K9yjsAGA+jJAI8DT
         B6OCvkifgTZdqbuF1pxXDkS32P2LiByZBNgoOM9895EvUbtdPxAiu+Zgfu++7zW9U+WA
         yWCB85K/7gwYBXxRJr/sUkbbiga2kwhCwFKGhe7n3LjZl8h+ynoOCyKV/mfB45JlHqam
         vSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729739213; x=1730344013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CeS6D+1QUXlEuEpzlKrZVqshJgh+wIneCWMkJ3VrhIA=;
        b=Bbqft7Xtf5b1XJdJJlCiy/GUCKkSehhB0wPv24elFPTVK+SLZzawIcbyEMJflskXs8
         xJollYjHyLCkGPiZJfr3dFOmKb7L7FWUQetsYHV+jjb02Q709g99afBkLBxdvGK7D2E1
         bSoY/CGDZMedhEpvpQMxfLId4zVjJU3O5gKvAsYdvhA9C3k/33HgOYG6/p8EEurbqCKd
         OGjKevSPHqc2O32ivdCPMFI8BiRe3Pk74UNTS2j4pez2R5+cvPi0gagIfKohC+9xl8uT
         HOZrLVTG4EFOM/bzr/DvmujNulqvfzUy68nwCAk95xljgGW6cWSpQnso50mt7YF0BE2B
         zBXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCZxJfkJ8A6lFG9RptfQly2xjKjh6sD44H7aV3Ork3PrRGoBRD+tILu9WTUVw6BSZr29LW@lists.linux.dev
X-Gm-Message-State: AOJu0Yyhhp/12nOvwpGGifQxHbLgdUGnTD780+3qtiuru1I+IzdIrJcf
	6kzNx/xmW5f/10vTO6sgzyfzAdWbMuMJIsMu05Y+ek5uhneBHyJ1RK9zCwcVqfA+CKkRMBs05ga
	tgBEBj5zwSiuTC2SJTRkY0u25xbk=
X-Google-Smtp-Source: AGHT+IF7Kh6NVN/AxY8rAa46rAxHbFpWSG21XNJdoakKmMbz7auztoXmMnfDI/WsA/BeePDLnogiyXrJZfyoAqBhLk4=
X-Received: by 2002:a05:6870:a990:b0:288:b220:a57e with SMTP id
 586e51a60fabf-28ccb68fa1cmr4788549fac.40.1729739212713; Wed, 23 Oct 2024
 20:06:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241023062750.849951-1-dzm91@hust.edu.cn> <46e54088-ad96-4387-8a39-2e4686c842bd@gmail.com>
 <345e8f10-fe1a-4736-9468-7c92ac55d62e@hust.edu.cn> <e0c34a1b-6801-4ae3-b04f-56dbce5c76d8@gmail.com>
 <CAD-N9QV-EBbSkrZ5TSUt7j3MhsAHMozY59gFOEnSQ1HB9cUsZg@mail.gmail.com> <8a8fdd5a-44e6-42b9-a920-ff00ac7dc57d@gmail.com>
In-Reply-To: <8a8fdd5a-44e6-42b9-a920-ff00ac7dc57d@gmail.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Thu, 24 Oct 2024 11:06:26 +0800
Message-ID: <CAD-N9QVHxKUMu3AWvQ=GMA_YOMLVrz29-pNjWeVmn7eO=_DE5g@mail.gmail.com>
Subject: Re: [PATCH v3] docs/zh_CN: update the translation of process/programming-language.rst
To: Alex Shi <seakeel@gmail.com>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, si.yanteng@linux.dev, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <siyanteng@loongson.cn>, Jonathan Corbet <corbet@lwn.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	hust-os-kernel-patches@googlegroups.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 11:02=E2=80=AFAM Alex Shi <seakeel@gmail.com> wrote=
:
>
>
>
> On 10/24/24 10:51, Dongliang Mu wrote:
> >>>> Hi Dongliang,
> >>>>
> >>>> Good job! Most of translation are good.
> >>>> Just the above doc seems still English version, give them a zh_cn na=
me may cause misunderstand?
> >>> Oh, I see. However, you cannot use gcc or rustc since it already exis=
ts in the English documents. We need another name to make sphinx happy. The=
refore, why do not we directly use the final version of name? :)
> >>>
> >> Uh, is it possible to use English version 'gcc' links in this doc? Oth=
erwise,it make sense too.
> >>
> > https://lore.kernel.org/all/bae3c59c-39a5-4daa-b37e-bbf077d57643@hust.e=
du.cn/T/#m8a948b24401404806f53e086f57856cf3a56a490
> >
> > v2 patch triggers a warning due to duplicate links. So I crafted a v3
> > version to use zh_cn prefix before each link
>
> OK. That's fine for this patch. But for long term view, it's better to fi=
nd a way for duplicate links.

Yes, I would like to keep it the same with English for now. Then find
the Chinese version or translate in our translation team.

>
> Reviewed-by: Alex Shi <alexs@kernel.org>
