Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E802036AF8
	for <llvm@lists.linux.dev>; Tue,  1 Oct 2024 05:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727761908; cv=none; b=lAnrvcXDcirZIBOa5SRfZKZrARTWrDt0ygl18hpifWJ+8sVOlEXIXmlakKrAu66L/cojW/Q+qBxCaGKdU8GsBXPYNAFYx8teLq8a+y5mCNA637JFnIq6K3C0Hrall/CmfB6rDtpPuAQZBTcb/6m9YrsEIISPkq1IdJhWJsbCVyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727761908; c=relaxed/simple;
	bh=3/wRht5chjIqgH1ON7u8+YBRhM3p+Px11yM4Lw3cLa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pHxcohCbi/ytSh2fWuVOZriG8iDjZwqlEKmUiSn55zMXo5vyZr6FkOK6+bE0VSPANprzNkkkjdL2sfLgfZ0fL+nKsX2hd9n9s7xXCmEVtKjHdx3XnS8i8bG7IkM3NBCYl+B3domTU9uOogqTQ5SUOBsg/Fp+Gxk2b/800MEaMKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDPbF6yf; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDPbF6yf"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2e0b46df34eso679824a91.3
        for <llvm@lists.linux.dev>; Mon, 30 Sep 2024 22:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727761906; x=1728366706; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/wRht5chjIqgH1ON7u8+YBRhM3p+Px11yM4Lw3cLa0=;
        b=bDPbF6yfrDlORqHxs292kCa+kqpkuDUNOL9VuEQ7oojIWt2l5LxcHCrq0saTBQiOnP
         UUKsziN+dHxbqvNaub6iD7X+TJ2OdluaBFRsuvJer4TesEQhNzHyB80qwXpdd7eHz1fz
         FjF9he0iG8prTOm6SJxYoRPN4IBD9IOChHZJp3iNONf86lohD7k/GOQ9TW9UqeKuJoxy
         VAtKPseAUW3f4d7EvRn037MOTkc/KG4K+BzRD+9T1ONfkgQd1qjd89nixOg2UZ2KOcwx
         DSqGHwW7fNyMm2kXtIQEaGLYHqBMPhhQotNbtL4cGDoc5oNaqJ4Wa8liDF4roauucQMB
         4BQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727761906; x=1728366706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3/wRht5chjIqgH1ON7u8+YBRhM3p+Px11yM4Lw3cLa0=;
        b=MboiIs6S+9XOhZxGj21lvDgf2Ks7As2KEDGzkiu+ul7qwZa7GiVDexymzDpzezA86R
         cskANJ0JiMloEWL3vMrGONK8yFiHLgQj3lWFR/ME6a2X/pMQ+2yW1mejO+Twf1LJkaTJ
         lvzRlLtBB/nhuGcUr9ocRv1CuKyMH6cJBCApo1OX4YQVZhqgs3/BBJSqu+t+aN8GOLXi
         juLutzHuOxLth4V+ldPaMkaz5RD5NKBOlk/satKYnDdNTOWlJ4c/epsFlnva8v+fDyAP
         R6M/uo0mMQL3Wf/mcPhDy8HoPKOLOvVH2v1C/lyi0Zm1hh/DYsC9dIAEYoGY/7BaMCcy
         FFug==
X-Forwarded-Encrypted: i=1; AJvYcCXtCMu+M95655Qm8V82MlWJLYJU2/3wIsYJEs9pG3+SnxwOx2+pF4TVAyDvdRCKHD5DfqEP@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0jBOuv1Hz+2S5WtP2PNyAAsgnfyZHAEy3lb1QPmX2waJFkZvL
	MpMfTm8Zd8jLGhUM7LLhOI7TCN+TG+pDWMht+Bpf0tpyTx1GXVsribGNGGxnbCLWhO0UezVNJ3L
	Xaf130O+e0AHuWovFgR/G2LX7UnY=
X-Google-Smtp-Source: AGHT+IEIwfs2ae50IxJcrYEx+9x6jDhkTa4h8dXquDWIxEFs1VpueqZk22iLQZsgbP1/FJwllipH1R6cUki2Wf6ve+w=
X-Received: by 2002:a05:6a00:b85:b0:718:e49f:4185 with SMTP id
 d2e1a72fcca58-71c6371432cmr6551145b3a.7.1727761906110; Mon, 30 Sep 2024
 22:51:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925-cfi-norm-kasan-fix-v1-1-0328985cdf33@google.com>
In-Reply-To: <20240925-cfi-norm-kasan-fix-v1-1-0328985cdf33@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Oct 2024 07:51:34 +0200
Message-ID: <CANiq72kMHp=F8Vyu5t2nPk86FB=PwcaxZQKRs9Sdj8FrvpQv=A@mail.gmail.com>
Subject: Re: [PATCH] cfi: encode cfi normalized integers + kasan/gcov bug in Kconfig
To: Alice Ryhl <aliceryhl@google.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Gatlin Newhouse <gatlin.newhouse@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, kernel test robot <oliver.sang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 10:10=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> There is a bug in the LLVM implementation of KASAN and GCOV that makes
> these options incompatible with the CFI_ICALL_NORMALIZE_INTEGERS option.

Applied to `rust-fixes` -- thanks everyone!

Cheers,
Miguel
