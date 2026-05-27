Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C782D466B64
	for <llvm@lists.linux.dev>; Wed, 27 May 2026 18:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779906639; cv=pass; b=TeJd7X0S7v4iWVCygaHMGhkFgKOxSiSS6UyZX9ohYE/g8I10i2qTMFLs/T+sDUOLMloTPxhbH63zJe/OYzBk72ZEUTpEs12oaYSf04m7Xu2FWDaNXga/0F4UZr6sEyXbZqf2QYYoSyeWxiLDHvIydQnhHF8hD5Cd5iEC0zXEuYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779906639; c=relaxed/simple;
	bh=05Y9XjvkVXF+qq9omK7FB15O1pQx7r6zROjb1Ybl8ok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BSB+Y4T9yw0L0nQk2/mUKeCeU4Ca/tmC90p3TlFcu042I0bbt/sjR09Y8Zhnu4rrU0CyCBh+fW0g89n6S3Me6WiZkjyjo02dAmMPlnpZYshSDlgeCuH3e38tbUr8bMMEipiLqEbQ5J0/35tizMQRWV2QakAlxYE0rawQckqFmTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sdJrXxoX; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sdJrXxoX"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2f33ae12f97so4316413eec.1
        for <llvm@lists.linux.dev>; Wed, 27 May 2026 11:30:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779906634; cv=none;
        d=google.com; s=arc-20240605;
        b=QMotpCIZ/VRL5ZRt/n78RhaD0hZsOncs3BTmkSDYDSXaSYDOoayuQPC5TO/0yOLbsb
         GEJsBhnqWB2ljZYG0ZV44weFvxpdJ7M+gHIRCqmLRF3zgNzwejdFusON/3/mLGJ13+Fv
         iRd2U0hyR1KnXtM2jZKmQpw9uuZWjvZBjCrXVW8xhx8HGWu+ZjfM2dY8MICP5WBIAG4k
         QP1GVWCTbmmsbmANIEHBW+bkcl0uf6z6wv+xV9SfzA1iMhQ7OoAYMcpBHyfxyHvPap80
         DxhdLJtdUpb6VZmivr0d2T+9TKQM+5VRfweTKfhcZ/I+g7VixCTLFivBma4mExEJPwDi
         UtXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=05Y9XjvkVXF+qq9omK7FB15O1pQx7r6zROjb1Ybl8ok=;
        fh=PIHWZC/Ff/r+xn+ARpK79TBZGvvP+gszEQ0V1dYiOF8=;
        b=cibhMpU+cnj+x1OmEhoLAw7NIiumZBlPMLMq+hEpkX/ivUkQjV75Ml+RL7UgYL3gv8
         f9OAUsbjeM1+0e2sEn4AkAekm9VzlcZEpmUVAPYyNIxtofn/XKRTGXOr2NAAm3+rL+7u
         PD3byLpaNRchOocthVn16JQxgxDBb+POxR3uk6sfpYr4g4EXfXkZpmZMqUAeG1FD0KED
         3igux5GR2BVuWvhBshE5QmHHJdvGL9znCDdkojucwqTtZs2jfvQxwNo/6IcqbFdRysSe
         Klz4C3sKy/eiqhVqXmlUnSYPXA5SNfPLh/OpKm1/2A72QeK5wb21xKmi9ns+hWP+Q43L
         dlWw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779906634; x=1780511434; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05Y9XjvkVXF+qq9omK7FB15O1pQx7r6zROjb1Ybl8ok=;
        b=sdJrXxoXnnrZMEMGmeY7gbloVmsRkWDyRv6Iqzvz0Eq5yLzz4ESRXIRPaZC5cigcoC
         rd+o2zbJ9RibL+r1jWlPV+IyrpoOa6sx3QeSA6aDwpy/QPBmaRB0Tj+1bEYuvdK4KZO2
         viJu9FLiAlKwUUcGBD6MEbNZI45kbr6FBMmhZC4LXy/8ZzMRJKdvmX9AA95hZWAeJM9O
         vNWFUL8wKnCWtGo8M9jP0z1L50mTZ9bWbxl9LuBejvke7spTiu8C5DMTiVLRLdugIfB+
         PJeYVe9kSL4baSRxFdacyBXU6d27wq2ER22uv7GghwpowmYItoPGuu7xaqNCXjLhehy3
         0Jew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779906634; x=1780511434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=05Y9XjvkVXF+qq9omK7FB15O1pQx7r6zROjb1Ybl8ok=;
        b=s+12Q/RRq4IMUVvEC0Fr3J97qKs3P4gBtXgSMg8TwkI1TkDQJNAsUk/NtUDKZL1r9b
         E5Lfqbx5sfn57ryqRoHOkUWFVuDUUUrv0iHdd4uF3jUs6+q+y9z47J5XcwxFPPA/G/pS
         JMB+TTNhHKU1bcLdUDCXHXM2jibtaR96YyeFSe6PcOeqwk7OrFeMoy2s7Eot19cP6Z3o
         /HVA7Q1PO+BF64bA/weK1KkiwPEvBiF6D0FKLfsa+tOAhuhpWhROZttFcZhhCI/4y8G/
         jW0sJ/EBuxGuV+3GyjsqFkOzZzdpq/s0jFK19K+EMq0JoWanZmVr62kOpcQIy9yuQeCt
         V0ow==
X-Forwarded-Encrypted: i=1; AFNElJ/w+AFGrQD9eg34+0fDcMSWMbZv9I/YGzLWeQ62gB1c/DRzzOA6QmR/8LuARepPiu/VI5Er@lists.linux.dev
X-Gm-Message-State: AOJu0YyfiyvvoKGvB8gvi4XdPkzRZuNt8EmOBSq/tAZDQAkWpGAO9Zb4
	Ru2T0JAb1ERHZU/mwOgpt4rzUsYVacevC3LPSgroD8JwjADNBkXN8w3bDCFtIyuKu6l+LqtXCw2
	Se8hamvx89RI35Y2Rmi6Dz5Btv1rwmiVUr4mcxVmr
X-Gm-Gg: Acq92OE97opjnnDRzbiQt1Z2bsc7xULAdAGszBGzPf9hTYlL0rI8pklhBHCjYcLHcPU
	aiSkRGOoNVOo9n9zbsOLYj6anxRflfVqy7UTzmHtATS3rO3YfxawCPzK6oGnzik8xGLerLLo13y
	mXiCmEcjm7AWJwskHH9p5MzIH9sh7kE3mlxJimGWP9QhwfnT9ZDEWx1pZ4trv9LQVZDcVuD+5M4
	Gu7GFlWwTOtG1QvLtH72MLEvw4HO9CxlZhQxxVtlDBpa0usiBiU3j0DPUsCzWMvoY6v6qhzon35
	jxS/ZW+ckPf6q2/07Ch6Hf4a2zdwGYlVt//u8cHRt9Ohij9l
X-Received: by 2002:a05:7301:fa8b:b0:2ea:3370:6e51 with SMTP id
 5a478bee46e88-30448ffc5a9mr10859326eec.4.1779906633763; Wed, 27 May 2026
 11:30:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com>
In-Reply-To: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 27 May 2026 20:30:18 +0200
X-Gm-Features: AVHnY4KCCktAaAvshFXaUEjSxCxJfhTGbdSffnT8DJ2KsZSbTwQFBibAhZnsXPI
Message-ID: <CAH5fLgimP4Rp-jR5i4rpMDceg0VmxwY2pybKkcdJaPmcmkChFA@mail.gmail.com>
Subject: Re: [PATCH] rust: arm64: set uwtable llvm module flag for CONFIG_UNWIND_TABLES
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, stable@kernel.org, 
	Bo Ye <bo.ye@mediatek.com>, Isaac Manjarres <isaacmanjarres@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 8:18=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
> Link: https://github.com/rust-lang/rust/pull/156980 [1]

Oops, should be 156973.
