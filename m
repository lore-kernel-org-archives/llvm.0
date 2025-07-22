Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FE81DDA32
	for <llvm@lists.linux.dev>; Tue, 22 Jul 2025 16:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753201032; cv=none; b=ik92DLGo6CoywdH2633eAGugmtmo6+OUlWCPSbvJEhBzHbp3JRn3hlJbHQU2HhWCZCxtRA348GG4ymloxlPCuYciiUFuvA30ZkpjB2EnLdTAWoIEPWETRIIKRfp3n0DEiIiA6yFukOggHezBRRz6JKU3OAC0SXDMLdx8oiqKiLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753201032; c=relaxed/simple;
	bh=FDXlr7W+/66QOFftaHFQrLT51jF+Ev61+zYZLRFU49U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GK541OjGv153m/dxMqmbLXSXJdK1SEIVupFO0K6wbPkSXpZ10JKQzLx9mFlVHVP1QDSq5vueL1fpkn1LwnCzpDgun6NwIu27v6eHI8txXOkOxEC9nHQmWxJZIB0rHBAKno2hb60g7BRklwTt/BZVk7mDEK+jLplX6aOXoNTd8M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Nd08oFx7; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Nd08oFx7"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60c51860bf5so10007414a12.1
        for <llvm@lists.linux.dev>; Tue, 22 Jul 2025 09:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1753201028; x=1753805828; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MwUpVzSwK6dKQWrESREzqGXoWD+c7JZoygfweu86bO0=;
        b=Nd08oFx72SRzH1jNxNSlMqHEZ2PVMy5dsBwwJBCxX9rZ4XogtPpM21HtP+1Y2yNwaS
         nVNrm2Yp5UceR0hn2Hsvm8rKtpJBisCV6P020+kUBYQpOHv1UhpMXPWRVBfyITnZUXHB
         ZsVsKUPA+5vABzDA5UnJRiz9b5s/KAXe0cpL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753201028; x=1753805828;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MwUpVzSwK6dKQWrESREzqGXoWD+c7JZoygfweu86bO0=;
        b=tFYSJuiuOKTJldpQQrk0/L2+XQcDuv9Z0xKLgRwbR5r4vX5+ZiIjQVyk+VLmQFiNk9
         TE86bz1Myz8ziKOU1OOasXvVCKchLCn7gmPbjiBzzwcmpgseQz7B2kEnv6cGJJ9fTGua
         1cwRoXsn58fsSMk7BtMNWFYuZOtCVbXJuLrA/1XsfvVnImdpvtqAabhcD0Wwf7AmXv9z
         p2ANG7wceL57XsIXkqnuVblbFhXLH/ovZZ/KXnT8WYKGRHPE8RsoN+j5pUVni8IUhnfw
         Tx3LLepCn37pzbiBvx89Ox5wCxlmA3L09i2YLRETT2UAp4KpFHjSSeLYzI/4sE+jW8GY
         qBNg==
X-Forwarded-Encrypted: i=1; AJvYcCVBn0F1cGQA0ib+iIWnMrs2Bn/uPk6iMiBABeqqTe78tXJa/V/DFv12tzyJptdwF+4JoH7J@lists.linux.dev
X-Gm-Message-State: AOJu0YyUou11UEOKcoYeVhGeijI0CH9GhHAQ+N+a+JnOoBbACQj+DzHA
	r71saEFOse9181+BGsSTW2VNbsMH17kNlXsN8Hy85lTaVDGRImp+EsmoRudRSDkBq5hPqQyFJbo
	Y4pm8
X-Gm-Gg: ASbGnctlmbsp/hq8XaYTu72XGxXinEVR7Ivv/scuBrgMwkW3OzNQuLmlZE9+mrbdiS4
	KmjYusW7qvLh93YmWA/n3UIZ/ukamkFj6GiANT8letvHyelrZMAUInFM7OQK1yLv7vfyoWhl/6D
	uwxmjRy6SL3YmJcbMFsaEQQpz3nWOnK0n5Mw2pG2QqxuRESes/9cOisqB2EIXH2H65n989FKPLj
	Wbf3NTmg7sxMfFwqxQvCRMkHSF8kYh+1aEE4aUCepPeNQDrE9ZrklCuQr73XQUhDp5LoIO7pGg+
	ojNh1NeMbTMgvF8FgKrH/Jo+Y4etROigdQrvfT17CNhYgDfY5vUcwy5KPwkDnrd/kLqM0wd9kaP
	xeo+4A4fspPpO1yDwa8y+uv/AZAchbDYL0BxGwM2l1vKvd7EkKTdhvJvM2v1Pu6jXUsXhkFbO
X-Google-Smtp-Source: AGHT+IHZ8nickiaPn0e+2PzjuKP7vb1+EpZiHuKSdBck6tj6imPIigRrukOGFFqnLaUihzK4V6rcIw==
X-Received: by 2002:a05:6402:520c:b0:608:a7a0:48 with SMTP id 4fb4d7f45d1cf-6128262b18dmr23635798a12.28.1753201028253;
        Tue, 22 Jul 2025 09:17:08 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c8f3392csm7188881a12.19.2025.07.22.09.17.07
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 09:17:07 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so11029233a12.3
        for <llvm@lists.linux.dev>; Tue, 22 Jul 2025 09:17:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXNWxvHzumzy0cZyei9VHP9hPLE9IEpxYoC6Qy5P6Sw78NScvG7RrD60abRvURyjitMYABT@lists.linux.dev
X-Received: by 2002:a05:6402:2111:b0:612:ce8b:8e3a with SMTP id
 4fb4d7f45d1cf-612ce8b93famr14784723a12.18.1753201026121; Tue, 22 Jul 2025
 09:17:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250722152053.343028095@kernel.org> <20250722152157.664260747@kernel.org>
In-Reply-To: <20250722152157.664260747@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 22 Jul 2025 09:16:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wihb6KVgU__zfhdHR=-Mqhp6qaAABdu31CJ2ML6MDj0dw@mail.gmail.com>
X-Gm-Features: Ac12FXzcgZHEVpW_XghiBSi-6W6yHtnaI5_N4MXF70P1OCTvgMWBy0XPnjswCTs
Message-ID: <CAHk-=wihb6KVgU__zfhdHR=-Mqhp6qaAABdu31CJ2ML6MDj0dw@mail.gmail.com>
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

On Tue, 22 Jul 2025 at 08:21, Steven Rostedt <rostedt@kernel.org> wrote:
>
> Add a verifier that injects a pointer to the tracepoint structure in the
> functions that are used and added to a section called __tracepoint_check.
> Then on boot up, iterate over this section and for every tracepoint
> descriptor that is pointed to, update its ".funcs" field to (void *)1, as
> the .funcs field is only set when a tracepoint is registered. At this
> time, no tracepoints should be registered.

Why?

Doing this at runtime seems completely bass-ackwards.

If you want to do this verification, why don't you do it at build-time?

            Linus
