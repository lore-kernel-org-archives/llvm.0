Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E630C385539
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 14:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775486289; cv=pass; b=LqelcpKlh5ySwBYLGt1OL2OfrwZgAKkC1zU+LlBAFGz5xRIRyMLZ8BTzzHHupiwB9OBujd1kEegYKHaBp7Q3QBdk1czf/ytzfInM7suv+6ZZn2XaImy1N2wUZU/DgTxunc7OkhAMTRYdbLNoheVNGrsJXgKFvYRGoZQSyfkLvMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775486289; c=relaxed/simple;
	bh=hIhNt0MJcuiCREyJL4elAnSUfXIEbP8C+cm2AS/TYZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hok8C0cBMrC5Y2sFN4BgVnzCZ8dkkzjuN4S17vW0Oclku6EbWyySre+y39/J3uVzdsFLvehGTTT++fie1fWkW0Q9PWQIwIoEI6jyu9KW6yT5uKn7GozM7r6ig48lvS0rwJ4uFYuLO7+Z7/fQGGqYYjmBeeXP2zZZXgpQe4l6jW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QbmN7rlN; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QbmN7rlN"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2d1180e769fso17724eec.3
        for <llvm@lists.linux.dev>; Mon, 06 Apr 2026 07:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775486284; cv=none;
        d=google.com; s=arc-20240605;
        b=fzx725DzVAk8IMtI8t0Q9rGvTUTAWLgNy8/rWp6V8ySq/u/R8wGqOMK3jGOwoxL/UL
         I+vZgLfZMQGrz+mrCV8tEv//25+xUZi3ym/MMWEV7esJVrGdj7W/GNt5l8VuKOY+67CF
         F31byphmXvuKFZtUn/k32izK94GGMjyYfwE3rNhhxxEXNzdKSh/ChI98RDIuZfMUPdrS
         kyYdddcJmnhDfqUtzKUTZD5oix5xwlzqG3HCdT5Btdo824M/fEmgyAgG7/XJSb5rA+GV
         q/av4b4kxi7wkpb0BUHONuJT7fwvNqEtVQnlRUUJFF0BcLsZWd1fGTrFhkt34UG0/iTA
         cHMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hIhNt0MJcuiCREyJL4elAnSUfXIEbP8C+cm2AS/TYZc=;
        fh=DSLI2uUfx2rkuDRH4AlY/5JGHvNSNo06Vn2f4GiP0o0=;
        b=jDiNKdtBgCngtxWI4Rf5T1Ti9EW/eSdGh3USSGQg9aCZpSMHwIfSXMUbbl+mcLO0aa
         39IQgQ+/RfGM5us44QJ2UgrsnPVwNCTpBaiiib5p3WZ0qzMtc+eVQPlsZcIklTTWLWwh
         H+45KtHx6RaEo8sZvxbZYxLqKhhxKEYzBppU+TS8P9gZsw3kf9Y25mrreAtTMnN32NqO
         96ZfLwuNMbt0YLB4zkqY013CE2PQWFNNXVpnYopxO2bfRZi67ISb2vphoigpwOdNNGjr
         DsnilFK010uxZ2CGrCZKWOsOjPy/YSVjqDQzTeYeRT528eqFU8HjX0ZE3jZ+03A/VjIo
         9rwg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775486284; x=1776091084; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIhNt0MJcuiCREyJL4elAnSUfXIEbP8C+cm2AS/TYZc=;
        b=QbmN7rlNz1Hj5X+Xl5QP230ZW6Ku9qJf1sBaxHEcK70A7gvGjRmCS/yOStxBmgrSC4
         K3NzNG/fcp498W6RTt8euKqTylh1hiqh3Erp0HSylUdFkTt9+49osdCBYbO+kBtLlQhn
         hF1RNqykBLLtPKdWYS2m5uNKLPDzX+VkcaTv41HHvtj+EjVnv2kaPvTPgu5LNKa849/E
         B1tVxniyuZwe7FuYaXoP6KIBkHzAOtDBqCMHCabMDgSLzNTsPZ2G3tmuf6kP6p3OyRh+
         AX0i/n7B9Q2W8z19qJlbgLhrVZ01UAdrPMAvfkbNwexkngUMMTAfhr+/g42qYLrLE+sA
         oQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775486284; x=1776091084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hIhNt0MJcuiCREyJL4elAnSUfXIEbP8C+cm2AS/TYZc=;
        b=UHy3n45Y7o1RoiYIsUFSiBir8SlCEOwakU2uAP6STcY6dKU8PVDMruMIdD2d0FFaqY
         547mUmzujVNLwEptCIUnIfs24/CgAOb7DJ9oXLHvx3pXx4RBLcPvCIbIxxpUYudFTDoK
         7Qf45fqFTcQ6SU6ILtPTVOFgwgGEUWAanO3TI9wUir3dYqF/VOPCnseqA2YLEx0xH6wC
         pbC836DME7d2DfURsXV/Spg+wHUIb2bywg/AH3+3vSMQBnC60Uv+RIWrsuWdpEPzmzA3
         /KDwjvDk2+FUKahUu6PYgl1uYjA8H1RR1Y55nWNRoyJXQFoJZUlvae5ZvS7yqViHv52E
         +RHA==
X-Forwarded-Encrypted: i=1; AJvYcCW+/H1TUkjyVtB3sTSgC9r8BTr8RlPusu3kk4kuYu7vvNiXt0OfNC+dOsaZaIHOp/4zcTow@lists.linux.dev
X-Gm-Message-State: AOJu0YymGshPi6tjpR6cZLhPki/+KZrlm4fHyXsbcyRUjPh5/nM2nZlW
	ZKwwkt+5+pbhbrmrbr8erZ8jQyWXJX93rRPOQgSuP/J8NuNKnn0XzhVvc4s8yNc0o2Od8vY4sTf
	1xpARpGQRpt40fYZpyuSOCnpGluMocg0=
X-Gm-Gg: AeBDies1Y+e0G1IR9b/S+AGBTKoS62/oM8Goe6+k0TQH4PQJvgmpvGSWpG0554ZlLMS
	yPppmCrCJ5+ze1zTxrk3jCKMzhjAz5WINn7LW47yLS0kww84xoF7KySwJw+fQgM7I3OQYkPszBX
	nQBg+e42Jr4wjXC1qwK0WK6avGr+oo/jlYnfiM2EeKzvTEf2CD84YewHWSG4vZjrNp4plv8JTtt
	JEQe93YhCEYwuxP7AuwiYiw+CrTraju9BqnruWjz1MKZH2EhScQBYogQQ8b52kMqA4iXTR24kFo
	WOwxR2qAKhzcyW48hOTaXSP9vgbRuffxV/5GeirEVKAlZTJHA4JaRkpcfK9QgvAmtNcHr1eWnsP
	mi7KLR9sBbZeDhXRWSK2PuaAhxTblSey+zQ==
X-Received: by 2002:a05:693c:2c06:b0:2be:2912:ff65 with SMTP id
 5a478bee46e88-2cbfbc7d828mr3020598eec.3.1775486284289; Mon, 06 Apr 2026
 07:38:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org> <20260405235309.418950-8-ojeda@kernel.org>
 <177548573697.95472.13544191227699996309.b4-review@b4>
In-Reply-To: <177548573697.95472.13544191227699996309.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 16:37:52 +0200
X-Gm-Features: AQROBzAshONAZRL6Bf4qdEX94VdiVWUdtgExWPcnxvz_Z_wjuLZH7VazFmpsU7M
Message-ID: <CANiq72ne_JYPodnROckyNto10ZF0PqadRxSrng5-mZyqVovxFg@mail.gmail.com>
Subject: Re: [PATCH v2 07/33] rust: allow globally `clippy::incompatible_msrv`
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

On Mon, Apr 6, 2026 at 4:29=E2=80=AFPM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> Could you add a reference to the upstream bug report [0] here?

Of course, thanks for the tags!

Cheers,
Miguel
