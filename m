Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DAA2C15AE
	for <llvm@lists.linux.dev>; Wed, 27 Aug 2025 04:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756270131; cv=none; b=bu5mWnpR70AXN7R/b/Hgzs/uwP8TbdgvBzROMnARTfGy0B+543X5peCqNB8QyXxfwQN9RwiP3r1tUqA+kihM6Mcb7bny3Tz1VrJY9KJbSwhn+2Kw3WMz34e+/3Y4RnC18A/y5wHU0LdGvd5IX95ZmW3gchF3/ZlEZjPCzhxcwgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756270131; c=relaxed/simple;
	bh=n9iXWg38ZaScmEdTFkS2Fpnd4CBQf6iQ47FIpwxiHE4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MiI2QswX8C/kULMPyRiID93o3xbbGOAm2qbW1OtJSWN3U/ukzBFDsXhanj7aHgz+y4Dv/MzE9u4XVGON5W5B40/S8vqoIjjnZ0AD3HbCET4bFZNIr5Gy6NlGuNn73AOEScXFhnSINv+d5jU3DTch0g6rCB2Nc7I+SWTraqbHIpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iVYJlH2y; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iVYJlH2y"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-771ff6f117aso1123217b3a.2
        for <llvm@lists.linux.dev>; Tue, 26 Aug 2025 21:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756270129; x=1756874929; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uM86AKSjc/mfyCmCpvKX7/jvO/X3K+/iBfdvAaEghgU=;
        b=iVYJlH2yjshNOq7eF9uBom/s7Y0h9WIH24OsSTZynSGTvB0JPU66K6SozksEOj7v6/
         3rrK7S54yvchGR7VXl2RBZVPFB+VA2h3USvQMFO+zNberZ9iweU6tyLTpi+mXGb/iaUg
         xCmmrZA84wRJU4sSaVhfHUgI5Cog540zvwbtWOPJ+tEISBBSddIe2BEJihdPIUEVGGet
         LDYkE4jeNbkAx2POJlrldCyp+2OagrlnZWl15jJ9UTKIQvs/J7uLYHD/oZiZ6erYkmhc
         JnKgw/cZ3irj7wom9r76xaMQkv61UynaLokk83uazJOUOAlwfRCSk3eFEIRGRbpjSCcu
         7KgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756270129; x=1756874929;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uM86AKSjc/mfyCmCpvKX7/jvO/X3K+/iBfdvAaEghgU=;
        b=oih7a7TQOQ6qoW7zRshCY9bDB1+5cybhxgSbiufg4o8I07zWRZS8TmiyZNF9ubyQoj
         qj4v6NMriw6Jl0emfcn///XRqQQUdNsC4H6dt7JKssg3/6dPdPDthhN3IkM3ie9Pvl3u
         5K4Xaj2ZUo/Gz1y9bRdVXEuEX7ZEkunHqU4i23PZ6Ci/eYAU324wvTfD102Jv6pUxyaD
         aCLJYuNudZeO8r16iUdVfQMksKU43Pn0A102qh/4BwwKmwkZpBCZC1K4dwfdD//WOU1f
         QcsWvNev0rXNvHKwk6Ks0AR05M59K12wh6/OLp8N51ebw4RNXB2e4ZmMF/lfKoDUb3pn
         Rq4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1AEcgBH3AvCG7dzYxvDIqU8GHk01DZ/t4c1C24tO2Tbu1k/mRoaihfEuDw4AbjEVJ1r5A@lists.linux.dev
X-Gm-Message-State: AOJu0YxcUitzB89YqiYn6UmqCImopzzhu5/d3uFPrU3+6barjG5sMMJC
	+WZprAhvVBVVNzw60V42W6oC8EDhA5X3l4H6UdTt1nbz1t5No6wzjIt5
X-Gm-Gg: ASbGnctEzq/qe7KwToKZ3GizuB32z7t82ZbbSw8rzzxxeXMH/64GdP8lgCMQOVb9o9o
	cBI+4uXHl3NGPrLA8rx3mDIoNS1AzApepl0Dl4a10G+kxrkrTaslILUjgrMnlQz6LluotCUe0Xk
	ojExSw4LH4iMw/x36G+2SsG3WCjcSfAk+KxOKAGZhKPDE1R6KkS7MajyS0fy3hRfL9tezgnYehc
	EDlXL3OwGS/7Co/e15F3QUqNJjczKrSL5l+4PMVeyALZGCddzgKs3J/1haFy5WcVdK94VW8Xjhj
	IaNoGXNypCuBV4eGftjIeWNLicT3zGy3/FbEfBbFpFzau1eIpwA8iqvWXZG17Sht976nKaTiwqA
	iueMOcCrFN3AT8DMTLw==
X-Google-Smtp-Source: AGHT+IFyFOCy44QMrSl0yaDbGBpVcQSmEmcvQ/OQcUhDh8Uxe77m+aTQYxT5FJA8HUghKnsL+zhGHQ==
X-Received: by 2002:a05:6a00:4b45:b0:76b:e805:30e4 with SMTP id d2e1a72fcca58-7702fad0046mr23669436b3a.24.1756270128610;
        Tue, 26 Aug 2025 21:48:48 -0700 (PDT)
Received: from [192.168.0.56] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77058df4db4sm8613617b3a.76.2025.08.26.21.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 21:48:48 -0700 (PDT)
Message-ID: <2e20aea407140c22d12f89cdf07605c31c61d0fa.camel@gmail.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: Fix the invalid operand for
 instruction issue
From: Eduard Zingerman <eddyz87@gmail.com>
To: Feng Yang <yangfeng59949@163.com>, ast@kernel.org, daniel@iogearbox.net,
 	john.fastabend@gmail.com, andrii@kernel.org, martin.lau@linux.dev,
 song@kernel.org, 	yonghong.song@linux.dev, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, 	jolsa@kernel.org
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Date: Tue, 26 Aug 2025 21:48:43 -0700
In-Reply-To: <20250827031540.461017-1-yangfeng59949@163.com>
References: <20250827031540.461017-1-yangfeng59949@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2025-08-27 at 11:15 +0800, Feng Yang wrote:
> From: Feng Yang <yangfeng@kylinos.cn>
>=20
> The following issue occurs when compiling with clang version 17.0.6,
> but not with version 18.1.8. Add a version restriction to fix this proble=
m.
>=20
> progs/compute_live_registers.c:251:3: error: invalid operand for instruct=
ion
>   251 |                 "r0 =3D 1;"
>       |                 ^
> <inline asm>:1:22: note: instantiated into assembly here
>     1 |         r0 =3D 1;r2 =3D 2;if r1 & 0x7 goto +1;exit;r0 =3D r2;exit=
;
>       |                             ^
> 1 error generated.
>=20
> Fixes: 4a4b84ba9e453 ("selftests/bpf: verify jset handling in CFG computa=
tion")
> Signed-off-by: Feng Yang <yangfeng@kylinos.cn>
> ---
>  tools/testing/selftests/bpf/progs/compute_live_registers.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/tools/testing/selftests/bpf/progs/compute_live_registers.c b=
/tools/testing/selftests/bpf/progs/compute_live_registers.c
> index 6884ab99a421..56aec43f206f 100644
> --- a/tools/testing/selftests/bpf/progs/compute_live_registers.c
> +++ b/tools/testing/selftests/bpf/progs/compute_live_registers.c
> @@ -240,6 +240,7 @@ __naked void if2(void)
>  		::: __clobber_all);
>  }
> =20
> +#if __clang_major__ >=3D 18

Instead of guarding this with compiler version, could you please use
progs/bpf_misc.h:__imm_insn() macro for the jset instruction?

>  /* Verifier misses that r2 is alive if jset is not handled properly */
>  SEC("socket")
>  __log_level(2)
> @@ -255,6 +256,7 @@ __naked void if3_jset_bug(void)
>  		"exit;"
>  		::: __clobber_all);
>  }
> +#endif
> =20
>  SEC("socket")
>  __log_level(2)
