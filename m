Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753D241B8D6
	for <llvm@lists.linux.dev>; Sat,  3 Oct 2026 10:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791023094; cv=pass; b=FdeARbAbdTbhLXKaz6iw2NYUOYirwrfh6EGOOaZ2T2gkuJwSmR41D5aX8fWSzsaKz4t8uIRDMJH39ZIIMopfgcL9lW+PazfDGrYdu8EwPzQe8EipduAI2XJHwoy0hJz0Xpx9l+8tygKqXnwLIYuO+4L/V71CcCP8LfD1u1o3qKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791023094; c=relaxed/simple;
	bh=J2QUNYNnHdWQ/LZMhbJIi8OYNLDwOK3NJvOKK0udUn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Benu3bXrdkelFqfBNvuTJTFbxJnco9hVAGB6+tH1e75pzHGSYiKGDA5BDwDxP/5uBqfNwP2M3Fa8HUKkNHKdxaXLahaHppaTWtRO9x8CHryYMzgtj34CmtkRpGilQ5thtjKal+wUR2LtGixy+JeRz0wbZy+Y/efQX08HUup06SE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMlVEFh/; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMlVEFh/"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3511990f211so13470eec.0
        for <llvm@lists.linux.dev>; Sat, 03 Oct 2026 03:24:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791023089; cv=none;
        d=google.com; s=arc-20260327;
        b=NIaqIP5mYJbQVxMRew/yOgPU6v7eea4fT/FOBZNOwbk38afOAkJG2lXX7EJJ3Nrk01
         9hTBFVKTebSJqvgoKPapm6XRmRlP0KEzG99UugqLMnIqoVW31LMX66HkqeTy7ukqLsF4
         A1ct4tpgaxQppfp5MW+IoEr1SWbxcuXuXrWRJ/yZV+8tl5fq6M+HFo2eD2tP6UJqxa4f
         wojjkuSUd/hw3uTDd6TiKftAwgUrq8n1Yg94/kq3AIM+GsF3MyrSYjOpATH9xRxQRWua
         2pVnBLH0WFmEDk05T4gMW+X6wUHmCywnrw8BmWmDptLtlTLfxgQcA6jkEhXG7oGlsw6D
         NmXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J2QUNYNnHdWQ/LZMhbJIi8OYNLDwOK3NJvOKK0udUn8=;
        fh=zhWFCDEsXDEXXGAIE+IuTEoyHcXUbBULtxrfuqaPX1s=;
        b=pf3wh7kcN6Lxg5+6VthJGmTdRVcYE4HxN8yycg95mMdiWz8IU6IszMtXcT3UJqbvDB
         JXcw28EjxB/DOMTgroiVTDBDKCZ7zsK4G9pmurkiBjmwaon5S48cRMRR8l1NHcfUDll2
         DbIifNhfY8zNygI6X62F7Nrl8xIuNdmSwuCw5DwNZTcywWeI9tEWUo6pI8ouu1Nl1IH3
         7HtvhLAJAHPzWt7MHMl3lLczMIjMZNdlLoSXlqS3Q3p2d22ImPisVEjGVhu/fZ0JFbAX
         I+NW5qunSZMQxJHIbvaqxn+6eNoRNco+dNyOJ6+8dcM8M+BglrfopL3QV5HvX2waI2on
         TaJA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791023089; x=1791627889; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J2QUNYNnHdWQ/LZMhbJIi8OYNLDwOK3NJvOKK0udUn8=;
        b=YMlVEFh/EqNuip5klzqm2uNM25tldwnViqSUiPl8ArWPeYizLVgYmvp8Umw315IHCL
         AvH/ukPrInLFO5VmUAGEt5Xfiu53Q/uvPSk7saTQ6Gjys+uEdyj3v/3U74cLsv+kVmnp
         9ToiLwmWuZDRqTP2LPGzs9vWjXSyzJ8jirJs0ieA9F2bD57syfWotSHuWLS3EsZgKmLM
         Drk5iNPxy8IE+z9NhWFKNHiHbESijKkoyodgnYU/iMObt+X2zEMRCpocDwNLJDxB0r9R
         P+Aa+Jw5CwvZnYzdA8q9oPGi4Y52RGcKQUUvbc6yd6A9Wd8OBGbrJ5BN+1riyD7e4/UH
         nMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791023089; x=1791627889;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2QUNYNnHdWQ/LZMhbJIi8OYNLDwOK3NJvOKK0udUn8=;
        b=k01fsgLvER90vPbWgK3d8k0N02Go/YqrzfytKCUCvKD8pzMPFQ9A3jl1AoKCp5X4Oh
         wtFDzS1rHd3kNkXUBYQTgtx8Kaz8cJ2TKstVqzaxdWirIu4cz0bRB9eP4qbTeuAUu/pA
         Q8wAfdl5QFgQ38eVgAszNvX24qWW7aQVOTb+SdRQx9iSVCyCBG8W7neFJ58J1jqM+Ckx
         nGbbE0p6sedSfghrIePbtivFuTMMD2oskW1jKroFq32swKmwrQG58FLNtmCbo3cPdGmJ
         xx0OMQzKMgc057Zvol4W68+leaTue/ravjxxeMGkdent+QMeln+YHW07GsDGssnbVL+S
         Wa9A==
X-Forwarded-Encrypted: i=1; AKwUvBxM0zGRCDNL/B3cVfh5EF+HBC2t0PePM0YxahjpqEeWNnLNNlYnZFLlhQRGLb8fNoUj+7mL@lists.linux.dev
X-Gm-Message-State: AFq9FYJz2GRAxIebj+6D4zgPmU0b/P4ahD0lW9WpnjWQtaaEzj9TqOYh
	scb8HJFy65JEM4PKCL30EIYZF6Zzl5MBS4kOhHFV81hfjU3Q9Q0ul2LDda6Doaw3hR+RGmOJpac
	MODm9zHNgIHEqY6T5fuA9c61wk/cqlAE=
X-Gm-Gg: AYBFou09cSLs3CpSqPtaDuhW0N/3Teu3j+2RL/fQy9SJMoW/IWqDQZQcrZzIWQ+5nXR
	KWtRNhNrcQ23J4IydQ3afFL2gb6iMCgQ+cuKfmaQuMV9oJk+aeBdhcARCBS7ExmLGEijch7tlFE
	P9UN+sS0hPFO6mmrhhj9VUwa7GNBnERuobJWoG4b3P4TJmnD70cya5wjgy2Nq13QZTeI1w62EU4
	u4FnD/Vk//d6Iz3Hx1bOIFAst83Ia4RkHfOPaJM4Iamq9NJm5dVTQPez3+T6aAPEYtfaAgDmPh+
	0vTub2YgDC+5axCdqksXqIS2q+U0KP54eUbLCVULD4XKVZHwAATEzrgB3cD28pkjdP406G7pvIu
	5gt69/v2PnSAd7uC78mrCyMMcU0NgnGft7TCohcIBZS9mJygUgU21gr2xdMt6YV6JpbSm8gGyMh
	nAQsatsb5yXPlUFCd2GgryRpMwO4UeoRcsdHJ0MZotdxUFm02387Q6gfMjDmhE0g==
X-Received: by 2002:a05:7300:54c3:b0:34b:47b2:677e with SMTP id
 5a478bee46e88-34f14ff2bb8mr10351658eec.1.1791023089391; Sat, 03 Oct 2026
 03:24:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261003093827.77857-1-kmehltretter@gmail.com> <20261003093827.77857-3-kmehltretter@gmail.com>
In-Reply-To: <20261003093827.77857-3-kmehltretter@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 3 Oct 2026 12:24:35 +0200
X-Gm-Features: AclHuK-MLIrX0vJiZQYXgDSKkkdNcg8lXBGZYj63LJj9lWkFu6OJmgqYprkqXmo
Message-ID: <CANiq72kGay03jqFOfFcJOjr9Poy+yc2u0=Ep_9LQ+KMy=1JtRQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: rust: Enable Rust support for ARMv5TE
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Bradley Morgan <brads@mainlining.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 11:38=E2=80=AFAM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:
>
> Tested on v7.3-rc1 with clang 22.1.8, rustc 1.99.0 and bindgen 0.73.2

Great to see more arch support! Just to confirm, are there any
toolchain requirements to be aware of?

If yes, then we should add them to Kconfig, `scripts/min-tool-version.sh` e=
tc.

If not, then please test with the minimum versions too! :)

Thanks!

Cheers,
Miguel
