Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72DA176ADF
	for <llvm@lists.linux.dev>; Sat, 24 Aug 2024 14:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724510749; cv=none; b=ObmuI7IFIEcsvAnJehnVg0Xlgtkv9vvxwNbPrxNZx0UdeeaMLxphQk6AWBdhzsg+AY9sjsm6gBuoTStYsbjma3Jv+MJ7ChNY1YizdKJJcsHmF0Cj1Im8ISvWd9VzynDjfBoQDTF1PNhD0Wjc+sgHYgWQKVq5Fzqb6d/s8qkVmFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724510749; c=relaxed/simple;
	bh=BqaB1c5ku9RKm94qjn9/66awfeoNmQBryjTJl23s/4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gdu4W64B7VtYFGrbVLo0iRXuvfH/jzmrpaXVQCDd73+tkocoWjohHxMXPX9GL9mFRqQtUvc2H3YpdtAuD6NsvrHogjM4gXMWlInPNPofZRlT24KqYA2yIONj162xx4OhGE+yKNNt6VPlyEOi8hLEIoFRuf9ITRwEn2baAA2WJzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mdFtlKBb; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mdFtlKBb"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7cd94fb88cbso271537a12.2
        for <llvm@lists.linux.dev>; Sat, 24 Aug 2024 07:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724510747; x=1725115547; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqaB1c5ku9RKm94qjn9/66awfeoNmQBryjTJl23s/4w=;
        b=mdFtlKBbN5UGSur+R137dO1U0z6R8Gq+XM9rR3Iu3hkre7NHwkivOcbAyAlmfv4Cea
         E4K7SE05gmx7YFdOj+CsRCAn7q0X7qj/AFDMneAx+ZSF6xcAImL44d0NrlmgwKGkBQfV
         UiPmXlmg9YKm39VVXfbX6AVyGHW65ViFUnNLIlBfhPQRz4AFeR63+GMaWUVd213O/IJv
         jamicF0EaD9/7cw2Im4LWkB7a5wF3ThMAevYNrOa2uaan8l13EhHzcpAmuYqxGsmRwYP
         RsaaArlfrgCNaTmieLZT+wpIpPBjMfL6CkIzM03sUih3oFzBoNXS2DcVtDilt64XNN9l
         1otg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724510747; x=1725115547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BqaB1c5ku9RKm94qjn9/66awfeoNmQBryjTJl23s/4w=;
        b=ZFqTRsMxoNuP97GcuznNllG1gezYA9u33zJq4hUPriTElONA5KZ247hQjBi0V1jqHh
         4ur2cxOOcv+Bkkwt+ulFuEOBvS3ep4iT4kw4MrZcf9QTqfmTW00kAruToQ65BEE6Qa21
         K8CmjIaDEJlf2maK881iVd8G/+VSwlAfBfJzLW7k7/7VJa2phgU0CFkVCyxFPdYLDOie
         mxv6ff1CP9p+2CzptoTUO1RR228I3kxIzBUfzWslHUbBuamrZEFCM/5FXANoIeZ712GR
         /PMYXQszdHI4Xnv4Opu5rwNMtNDpzFcmKd3SCE+D1gkIpPA/KxO8juf4P+epRfmZ7KNX
         f0Dw==
X-Forwarded-Encrypted: i=1; AJvYcCXkY2/LpwalTi9/ne/YN3MbhEeGrjM36WF22a6KunhzK4kbEIDnPoQjP3MfaZsXxC4vS9fe@lists.linux.dev
X-Gm-Message-State: AOJu0YxgGmwOcaxguFFK+Y86ik9CPFEs9LhfOQZxwM5YboOJEtdR0uiO
	8vCLaTVweZZFxiuD0VALhgZXxj84YfeuE6G2avTXqLcs+C5dyhmiajCh/KFw6eHXj7Qcf+2/Alg
	XS3aWF3NLjQ3nLSj58kaN4TiiDJ8=
X-Google-Smtp-Source: AGHT+IHNiuR3ttNVdVTbTyfsF7dQ1ZR3lJ/MURScKL1DVfGQNPDF1qTAnexboTb4uP777SW3kCASFOpdjUOmp6JlKcQ=
X-Received: by 2002:a17:902:c94a:b0:202:4e99:210a with SMTP id
 d9443c01a7336-2039e52c3c9mr42360905ad.6.1724510747206; Sat, 24 Aug 2024
 07:45:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240823140309.1974696-1-sashal@kernel.org> <20240823140309.1974696-9-sashal@kernel.org>
In-Reply-To: <20240823140309.1974696-9-sashal@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 24 Aug 2024 16:45:32 +0200
Message-ID: <CANiq72n1_1mF0e5k9LMLCwrgDJVWcuRwhu9ES49qH0knyJUodQ@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.6 09/20] rust: add intrinsics to fix `-Os` builds
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun.feng@gmail.com>, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, nathan@kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 4:03=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> From: Miguel Ojeda <ojeda@kernel.org>
>
> [ Upstream commit 02dfd63afe65f7bacad543ba2b10f77083ae7929 ]

Sounds good.

I don't think one can hit this, since we only saw the issue with Rust
1.80.0+ and 6.6 LTS supports only 1.73.0 so far, but it could be that
we later need it or someone unpins/upgrades the version.

Thanks!

Cheers,
Miguel
