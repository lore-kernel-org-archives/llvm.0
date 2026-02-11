Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E5227EC80
	for <llvm@lists.linux.dev>; Wed, 11 Feb 2026 23:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770854043; cv=pass; b=ZQxnFFPu/3WECYONLmWRMMLGVYrzij5642CnJ2ePcArTjnk2GLnporea7rQnm5EnXWngHiR8lBWarTWBa8XakRTXKTeDsrSolN5vDgzNU3Exee43sSgEjIbCYOD9hwibfjz+MA7r8llxAOaSnF2LGdgsMdUztGkFn0QvEnjTW48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770854043; c=relaxed/simple;
	bh=J/FKSXgdTvwF3Mk4PfyGW87eNIUmTUcaLaXLBljBIO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BcMmVHY5CHtV8n72ito2AZwCrPQ/E3k3coKdclol0Wl77jfyG+zgZ3PN4LAz/WiH6U889sUZjO9kgWe2eqpDlZJ3HgfhvEh+TXifWjAKNaSAoFcUGmE+bsDian0NZ7KJY/PfXj0P+oekWIkF6LX8VfIDd0sQXitD+Pi+xmCxJQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IEryg5KB; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IEryg5KB"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12721cd256bso4635459c88.1
        for <llvm@lists.linux.dev>; Wed, 11 Feb 2026 15:54:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770854041; cv=none;
        d=google.com; s=arc-20240605;
        b=DhHk+J6OEe8BaGktawB36fX3O48ZqFkNrMzNfIAw8ORPWY4xnrmjCpsDx+BEBKIqY9
         /o1hHvcqm55iVCD2gcENgvNLaL6jTX4I08DU1uBp51cmtAqc8nqkdzn1/zzFUpgc7yUY
         FNXRaKow14/d5a/rFCUDRAMhXnHwOz2VVoJRvq6GAb0gSM0jVJUIRSQngJhVM2zLJ+Zo
         7tJmYa91OwgVhTw797odMAn7EeJsMwW0ec6LDp2Ac/w3mICWZnFZC402XJevVZQQ2Z8v
         HCBgZ6feooHRULGRtqBuJAfcNbzxBgW5Gv2MxC4l7E0Lm44hHvFLBLBJadTKEViKYkH5
         kPZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UOtTKih5dOF+zhhB6RP6sszl4bsgNkcAo98jzz9AJoQ=;
        fh=t0jwKqpsWV+up4V1brachekD5c7WuNyBTFnAScYV3YE=;
        b=VbSRrh/yxOZnfxtRb9/QHA8Qzak9BkhXFQXPn7lMobNFI1n6MVtu+vmnCzfzoTaokb
         zROXtcpW55dGGc8wJ6aYufaTvAy8uZ0jwMMSuOOXehEFEaQUOdjRHQ2pUhXmg9DC17hp
         D6RWdlZgDtlr+tFuXXj/zHvBNZVauZzzanWGQmObnTTlCDjpdrvIWG8g0woDuv1cWl6s
         vMjoAB1n57U9QZpJtVJ3BhTqtW2VsqBZrXB5EGMW9mE58n9xWba5tbWc7i+Ik7TiiPfZ
         kocc8Ug909BrYFU4BeRplFb54GurT/UL2gu1dDKh92CNFZ1UN5fiYnM51iWidKScicbg
         YTnQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770854041; x=1771458841; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UOtTKih5dOF+zhhB6RP6sszl4bsgNkcAo98jzz9AJoQ=;
        b=IEryg5KBNF7KjQgByVk0PkNtHecAAwMR0ZRlcA5rKHeLa+bPAANoQ8tyhC/0aL+gkc
         wTsF5NPfdp5txWCIOMv+CYQ7H27RiJyb7/bVDUKKtL1b4zxYKxsGrUTqfLLMGaTERkzU
         TNHRqV+q9Qy2HYyW7Q9Fjso8sRWuNmwZ1erb45vHjRdgq3NQSy0IA5ADfx+tULok4+Uj
         aLaUqr/UEIej6TikFS0xLU95gA7M2lK9Fh/WcDcaEdxFR/AlEGVmIkXD3iLIfN7MKeJL
         /1h4r9K3PUMxG1wRfv8gcj355GaC6eMZMwV5S79kFmIYB8Yv/v5gUMry0Jsji6TzPUVt
         k2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770854041; x=1771458841;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOtTKih5dOF+zhhB6RP6sszl4bsgNkcAo98jzz9AJoQ=;
        b=boKi/sP3cZQdDMmjs9cKV6C7WOmz/OGVuEo+plgL8t+DDSRifxeeqLHDNLYzj5KnY9
         3hxN5ltek4hLIZgfcJm67Vz9uJ8ZL2Ajp96TPaod2dvkH8EgYftsW8tP5mnZj/rZUnuH
         JWY3lseOF/EhGWjhmzopOTNDMhIPgBWmSYEiUruvNssG7aP7U5yhTKBfM7RroJQoQzC5
         9nCwaYGfUikwifC8x+O2e0YroBvLoNrn29hmJAwEB3xyHVTQCVfO/r2KCw5WTs0a55n8
         LGpb6vw3QijM4bEQH0Veh4jQJcYR2PQHDoz00r91bJ+GMsvDWrEj5hSQ2swdYhGVGItr
         OItA==
X-Gm-Message-State: AOJu0YwQgjWUeracm53gES1CNReJvniw2Tn3Xf1CI5ExYbTXRiucZ0kA
	iyrzzdycWx7FO1tW34MHSSq6mVTJ4bx9/OP1TPqbpMh5WXouFVsN6cZAqsjQxQJFA2guDjIgEJ8
	qTqLRDJeuEGf1IjLBj152PIA16hx7xfxW3FvRWuKi
X-Gm-Gg: AZuq6aJQ+tjoGJiGvJ+n9r8j83BtNTu6BDSkG58LTYBk2720+2M0lUuIMdBwQ8vfYEO
	XFQXoD8fIdXkt5y5vhEc+xCF9svAiSS6YAOL+/W8lgf2j3SaZeem7E2En64emyMlAlxFsVkt1wt
	HxtV+Kc1HZOIXimvX3VnM33Ntlh7lqe1QUXfD+7JkvOoIadE+mJcyri/fogwhg43+VM/gyOqCgH
	maVYUNLM+ry7SD1GRcBBIRf5wZV77LoeMUPyx8uUWbjmufzadlaa7/EXYWRYYzyEFhR8zTO/+AR
	V2p7tiZSCf07iIbBlC5+04jBhPKiIyHHiZ71rFA=
X-Received: by 2002:a05:7022:e09:b0:124:11af:7b42 with SMTP id
 a92af1059eb24-1272f7a1744mr428846c88.33.1770854040367; Wed, 11 Feb 2026
 15:54:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aYhfK3tB0X6Y_GyV@gmail.com> <177076109527.3702729.10282954256881857059.pr-tracker-bot@kernel.org>
 <CANpmjNODYHBpS_Xn_bbGwQfdEtkgFq_gpdT3S+_31bfgOPoeUg@mail.gmail.com> <20260211194020.GA3482274@ax162>
In-Reply-To: <20260211194020.GA3482274@ax162>
From: Marco Elver <elver@google.com>
Date: Thu, 12 Feb 2026 00:53:24 +0100
X-Gm-Features: AZwV_Qg_oPIo9gs5qD8C18MPUPwfp7gw-0_wul8_Fdvew-ZTSuIM0zxCMV3UOjI
Message-ID: <CANpmjNNB_KDBXeEi6MYsPwVcDnid-8oQJvGcc6HwbOLqNBpE1Q@mail.gmail.com>
Subject: Re: Clang/LLVM 'main' regression testing and -Wthread-safety
To: Nathan Chancellor <nathan@kernel.org>
Cc: clang-built-linux <llvm@lists.linux.dev>, Peter Zijlstra <peterz@infradead.org>, 
	Bart Van Assche <bvanassche@acm.org>, Aaron Ballman <aaron@aaronballman.com>, 
	"Jose E. Marchesi" <jemarch@gnu.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Feb 2026 at 20:40, Nathan Chancellor <nathan@kernel.org> wrote:
[...]
> Yes, it is (at the repository that Miguel pointed out):
>
>   https://github.com/ClangBuiltLinux/continuous-integration2/actions/workflows/mainline-clang-23.yml
>
> You can see our full matrix on the ClangBuiltLinux homepage:
>
>   https://ClangBuiltLinux.github.io

Thanks, that's what I was looking for.

> We rely on apt.llvm.org for the nightly builds, which are normally
> updated every few days but it was down for a little over a month because
> of the 22 to 23 transition (if I understand correctly). I actually need
> to chase that transition in TuxMake.
>
> I also have a testing framework I use for local validation of LLVM main,
> so I should be able to flag issues fairly quickly:
>
>   https://github.com/nathanchance/llvm-kernel-testing
[..]
> For what it's worth, I have a decent amount of local computing resources
> so if you ever want a pull request explicitly tested, ping me on it and
> I am happy to put it through my tests, which should flag any major
> problems because the context analysis warnings are default on in
> Kconfig.

Thanks. I'd have said try
https://github.com/llvm/llvm-project/pull/178952, but I think we don't
have enough CONTEXT_ANALYSIS:=y coverage yet to find anything (I
tested it). Bart found some unrelated crashes, but those have been
fixed I think. So yeah, while that's helpful, if 'main' crashes for
other reasons, it's hard to pinpoint what's wrong.

> > I recall there was a CI system that did this, but lost track of what's
> > the latest.
>
> Aside from our CI and Intel's, I know Linaro's toolchain group has some
> testing of LLVM main that seems to be fairly up to date:
>
>   https://lore.kernel.org/llvm/?q=f%3Aci_notify%40linaro.org

Glad to see. I hope that if there are breakages, those are bisected
and reported to LLVM PRs that introduced the issues?

But in general, I agree that getting some amount of Linux kernel
testing as part of LLVM CI would be helpful to catch regressions in
time and avoid the indirection.

Thanks,
-- Marco
