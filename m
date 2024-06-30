Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7F24315B
	for <llvm@lists.linux.dev>; Sun, 30 Jun 2024 23:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719789058; cv=none; b=LGMWx6ihAhRuqVu5jQfF3D9Qwl9zgaAZ+pMrRvixCLf5Ee2BcyCHQ51KTiL172/QA2DQIwgrluyErJYQCXOYaBOUXyVaRMpM0gPs5zIbZuL55yA1hVRwYA4fSKk/D2rCPIFafU4OiB6ldCIwAXqm6k4vf9o172DkiiOWp6MiKMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719789058; c=relaxed/simple;
	bh=TTRudG4OfoK1soa87zkivi6mW95UIWG9iuTgMHdEIGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fAa+PJwcdXhdxztEXTJ9FpJggjsVcke6KRvrremFyRVNNpzrnyLb4E4D5QatPsGOo0ZDZoaqoZFeFbbxlvCZLgz884m9CHxjNhODMuIGYPoSCtkZ5HDEfeBJG6PSHCRe+bYTk9TdHEzwlel6Es2b1g8tiEECLhO4kiOxNwkGXEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/9VYMwT; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/9VYMwT"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ee4ab4076bso29608031fa.0
        for <llvm@lists.linux.dev>; Sun, 30 Jun 2024 16:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719789055; x=1720393855; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TTRudG4OfoK1soa87zkivi6mW95UIWG9iuTgMHdEIGQ=;
        b=S/9VYMwTMj2O2e495ZgKV0q9T//FSavXSO5rzbgEeABvTkUKb5BUySjANdPtPqQFba
         SCLcq3sDKNKosyXA2AhqIPHOAczJ9tWtkyUF+13PnC+1ZQNL39pruCFqqdI0fKzJBs3h
         73j4+Lq0Fyp2wVh6W7lMMHATpD8DTyfZRic/Y+c3vnxPi/UCue00wV7751aeRIO/ZcHW
         oYX97SsypVNQH89ctcuzCirqF4mvM6NjkgWTMt81iesTElRBmeHpX+nHZF1efjvj6hHg
         fl4ADruO9q6+OgtI8eamtud9Jy8BEOz74TlvcOjytqMfrb7CsL1Dh4Obxs08rtMEZCNA
         hVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719789055; x=1720393855;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TTRudG4OfoK1soa87zkivi6mW95UIWG9iuTgMHdEIGQ=;
        b=jhZGIwDCI8PzZnoNDEdGLNHeoVRvOPpju3LskaruMl8sf8W2qY7daLvhb+7RV7JA4F
         qWTpQJU5iwSjKNWf4gpdc2B9Dg/0pY+76XB5x4weEaN7YNloR5uDRL0Z5D+5StgmnwnW
         KttQw6L7KxI27HwSm8akrCGEC9GLPpY0QfDbzdMikC+DBr0aw/pZHCLW0mnOBw4Zu1OW
         NfRxpmnKkEWKo+W14DYHb/OfnG6ni5FTYHFNtSChxAI4hFlDmiyd/3HwXNCMn2azc5IR
         c04CxpUDihvlB9JQpws4NQ2gCitBoPKg3MFDiUyWSAvsihoWfFtsZrI8i6iLuWxQjqXG
         foFA==
X-Forwarded-Encrypted: i=1; AJvYcCU0l+cxgW1tSnA19KXXwPKqWRgvSgcjQLFgPbhthw3kXeYTliBDWjUzovm8hHogpnrjrpavH0/qpf66oAM7D6e1qgXbUA==
X-Gm-Message-State: AOJu0YzNwX0hztNqEFYJOTKbZpPxMYsU4SuDtzuW6ePt4SZ546Ee6Pik
	ExTb/ldKkCzSej2+LOzd1WoQgkRXRGuSZxiznFx9pEA7nEEv9gUBzjE/tqMOfuT3WKH714LX9iB
	SKeanz7y6sJSwhQ9dcq2y/7EwQTE=
X-Google-Smtp-Source: AGHT+IFG8kz5Bhj9UYahwomQgb2PbMKz779PCQ5QXwD9QXiaAY3FkHrbDm6cyHeyLxeo1iWTgQHqZ8c7MYbR5BiGzoc=
X-Received: by 2002:a2e:9c87:0:b0:2ec:5324:805c with SMTP id
 38308e7fff4ca-2ee5e37fa63mr10595251fa.11.1719789054360; Sun, 30 Jun 2024
 16:10:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+icZUU71k9kh3GGc8w=F4rdJeBc3LOPH-gNXrjTTUicnufe5g@mail.gmail.com>
 <CA+icZUXJj10358cBqxGo_zdR-JncbwPmBRAxiow3KRrVyHJjEQ@mail.gmail.com>
 <4622dacf-9141-4b06-a3cb-8e65b157c568@oracle.com> <CA+icZUVZnG3Mp83ZZzDCMMH_7+LBhrmbHO7b0E_0UYt63ymByA@mail.gmail.com>
In-Reply-To: <CA+icZUVZnG3Mp83ZZzDCMMH_7+LBhrmbHO7b0E_0UYt63ymByA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Mon, 1 Jul 2024 01:10:16 +0200
Message-ID: <CA+icZUXgYjxnuF9j_moT6goiR+TZT0X1X0n=z9_h5KwktEC8bQ@mail.gmail.com>
Subject: Re: [Linux-v6.9.7] BTF/pahole issue with LLVM/Clang ThinLTO
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, bpf@vger.kernel.org, 
	Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"

> Later, I will open two bug-reports in ClangBuiltLinux issue-tracker.
>

https://github.com/ClangBuiltLinux/linux/issues/2034

https://github.com/ClangBuiltLinux/linux/issues/2035
