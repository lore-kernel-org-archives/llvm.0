Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF10A408032
	for <llvm@lists.linux.dev>; Fri, 29 May 2026 14:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065930; cv=none; b=qvCpmSPY6IJZtyFRx6vAq6C8MjFkMsSboK9xZk0e88q3b5zYCBi7j9G+7WD5C+2hOCdviVXWE9MhExBtUc40k3gYImJ0hEB2hafTUKiQRGKSrICbPlQjTnhpiyjnMVmaFwJKubxOUGcpAX2cEIf8qEU4mBIhqcf/WiyjKrb1Igk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065930; c=relaxed/simple;
	bh=ofVgBl4it8ZU6yqrWiQbNGCpR3Y070NOzvRXGVYAgoA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qyjtpHUm2Hgd/CmyFA8TH65KaAluWGB9GMVWtVbLmVoOndXq7ZgWx1eO06nS7F1H9EHUSQx+fKaibUwRDX6s2zj3U+6nUhDg+ZQycDtFaoXOHi0cdMMyFn3CdHS1x+KKFE1bD5Zh3nxRLmni63FAIAJsA1Iw6KDpr805pjOjSHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pUzlIuUT; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pUzlIuUT"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-48fdacf2616so73289535e9.3
        for <llvm@lists.linux.dev>; Fri, 29 May 2026 07:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780065927; x=1780670727; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ralOVts9fCNQ2tqBK8zNgoCjriSrrEOepBDVwIQK1cc=;
        b=pUzlIuUTuRnPP68pyjwdJ5YfVVLac3FQ56JwfeaG1B2IIWIesNCsnaajI7c9T7aacP
         C3GTWGWSFB/k/x5d4C9OisEfSUdyttJHERUZam1H1hPnskMdAW3apHWzWChT1IJAzOJE
         SheIayFwyxgByB90581THjukS3xeayXegoDzshAFfaTCr+9GSWaD+67kpga+fjWq+e2T
         ahvF72uS2DhPPUniha6wQ0EGjrlp4Om04yRRSbAmZFblcCTrFwSSyNLUJeye0hyRgVcz
         sxAb0J18hMQCvPSGJCJmIBkM2d6tge88DpxDH7kDBwJE5tx2Czr//r0ZLQfh0WIoza55
         HWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065927; x=1780670727;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ralOVts9fCNQ2tqBK8zNgoCjriSrrEOepBDVwIQK1cc=;
        b=H94X8Usj6dhrCCc1kDqAjYlGB55uy0xsV108U/YC1GiPOnkvZpJBQVfF+L7MhFh1kY
         sCZV2AMcTTbpWx5h+wM3NaURc5qyOvTpZm3edl0bNYUSNmK/eeJspjTPlo+jg2PUX4WR
         0IC6KdxgnZXcH37048oWbvFuGctW4XZLNx+7FKFlzUdHRMWtL566GQoWFpWauHvtbvsj
         TNcWH+HzyDBbGpUnIDRke/d5PqsN8zIHAGtQLxgXmq3EIntw9Uy94f6dw3Cf4ngSlvoE
         l4VibcGila5nCD2gHSwRMcXe6RvcaD1OLLosfiEwGqogIMo07vdwKv9bsB7dTPnNlSa5
         b5QQ==
X-Forwarded-Encrypted: i=1; AFNElJ8f0+fufm6TRJM85QLC2GQOPU9Jl+TMgwmfCGoJuAlpjLn2nVrRD3Q7gSlZGyPRJmOTBb2A@lists.linux.dev
X-Gm-Message-State: AOJu0YwcscwCIQ4ISlZq5+m/KqHrEbzApAfhsIIqny9Tuva5QRtq1hBP
	IswDj5HGDLa/BRoeJZPw0fO3R3oV0pQzFeDwFHZMC6ECC1HsJ6rXngcIS0qPmHMxkMjVW9ziD5r
	5fRlfmRchODfFAkG/7g==
X-Received: from wmma4.prod.google.com ([2002:a05:600c:2244:b0:48a:93d2:60ec])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c0d2:10b0:48e:7854:1608 with SMTP id 5b1f17b1804b1-4909c0b34e3mr44173425e9.25.1780065927012;
 Fri, 29 May 2026 07:45:27 -0700 (PDT)
Date: Fri, 29 May 2026 14:45:25 +0000
In-Reply-To: <CANiq72=eccCAvfG4kYA52uV5+1ysU6QFYq+3GUgTVwJ4=kxDwQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com>
 <CANiq72mCYOXrWM7_3jby_ZvYmspXsYVzRqhTgQiBF0bdDLAaEg@mail.gmail.com>
 <ahkzD01e14wOTNBk@google.com> <CANiq72=eccCAvfG4kYA52uV5+1ysU6QFYq+3GUgTVwJ4=kxDwQ@mail.gmail.com>
Message-ID: <ahmmhcyfgZQjnOcX@google.com>
Subject: Re: [PATCH] rust: arm64: set uwtable llvm module flag for CONFIG_UNWIND_TABLES
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, stable@kernel.org, Bo Ye <bo.ye@mediatek.com>, 
	Isaac Manjarres <isaacmanjarres@google.com>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 04:29:26PM +0200, Miguel Ojeda wrote:
> On Fri, May 29, 2026 at 8:32=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Hrm, is there a way to perform the version check in the Makefile, or do
> > I need a Kconfig for whether the fix is needed?
>=20
> We shouldn't need a Kconfig -- we can do e.g.
>=20
>   KBUILD_RUSTFLAGS +=3D $(if $(call rustc-min-version,109800),,-Zllvm_mod=
ule_flag=3Duwtable:u32:2:max)

Ah, right we can do it like that! LGTM.

Alice
