Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0FD27FD68
	for <llvm@lists.linux.dev>; Tue, 22 Jul 2025 18:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753207961; cv=none; b=riHRzDcz2BQaOMaeSVmQBo8jyNRX6ERCpYq4llV20LAywytqsvEaQ5d52KrdW0vLtFoxm2XZpVkK4iLBYcZ+EdE3dTkGBjyg5eyrMp75pLbghNxdQFen3yx8Mk+OOFNUXN0o/0WnoyaOewBulzApHTK1ebG/5myXDslM9uFR4Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753207961; c=relaxed/simple;
	bh=67Pku3+c2NeuyySmqR1lN0RI6V6rpW8eqkqkN9fw/q0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tb4E2OvHJYXvY9yMgrG8+oTB9ADrdkvN5MeNWVjVCvhg+YsuX8FIK1DG0mAMX8wO6rkHc8NspRzwHDKVWM+w9h70OzltSJ8u3Mvs6h8aYPhEl7HmEVoL+hDVuqRV5Ozu8OONJ9UqavV6ysBEBQVwP9gVLfWErt95WB0pOTXxA2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Ov3Uc7uX; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Ov3Uc7uX"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so9522739a12.3
        for <llvm@lists.linux.dev>; Tue, 22 Jul 2025 11:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1753207957; x=1753812757; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VBGZFJ3kbjo9dI0n0oCeE0hpcWFl6M0zU4XdxWUvP+U=;
        b=Ov3Uc7uXMuoPydYr33kvAjr0CrBQ1QLcQrhgFTMU6d0FPfZqzC/oBpNKKPTTxWSGzO
         i7uL3E1d4tzD4PZy4enrCGEssaUqPxwootigb00C0mMpWO54ud+jRoZMQez0qFNC7Ft4
         axB4dJpFPQtkA1DDgK8DM6nKHluED6dmO9Zhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753207957; x=1753812757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VBGZFJ3kbjo9dI0n0oCeE0hpcWFl6M0zU4XdxWUvP+U=;
        b=H1ZX9Geib5NBtb6vxcQnc97U6wgoQoCUD578m7VHCToUftk2qrAZD3E/7eZ5Sk9E8b
         Sh66ZV7ZPYf0+UfG8Q/z4UHPRP8tBvgkOrel4QJ+eX0EZFUgkPweXKAsei9i6v1dZUuE
         /QHqPRYahTOvgHNbU7NcprAedKGrzfym1mrWG8we/otpoOvYvlhO4GWy3tvngF+6caqg
         EHN7z59+YYLVLERK/RBHrAFoWiIca5J/cAxI46XrSqCKqBW3h2iiEeMG8C0YOVAxSSbZ
         pz/tnN1Tnum4ctBx+uu0YGjFWLKzr/ewOcaK+HskPumMaxFNlZifBK53tm1b1sGmhYGC
         Lz0A==
X-Forwarded-Encrypted: i=1; AJvYcCWaH1KpD3rT0T+1lgnLOAFPSi15MQSg1yo5YuO2WKcdseb0SqVvOV8fTsIGekFxXd0YuwwP@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0hDvGEBCdMLNh59+9vhWVJpfB86rmyjSaNsIaADz4vFpIzjaY
	/3wHkUNR3kB2Wa/hJsSBFd0iAf/Wv/a09NMjY+atYUoHwxbpp+FdfIczgdP2+n9GT9C6gI3s1uG
	TptCKN10=
X-Gm-Gg: ASbGncsXI4sKe4PRbFyA7LbFnIgBQ1hiLYL3hC7tXUqVb2/TwBgVBpAWcQDex7qlFHa
	72A7EZCwQGogA2QVhPS5lP80XjROzaPFtOCpznDypJ94BfSfNPq+hn+ftKOIcNyii0BUxQSBAsr
	STSunoV0VFu+w44nkLb2Xf34J4kupOg0dqLBb439O57OhNA7+9JwYLC+jZWpJC/bvDsluD3y7D6
	rLD0daTX3Gclv5Bj3QZBZ4MlGw8OEhBZZi8G9c8vDdepZdR0V1eH/sR9mlWIOS+DY6Yiejy8ZJH
	eOvXgHEoFOsb4imKZEVnRGUwnfTT/dKuzth5UeYJPWqukq9lB0iTHXF46RRgXmJajOvKNUaNKEL
	3m4XAlSQ2LL3OjU6hVLi4vnr9tlsjhG9ZQ6PTLJLZH2n9hh9cHEUngo0FTD0+EhzGXxtEbHpk
X-Google-Smtp-Source: AGHT+IGMouk9vC31FxHeHNRL60aKOsbw54GZa9VvVqn74EuehAz+1KGmdsH9VhXKXEdf3ZjJbkTxGg==
X-Received: by 2002:a17:906:fd84:b0:ae0:d1f3:f7f4 with SMTP id a640c23a62f3a-ae9cdde7478mr2150069166b.13.1753207956994;
        Tue, 22 Jul 2025 11:12:36 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af0dffac00fsm278579166b.100.2025.07.22.11.12.34
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 11:12:35 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-612a338aed8so8846960a12.1
        for <llvm@lists.linux.dev>; Tue, 22 Jul 2025 11:12:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVdTmlnTC4BV6++5XTy+C1dYSQCo1GjIsVJvuoJDLdSyhFGyISbkBz5nN84p5x4lifoP9WA@lists.linux.dev
X-Received: by 2002:a17:906:ef09:b0:ae0:e123:605f with SMTP id
 a640c23a62f3a-ae9ce0a4611mr2382909766b.39.1753207954651; Tue, 22 Jul 2025
 11:12:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250722152053.343028095@kernel.org> <20250722152157.664260747@kernel.org>
 <CAHk-=wihb6KVgU__zfhdHR=-Mqhp6qaAABdu31CJ2ML6MDj0dw@mail.gmail.com> <20250722130429.7418520b@batman.local.home>
In-Reply-To: <20250722130429.7418520b@batman.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 22 Jul 2025 11:12:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=whgSradO-F6XGH+fRRoO3wwzWjZ_m7Z+m2aTVPxwPrsog@mail.gmail.com>
X-Gm-Features: Ac12FXw8Msp8bQOIa9FS5M3JcUkZEknhZa0tiohcg9UvPiSIpJJwczeZXsjNy8o
Message-ID: <CAHk-=whgSradO-F6XGH+fRRoO3wwzWjZ_m7Z+m2aTVPxwPrsog@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] tracepoints: Add verifier that makes sure all
 defined tracepoints are used
To: Steven Rostedt <rostedt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Jul 2025 at 10:04, Steven Rostedt <rostedt@kernel.org> wrote:
>
> I kept this to verify that the build time worked too, as the runtime
> check is so much simpler and easier to implement.

Honestly, do it for your 8own private verification.

Don't sent out the patch and expect anybody else to care.

The static verification may make sense. Adding code to the kernel just
to then do runtime verification does NOT.

This is not a "criticcal correctness" issue. This is a "help make
people not waste memory pointlessly by having tracepoints that aren't
used"

There is *NO* reason to add kernel code for this. Zero. Nada. None.

               Linus
