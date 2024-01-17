Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E200022F06
	for <llvm@lists.linux.dev>; Wed, 17 Jan 2024 18:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705515811; cv=none; b=GWGFn/nus1xZ9Ia3VOzI+zzWPl+URT/bGfepv4srkr8F7DgFa9Ng5Fy2J1COog1ZqRCtUTdvqFWMbuvgQbd2f3TQ7R6BrA5ciMDcxrJSsL9B1+6VjI8/9NhEC+NVKnsAa5SUSV9/2PzB4Wkfs+U9xd3lhMUdW7tBs/BmbXwviGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705515811; c=relaxed/simple;
	bh=eXio9NlaEYl1RqaWvINUW6RFO3slj0nXN/O8m9I0jP4=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=QsesXIZ9nw7eaO6ymXOnuHOch0MzPzekb8AFtpJ4fVOM4mGnzMMyNcHrl15m+kQkjIcmEqPpkgUsRQ9MCoDMQ8F2m9w2hOxZT8CHLae4REHFoUO/fmIm6Y+jYno6/ghaL+LFRjV1RqIqdlCUT5A+s459Dfcz5r73osJEPWo/R2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+VWXPdf; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+VWXPdf"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5f0c0ca5ef1so111322317b3.2
        for <llvm@lists.linux.dev>; Wed, 17 Jan 2024 10:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705515809; x=1706120609; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXio9NlaEYl1RqaWvINUW6RFO3slj0nXN/O8m9I0jP4=;
        b=f+VWXPdfBryhZ60KQWWrk/3cHuRUCDDJoGBYqKK003RzlZdCyQZHCTnTvq3uZTulom
         mDu/h6kVfc6ujIziSyj819E5QP0bo4p9gLws2nK3KrK1vwK2968Gg7qii8VF0r7Z/9gf
         QnL6f1YLaCP/3yPtMzsROk4ueGmOxGTD2u2jNPKyaDQ0rUJAIpLyM+cgyc79+g+EHFJ/
         yqyTuxcpFkn9tLlSnySoNrcB0f6StMlNj8pGYwvwJ05S7sxrDyH+HbSYYFRWlmKy3G1D
         2bCm/cYS/YX7DVl+pCmzjdVEN5cwfRS2RT/C7kAKGZftEF2Zit5Y43kiWj3e4JqRfj3H
         ln2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705515809; x=1706120609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXio9NlaEYl1RqaWvINUW6RFO3slj0nXN/O8m9I0jP4=;
        b=cuHZ9BJz+Ak8/jDWYXDmx6HXYDVfvrsID2pGWm+OzQxOPhe+9CrxmL2P3jWHVZ4K2X
         0rjrwXT/0Z/5g18AYQ1NikJGCEn2WKl0gVtdIsq+RvoxWeR3J0BIS6gdud95qKBoCOs1
         9y6ndBRXN1d+ZT7W2L1v0fa2WO7M0rnDC9FauNM0rdznARDPxV0dlPhCt8j1u+FRuqon
         gQM8w9GMMi8S1nSOyVS1jSD86zNS2F7hKQkTzKN3O7bv8GCJ7/Q+PgsrOYUG5n2JQ7pm
         DMznPD4a9QYH3aSR193yYLFUjNHDNNZbFZyE0c7iYl4rwZPZ4Dwi2tZ8GFeGSjVFS3Dx
         lmLA==
X-Gm-Message-State: AOJu0YxUi/PCrtCyafNwypkxUP/1zYUfzT8XXUqzxFeNQed0/HTVB4wL
	Zb0cguT7FtgrHTfGTkBeUGZbaESOoKje4EgQASU=
X-Google-Smtp-Source: AGHT+IGCcH/dqD6Al/2l0bQOPWAl/S0LnMuPzV2EbQmMsbLH6gHDj92gaTx/RM0zC3S16n6n9hZ5JDh5aDxL4N2u3xg=
X-Received: by 2002:a81:ca46:0:b0:5e9:dca:1b14 with SMTP id
 y6-20020a81ca46000000b005e90dca1b14mr7334369ywk.7.1705515808771; Wed, 17 Jan
 2024 10:23:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230307102441.94417-1-conor.dooley@microchip.com>
 <20230608-dispatch-sneer-aa09bd7b2eb8@wendy> <CANiq72nnph7LS1fLRtHz8NJ91PWXPaUnm0EuoV3wrbvK398AnA@mail.gmail.com>
 <20230608-spiritism-gonad-5f5aff4c3a24@wendy> <20240117-swiftly-parasail-618d62972d6e@spud>
In-Reply-To: <20240117-swiftly-parasail-618d62972d6e@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 17 Jan 2024 19:23:17 +0100
Message-ID: <CANiq72mVKCOAuK4Qe+8AHmpkFwyJsVfx8AqB7ccGi3DYpSSWcw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 12:31=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> 6.6 came and went, and I have been busy dealing with the other
> responsibilities I mentioned and have not had a chance to look here.
> I rebased this today and things still work as they did when I submitted
> this version, but things have gotten muddier on the LLVM side of things,
> as more recent versions have added yet more extension support.

Sounds fun :)

> My inclination at this point is to engage in a bit of LARPing as an
> ostrich, and sorta ignore these concerns initially. Specifically, I'd
> like to drop the idea of having the gcc support, and restrict to LLVM=3D1=
.

Yeah, if `LLVM=3D1` works, then I would suggest going ahead with that.

(Now that `rustc_codegen_gcc` is here, we will move to that and forget
about mixed compiler builds, but we still have to handle `bindgen`
flags until we have an alternative for that)

> When it comes to asymmetrical extension support between the C and Rust
> toolchains, I'm think we deal with that as we do for the C toolchains,
> sort issues out as-and-when they arrive rather than punt this again.

Sounds good, thanks a lot!

Cheers,
Miguel
