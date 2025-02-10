Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF421CF5C0
	for <llvm@lists.linux.dev>; Mon, 10 Feb 2025 10:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739184940; cv=none; b=slIokG6Pa2J+Z3xo1dDViKx8iLgAVKYkG6xHpvUtihv+rUEc/Ja0bfcsX4vwuPpBJJA0peURscSgdB7yFQpj/J5ix97xNL0xSszdSKCHGgkGeztypf7NvMhxt4Heyv/MeLBEzCffE1ZEWugdHVqeNN7eqcFnGIz4uxXr32AjuT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739184940; c=relaxed/simple;
	bh=kf1Y9IksG1zOAT0N3rbawZNMzRh8UBQZaZri2h5M3z4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kJ+Ir8jBopPB8wteBWrqFqrlPKMfsI8bKwYYrln1LtNZity1KoxD8hYah9/18Swi5lb/UYoNOnrEEoup2l58I8o0c7xy4KyjPmkI8mlretgHXi3gAiEYA4CQFfnlaWU5XKeAZBvJSljvBortRv284Ul2lHP2rp2pVvrhpYHnLns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LVg5CRTI; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LVg5CRTI"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c05d75007cso124151485a.1
        for <llvm@lists.linux.dev>; Mon, 10 Feb 2025 02:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739184936; x=1739789736; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZTbvRf06WHH8ABQ5ROT9cJPfdttTdmuqStRfKNnJIo=;
        b=LVg5CRTIhlxK8ghAN5wQPhdNr2WVpGF0E86J6GmRfGwAWoJt/ThaZpiJqvrnIyEUGw
         do6D1iV5TbH9QazOKWbzSAqSo45tyM3amtvSqS8NOfyIZOA35igsjbw7Xhlnsj1uHHyt
         64xNI3YuFbvmdIPBTM3jGLGoCwcOK9QYfJ0YGH4rcwmDUCDktZ3BRlDMRjtpyKKruKU3
         VXBDcfJzEFne91S8JO8KxEDUc468ekRhJgdw2J4lmtjHEytoKggo23/8k9xsWP0VHhLN
         j2TnBLuk0Mt0ApPpQZ0ZplfkxAGhBQPomgmdH2WMo/ATbh1ZBbNS+ph5RcV2RTCyiZxb
         wTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739184936; x=1739789736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZTbvRf06WHH8ABQ5ROT9cJPfdttTdmuqStRfKNnJIo=;
        b=LDvT0v8imd91Mek1TiLeUjLyjiRnLT2AHZ1PODmvF7Wg7t4D6F52/vCN0+Vjuu8L0H
         OYmU65V/wi1ierDnOi+su0ZGzFDWz/YLWSCjXAa4pRyqDXwyRqd1YDnirkEArY+7o6Wh
         9oyvOLo7nYmngWK+00j97Wyto2wltHQ2S9pQqSD/931u2YUjStTDM3xNybouaDiiOU/z
         L5hTHpA20ncULQKXWOlhUsOTrY1JJaDHJskB6pyKioxPAai0buJwg7RSp5I/RqEzZNDj
         b6OTbboWTWewxUfgrniFqSU6fyzJR8cSDR5ReYDlU5DydJB41vG5mZFo4FWHAkcyeV0p
         FT4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVCnMVME59TMIp3jmXZ66JaRXvkrLkUHwYmxDheouvoGneyOBdZQf25+YSgmVCtytnyEUpN@lists.linux.dev
X-Gm-Message-State: AOJu0YyNol23wp7Ybb3MY5dsbiR7PPv7mY6sDXpjNv9k2PQ2kqeUoMa6
	Bri+3sNbzhhocAK6c6xUOfLGZHuiO3IcU+DpMgqfWs5/AG2JI/ikNai7i8JpCJy0Libqk3st2Yh
	YYChHXU3KaFTkcLqIom5kGuzxomJG4rqzjpae
X-Gm-Gg: ASbGncsU/02iL1hhDvKQq+xPGwKluuuf1bJLS5sxFsvLowqJKhOspZsrO4+azlBqQXq
	4HQH2DsP8VE/svvQL8Ph+s7ZE2dKVYLRUyoZRT9+7QoQMfZAeG9X5+FWiQrDgLpmw/GAPtH7YXw
	==
X-Google-Smtp-Source: AGHT+IGsHeoYwaR4b+cLOfm/IAdj6GsgRMKpMsh5eDAWykiaAPiYDe+1fWfL4we3hSi/6qmQMlor2HnWS/urw9Rblt0=
X-Received: by 2002:a05:620a:25cd:b0:7b6:913f:3df3 with SMTP id
 af79cd13be357-7c047c8cefcmr2158684585a.47.1739184936471; Mon, 10 Feb 2025
 02:55:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250208-rust-kunit-v1-0-94a026be6d72@weissschuh.net> <20250208-rust-kunit-v1-2-94a026be6d72@weissschuh.net>
In-Reply-To: <20250208-rust-kunit-v1-2-94a026be6d72@weissschuh.net>
From: David Gow <davidgow@google.com>
Date: Mon, 10 Feb 2025 18:55:24 +0800
X-Gm-Features: AWEUYZkS7f05xkYouMN4Z_uHeEj0_BcTyQqJQGir943IvZJ11LBZ9jjVfVs5i-0
Message-ID: <CABVgOSmkny3ir9G6XnMmWUKW9Z9vX+6mkd9MCjo9cd37cm+eCg@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: add kunitconfig
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 8 Feb 2025 at 21:32, Thomas Wei=C3=9Fschuh <linux@weissschuh.net> w=
rote:
>
> The kunitconfig file in a directory is used by kunit.py to enable all
> necessary kernel configurations to run the tests in that subdirectory.
> Add such a file for rust/.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---

I could swear we already had one of these lying around: maybe it was
in an old Pull Request somewhere...

Anyway, this is great, thanks!

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David


>  rust/.kunitconfig | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/rust/.kunitconfig b/rust/.kunitconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..9e72a5ab03c9a122348fea7c1=
db69e1b3fedcc00
> --- /dev/null
> +++ b/rust/.kunitconfig
> @@ -0,0 +1,3 @@
> +CONFIG_KUNIT=3Dy
> +CONFIG_RUST=3Dy
> +CONFIG_RUST_KERNEL_DOCTESTS=3Dy
>
> --
> 2.48.1
>
>
