Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEE11487F4
	for <llvm@lists.linux.dev>; Fri, 18 Apr 2025 17:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744997529; cv=none; b=O4jsIC7Ho4POGyVNDHwAMZUgkZ+IogxEty3ncMxPOQWUvm8WJy2fdIbSdELIQuU+rMPf4G/w/Vv8EXUPyhxty30XjoYJAY0+8WeQMWBhYhLwWB3ptIk7bblqmJkiGtqInMddX/8sXbJQvBkeGvC4HieaJ6Fi1CAkX3zU2arIg+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744997529; c=relaxed/simple;
	bh=jSTCp2ymmy+uFfuftaWDUvFGRj6+FZVVBdAZvDVOzIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UvptZ3dNQN9Di+UrP277dJrfwFC9Tu/oTilUlZYSSYnP8LRwevuH9w2o1Y1K0i4/2yzIQ2wAX8IrvQpO3Xf/WHBcfdfrrBTOIHfUsflfEDzHTt047Wdt9BXYLBq3HcmsqHNbLgtcFmgJi5rwxoVc2asNwbcUS67L1mSrjBPq1JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iRGarNeG; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iRGarNeG"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ff67f44fcaso354593a91.3
        for <llvm@lists.linux.dev>; Fri, 18 Apr 2025 10:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744997527; x=1745602327; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Clva0yAp0RoLW6mZT6T6ibUR6yq4KrFi2ukw098Q4NI=;
        b=iRGarNeGHqoDb8IEZy6F1zMbMvtjKFJnIc8jzxgurWL5bQfjd5cewY0/wneukJrXTp
         6WFIWsR3k9BsSS0iY7TN3fSEDib0wGNNawo4kleIm+tLr/m2C0au2Jeu9GwzfoHDFgQe
         hqMeYr2UeTkHdDNBiOXZIOJbdriA3dAL+Ayd69Go6lad/A/fCc2kD+ADQwpsvvzwWZ4/
         2v+I+uAf+pSA1gf5vb00T1ABJyAm+ELimrdKNn3n0Wk+/2LRBOGvJrI70/fG6D6FHtbc
         tAtQcPzdPh7pr9ejPQPkiBAhTt+J9jh7jp3sEqLnYJgUDj4Z9c9puda4goF9o0L4zJ7K
         lHJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744997527; x=1745602327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Clva0yAp0RoLW6mZT6T6ibUR6yq4KrFi2ukw098Q4NI=;
        b=pUOUOKhhCY+lP9ogJLW/WMk7TJ2Tx/Qd5RwfrcvrjjNTLFcaIY8+LhvrsQcLGi/o+O
         Onfeiz1K1zUh892jv5RiK2jpFXJaFvxfimKpAGW1TAbOdbOJ4HkKWFtDbFr92py2ccIl
         OT+xN9na4JgX7x6cdSvm2ZsGyKup798mfBD0TOIQzYIGWiss6AzB/b0PtBHdewgAtGdS
         gWyKyxOax7P+KSrhCRMuq3GUhpJcGpKeepStbIa8GVeVXFxNhEfbyTWKiIFz8wnDlk8b
         OTybUFFDrMZpGEE4BYAdeOiqk9SOA9ry7wn5AGnAEBiF4o8DPY4+cLj5lbVerks4jGgK
         vhHw==
X-Forwarded-Encrypted: i=1; AJvYcCV+133gqTRyfSVHgCfS4N9qRB2JD/EBhD8SzBh+7Zkb4Fb6zK8Idt2kS40ZsoJ2shC0vwFk@lists.linux.dev
X-Gm-Message-State: AOJu0Yzk55ZROQRFi1Wzjdon8aQngI8PDguz68yN3r6FDFa8k0O5RyvV
	MXjjUYDM45d44z3FQTva6C0GV93GYLm+pMMqbanS81E3WnJ+tPSt203mLgS+5Umc7R7txfCYSMq
	u0L9cTU49YIvjw295TKE8h/u1n7I=
X-Gm-Gg: ASbGncsn1XBYCSNZ9biLYBMXSSzXVboGT/UW/k5IrCwvprgiuSogqo9Uh4uaXPxwlHe
	5on63iVr4wyiBUZhSXc1IsjsVjQGpCh0KQqSVpbj1yKb6MDZWRoQYI7+ewLvXt2N1HqgnNsWkXD
	meut7yhW/We8WVvVDwtiofdvu5H4gZH7FK
X-Google-Smtp-Source: AGHT+IFGCB+IOuDYclJ8K61LbsGJh6E+OoMCYw0lXGpYH6TLuQWhjPe+Saon4Pg8jZd7JDF/yt9S0IEpG25rHBQctZ8=
X-Received: by 2002:a17:90b:3b82:b0:2ff:6bcf:5411 with SMTP id
 98e67ed59e1d1-3087bb313f0mr1841717a91.1.1744997526982; Fri, 18 Apr 2025
 10:32:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250418161005.2425391-1-joelagnelf@nvidia.com> <20250418161005.2425391-13-joelagnelf@nvidia.com>
In-Reply-To: <20250418161005.2425391-13-joelagnelf@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 18 Apr 2025 19:31:53 +0200
X-Gm-Features: ATxdqUGpUf8fRAb7yDV88wH9iP1OHvfJ7PWdDSkSTjg_35u6EVKbNRdG09rwRpM
Message-ID: <CANiq72nCfBdsfKzP72DWxLBh+Eueack9sS-E97wtsr0UtkAnUA@mail.gmail.com>
Subject: Re: [PATCH 12/14] torture: Add testing of RCU's Rust bindings to torture.sh
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>, 
	Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Shuah Khan <shuah@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rcu@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 6:10=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> a rust_doctests_kernel kunit run.  Note that kunit wants a clean source
> tree, so this runs "make mrproper", which might come as a surprise to
> some users.  Should there be a --mrproper parameter to torture.sh to make
> the user explicitly ask for it?

One may run KUnit without using `kunit.py`, i.e. by enabling the
Kconfigs and booting the kernel. Would that help?

Cheers,
Miguel
