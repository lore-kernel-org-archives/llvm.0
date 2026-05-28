Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619CF1A680F
	for <llvm@lists.linux.dev>; Thu, 28 May 2026 05:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779947791; cv=pass; b=UdTiA7M+N/jEcSRP0k95W6aJ2cKTUm4Cpin4U42cyMEiyhy/9Qs9FZNJWweKv6hP2t3aTO7wtg++fs8Hpm7xrkmln8Nu3YvZAwSTjux8yBtc4crgYbJTa3MQoC0FKprKJccyYisrFhFs1v/LNFXNAvBCXhCIBUIOlV1rcg7nOkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779947791; c=relaxed/simple;
	bh=SHQe48/OG7Vdmb6Q7Hpmrn028N5c0kstT6AWGJ7acBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CjtLcfzVgm1bak+l4ikCfg8xs3pTs5VZpTXcsmNKpjbUU/g00ItK0nM366fKmy09F4NnsYM+Tzzd7fRRARWN+kQoFIToBkvicYlBUwM8zsIZkHgtJfWUzZ1MzYRukOdn+f6Xp8saDjsapHNW7GsnVcQKu42UEpaP6cHDOx6FGaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CYC3wjSC; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CYC3wjSC"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2f0ad52830cso15879487eec.1
        for <llvm@lists.linux.dev>; Wed, 27 May 2026 22:56:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779947789; cv=none;
        d=google.com; s=arc-20240605;
        b=jUqnrby2yOcy7u3lQVh4wZln8SA1H8OOY44/63U2AS6JvEae/G8EOm1NZaQORNbBrK
         d09LsucOzbL45YNcZpVZetgSK6RV8xlz749hyZ/psmZTfP1Eq1ZYTVjEkTyEHZFODlPN
         gnMaAYOA+EDtbgR5FAflWJkI62s7nSkWtgjx4brjH0hRUafjiUbNk1HW0FLyQH1q+Z/l
         1S5ZwU0Yb8QYF0phrfN37/Dj34j1/vocFrHn7t3ZCNAx/umzsnzOwWr9R3mK0PEapfdS
         G9PEVFOaqFBs4YHUtH5X/UUD8Vdt31dadYJ2r3cOHVY+kJQtyrN4aATyY8MmGyX1nHl1
         sYDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9/tAvDfBZY4caNpdNLD3RtS2Pph9k/Hgin/a4k+F0Cw=;
        fh=9SHzoW14Pu1D51D6iPoBoQ11nFmoba/pkFbAv/BMyko=;
        b=ihPjeUP1izhNSmjf/asoe6S4+t3smwpEEDvOjh73+rzkbRmA9QdkuXCcbbF2Ak2oby
         +dBpbd12aKrWbMLsU/FY3hu0/i+RUNTEar2t3ic5M6BsN2bl+yEznWBCkP7vif1xF9nD
         zk8P16NhMzPgw4P0jgFWswUO1c+5oa6sUg7IiLUq9ROZXScm/JjbCHn24Gq+l9nBT0DB
         z01TWfddWJmihnvstt54/T8CKsMnWb8TlJuWY5Go23byAfJGoOdx6DTH42nLTXVuEW4Y
         fjAn/TxqLdTZzDr4z+XDLioJeDfuXN3LIBZ4Gxbsj3m/oYoiKL62Pje7rIWpLd5vsNYL
         PYhQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779947789; x=1780552589; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/tAvDfBZY4caNpdNLD3RtS2Pph9k/Hgin/a4k+F0Cw=;
        b=CYC3wjSCIFSqmpAGjNtCKf3dvbcpo78m/5PePCwrzOMp7f8EDlahZydNzt2cjlnQRe
         rbK8aN767MWxk8YoEoKRFCFSMiyJaJEqPOmev6BlpmlZfp8slmDFrrk+cLvRxmYmf6ME
         QCI2MydwlNzENchtdlWCSvmX0dM34HjKTu/+kRs40/+RnRG0Br485Z3ANtm+155/navX
         lNT2GK1FiVDf52HoyjSpuPMfT05y4dldssYaAagCB2kwCR5erbpNxhN9H6oiwH+4a9oH
         HP7Y8ArYObOZ83hKmon/lewMFUhVX8EYCDqUrYq33ZZfMJKkHNMZoRXJWxsKpLKLj8PR
         UCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779947789; x=1780552589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9/tAvDfBZY4caNpdNLD3RtS2Pph9k/Hgin/a4k+F0Cw=;
        b=V4V1MQcaNPbF1sp1mGqf3UYrOmYiqtKSDJ090vVmgjf2ZynqFmksp2ddYYDNX3c8d7
         aZ/+uUAQXi4IjAmRySpqVLNuP2iHbMOtXNuIf2TNL0QLD9qGYgRsuzstla+3K2f4AJ1/
         htnP28HZ9uFTBH7Wt4x/4FH9xRDBu2+vCNnevMMkozIOjB0I3970aa9ZTS0krwI4GQDz
         w0DmISiYLWq7507YUthxetl9OCGbvSwWf5sRdS2WaGvEtQ7uH6qI8U2WNAvPYwV0Ijey
         DXY1cEHw9SQRhP7h0tBr3IvhF05h4ZE0uYfXWX+b0sxxmCPEoK1UfhVS3qYSTD8WIlbw
         LgRQ==
X-Forwarded-Encrypted: i=1; AFNElJ9lCnzQh1uJM+aIdXTZfT0dLFc7mpwmENhygllKjg52NQa10FAuVOC7LaKb2LMIwjt+qGxe@lists.linux.dev
X-Gm-Message-State: AOJu0YxM6dKMVC9W2F3b/6r+1F2LOS0FOAowOEPG9/0tB6E2uWJD/QsT
	hcys7Zx1lbcJ9JSjKBo6ls8tbhty8zp+uxtL1fScgBz7+tmWbvfDGkP2Xf6yWTBIuj02fJuFM/0
	ndTnAx13dC35BEevwqxy5gWGeNDznN5mdhCvOzoMr
X-Gm-Gg: Acq92OHT6tPKx3f4Sun+OGlwhHrTgC8Vs3UKjqa1xeajKjfhjy8QsdK7QtGs1lIUVts
	2d7daGyLqTYVwUiQi7G633WT5UebEBAm/VUlXCds8fj72JJZjEu+xg25cmXzNYWvxTZLeSmBpBA
	MdT2FIVpz9wjuu7w2csc1L1mEpE67WwYMRFVzxPMvfKH5jrtJbmmZRJ4VEzUTQFSVqoTOGp8UU3
	XEHKwyCLZoRhemN07iiqDV5G0ywnLg9uXmojr7/pRApcdl09iy5FSv0/r5RIIrQ3Kha8ZlHxdP1
	diyPFRcQ95Rhy6yp9hedHN+kDkuMhKqgb5FRRveX2FTI87gA
X-Received: by 2002:a05:7300:2389:b0:2ea:b975:3db1 with SMTP id
 5a478bee46e88-304491d7957mr12069640eec.23.1779947789049; Wed, 27 May 2026
 22:56:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com> <CANiq72mCYOXrWM7_3jby_ZvYmspXsYVzRqhTgQiBF0bdDLAaEg@mail.gmail.com>
In-Reply-To: <CANiq72mCYOXrWM7_3jby_ZvYmspXsYVzRqhTgQiBF0bdDLAaEg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 28 May 2026 07:56:11 +0200
X-Gm-Features: AVHnY4Ie_gpq2EI8eezCf2IRezAi1N80vE8gyBvflGswgtsI7hjNkqwxua2zqnE
Message-ID: <CAH5fLghSe9tV+CJkqp5CkUPfugZ7hvMN0XHsh5kY3vs=3uQ2FQ@mail.gmail.com>
Subject: Re: [PATCH] rust: arm64: set uwtable llvm module flag for CONFIG_UNWIND_TABLES
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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

On Thu, May 28, 2026 at 7:26=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, May 27, 2026 at 8:18=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Once the fix lands in rustc, this flag can be made conditional on the
> > rustc version. Note that passing the flag on a rustc with the fix
> > present has no effect.
>
> Already landed now, so if the uwtable one is enough, we could already
> do that since it will be 1.98. But since it has no effect, we can keep
> the fix as-is and do that on top too.

Ah, yes, let's just add the version check.

With regards to the frame-pointer one, it's probably a good idea to do
the same for that one. It's not necessary to fix the boot crash I
encountered, but may help with other issues such as backtraces of
ftrace.

> Added and linked both issues (i.e. `uwtable` and the `frame-pointer` one)=
 to:
>
>   https://github.com/Rust-for-Linux/linux/issues/355
>
> I have to send a fixes PR in the coming days, so I can pick this one
> up, but if arm64 will do so then:
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
>
> Thanks!
>
> Cheers,
> Miguel
