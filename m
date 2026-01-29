Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7375B27A45C
	for <llvm@lists.linux.dev>; Thu, 29 Jan 2026 15:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769700419; cv=pass; b=JppEcrfknBmzkEnVqS9sHPKxo92jSP4jZe/z3DFD97D7fqQhwto4+WDEATkxxQOCC6pU3LIYwCYjLQcURrumIjm0uetayLVk30D35bwJMzwipuqUd7COwYHwDPVcSvpX7v0Cm8WvCUw1Q3y0eFNttGoauhj0cIXMZrrSL8aTGvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769700419; c=relaxed/simple;
	bh=jr78jjwW7P/ZJOvhleY6UbMCy1sN1kxF6a6XPjJgC0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CMaFtq5oegJiV4clE7j5w2zZDvDS68gP9693UfxNQWn4IM3WpVgEfbsD7Hannbh1HFqIVbBpzcQb2GHRnl4K0PFTXL0SNDfh63L/CauD6gkl/TGWbTVBlNpK6dMxXBxBnT8B0/S+sR9ZMJicd0pduK9N5zoxtubxuwGay/Dr1rg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/cH5DuP; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/cH5DuP"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59de0080824so143817e87.0
        for <llvm@lists.linux.dev>; Thu, 29 Jan 2026 07:26:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769700417; cv=none;
        d=google.com; s=arc-20240605;
        b=TUK+cR4xj5i1LHPPrzddu/jhO/MUR+NHkfR6bi4IZOfVVh+ja7n8WPPqpZLfWnUESq
         cHxfaHk3laZ+5tJQQWDCTeAmqxwXHLLEenohA5gipWXYib9czGcz5tJez1DEvUjVAwml
         3eB/guB94gsWw8rCB2WPzAm3c3VvDkV7MkntVtOXp4vpmaIUeqaMxo1DgFiwJFK2lt48
         upwp8anKNrlLF6+Mwz+K31XdyijSXoY/4TSl+1I9Gx3x9a/4pF0BZLGYInc9xVpgYOv3
         r3kka8DvnLlSYAvs1iYyAhD+9KbiOe1DScHS6XlRIZDH5x5v4nBGsxpwd/VxO6qLIxTd
         ysKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jr78jjwW7P/ZJOvhleY6UbMCy1sN1kxF6a6XPjJgC0Q=;
        fh=+osfa/ezuuSfuuZMXmgz8ac8SZN09C5wygH0v9KJtT4=;
        b=AysnUVd9Wo/GXeuR1m2xIiYtscaENFLHGT2kKxH/1P/5W2uWkcLq9rYaUl/26J7IrZ
         pk3bUK/iiKyJdKsFHq8tN6Bz6Gl5wIv4l+sjs5HluQRUA8ROG92GHrLHF/uiBQ6y9icg
         p7hxq5zxtjeeem7JrH3myzGUs7lKF4ONeuEoosDhLiSb6EUB7ujKzy4CjcCXEPiVaPyB
         y8eGzmDz0oeiv55xhgdAH2uABkoHJVEcMwL6cpfNLBPp75hTmN8dqtMfQmWMFZ2SPVrg
         Q/GscczZZaCDLry6NAa2zNry6KLSdFPHVaJwbp6un+mpKNs0KTDJzeAJVTVdao2bru2U
         oVvQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769700417; x=1770305217; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jr78jjwW7P/ZJOvhleY6UbMCy1sN1kxF6a6XPjJgC0Q=;
        b=J/cH5DuPwb/aiBeyNUmiAs6MflgPO+rzl9oc0sA9Av5LLXPoiml5jSbrreKuicqhLS
         zGXR6vQ1IMAIUHvBcF5yiDuURpsnndxhHao5S0kMrrJQBCxLvdi5nM90RdlBw7BnzLlH
         0tQF5A3Mduq2SjLeydhcw942gt3hd5icE4o6eTrJEBhxp3qYMKWFU7+pUA7B/hZjQpT0
         IMIft1R/uqbTww94k2cBky8A8Fk85t9VYslW4cHTlYrtHySGbH6UF66jryXWXaHLo5db
         LTP4WsOX4HF8faS5mGk2LgNGMssphArFTgQ/RCEWCQOxQ/pq36s5kRw4+5O3k/cuWxjn
         LLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769700417; x=1770305217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jr78jjwW7P/ZJOvhleY6UbMCy1sN1kxF6a6XPjJgC0Q=;
        b=UrRxpNA/rLDNhyPHz52NWIDxKUvj4/cxNxiJu03NTpHGOFV3E8j8Ko3DZwO4l9SA1G
         ojM0k9oqNkpjzodxRW7Gh4VK4iYgLeFobjgjyVxVlUvpJ/jBEymG0JLAlkI0hoIXscRs
         VIQGYQdhwQnqiHXmSNGnXrY7Zeg5AiJN/X3CbAweztNnte/mjJBHi1cCQZTFKGywm9BP
         fSMPp9DGxZ+E9llccbldu+MH6hkYMzF0QpWvWZLdU/JCtLR/BtmbIquBAFtFYwi+JZg4
         +hztUbeM0TMI8qoJLFSTTG2xPhzhOLKR2OEELOn4i8fo2hXh/SiBCwNa9ktnaJrMz6JT
         o3aA==
X-Gm-Message-State: AOJu0YzevDFFYOiOw8YgcF43tzPGoaxHRH5SbtmeTwC0wGSGT1goC6rX
	w0Irt0+uKGcVkGNcQ+UKZ+CR8zHNn4aCy0W9/t9iiWsSuttydND1USGDH1OdBosK7fME+C6275s
	EHH4NwBnOgh8hauMW11JR4cgAeZoO8RJ5GAz2
X-Gm-Gg: AZuq6aJslYDk7jbh4J90nNHTOIDl2V39pwH2MXS9e9+9xadRH2SnT071hq/hJ0Hz9cX
	4HjJLgg1NjSIaqf1Dyz7mfSHLAbez6Fb3STrlqB3dvzPVOqUDbJrhLdjm6+QZbKXWAJmBDDz1/s
	6SVp+fhQfxd6+TBP2dCa1R4ZguxR4f7M+yAyf8yfoEzvnA6NJwe5wUTz7eJI6QrmbIyifYhTM1S
	iikClm3N4PgEZyyGQfJs/cFTdABwnfobfkxhZUaYzkIkvp6vbuphcie06X1QrFbSXhIFcoGAINW
	cYw07K/wk6NnFQv18H1H8OA0KdTOVEE6YlS5TNVuVsttpgdY6lgWfrtX7BGRNhJX9n4AUojlkrg
	CAZaYwei7PzyH
X-Received: by 2002:a05:6512:1454:20b0:59e:c9a:c94a with SMTP id
 2adb3069b0e04-59e0cbea1f7mr741172e87.8.1769700416352; Thu, 29 Jan 2026
 07:26:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260128060714.GA1181796@ax162>
In-Reply-To: <20260128060714.GA1181796@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 29 Jan 2026 16:26:41 +0100
X-Gm-Features: AZwV_Qg0yw1ZUU6eHgPWeKpZe3_Ac1a1EXXq-QftmFbBwjP7J1fzV4lTQviXtRg
Message-ID: <CANiq72kzPhb1ZDrNz-qk-YQHZVg=4drZfSqqDzUXxpvkc0Q+bg@mail.gmail.com>
Subject: Re: Prebuilt LLVM 22.1.0-rc2 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 7:07=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 22.1.0-rc2 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> This is a prerelease version of LLVM, similar to how the Linux kernel
> release candidates work. If there are any issues found, please let us
> know via email or https://github.com/ClangBuiltLinux/linux/issues/new,
> so that we have an opportunity to get them fixed in main and backported
> to the 22.x branch before 22.1.0 is officially released.

As usual, I gave it a quick x86_64 debug QEMU boot test (taking the
Rust toolchain from `rustup`) and it seems to work.

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
