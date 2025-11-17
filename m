Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187CE199252
	for <llvm@lists.linux.dev>; Mon, 17 Nov 2025 23:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763421396; cv=none; b=TeVWLJ/EIUI/CT4envhnzWCoYZkahJDcpQSqtIX6iR4t1c0YmHUAY9fOmL0scBZIArdCphWgt2mmi+kBdH3vyVoL6Azf+TcL8V6LscJSgfkkHumHqKqfz+IrGIdlMXtDQyS0oG0cKLgRuqhqfetlzrdldxVoeG00wyfRqoyzpUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763421396; c=relaxed/simple;
	bh=jxLodLca7ewiKe1f9MT5tlc0H0ctntQd5FX8FHuwEis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fw4Ky1oUl0JdfNJ5mWkvx3MhmKOUxr1gZaKtM5bWXqlv6Sri03eNYMp/CJgn+EIc0UjIzAYnwDvUDa6F9aVPkUUPRIdREWf9GFCVYS/RFu74o1fpeqrlX1Zwh8DY/hwJO+plbjz6co22SdkJ7dj92+EQRF5SKyylaGmalso8O3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jsOp7aiD; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jsOp7aiD"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-786572c14e3so49658617b3.2
        for <llvm@lists.linux.dev>; Mon, 17 Nov 2025 15:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763421394; x=1764026194; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIzs5G7K9p0I4vbdZrShECv8LDggXVlaKJcjtUKpClU=;
        b=jsOp7aiDdmY+XVxcNltL7b9BLxJ6d8CJEFf/tc/29rOCB/gzjH8t0fAbubYMqBLjwS
         LVXUbI7N6m00d4G4krdkYW9BlSyd9FRucDluSeoelArXBd2HWKX0cnzxPMRCwVhCJKnF
         520wV69lyDzpBDGr7jjHnE1gCLhxk5EtOhEpyNYzG29MlzoE2IQg/Agxx1cvo3FeeBfj
         qMLcqX0s/0ZFWpXczrfs6iFoNYakJQMzxbMNXFtaOE/fWmjTBkBWTD/1Z7U1Mr15sdLJ
         2mf3u3HRgQQuolPaKccE1uj11i5MfjPDYDzQ62zdXVM8ROnbhIfy/0zHF9zlfMSDEaH7
         +Qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763421394; x=1764026194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nIzs5G7K9p0I4vbdZrShECv8LDggXVlaKJcjtUKpClU=;
        b=UR385YugBD4U2haZ7YMQ13/UB267IB5ZgIuXaIBnJzD/dyAP99zYTgLM/ZmYWp/Heh
         VG+OcspyhxOMp6p0BSWiN3mMtwpGVBB2a48amOOoVBfps1fotypTetmy3og/vmZARoCV
         eNFbCN4qwhy7fcKLLYviVEmk8uKd3TQDCUnghuqbj9u3gxbbTEJgAn3XYVZoz9pz3OWa
         Xjk5n1UC130vo3OEywNBGdtoVSI8CM8nMLlmtBAFCJHiBM1+y3dTqzi+3wGj7BtyKV9L
         24GjaysuffjrRbChhVj4lAvX6tZ18JwE13WjPInshFW4jIsTsy7en9O9+uN4oUcUPWFA
         zTqw==
X-Forwarded-Encrypted: i=1; AJvYcCWpHQbkCL4iHNf4VP+w3Kh6XwPD97CDeHztyFk4SvEGpUeNe7ZNcNwFcQsPWHJPquUiIlPB@lists.linux.dev
X-Gm-Message-State: AOJu0YyoESoEC5+eWh09co2NUqDgS36YqVtSLiKMhPVqIMwJjQ7sgnRY
	qcImhd7HwV8TkWb7n5uGRBf3zyqxVhnS6z0NrL3DcsU0RO+6GHAPKKm37cpnmVmPpzX+lP0EU6w
	MbsO6ehlUHdp2LNoEvARBrF1YQLWV2eo=
X-Gm-Gg: ASbGncvKBd+Rwz0KAJrnajoMfswIzkvQ2Iq+4oWWBBl53RHM7AOSVY0sQsi7CVbWG0a
	LfjcLnf01eF8Yz/4VT2HaeJWminOmcH4/d28FuUSTmav4oGmjEUNU3+hkQnXRaz8LkTfD/OXCfu
	VfQP0j8ZlnvMDoO79Y9GbLnOu362T17VmMZFmMGbYWq98r6sRRtVDTlPy7K/TU+YVb0o2gydyX/
	IEBMykxU2aPn0eiFGZaAkhMI/YkcbHoiSF+g7ejftqpHods/o8E11iqQkl4YQanpZ7j/VFfxeBO
	ebY8OQ==
X-Google-Smtp-Source: AGHT+IHq8mFdaWAwTH5NweYkAifSFQ6Db/XmUJ6O4Ebx8lkQwBoyAEHCQmSnoznZ7K01d/QRU2wTN08P1ghJarvmDGw=
X-Received: by 2002:a53:c049:0:20b0:63e:350c:aea4 with SMTP id
 956f58d0204a3-641e75e617dmr9907487d50.32.1763421393869; Mon, 17 Nov 2025
 15:16:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251115225550.1086693-1-hoyeon.lee@suse.com>
In-Reply-To: <20251115225550.1086693-1-hoyeon.lee@suse.com>
From: Amery Hung <ameryhung@gmail.com>
Date: Mon, 17 Nov 2025 15:16:21 -0800
X-Gm-Features: AWmQ_bnh7sdfaFebeRQSEnluv2kSf8mibeBxu_b7E56z0al6w3nF10mPIwtzUEg
Message-ID: <CAMB2axPYM6xa0q_8B-r5PNedW-WeOGFHE+UH_fHrtq=AYXAG2g@mail.gmail.com>
Subject: Re: [bpf-next v1 0/5] selftests/bpf: networking test cleanups and
 build fix
To: Hoyeon Lee <hoyeon.lee@suse.com>
Cc: bpf@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 15, 2025 at 2:56=E2=80=AFPM Hoyeon Lee <hoyeon.lee@suse.com> wr=
ote:
>
> This series refactors several networking-related BPF selftests and fixes
> a toolchain propagation issue in runqslower.
>
> The first four patches simplify networking selftests by removing custom
> IPv4/IPv6 address wrappers, migrating to sockaddr_storage, dropping
> duplicated TCP helpers, and replacing open-coded congestion-control
> string checks with bpf_strncmp(). These changes reduce duplication and
> improve consistency without altering test behavior.

Patch 1-4 look good to me. All selftests changed also passed on my test VM.

Reviewed-by: Amery Hung <ameryhung@gmail.com>

>
> The final patch fixes a build issue where the runqslower sub-make does
> not inherit the LLVM toolchain selected for the main selftests build.
> By forwarding CLANG and LLVM_STRIP, the intended toolchain will be used
> for the nested build.
>
> Hoyeon Lee (5):
>   selftests/bpf: use sockaddr_storage instead of addr_port in
>     cls_redirect test
>   selftests/bpf: use sockaddr_storage instead of sa46 in
>     select_reuseport test
>   selftests/bpf: move common TCP helpers into bpf_tracing_net.h
>   selftests/bpf: replace TCP CC string comparisons with bpf_strncmp
>   selftests/bpf: propagate LLVM toolchain to runqslower build
>
>  tools/testing/selftests/bpf/Makefile          |  1 +
>  .../selftests/bpf/prog_tests/cls_redirect.c   | 95 ++++++-------------
>  .../bpf/prog_tests/select_reuseport.c         | 67 ++++++-------
>  .../selftests/bpf/progs/bpf_cc_cubic.c        |  9 --
>  tools/testing/selftests/bpf/progs/bpf_cubic.c |  7 --
>  tools/testing/selftests/bpf/progs/bpf_dctcp.c |  6 --
>  .../selftests/bpf/progs/bpf_iter_setsockopt.c | 17 +---
>  .../selftests/bpf/progs/bpf_tracing_net.h     | 11 +++
>  .../selftests/bpf/progs/connect4_prog.c       | 21 ++--
>  .../bpf/progs/tcp_ca_write_sk_pacing.c        |  2 -
>  tools/testing/selftests/lib.mk                |  1 +
>  11 files changed, 87 insertions(+), 150 deletions(-)
>
> --
> 2.51.1
>
>
