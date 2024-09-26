Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C554166F2E
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 22:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727388943; cv=none; b=ulL4f9l1T2YlR9f7xq6q2nrzEdAzzNAztLMTC2+FuJmYqyAz2yz+uRodQJpA962WfMbQkYcUgJ0k1m2ouIBKQqQBopNyYN4N9dPV8lA1qIhhMo8qXvoTXsk7dhL/npcwTfI45DyBy9VKuuIijapADZXMlrdJMElomaVs+HGx63w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727388943; c=relaxed/simple;
	bh=a7lQxjB5vAt7XR3D70QQkmA1FkD61vFz2NnvkH4tqqw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bvTk5JKkRWJ7BOkA6jTZ8LDMRKRQWtMsKNZOwIa/aW0G/P5uYw+VJS+bGlTGo/qFeq9krsFNTW75i3QbOD/56G/jBdh1qlb9IjvU778WYrLuUIDZr72ZcwcZrOkUFn88CkW/6MImzg4ZrRdBXgGfy8Zmf3btTyncxxku7DvitG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=EHCz+yYq; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="EHCz+yYq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=sjiompxxgzbblb7bsqakrkztua.protonmail; t=1727388933; x=1727648133;
	bh=a7lQxjB5vAt7XR3D70QQkmA1FkD61vFz2NnvkH4tqqw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=EHCz+yYqVWBYvE7QhsXsxR61fLdJvTVrtKKx4w1X26nZmhDKHgRSrUqT/zh7UUDAH
	 mCzsKQNbxiL57yYOsS7tP2K7ITlfQvnJvdrBjLawzn++rsqD/HR/hm9KqeaLKMUDRJ
	 qjwZ4fDkttopSYNY88JTN7PcTde0E/4HEt/lgXG5F6l6x/wZG4h9YxyyHljShfsM0x
	 rL7BObhcMoSlbuFqczkhjQB5vOQBnJQY4l8pBLauaLu/KoNQ71C+04bd6Z/J+5Kh1h
	 m5D6yG8oWkKG1+8ELWLIhiyPdS3rlCIZL+n3KV2nLZhBfmfG/g5DhBQhm5EvpZ8uDY
	 SxMlTv5lmwX9A==
Date: Thu, 26 Sep 2024 22:15:30 +0000
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: kernel test robot <lkp@intel.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Greg KH <greg@kroah.com>, Simona Vetter <simona.vetter@ffwll.ch>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rust: add untrusted data abstraction
Message-ID: <1aa088b1-ca4d-4a97-b25c-96a18f62a79c@proton.me>
In-Reply-To: <CANiq72kXGNyLg0Ooo3Ne=KmZWBnSO9HE2tcfP=gf+WGFqnjDEg@mail.gmail.com>
References: <20240925205244.873020-2-benno.lossin@proton.me> <202409270303.kUIAmOmY-lkp@intel.com> <42d17306-1ac6-4fc7-ab1b-69ef045039ac@proton.me> <CANiq72kXGNyLg0Ooo3Ne=KmZWBnSO9HE2tcfP=gf+WGFqnjDEg@mail.gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: b17224aafd5919dafc1c1151b0f42860ba81b85d
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 26.09.24 23:56, Miguel Ojeda wrote:
> On Thu, Sep 26, 2024 at 11:40=E2=80=AFPM Benno Lossin <benno.lossin@proto=
n.me> wrote:
>>
>> I would like to use `#[cfg("rust version <=3D 1.82")]`, but I don't know
>> how to do that. Do we already have support for checking the version in a
>> cfg? The alternative would be `#[allow(unreachable_patterns)]`, but I
>> would like to avoid that.
>=20
> We can do it, but it requires adding a Kconfig symbol, sadly, since
> `cfg` does not support numerical comparisons there.
>=20
> See commit 93dc3be19450 ("docs: rust: include other expressions in
> conditional compilation section") where I explained it.

Thanks!

> So depending on how often we think we will hit this, we may want to
> pay the "cost" of the extra Kconfig symbol. Otherwise, we can just
> `allow` it as you say.

Personally, I would prefer adding a symbol. Since if we allow it, then
it might take a long time until the code is removed once we increase the
minimum version.

It would be best, if it produces an error when we raise the minimum
version beyond the one represented by the symbol. Is that already the
case?

On 26.09.24 23:57, Miguel Ojeda wrote:
> On Thu, Sep 26, 2024 at 11:40=E2=80=AFPM Benno Lossin <benno.lossin@proto=
n.me> wrote:
>>
>> I can reproduce this error locally in a Rust project, but am unable to
>> do so on play.rust-lang.org. That seems very strange to me, anyone else
>> on 1.83 or 1.82 can confirm? AFAIK, it was stabilized in 1.82, see [1].
>=20
> Can you try in Compiler Explorer? That allows you to select more versions=
 etc.

Gave it a try and I also can't reproduce the error there...

---
Cheers,
Benno

