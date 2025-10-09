Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB5313E02A
	for <llvm@lists.linux.dev>; Thu,  9 Oct 2025 18:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760033722; cv=none; b=K80KQoXX91uFROk3Bu2IZ8XWlZ4y8hx2JmdX1oeswZlLjK0TIZ+XjGsHHuCljGzFvWzADS2boPhriESqN8K+hQZluwiU4p/RUZWppiiK0vMhbmBqld+9Eo+SDEaFmH9L9ftwAhECumNDxgBfjypuK+zJLId7ibweHOOjcROU2Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760033722; c=relaxed/simple;
	bh=vn4n4RSlfropTQ5buc9FvEgi9hxnZliFrOPmLk0O+rg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TQq9Pc6pWFjVZBn4K+m5/whfIj0Q4bBeo0Tmi6dLbmOXeledawd73ml2pFax9/vBPsttOb0ojLJM9M/s9eolsnT7FjOVHqqGQAlZslDJpw62fINgSLda6/RINTdTUpzz/NKgHUPD3sdz9sNu+xceExY/oAkTL5ONahqvbugdObM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzDBBAjr; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzDBBAjr"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2680ee37b21so2230315ad.0
        for <llvm@lists.linux.dev>; Thu, 09 Oct 2025 11:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760033720; x=1760638520; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vn4n4RSlfropTQ5buc9FvEgi9hxnZliFrOPmLk0O+rg=;
        b=bzDBBAjrQKZolbdFoXSyFLCCQ0KGfoDOcwlkkN85tZF7gHmkRkLpVrIlyyZwYpOGdy
         cDqX0n1pNA3YwrJ6nt09/z7fVTKEUVLqvp9cKMGJcAfG+j2Rgsemn2dfwaikwEdj/DM5
         xwTQ4MNG0Qdr1sHpf6Ih+mis38OrSvGnKRYyDc8MHGw8c81V3RTM/4zUPvD2Ghtrzh54
         Cztq+hRoDpjptYQVmVwrLiUKtQTsi2wVOJCUYZIyUdMNugpaEKjoWDQjnDDg3gpFyiYZ
         Z0RIXrI7uKqltn2LflwwVGt2biDPS5jyOmR4ywKHFdZOeflJr6tmXhwS+zHSzLXYR5q1
         qRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760033720; x=1760638520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vn4n4RSlfropTQ5buc9FvEgi9hxnZliFrOPmLk0O+rg=;
        b=P25UFxXTLe5DaHfaN0FIGlJLVmFlYZ+dH6bfxf8/hfzpH2x4eHqgxOTAs0RroR1KTS
         vWSCPXBbqJRz9FkquvTgh/g6+itjuF11dyf/CLDl0uh7qOZoUVPPaOI6Bh7soSog3rYu
         2gRVtQmfo2tygvp84wGxI7kCHM9iynr4DwGyaggEC2uSscea/Fn+J1tngPXfyo4DjN4t
         nsV4vw1jZMkj+nBMsJ3Itw3+kVE0vyTh8c4UB5XxGYlXLMiCABo7SyVCxppQPsodUqv9
         mV8PogK9FtJNm5yJsyTy3OjjaN8/ldiygMX3wLXWDMtJiSDZ7wgoxKy/stOWEOcL9YyB
         ST7w==
X-Forwarded-Encrypted: i=1; AJvYcCWMvBH0gi5lwfSh2/XL3vEX0eKV2IIXu7UdnJvnafdbi5ZBNwDiaPfRQ66d/kS5ET//+9vp@lists.linux.dev
X-Gm-Message-State: AOJu0YxiXRZK9G2zfHHJrIPAVVcJ6y+1r1lthaMPN48kolZxX2OuyWPY
	Nwen+6/onZguuk+wlelLngUK8g6lGBihSGT9zhuiJwWLJ8I5cEgkxqdxm36v9ljRYNkq9CWxzxT
	L7RqABwAm5Lj84+oh7Io1hQ2HZUGvlII=
X-Gm-Gg: ASbGncv6VyrWVC6Jko2ZjWqonimUUldxledAldLpzBmQr9A4i6w6fWLJiw4SpiSeTAg
	4yvcHTCm9XR/rX+SEBwNeB5SP5Ok8Zff1fXD74G7bBtGm09F5KGQE2p/z9885GsPGr6UCCWzZUP
	/rlU2D4W39HZkNiTiBS+xuMIx/V35ncFdADf6MMCdt9hvtSfNz3QD/MUEibwhpfHmzd/GlM9dmC
	pWGEqDnO9UHix4rTNhPjFWfGTgdNMIVsx9DIxREdyWQAQ7D9ZP29uCC8/HdAWdMPMf2c0jh2Ci4
	jl64K/Hf4y3GiOan2gBwcwO1MM2k9O4Lc6z2lRSsBNjEu4zjqQ==
X-Google-Smtp-Source: AGHT+IFc9KYDo0vVba2RUD8DAtI69bgAyM4PDwpagg31YnO4T9LE79wjEuU97MRUl6V1rW7V/9/UNL+E0+rlTC6BKDA=
X-Received: by 2002:a17:902:c94c:b0:28e:aacb:e6f7 with SMTP id
 d9443c01a7336-2902723ca5dmr61015185ad.3.1760033719751; Thu, 09 Oct 2025
 11:15:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202510100127.yuqhg8uo-lkp@intel.com> <20251009110555.29a67af19f5cc4d40e66713c@linux-foundation.org>
 <CANiq72kKSz=UK+O4tnV0Kmw_HmJhJJ+KNZnUBWtOWqanrG+7Vg@mail.gmail.com>
In-Reply-To: <CANiq72kKSz=UK+O4tnV0Kmw_HmJhJJ+KNZnUBWtOWqanrG+7Vg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 9 Oct 2025 20:15:06 +0200
X-Gm-Features: AS18NWBY_LEofIxL13seTuWRCLS4mtbWJ5eZPeFPnSTCgp-cv4muXJzm_9R95HE
Message-ID: <CANiq72kTPjukgmAxDfLg2s4JHdaKaw=bY4DLVjTr7-9bqv5D3A@mail.gmail.com>
Subject: Re: [akpm-mm:mm-new 36/102] error[E0425]: cannot find value `VM_READ`
 in crate `bindings`
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Jakub Acs <acsjakub@amazon.de>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 8:14=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> We can either define helper constants in
> `rust/bindings/bindings_helper.h` for the ones that the Rust side is
> already using (like last time) or use `enum`s on the C header.
>
> If you have it in a branch, I can prepare a quick diff for you to fold.

Should I test on
https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new?

Cheers,
Miguel
