Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6585931E824
	for <llvm@lists.linux.dev>; Thu,  2 Apr 2026 07:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775113958; cv=pass; b=bSbaJ82sdWySrrE2PNHjuXPCg4ETFNBjgG6iNfyxmwbwEM11RzFXDXHmIJL9LFfT25NfQCuxtYqEb+ceb+0LpgO5mMsLj1oWhCoK6RsVr/BGFvKYaRCLsGX2bxJFvK1ZewF5bCdqqiorHLWuSGBPF1r3i437But8ve5jILyt1lY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775113958; c=relaxed/simple;
	bh=5KsNlup00ToveqB7aTUYVDBzpUNHd54qGWP+GbDHjCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sMRfSnOdn2OKRxI5OtGVxAN+PXnL3Jj8PzjKvPrbRmn3F87/6MTY5rcMKN91RWCrg429xNwugLqRnnr3i/Gcdxc+qqyf93d1D9QxSfltLaVTYplNuyn0QaoiQTvUAgqz3Iym0K4PW6uTjX6UnXV4/VpSNSSdFCfJ2sMDKLdMd8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJ/AynaT; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJ/AynaT"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c44547f6d5so19104eec.2
        for <llvm@lists.linux.dev>; Thu, 02 Apr 2026 00:12:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775113957; cv=none;
        d=google.com; s=arc-20240605;
        b=GvYDqvPMlFTEedkkV5ciWD8VsyCa1ksaO+1zUs8gdU2o+p8ZbseWvYeAAu9B9XgPgD
         GbvbhWzR2D3ExuUx8jBXjcpm8pnIKSTiVA/d58FnLQdJTFzE8Lj6I95peYmBNdsHBd19
         3NFntbuz6VWAryyEXmyNRS5u5J2BlxiD6tjRJqmiiYqkTRtSGLRyU8KIT0iILGEp5o5O
         iwZqZ9EcvMt2X9PT3bWBhjlmeJipLNDd7Q3ys01Y3ihn0LMDmN8VVuLYFUg0eJWOAuJg
         2PLfEZ4fHQQyBspCpMsvNT3cJZYdv//6yZ/BBlWqM/fqdxMCjRmP1lYAnfYMXl/SicjK
         Mypg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5KsNlup00ToveqB7aTUYVDBzpUNHd54qGWP+GbDHjCc=;
        fh=lDMvYG6RJiY09xd2a2FUCXqNthM8uqvgbDgpI6DkQMs=;
        b=AzcIyas+eq7mxy6TdH4FuTErcle5BD4Ni09X8sW6tlAay309MYnJBuG2TWuCtwnD7J
         GYOfZuvS2RCsGuwsW/8HCKwBton4BnR5LgZJuAifOydTshHmKXn/a8AFWtEqOwnJAmwn
         2SLbIaLVbUg5sCRShQDqPqM/hxEldXNIcjCjzBaJie+O7UNcNZA1VtZjWcs2c2pt06Pe
         o6igeoPcXTpLTsKoN66f670B9wc35UDdyIvnRXD+Mxc0LuEvEAy0e+LETgQkmsr35JUZ
         45NKEVh2XzN09vncgUjjiQaeidgW/cxMhwT0IhomySUmVdDXPwQerXu6YaNTbkYakpqc
         hYEA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775113957; x=1775718757; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KsNlup00ToveqB7aTUYVDBzpUNHd54qGWP+GbDHjCc=;
        b=nJ/AynaT94QHI9lo7IxE0/rwotOiuYPEVvxEo2okvaIeSaNckW5nv7buxCtl8WnHgJ
         vhjkLoZGy0iSFmzgzfHtMUein5VtOm8Qqr95Qy+jOqI+KaxwmBnsluQIdeDgcY/JssDg
         rcILoinUpb1xlYUorvYjGEs/zp+BVh5RZbK57PhK2zwat+K6K9ndSCvv05IHc0zh/JaM
         kXVxhsnghVAPWHGgZoJ+VVQv0b5U2V/ZyBknRLChHlt31m2ju5hCupA1rx6gmPfwmE5y
         v9stJ45F0Xbard2qtS9W9AHe9MB5h0Prd9aWKGeFah6M1aQr1c3hufBsLrfOOnQpACcP
         IaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775113957; x=1775718757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5KsNlup00ToveqB7aTUYVDBzpUNHd54qGWP+GbDHjCc=;
        b=f8v2CaR7XHB8RK9FjzcV1eCWeCVZvdM7+UcZOW2vgTgBkNCACBMgevL/SVDkFS8W+s
         3Rah8BxwVwAnQ7nsIu063P+7PVsggVr3lCY3If2MQbVDgCWiyUsNxHF2xKz29agO3AO8
         rLxEkJ/yaFlH2QeGdkeyPm6UILml1I42M1LAsOYqpcL8Xi5K/YMMn30tsdyGxy8ZD+KX
         ZinCrL19q+bMoM8BY8b/xxysRGrrlHMyvZ+9n25mmW9r/KE8uDcF782BxX12Bv8TRrsz
         zQIufOy3ndmI8N2xeCWFr9TSyVR9QE8CgR9zsce9aDJz5V7obetw0jiRA+78RO6iitqI
         kQZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMNST4k8YFUZMyGvwW5NYmSNQiv6oXdInhGruODySb1/hLdMJNtbvOKALLJBw3/1FGGTaF@lists.linux.dev
X-Gm-Message-State: AOJu0Yzxr9fmhNTHGARe71f9o+5ZdPAxwBIHLVhohKEnmCOt4r+UKbDk
	4yF9rI09GuWlBtVXikpaoXwifeY0qq5hxvTL0Ravfi0ids3fWkkH/LZ/sRUsFelommlFAOmlKFi
	B7hm8jZuL2zOBVxdSX+gPoANL/LcMENs=
X-Gm-Gg: ATEYQzzNzPohcCZu1WyQvXN8GgBDVNwuFD8PUzI0crbDCrvVp558KkT23BxQ+mjFWyG
	8b6yQ3Otl891nLVEJSn/pi4f+YHa3zBWTwfvb4AAQW9NdMc4RDNnE64V4NzbzcfVRKQy59DdGBT
	8b13zLY3xxrasph4zVsMHLQvkcQScbhtRRJHsRZaMM5Lhy7JDVbaBpDGeGVtnO/6ZzM/cwGDpwE
	haj38cVVpcGyfvmNbYW3B/tQiI7rQxBdWof+DRnWOFNqw3ChQPCvIDTS+LQ6hqqmcAEVwiN96O0
	eBe2YuxrKQ9MG8AVUjh7ekBJ3KfUGWfv/0qD4+/AQwsfPUhNvoikvJIIy1Ie9R1mAo/DUfUZtXW
	riCABWKTHWWuRry51brWPygI=
X-Received: by 2002:a05:7301:6790:b0:2c1:6416:2a07 with SMTP id
 5a478bee46e88-2c9321b7bf4mr1634311eec.4.1775113956496; Thu, 02 Apr 2026
 00:12:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-16-ojeda@kernel.org>
 <DHHWO582XLXH.1DU3CO41F1PV7@garyguo.net>
In-Reply-To: <DHHWO582XLXH.1DU3CO41F1PV7@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 2 Apr 2026 09:12:22 +0200
X-Gm-Features: AQROBzDaEWueCbjTzytnJo43NDIAkvyWYngeEqQLnAsLh-4PZJOJIJpad43tD2c
Message-ID: <CANiq72n4sCU=2m4Uee8Wpsv3mjkw_BuT8Sg54Gu0U68j7qAM5A@mail.gmail.com>
Subject: Re: [PATCH 15/33] rust: rust_is_available: remove warning for
 0.66.[01] buggy versions
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

On Wed, Apr 1, 2026 at 4:58=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> The scripts/rust_is_available.sh change looks correct to me, although I c=
ouldn't
> get scripts/rust_is_available_test.py to run on NixOS.
>
> Looks like it filtered out PATH but uses /usr/bin/env to find python bina=
ry? For
> obvious reasons that will only work if python is located /usr/bin/python.

Yeah, the script has some assumptions on it (e.g. it also assumes
`dash` behavior vs. `bash` in a couple tests which I should relax
too). Happy to change that.

Thanks for testing it :)

Cheers,
Miguel
