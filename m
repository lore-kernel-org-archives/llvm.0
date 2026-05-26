Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327A73FD946
	for <llvm@lists.linux.dev>; Tue, 26 May 2026 13:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779803863; cv=pass; b=GPZenAMywzCpvdCIe0/ziYW2+sNhb7s5MpTe1Olj8R5+fMeMDgjIVSpKije9r8gWqfHIrm9r1JbQevoWhn0G1ZGj128FWXs8sWYtyFkVVuN75isRtEc6UoG0BkDxvKT06l+z+mTQxHNhFo1H4CdNI6bxaX1W9epW5zWHm2k9KAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779803863; c=relaxed/simple;
	bh=pUx2Efe0iKz290DUjvk5U36pR+gdlU4WnThSTIl69DA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kkQNhmlEqBaSWe+r0x0B4l+C8opeBEKnmvGtC3abjzpjcPrN9sOksgYW8DeZF8RI3yVGkUhpWuEqaKuZcIofD/A5uhohf+5QxlR2gXONDA9CYm7aEkKvVOfvUvYweHYGjKmlJmZzpoB454g3KRsCnzJBQhLkpfsTtQXuGYD9CGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f4BHpH3V; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f4BHpH3V"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3047a628b34so189800eec.3
        for <llvm@lists.linux.dev>; Tue, 26 May 2026 06:57:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779803854; cv=none;
        d=google.com; s=arc-20240605;
        b=W5Pcc92/mIGyln/jwHh4rMgzhmBrN4wVkREY8n7FZpY3RYA0jGH5tpHGfdDA86QZqE
         +Pf5KJJ9+SpRn044brMx5UbeATNNsySLE5JFwqW5zAOfMmUmidXk5S4FVTBM+E8rSZvF
         NSG9JVlPJWz4NkNxgyr2/Kwa0MWQ9kvfsdqg4POFEDknLh+ez+layEtc0zZNqMjn/b+J
         Q3Ak4ONxL1EqXF/5rt6CHS8bhIdAD1RqfkuYJvwz09qGNMBvcZRZp+RePL34DF7f9AnJ
         XbHbtLCK5Tme6ZRdTkAeYGCzTd7V2m+7WPQZB80Aosmv0tzQ6OsUwYkrigy/N6HdhUP7
         xF5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pUx2Efe0iKz290DUjvk5U36pR+gdlU4WnThSTIl69DA=;
        fh=+osfa/ezuuSfuuZMXmgz8ac8SZN09C5wygH0v9KJtT4=;
        b=Yv9GlGCtr7ov0W/XKkDLAFQvfOnHXWk9mnbp3Zx3FH0fbroN2jLemHR1x4BbbdtfUh
         vxlcHvXqRlsykUkkH1t9dWY7KMd1S52dt0hnAfFw9UIVNGHrQ9v6b/X3ZklqnKK7he5Y
         C99BySzFJHjkDyqr2M3Oi/SE7uApsuEmh7jJoxoGHVmJuF1HDLukf+wMk2ut09Wj1/T1
         L0nHMl07rUTRBExtar3SED8uNSgmL4meRSa8c2UgWLSa4etWzNgECswk96TzbIRIC/GU
         YjT2oua6JpdulQjOgGGHY1+4Avj6L6sl/TJKw3RQK/7WjpQodqWt8P/Vr9grWI87BaPl
         JiJw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779803854; x=1780408654; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pUx2Efe0iKz290DUjvk5U36pR+gdlU4WnThSTIl69DA=;
        b=f4BHpH3VLO/SEdp5pWZuFsj1VVnFioUtdefsRmqETTx8hpb+I3IJMkNwBHs+vs0ptc
         YQ9HvzHtNdictM5yF9miz5J3sL/u10ZQIp7SroTvbKksfBljhlis8OdB6YTtn3tgcAFg
         8FYffFa28lJPZGbNOS0KMmltrtvX/TsAzxJnxcKRoOogmdzyGwTa/r9xCqKwk3b/ChZm
         1XWLjWTVgZ6vo6P6qgckKjwNzbYUpZjwKEfMqAFaqc0a2yroSzJ7wzNgTfdFnt3KKQRA
         Sm5MiQny6wc0YpYAwJnukDN72UswTMPGFsAm7vwj9Ms0ib35BawIAGwHDwBIN82xiEXt
         r5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779803854; x=1780408654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pUx2Efe0iKz290DUjvk5U36pR+gdlU4WnThSTIl69DA=;
        b=B91WIoPPAnvDIx5YOI2XJFXdBrsN4J4C8SIcN2iohQaCiEm4nqUXTsEu61/h2yewqD
         +AasLaqiGNfxyjUjGwrLJiIKYnpK7GBWLtZeruRnGDzNrgMCBldF1IYGz3C1of68nCEY
         L+7l9mWNMeClcHUWHusZLXTZj7jHV0GeJ8Xyr6S5JQ5TpPWa8V3owPOafMs51/YIJS5h
         qjKiWxvYyZXOmoLB1PiVBTdmmAFthm3XJSDy7BlAnumqHTHrWiAmLTaNM9fQfgNwe3PQ
         xLQ6f7MwRB8WCzBXH4juBalM+QyP0+b0O2uyIMJ1ziXA4+t+0iAE2soZ833/nJ0D11Pq
         CRBQ==
X-Gm-Message-State: AOJu0Yy0dTusx2XnJ0OX0cuwv6cLmPbN305dprRGgzLVN4ke81wJZY4l
	RF9axzfyeQLYw8Zz4bYpTNQdqvIqW1JNlphT2B0rmAIKXfG6quTttk+JyjvklElDrd3MVNf9r5S
	/yF3Fd6qSy9mzQ1g/81dwFltAUt0uVmQ=
X-Gm-Gg: Acq92OFD0u6Pmnzz8IZDhc6Sfvh9EvEEWj/s3/QSxXLOUE/J7wQy9C7eM4R8ZVfaql4
	HSg3h5QJ66V1oILx6vNVoyE5a/N9BGzkmN2RVlhT5NqN/kkKs5RyW+tR35LNeFQhOfQmXgML/W4
	JkJwK5lfD7aowt23AjbwMOAXizTxitdKfhDTghbwfzoS0MkK5ZCV5ZQdKBQ0wB7lSCp+QUJXdhE
	2jVjN0hC/ZYSifCTn+ez6JvCjbXDfZ9EqFTeBx75aEj9LzhyZkPp34bRIl9nJucy8uBiH5/haiB
	K6jKjN6BrubLzLpANXhb497Bv4ZgaM5pWwoUDgPTNu8Ey3HZO6lvc50x2aRGUjEBDq3MNz8SCgs
	+w11ikzrTfc1OrZpmC4gBvso=
X-Received: by 2002:a05:7301:3d06:b0:304:1d92:42ab with SMTP id
 5a478bee46e88-30449040654mr3652848eec.2.1779803854015; Tue, 26 May 2026
 06:57:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260523032119.GA317916@ax162>
In-Reply-To: <20260523032119.GA317916@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 26 May 2026 15:57:20 +0200
X-Gm-Features: AVHnY4J2agT1Ukbat9KqrWMJUX1nzxToByj9FGi5-n5nA-T3bQK46Z5ByVpCGTI
Message-ID: <CANiq72kUipx_gohsxJmjrDawmkSz+6B0ncroNuxhZrpxth=-Ww@mail.gmail.com>
Subject: Re: Prebuilt LLVM 22.1.6 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 23, 2026 at 5:21=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 22.1.6 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 22.x
> series is no longer supported.

As usual, I did a run in CI (with Rust from `rustup`) and it seems to work =
fine:

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Thanks! :)

Cheers,
Miguel
