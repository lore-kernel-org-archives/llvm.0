Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16D91EF391
	for <llvm@lists.linux.dev>; Fri,  4 Jul 2025 19:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751657950; cv=none; b=oO/3NyMbIqWEXSB1yHtcGhhfQwWaHkKsEFEb5hmjriXa8MMJpISOE4wtgPL6eFJrYzapgzYLZXiA3yckEv2BTuz8yhNbQ+aGCbmMg42B9eB0jaOw1ynPPJYzfo+81nihFg9NBsNFJdIT1nEKZkxKC6HMMffE5W7y1Rtw/ezmLb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751657950; c=relaxed/simple;
	bh=q6BEyCDqiSgiBGBJ1ZkhyuwdBxeuGxHXg+GwZGubRJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dn+m5rqJZqyMcWYlzBMAzGQbbHi1qQ581TufEyw9ntmcbgmnfGuO365k3EzAE1YQQrh8kCg1Ub97XAZSkt0WG6xSrquPN+Y9S9pGj5odYpzx4c7NIG8FzUJskaAxumtVd4qR1q1hrdP5z/sxvaNk39qC+H5Ei536L86tW86SuC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYzxajz2; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYzxajz2"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32f1763673cso2316641fa.3
        for <llvm@lists.linux.dev>; Fri, 04 Jul 2025 12:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751657947; x=1752262747; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6BEyCDqiSgiBGBJ1ZkhyuwdBxeuGxHXg+GwZGubRJQ=;
        b=hYzxajz2McIOJPjB3UIkcpwhfhhE7fZgRAtO9BE9jPIxw4bUJMrjmyZ4ba2O+V2Se0
         kGr5jW2QUniOwWSKLaga0CVSUvkB4sh3uP+hXL7g6AssTioExdbuZxJwTxUFtaPeQlFK
         sq6D5/+cunktKCan5xENh6kpraIGC1xTP55P6zGNeWFEd7YuJu7eAKIdwYAT4FVoNmPr
         N1BecyAy98x5Hmbq30mD8W8MH1OR/o5sl3DTmc/wACQNT3W5LSzmSsbyhQR3aNppN6Aa
         q35hzEdXUv0i8SlIlOvkqxU/p5uiiVIpzMTrCs4LJ07eMlfUdTtrSHdT32UP8pAe4sx+
         nqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751657947; x=1752262747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q6BEyCDqiSgiBGBJ1ZkhyuwdBxeuGxHXg+GwZGubRJQ=;
        b=L9WOGl4ZFIZf7mUgoRiaXMDcQkgrz0L127t5duE1SUlKSDI34WVqaCOyyU30QTOca4
         ltqd9X8a2VlvHoTcL/yFt1ukEpkADp5/cpW2sT7249YnWbR7ZN41FQV4m1CpE64S5eoI
         tZ3uWQuhpu7+ntsUVMbjHJRnhSR4+dMgUehln/3S1MXjwL1C412pSswsr4AoTbhq1aaV
         y5pOlB6teZAeDOavYA1nzsZjaCeouzkqHdzbIkzfGa5fvKCpSvy175Gl/1UCfJgAGupU
         IvrQK/+OkLH2foR+N2FJ4ToJKih9bGNMaxdlMcTlqj1EOthwoik0mlzvR3kAppVIGdKw
         9S2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV0TKataJsLc0wOAob1BJjAKv703znIzqZWm58+Y8AwjrglCFYcbJhIiA35/4rNa8fKIGKT@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6HVly99L/PEVNlR9AXaNkyQc/GGH5yFC5tcwBCmam30tp/Dyt
	sPlh5UF+1XTLwyxQEopHysDHZHHhxD+mYVDZnAQaNPEuC7liZCK5vGoVCydhjrNkbue3yOGf6DJ
	4dVnx7n5MlnPvTg/k6MzilwDJDzm5Hes=
X-Gm-Gg: ASbGncsdHmT5R+cFAUWV4TpIQbqW0YgWlZfuq+V2ACuqJ0LLXaXMp0SPHqLsc31RZVR
	g8F9+YC5IP70m8oqO5iXobmnBJkj//hYbVvDnwXlP28PbuZpmpFeW9VyDWDfqA+RQpeKT/SmsL/
	lB5pq2zGOsC2Hyue8ZLqQY5A74cAmEuQBIIrV7C4zqqI2vhbOx6OnDZVMeQ+tuEWULVsnBYPC93
	vAHvQ==
X-Google-Smtp-Source: AGHT+IELI7uW8JvZwN3QEoftXB7GsVNoqVv/ET67tZt2kJkg2u9kQKOlY5/6R0W6vFvmdwe3YBxK7+LcpnDSocUkLi4=
X-Received: by 2002:a2e:a554:0:b0:32b:43a3:68a1 with SMTP id
 38308e7fff4ca-32efb0afa55mr11642311fa.0.1751657946651; Fri, 04 Jul 2025
 12:39:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
 <20250701-cstr-core-v13-4-29f7d3eb97a6@gmail.com> <DB3AGL1QO4M4.2HANWHX9TF9WN@kernel.org>
In-Reply-To: <DB3AGL1QO4M4.2HANWHX9TF9WN@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 4 Jul 2025 15:38:30 -0400
X-Gm-Features: Ac12FXwvxhLPYgvBPM4F9xT26zkuHTZMocL5-5BvcjZhSL1NesztAaUplyK7LaY
Message-ID: <CAJ-ks9kcW8PzUWPmwo-WQ1dJTgoXTvY6G8UppsLKehf9O0bUqQ@mail.gmail.com>
Subject: Re: [PATCH v13 4/5] rust: replace `kernel::c_str!` with C-Strings
To: Benno Lossin <lossin@kernel.org>
Cc: Michal Rostecki <vadorovsky@protonmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, llvm@lists.linux.dev, 
	linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org, 
	linux-block@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 9:01=E2=80=AFAM Benno Lossin <lossin@kernel.org> wro=
te:
>
> On Tue Jul 1, 2025 at 6:49 PM CEST, Tamir Duberstein wrote:
> > C-String literals were added in Rust 1.77. Replace instances of
> > `kernel::c_str!` with C-String literals where possible and rename
> > `kernel::c_str!` to `str_to_cstr!` to clarify its intended use.
>
> These two things can also be split? And it should also be possible to do
> this by-subsystem, right?

Yes.
