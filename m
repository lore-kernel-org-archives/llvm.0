Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C421E833D
	for <llvm@lists.linux.dev>; Mon, 22 Sep 2025 20:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758573075; cv=none; b=IG3++JWH8aBv1tjDEEpG5NYYWPiPdm+HwsUsloD9l0KA9fT4BEdOUcD/Q1MrWnx62MBPzXadCJMhK7+6Ad4bN8k27sm/8IOtsUjqOegI7nz1GCH1EXT9dMLv6ze5pqCMJaO9FQ6Q5N1NmwEB+WqikU/eog8Klx02u4EntDuJaTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758573075; c=relaxed/simple;
	bh=MJEFNOBSo3SKM5qiYRxxqoiLN0A/+xJxbSym8TLAOgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D/Lz3/rVE2pwowsrcggt4FpZzY5jOfp1lwLb2lOTm22YyeBjeqj85rKD3/IhjfMRmf8HQs4vxKE1rZUFb9kMG3o8OpLg13NCBRAcZbFi5T7htejMQQ0kR0wMUjPcn8BWLMd8jP9EObxyR+nUcnQ1wY/kut0TFcYRaPaen0+Dy70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfPnAOK1; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfPnAOK1"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2680ee37b21so7018365ad.0
        for <llvm@lists.linux.dev>; Mon, 22 Sep 2025 13:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758573072; x=1759177872; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcwSM1XGta2EiHK7PYQk1Nst2JShxKlF4k281BKxKcw=;
        b=DfPnAOK1n9cHl751fr61dNv3TVxsGbYL3Ku/W+yEBcIyOrnKjJbjpGKyqLZH5byHBG
         fH96uk/mLebq8U/nKfm7JOQ52LbfE1fooo2LFBldLacuqJ++JnNMNHi/za9qPZcFe9gy
         IhL3Ik7ssMEdahRov/xQGA6kHjKbZ2saK/+OuEZcDiXfIkrEXLHMFsp9JGkN0aUw98tj
         Jdh3qO/sBcnDlvSoxzGvHT+Nk4xM0pSg5DzBJxbFZmPmVbuT2gZmfe1OYHDhwnhv3Mqa
         w1doT3xHlxcrCrSslH+NmjX3qiqbeb3uichQyhayatYEkiEE3vJviXEpoliyE/OxQ9+/
         P5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758573072; x=1759177872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IcwSM1XGta2EiHK7PYQk1Nst2JShxKlF4k281BKxKcw=;
        b=W6zIjtmKNLuEdGF/dHqS25Sizmw6PiI+n6JkBk/oRYay7w2s2ZNKSB8mMZ94fRSNQy
         N+xaUSzqKbZEAxzeFH6yIdpEkqmPwRGYaiBjusJH9PSZkpH8+x5MjaR+0Mkb2v99rPyU
         qkNuduBrCLrCOKSz1pCFLYZkBaliEQgb3H1/zmsVsoIzz8w8XIzv1MhKls+lWKya0pmt
         V9ZR3lp7CXmsv5i9utBEtIqED+esGTuvZlxBiIfI8z/t8BTHqBTP2wc6Nb+lLz8K2z1N
         YN1HyUdV+bb6Hpn8BJViRkMd6yFaCf++0sqlDwzMfXEjz1bdoI7uGEOdCeIjrvHSqWB6
         XZLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEtvs1CunPCfEhDsOq1XcS/8s5BINFf0wBxjjMG1b8NVgfEySd1njH5AuVSEkdpw/0scI9@lists.linux.dev
X-Gm-Message-State: AOJu0YyompcMgD0byUD1V1vi/mLjoFKZCSQ+H6wM5AZs018o/0+SPKWr
	fnLyS4EfFy7Fx0i7Rqj7ljLMFgAGlssVq/K0qX35rpkCn1Yd6oed4JOeCAI0USKXiPiN7HO5c2o
	Xeddu9KV151v+nPURjGaIJHw68Y9LzFA=
X-Gm-Gg: ASbGnct7+fUxbwXKWJNn0y0kblN7pGQQQfwjObNfG6Fgk90C35fmi8+SRXoYOC99vgg
	l+/3Uurojo51RHT7FcdmSiVcmU198UrKt+Dl0pwEZ3RI75o7zYCEAdfWzAfot9gGvrjqNDJrEBw
	XV57vqywgjsOvdwYG47/CqE2dfqXR2B294tEWmpwFwtWlR6j57urnBq3TvLvtEVBpmGGzpwIWST
	/zdPy9VEyMKC1aSt+3hhLp0vyTp3Tf4etNnr0XydtFVwiCFOxAgNHaxLkYAD2zwgDUE9STwF8v8
	GIQRvAtqmM+a16fFCaEBywoVzQ==
X-Google-Smtp-Source: AGHT+IGXlLgoOnlIi0xB27xbNnE/Gt3cViOhpVvylnU7nHRlbjGJ/bgbhPyP5R4jQ61rPO6JCpcQYEV2WsDmAL4iq+E=
X-Received: by 2002:a17:902:d48f:b0:272:f27d:33bd with SMTP id
 d9443c01a7336-27cbb8b9fd0mr1155245ad.0.1758573072387; Mon, 22 Sep 2025
 13:31:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250813-cstr-core-v15-0-c732d9223f4e@gmail.com>
In-Reply-To: <20250813-cstr-core-v15-0-c732d9223f4e@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 22 Sep 2025 22:31:00 +0200
X-Gm-Features: AS18NWB6PmBlAWRUNDsKcUzY6cTwjDnURYFePpOCqHbTRGNIsxmxdgZIFpfQAjE
Message-ID: <CANiq72nyQiHCvbTw1+njf3ZWYsK-f603iY-oox=9dMyfeCE8rg@mail.gmail.com>
Subject: Re: [PATCH v15 0/4] rust: replace kernel::str::CStr w/ core::ffi::CStr
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Russ Weight <russ.weight@linux.dev>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 5:45=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
>       rust: macros: reduce collections in `quote!` macro

Applied this one for the moment -- thanks everyone!

The others require a bunch of changes in linux-next.

Cheers,
Miguel
