Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766011E9B3A
	for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 13:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271189; cv=pass; b=NB3J4G0MSSgqPEkVAI2NWOtFiKUDMgiwe4NMvvpFIgyYbd0Ti6qrMJsalvJf/gEz3sbeawyQRo8oKOLue0VnoqmC59mkq+F42PbwVYa65jP566Whl9Qga/Wha0r3yH+9oFkHK4Jc1Pn6YY2z+u6ppIVLwdQ7lURnfyef5cSPbhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271189; c=relaxed/simple;
	bh=mpomDLO8ZlCocmuPtdKICwxv4H57ynvhw4z1RG2BH9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=El9A/y9/MDfD8beu5tsgtoAhN5FfD42XKYSdZoO3ZNZ2xx2b2yl1lleR/d67bvSFSMpnxkd0ppla+/HuqWmKl38O2gx8yXuzDuGGU5qouUTdSjpIuxw+OiG01CsZixxFk5UWGFyh5POXD30fFHU3PcLS81MvYCWWhA3C3gOt09s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kuSIAhck; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kuSIAhck"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c1410009a8so17319eec.1
        for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 06:06:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774271187; cv=none;
        d=google.com; s=arc-20240605;
        b=FlOG9iPjlyk7wv/DR9X55ou/AlxEJHhVFCbVi83r0Wfs48s2z46uGW8DAXajO8Q1Dt
         l6Sbrh35ek02JdmfPaGvQVGDM2ljtNtGsHLgScb969pDI75tgIrVMRK188BJgkmgz3JR
         E6x/7sRJrb+q509yoJ/kvVZctFH8UYsrfMzs7hGjj1c14a3Q/LO2/DMPwARlWZKPC/sp
         beN3MWb4njZxj7kTXV05fy2oYXA/4RJV1b8qzNtsGGxcwP5iAo/acXmJjyFV/rc8ISkl
         u1JhhuGP3i7g1nYdCYWoH1fwoxp+26dv/ot2JBWV/SL5/z9QRWhvpJfwPqmKADEtLPWv
         NOcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZeosOC78tfRPtRL6p+oZtOws2T4Y/1DZR2wWiWY/WhY=;
        fh=k5Oxxmkfr46dxF7IVHT/AfPXwSC88EsD6mm+DDLeiOA=;
        b=Ob2w/4OyufE8yes8d8SZ1rY+7JAUMR+O5y22e9o+N61ToV28lkPna44cjrJx8yUFTW
         LKzVFQWryWk/6RaKxgk9KEIBuMotV2mU5o6E5T/GgVzMJe35wNRHlzL+dZahTOF+pzcs
         rfuzlyqGbzMkrfXuq1SLNkLLPpm97/UX+vE0Bw6ecluMcTw9TAVBqDBcGTfJsApmAOWB
         XS8LPqrS/09NnwzDR2lQI+V6zksGSk5+w/xLOrK/WTqnE6+O4ppaRgVDu49Uy8T84+jQ
         xk34G2NYSOSYzmBRLZsTgJqwaM/CSXDIz+7uNWtBW0m/bXRW6LnkxEGEBHtzGGcthVXW
         hbLg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774271187; x=1774875987; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZeosOC78tfRPtRL6p+oZtOws2T4Y/1DZR2wWiWY/WhY=;
        b=kuSIAhckaeaKYiiaSQHGGdQiBIjCzMoc4vClkUtfwWsuojkT12tHkzs/N4en5Wn9UQ
         yWi+KMmnMhh4kcEqvLF4yBJIl21qOYDziv+hSHLm/b1WCNYJ2Mp2Fs705GUKZdKkcqPd
         hnsHfE6eD4NweRa7YDGUJBFxaE3XUPn7o/kmu3YY54V/I8g7yCUyVbL38t8OIiUWCx7L
         qxuJ7Oto0qUAhklOeFqljt6zrN40bua5Sw9O3w5mB8bXYx6vbDErP5++x4x4Z9ApQAbZ
         G7mj20wGkeXd/fGTJis01GAlympMy1f61ofHiiU5eFjo2+cvVviG95XZjRhQhRLISkBy
         afzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271187; x=1774875987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZeosOC78tfRPtRL6p+oZtOws2T4Y/1DZR2wWiWY/WhY=;
        b=B612oZDkRntU6sd0DCYuIG43CrAN4kT5g69aQFZ56ESWa35gwEhyZoxBgxzNRYCbwg
         0XxY/keSM8g1Mh2MBE8T0nErK0OIfpYO7YHJ2wDhS8+u0aUIYu8fgYlLqJSxvkQeAU/G
         1DLlbYneEnPr3wzZY7Pg0M5ajIHdX0CAUT+f+AV0NdsoJEHtowHY/7ahqET3NLvJ+yMD
         28T0KBcqrkVdJjDT2ede+Rqhs3Mgqdq82qynMjNX5HrH9LgWnogz7nRHROoJtVb7mEld
         w7z4Dkz/3WS3wsRs4sQqBewhyyJiSqcmCVvNwiuLWr5NPOWnnLZ0RJu2f0wCE9TaWWde
         pX0w==
X-Forwarded-Encrypted: i=1; AJvYcCUY+B5quVINRdLdg01ZakewKeLJHYEq+iHj998E5DuJpXN8XwKfZ6K/6+you6Zf955GLkFa@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7tEpiCX3BGSpVPe6CfLyGksR3RAkxCQ8dkbO1BMqnH+3dzNy4
	l45L7Vqo+c22z+kOwo7Ia/LSTTrPr4JNfYwYWePd5C15oaeQbJ7Sj89a2im+8MDPH79DR8qu7kB
	rMpgny/jTFUxjZKtVG8sGU8pyQRLx1jo=
X-Gm-Gg: ATEYQzxQyBPQbrYhRyx/6kqqMnwfU/U9iRLu3Dms4nOSdrJl5vTAV1QHIF2Zk4zwdgZ
	2VwXEhL3IwklhLs4ks8lnnNQoFHfsHxV3gvW6+Yx6SVAOlOJ42M2ZZC2fwd7V9JvhZvqmtHwW85
	7v2rqySydD6tt6KZYvjD3IkO9Z4P9V4SxQ7a8qufMq1Bi3to4nlDwzbKDZUX0roZi4lXiCfUMZT
	9r9u4HLAvIg+JA1ZtvSuh4pXTfWaiJUaVCMxheKC+GbdlaaMbNEx5ah6586GoR6VJjJHeQmyuHU
	MkPqhjNMMILdk6mpGn708NptJRNIJh/g0YCwjVW9WPV2bDKtDNEmo2JxY7L+5N4u62DvuDWv9MR
	2qhscqTOCtIsO6n1d43HSz+M=
X-Received: by 2002:a05:7301:4085:b0:2be:1f56:ed0d with SMTP id
 5a478bee46e88-2c109861f4cmr2413702eec.6.1774271187398; Mon, 23 Mar 2026
 06:06:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241119185747.862544-1-ojeda@kernel.org> <CANiq72n4Fw96hcuqQeorsfH7z4Tb+R1gdf80H_XkD-oA6z5TSA@mail.gmail.com>
 <CANiq72mNJrMMbEcfJMLT4kM-_iviM0AR6oeigCyrb5eMWkn3KQ@mail.gmail.com>
In-Reply-To: <CANiq72mNJrMMbEcfJMLT4kM-_iviM0AR6oeigCyrb5eMWkn3KQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 14:06:14 +0100
X-Gm-Features: AQROBzDGgsUaXadH-7vInj5g5TFUGkgbxokPDq2lRRDY18_WJ88m9e2GeTeDbRg
Message-ID: <CANiq72nvR70EOud=4drW6gs=FAndv5o7+8n5NNRkAStTaSJWPg@mail.gmail.com>
Subject: Re: [RFC PATCH] rust: allow Clang-native `RANDSTRUCT` configs
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, Aaron Ballman <aaron@aaronballman.com>, 
	Bill Wendling <isanbard@gmail.com>, Cole Nixon <nixontcole@gmail.com>, 
	Connor Kuehl <cipkuehl@gmail.com>, Fangrui Song <i@maskray.me>, James Foster <jafosterja@gmail.com>, 
	Jeff Takahashi <jeffrey.takahashi@gmail.com>, Jordan Cantrell <jordan.cantrell@mail.com>, 
	Matthew Maurer <mmaurer@google.com>, Nikk Forbus <nicholas.forbus@gmail.com>, 
	Qing Zhao <qing.zhao@oracle.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Tim Pugh <nwtpugh@gmail.com>, Kees Cook <kees@kernel.org>, Nicolas Schier <n.schier@avm.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 3:19=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On top of that, backlinking the seed discussion since I will need to
> update this patch:
>
>     https://lore.kernel.org/rust-for-linux/CANiq72mwYbg_L8u9NEfRD0Fp9E_zh=
Ci=3Dt=3DU2jyjsZe_Ls306hw@mail.gmail.com/

I don't think that got merged, so I didn't update it for v2.

Cheers,
Miguel
