Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A164320ADD3
	for <llvm@lists.linux.dev>; Fri, 11 Oct 2024 11:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728647642; cv=none; b=IQoYByyciii0240gafhcj9jmrJUM9IovQjDNQgkPOTeHWE60xuhDTL55uqa4RwmmYORwPkwKfdm2/ED86fPhTuFvw5LD86doiPrUflecGyAYrHkH9SabbTWdvEAW7I6wuu4MJ32ffGMwGb35RGAsJTvBhhl8dFbGnugW/WfWBRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728647642; c=relaxed/simple;
	bh=SPK6c2GAoBBXdan9Km9M5WuJLVPVEFl8rnDe//urjWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p4iCeQDtgNNEt3l4WXWoh8tX0YTe7CgLeJJ4NrP5A4erSBMEjXGbSuDy4CA5xlbcfdAJAXzdpB7Tf0e56V/n+cFnUYXW88lDgz/W8y/PcTkKeLQyYxCOwmxeKhy2XwMQTMk00OGAXi5mx+OKO19ZxgEN6jPXLO33nVpHvvazIGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezhpyUbP; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezhpyUbP"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71e018dfb5fso123216b3a.2
        for <llvm@lists.linux.dev>; Fri, 11 Oct 2024 04:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728647640; x=1729252440; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SPK6c2GAoBBXdan9Km9M5WuJLVPVEFl8rnDe//urjWY=;
        b=ezhpyUbPUJrTYlJmaHdyY6cOzOKM8Q3wuKGX6G5MOuEXSjw7Iu9cMc30B9QK0IHYkx
         xVSuxeUAjaOh65UwmJN5H4KUMvfl2SVOCq8wMf46El5rEa7d0S/VdWeKf+3Qxc2IQQHQ
         lQggdujOOX2XaU8ihymfbGfWe/IVaNZygSDLUZ15lGi1kiVFDGMPHygZf7luXWxO1oOf
         ZijnpPkMd4hyHnV2lURStxb4DscPa5FqPDtX2S59EQYkMVzzjgkEI+5rNQB3otE/3HHE
         EuI0frM2AuUae9aor+A8g+8Quu6Kh8qeSuCdHSJNHbDD4Ieyo7//RecMCiD6pobmsMWO
         Hy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728647640; x=1729252440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPK6c2GAoBBXdan9Km9M5WuJLVPVEFl8rnDe//urjWY=;
        b=rKL8fIwPjQJYZHcBb4kJwNJl7n0eajDfM9ASAl2JgIzr5eX0YTQ+KZ3486haOcMHU4
         jX/t7Hk4rDKWB7nTSQ6Htmlon2D5XN90L/oDhev3Gra4sofQN1Y0JOfOGvc5zVEcvMId
         bd1eQ6cJqWFl/sBsa0spwl9HSTlyUiQuTaCIf/SECzDYSY4KMmQTVjcwIuPSoFdsqne5
         2+mlTQQuHdf4HUcB3qF3Z6cSqRMcrq2ABg5hn1EJfrbE51OPXK2sE4pZJ+Xqtp559/ij
         McSmHY1Oy0Un7T4OJklvKwqOxxf+R7QYFiduroWp1ctDe9+hnEAHTmQ6jZ/PYOreipN9
         6Tug==
X-Forwarded-Encrypted: i=1; AJvYcCUS2kadqXsw1jylGUM4TAVFJX8Ssa57HuSGp/56GZy2b0GzRzFqunxqCI+jsM7gifSFh7VK@lists.linux.dev
X-Gm-Message-State: AOJu0YzHee3i9kvmRKTbu7+potKdp2A8KHAuRuQXGjRUYx/eAZx13Cnt
	1HFDr6W4qtq6xIigrq5Agjoi0WLs589p4t7bRUP6m/uH0PajxWyclYv+jtWjKdq8ZvernryIQ5G
	j/T9qQzm6cvdZP+f30IIkMag2sGs=
X-Google-Smtp-Source: AGHT+IG6mdYSQEBCdNPomgnZ5qhOSdJ27W22RJLc7pOXm6QMfyY2DvNJ+8gPgure2Y2WOI5rcCP9gbXFeGoIxKRb3d4=
X-Received: by 2002:a05:6a00:2d09:b0:717:8b4e:98ad with SMTP id
 d2e1a72fcca58-71e37c4fccamr1660879b3a.0.1728647639851; Fri, 11 Oct 2024
 04:53:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK7LNARBXt=CWy5CgtHqdePw5L6EtD15emS2Fvre4QWfm_LjUg@mail.gmail.com>
 <20241011114040.3900487-1-gary@garyguo.net>
In-Reply-To: <20241011114040.3900487-1-gary@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 11 Oct 2024 13:53:47 +0200
Message-ID: <CANiq72ne6F1HpoA5gLYu9K0CcNB13JUFK5QgF_Cf4tAyvOm4qQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: add `CONFIG_RUSTC_LLVM_VERSION`
To: Gary Guo <gary@garyguo.net>
Cc: masahiroy@kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, Tejun Heo <tj@kernel.org>, 
	Yoann Congal <yoann.congal@smile.fr>, Randy Dunlap <rdunlap@infradead.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Jens Axboe <axboe@kernel.dk>, Jann Horn <jannh@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, kees@kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, samitolvanen@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 1:41=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> The invocation of rustc-version is being moved from init/Kconfig to
> scripts/Kconfig.include for consistency with cc-version.

Yeah, I am ambivalent. Dropping them would minimize changes and avoid
introducing something only used once, which would be nice too. Happy
either way.

> +if output=3D$("$@" --version --verbose 2>/dev/null | grep LLVM); then

Similarly, I wonder if we should use '^LLVM version: ' here or similar
to minimize the chances the "LLVM" string appears elsewhere in the
future (perhaps in a custom string a vendor adds, though I would
expect them to add it lowercase). We are relying on having a $3 when
splitting anyway.

Depending on what Masahiro prefers, I will take this one or the
one-invocation-only one.

Thanks Gary!

Cheers,
Miguel
