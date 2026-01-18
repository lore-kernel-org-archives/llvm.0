Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8942C22652D
	for <llvm@lists.linux.dev>; Sun, 18 Jan 2026 19:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768765405; cv=pass; b=s1UX8C+2S84DCM7sjfn7r4ywGjAAlzczcm3ksLZbYzfwY21UjLbbLuDs0yB4fALUFBRkf2hwXMbS1g2G95P9AQztL7XZ9cGPAcK3VRj+5WWkGbHpEw1eZLbe7TqAKXI2/NWrnhrC75M9/KD6v1cdgUs2AsIB2JdKmYR90RDeQis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768765405; c=relaxed/simple;
	bh=nQpSK1jhoj1ixzRBBHG4I4mMZc+hix9T7+kxBl0su/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zo6hX0Yxko3vtpriJNdM6lEzx9HSrlZtoz7SrB+lCevd+fqUHodOLf01BOrqrGaSQiEPk+RRCwoQiL4WJzCsTjix/XD2DSVk04jQSDV5w4WiHDtb55FL0hh9IIAGCgNFW7SpxL3Df407ZbI8QPxV8W5X9aaZpXjCdN9po0EdjAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W6vi0nu8; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6vi0nu8"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b6c86fbd6cso93082eec.3
        for <llvm@lists.linux.dev>; Sun, 18 Jan 2026 11:43:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768765404; cv=none;
        d=google.com; s=arc-20240605;
        b=O5BhRjENyNG9OJFXg0GITdW44PYO4rHkOspPpWD5SB3oOijJ3V8QHhPJzZZ8UKzRqJ
         0237AGuyr5+wh060PyxmufL2kie4Yx+vAB64UYt4OGX7dXTJPNxAmkWGCLMQ9kt4rEfE
         IrDzdqz2oXIqdMQFc6LpfOL52LgVQXLGSpLdpaBCLR1eYgKu/mHtDQ5AZAUK1QnOFwu6
         6KTVwBiSxKW9/8FgNBflj34ynU/P3NNIyEtgnV6KTYTMkXYnMVIwWHCpXFNkPn3yeTIT
         kFNPnXghzZbB51vaGV8Hg82s1a1wvR4xJfS8UPN4OrpmvoM/798YnSTrX5KNiod6jtEX
         4Pmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lcP5qtKRpIwfP877F6cFp0+F/gBJxn7DM0tE1zeA5l4=;
        fh=NSGs1DItV6ij3UEDgFE2TEolO9VHGOBUHk8+dCehNd8=;
        b=GQhDGPtwidXQ2EQ6dKU5/PArvw4K/vVK49bmj1KucqqAuRXCt0eV7C3ofBb1LBuNp7
         UISN+0Scazd1wu/g+PbR9Pj/xx3pG9df06bNkJhUAohk8eCBMDqnTuO/gtGHCxpRh72U
         ZFE9nVLvQQIejt4bjcfj97BOdDJarrpOpZ16b9oBR2OMIxaV0X8cL5ImQfNHxmNj5GN4
         mSRYTkOQaz3c2MvlwCUPZHX9lafXAnEEhPXDq+3jG3wWXf8szQAp7wdogDnnqd2FyZb6
         W/sI/L7E19Foyh9b7inWSH5REDsFWkLmzfKNedzooupAuXF+rtbjtCG5vVjF/qjw9DcR
         2gVQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768765404; x=1769370204; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcP5qtKRpIwfP877F6cFp0+F/gBJxn7DM0tE1zeA5l4=;
        b=W6vi0nu8YzOIBPPkswhNmcBQSbCW3yzFYhdwsJoGV/X43c4xSvJCfqt4E4pI3w7sa5
         Z0uPNiQkq7SB+Yj38+J5QdsYrCKkq5Eu1p1caeCe3uhy1+sZtKK7GsVMA6iGi71mUApV
         w4iShA2l7ia6QiZDXZwfivMjRBCeR2ky8+qx2uWzHoDZSR6h72o3ZdRK6y0/i3ltghlT
         wjCQtYPj/9ku1QAjrj/V+i8BHxHzki+6d6NDGigxDGvl1O1kuK0098FAIZMNV05WF0/U
         h6rHDwtm/631ZjIxj9w/kfwYu2Bx3N/mEfzRKxZh+p/F0LRgun5EiWcQCFIMbCzxwYJm
         Go0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768765404; x=1769370204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lcP5qtKRpIwfP877F6cFp0+F/gBJxn7DM0tE1zeA5l4=;
        b=noSR2SZBem+BDzE2h1FdNFGMLu8rhTPXy+D3Tu1oOo5q461UaxKzKDMspaF97sCZAE
         RqwZSug/b/RRVKgiMYGIux83jGcl6J2YiiOVPw7CA1d4+jGFhK2bckTm60NQbPJhR7LB
         INo0JkM+3V10n8pU0Nw9LW4vlw/L2H1qke5o12vRY4567hP4LY0kgc0i4MtHd6Vady70
         lU0aYSNor7EkBgo3fHvKlRXC7omn0hoLWSCwWArSvWApVfjDj5tKCA1pVdBg+qQtm4Wm
         sps6oscgsWMbXCTH7eMZ98Kom1JyRG+q5fHEzrORzoyIsPTrqp2/6W4unpyRwgTFRRkH
         cxpg==
X-Gm-Message-State: AOJu0YwXm+4HwVNguKVDx32DRPnT3KKVjP3Yrob36bH7fr0GWAEqiaOT
	tpVB+LqktkVPz2abOgbSJdfuJ/OWwLgcMrEEH37AK/51J6ePoj1ya1XiKmH0utlaEv7YzABM5g9
	3Hv8N5dISWqGLlRPPdfZ/lUiIvjAsmdk=
X-Gm-Gg: AY/fxX6Vrkp8xe4SLbq+X0k7SORhfrt1O8h8zIn8OzzdhjzQ+Lqkhzg2wbiC9BxxXRO
	0L6o1W6ryMlqapEKBBkcMwLZGkEaUn39kOxKb2GSH2hRcYDXp2WbutUVx+c9agWVqVDfZ175VCm
	nuJz+8kgz2PsDb0lUIK8Qj8a7j7uTD3j2Wr+Xc1MWTKJQRs3794oKa3aZjmi19aA8Qd6sVwatuN
	uEd+QhwWIxbBAsSLMvX1fgrVw4VgakbIxcpVKGOcQOxhmMLSGc1Kxk9XHu68r8LYIWp6PqVOOMT
	7kee4YrbODAOXJAB6qhyYK06OMqGq+x3tJ21JXqsdJC0BghsXl+358+P9IUKWErKftGLFlOybiO
	jC4RE1GDYyezv
X-Received: by 2002:a05:7301:3e0b:b0:2ab:ca55:89cb with SMTP id
 5a478bee46e88-2b6b40dd0a5mr3450844eec.6.1768765403686; Sun, 18 Jan 2026
 11:43:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251224135343.32476-1-work@onurozkan.dev>
In-Reply-To: <20251224135343.32476-1-work@onurozkan.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Jan 2026 20:43:11 +0100
X-Gm-Features: AZwV_Qg43hRAQ1pNM4R2GwRpygO8U0lz21Jjm5D1gBu80tjVeKKNS6jB5hsvFVU
Message-ID: <CANiq72n9K9EG4yiCUnZe0_Po881PA+=Qt6y07-9mtPeuac9fPg@mail.gmail.com>
Subject: Re: [PATCH] remove sysroot assertion in generate_rust_analyzer.py
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: llvm@lists.linux.dev, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 24, 2025 at 2:54=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
> With nixpkgs's rustc, rust-src component is not bundled
> with the compiler by default and is instead provided from
> a separate store path, so this assumption does not hold.
>
> The assertion assumes these paths are in the same location
> which causes `make LLVM=3D1 rust-analyzer` to fail on NixOS.
>
> Link: https://rust-for-linux.zulipchat.com/#narrow/stream/x/topic/x/near/=
565284250
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

Applied to `rust-fixes` -- thanks everyone!

    Fixes: fe992163575b ("rust: Support latest version of `rust-analyzer`")
    Cc: stable@vger.kernel.org

    [ Reworded title. - Miguel ]

Cheers,
Miguel
