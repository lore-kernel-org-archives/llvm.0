Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2B01DF695
	for <llvm@lists.linux.dev>; Fri,  2 Aug 2024 11:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722598923; cv=none; b=uoFdUC/CtHxy/rLOurlZRgp0K9+AGq5SJzb6O4z/xTBH/PvKPPLQGT7ndiHwpmoqFqyy8kKwtKRfgbvlJq1uJcpx1YTr6cVPpERMfLPB63J6yrVyOr+fWaC6vipZOT8TSPnzTUujWlYBtbDb2RI45k7E6zxtWqyQ+UUxdAwcNMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722598923; c=relaxed/simple;
	bh=8S6p9awCbWfTs8HBlKagADZW0s6ZNmODF23unQPAk7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l+6GE0hdRHAMo3a/10yeDQGFxU+uu2CG23Rhc5vE9CSXN/yJYNBE0yCZ0U5jRt+5qqti8rYVepbKzlR09Mvc12LLY9B0sIITcmVKH9doEg918udacafw3EkleauauRqn6PF+wxlfne6Q71vWcyvzP8BC6zpnQyf578FsNQ4t44w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RbpXRB4i; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RbpXRB4i"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7a1843b4cdbso4810618a12.2
        for <llvm@lists.linux.dev>; Fri, 02 Aug 2024 04:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722598921; x=1723203721; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8S6p9awCbWfTs8HBlKagADZW0s6ZNmODF23unQPAk7c=;
        b=RbpXRB4iElc9Gfl6jo5y7rG8ttTXwJI3sUFuSNTp6lVV8C+KSUyq1wvJCHjw+oHVZb
         RpCytogxyH0Yn9f2gKmIG9LOfLwf82r7X5QogEAkgIr0VYUfoo32gJvobOZkkSAtkCdg
         YCpl2L+TaG/K0IKY6wLNToJyUKPs33SiKQXNu8BqoI7LWP8ygwBoz3vdKWPBunu+VSUP
         RUu9YN0DdjXYuAW0rWWkaEgKSKFkpr2A4TJ2tp2QrGo9k05hWFbmyHV3fByaQ6vqSgmr
         klqK31as8xIwx2xDUTtQz89PWkj8KB88ir7Grpa65s3fZ4XrS4Xu6gwq47mNs0J35FoK
         G73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722598921; x=1723203721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8S6p9awCbWfTs8HBlKagADZW0s6ZNmODF23unQPAk7c=;
        b=jERH26VjtwQfZstELMPRb46nP4EZNQeitI5MAxMmfuUxG9stq0KNGnvk9jT1L7lZqg
         6sL1bqc3sCgjKjwZV4AIAFJSHn2VTzk79OTNvBTaR3TTamusio6QHui7FduV4Vm54EAg
         IJJvWktnTcecAinf5IDI9NXxhUt+tT9E383nj38fEUxFa0eJhIGW8GNvYo8kVJwGBjaw
         i4jeg0Jcf030YVTFQoKqrtlS4x291DJjgvaRTTvS02F3dkrjzWlz+ux3+EW9ELJodSLp
         GoaU8FDpv/YpfI1KObh7qPtU3GUDAK0SOkHRCffMAItdEBh5WzhPGzaABHUNxMHSKSAx
         IW4g==
X-Forwarded-Encrypted: i=1; AJvYcCXlW3814cRt2ciqOYGNpzb4WMYHKO5+8mbZ/jryPk/S7bIbafMoV/VvXgibVsMsFbT0TMwcLHhhd2ue9kFmUmUbjd7c8g==
X-Gm-Message-State: AOJu0YyZJAnYmn7FPDMQtjY+txQ46HgABAEjM0RnTBo/J/o0AdM6Q3We
	TwWJvCRN0d12/+W0UdTLry9wWR78a73qM7NgAwhXMTpVli4eSjV4ZPxGa4iLN6SJiHv0DEf0PVn
	7cx3DHPaXypehtEekpMS2yoMUOEI=
X-Google-Smtp-Source: AGHT+IFfTNp9sbkfU2rlJ0CAP0uftsoVr57L2GgZMd1ai2v8/T3RPaZ6pt3iGQwfXmZUpG+qZxLYAFaOA4J6UzOiw4o=
X-Received: by 2002:a17:90a:df13:b0:2c9:77d8:bb60 with SMTP id
 98e67ed59e1d1-2cff95670e3mr4034882a91.35.1722598921465; Fri, 02 Aug 2024
 04:42:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240730-clang-format-for-each-macro-update-v2-1-254fca862c97@gmail.com>
In-Reply-To: <20240730-clang-format-for-each-macro-update-v2-1-254fca862c97@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Aug 2024 13:41:49 +0200
Message-ID: <CANiq72k+7dedfMpQUgA6ZuNmWwQJ-oQYQWzhN1JGynbxix5bPQ@mail.gmail.com>
Subject: Re: [PATCH v2] clang-format: Update with v6.11-rc1's `for_each` macro list
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 7:54=E2=80=AFAM Javier Carrasco
<javier.carrasco.cruz@gmail.com> wrote:
>
> Re-run the shell fragment that generated the original list.
>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied to `clang-format`, thanks!

Cheers,
Miguel
