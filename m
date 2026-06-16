Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E0732571D
	for <llvm@lists.linux.dev>; Tue, 16 Jun 2026 13:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617318; cv=pass; b=ZkX7zcOEjX/h7K14MoOyUbb1F8UBtkVA6Rb74oL83rJdFdNB9WMhgWUL5gUe93bSpkGcXI2FNWPhz49kdxKVAswydH4KJQzuXrmg+zr1zvqaTYc+2EzSpEsLSFctZHEpXIN5xEDw839mmJnng4F2OBHY3wSyDG0ccig8e7Qk9PY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617318; c=relaxed/simple;
	bh=vFyIEqeIs5fuKpAzuSBPV4fQXXxeTn0cFHGy9OT1450=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hVPs6oh021eD57RrICFBsWCSO1P/oE/MzVb+BUtTTn3Czq16ZD3qPHkSnfYAX2cGlqIP01zS52nqstPXqrAceMrCCn8JOHoVXqkbr7vC2+N1bpzevjPMWkEB4gN2/tbUCfUXPOsMU/gAstT6+4zLsVBpwBu4gjijqNnRVIN+uJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gOOvztdO; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gOOvztdO"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-304d7f31215so4184085eec.1
        for <llvm@lists.linux.dev>; Tue, 16 Jun 2026 06:41:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781617316; cv=none;
        d=google.com; s=arc-20240605;
        b=eRXtWImJRVwx013sVuM4ta9q8zd427XTRMWCwIK2FAGJQjDEGWQUd4z/vikpMOiTAA
         0zNPEnS6/B00dG/mJq1DWIHHd72PZXJCRdgu/CE5MglJ5sUAFk9Lq+8HiCPvzZyUuVlc
         ZAWaytF71kROzQvR8kYdImZoyk3H4Oc89GZnLIzWkXCoPnyrPsxbGx4X16m6qzZqDXUf
         mJvYJgGl5Aru5vzXRKLqAZakr/IWnJ2x8aCLorWJX+Iq6ThxzKXVL/X8rjfFJdetYeV1
         c7oa+CyV+IIPUDAWNWiOKc5ce4d0wd5/4tIOwz5RucC2jhyw2AkItvU0bi6LbhC1nSD9
         s+IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vFyIEqeIs5fuKpAzuSBPV4fQXXxeTn0cFHGy9OT1450=;
        fh=nwUxMbzkL9KFMV879I+GBBhzc0OuTKcALJpd43gjEaA=;
        b=UnQ9F8T2U9jIcAjuR2x+Wd/RBGH6I4KgmCpzqS7ocOa6pixSo/M5UCXzNYDySfluCw
         jikoEfcTzVNZI9I0JCt+vp2beQatIO5HjSjuziVv/hsfqiXyJtgKTaj7fD6cYprWlMdi
         ePBSie/mOAkPXmSq5/g/RfbRGMmNmeVEKJRTilffn1ZA5UHa9Mk3sOoESwbnErn0Sv+Y
         Rj7r9wkclDmbBju2r8W71gmTuSaZXe3rdoNZwtdTlBjOZtV51g5cbvw/iSOr1Po9zjOJ
         5Fu/lShA2fBsXcvvKOB+IDE1Z+ampKo4sNOuKpHpWy2SFJ+a7PolM9flasyeOjy3Sf1l
         eMNA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781617316; x=1782222116; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFyIEqeIs5fuKpAzuSBPV4fQXXxeTn0cFHGy9OT1450=;
        b=gOOvztdOqVb+j1nJzsmCdV8zWM28AByovqE7krtIe8yHz7viBpUSlZ/IyMRBN2MZU9
         nvl6RZvFPVCD+Sxdr8Ie1fNlf/asppLxD9RNnIi2/PNiwZy6fC4S/2Y4UjW1Be1aamRO
         H1jzzEj5uyOtksI/2DakyHKNMBbfspu9f0GFYaLv3utB2w6S2zxAWjuzlUXbFS5UoQQG
         WFdKj/vfNMXmpCFv/nYJr9Evcn/SnmOReiMlTflHa49CHz8j2C4viX+5YAu+CBUMk1bd
         6qaV5fzyuzxeH+m2ZoND/6zVtnrKWT5DUGvHq/1pqHiYRx5Jfb/nCMivT8OXlrecnmOt
         0dwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781617316; x=1782222116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vFyIEqeIs5fuKpAzuSBPV4fQXXxeTn0cFHGy9OT1450=;
        b=UHRg8GGYnrr3Zh3QImbEAS64UfDfzjoxSk7UuOe2+d1PTYgkIQ0RJwTjBn97XP4pXe
         TmPK8sEYdGcRLby4ZAWaDaMe9B00LJWofqDgBEpbZ2kEpln3DnC6ZPOZ/9HpAQwpThT+
         2xftRg2YsWmQCMAiaYoQ/eSE2VxqZvJVp2N9yrx86ybJKhBizAmgsjUAOgRtEbmvLK76
         sJYg0vG1axOaoez0XNcgqW6UUwXR9PfYD0tb24LXNxQDP9jheBjEqkkKS0bTualtK+V/
         rYFKe+I3lhxaHewesqjyV3lfO74VtXpF/jRPqZJbZeaJZldXeaSL+RlkH2aEKseFYze1
         Vpnw==
X-Forwarded-Encrypted: i=1; AFNElJ9Y7GM0SmLzx1dgJjynCDBstZ5GW6ieDC10n5dJm1GeVBynYhFCHRo/tGgh6gRc5x0QSiny@lists.linux.dev
X-Gm-Message-State: AOJu0Yzth6OY5yzrnfBzSMe4anFp4Tck5iCEegvkUxN4SnIOeTzdSd5i
	R5KQnFIZ8DYOXnlOH0p/NfaicsJzvdrBI7W36nifHGzzgfsdie8GDZE216njUm8+n/SDTU1ePmG
	KnJfO+wtDuLsWyshK03M/cU3bwouZnhs/FBzN2hp2
X-Gm-Gg: Acq92OHVW7D1G59IC9/XfnUbxLgIAYCiPG/e37z3Jcr9xQHyN9NPu90iySnTewgqnjd
	IyN9PvF3Gq51p/l0/1wX+aNZNItTTHo0yRl3J+ae6kluwxl0vvvCOpI7iQMBxhjLmp0A4Q+x+1M
	oeWb9xA3zCgEyIQHbdgZEGA9IP1GAHSBIT9kDPATWgzJlTwk41ir0FjZgDTi3o4IOpJWsA80UR8
	weW+qfsM+hwzVr6Pgyd4d/H0XTwxobouiToLu97OgIAkn+MEwjucpIGKfLDMCnBxdxo7pI8+I9V
	pUevQNnYXv9jMCOa+k2OsqiUWtDmgIM79X22F9vX15GGINJn3zKZ8rrj8W7D7ZF1H9Gdk05kPiP
	Wa1MX
X-Received: by 2002:a05:7300:8609:b0:2f5:5907:3a48 with SMTP id
 5a478bee46e88-30ba596d056mr2231147eec.1.1781617315522; Tue, 16 Jun 2026
 06:41:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260616-frame-ptr-fix-v1-1-dc6b29a631d9@google.com> <CANiq72kek9NoFe2PCFnND1p6BRbuzgv6kT2o5jw09sWg+wau_Q@mail.gmail.com>
In-Reply-To: <CANiq72kek9NoFe2PCFnND1p6BRbuzgv6kT2o5jw09sWg+wau_Q@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 16 Jun 2026 15:41:41 +0200
X-Gm-Features: AVVi8Cd0shxPdtGfFX62VGFf_4e2WR3Zgq27GdoB5xnmwoEa6aUwuGjBmlMVQhg
Message-ID: <CAH5fLgjqVxoBVdoSG40vE2uqybeC3zvgi7T_fTA1=HwFY010Hw@mail.gmail.com>
Subject: Re: [PATCH] rust: Kbuild: set frame-pointer llvm module flag for CONFIG_FRAME_POINTER
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Douglas Su <d0u9.su@outlook.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Fiona Behrens <me@kloenk.dev>, 
	Sven Van Asbroeck <thesven73@gmail.com>, Kees Cook <kees@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 3:34=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Jun 16, 2026 at 2:30=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Cc: stable@kernel.org
> > Fixes: 2f7ab1267dc9 ("Kbuild: add Rust support")
>
> For 6.1.y, we use Rust 1.62.0, so we don't have `-Zllvm_module_flag`,
> so we cannot go that far back. I guess we will need to accept the
> issue there.
>
> For 6.6.y, we use Rust 1.73.0, so we don't have it either.
>
> For 6.12.y onward, we support Rust 1.78.0, so it is fine --
> `-Zllvm_module_flag` got added in Rust 1.76.0.
>
> In both 6.1.y and 6.6.y, we also don't have `rustc-min-version`,
> because the version is pinned there. That part happens to work,
> though, just due to how lax Make is... However, if the flag had been
> available, then we should probably still do it cleanly with a custom
> patch to avoid confusion.
>
> So I will instead do:
>
> Cc: stable@vger.kernel.org # 6.12.y and later (flag not available in
> pinned Rust in older LTSs).

Ah, I didn't know it was so new. That makes sense, thanks.

Alice
