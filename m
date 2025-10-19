Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B36223DED
	for <llvm@lists.linux.dev>; Sun, 19 Oct 2025 21:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760909146; cv=none; b=cDHv2mhdfyfA5v9Ubb+4MjS+/XCYJKb8pHqksiCvhCgX1R+XJ9GORTv8UzVAAX9+LQoNjbBM7tK/Q71hytu67b/Tm2NUba/pJ4FoCmpQc1dRsR9J6RjgR+6/pJpvG0PSLGZnW+KzyyCVeO7LDLhfQWwdAlF8Cgi/6xQ4Pt4Wpzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760909146; c=relaxed/simple;
	bh=uA5vTOIALbcdwmrJpSZvDL4908AXryA4bzuPW04xPwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e+alj/gypfH46D4JaQ5JSHcZ0BYWFFo6H/zuN5XkExLR8GopJyAK1ab49XziZYpJs3Gis26fQ4e2ihT6KaL8bj412xSkShAOHwFzLZ2OH0x2HpcduNL1wbXwoyFW+oY8X/WpwvKMmC6SYQm/dKvSWk++l1lw4rS4tkqmNhdTicQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nfiq5VrF; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfiq5VrF"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2699ef1b4e3so6331975ad.0
        for <llvm@lists.linux.dev>; Sun, 19 Oct 2025 14:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760909143; x=1761513943; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uA5vTOIALbcdwmrJpSZvDL4908AXryA4bzuPW04xPwI=;
        b=nfiq5VrFiFJmd3xsRBcvojWJ3dUJ3bf5AqQIu6HPWRgDoN4hwUtooqPmpeXlf519tS
         mAbtHlW891p5tO9EXatlKQ5uGoXeSgmK+jqmbHypAE4pjVY+MVvhlVafqcWmn2zZPiXp
         5aB7ujMdIhDLuSDl9okC1VUtjrNk5VcwdxIyfCzwzrEjUfmvQGitgGmmoGujtUGFbv1G
         wghFoufwe9Sy+S9z9zAFf+oMSUXJP/2L9E3xP2OiUrVycd2Jc5B561PblCJp6S1Gwkkb
         RKHotUXVM57TXAFyrqjJDfqvqfIfqQSHYuyJguXXLGtw24Y/Ad0b7DQKJLJ/Kg8MKmeq
         +S2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760909143; x=1761513943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uA5vTOIALbcdwmrJpSZvDL4908AXryA4bzuPW04xPwI=;
        b=tpr2WYk1cqBWxI0afIELv24Q0GEhQFcKc5tgG/OQV868qdQ8oLVjNXb82koR3LoxrO
         +bj0lCMqJkM6vTdQGhNkoi2TGBVLzocyxi8m2Y4f+PN5zaDV4ThETwnf03qfgpYOr7hF
         S5pYGtvyD0fD3Wivh1OpiFZOHS6aIeqomTaqvlkPhTUGxKlzgI11pcSZh4yL/vOrcDzo
         V5/HUr9kKsR/MSMd4gI+9JhYb5PR0GHIB1XMIKPWdMi3GahhkLCgL9OHPCyPdqc6SdqA
         YgODNd/hG6ESnou+J6ec2f5UjJnXPgC/SWI45U6ufFkNSu8ry43V/irOAKV991aAcYg2
         ti+g==
X-Forwarded-Encrypted: i=1; AJvYcCWui3War7oYVAdt/iRoPZCkRihE5c6/xAOwClyrhsqVrW52tj5L8Qf7swT61IorIyXsdQ4w@lists.linux.dev
X-Gm-Message-State: AOJu0YwvJqUB41+ej656ehtr0fN1LMbP7alOuqxJc0h/dc2dA33rlB1j
	rpGvMMkd5oIuecEQg4YZq/NCdMAIuHNVFayZIokbWO2PK7IRxhE2VoyXfdGdeh8BrkZShggGve2
	O5wqvRXqAx0Olbjd91LsiNdo2WrW5cM4=
X-Gm-Gg: ASbGnctTqao7JKHxZ7s55redO3DPfxPfaTWFhrue8tfKmtXE+JTfZKTfxUpBj88qMRl
	+VuEqpAqbvPFOShEpnHtGBxk0UR9JhvJkCwFWdOsmIztz+g4cbdP1Z2/XqXlgNNbdC7YpkPqCkS
	+/Gk4TQ+9sCRwKggLdmvs2WJHC9cRxgNto9evAMNeIZeuXssrP8bU5bilCl4vHSos6+Ohf/Ofcg
	t8mOIFRZgVYyS98dORkE0nfwLfELZsQatVmszKRXaFmKQ+QipX2hRItMA2MpEAat6YeeLB2LAl/
	x+DwwiqTiXNuWfJMxh6TZJRaJZ+tji8jtQIn+aQ8MjrS7igDlcxjlK6NftuN/LtgtM3WftfH4XD
	6VkNutH/fWxBaMw==
X-Google-Smtp-Source: AGHT+IG+Xq8GXKfGoMwbFFQSVjc1IKmL7pMM4P5v7DRrKR2eAYMxLjwbrDpo8D26g74EqZuNpH1jVIwhs5ozgrDthtg=
X-Received: by 2002:a17:903:3d0f:b0:274:944f:9d84 with SMTP id
 d9443c01a7336-290ccaccc47mr70983905ad.11.1760909143546; Sun, 19 Oct 2025
 14:25:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com> <20251018-cstr-core-v18-12-9378a54385f8@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-12-9378a54385f8@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 19 Oct 2025 23:25:28 +0200
X-Gm-Features: AS18NWD0bEVrj3eqcMBbtrKdDrdonGG9WGD9YJjG46fNVzfrXtIBr4GqiIVIqEs
Message-ID: <CANiq72=c3Zs+mecvDVJ=cyeinzezhGz7yqC9r6FG=Q4HAdb98Q@mail.gmail.com>
Subject: Re: [RESEND PATCH v18 12/16] rust: configfs: use `CStr::as_char_ptr`
To: Tamir Duberstein <tamird@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	Breno Leitao <leitao@debian.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-fsdevel@vger.kernel.org, llvm@lists.linux.dev, 
	Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 18, 2025 at 9:17=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> From: Tamir Duberstein <tamird@gmail.com>
>
> Replace the use of `as_ptr` which works through `<CStr as
> Deref<Target=3D&[u8]>::deref()` in preparation for replacing
> `kernel::str::CStr` with `core::ffi::CStr` as the latter does not
> implement `Deref<Target=3D&[u8]>`.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Andreas et al.: I will apply this since it would be nice to try to get
the flag day patch in this series finally done -- please shout if you
have a problem with this.

An Acked-by would be very appreciated, thanks!

Cheers,
Miguel
