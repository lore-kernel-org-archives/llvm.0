Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E4E1459F7
	for <llvm@lists.linux.dev>; Wed,  3 Sep 2025 23:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756942039; cv=none; b=uiRaIrLIcu29JysYVRU2nZU4+n6D2r8KF7Ej4S+fdTYPygPUqqCpzwLk7/FSTXfJ5M9r6j4FhhCssu8qI/eGuMnGoGK54VldcXR+ruFd+amaeNiAA38z0ENehTLuwopgPaUPeUWEJwZA8cDNUpQsEkJCI6wDDf2NLH80X8h3LEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756942039; c=relaxed/simple;
	bh=agSZSZe+tQVZN8rhVQvwRsToQCPpFg14KIdGBgQcrtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qCJxMXh7YlfAO0sQNoKXpuOCbCVpxC42ORib+LCj8XIrgzK1Tt5AeuL7ZCcBfs4YIlI3M/EmrqcXsXCOTTnwvPRNdive9ezZXI716XQbkukye/gVD+u9IpbIgbuT2cUtlCSHx9z7ZA4d2zOJsyeMAnoZXjCWsd8WwPbO9vElLwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8qLXkpw; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8qLXkpw"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-24602f6d8b6so758795ad.1
        for <llvm@lists.linux.dev>; Wed, 03 Sep 2025 16:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756942036; x=1757546836; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agSZSZe+tQVZN8rhVQvwRsToQCPpFg14KIdGBgQcrtA=;
        b=G8qLXkpwBrwHuP0TEO0SI/iwwmPgJP/RwIq5vUZp+UEvr8R/4NDIeTry2WALpivDWZ
         UhGR5HGpFnuJPwyQILPyfd+FDo9aOgD9dolLwQnj17Fpx6s+fTo64Se41+8eppE9XChS
         J1WVr6yAQGRal7pa1+sKVEaDNWS4J1W4DtwRqERv2ALX5YJRkzCFBbdg8YMmxf9mC3Fi
         S3A60h9UJylCdtuGn1h4wnntxSrlUw8wbVc3tAvsbDPcknYhDC1dlnxRFcb/VuEDfi/J
         UPsTDSpbI+tN7n3b93j2kkpmT81J5kET3/Gup7ndQvB9ib+eRPpvP9Ht1C6+vHy0H7Jd
         opRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756942036; x=1757546836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=agSZSZe+tQVZN8rhVQvwRsToQCPpFg14KIdGBgQcrtA=;
        b=F01aKk3YaumQgy60PT6oxCnCCGexhgH4DHNAosWXPAKNaX7Y5wpVrq5V2v6QL71DqL
         7y810Al+gQw0CZdNe3Yi0XozjFY9IYjBJ4tnC7uEqa17e5ylRqY2LK77OhyqQJ8goDk8
         v87GnBgRO+NvY92YqHayQXgnMtUn32l+D3zsLbi7pjCweLPqjOijJ7d+AknEzDGzPAaH
         RnpZNoSNqZ33+JFEdxs77rkbmx7LnjMr5rmvrcAwbJMmg+FB5rCwypvT4lMUxva4qCVH
         RQif09QCyeZiPvididIFWmfjazl0KtI8TUGXWu50bio/xMVnxT+GOKnOiMXWzApU9Vqa
         WIhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcCIvE9Kr+1V4tLLvy+ZlSlkH8mQAmpuRacmHqclkctkFE95WlmQHWBSLA+2U7iqd98gko@lists.linux.dev
X-Gm-Message-State: AOJu0YwYqIQiIr8ZW4Jrf407MeYWKBWIPHsd41JMXByIYbiSu5LZEFhj
	Qz2RLkgWMzdBwa217mP/ne1h4MIc3fgImS6GkMGti4Px3mrESzubpORA5MKeY6eV2QAozBqSoj6
	PPpgWtjyxODDptyqngIcSps8cHMcoOws=
X-Gm-Gg: ASbGncu9pHms7AKEM/gFVkPmXHfXxQ0lIPPfyr0RlivyY4PFefF2u1y2axg3uXSo5FJ
	N4pkr9AWc+fIyzG5Rs6fgGlljVshgvQmydJAjU0Ot54ud5BDt9wzE1Ye538eGI8QbfdPdhpdyvX
	TrP/f9lxu62onGZHeiKrW2gVp6Gj46H0BhFTDkZESwWIvyC2Gew4jQj3zOp7Q3Q9IxAStXl4ikR
	VlcKrKiiRJzolMdnf9tlZufiVFblYGUbOygnFrk7KZjJhFnURmph6yWAjP3eBpq1S9Cy0vcZmEm
	FE6bGy1pv+NDYEi4LYExm6Yz2jttGCWe4KE1
X-Google-Smtp-Source: AGHT+IHTidnBVrl9x28IZyAbFtRyk1faHWra3cfcqzPBbplLrvafS2wCVDCjldwrmyF+S5C53slJRXjDIWwmfw6CDg4=
X-Received: by 2002:a17:90b:4a8c:b0:329:cc8e:247c with SMTP id
 98e67ed59e1d1-329cc8e278cmr7164799a91.8.1756942035722; Wed, 03 Sep 2025
 16:27:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250830-cheesy-prone-ee5fae406c22@spud> <20250903190806.2604757-1-SpriteOvO@gmail.com>
 <20250903190806.2604757-2-SpriteOvO@gmail.com>
In-Reply-To: <20250903190806.2604757-2-SpriteOvO@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Sep 2025 01:27:03 +0200
X-Gm-Features: Ac12FXzLAKLE3bvYxnCEro37dgST78_dgCYHlfdxLKDH7Bk_32DLgZHXXdMAE08
Message-ID: <CANiq72=FJSRwOPNG4ZFeoex3MssTjmhozp5Xd++PTCCSJaJ3hA@mail.gmail.com>
Subject: Re: [PATCH 2/2] RISC-V: re-enable gcc + rust builds
To: Asuna Yang <spriteovo@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, Jason Montleon <jmontleo@redhat.com>, 
	Han Gao <rabenda.cn@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Tejun Heo <tj@kernel.org>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Matthew Maurer <mmaurer@google.com>, Jeff Xu <jeffxu@chromium.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Jan Hendrik Farr <kernel@jfarr.cc>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Christian Brauner <brauner@kernel.org>, Brian Gerst <brgerst@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 9:08=E2=80=AFPM Asuna Yang <spriteovo@gmail.com> wro=
te:
>
> Commit 33549fcf37ec ("RISC-V: disallow gcc + rust builds") disabled GCC
> + Rust builds for RISC-V due to differences in extension handling
> compared to LLVM.
>
> Add a Kconfig non-visible symbol to ensure that all important RISC-V
> specific flags that will be used by GCC can be correctly recognized by
> Rust bindgen's libclang, otherwise config HAVE_RUST will not be
> selected.

I think the commit message should try to explain each the changes here
(or to split them).

e.g. it doesn't mention the other config symbols added, nor the extra
flag skipped, nor the `error` call.

Cc'ing the rust-for-linux list.

Thanks!

Cheers,
Miguel
