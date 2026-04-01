Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740BF47DD58
	for <llvm@lists.linux.dev>; Wed,  1 Apr 2026 17:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775065188; cv=pass; b=Ka1E3aOJvux47S2FplQVaJ9AaXlW9LmVS1Q59OcNbh64cfad9ATZKDM/LFOVy+9p9fYBzNugmCwhvq15i8aoOMR5qtI21LZqtIEGzL37OAwTmVP7bfJMhNJaAhpHvm0Jon88/tFuv8kMV7qvedowcIbyl1UGwprUYHbnvfSMmmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775065188; c=relaxed/simple;
	bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ckSn63ovgKAFIVhTBdBU5dgAdTM6BuppDVlUBoZ4Z13PmiFcW1dsKyq4eNOcg2bgaCb6G7NYVVRilFpmfX2y0vz+8yQYFeU5X4xCs2RX/2AaHxUSWCwIVHhx09P73dxKcjwElq5UDd8IrQBdVwe7TsEAZWKCxPuTDlYVbpNTgjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYoe5wxx; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYoe5wxx"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2bd801b40dbso11143eec.0
        for <llvm@lists.linux.dev>; Wed, 01 Apr 2026 10:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775065187; cv=none;
        d=google.com; s=arc-20240605;
        b=GBqss495x8HLLCEKF0WeXyyuTaBecaOLyO7aEQXpKkSa8n/Ny3BoppZZkVNTkvuvxu
         BKhA1zlOyQzN0zgjkN4Ue7l/9VmfVEtwXvVRYVPeoifw19ikXXY7zrf2w2HqE+/EbIXy
         q52NVNnvM/L56zdplUFcIO96KfG4m+NODrz2Cjv6pkZSLfFnRzWc0RfE3ecHHIouLVGB
         GZOVGO264AorpMRy1nSCxtv6aoMla6E9gdFKpHE3I6BxtuG8U6XH3Ej91Kr+M+Z1CVPu
         ufj1clNjUpy1N6Yk2j/A8wTG01TUVHCEr+7bxtl1UP2t1DeioD5xcJ3NUMLLSa/JNaRV
         et4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
        fh=npQCaR403wZISSk25TwjMRUH/pCndIJx0oa2p4PMVdQ=;
        b=hlejBUgE3jNtPXChr76j0b2GZkh15Yr/gAd3SF7vTimwoNpsU0fLWwXk50cqLtJAkx
         K3LgB23aWjbfUa5kAoHPlQL2DzmO3ZaCVhe9AczKLbdvxL6GkT672Gw96/gdF/MPtDI5
         ShgT4eK6T95lCshdRtOsMKBRQuiANIUbTT9VCRZ1npmx/S1wQxa6bMwwYqZBG67rZ2DQ
         OcX8wZqao9syYRblmQEO4T0XqAhMmIwsNliCnGKzEwo0wKEOOG5ppxKcG9xSgknzJSze
         gGXBipJT8qI/wrHPwtEXZM5m8PdLNcvL7aXvHMC5+jhmR1gZ0Gp/i44Q4x+A6g5RV+Qf
         RZSA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775065187; x=1775669987; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
        b=OYoe5wxx2eZx3hWRbGzkQEkZE56igOTkWHOuvCELlhLjBA3Xxlr9gE7cv4g7sGN241
         kmXxK4LTzHqrRJrXCXQJY0OQFubJtoQ9PiuwIqpGhZYo9JQRHpP07eXpiZtuwVI4oWbi
         5CKdYCb4Sjgf1WYSELU3hQReGUDf6NL/LJhaKHmVLSDB+uaci01aA6x7S+gsE1ByBKH4
         Cq1gVNL/WTi4wYdza2Z5/pdti+zDPlJhaUnZ5vijf4B7JNxN7J0x1C2HONBA+ccw5jX2
         dZJp/rTXP/WV2uwniZamrKCmPRxWOWB9Ygq35y/RLY2UXhmiyKSDRGby5AjbznxcdZkw
         aAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775065187; x=1775669987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
        b=r5qSHwD4RIffapcr7MsAaaSe9FyShe8ruco4M2aEuzGwyfZVgGtrlnI0iBaGhHS1aH
         jujg3sGgU1pX7FtOnH4fKFovBEj94iOLzMLbOYmhZgl3yEQW3wk47/r5x2EphYLCK2dt
         WLhqEgzESVjZba+1YFQMHEVLmXTFryBXkOsp6puCjFukSu0Kd6H92NnqS0CU+lu8ntQc
         wAbiER5yRbLF82sQUR1AsW/pEgM/EBDDwoQLkVZAkgg9+4k++Ab8OKBvWbcK32qRAsjE
         g/OKH7GyunkUJ+q79jXS6Yw4b++9n360VcRAp5W2/WWJMAnDE3HKUS+SmXK8iG/J/VO1
         nLOw==
X-Forwarded-Encrypted: i=1; AJvYcCUerFukOfp4qcx67UfBHO9ef6EARcnOnZgbmLiifvcTDcBqnsJG+ymknGUZ7Uw5wx2k6nJP@lists.linux.dev
X-Gm-Message-State: AOJu0YzmDtP1M/A3dj2lwOAajI8LUVG36/paPl3uZi008PUlnG4j/tib
	2czXdRa0ZZi6C1QMZFvsSqBhiEx5t5ijIrKNIBYU6ZFFyAe8j9DUskXtvVew6CbGb1xS5ybGDqI
	4bLIIyjOy6QKoiCYEd4Ty0NpSetNW3Es=
X-Gm-Gg: ATEYQzzuVCDv5p+jNGCpKWd905ARfBy3tRuXLYjqoyiPmNYRIdvRy/EK2mVf+3z9Q+A
	pnRG9UgU7PWrz73KBd90AMm9AE0aKrRH4IhgewD2niLryud2I4ZEmlJsJm2hYvyJEvYisUebwk6
	GsD0/gNju2f63+Dz6Ur/XoGYC42i1Ek+DyT9vKbf4R9XQnw5tWU947l0IcB9clez8eT552HUr/r
	w2gGnWMbMBfLx5zQb1arOznGjCqww6VHVRqImFk4cMkFNkt+OGUSC/KoxOgo/WtRjNPjrGp9WPe
	u3ScfG1LYKOL0HnzoQ/9ieEzxS3DWftjDEsrqnM9wfcOwZOk9QtO4T5ytzZcq8CYIwjCotiL2sH
	imh7NckKAEBEJewuJ3tBoVqGF+DAqs8pAmQ==
X-Received: by 2002:a05:7301:4586:b0:2c7:2cac:8147 with SMTP id
 5a478bee46e88-2c932cb3abamr970192eec.5.1775065186457; Wed, 01 Apr 2026
 10:39:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-10-ojeda@kernel.org>
 <DHHVLQAOMLWB.3FHHSYKNM5TNP@garyguo.net>
In-Reply-To: <DHHVLQAOMLWB.3FHHSYKNM5TNP@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 19:39:33 +0200
X-Gm-Features: AQROBzBO7Aafw_pbzha_JEZl4Ht2QE7dpytXYa0WjnL8RQv-FxGnezpSMqEOLn0
Message-ID: <CANiq72kSYFiS6zN+VLs2URhAeHy8_-aEXki1pyR0qoj7jO-qSQ@mail.gmail.com>
Subject: Re: [PATCH 09/33] rust: kbuild: make `--remap-path-prefix` workaround conditional
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 4:08=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Okay, I see what the comments mean now. Perhaps squash this to the previo=
us
> commit?

This one was mostly to ensure the workaround was not needed anymore,
i.e. it is more "optional" than the other.

In fact, we may want to just not have neither of the patches, i.e. we
could just remove the workaround given the timelines of the branches
-- please see my reply on the previous one on this.

Cheers,
Miguel
