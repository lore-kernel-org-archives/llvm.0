Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385912FB084
	for <llvm@lists.linux.dev>; Sun,  5 Apr 2026 19:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775417526; cv=pass; b=V20O609+0XpKgOisK/agrpZHq9Rcxu9YZKHs29QXFIlYCItZngUuLbyyfLckB/ccmHcIQg1HSGAPAMJ5M/kAJ3fAKBnI/R6+7jsBG7G9IJsMyLCyPCpVsp7ePPSgnVV7NEnmA+r993A0eZSF21OeBjitpmkkKQQfa4IL3zQ73ZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775417526; c=relaxed/simple;
	bh=MZ97OnLKNSw2H58dmZtpb4byqUPHuyWTZL1aRVE8w44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eWawZMaMguTpfl4sGQIscVypR1d2E4d32I7w1qxjzGENvFLUsvog1CtsJLr8FhEQ+Z4GjYlyiH4tyRUqlA+ILbyRNZhw4EtyOd+vGEppO0Jfd7erDXNxQvlPBn2WY5WeDThn2lhGuYAkf5189Y/EAHtswngwZHuIJ1t1lcIiJcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oo4Xfgjk; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oo4Xfgjk"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-127337e3870so153199c88.2
        for <llvm@lists.linux.dev>; Sun, 05 Apr 2026 12:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417522; cv=none;
        d=google.com; s=arc-20240605;
        b=E4P8VISxSlIaEeDu/TFQ1LR5h6CwGcGmSU3R5HuORqDSa/97Co7fZU2WykuukVcwJy
         FyMW8E/0F2GOhoPhy30OPJWwMSIp4si1ixF0kSRw66SEyziQXNeFOwthDJri6HNTqGeH
         82DIJzm3jG6lbtgp1lQ4v78AaPjInn+q4Q//3pRfg4Z4wEHrz0pyIdWZhJSLBtEmwZc6
         1iHONpxg8S+EgzVXY+Dk3uVsREJbHidybOjaHK6dVVED/3Kbx3YuqMFNSUIacz4qrdU7
         imwFJQWwM9keytapn7ffBLnSUICeXpLdG5VpRPWy0uQMA+XV/OXvwkwbbBA08JFsbSlC
         BnYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MZ97OnLKNSw2H58dmZtpb4byqUPHuyWTZL1aRVE8w44=;
        fh=1RamTv1nn3KBfzjTe+V8Fku2pT7CbSObFrdRXfsn5NY=;
        b=jI5rZfw1pFU5Vz21LeuNK96HelZAOsZMUo3V2fujhM2ZVYs+go2vazP0bOkg3YBBgG
         xiF4q4bUEahUYuPJpIuVHarFsvpFxDsdkN+w/vs4QTP9S/RQ0pfoIEQJAA/o6CYw3fAm
         dMXkOknB/ppfbAm8b2/igiS/OIFAmT5MdLw2n0DMvAdn5E1DPsbgLpiGjgon544oiecg
         i8zosowMl3BdRB91OxBCxd7m2Tw6b5ODxBMyr6LsUcifrNccwmo2xDB9+BmFK11wUrdE
         H/JQNIzvqFr2Oi33m2IBoP+jDxfJe/my/ow8dXahm8XloGa6z2Z1lZ0IIJFi6BvBzw8+
         0vkw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417522; x=1776022322; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZ97OnLKNSw2H58dmZtpb4byqUPHuyWTZL1aRVE8w44=;
        b=oo4XfgjkCRmropaDt9ZHi5J7oPN8bemW74MdDmQNuJU1uf9/Lma+feZdHdXoGeaeWN
         20L+1H7y6tcpNgtC5oo3E80xht+EZfcy4WhT4vFm1ROnUpE7RV7vqCiccGxpglA7eyeR
         dTVjWNcYXopX8fyuHXl8twlpaZqvjAlTCCO0wvXt68tLKMakVS0ESzA9ViCnsj/usDZZ
         15Xo1zdN7jjYklvBlD6Fcxix4uAsrxj44cLU3z6UJXxo0m6qEQhFZChV5uz9hdS90pEu
         Ah3qBGAZOIZp8PJMi4dJr+eiK+xXfCmBLQK43DU9KpxAG9MEZ3F1siymCpPtovX1ab9U
         MyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417522; x=1776022322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MZ97OnLKNSw2H58dmZtpb4byqUPHuyWTZL1aRVE8w44=;
        b=f3tAQMYkxGg2XkZP7WY7F0f3GEvKb6xn0S2Gxka0mwTPginvgBwaDnlnzdIpjRU9cs
         ljyhT47rKs5OPbIjvDofXS/G7KHZ6cadvWLnjlxuVJCpfsA+92HKIXKrbLDhzJB5Jl7Y
         4YedTKOU6hQBH4lX0CpVahWu4ygmNOLkhlpJ48r7EZ+v7+n7m2ZvSQ7IxV0X+YBCDqrH
         P/gNEwXQ86DZ5spyZH0vE5mXa4jXe16Yddu2zExFHY4VEZSEgQv8AZxdiu0Ofper1iPu
         VIwImN/5Msno4rQ43aNYZzoXMqj7y7fybioeLYF5UdDbYmGRVtf61iBJ0PDURlCzsVQK
         93vA==
X-Forwarded-Encrypted: i=1; AJvYcCVygpccaGI4YI2P/C9JLDpt+S7ZSZvJMBwvzsS5LQ5butmC8fFeCVk7OflfaiD9T45ibzpz@lists.linux.dev
X-Gm-Message-State: AOJu0YwGkPWVw6HugSub908ozS8buxNpxa2KpYYmkEQRfn5MZzjEIE4B
	t+2LR2t760Jd69VxnQjMpNfGOMiiMtkciCN9JoyJDCZaM/9QcweU9PnzXTAOx6jETiCNnjhySfE
	6Xc/MiBjX7Wr10/ALN+YPCfqCS99IBNQ=
X-Gm-Gg: AeBDieuX9Ez5vxcbDJjQrUVxWyH11tOyTeURoURSUT+tBR/VVOFSpHDqQkaK7U2kjRQ
	wkMmD1ZgQYRmHGgV4/iC27JVeHyw91WYqmzXdRun2RzPwSBvgpXPZSoP25ImSagMDkbpZ4yFMX8
	98JUb/+Curx6w58cgNjW8KXx28dX16OD00IMgk67jvfDQCqj3sWh+RyH3+Zlt0E8Puxp1lzIuFe
	zFlqBcj6NufQuvZ5z8uT42G733gF9bRT7CWKZbvBUILO/3UwPO7qrwiUWgGJUOvyvaW5V5HUg2R
	1ziIXVV+24f1emelyzRovu2s9/604bph7LbvNABIRkldK1m2aRvJR33TMumtMYHKNXBCvClYRc6
	6JU35qCSr0NGmya0i3Te13mkwLEaqHB0wfw==
X-Received: by 2002:a05:7022:418f:b0:12a:7181:2f12 with SMTP id
 a92af1059eb24-12bfb745195mr2138075c88.3.1775417521967; Sun, 05 Apr 2026
 12:32:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-18-ojeda@kernel.org>
 <177508434455.73816.15756486388132647025.b4-review@b4>
In-Reply-To: <177508434455.73816.15756486388132647025.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:31:48 +0200
X-Gm-Features: AQROBzC24JtVqMf2jJjrf2a1W5TmgldNN6NvGBvsNhQ1qBgBmbTFc7OPu1-U-ac
Message-ID: <CANiq72kh47Nss9+OdHf=wRhO2=79dxPaL_vcPv8U8qG64bYfmw@mail.gmail.com>
Subject: Re: [PATCH 17/33] rust: kbuild: update `bindgen --rust-target`
 version and replace comment
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

On Thu, Apr 2, 2026 at 1:00=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> Some citations pointing to the upstream changes would be good.

I added a couple links as usual, plus a reference to commit
7a5f93ea5862 ("rust: kbuild: set `bindgen`'s Rust target version")
that has most of the details.

[ The comment already mentioned the version, and the commit that added
that message has the details, but I agree it is a good idea to add
some references. ]

Cheers,
Miguel
