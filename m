Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB896183BBA
	for <llvm@lists.linux.dev>; Mon, 25 Mar 2024 09:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711359724; cv=none; b=rjXDxFjbATFriNEJ8phf1NM5AHki7QgOQLZkcJERApppEGav6Eb/jf3eqMbfl1M+BiJtLbg0nJvQiKOb8ohny3zvcTFY2bnALl4ie7YszUuetjgRW2xt62eS2lNUgtIhjvbcnJa7qsz+fwRpiC6Fyzm4YRQQo/o58/7IF523ZwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711359724; c=relaxed/simple;
	bh=mgmBjav3rZynbJ1mYiMRayuXnORVSBOK5ibhz91RhOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u1GSwbv5ldEfdNX9QOqoobDpb57i787URHvD1yMzg8DXVaOso/HXvvGZhuWP8r08q5GGSfSCGvIaYgJnP4I0DUGl9v7eqgDjFmXJEdTrhtHjbEYIathMFR/Qph8sH6Fcxlik1egbY8TigzY4yKyMvQFBuqZZ1a7uttMo3yEr93o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mdb8dOCP; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mdb8dOCP"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-4d8804a553dso395087e0c.1
        for <llvm@lists.linux.dev>; Mon, 25 Mar 2024 02:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711359721; x=1711964521; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H3DoSiXc8Yp8uuBDk6EiaF3on1eVJFgP2CMpJotYW4U=;
        b=mdb8dOCPIpxRaC/LpC+e8BCvCkgY/6sU5s4dU16UsmPWVsVptWoJAxpkpK2RKwq1X1
         yKlf02NihATgDeyjg1vsJsI2yU4sd4NO+NRThsjFxB5dNu3elG3GXEv1zKtFTlw4uz+v
         sY+GEbFJVpW/YE2k2PI5SfHpGbJ2Rj6BZE2jX+D6HPuNFSpmUHKFd4NaqHSif7aT1uru
         TRjBmKozZUhedvbrWp/JdJqp0ovnUc6HeTedWoUA8k40za82f267GURfCswWL9/HxHhk
         JTM2gVCqID6CRhslPtmxVDZk70DlEN5glg6w+fzMWbHUVyw+yooRpUpjQzO8dOdlXzpt
         miIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711359721; x=1711964521;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3DoSiXc8Yp8uuBDk6EiaF3on1eVJFgP2CMpJotYW4U=;
        b=TTklFFVkpaD/JFZ3evSdmOf4QcMWrK+dRIPJn1SlmpnoX2wZqjdlCHg2zJ2kkWXIwp
         GV0NPPIf0iMAnuV8F50/OQOxqsj67EvCUrpajmookq8aCIC13HeWOG8FCIrUvYD3XkQ1
         ERmuOAcpXo/3EJ98NnHyyhqy97oBtgglWxSJv9Zix6PUWI5eZ1um+/wfChSU5Iyg2Fy/
         BK2hENW7WhU+jie7ghq+d10nUy3KZnZuk6I3oFZzlVhteGhWWhfWtfTzqviqgPemlRSi
         tP5ecrUVXzCajf9SvgZ+6CatgVuR594AKiMzNK8TT4UCCVjhZRcENeyzxaxxE440JqGA
         YSGw==
X-Forwarded-Encrypted: i=1; AJvYcCWFvCBfAkGEtJSn+hyy3qQdA2pc3u+QP5bEv3KH9NfXYR/+zaUzOtabzXTtf/Ky2LXP3orlggBfrP1pfQr02mPv+KAQFA==
X-Gm-Message-State: AOJu0YxHRkoFGAGGDZDJQTj8CfwpZUkQgaYqyq9rt8ubhsHqACPXKpK9
	G+3g1mG7WAKr6UbC8xpySJVghdXNNkoLO3RrOy/xspAKEaHUGBW1a5ERs7Ax0AVHdbpLVWxf8Cr
	xpSiAx8tjYW18IwOsyZBwvJDL/fAGDbxjHlXMtg==
X-Google-Smtp-Source: AGHT+IGsnuKrGIgppmDbZ5qB5PCahd/U7K9yFBI8vV7C0Q0Y/IrpHBMv5VHW+jQvIwvalqRtoeVjhf0a3ebzv0+7YqA=
X-Received: by 2002:a05:6122:1815:b0:4d1:34a1:c892 with SMTP id
 ay21-20020a056122181500b004d134a1c892mr4401327vkb.13.1711359721603; Mon, 25
 Mar 2024 02:42:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240324231207.1351418-1-sashal@kernel.org>
In-Reply-To: <20240324231207.1351418-1-sashal@kernel.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 25 Mar 2024 15:11:50 +0530
Message-ID: <CA+G9fYuFh7K4XO+hVyJ59vWbfCaGpNf1ko9bUaZ0qV86wLbreQ@mail.gmail.com>
Subject: Re: [PATCH 6.1 000/451] 6.1.83-rc1 review
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, 
	shuah@kernel.org, patches@kernelci.org, lkft-triage@lists.linaro.org, 
	florian.fainelli@broadcom.com, pavel@denx.de, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Mar 2024 at 04:42, Sasha Levin <sashal@kernel.org> wrote:
>
>
> This is the start of the stable review cycle for the 6.1.83 release.
> There are 451 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Tue Mar 26 11:11:59 PM UTC 2024.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/patch/?id=linux-6.1.y&id2=v6.1.82
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.1.y
> and the diffstat can be found below.
>
> Thanks,
> Sasha

The regression detected while building allmodconfig builds with clang-17
failed on all the architectures. But gcc-12 builds passed.

> Andrii Nakryiko (5):
>   libbpf: Fix faccessat() usage on Android
>   libbpf: Add missing LIBBPF_API annotation to libbpf_set_memlock_rlim
>     API
>   selftests/bpf: Convert test_global_funcs test to test_loader framework
>   selftests/bpf: Add global subprog context passing tests
>   bpf: don't infer PTR_TO_CTX for programs with unnamed context type

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build error:
------------
kernel/bpf/btf.c:5140:10: error: expression which evaluates to zero
treated as a null pointer constant of type 'const struct btf_member *'
[-Werror,-Wnon-literal-null-conversion]
 5140 |                 return false;
      |                        ^~~~~
1 error generated.
make[4]: *** [scripts/Makefile.build:250: kernel/bpf/btf.o] Error 1h

Steps to reproduce:
# tuxmake --runtime podman --target-arch arm64 --toolchain clang-17
--kconfig allmodconfig LLVM=1 LLVM_IAS=1

Links:
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.1.y/build/v6.1.82-451-ga5b0d68e1b0f/testrun/23155982/suite/build/test/clang-17-allmodconfig/log
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2eAPAL6GZr1JrCuFjUfBrCjccbe/
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.1.y/build/v6.1.82-451-ga5b0d68e1b0f/testrun/23155982/suite/build/test/clang-17-allmodconfig/history/

--
Linaro LKFT
https://lkft.linaro.org
