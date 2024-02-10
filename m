Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7698B5C619
	for <llvm@lists.linux.dev>; Sat, 10 Feb 2024 16:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707582974; cv=none; b=HYBp4NL44PVYtNBYb7OXVijUP305dhZMYEZUxZh7yZVCC5FiWM2AxjmrHKhbibhKXRpkEv0XkbMUoH0RJwsvvHkO5CtG+6/AqIVtBLFzt9Hl4yWyZ1ZccHllqG4zwglwYckmVCGmf1U4pkuENZkrEdqkp3w550X1Zouuhoomch8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707582974; c=relaxed/simple;
	bh=xVg2rsySaUHLNxBRJA4noG/ZLifuDOmrz2i8pgGGNSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VJyRQHSdYcsZVRUNqFnCqF6Tonq1VPf0W8EABNqmM6Xv5Jh0IxVUKYiTdlrq8uWGR05Z22SpBZLoa1TVdNeEHQqpPwEcfuWLO6V1dnvmkSuc9II9dVs23Fiqn6dEuOH52lSD9ZfVTM+NOuZG+AK12mSCmO8QDik5alvy0K8rJfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lz6SauUO; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lz6SauUO"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc74aac68a1so1980383276.2
        for <llvm@lists.linux.dev>; Sat, 10 Feb 2024 08:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707582972; x=1708187772; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xVg2rsySaUHLNxBRJA4noG/ZLifuDOmrz2i8pgGGNSE=;
        b=lz6SauUOSpWs/Ki7ISp2Pm3AFthaJPtCq7hLp2UtSts+bGf6LiBbhuy8yxmWF/v51i
         b0GE+Lfh30HmzZNRvpH0R4Gb0zOp9hcKYdV5IYIFa6wzmixtpCxk95N8VIM2uD1r6JU/
         fGrnN/VrY0/uYLnQAbcP8GTKep/EImluJ+oVMoKa+L/ygHkS6duGvo6swKy4CbjhzXky
         dhV4FCpLqMeRY2Vabc4jH2xSmkvfU1Zxs1ov3cfVoZ3+iQugzaNq/IVkjfnQZCg3JTma
         G/kRct8jOH/z5Qh11p6TJFg62rmTMcfefE8THEznSF9NYtB+zU44b2+0RWll989yPOxg
         Ljlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707582972; x=1708187772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xVg2rsySaUHLNxBRJA4noG/ZLifuDOmrz2i8pgGGNSE=;
        b=dxae2Q72ctq9bcgC0EbU5IqKKunxACKl9tQ55FNoahNYpwtAsJMMQKOlgrE81VcHKK
         eQNWqgqcrRKdgtXj9uZJa6lxeTp8DwOispAce761++jpy+e+XQmaWEaqpd+UFd7Y5b2J
         EAJ/Vjm+nK+0hTLmtaM1gkj68sWuc1MxwqnYRCQrLx3F8uOYELRR9WQGdiElXkElP8+j
         2PQr72xHclHV8O/OmG0m7g2/VorO7N+MghpIlN+NpOTRHECo/Nei/LZ96YJEevLNcui8
         Zhia47g+eDaw9DtJCr8J4rv3IYwgKHZbEVIQWMJuT5RzZiosX5UB9Kzd6oOz4a/amkkL
         Sd1Q==
X-Gm-Message-State: AOJu0Yw7LmofLZ8wdHnPiWdPNtFzUVNdfOFo2c+ItleccQX0XC5PK4do
	X0ukdSrjuc2+U0o6vURpOOgvqlc8oMQQ+Od5ceOQEHr2Ydh8N7rBZ4kearosm1hLm7qSyqWAL0d
	N2lAD8ApLiyNp/F72ff3bwiy48UA=
X-Google-Smtp-Source: AGHT+IE+fvBFa8QWEnDUJIBbyfVmQzGPZ+d8gzHA8Ie7SibJhobr4pIOwYgIwXacPtIPXu0U6U4DMlRpkiRsS00J/No=
X-Received: by 2002:a25:6809:0:b0:dc7:44d8:14c2 with SMTP id
 d9-20020a256809000000b00dc744d814c2mr2032273ybc.39.1707582972424; Sat, 10 Feb
 2024 08:36:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240208002841.GA2601476@dev-arch.thelio-3990X>
In-Reply-To: <20240208002841.GA2601476@dev-arch.thelio-3990X>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 10 Feb 2024 17:36:01 +0100
Message-ID: <CANiq72=G--5LW-9sg2PscTL863mFVNdnX7LUQX2Xj02qZs4crA@mail.gmail.com>
Subject: Re: Prebuilt LLVM 18.1.0-rc2 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 1:28=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> I have built and uploaded a prebuilt version of LLVM 18.1.0-rc2 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> As with Linux -rc releases, this is not the final version that will
> ship. If you run across any issues, especially ones that were not
> present in earlier LLVM releases, please consider reporting them to us
> so that we have a chance to investigate and fix them before the final
> release.

I took a look at the LLVM 18 prerelease to see if these would work
with Rust for e.g. CI and other users (instead of using the
LLVM-provided apt ones, for instance), and noticed it does not bundle
`libclang.so`.

Would it be possible to include it so that we can use `bindgen` and
thus enable Rust with them?

I understand they are intended to be minimal toolchains, but if you
think it would not be an unreasonable overhead, then it would be great
to have it.

Either way, thanks for these toolchains, Nathan!

Cheers,
Miguel
