Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B2F2F261C
	for <llvm@lists.linux.dev>; Sun,  5 Apr 2026 19:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775417496; cv=pass; b=BIRI0yaTzc8HpMrOMfEuBVV/qTMj0C6Y2LRSsd1xVtoyBMtnZqFk57G25iNiJVhFEWMSc+u7SZ8Alxn0ymsNjP+gaMXAk5a5aiDrTeShioDCyxUOIJ+hl3PvxyDqcAoGm+azgnYKqdjGDWbI9mY/TN2EAjQad+0EJWHdYAqnUq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775417496; c=relaxed/simple;
	bh=NE2biLOaCGqGSKm11Njp+ZmwyPkoVtMqAuCiMoTPLSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sHa1jc3KXbXCVu5JIKhbKvDuo2/luW33/j8SQSDeG4+ZLetJBJWM3V1gcvp3ZBmwgNvsC+qlLWBaKKtiacRv6IAyiTCY/jSVDND0BvWVUBRhiDiHkABlba0UGpaz600JyjIOdvcZ1gCnI+qQavNp1g55KtiL5+QuUQKZ/1N2RWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBjW2uZE; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBjW2uZE"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2bd5658b901so219890eec.3
        for <llvm@lists.linux.dev>; Sun, 05 Apr 2026 12:31:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417495; cv=none;
        d=google.com; s=arc-20240605;
        b=DOs/t4P7uKsaPF7qNzM9an6PO1HUzG+HkfmL7jgG6uOBcAUDlgDgKlBTQD07deVo5y
         oWxXnYECbrTkpCz14wEBQF6Y2sEYv1lhVFCPBPicUeR4sAu1rq1Qgx+XKKQa96An71fL
         n7RWAaLyQ1qiaCJ7fRajL3sW01Edf7Yg2ycFD/pAS9Lpig+ftGHQ5YvfwmtJ12ZLGgZk
         8ykMa1hcip67qCCk304ydPQwDuLQz4zbRYw70Sucx0TpGEJ80zKGG4Am1TYpbfy/B5+w
         3sWYI19aYKONqlJe2A5zkliiPg6VTldt9Bcyx+xEq7iOCChDxW8v6MxzQVSokLpGPExF
         DD+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NE2biLOaCGqGSKm11Njp+ZmwyPkoVtMqAuCiMoTPLSM=;
        fh=LqTuPnaFonOFUOWzKOERx4duHjlNOK/cOSjVvKbfYFc=;
        b=D13LECt3XUIE+R1p9yqUb7vxDcEN1kOuhH0VExZAA+EJjr7XgvEdh5u6hlMmNJRZTl
         ErIydN4XtiuhdchvUJnAK94CRbLz6fdMkj03q5L6OaRLxHAfLefTg04ZNIiTRO2a0ETu
         QP4pe3PWHkfGShajFe36GIE4feXRbH6KCgK58NZDrCy1aDCGrUcqDO4k9s0jNCN40cP9
         JO4+sSNCRpdVoW1/oLiIYanBomz/uAM+DNgA1j36eeZTPxWiDl/yZUEshustsx+tGV4L
         qHf3k67dpoD4Cebs+qXLRrTzTRdaM7piO31pPcGIJ81HmVmrMo2UyQzzSBgzjqgWrERG
         7mww==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417495; x=1776022295; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NE2biLOaCGqGSKm11Njp+ZmwyPkoVtMqAuCiMoTPLSM=;
        b=CBjW2uZERo1wPr6211TF8VEI2ZRDb4gw0mcsZRpg3TYNFYEXj8HKhQp27IO9USFzEK
         17xHPsNaCKYlMSYBfUgnHpf3kbx+VarNqN1foVE7OoE8nHPjuEbnTryoVwub1Zf9IYJr
         H7g7I7gXn1/69HJiVoJMpCXXLnvRkq5hgPr4oyzT86TEnzqXeUzM+ifARKQcZ/nLzscJ
         eu/vebNEpdNYQjD0juFmwjTiL+5fTEhJviDYcoQLwC/m67dMKZTaf2H5GNL4znn0CKa6
         AMatalesjdW+2L1BYVL9c+QN+OxeZWzTj5d77kiUdOeEV13GHcnqEOM4Rqspe0vqLidN
         TMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417495; x=1776022295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NE2biLOaCGqGSKm11Njp+ZmwyPkoVtMqAuCiMoTPLSM=;
        b=WhJlYvcqCmDBfNQEmkqsyyM+qy76UZ3TityMcL5pLzxZ44cIBTEu+1yr9U4qtLkr9P
         gm5x/OciK180VQ5ghvddMotvr0297vBWthyo4ZDpjvsXxcuv2Xp1zJVH2cHgyTYse4w3
         /hIxu4tXyw5gyhdq8nH09sTZNZhDw5OiFUi4qjeMtKzulJeHKDB8JRTmfx3caUFkzV56
         crMWQOdk2Q0990na5hpi4kbmCX9jnAP1VBa6asscwC6o4BMb78tT4LAtIU1IvipQLmhp
         Dxs8AZeQwqEmZZIdvTSS+oHZNHDw2Jmy8H3lAj2ThyxhYH40rE4R5D2+ZzQtdXF4rGvQ
         NCiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWo6Kcn7kFUX/dXMqAIRB5hNXN65V5kyaqldpzJxM+N7iugBOGnC0BYY+8122eYlJj62xk8@lists.linux.dev
X-Gm-Message-State: AOJu0YyQHhfTfmXQG2Ltxe7Jkv0p3MTAkPJ5ycn/dw61KV7qYVqRqQsG
	iVFPdMtXfxjcTgzFfV2H+/0YqtZOTfure6xEqhGOqbCMxPiwPoRRner13csVhSlXZM0o1CQPaBw
	ZwK9PuAHItCSngsbxjZEtcs7iGT/1XI8=
X-Gm-Gg: AeBDievRKvsyvB1mwebbCXB4tIZRHMyLBP4bdprSffuJ3t+QKYsye5Bp3z66JHmAK0E
	oLl75aFp3kG/ePj/CeqhgdsJG2qllv6BdiRQirZn2gesbFoBdtQ8Acxy1mk1DE/FZHrrjR5Prdt
	rmcYRzWjaukULZvsoRVSUVCWSMn3FJpdvjhZp3yz5t2RZyltB2lnAZkZvhYAHFoHSXdRMJ3GJ4S
	LlmTZJoKXz3qh3zztU7tSv2k0Uwjr0UoaJNwG/5s8oAY+PtCmOtl64ZY5sAJP4r4zEvLAp3FteB
	6fLXUGdL78bBSt5bMS9aZYsr1X0ojMrFQQhjcUg86vYSlCAeXQ/h2Za2bjdxvN4Rf+JCjkc0KLd
	G3P0cCTg7dRnYTT2PXsWZUX4=
X-Received: by 2002:a05:7300:aa8d:b0:2cb:cc20:1771 with SMTP id
 5a478bee46e88-2cbfdb8142amr2476120eec.7.1775417494698; Sun, 05 Apr 2026
 12:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-12-ojeda@kernel.org>
 <177508434445.73816.7873322235592463050.b4-review@b4>
In-Reply-To: <177508434445.73816.7873322235592463050.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:31:22 +0200
X-Gm-Features: AQROBzAFcfOg6EKctMXZNeC0mwP27xs6Xk4PYTGLQOlXdHdfwi1d9GtE-fAbfxA
Message-ID: <CANiq72k1U0JacHf9rEVhOMmeZ4szCPBhbfLxC1K_0a0cQPw6HA@mail.gmail.com>
Subject: Re: [PATCH 11/33] rust: alloc: simplify with `NonNull::add()` now
 that it is stable
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
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
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 1:00=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> This description is inconsistent with the previous one which had
> citations for both the feature (function in this case) and the feature
> in which it became stable (available in this case). I don't prefer
> either style in particular, just that things are consistent.

Sure, I added a couple references. I think it is good to be consistent
(well, at least within a patch series, but I wouldn't say no to more
information even if it is inconsistent sometimes, especially across
different patch series, since everyone writes messages a bit
differently...).

Cheers,
Miguel
