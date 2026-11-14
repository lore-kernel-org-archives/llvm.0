Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794676291;
	b=n02Rsh7u02Y9m2vbgP2iELRM71rWv7XbWawS5jFcC+BIRGRFC4ZgcVyMMnOrMpTdjU0E
	 XQKG8zEaITzfSgHlecRWYBvK4EG3+aO+XoLVnYW6C4OUZR/TAYSzCttq6jsp7zQfmqxzS
	 uhg8Ca9LWbHZ0dYfQEGEl4AsQ3LRQISPpIeyjxYVHW4IzcqM2G068qPbRxBBqZ2613HRS
	 JlJ7N06ttP3MH28euvjIBeJhbJRq3S6SIvVDw7ozQ5MejFPcatjFqXiAE8qZ8cI+zaxKo
	 dFzTXJfsen3a37nAHjzcvfKviucAQzw3lKQ2yqbeTfmPLdZ5PNMrAHnxZ49Qhr0//OA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794676291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VSOfGERFH4pEDKWamyJaLP62gyGxpA0Ka4pqh6Z9BNk=;
	b=NltG2fuIT7cmbua+ZaIuXBW6hAiLxIYwnheI+LCYpcRVsgA+n05hPrHaVuzu8BAS33II
	 U8TbMEE9yypMec7cwP7nIAyG2Wb7JvMG0743ao9HWoSbQGzMDEsUJzX3rEw1CGGkdxyfX
	 /855VID25qQoDbg4fYnhCkGJMkd8kYs7BOMy6tr3aD9QW06S8ukMUDX/u0Faa/u7mSvpX
	 CMVQ86HJRvW9uAyz05/cvCi35nVQhiZVX41u8Lagp5jFMGUOnX8FJTcyesdpXuBeJ5BDc
	 pj8+e84WNXRlmEhElLq87GNKPmIvf6oOBErTARYhMyC020pOchv1jChI1x4NpdS2RQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ydiZVToZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70691606A329
	for <llvm@lists.linux.dev>; Sat, 14 Nov 2026 17:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70691606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ydiZVToZ
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67bf3c6654fso2119119d50.1
        for <llvm@lists.linux.dev>; Sat, 14 Nov 2026 09:11:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794676290; cv=none;
        d=google.com; s=arc-20260327;
        b=p7/NLBbPwc/PQysSZDUmpwd7aCoC+297gxRvLFVxdt1Sh1AzwD9W6f/0sBaEyE5BYF
         usmBFY6GOeCscEl2exCxhm4BN21xJvTxyTUzMGlCi96nsAfGncX2GPvwaIjnUwmXPK/x
         a23//q0PaFfHisHXCwi7OmESRE2ut/PjLuaxiYvoDa+yMv1tmyDU0gLeLBW5TcZQQJYh
         KmPAjhYq7wXFChQNDY6jyB9OyaepLTV4Rn2mcDOY4fFxwsEq+mi+XY3wfoDrgtDkStgj
         uy46OUm5QPbZpYiiZpjnc/bV9lxeueHlyKaUukhCxhtZppYXyrz8a9vtmLD+TILcqIqI
         zcgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VSOfGERFH4pEDKWamyJaLP62gyGxpA0Ka4pqh6Z9BNk=;
        fh=F5booKSVN5SMvnnqQV+1bwlWUU4KSIMzTaexjcDT3sI=;
        b=J+FWNG4ARRcEv1JrGe7q2dlHDPC37D7xa9tpkKsrrYxEHfnZSZfFlyJLo5axVRRzMb
         Z+gxbWymGTBaHUmYcZZL8ZjroApxF+MiGnqhhKAVx++tZKwrjDKOLswfIONrKjXl1RrO
         zy0dQd+oTx1LEPIQShoUVlT1/+dv32VdmorJ/NHx5WE/0dsLIenpIkAKmvO83sPWdMKV
         QpA1WEGY/K6jNvRDjI28fxv5uZeMfMCQXz98/n5g82Uya0e/sb7q2FZIIWPbFqlo9moL
         nCpBIcfmWrQAf+v46hwnHT6QZXMCeqx48DCdpKsj7M1Ae9RXRqR4jVDbrwOxWTzgOOIZ
         2IJA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794676290; x=1795281090; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VSOfGERFH4pEDKWamyJaLP62gyGxpA0Ka4pqh6Z9BNk=;
        b=ydiZVToZ4xUf7GGhA1Ovw7st/Gt2G8lPSXpLWFImf1MoLtmOz9xQ37XZ7t5/iaEQwH
         r5e1bB/tusrnR0GE+wWyMyLSTqO6psbbamTflyglvjIVEie7sDQ8mVCix6QvbT7hJ1VW
         5eDQtfUvRAr4MqalhmRw2sS8VFPuskwcFfN4AfMaJelJc1BPc+S8r71xEPqp/09UEKoa
         IFdKIdG59dA5gbtVIxCok20+zKnA80OfBlcgjpJJxXYiy6Ik/AeBGIquIEPGOX+8AHq6
         wJnUHciSBnuUgjDzZRjh4C5msvksNrB3n70YlOwmUUAo0xuJbxsU8xLcpnCh2zKMe6SI
         pIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794676290; x=1795281090;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSOfGERFH4pEDKWamyJaLP62gyGxpA0Ka4pqh6Z9BNk=;
        b=bPexiTZt9M8Fbq+IPJACpCk2k5U5ujILE5WpcH76AbO72K4Zaxnou27lA8dC5U8vRj
         RNsfLjuRcEjNnWJA8BRs/w5zVY37+1A0mVa9DGlEtlH37kyS8KBJ4KJf1XU7Lj4Q3ohR
         LDKxIpI+81Tr3wZm14WI89On9wUbREWDcHK/GXVYFWm/Rx6oNXsvVremxt1DAs5QHqtN
         ZEhbO+es9pTlZW/RBUir17YmdppVI4Hb+m0zYtRMUWIlc+RNkw9o8NS7nRYNTjyTYoLd
         SF6oNjRlpyEKF0rs5iT4LpWUfIf8XGWgfIS1CiOJENZA3obsM7lEp2G6qRl4bWSheCt+
         0rvw==
X-Forwarded-Encrypted: i=1; AL+hErEYc8xmzixyb5zOp6KGcbhRAvvbgxkC4EF4Td0qRFDLie6Gm4iEdg3bihBSjafReEnj1mKc@lists.linux.dev
X-Gm-Message-State: APuU4Z8hPYliiIlO8NEbaAwk3Fot/dVbpRc0KblvgXfBTwTysaV/iAsD
	9etGb6VBRk6GPm5MJmyhtXjR0YGt4m8ywufb2MdQY6mATl3FDsLHLZvPHlO7BjN94uIXS6o7W4i
	eBhgxAjtSAepgg19rkgqvrCR1ws/st3NtWVLU
X-Gm-Gg: AYBFou3UB8OanXYF9hcAiycnhCYAiBNuo6b6uJBm28XGnZGCyyYLLi3MwrdoiDToEpi
	Opfilut1wm0zBALmBFpD1fJE6Coiy6PqGvQBWjrHWJ29YJSvyTvQT/QfQ2Oy6u9oKqR8RjyP8e+
	YDSPJ28G+8aS8FqMbbANpokX2czym4bC0/QmbacUUB8emTc9k048GNo6lP207URjsi4SHgzxaxK
	5fUqIq7IjDqk+CXcYLCKLHn1jKfuZTRXGm4KUz4P4rWNyHK2S6HpDUxMxfkD8VaCOHoz/CnDJg4
	iYOBLZrZ2g00EYkDFNICrHFpRS7Gq+xBO+IYE4obZAdJ2GMIAv2L5uMGVDhpI5Gexw8xGwq1aEj
	Xn9aP0g8U6GceePQnvnxVfJ4XKwXhREgSbk34Lu8=
X-Received: by 2002:a05:690e:4845:b0:674:981:a937 with SMTP id
 956f58d0204a3-67d8972f1eamr2440317d50.121.1794676290257; Sat, 14 Nov 2026
 09:11:30 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104133158.3187525-1-luolongjuna@gmail.com>
 <avZ9Ku61M8z-2axF@jpoimboe> <CAKL4jwXA4OBVLFGAP4DWw6i9d5bneU=Ur=D58FnrssOt7ygm6A@mail.gmail.com>
 <avdWz3m2YJnlGgnS@jpoimboe>
In-Reply-To: <avdWz3m2YJnlGgnS@jpoimboe>
From: Longjun Luo <luolongjuna@gmail.com>
Date: Sun, 15 Nov 2026 01:11:19 +0800
X-Gm-Features: AclHuK8SkhxY4RW-7U4DuqAnwzbj1NmDVqMiHao8193oK5xeW2NzqHxvET-tpi0
Message-ID: <CAKL4jwXicjF4xJR0HSK7X49gUqp3df1_sGF9KBmeTKGeE_uwVw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/11] objtool/klp: DWARF-based cross-build symbol correlation
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: peterz@infradead.org, mbenes@suse.cz, pmladek@suse.com, 
	joe.lawrence@redhat.com, song@kernel.org, puranjay@kernel.org, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, live-patching@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Thanks, that makes sense, but for upstreaming I think we will need to
> take a more iterative approach, even if it ends up causing some
> intermediate patches to be obsoleted by later ones.

Agreed. I actually got into livepatch through kpatch =E2=80=94 I guess I go=
t a
bit nervous and wrote the RFCs like papers.

I'll follow up case by case within the current design. For cases
klp-build leaves unsupported for now, I think documenting the limits
would help patch authors and AI tools know what to check.

The two RFCs can stay as background on another approach, for
cross-checking and future discussion.

Longjun
