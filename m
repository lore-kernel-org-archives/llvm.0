Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427F33019A6
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 09:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775466204; cv=pass; b=kWIn6pKbWjpZi/IJCQpDmB3XLl92SSvebQeAgynVQjaaHS3cfJdajON5G9m1o2HMI+JeeyBX2y2g74PjG5ZbdR8klg1+IqRS7+FXvSGtX0wA3JwSk2LzwdV2pcswc/Kj7gr5ErmwTjQ18NUhfNldICwAtR6DLI4u7pQWSTUFwAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775466204; c=relaxed/simple;
	bh=R2dHTJQnBLz14FBWbb+c8la9tQYirU1vpp38y1sgoA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HnsYx/Sg9ttGwZac/BE/pVpXIXoe6gtlBEisgTBmx2cQErbuYPB1RXcBC9QH8titVp+K2Sw2wtXddrTncubCF2VlyoV0tvuMFdxCTLhsKZ+GgTySAMHd1aB8R97KwMnYQpGJcRt2dt2+2Vhjc3oY2ERV8lLebvalw00HFyxSF5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCUcWAD6; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCUcWAD6"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b8095668ebso275406eec.2
        for <llvm@lists.linux.dev>; Mon, 06 Apr 2026 02:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775466202; cv=none;
        d=google.com; s=arc-20240605;
        b=MiSMxGEfuHqdjffh2gikS5xgwRjckeyfZ8IBbP3ZGIEiXhrxkaxl+1cXtay2PhEffI
         BfpvakotKbM/yY9CYahdiT2U4mXaGy4Kg/2KjlH2i6s3pnBK3ogNAODNumabkce/+F2x
         87wtT8t5xhKjtBoNl7ph32DnjuGqbLeBcUlxBVQtnkOrQXFdXJ33dPFheqWhRuz4vatj
         IUCtdL0pIhHncYCMUXxdElIsMuTotn95hN4EcIVYDxgIGN+Ulefe6oS/0PiJBwm2Qoor
         n8NWnaSyDZEmN+s/ZnCj8z36K/dMPMEZeLHRAgza5TnoniawpM3RoqeTGaxn3RN9a4SU
         iBkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iVamUPJfkbP2PYNa14ddDsteyLquBt95MrPlozlxwT4=;
        fh=2UBSp36fGOF0R2kPoWStESdM0b4b8FkiirvFHfKzdmk=;
        b=Q8fRM0hVvV5XPCjxDtRMkRe7/VYZQybhp1HiHvIqWQyXkHUcAfV73I5Jaknb18PE0e
         4czB9el/Edv/thE6qoQNLN7j28thEgGCzgnQZS5TSFwHcEpF9UcZ1aZNOOmJG7IAJK53
         xnZ9CaGl82YdiCsxXxssybrBfO9CfYmHLZQ4SXbNpcTJg4KYN4GpI5DCt3yMA9GAHw+o
         CKQIaBP4cznYkPB4yvXELg2g15Jm2z8AE9kCTxu19d8xJygTBhs9Euod+8DIaMItOSEh
         Z9af8ur9z8iwhxpqG7wpfRsPUpIKLflOWzkjO2RRXlhHEtz+SdqP2nPmrxLRN7Bq884a
         c3QA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775466202; x=1776071002; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVamUPJfkbP2PYNa14ddDsteyLquBt95MrPlozlxwT4=;
        b=hCUcWAD6Yt2lqSnujUm4nL3QJ3IL+LhhpCeMrcLxNTsmGwUMHvTqRpHkTLtCXC4NlW
         hPUN4mNnisHQZT1M1xcN1AuDpwrcahfEQTNyXG31xm49StHoLBLna6Naz9mWTNtsUYkF
         vHvq/Z/g0XVmrljnswe1qdwTLWq/EgoRzRNLCI3kAeNY4xD/onaIGrqHX4KFcs3YqcIc
         33Nii9SWzrUGyTlwCzRN3LiK34RdCJPEnSdO07iaNYZ5PSTl/M8NbvUkHT39jTMevtSR
         pDObLzviW7ez3cqQY2IOJ/FFI0H5jaUND1TvvP+skm2XWIWjIsv3FXCJH2/Ym97pte8H
         4AIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775466202; x=1776071002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iVamUPJfkbP2PYNa14ddDsteyLquBt95MrPlozlxwT4=;
        b=ECrSGL0ZFeId/A+qONa9ohk4lTq6DTvFewZVgsGv84hH/Fss2S/oQmFK6Jk+hX+BxQ
         K/sWfrkcipYcY87DB9ICWjDCq1o7ByMEu9QRIK/A59eaGsS5hqhKCymnWWE3E1g5uI0E
         MV5GNWd+JAWkDS3dHog1qzflecKTFPzxFID36WYXg23FDtISz/ACtwxKFdTpbsaeMWxa
         JwB5U9LBROGkz+ZBUMUMS1oMPHwAS6+SgY8fxAN0owNClQz+8FlGGZ9/fk2Ba7Ql+WSM
         QXd5CMs2M1pp6y26ryGZdBxhy1i76+tKatgYNEhRBOATyk/nkp1M9DTINyxdeQQlIpzz
         YCBA==
X-Forwarded-Encrypted: i=1; AJvYcCUvg59JZN1AovzcFhDV/YB3kQET+ujghBGTz90aTkQwrKwwecbRSLvpyQPfibJAUf6qyy8k@lists.linux.dev
X-Gm-Message-State: AOJu0Yxwhi4cy06uYzvCkWpQyegE3REv8efk6g+UUd/9z+cMgiIoAlVU
	KylKUbVGWCZYNqfAY5yjhtMwnhKwpMtkoKYsmc6ee3Cq9AzrjPDdV8HPbPlGgpmxubVESbnGmp2
	gWbpxZjcUBkQviOHs/10FRqtfkpKDzDc=
X-Gm-Gg: AeBDietp8sFZK9FJotkz6rzil7LwKhkt3SgixzmRqnp2RV6CszMfWx6DIA+sQYTqYZN
	lQEVI8emZPR/OMmp8EfYt+hmLpaD2BvgbGG7VLjz8a2QQpudqTfyKR6LusPZFwdlUE/lkh41YPV
	+2ovK66xIydO4f7eMN2lfynm14X62QpgdbOzKK26vLLXuJ2TfUVGV70AI+jjaMqb8nvWCw3lJN8
	kuHu6TMxKjSa8tb0CbuqPdmThF4eqTs30acIh7oKZv1fcfSSVWYjZsXP3LcsKWG0fnocW43zXM1
	LYms1aaDIPw+qV4SxxXd89n1F0b26vn1UG2aGIdQ2Ws7Yw+uW1s8EHVgh8YbCARNKFBqUiVg//0
	LiFBr/xkKzUsLT9YB9QzuZRA=
X-Received: by 2002:a05:7300:2315:b0:2c4:76a3:bdfc with SMTP id
 5a478bee46e88-2cbf6897126mr2280931eec.0.1775466202269; Mon, 06 Apr 2026
 02:03:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 11:03:08 +0200
X-Gm-Features: AQROBzDwpcCEtASRfptsJ0WJ2jdyaJlOCl6SPsL-e-w0TnWmNnUbHOjTvtft1Wo
Message-ID: <CANiq72mnGArtgAbe7xXZCYW1x7Zd5hozfnzoftaGy9rxoLO4ew@mail.gmail.com>
Subject: Re: [PATCH v2 00/33] rust: bump minimum Rust and `bindgen` versions
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
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
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 1:53=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> As proposed in the past in e.g. LPC 2025 and the Maintainers Summit [1],
> we are going to follow Debian Stable's Rust versions as our minimum
> supported version.
>
> Debian Trixie was released with a Rust 1.85.0 toolchain [2], which it
> still uses to this day [3] (i.e. no update to Rust 1.85.1).
>
> Debian Trixie was released with `bindgen` 0.71.1, which it also still
> uses to this day [4].
>
> Debian Trixie's release happened on 2025-08-09 [5], which means that a
> fair amount of time has passed since its release for kernel developers
> to upgrade.
>
> Thus bump the minimum to the new versions, i.e.
>
>   - Rust: 1.78.0 -> 1.85.0
>   - bindgen: 0.65.1 -> 0.71.1
>
> There are a few main parts to the series, in this order:
>
>   - A few cleanups that can be performed before the bumps.
>   - The Rust bump (and its cleanups).
>   - The `bindgen` bump (and its cleanups).
>   - Documentation updates.
>   - The `cfi_encoding` patch, added here, which needs the bump.
>   - The per-version flags support and a Clippy cleanup on top.
>
> Link: https://lwn.net/Articles/1050174/ [1]
> Link: https://www.debian.org/releases/trixie/release-notes/whats-new.en.h=
tml#desktops-and-well-known-packages [2]
> Link: https://packages.debian.org/trixie/rustc [3]
> Link: https://packages.debian.org/trixie/bindgen [4]
> Link: https://www.debian.org/releases/trixie/ [5]

Applied series to `rust-next` -- thanks everyone!

Let's see if we find any issue in -next.

(If someone wants to give tags today, then I am happy to pick them up)

Cheers,
Miguel
