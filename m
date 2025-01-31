Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B892122318
	for <llvm@lists.linux.dev>; Fri, 31 Jan 2025 00:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738284510; cv=none; b=QYLme9aCeej7iCWEjH/f2v17Xss2HyePEp7NAy078Tl775/F7GANpTiJuX2zWgSiPyb6ljHbBgL63B1FpkxjzwV+xkom/K3HSSfRvkcyVkOOzdSuWQXKSZrUNhK5J/ojJOAxX6Yhcr+UskE4vfgovtQQqfTUCw7/wvxFsDvWBLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738284510; c=relaxed/simple;
	bh=+xMaN9yAbIcURitIBFnND01fmgks3Cq4Ks6qF6WqJ7o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F6hwy26WbUQRJLvShla1x/7lVxF6e6TpZwSlnLlb32oF8NcRXwPv0EdoYoZTffdAO41hAgL22uvM5mvy6UoTZxkZjMTO0gCs7lT1sxI/Ix0kKvFy12ICcYId88XCl1R7HIkv0x59FD/CPMRxHj4cGWKO6Ni+16s6RuXy/0PFy0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1WhHc2t; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1WhHc2t"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2166360285dso24277955ad.1
        for <llvm@lists.linux.dev>; Thu, 30 Jan 2025 16:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738284508; x=1738889308; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YtPvCO6S0II/KJMCKKK9WhQP/vAJCYUBd1iffzSjO/w=;
        b=E1WhHc2tgjVyTqqDaiLVEfV+jzJXuxKjOVE4Cj4WT0s67svzbdLnYmP7G4rLGthxEU
         rUQyA3BfwXQiXaeaBKPlSWG1SJsUPe2lpmye6R7RzGrvhRsoeoUh+a6GgpMqiV3u2hCl
         O2IIdoOX4ooMEUFC7jHXW68fNnKuW50HQXeCeyevxBut+OrMSYLrEP6VxAKN6D6E6Mfb
         vMAfHsf+L7E312Cmx5J+k82970f/iDmmCzywFSvVWgsMrI3rjEkG8ne5SCf4ioHvbKq4
         8mUX/5TIcEeIyaGI5bI2px+qFR0bCGmJQsJklpBwnI/cfmj3fz+FF96W7ZBpyeDPug0T
         AT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738284508; x=1738889308;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YtPvCO6S0II/KJMCKKK9WhQP/vAJCYUBd1iffzSjO/w=;
        b=wp2dLdYdtK9Hqvz1sz0OFuVp6yQ/QVnylEx5MZUJ4K/bDhVZX8kQh5dABE+9xEMtZV
         eL8CNMokLB/GvLSFrKtPWObTc5VKQkI24UKOwMUn2bArD0dL8Vx8bvJhsgQNHbUNx06a
         XOPB2dnW9urPA5icoKPA5UxUUgDpz0nroq+66Qn/fgYppzpNU1d6kZVp21OSlAWzlJFV
         LcqXpGQ7SaH+UryRlJKYnhZLhvKdFMWgI8CRriGV0h0NfouLS3sMvZjMLNLEF8LUiyNA
         9AlBoH52nC2iCkSvc90Ns8JgycDi/XnFhi3+5XtI16WJJBv0uf5caHmJPV+G1uDw3T6U
         IJVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYndUckHJAFBJxxArjtdJeGV0JRDt/LJjcYuoXX58QZ7eRkE954pEnuD1Dd3zXux5OW68n@lists.linux.dev
X-Gm-Message-State: AOJu0YynaA3jsnHuruxFF4ExY9JwFeWk0hrZim587tXJ6bVz1qwjSQAk
	ADCnwHK2cRSWTosseKieO9QmQAZicLqQpS01G2SVmDwGdyxJZR+j
X-Gm-Gg: ASbGnctxA++G7FG5bwQ20RGm0A5TQ+jccOV8yzoA3Z+tVz4oWTYCW5CX0csPg4UxMcu
	zQ46E0Hr9Ku+/s6H6gHLa5OAiCjWicNQprRouUEB6tHE3zSNeAgn62Sw3idxCssbZr2WEEyQO37
	MzmCLAnD16dU0u/NDlz9G0S5J3L2Q4r4EngCNfHICGheswUZ41tzRZyIUxOsOlWimCrt87AjKrx
	y8MA7Sv/Adb7qwOtTi7WJDKb4igHnn4B6VM99s9we6HZUPA83QJ9dM+DDnLQw3tyYr89K1q19ET
	FKp99THd2EW+
X-Google-Smtp-Source: AGHT+IFF6eAT5w1vWPhpPcgEgSxowVdJfEet3pFu4xTXuLB5i+viKrOreK5sdyh578g1EBtx5geEAg==
X-Received: by 2002:a05:6a20:8415:b0:1e1:e2d9:3f31 with SMTP id adf61e73a8af0-1ed7a5fafe9mr12744457637.16.1738284507892;
        Thu, 30 Jan 2025 16:48:27 -0800 (PST)
Received: from [192.168.0.235] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ba2d6sm2128078b3a.109.2025.01.30.16.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 16:48:27 -0800 (PST)
Message-ID: <f70c352b558742a328449e941dc33237900fc74d.camel@gmail.com>
Subject: Re: [PATCH] selftests: bpf: Support dynamic linking LLVM if static
 not available
From: Eduard Zingerman <eddyz87@gmail.com>
To: Daniel Xu <dxu@dxuuu.xyz>, shuah@kernel.org, andrii@kernel.org, 
	ast@kernel.org, nathan@kernel.org, daniel@iogearbox.net
Cc: martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, 	jolsa@kernel.org, mykolal@fb.com,
 ndesaulniers@google.com, morbo@google.com, 	justinstitt@google.com,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Date: Thu, 30 Jan 2025 16:48:22 -0800
In-Reply-To: <872b64e93de9a6cd6a7a10e6a5c5e7893704f743.1738276344.git.dxu@dxuuu.xyz>
References: 
	<872b64e93de9a6cd6a7a10e6a5c5e7893704f743.1738276344.git.dxu@dxuuu.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2025-01-30 at 15:33 -0700, Daniel Xu wrote:
> Since 67ab80a01886 ("selftests/bpf: Prefer static linking for LLVM
> libraries"), only statically linking test_progs is supported. However,
> some distros only provide a dynamically linkable LLVM.
>=20
> This commit adds a fallback for dynamically linking LLVM if static
> linking is not available. If both options are available, static linking
> is chosen.
>=20
> Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
> ---

Tested in two configuration:
- when both static and dynamic libraries are available
  (linked against static);
- when only static libraries are available.

Tested-by: Eduard Zingerman <eddyz87@gmail.com>

[...]

