Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226841E1DF0
	for <llvm@lists.linux.dev>; Tue,  7 Apr 2026 01:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775524523; cv=pass; b=s2WZux5oB2YkXpAz/s+bnQXp8/3bhEeWu2aHr0U2UWzyj2JXdyWNotfkk8Ozyo497U9et/rlrU/K6oauq9bDxhDWqhKjNoraOBdggexoCnrFLQH3MwrP8Dpw35XN9kOeG5q5zjlzI4lWjQxWJz6xkBIZ4lKosO/4UafIYiI8eU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775524523; c=relaxed/simple;
	bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RIWbqUok76OdEh3d+RUcfxqaYxIf731uwoqACI8khm0y0InehNvsSnHFDKPGYd5JPD0ZDUhSYaA/D0FWE3q3B66rUWI/Y4U6o3jKUbDspB0dhEbvRZsRUvgdNeC6cr5T+7mil0cV4IVymBoRvJL0jAk6o2mIV8k45vw8PiMy37w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7lDSo3v; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7lDSo3v"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ce4b60f855so72252eec.2
        for <llvm@lists.linux.dev>; Mon, 06 Apr 2026 18:15:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775524521; cv=none;
        d=google.com; s=arc-20240605;
        b=N6j1k5+KKbVPwVB4Hp0mvqKa1hG9k3/UU92F7FN1wq9SUdMYhU3wNWkczZqOQlZpdz
         jhD/YgAtlDKULFJdc4RM0H1lkFDHhOz8aJKWeHBPi5iV8fYwmuDN6S1Pi7qnOKRv+aGH
         hI7Yv05BfETgZFZc1FuE8W4uHj0llc4XnWSxtDJ6LZGCf41M56hjoBwDFQLync/HA0dS
         vCfDZjkjhpM7xbt79CJxInCXGYFghefZu0qBNzuPfui4mlYd/BsH5MgMPoIY0nvi8Sfq
         ULpGGx9EdSfVhAomn2reeMbBWGSc4aNv4JDtZpsd06meDRHPoJyBhxqXWYMIQKWHZQHv
         kr3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
        fh=ZvCTDEazF3Twf1193yyPJqYPOhcSypLLt2C0rl35nUY=;
        b=BinS3HicgOkEQG1f67CCj65I7cZiocm0IQtG6T0jmlQ2xcWKLBWSUt42aMBniUPrcN
         +XM7ONvyWd15d7ab7bXvhw7btishC8D/PYT3JJb40Ii7sp3QGAs5z2pncpQyeBLeTmI+
         gupNxneaG6XKHuVoPmvZiaGEMbd5SjYtDOp59WkCr1VGvONhhRIXfznwrT1YuOloY5DW
         M+aUUB+yhxi84DiiBQld2YUfol8Gi45M0nU3+6t9I2l3jpNlEwsJ3eM+UwC1Mj7Mg9c3
         Hrp2/sHnmSN3nzcJ0/II9nuXzxCfGtn0SNq+IBq7IHdesgYMl580JHZNcwpDySpRYpy/
         MopQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775524521; x=1776129321; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
        b=F7lDSo3vfTXFCp9X8ZAc+8IpThK0P4LoHCbTdynjdvKEocl6J/lg5M/5zvMSogYhwU
         RKATv9tsQ4KcojiHh8JjMmNJlx0j+IMV2VcNsy010aeFafvM4UfXBXBGKCprio6Jk+yc
         tPWL2byVa2uqqnVDxUkTQQX28U3MZ5HRFnt0RS59brBltPPIl96bVDB0hJRbmVnd5FiH
         48WkhgbQGveTdLEeJQzyYVCZVpFkHbrErmg73GVUBvTYcUFztYOUKt+EL91NsN6n6h9S
         LDTMQrrdmhLF3xHEXrjN0Upp9YOODK2hnd8bsZffIMP9XjNTDbhciktdDUaADEWAuLVs
         KG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775524521; x=1776129321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
        b=ESke5fK67Fljlk9dlqNahRv8SxTACAKdFu2Xs1bQMIX4ypLiTGj1ZvHORDgL9tcx7t
         Nwd4TSchBPktFZfdL2Q0o3+Hpk+aSGw1Y5tRMRgkyAIdF3/tMmL8wRk3HCDAVTIRu+bS
         +x70p1ys4sEFYXVGCoHKi36hBFQUVL77eU3bNwM8kApGZ4/Tk/WsKKFFaSzqtdnKbA0R
         /KOjdu3/D8zV5eOmwF6LS1sI3TNfaCO8nI9svoSiIPpIZPyoIFGyLmxC2rr+axZb6quh
         DLz7VdHJJLm9pipsxjszU9xFwUzF7mMFb5udBYq4GwjGlZq52Id5PI/8HZSuqGsNFx4V
         Uz0w==
X-Forwarded-Encrypted: i=1; AJvYcCV9RN7+HX9ZoknRdRHW8MyiFWZMipGv78oHGvVunYlPsbhYQG13lvlcmyFjIh+ZH1yxEcst@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb6z7AgKvgQQxJWoRhSPGE7VsHZYLCGn0186+DHyLkLJts7qpf
	JRDMtVkZo793OuIluN5qHWB5GIZcXmkLArpezKIzbhRp5qIqekbzm4ESQDiODhoJGnUWdvcI/br
	+G70Cz4+j0o0Z8VS6uqF3wZ+CF5ZDzfY=
X-Gm-Gg: AeBDiesSNCTBH/WyK0ruaANyKmlvHcXcKxGsOEnt4xQ/LkXgMBmk+etq5jjwIIhQdX7
	MDdB3fNUpCipXRah1coiW/9DhorXeS8Yf8iyMqhUFZTUxj8yZVe1oq7+zj8jAcbZqBF3hxIlaIJ
	m397aEQyeaKBB7xNKOb3IaqEJ/gvfjKydSQcWcYMZznNn6oy26+u+8JALei+mTqkboyiCR1MXxN
	nJul2lko6dPHnimVjBMH23V77pQrTAcgwocTEE8lyNU2sV0dm65s4KjBbLF2dRTtKof0GUxvczW
	p7/E4GGiutRigTzBXjJtsYoAFmhMjQqZhF6ZEm/akAYlViovTcMY93lDpx7tbOffv0lH1/OUwf5
	ncIuF5LGrll19OaqiWpBOv2g=
X-Received: by 2002:a05:7301:1007:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2cbfcf52a13mr3516734eec.3.1775524521173; Mon, 06 Apr 2026
 18:15:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org> <CANiq72mnGArtgAbe7xXZCYW1x7Zd5hozfnzoftaGy9rxoLO4ew@mail.gmail.com>
 <cf28afe0-ede5-4d1a-9824-65a1448f8161@nvidia.com> <CANiq72n4tmTzqbcHCnzUBFyLVmJzB-AJng_1FgELJCWr7hDg4A@mail.gmail.com>
 <efe61810-2b28-4acd-b69f-d577042c0b62@nvidia.com>
In-Reply-To: <efe61810-2b28-4acd-b69f-d577042c0b62@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Apr 2026 03:15:06 +0200
X-Gm-Features: AQROBzCpjGVGSHiqD6WWW0AkLWSnE3ic7jf8UnYoPnV_5tut3XVgaNfJWwQj0o4
Message-ID: <CANiq72n84On9UxQ9CNqyFb5wpJZKrBzb1Xej9ZRqhLim--ftAQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/33] rust: bump minimum Rust and `bindgen` versions
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 9:07=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> That's what I thought I recalled, too. Weird that it is not in rust-next
> already, though.

It is normal -- in the kernel back merges are generally to be avoided.

Cheers,
Miguel
