Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2D51C5F11
	for <llvm@lists.linux.dev>; Thu,  6 Feb 2025 20:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738872440; cv=none; b=aOM9sN9bsxKwMvVT6vfGQK7dgLqaR6lc0LW+nuL/e+mRecGqp469fAOWE22zGoVRAJzDNKwLfTTlcaL7TardUq4eBgThFsBrug6Uq4hSZEVB55nDcpbgxTQWS3pJX0fa6w80qPX0rXaq5nwEo+mQ0SxIw8ZcvIZyrgAhHWhIS1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738872440; c=relaxed/simple;
	bh=WIzcmDmD/+zJ8s5+zLwVBi39lh4YIDruox3AjDUnmYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hQHiUfBWOC0pSLgrx/I+ZCpaJivH23EB1zl9uSZJzewr0cwGYU3jZuVlCSJTxfyR+aq8B5306fw333LSmpDA7/FTq5rpSAqGqgn1AN06PbsXTQR5MLq6KKu8foBs+CNq13ymLyxwCqBPp2cspd3JlIn8XybpIABYOE7ektKe5Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oym49lGH; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oym49lGH"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2f7d35de32dso302502a91.3
        for <llvm@lists.linux.dev>; Thu, 06 Feb 2025 12:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738872438; x=1739477238; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIzcmDmD/+zJ8s5+zLwVBi39lh4YIDruox3AjDUnmYg=;
        b=Oym49lGHCkqWJl1QyxrbXYIs8YjvNyX8o/qXsI1PkV+0RgcgXCu8kvY4jMCeFxUvok
         AnnNErLQRSDqSMLTWCWgPfabpCd6mocOQTx8weCuXHhF3FkdNjWUqh5VHJuF+DU7o+PV
         K/uxlQB1+pXTNgOh/bp+hMQ3fYUH8g6EnzkARnjHOXRX4QaBg7NScKaOZ1iD9h8Z1AC8
         5lniAOuZBbL1v1BmQ+Q/rUzVq0qwV+TKoyHs9D9GIEh42IIhZFSm6TpGX68wD4eTryNV
         kbqlFS8//IjLBZgufXJLsuMgZ4p0isajDFqu0GxSDKc5MRyON4duYi4MbqcDVegh6V8J
         p9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738872438; x=1739477238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WIzcmDmD/+zJ8s5+zLwVBi39lh4YIDruox3AjDUnmYg=;
        b=PwKXAJ5hgIi2oYLTJRKIyN7UGYCivdx7ZqmGkcezh+wwR7z8fmmN9oQcu+0MxMmC5o
         FLLgOc8pJeJEVqh0Gv9Vz+TBF4AGiUQEzhBLU+TXuof/yv1jvkBnWgOT2Vsgk8JgFhFc
         pCmt72GiDbow1U06gQ+hIQ1Kq0taXOtHQXISESgHo7eSNSaDGdCaFFcoNkcx4D3D6EYi
         gzpTeIpuoq+M2RkueN1+TolBE6QCEpYu6MtituToYsRA98c0nIYUf5zRrHSPBmrx8oa+
         m3bhlJteEsvpDLsZJCGTF0VWwWLmnAgg4oIwgBpKBVCk06x5vnSeTf/6lPgA5+emUxbZ
         JRlA==
X-Forwarded-Encrypted: i=1; AJvYcCUidT9tXBJcw3E6hTseiCa6wIIWOOV7OQ5wCbv0ZcvuOJHne4/PGG0ttwNM4PgK9B3wnHlC@lists.linux.dev
X-Gm-Message-State: AOJu0YzQnG6InaOUUnLsD6zij2AmBJ9JnbrBbEjtYDNW6t+ZJXa+Y+dm
	wJ74DDo2BbqKFAdPxI+K7bGIw/aWWV9aT8Ox5bwuFNYEl2urNzm9ttSCDVNg03ATSkAcB9Zfy7K
	+UeSiIH+hGnRHMX8JqXTRBiqY8kw=
X-Gm-Gg: ASbGnctdTkbzLej0/jr2Ml1f0cb9DmeRDtqpPRrBWuA6wzdvdmVBlIacmmafAhZ13Ew
	F3XaDstQYROFDqKlVVgqgYwUrQasbuyjAIB27r9r2WRIRYWIPeMACQF7zOqNNpjDjL3V1n//5
X-Google-Smtp-Source: AGHT+IEm0DywvLZQSzge8Nga2B1PPNnjhE1HYqX+Eh9XOt8eJU/Ve5UT4uuIDtceuJ6hHkTnV1zpaVUikof8w+L5sjQ=
X-Received: by 2002:a17:90b:3808:b0:2ee:d4ed:13a7 with SMTP id
 98e67ed59e1d1-2fa2452820dmr183852a91.7.1738872438291; Thu, 06 Feb 2025
 12:07:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250206175216.work.225-kees@kernel.org> <20250206181133.3450635-1-kees@kernel.org>
In-Reply-To: <20250206181133.3450635-1-kees@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Feb 2025 21:07:05 +0100
X-Gm-Features: AWEUYZkvnzTQZ_9UQDhm6HqikSDqn71N3eGzi0s3POCtRKLPNY-TpuHq0_TkCWk
Message-ID: <CANiq72nmAKa4rHsk0s1iqY77T-0MEyA8UJv1y=w9vFQ79FBxSw@mail.gmail.com>
Subject: Re: [PATCH 1/3] compiler.h: Move C string helpers into C-only kernel section
To: Kees Cook <kees@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Andy Shevchenko <andy@kernel.org>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Philipp Reisner <philipp.reisner@linbit.com>, Miguel Ojeda <ojeda@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 7:11=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> The C kernel helpers for evaluating C Strings were placed outside of the
> assembly ifdef. Move them to the correct place so future changes won't
> confuse the assembler.

This moves it also into the kernel ifdef too -- I assume that is
intentional. (Perhaps mention ifndef instead of ifdef?)

I checked that this is indeed a pure move, so:

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
