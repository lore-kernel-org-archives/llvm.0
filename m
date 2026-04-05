Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBDE2F6577
	for <llvm@lists.linux.dev>; Sun,  5 Apr 2026 19:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775417404; cv=pass; b=aO5ByJy4Z00B9+k0JIpk06ewYTIzZsYU+0QYziLLmYnbpNoTNZztzFB13yGEVfDzz37oG/wIfp/56LODKAj1YKOvJTWIEQPTAfZpj1LTCbVcROuZRDe+HFk9jxQQbU79fQaJyOIk9/+TYGoD86dfbJN6RET78BlCh0QdBeFc5BE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775417404; c=relaxed/simple;
	bh=tF2TWpDhS6JNHMclno4d/CgtX1qUDK1fcIW7BQ+2mZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hhmit1T/aaL5kz11yc5so2wbN2kTuaCuFqEt37QzQSvP85z+RzX6C5NhTMl91m2kCTH5mElDTH/aDraFfE+1aj1gVbkVu3Y75S4mceMtFu6z8iMbtfRfFp/IBSKO2LA7vxMqser3XwVmI67yWQafLLmWzhR27DWEHJqfj/C5gcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKMiw40s; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKMiw40s"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2bd801b4078so360195eec.2
        for <llvm@lists.linux.dev>; Sun, 05 Apr 2026 12:30:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417402; cv=none;
        d=google.com; s=arc-20240605;
        b=Mx8Rv8fFgOngn6hfqQdLh4XUzR+qaJJqRiUmBlrRMrw9P7GSugTKO/QZ6cqzFfP57z
         dh7sRch98gnxmai84tLgv7LuhkREP/Ol4PQfwBFG5NVP0yUhLtE8tdWncIc+tWl6119X
         9GMBCvAL585LsHFG1bo7qxbA00V6/pP4bxzqx6LTxb7mAs/ambffAaQXUI2ThDBcqvyB
         Mz4l7dTjdEKCsrkvM16r8YOLU/6zlWztlhKKnUDMwXfZeDhFiT01PxpZpJzL1Rcnv51J
         we997bbW9EcEbrh8kQe+sT3sE4hLwvmuVn6VMkR/gCOnuzk9IsMon9KmeBgXKcs/mwnr
         CuGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tF2TWpDhS6JNHMclno4d/CgtX1qUDK1fcIW7BQ+2mZI=;
        fh=Mb8/AjyWe2zQLYvu+alVzb6KfJ6MtHn6Cw/T2UmgGp8=;
        b=YOir8+hkL2wLMVH0+E0uYQiaM8JOPwCVJpit2pQ4qa2FbW9cLkFN/zz37fdyvrEpYD
         /g7SdHE8WX0jdVxlGJiaLvM9n93AwRBzDEX8Ci//oGGJi5SUmzdLS03hdqj0toXVOXFE
         1jR+tjyrRM9mKLfAFW0qEedpNQiskL+OpAFTRnsZlmhGvG35ZtbrPuaDmJn5FV8PO+6k
         3cl5wGa5RUr1CpLU6oPuAbMIIpHlMHSdwZmEZ6BL70W06F9HVp4Qtv5NzuCcfwuCwz38
         gS9abBbLc7GeRp6Er6L+fizwAZeLbnJIhtJAbYAZ8otwKiDD8tf//tGTB9rlIokKPdMw
         5UCg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417402; x=1776022202; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tF2TWpDhS6JNHMclno4d/CgtX1qUDK1fcIW7BQ+2mZI=;
        b=aKMiw40sjPIzEN/ONQ85aS39+Mxwp2GHKYTA3uKd8+0x0GSKIC0dPQUXbaYBKeQ/h/
         tvy/9sALTQ2dpKizWj06VmQ8hRoQAaWOdGTEcdz8lGmY0TSsMXFfFkqZiiaoQw7yL3SA
         QK11wAkF8FpzqZeym/ioCd06oRh4jzzTy3tvhIZxEm7+SVoiHpjM1C12RFF5OfnfYNRO
         u+aI1Fry2S3MI4tq6hIoAWWxHZzlCCnvCaRGwnUm8Lxq6h2CNeBejic6UyOS+oJLZD4s
         gglZM8Nu+S2Iq68ThIGpIA9ev3/MQaXqguyZujhF38YNQzxkou2aJghRkhwxlk/2YRVJ
         ahog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417402; x=1776022202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tF2TWpDhS6JNHMclno4d/CgtX1qUDK1fcIW7BQ+2mZI=;
        b=gn8qhxsNI4zzilbJBQVFXZxzhcoVoBHWY+IstDHsB+9NSmDPlpnSHz2bHvdBOfE9V1
         sC3nTqGzACz7exv7iOe4izDkzmRrLJuC6EswqxP7krm9A20lYzoZCiTRVtIq6Yt/z4ZL
         RiBdIioTQuZgFndW+inH5ILI5bFG2Pt1n7UHfTjcc9UhJdXTeSuGmJvcUM96P9LHuKbR
         yJ3fR3Lu/CQMMwAnXQVr/g3hA+VP3GHj2u5BwTxmrXsf4abtFaR5gYTjwtdoiiaXIw33
         gaTUpizpBMaVNyBzvCUbbO6a9ruDms7f+RDm5puwl+jX+BCJ2eDRO5/Jfy+kKEO0KYzz
         T5ow==
X-Forwarded-Encrypted: i=1; AJvYcCW/+OH5kFtTVkB+7XJL5GtP3ce9SdQ/AbugIxYhEo3wbWIMmmG0ycMR+/YEOMAUrHkgMXo2@lists.linux.dev
X-Gm-Message-State: AOJu0Yw28liNNlf34//epBK7b548wk9ML23lBwo7yMSpzV1dtccRtQ35
	/gBgR5c5Xhhs+ei5Oh2XRqBd5GlmraW1hORqlYORMdxRUwRJDPpt0anyNWFwDFVBQEyTFV6/p0Y
	M/KNKZxWeu0ZgQ8EV0DajPA8mH/lXJVk=
X-Gm-Gg: AeBDieur9bxHSJH+mIfZ1dmbGVNxkUQuMlUtMrDnaAahhmflkBlD6a9fQrrAINaMZ+K
	RPS4JufwGHyF1pPJljxBPD0uGIyYJcOrZYPEaxc6t3KCTAPmLthOziefK42QMHCdI0z06TtdVPz
	oHZQ+vPvytmdI+fRpp1r/02xqnfrBGg5QCCrBBX5pCrb0xchI3R7dDrY4KSApV3JVo7/9z1X69R
	DlRUGVvQjAraNfc/D8WkJiWtVu+LBF/aDb0XXVev2bg8ReKyGpuCiEI5vEwi2wQZXWSxuQ9LDmp
	gYcbG2pZgIBoy7w8FHmklsRkBGVaT1lHJc4VZXBIW0bRHmd9EO9Ho3aKGjnAavDWP5Opc5Ogw8K
	ZHs9cyVcoFpOhxd7sqltpsSE=
X-Received: by 2002:a05:7301:1688:b0:2c7:2cac:8149 with SMTP id
 5a478bee46e88-2cbfc95a78bmr1941319eec.7.1775417401965; Sun, 05 Apr 2026
 12:30:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-11-ojeda@kernel.org>
 <177508434443.73816.5437391869400189147.b4-review@b4>
In-Reply-To: <177508434443.73816.5437391869400189147.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:29:47 +0200
X-Gm-Features: AQROBzCJ9cjSza_PQiGX42eHlVtWqYPN6hP4vKeYF-tVAvlxpiXLyawV-TKZkT8
Message-ID: <CANiq72=EL4pEagthmrQ=DTNe8-5jWMfgxxx+fsj=pFy3EX0zdw@mail.gmail.com>
Subject: Re: [PATCH 10/33] rust: transmute: simplify code with Rust 1.80.0 `split_at_*checked()`
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
> "beyond" is probably not the right word here?

I think you are right -- reworded.

Thanks!

Cheers,
Miguel
