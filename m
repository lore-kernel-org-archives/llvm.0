Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B138417C9A9
	for <llvm@lists.linux.dev>; Sat, 24 Aug 2024 14:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724510754; cv=none; b=PgQs1ljX+b22LaXk0vLHFENclE7PZJPIP0UUCOhhwqLa6jz290tjiD5s3tBKMvpELFajS/9BIKfXydy571SnZvjlnCdcOQcAMzmh/Uy8AN6kW0UICXUQJU+CtURL2B/23B/d6Yk+i6RwyXxPQCHbj8muybYxZzkZK3t/9dOhHXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724510754; c=relaxed/simple;
	bh=/AY/sNru5AP+z05Xzfrj8YNsnhwxuUTOdjXIlQJ6XyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l4E7eTenz6/MifknvndpYpot8P8aL5WcI/tzg+eOmIlBdjO1aAvbYAwa1x+zC0aoQqksw3k745c9+5Jhgnntk8pmZGBmuYgkZgjb9mYngjj/pFUR6sqcLu4Low3/SW9c6LJNnyI+ZJC/Q2R/mOfDkJ5+S2hOzV94QOANLB4NdxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Krj7/KtD; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Krj7/KtD"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2d3ba497224so348347a91.0
        for <llvm@lists.linux.dev>; Sat, 24 Aug 2024 07:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724510752; x=1725115552; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AY/sNru5AP+z05Xzfrj8YNsnhwxuUTOdjXIlQJ6XyU=;
        b=Krj7/KtDcnodzibl8duveR6xrqO0GpL84q5g9epqBlycsvwe2Bt9HCi7Th37utnfT+
         tLXtPq27ArkXNBg9NPmZYHFIqcu8DglDrcpX9hTWpVZBPVeVn803+3pisKikifcv9edS
         o9b38BbWmJgHwMHEplPP+gIfI1jt7TiKsqPIOYqNzFbG4AjR7Crhfaeq2s9Wrmw/RTyc
         yG5Hk0mT2Lji+0sOAoSGrCvEjcWbPCYDno7rmX87Ry/HBJCSAqZofnHevQUuTHjvcXaA
         lc8KUYFEB1GkE1q4o/IhO+pD+vFY11j7X5kr+JuCDBHaoQfjQ3/aidVlzKm4sgMCs8n8
         roGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724510752; x=1725115552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/AY/sNru5AP+z05Xzfrj8YNsnhwxuUTOdjXIlQJ6XyU=;
        b=lyx9m3/N3uPrP+xmAKEcHiARjAEZRC33aqn5rjDP0kZb+scBU5h/fQJ2xEZNB9F6L7
         xu8Fzu1t++M8pn0A6HhPBfVqv7UlI1rCxXQc8n4I8NqgcemLO+RxWgEQWX8us6wIuxfs
         rAOKjY2HntiMZvV+nNHmR8Oz+TPwv7bhRpfNPtWeGAWzPlHsLny0Ypde0UpJoWl0mgP1
         JY06GJsWY1UamCCNGXCTN0ZbVxydaHSKu2kQjPqxF0WIbK2QqdSae65KIcyfjzB+SKR0
         K78TUk/RQbPNh7g5Q4k9qeuqhy50QxvlkU7EsxL+t1mNJr8WEjxGyqdt6FMbcGYNcWNe
         jHsA==
X-Forwarded-Encrypted: i=1; AJvYcCW4HfUA+9q4hLZITHYXE5u6Dz1Ln4ywm0EuI8/TGa71m/fSovdiPwq7PQTlFeLRqi+Ti1UD@lists.linux.dev
X-Gm-Message-State: AOJu0YwQB4Lf45tIzeCLSmkMJo0+l+VCCg5+Q+QagIecudhyxw3WPoPU
	2BkrNlRtmfV/jHv0tMUk1G1ku66vNFsQCQmuCrdlwwYbT+QkCjl5WvZp9YHLiOJwInjQtSMkOkQ
	idLecCuboxcPQk0KEZKY1MMq5+xI=
X-Google-Smtp-Source: AGHT+IGfX8QIzewjfC1VpX6LrP8Cy2hMePVnGVnVmq6AtmnErsRclJnUUAQfjFofiK3pLD75V1yJSc/BeFY9dH0Q4ck=
X-Received: by 2002:a17:90b:3e8c:b0:2cb:4382:99eb with SMTP id
 98e67ed59e1d1-2d646db48c5mr3602585a91.6.1724510751965; Sat, 24 Aug 2024
 07:45:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240823140121.1974012-1-sashal@kernel.org> <20240823140121.1974012-10-sashal@kernel.org>
In-Reply-To: <20240823140121.1974012-10-sashal@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 24 Aug 2024 16:45:36 +0200
Message-ID: <CANiq72=gqDOeqHhL=cvohoBWrc-gp8p6p11+13gE7C1MA6pwyQ@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.10 10/24] rust: add intrinsics to fix `-Os` builds
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun.feng@gmail.com>, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, nathan@kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 4:01=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> From: Miguel Ojeda <ojeda@kernel.org>
>
> [ Upstream commit 02dfd63afe65f7bacad543ba2b10f77083ae7929 ]

Sounds good.

I don't think one can hit this, since we only saw the issue with Rust
1.80.0+ and 6.10 Stable supports only 1.78.0 so far, but it could be
that we later need it or someone unpins/upgrades the version.

Thanks!

Cheers,
Miguel
