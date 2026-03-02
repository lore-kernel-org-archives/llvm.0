Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675B533344A
	for <llvm@lists.linux.dev>; Mon,  2 Mar 2026 06:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772431928; cv=pass; b=MwA17VwVzoFIXBNHXPJHjNfaRoTBQdoII8ogzrX2R0OEwNVKZauLaCEovhNOSiExPiZSF0riD08VduAVzgGFBLVAymHiFPQgZZHn3iydUD9ILsAMBLbE3TTiCUyTSLrNHBILJLZIlJpZ8U2hv8AG1RNmpSVcSX9Dcfdl6gWlcww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772431928; c=relaxed/simple;
	bh=UZhBqkq7sme1gXCpbJjFrKz8FxqcGe2wY6C+t/7f/v8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lq7n3ISrP1axlUvl24ttWOTValJnxMrIoilOxfzb0n87MZHo9MPZcw1dQleK/N+gvgzRwJDKSZpaaAznUvDRtXuBVptFActbGtZONngWa/fscXcKSBgFG3yCBgxJGi288JHV6hbMqV78k3QXa7hss7H4FbZjtANKzz+1pBZRLu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G4pmIjOa; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G4pmIjOa"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-506aa68065eso41689941cf.1
        for <llvm@lists.linux.dev>; Sun, 01 Mar 2026 22:12:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772431923; cv=none;
        d=google.com; s=arc-20240605;
        b=AFzCx3KAbFay6M5Bg3HzBYBweSKXBV01Y1/+awHNqJTi/oVqsh/WYsLZItdKiNPOti
         B/kzCQUHfTX4IooP9tbrN7iybQHOzyQ5rFxH7NKoptLsGG3Oyb/kZhYmMiOVqUNfFMLW
         0VECXcgWeKjc2NB2cvb/5oAUxYHemJILuEqZJlmc0l29vWOcKy4MvxTfll0kJn8BmuFb
         YkXOr7A9t7sVFQ0AZh5UgygWxth1ofnC4Rpwx1f+Atg09zuY/4lDhU6dFa+36Aa0AjZJ
         Iqgs6p7ogRdlL+gP/omLPIAMJ69IL2OdDXgtlaLwgkuC6xVFc/tHwHHyTYM/u6XjK2mE
         WPVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ski89AnwaWBeS16R9OsWU00+Wyrl3eVXwV/RiRDK3rk=;
        fh=QMf550wN7Xh86jdgbv2axAWuEWvQGcKarRUJtE4rME8=;
        b=BtrE2YUeLj22OMkDhG7Kxqj3Z9sH25GLGbtM7KFhW+R8NEm0BZ9GT4ZRmtOXT+RkBD
         pdx1MjiNq8KBpeCUZrbEC3qut7/effDwzE1PiMpZKczlnGrvDIQcF4eRqgRwD8YKOy0p
         cA3Vd6QOTNYcs5wN9TMa0TP7v/tSTcv0PiKMalWDlbW9GNs7386Hyn1iDwDMsfeK+7Y8
         9Kf3I+IIlbwvPX4KpwETFvT7LfbXapGlfxWGh8PmkQ+YEBF+Ot2rI+LDJg//s6GS+AV+
         hBixu618FRIDTasKQ4ny1Ug5imGmyecTPyUarE/5nfIZw4E3wtl0s/kyY0XJZTaSnbyk
         NBwg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772431923; x=1773036723; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ski89AnwaWBeS16R9OsWU00+Wyrl3eVXwV/RiRDK3rk=;
        b=G4pmIjOajRkEY9jJRJcA7l43gP+pRockgjsHviH3c0WtzhnLxev5OdiCxloPoG5i7B
         comP6HalTtAGjI8uMiNpys+uMBh+3RZH3ZO2mM7cyuVpqlLIdvvJwGm5LgBT1elPUMH/
         duxv09Kq6W4iRBneWyAh5o7HN/5njPMGrSQsUuLZvVZqkkfpCkUwYR2FbSaJmJVOLSN8
         DqgRhevj2+dMD2M4cUGi4lWDua0FZI0GBbRN12jaAHwu3e7VdG8C6TpdT1Y9mvhPfrao
         Wv12vPKq51GQjFXf7YuO6NvMS5p6hYI4R1gs582RuK7cjTICk0l8kwukyFTvzTDlVnJU
         bJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772431923; x=1773036723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ski89AnwaWBeS16R9OsWU00+Wyrl3eVXwV/RiRDK3rk=;
        b=rPAUU5jljd4WC3+Je01PlhmvWA5NtVHZ7G5cin5XiC3KmEDTY5HUZ88HTbq+fCaVA/
         B38Wv0kIVDNHpGlp2t9YG7pcYrcIBpIu/01pwqBuEO42mIYFVHIO95X25JqjPhPSx3fD
         NHCVhCJG0O3AMVvJ/XAqtUNNmBPpAtzoxIBfG6nEl0K3lIsZpKX8tmyBIqEgMIBLhILo
         T9wjIdljTCeJvbtf7IpUmkflAuB695r2C6avlJCkgsu4UGlbnG9rwoAzXZqFy2H1/lnt
         eOZduqkwrmwWrVyDDatzdtGuUpr1TzNqaNLctIefNJhf0XQvcFXCrM57+YywqbiRQTA/
         aojQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/JQ3pQWyh5Qv+R1585sP7XZl92/ZOBlUmaruALHIs9TWtFFEWkrushOtdG+YM4QJLQZhx@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1s+1h3xZQqWlkthw3Ekvgcg1yNipw3NHl8pKf790XmZTxmVYL
	frkPjy5vLitb1Q2ruSsUhzUPfcDJkI6y9y8FputYcUYcLhKjozwfbznLLvyJJCAgWFulGmoOsbn
	0WDNuYSsqmot0bCgtjjAdBJWRmH8nQSDaiGVJIqPR
X-Gm-Gg: ATEYQzzs7FFZBjz7BonPD1CJ0BTjbW9x15yDG8RwUl8Z0wyTg2BbfMQ8jBr0mDsFL1J
	XHwAPfVctVL5Yk3VbhwsBCW6nA6qGFbNGU8gQ4OnPQCLc6wIv/pMRNKSzJdmeXSwY/3rB9zq6GH
	yF+jt5MppFX9USyQDeLy+OLVm0nxfK/ng0k1D5qVJTEhrG1jAnbT9cFrT4PH6hJr7YU6ijNYgx1
	g4AETHmPsIfDtGQgES7RgfYg5+jEGgmq9E1LGpOfxCD4R9P6+UyWt5ISMReApzFWcdTZ2CMbJp1
	4CVUKio=
X-Received: by 2002:ac8:7f03:0:b0:4f4:de04:2434 with SMTP id
 d75a77b69052e-50752879a78mr134210271cf.11.1772431922428; Sun, 01 Mar 2026
 22:12:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260302060247.7066-1-yuuchihsu@gmail.com>
In-Reply-To: <20260302060247.7066-1-yuuchihsu@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 2 Mar 2026 07:11:51 +0100
X-Gm-Features: AaiRm526yfhoI165ArwRJdmaMofXDk3Rnllb3dqCYKcPLy11uSawO1K2SmrpcQ0
Message-ID: <CANn89i+O5b0xfcP5GLtUopqHz2ppewK9zSr4995jsjCPM+3AFQ@mail.gmail.com>
Subject: Re: [PATCH v2] net: ipv4: fix ARM64 alignment fault in multipath hash seed
To: Yung Chih Su <yuuchihsu@gmail.com>
Cc: davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 7:03=E2=80=AFAM Yung Chih Su <yuuchihsu@gmail.com> w=
rote:
>
> `struct sysctl_fib_multipath_hash_seed` contains two u32 fields
> (user_seed and mp_seed), making it an 8-byte structure with a 4-byte
> alignment requirement.
>
> In `fib_multipath_hash_from_keys()`, the code evaluates the entire
> struct atomically via `READ_ONCE()`:
>
>     mp_seed =3D READ_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed).mp_se=
ed;
>
> While this silently works on GCC by falling back to unaligned regular
> loads which the ARM64 kernel tolerates, it causes a fatal kernel panic
> when compiled with Clang and LTO enabled.
>
> Commit e35123d83ee3 ("arm64: lto: Strengthen READ_ONCE() to acquire
> when CONFIG_LTO=3Dy") strengthens `READ_ONCE()` to use Load-Acquire
> instructions (`ldar` / `ldapr`) to prevent compiler reordering bugs
> under Clang LTO. Since the macro evaluates the full 8-byte struct,
> Clang emits a 64-bit `ldar` instruction. ARM64 architecture strictly
> requires `ldar` to be naturally aligned, thus executing it on a 4-byte
> aligned address triggers a strict Alignment Fault (FSC =3D 0x21).
>
> Fix the read side by moving the `READ_ONCE()` directly to the `u32`
> member, which emits a safe 32-bit `ldar Wn`.
>
> Furthermore, Eric Dumazet pointed out that `WRITE_ONCE()` on the entire
> struct in `proc_fib_multipath_hash_set_seed()` is also flawed. Analysis
> shows that Clang splits this 8-byte write into two separate 32-bit
> `str` instructions. While this avoids an alignment fault, it destroys
> atomicity and exposes a tear-write vulnerability. Fix this by
> explicitly splitting the write into two 32-bit `WRITE_ONCE()`
> operations.
>
> Finally, add the missing `READ_ONCE()` when reading `user_seed` in
> `proc_fib_multipath_hash_seed()` to ensure proper pairing and
> concurrency safety.
>
> Fixes: 4ee2a8cace3f ("net: ipv4: Add a sysctl to set multipath hash seed"=
)
> Suggested-by: Eric Dumazet <edumazet@google.com>

Nit: Use of Suggested-by: implies I made the original suggestion for
this patch (before the V1)
I simply gave a feedback on your V1. The idea of the patch came from you :)

So next time, do not add a "Suggested-by:", as the expected step is
that I add a Reviewed-by tag when I am happy with a new version,
if I see it in time before it is merged.

No need for a V3, this is simply a reminder for your next patches.

> Signed-off-by: Yung Chih Su <yuuchihsu@gmail.com>
> ---

Reviewed-by: Eric Dumazet <edumazet@google.com>

Thanks !
