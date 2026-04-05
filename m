Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9592FE58C
	for <llvm@lists.linux.dev>; Sun,  5 Apr 2026 19:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775417532; cv=pass; b=PImvM19DOcZZQRVMhSdxHvOAloXtzPg6EoWZDEA/ECmFa5W9mllosKHJPIFSv+H/2PPLzXFojS7X4gpfPaLOgWfQVdJHBpvlJNZYyuZp1YDwxjWlb8lQou6YjM0evsYk+G4DjFL+PM2/WziyKgATMJYi7kSUlCmJoX2/lGfR/FU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775417532; c=relaxed/simple;
	bh=uj4oJAcIVuVW575tTJ/+8h74lmRr+UIi6+RvtopYiMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ibJi6wG2biVLBi/aO1FzsJALsiF9EocS9+tEXzxLMx37TMt0VjYuXS9L38H7LwfZphv1Kj1JjGgGIvAV0c5/Pt/x26cHADHP89aXKqWvI9g+KpHGgu7vThooC6C21pJ6t9qce6Uo64AQkm/U5HROErxwGnozEzw/3L++ufAdInY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2lFhV9G; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2lFhV9G"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2b8095668ebso237995eec.2
        for <llvm@lists.linux.dev>; Sun, 05 Apr 2026 12:32:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417530; cv=none;
        d=google.com; s=arc-20240605;
        b=GobZtDpm3bF6L8VxOCH7IevxWOwYFtZrOYfCwMlMS5OTKZy/KrCCN4GccJ6gMOMZbU
         ESjGWlymgZ1IhnAz5wyMC29jkoYNTnP74Zpf9wXVP62igAebn4TFhBeO5bswOQXElORY
         mplpj7s4ID7PuoHGCfRKLw3+F1Tk65ix/6iMNXFkLhmbrRb/gAoE+2w0gqRG2L8H4zJm
         ub6oZEw1aXEX9Udvo+HodrkF62gnCfiECz8TwWXKoBoxRrhzTcwUAxW/X19+FN0GPq6d
         dSuq33YUvMXSByfpJrMW1/awoh6elewkzBkmAzF4zMoNjpzpnFz8V7YYDlc7edOkmVvb
         /ucA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uj4oJAcIVuVW575tTJ/+8h74lmRr+UIi6+RvtopYiMw=;
        fh=tWRV0bhcnJihBLdg98kKFzROOYK8Aql+oDdecGDH6s8=;
        b=OHT6b/FgABNZyuSiXjcgU0dSQOXL7NJA/HmNZbfS+2lDWomtK1ICJNpGoMpjL0NqM4
         Qdt3S3fUBxnI+OeKYzQaW5Yw4n6zY7eEFFThnYA50fuP/nnzIfVhj4mRH/ene25PzSiB
         zYhVI5sDFb8ai5sF8xlVbpmXeV7bSYf4WKQhzEeIMDTiYO7KW429gsfsaESOE73KqwZ0
         W50mmpvloixU+Vo/7duQKB5YgFjRM2JGmqELOLafMnKlxuh/w1dvxALyuxG6UAOj0rgK
         LqjSSz6YVVGv46T8JvOOc/dToG3kEuyBB9D1bAvemj3USz8O6WNZTUDrZV9J2++OAHyG
         Q65A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417530; x=1776022330; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uj4oJAcIVuVW575tTJ/+8h74lmRr+UIi6+RvtopYiMw=;
        b=a2lFhV9G4g0HjceeYInr4gBL/K60aUbJaf6+msBwa/8LwL93hiW+MlVM2sAb7JC/vo
         aKgMpxozwmv7fOX7Jz9UloNTld/qVbwhTwKUow/vm1qIZDs55r8x0OpdJ0v19PVpty6h
         YOMts5Bqb7fMdRzqxSIVWYeb2JXPcU81rFXnmhv0VxXA5DX05mzWWzxOyONHt35ImH26
         jat5bnoYthb4J5ZtTtbHZzmdftGeG58kQ34qVz8UiLTT2pzEoKP9rZx/91ztliEhWfc3
         zhahJiBiNVfbtlDKtblPCGGQv+zO7cZ1Qhubq/H5tSyys3vgkOeIcJE5gVt8vGaECegg
         kzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417530; x=1776022330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uj4oJAcIVuVW575tTJ/+8h74lmRr+UIi6+RvtopYiMw=;
        b=SmnasOfgWyIx96rUI0IlunaVh6NW1dCdSWvRk9JH2dGec6/4Gvubsh9o52HWsAo9Qt
         yRAidq5zjAwfnH0pK5cca3a3do3THZdqXV6tgn2s2RDZQy3eMid1WZQIepqt+Iu6TOUU
         cadnpJt1FdvVgI+mezjpYRF7Q4TeG3RI2bgrppUjX5ymEpzbjdyPJuHhmSugcRHHcTHb
         6+jczSXH7iNMV2cLhvGc/jXqKgPFJsjdkvoYS7EfO57+R2GDnd1RG2cok5PVMQzexgVo
         Xd0phKTL/AgCourcx+EarYdp8I4AVBETFMq6NBv9yfVztSmOquM4XRzuHqZmHLV5uZa8
         10sA==
X-Forwarded-Encrypted: i=1; AJvYcCUSyXwfBz29lUorM/QN4LgJFfjQZ1UehWJ8S+asK9qhdZF5LN3Njb6TYB7ojL/MO3eNesTL@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5JWsho0hAnAmo4exQ3q7XI1TJXcQCJPmFu9KXqZxTcflPnPTP
	4Hi+MXU5aGARB6OrrS75tZwv5r5sFJqSGb2R2yODxqz0uGt+CfUsE6h7vp0bdNdvEfIcuZdeuvl
	4oyqPinD1oDhRkdAPAPlkfg0WjUbIbI0=
X-Gm-Gg: AeBDieu9FR6apLCALK/iZCERz/409787bokRoD66mQiH+TKA5vyA68mTWHt+LBYZwkU
	F/tXOqv6KrrbHO0rAH1UWmzuqpFZrqABL7Vbcm+mldJZDvqZxgGzeOuCgZpGMysLkxFXp48qUO0
	AtjTYs5MUmfCARmR1pT0VRpWj4MEbB5V+dgVVwVdmJ3IMZC3FvWvnnmhdYbhIY7Vn9Xhvcu7vBA
	gqeGk4QeKD9mVtvY7tbT+JyTrA5Z4nxmAmHU3x0xnYwjRLsX6qdyCTRaS61g58T6HOdYb6c21ob
	ZbkNFPh6M70c9VJbjDJhdlZ2wWwdqG+aMfX/XCh0jqTB5+lODC5sn7Iync5JR+YPMO8zYrHF337
	rUcuj3ctf5OjACbJ4wS85NS0=
X-Received: by 2002:a05:7300:cd86:b0:2b7:e929:856b with SMTP id
 5a478bee46e88-2cbfc768bbdmr2210515eec.5.1775417529556; Sun, 05 Apr 2026
 12:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-21-ojeda@kernel.org>
 <177508434460.73816.4231801886718165891.b4-review@b4>
In-Reply-To: <177508434460.73816.4231801886718165891.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:31:57 +0200
X-Gm-Features: AQROBzDsQvgh2EDKUg3LiGNTUf-8TUQBnEeLR3UEGt8KzpEPnOxtdZC7xsmuU3c
Message-ID: <CANiq72m9bsXZnMJv2w9eszV5DGUG1Cq0NCEUqv60=4Op__Uong@mail.gmail.com>
Subject: Re: [PATCH 20/33] rust: kbuild: remove unneeded old `allow`s for
 generated layout tests
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 1:01=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> How about ordering this, the previous patch, and the next patch ahead of
> the version bump to avoid the need to mention it here?

That is reasonable, yeah.

Cheers,
Miguel
