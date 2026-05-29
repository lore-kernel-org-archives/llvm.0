Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B63933DEE5
	for <llvm@lists.linux.dev>; Fri, 29 May 2026 14:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780064981; cv=pass; b=uO/wn6ZKIYA+e0CKZvhlO9jFW9ZqNaxJ6wNemw7evZ4xtypP11P+WyJAKVhDkcQ0ACQkCJqc6+Y93AWV9Il/s3bPTygtPxBf7qND4WiL3Mv3DCoiZ4rfHu5Or80eAQaq0J4sn5T2eba/wbDt3gAhEtrYWUohNehU6aQn2dJq348=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780064981; c=relaxed/simple;
	bh=lHJQfjJ9pGor/di+xj2R5nKsfJvY4Z5yljq2O2JfxgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bcUNJ/RU8AuS7283nfbVdmBD3AfPSOCLvT8yyzOpMuqjIpjAbAVLmFfq1hXVv4/xoJknWNlFDEEU3h/YkQ/iUFUhEuCzBmfcJs418rwko7wIhLX1cs+PDYqzzh+lkTGv3NW32+eNsD7baVKUM75Sm4Xst2XDxD18/0bWGrPeH0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CElYKYyq; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CElYKYyq"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2ee4e75bc93so1121549eec.1
        for <llvm@lists.linux.dev>; Fri, 29 May 2026 07:29:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780064979; cv=none;
        d=google.com; s=arc-20240605;
        b=YCAdH4LvuzTsZh84725B32tHxRCrfIINcQjlUw3ZzZXObuGQV57rp8Q412lFzSxBZ4
         9OWsCndwXRAItq6Mza9GVKTAbeuxWbz5TpDRN3iO9JWZ7ZzGTjilynvQ0xUcfUoymx3/
         fGTqSEMTzUAG7uY52Gopo+xDwSwi9XGbM6U3DG2IwueCRu/GYX3yl3YYAy48OYJl4MuC
         sR7xEnhs6RJpNgdyo/ZyIJVYLh2Ijx3WAjpN2xe/+o1IVTi90Fsv/mgVMDKJBnoyepOr
         AxpbuiiECCWRcNU9EgMv/8+shyn6fU4sdTdqDiInhlLdW2O83g9z5ViOLyWmFjxbNs6D
         /hHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NjJKmutnUNBGPFFmHdw0hEt43SqCNilkH+GSFOwNlCI=;
        fh=HN/DrgizfTks5Ftkw4hn+pyl5x7wGNb93Nf6/z90xEM=;
        b=DlCdH4ZGIHhEEZbIQS92IQla2/uevxOZIANV+EWLmKzgcgTG9pD8iUIqIw453A3KCl
         BNWPYZD11g6FTLOeMJSp+kTmtVulS/JxmNMLcuUwTfGv46oV6pIxhfBof7XzzQZttrnl
         yzO7PILDO4FyMECePH/TwBb9h8jN2ON8HYqdLFaUuLtUqP/H9DbMix/2hpPBZN3ZLPdT
         IJHEasORtpa9sRI/si8mUbF6Sn8+4c7h0uNzlALZLxGfjxO6vEutjd1bswpuAQIA+Ekd
         Wg69HWkjyt+aJpQL5or4F/gTT2/toQ6RqFr+xa3kdjnBQUnL7uZC5MXP9aNWMQ5paWid
         Dm4A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780064979; x=1780669779; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjJKmutnUNBGPFFmHdw0hEt43SqCNilkH+GSFOwNlCI=;
        b=CElYKYyq7iyQ1BXjVgaTb1G0eIH00AgIqv6p25umTILqX0Lqdw+azXH6pkInIsYjOE
         3Pq66jvj6YqjxCAlu5f8AiOcd2ja5/TrUiR5hE6YyWq/M2LqPuJny/UAntDK62/I8GrM
         nQsdcqinzYlNnL6p2nF+6m88ynO+AIcKP+WWW4WzcfSMWFT2n6ucpAuraU9w/xR9MhR0
         A81a3JF6reDeRQmhcmn1ngtBzlItZe4Hl04whrHinHhEl9HF+LOC9GGCQjgDUliNZxuC
         e4o3DpBEWO04iGvYYzr8tc4ARqr4TudSUAkByNsx/ZMzphiG3ozsI2c37/Ig0aC+Vbab
         ccPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780064979; x=1780669779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NjJKmutnUNBGPFFmHdw0hEt43SqCNilkH+GSFOwNlCI=;
        b=XPjsvikhh8DzoZW1z89huDyRFV6vQyfkPtbCTtIbl9Kzjwn/lBib0/KY6RVdo+Vn0f
         76IlaeOSIl5pIEqJW9UlOotRqIyGg5bKpXiDN9CDm+0Xs6vpxXxS9uin4Y7wRkY3AFu/
         KcgEM7kLuILgMnVaEbhVJ85yd5OQZI/uptavqdWZgU7doS193XBl5+rS/rVNgIpfwCv5
         t02hwXZSAxovr3zUGp+ULVhhJ83inikJzXu5QgIvvdzmZbib/3qZllNsj1ygvCf4WH9D
         Ghz2HVI22oYAj+NeXHmUHv4nsjOi/7hiKYZGSF36+PHFPHLsZYvcOACNcDz1gUlybGGL
         xVwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+sM2ZQgBxlLAsc70UiKS8DazbhgMRcKIdM7zU/G1cAO564Y9oklmM0XuzCCNUyZQOghA2e@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7pQ1LTppsIPq5aaZcUn/sViOspSQ1PVY68E+wbJ1GLhjHFaNd
	vMha2peaAE5Djo9tfcoJk9Vdcmge2g2otkklitQXxS+rY3yreu6fYTWPvyFzfQyCaQNC1UfIPcI
	QrPljWrIdrP8vuWbbDIY/aIxnUPyc474=
X-Gm-Gg: Acq92OGRqb5ZNRit1V1t3rSRvdcSkhWjtkZ4yCwV1J82JpM8kKMKUec9mF9sRZEXPqO
	Z9L+RW3fYEfs0NRDAxe6d6szSeJoB9nib3k8r1V2PxYF1wvH88f2sAvrKrDGqn+T1FvFfsqWha5
	8RPPaHyurmMIvQyyMPyrdGbWxshXEsaZE/2OtpYFV85lwFI/fMgmHFZMa0hMmjVVtDYvFuNNBby
	7wB2H3scBi9GmkS0zlORkXq//xlG3+X+IfrcDDnRhSEm9VfQZ2ZJu2vhWTTL6c4qoxn+nQ/hqcF
	K8kE4zNZ0D1Ua9WrpPYl1sE49V2YzU0+l6aCXbGu3YHHAZGtocmUgmnRdIcElf7KPO00rjflUnr
	wcejgy7vA4ZDhMR79sfc8oS05tF73Da9r1g==
X-Received: by 2002:a05:7301:fa13:b0:304:5074:83b1 with SMTP id
 5a478bee46e88-304fa68c838mr7153eec.6.1780064979301; Fri, 29 May 2026 07:29:39
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com>
 <CANiq72mCYOXrWM7_3jby_ZvYmspXsYVzRqhTgQiBF0bdDLAaEg@mail.gmail.com> <ahkzD01e14wOTNBk@google.com>
In-Reply-To: <ahkzD01e14wOTNBk@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 29 May 2026 16:29:26 +0200
X-Gm-Features: AVHnY4ITXSy2YsBgESTon1imbL652KMxtXJwaINjczc3yS9Lri52BUZ0ApSInSU
Message-ID: <CANiq72=eccCAvfG4kYA52uV5+1ysU6QFYq+3GUgTVwJ4=kxDwQ@mail.gmail.com>
Subject: Re: [PATCH] rust: arm64: set uwtable llvm module flag for CONFIG_UNWIND_TABLES
To: Alice Ryhl <aliceryhl@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, stable@kernel.org, 
	Bo Ye <bo.ye@mediatek.com>, Isaac Manjarres <isaacmanjarres@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 8:32=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Hrm, is there a way to perform the version check in the Makefile, or do
> I need a Kconfig for whether the fix is needed?

We shouldn't need a Kconfig -- we can do e.g.

  KBUILD_RUSTFLAGS +=3D $(if $(call
rustc-min-version,109800),,-Zllvm_module_flag=3Duwtable:u32:2:max)

I tested with 1.96 and nightly -- I can apply it to the Rust tree if
arm64 prefers.

I hope that helps!

Cheers,
Miguel
