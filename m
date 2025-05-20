Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA2D25393E
	for <llvm@lists.linux.dev>; Tue, 20 May 2025 21:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747776398; cv=none; b=uNjZ0HbprTh915aMZ1P6bUpr9dn2oMIa2AZJaKYuVjZmnY6F3Qx5adT4XURO3OPzDVcbxaU6dSBdpfhql2U+1n4z1XLEs9gO3pagH+bIi7k5BZsozdU5hQymTAkXIYujNL2zp4O/i+C2lh1Z74wcRrpUZ0cRwdrj5yl64lcQw5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747776398; c=relaxed/simple;
	bh=nQGih8zxH/VoEsswrvKaa1/NqFqGIDNLNQwrrXd1bfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GaI25CzrP6CQlt0o/I9uECkWbO5XGtC0rheXWVQde7KZb4/UQx9Wva0aN4+6ebH1JoHMzE1fDZOvYavvxTS9jqmYEFPARAFmavc6X796z8JWdKb9x6HfkD6O/vWzHE0IWNzcXFGViJuMyrfrTf8QMFgr8jlTUCfIix7hYYeeXoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSUiBOMb; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSUiBOMb"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-308218fed40so457310a91.0
        for <llvm@lists.linux.dev>; Tue, 20 May 2025 14:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747776396; x=1748381196; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HS12UrQYG8FOz8WwBWci8HxogfBg3U2CIyyf4Uw5/Ik=;
        b=hSUiBOMbwHwt7y1EPTjOhXaFzUPwzxk38dUSGMcTbU3pa5DcH7T2aBmouIJO6/E7ug
         2oXYBoY7vtPqkqDA7PkccTYzWFIPHZVgszWwaQ+MDLoogWFIWMXfxJemAPIkgG61BsWX
         3DHmKVQcw0DJiU+6jfGmuURkaLpX+fVzADjide6G2vasXKe6fpnJSxFSAvwjmIQ0Az1P
         lNzSWMi0eZwqJKfBcutU53cBn9vYRUKT5KClhWmRUVKgLXXx//tx/HKh9EW/vht2rbRj
         4qcotTai+UmIB1PmUh1ODyCw3dUbJKM2FUVlwJbgLivzMYsC/3RbkmOOEwzYDhKylBc3
         tOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747776396; x=1748381196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HS12UrQYG8FOz8WwBWci8HxogfBg3U2CIyyf4Uw5/Ik=;
        b=mClS6ORHFJYgU3MMR1GfWuZQQWbj5dA/pMVXBnO0Y5+ABNGa4n6134JmvhWGgNG1cS
         vS2GbjzEUDbSbYm72t5oFOwQJ4DSk2eW/E5u4+M0mU7WxRbrpWockcqmG0HlJeCHs8gM
         g7ZmyCFqAlrcrTDHcj5buDPTIcepbefFjzk0A5h44fXsMphK5s6FTbZCHoXNiQY6HgSd
         TdhMUUy5Y8K6+M8TSB961tFTNHTLqBpvFC2RBGjmp1cIUtZsNJcYCvfE1BJijZDrMk6y
         1IcSmZaISjKyqJQq7IvspwWxXwzP7yRCpcVVe/emoT5Expte3FFUBZ9Pv+k1rWthh5EY
         LyHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXM/VDdbqZX5LucMW7dFwetwrHpeHN5lsVpKEjwcQxaZ6awJFAkUM16svhQ8TAUClXmQla@lists.linux.dev
X-Gm-Message-State: AOJu0YzvJRhNMYtOxYq7SXScHp30CKtqUjl1UHP3yf8Rvdzffr1x5HM4
	yFmHrmxA64ZXj6QlW8AjjVRGmAtiLHN+UgEwwnZ7NKAJVZWVqCww5JOMEc8qHHbad3Alw9e98RH
	ZPLVYvALNvM5kAIKmQ3PjngHodG9euqA=
X-Gm-Gg: ASbGncuYCjFpZCzq1OWI+H4Dsrz2N1xSHpuqwVUonTt8BxIm5IH9o2fiLC8468OciCB
	2DX5HrL3jO0oIljJh0TdpZW9j01lUMjuS3wixcT3pG8P7MlPkeVEqFs1e4Y7TU2X0MWZ2pFju1x
	cbUyODSPcYNQtT52M3bzyfH2jCBUncN8YtQ1RO+uB446c=
X-Google-Smtp-Source: AGHT+IFe7MmjlmtUNXGOQwgtb0GunBupn24MRWKrlZVElPHZgZU+iZUAdlM7xHeK50gn3/K2wWFs+xCavEyfHI6B4rw=
X-Received: by 2002:a17:903:2285:b0:223:49ce:67a2 with SMTP id
 d9443c01a7336-231d4502e3bmr89430325ad.9.1747776396506; Tue, 20 May 2025
 14:26:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250511-rust_unsafe_pinned-v4-0-a86c32e47e3d@gmail.com> <20250511-rust_unsafe_pinned-v4-1-a86c32e47e3d@gmail.com>
In-Reply-To: <20250511-rust_unsafe_pinned-v4-1-a86c32e47e3d@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 May 2025 23:26:22 +0200
X-Gm-Features: AX0GCFtV2Jx7NnypTgqMG-mZr9OtcqXo72rNX0dRAhFEUfAeCCyratYCcrsBNPA
Message-ID: <CANiq72n0EcibX3Vx95tiPEkd04DA4hjY-TJQs9YSOmHj=VZ_5g@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] rust: add UnsafePinned type
To: Sky <sky@sky9.dev>, Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 11, 2025 at 8:21=E2=80=AFPM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:
>
> Signed-off-by: Sky <sky@sky9.dev>

Apologies for not noticing this earlier...

Since this is a Signed-off-by, the DCO applies, and it requires that
the name is a "known identity":

    https://docs.kernel.org/process/submitting-patches.html#developer-s-cer=
tificate-of-origin-1-1

Sky: is that name one you use to sign paperwork etc.? If so, that is
fine (and apologies in that case!) -- please let me know. If not,
please feel free to ping me in private if needed.

Thanks!

Cheers,
Miguel
