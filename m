Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BEF257845
	for <llvm@lists.linux.dev>; Thu,  5 Feb 2026 20:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770322545; cv=pass; b=iMj1oN9TdCjeBMftQjyrMmeBxKOyGTTPF7xXqM1gQ9DFDv8VFimv5KCnBNpHPZnksvCQ6TuFNi1dvpHqwFHvJi+JP3va8W6vpBvMnpbKj7wwg9cHpdoWvdiAX/xJ/Z8q5TorKD5GGdyk1O4wemWxuf4Nw5Ggfr/tMRcyclxXXKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770322545; c=relaxed/simple;
	bh=cvmMOG/Nbs2y01Em99NJUpodsaB5RsOB6Nm2Q6MYBKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QYbfKDbHr/SDQO10UuiIzG+KSrmbpfSFrHrSiIAg/Fcm1+BKtE6TXFk07/vCWNMPmrIggo6DrAW5ZQcOuomFb6u5VCizO99yC7y1jG7kH7rbrkceAuGpYsAlHZgVia2i2HCqOD4S6T0wi321cmFDLNWsDi9RFXJ8tg3zQNLOpNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=frB9YrWv; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frB9YrWv"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b7063004daso89718eec.0
        for <llvm@lists.linux.dev>; Thu, 05 Feb 2026 12:15:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770322544; cv=none;
        d=google.com; s=arc-20240605;
        b=St6OCDtbXxmZZVKnxnfIR9Ms4moOIkc3lxgArts6f8UofA5iBvOnQKu2ZN8bH9lCdN
         5zrxGkSPIHf4Sxs9tpNEtYncssaGyqcbahlL+viRSdhxbtvt/iXaNb0qwhLZR0ye0qLp
         k5FMycQY9OEoZThEPge6/zqxr7ZPRal4ish9KSqpd2tcacFFck2WcXZWejM/nzShMfWB
         KCOVdSafha4S27oyX+GYjKGNA7SReqLSol5yUvu9PhTgW8pkSs44GYBy2coCkzdaekJq
         Bd6EIYZYWrLi99zr1ROId67tKPpScJ4N1FZgDx4OhiVo1s4vexm75U09bXiXPwTzuvyK
         dXiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cvmMOG/Nbs2y01Em99NJUpodsaB5RsOB6Nm2Q6MYBKw=;
        fh=lLnYjbQenGN0w99E/5SCIrl2DWZaaBXDaUYLAZ5VBUc=;
        b=lIftcDJ3sPLRYeN7vln8wj2quYqd7ulRGwHZpP/mfachoYl+xrX0gAOnV1IDIzHSG6
         R4eOLMEvaJFq6zz2iHT1mettIuM/lklN66aiuUougNLHzcJ7K8T2NbRoMMJHfH0P5MgS
         IRbp3iipdP4S9M+SdRpCem1z5drvooyMJWYzE0G2TSQ09i27Vxf420u5Zlhq7grw1bqO
         vD8kU8h7cKHEKN4pwx5Fj6YcHE0+mxNpJtnFxMAHyB/pmwfh+C7cEWaAjPcQHw2XE5lw
         xu3v1r9i1G07dmpb6JVF/2glrWqo8vy1KoRfOnA0LpX1sHhvwZsA4VO0aRKbuUCIYSoA
         qbcA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770322544; x=1770927344; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvmMOG/Nbs2y01Em99NJUpodsaB5RsOB6Nm2Q6MYBKw=;
        b=frB9YrWvJh5Bnhl6sDpah/DF+TGSV2s/+s6rgDICLu9kjKLkLDh0DvQtxwfJFVMood
         tsG64FisOppukQHRuaG4LbDkutn7Lg1Xuk+MIKu2Lsu3RCZ7vyR32by9r461bc7LKaz8
         1O4+onmGPOkZCiaRMKYiW51NnaBZcE0fUEvweKtLYHt5Kxh0+Awyl7dPw4dItCrBSduo
         El5sbx5E9uvQxhLrqJI7RlC4J5sfyOyodg/hJo9hkPzFLQdTruRYwLucyHRewoN1FI/P
         6zRLlkiMzics/QcpiojkkOcIFeepFjB+dqR3ewKYKRludYG1ZJXMd4yh2cohdzUuOpAo
         F2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770322544; x=1770927344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cvmMOG/Nbs2y01Em99NJUpodsaB5RsOB6Nm2Q6MYBKw=;
        b=YDfx0PT1WBhbvv608pnDXFLddOjDyR2p/5OL0MKmcQqH6AM8pf9gIaakr/7pQ7v+mB
         gsi8+nH7MzJJ0XXetoDk1ghuM9SshtLhUOOvMaEtvtSVlKg5PhO85E1t3NfJ1rgomnNv
         PJz9Z1A+PMCRhhrJQf7OFeXczoDOfYmsz8879a6jMavcON96ex7FdIB8L53Lq1vEiSmN
         fO4K8mJk8J4FexiL62tNAtta25YS0GMkHDAPyRD0NWtZjhWFG/gTiaGsc/Y29VmycVgj
         vGZ5xQxDsqJvt/pe8sFBm5RdX+iWpSWvsk5JMClDyfKT7xxuMHiwpGulXzFYpXz5/Z91
         gr3A==
X-Forwarded-Encrypted: i=1; AJvYcCVSkWknUvlPvB//FU4KFCfSApLx0s5/pZsxnegUvX15QPlgDOz6n/+w8kUEScWAKQDkdISe@lists.linux.dev
X-Gm-Message-State: AOJu0YzCkViKsbcXhsCUffZS/SCsCev4SL1wnN0hcWqeEOa+fqO9LwFc
	NUQueMQ9X/EtHdPy5ZHRE8CiIsgGRxXu0Z3/lkZNFy5N0yTUKf/l6QSaLoFQRwLGfKNNuwzWz1r
	YaD0gcELrHBV6vU9T7j72dz3QeCdFV0k=
X-Gm-Gg: AZuq6aKBurWRvI7yspXlCazxYNpsSPEqOMcnkYoJRi/BZICAd7/mTewjs+H0NO53lCG
	0A5q1aOWKPCR1ZcwI5Pxs/vaO2jIasGYsn64qi1L7LygcKHCzf3PxPa8AI+fy2wHKSu0YYYilkI
	MZ/DyVzP3cZPITEQrZSMebQcpIkg0MKXF2UbROZ6aycYwwXx9xeIvSiGc3d1BsUZCLG55KhWycZ
	DX4LBHuKM8DLjMU97uww13y8gCtKH6qAAC22clQIEWjE2wp6kHtLnadFER5OSA8zGJ3VHYFuFZ+
	dDlYq5fQBwmT358aipujmfuhfPo/4aFrNBAMnxLgJOlgq6siffLZ+xuc7pLKytNJc3T0D0ZTH72
	76r51rpnAyOUSP7Hbvw3n+80=
X-Received: by 2002:a05:7301:290a:b0:2b7:1008:9f2e with SMTP id
 5a478bee46e88-2b8565170b8mr67598eec.7.1770322544408; Thu, 05 Feb 2026
 12:15:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260204210125.613350-1-mkchauras@gmail.com> <20260204210125.613350-4-mkchauras@gmail.com>
 <aYSgjPD5KRcNN0j4@luna> <1ed12a72-06e4-461b-907e-2581e25e3e38@linux.ibm.com>
 <aYS2oWCE0ZCC3don@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72mi-V_SF+JErMJu1wZEd27HPHqhsxE8dELtd5e3ZEaA4w@mail.gmail.com> <20260205200222.GA1298159@ax162>
In-Reply-To: <20260205200222.GA1298159@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Feb 2026 21:15:32 +0100
X-Gm-Features: AZwV_QgYb-zr50IKZRngiPF2__DedHoXx9O8lOBxwz2l3ih7SO-AZRhJAl3SJvE
Message-ID: <CANiq72mqVNGJSFAm2UhjXRV=5cWQ1Z4xN2aVeYQ5Tn-veym3+g@mail.gmail.com>
Subject: Re: [PATCH V2 3/3] powerpc: Enable Rust for ppc64le
To: Nathan Chancellor <nathan@kernel.org>
Cc: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, Jubilee Young <workingjubilee@gmail.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Link Mauve <linkmauve@linkmauve.fr>, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 9:02=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> Thanks for the CC, I had not seen that issue. LLVM 22 is currently in
> the -rc phase and I see that the fix has been merged into the
> release/22.x branch as of yesterday so it should be in LLVM 21.1.0-rc3
> when it get released on February 10. LLVM 21.1.8 was the last release of
> the 21.x series (hard to keep up with all the numbers...) and it sounds
> like this is only a regression from the LLVM 22 development cycle.

Yeah, sorry, mixed up 21.1.9 with the potential 22.1.9 in summer this year,=
 bah!

Fixed my comment in the issue to avoid confusion.

Thanks!

Cheers,
Miguel
