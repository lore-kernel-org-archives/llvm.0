Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5E51D9A70
	for <llvm@lists.linux.dev>; Wed, 11 Dec 2024 15:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733932134; cv=none; b=EWCzHKjAq4rUIMhGP1kAzs+XtzWZZgPBcKa8eTnfD/8RnmQ/HlXGxvh2StPmlHnod7QeDlnwfNoDkhlSdTE25nDUOyqK5qD9phcF2FBpK5MXVGq9ZChicVSdJxgih1vC82WayjK2hShToMZzxgybZjs1YJzwkFMFxm110TS7ouE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733932134; c=relaxed/simple;
	bh=VtnQsl9zx+k+ubF9Cz317sI2/lD0BCOgoogtPRBY+k0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gpe8tm78B9DCLIqDn/74CCjqmEbIUpRCBaMlIztNsOVU0+/OIyCkhU2OmWlV20LBNRbLrqsodZOnrj21C2QJexZGWpmNgI5SJBuNVl+kJzw+JEqTN5zeRmSd4Zi8FE54UcjuN4o/rWcDB0ElLVQzR5uVlEfoAq4sl13AVqnCAOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WAROBv4x; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WAROBv4x"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2167141dfa1so8467355ad.1
        for <llvm@lists.linux.dev>; Wed, 11 Dec 2024 07:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733932132; x=1734536932; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUyQM6sPB26ijwTRoR0dvI4sIp4E1qaATJkXlSbU4zc=;
        b=WAROBv4xIeaye2wyOz3+1Y85oQdAr9zrPE5VjdLbgru/ZYcb82ZEaLWcDIMRwBgzhi
         NsXekzx6FXZ38cDyc2VDMwX+w8iJuikdVi8LW7ePS718sRgMdFkb1nXnNNMnxIHgrNpI
         hAyae5C3Ky5BU52YI3QlEtBgAiqChErYR9g5xfo24gPHtluax+M01ss0w7xy7U5J2+B/
         I523XWJXBc0LfPJ8eav0mqZCIwO23t+fnPjcFJHwUb3dMw+cU+1GYAuyTLMGccSYyWP6
         F5yBTPdWLhXzR6v5TW2fLQG8avRa/XaYsCEPIf8j6H6VG5Cse3dlzbHoit8uRvorUPzf
         LJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733932132; x=1734536932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUyQM6sPB26ijwTRoR0dvI4sIp4E1qaATJkXlSbU4zc=;
        b=sSdNGoWjYlaH/k+Q3nf+Q4tAh2Z9l9G9q70fuVAxlstpga4IqKF5w0OcLB6ENrCS5Z
         DjS4VoY+Hc2UXIyUDDSwtd1LpZhXKtoL80oDGzcWcKlcIlsncB486zco1MQ/S/hGubde
         Fs16i0f8IaTeRBs395zcebu/lAlHVEbRZ0a8Fnjo+c4VawUlbjEZN9+s9Et1jNA1Og3n
         ATOyHAt9GIQcTV/8eZ0eyRiZlCncLDFVvKJJE8rzP4JcPWyVfiGzvXXKn5YFPFKUhmO2
         CJNRqgFyN4ssOMEX34/VVERWWruHcPhFBhFSu4YFKzvsWhnIDQOdggavZjxUH0Rbthjd
         rDdA==
X-Forwarded-Encrypted: i=1; AJvYcCXl5eg6W6yJJEvC6TMw2rNF2qO0cUbX5eMrhX8D90xTDgZOlT+fzvU7FiLN1HbOd9YSHBWk@lists.linux.dev
X-Gm-Message-State: AOJu0YxABFWJO70DaK7z+LIuDslVcoujrwAMb2bMvrtooZrwp5u4/HcN
	CseabAfP7Ua1hpRPIlTfgQnZap5ePwPLgqRzAHYe+trIKT0vRQD+6nCwTQvDzt5SGKFjTxh7h6p
	EA55lYpl8TgqNDgKTP85iaX70B5c=
X-Gm-Gg: ASbGnctPCaRq/dyagpRhXPsy/b8FkrOzbHu52uBiXpgdZUj5KvWtuXRhsAzoW/JtWYv
	E+ezDkszHhGaov1jKu6dmYMEyPf79xV2c
X-Google-Smtp-Source: AGHT+IFKKOunXsjn4hXooZcv50p8WF3a7dxui616l9bO0fyzpMsTfI84K1HzN1Q65fm2cm9yZV+gLtwd4NTSnvr+pLs=
X-Received: by 2002:a17:902:d2cc:b0:216:6ef9:60d with SMTP id
 d9443c01a7336-2177a55b1a2mr46879645ad.23.1733932132125; Wed, 11 Dec 2024
 07:48:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241127172908.17149-1-andybnac@gmail.com> <87ldwxot7i.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87ldwxot7i.fsf@all.your.base.are.belong.to.us>
From: Andy Chiu <andybnac@gmail.com>
Date: Wed, 11 Dec 2024 23:48:40 +0800
Message-ID: <CAFTtA3NKxxh9=ZAfU1tS_4Jg0+6K3R6NWOPpRJHpPhurWKdOFw@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] riscv: ftrace: atmoic patching and preempt improvements
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, bjorn@rivosinc.com, 
	puranjay12@gmail.com, alexghiti@rivosinc.com, yongxuan.wang@sifive.com, 
	greentime.hu@sifive.com, nick.hu@sifive.com, nylon.chen@sifive.com, 
	tommy.wu@sifive.com, eric.lin@sifive.com, viccent.chen@sifive.com, 
	zong.li@sifive.com, samuel.holland@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org> =E6=96=BC 2024=E5=B9=B412=E6=9C=88=
3=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=888:18=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Andy!
>
> "atomic" spelling in the Subject line.

Sorry, I will fix it

>
> Andy Chiu <andybnac@gmail.com> writes:
>
> > Changes in v3:
> > - Add a fix tag for patch 1
> > - Add a data fence before sending out remote fence.i (6)
> > - Link to v2: https://lore.kernel.org/all/20240628-dev-andyc-dyn-ftrace=
-v4-v2-0-1e5f4cb1f049@sifive.com/
>
> Hmm, the fixes tag was not included.

Do you suggest adding fix tag to the entire series? Or is there any
patches that is missing the fix tag? I am not sure if this is a fix
since we defeatured PREEMPT 2 years ago.

>
> Also, there was a lot of comments from v2 that was not addressed:
>
>  * Minor spelling nits
>  * Breaking DIRECT_CALL, and include Puranjay's CALL_OPS work in the
>    same series for DIRECT_CALL, to avoid breakage.

Sorry I didn't get it at the Plumbers. Yes, I can test and merge
Puranjay's series and send a v4.

>
> I'll have a look at the barriers (which came up at plumbers)!
>
>
> Cheers,
> Bj=C3=B6rn

Thanks,
Andy
