Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577811FF7CF
	for <llvm@lists.linux.dev>; Tue,  3 Dec 2024 21:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733262746; cv=none; b=PZnP87NyWond4GzMa2DeFRAx0PiZWbM82fVECW1LzJ312UEI/BGvRVJRlrD/Ni69rmBVwyPAkq/aZsOTEaXqv6fzGi0fgLmYJeVzl0n0YemK+cDbtNQp+AkkpuE95FwczHWpALMa6PEnWCIaQX+9uI6R+Weokid23HpK4hpubIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733262746; c=relaxed/simple;
	bh=JFnTyIRsPpqY5AsaHUp4L48z7m2klcMtXpHcgHvP+9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M6nkcrKYfvPID7GLC2U07q0TVcp6u6dADTmnkrb0urHC9Wfu1IE4lQFv+5Qk+a8xrWl2UL+Sa12WteH2MK6iXtVTIQ+xwtHm0P/M1qQN/UT/zxUJ3b5rtnJqz+7frNiaGnO5yQa+1oOjSgsftgTxKlJbtxJhdBo5p/QmBJJ9TAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vj/wwbCN; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vj/wwbCN"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-725460f31d4so483060b3a.3
        for <llvm@lists.linux.dev>; Tue, 03 Dec 2024 13:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733262744; x=1733867544; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFnTyIRsPpqY5AsaHUp4L48z7m2klcMtXpHcgHvP+9w=;
        b=Vj/wwbCNRT2wP5yEYQZN54CbJbRLYc5DThGL8bsdwuFNeZi0KLOm+ewN5KbNEiL93Z
         dsNSFYaHInni0XMVpk1oEa+n715jhXf5XP3xydZksg0mwI6UicVb30+uuIKhKEFN7Ptt
         gdrBkPVGgM7ibiDQKpVUQItgPaOd+ylHfV44rougcHKZD4ui98hA8nuay5UCUjLN4b21
         FkMn9JJ8HDgWWyIvs5Dn/LHyw+WYOltjk8sEd9IsHzXtVqr5qW8wd00BeRAmHjuU8+0Q
         s59vc3swL1ua5a8tddcnpQG4VqER73Q4jRBLmnchBXXsqSbxXBl4IVsMqUf6mjCM4Ew7
         VTwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733262744; x=1733867544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JFnTyIRsPpqY5AsaHUp4L48z7m2klcMtXpHcgHvP+9w=;
        b=bUmlsfW+kCZeNRDeGZmnGFDJwBprh6ZYT/ACmEduQq7RLhXH3ayHVh4M5AN+F0SyYv
         ErZWDAZ0fGs+AhjxbCIx0CgupuPVfMsLheG9OwHNYaa+AOIDB1eM8JwTMAFadqy/gHbf
         I7Qo/92mGAIcfmmqw9fwHucnnZoqmmcqJEtxwfU37u02VSOvBPHTzvhr5SMns5VEjbd9
         YUGIIo+XiJysiYjeZ62i/M1B/pyYTwK8xsgsRMI7Ojh3qSfIXJt0iCzvj5vxnr9V9fH8
         WHx8p8FK0shMP65AnypZU7SAQsIiNT3yK3Khde6Hx7FLhHYrxfPTnCOY3NgPH8H7fbig
         eBIw==
X-Gm-Message-State: AOJu0Yx9KW2zmoJlgAu4EJ+gsVKXRpGgOta5Ya5pXOa2ZrnQ7I7aPDjd
	W/NlMSTdeITwItvl1trV/eHxRsGj214lPGq2roPQAG4GxnNZsbtMBnhMQdHMCqrXf9qoXgFhqW+
	orticMAzDeVzXYkivHMakk1OyGY8=
X-Gm-Gg: ASbGncuCIkTQUYIfpeC6cmYDc6lmvYr88hTCkT1bm1k1MpRMNHiipZUIMQ5argfxMGm
	y0bPju2SA692vGiJk3hQDAWWzxJKOcC8=
X-Google-Smtp-Source: AGHT+IHqmX81dM5YXkrjxZwhEES+8t9hmi/pVu2J0d9jk4qhifvDXN6Y1xWXKGbFFHdP5HO9p1WuZwk5sntpyJEj8Pw=
X-Received: by 2002:a17:90b:1b52:b0:2ee:6563:20b5 with SMTP id
 98e67ed59e1d1-2ef01018121mr2264183a91.0.1733262744530; Tue, 03 Dec 2024
 13:52:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241119182442.GA416521@thelio-3990X>
In-Reply-To: <20241119182442.GA416521@thelio-3990X>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Dec 2024 22:52:12 +0100
Message-ID: <CANiq72kJUx9rgA0Ex9_5ny4ss3sG5pSo_OSY=acR_Bg5jzHLVA@mail.gmail.com>
Subject: Re: Prebuilt LLVM 19.1.4 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, conor@kernel.org, 
	ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 7:24=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 19.1.4 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 19.x
> series is no longer supported.

Sorry for the late reply, I saw 19.1.5 getting released and I noticed
I didn't reply to this one: works for Rust -- thanks, as usual! :)

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
