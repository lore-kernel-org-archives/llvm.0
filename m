Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5567B41775
	for <llvm@lists.linux.dev>; Mon, 12 Feb 2024 18:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707762986; cv=none; b=XvHRH5y097D7liWZxpB0+9uIivjwpsNuY1E75zbfvihmZg74OZKh6tBRLjWP3XxF6N2gLNoOrh7d44L6V2mIKVMpxUPq0pLUtcuB4lO+7YRj9RfqRr0uWQpWoWGn0gzeisOUl7Dd7vCY3FgOqjIToy+q/uNJzziN/VaciLOmSpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707762986; c=relaxed/simple;
	bh=WXKqSYyybXp6uV6dewa2nvBTpPzl9LPRGTDSAu1cgDM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=BHlTgL9s/GDSbLdXhCnrSlolHfEMnEaM/5A5+bZtTy8qnnI+6w3ifed8a/g9V/hcdJl3BATi+37V4edIoWG2UreQBsw9mXpkPmjnS/kM3Lrx4axccY3sch9zfpUqe8490CS7/XNqmW583nGlttOSLNOZvFTouV3K8gqf6iqtlHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GR2skxZ0; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GR2skxZ0"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-7d2e15193bbso1624856241.0
        for <llvm@lists.linux.dev>; Mon, 12 Feb 2024 10:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707762984; x=1708367784; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WXKqSYyybXp6uV6dewa2nvBTpPzl9LPRGTDSAu1cgDM=;
        b=GR2skxZ0nqx2HOpfBOdzYX2uFuTSNR50YhESlD9JhyBjgmVhkQzpDA5aRH4/O+jxtS
         NoLS5euiR0lHtZSe8bdsI5SH7IFo+krxCHkwx5oSnw/k91jYRUF259YcUi1Ql8IqRcjm
         x0rZQm/DUUUMx4v2UHIdtboWV/sNkL+TpakaXaYwh5CNi4APfNQ0POdYVcKeklWoQM32
         dTKX0fuPeGNgEjLI2EewVXu2pochilOkmVY0nm4rtcodxXrbNM4Xl+Ju/CSQ1/qOq8Et
         QYQb8H+gsN7zRgu/6uCDP9lUH2N2dtwoEjHoi06N4HdLMDQL+IWoC36dhF1OhqW8fhJi
         Rh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707762984; x=1708367784;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WXKqSYyybXp6uV6dewa2nvBTpPzl9LPRGTDSAu1cgDM=;
        b=uI04IFs+JoAP7qIixJSGCMIdF2r77VgNovCTLwQQ8Z68nCyKyYxagJKqxF+Bi43JWL
         CrjiZLLBSQj7y2Kgk7oM59ehrwfhTAtz2p4lzxKp6qyFP1vfiD81FQz+aGle391/YVoO
         fNiMb9kuzz45w5C9bl/gSQ+CapNeQZwV1aSfefD390UQSLdhUwZUPPI86Ma3roYYptuA
         oYE2ONXxX2UfdQDSTNMm+CWj13kxpgjHZP+ar+rfzuni+0OVWw7ndSRH7DlprTdnz9lw
         gV6sEHe9v1fcG460CIuhz5uc2WSXf05AD4Zslk2m6ZWTKiBU5dQEt54n9gaiK/RJ19L3
         sdHQ==
X-Gm-Message-State: AOJu0Ywd0HFSur16s/KJ9g7T7Z9KzStCWAOJuC23iWMEQcTcfemCiqT8
	XCP8OUjCSb9V1KF/B2ryTIVTlrATq6zWac1JbGMEfvAL3xAZkdn0d30hMqN0d2yPL1Ao7wIbXRZ
	OTHsWxWhCbuRhczhSN6qCBqRpkQ2rNDYwHTywoA==
X-Google-Smtp-Source: AGHT+IEGZANl6emZY1UqGcSik514xyBzWU+XBPYnRHQZC/PhIexcuWbWZ04L9aeTVXS9UkOAD0ILzGf2zegYmfLzUl4=
X-Received: by 2002:a67:e445:0:b0:46d:19df:f3b2 with SMTP id
 n5-20020a67e445000000b0046d19dff3b2mr6250849vsm.7.1707762984219; Mon, 12 Feb
 2024 10:36:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 13 Feb 2024 00:06:12 +0530
Message-ID: <CA+G9fYuRwO6FLZ4do1wR0RdiZh9NGpRLKckQcKN2aAkqBH7k0g@mail.gmail.com>
Subject: Powerpc: ps3av.c:(.text+0x19e8): undefined reference to `video_get_options'
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	clang-built-linux <llvm@lists.linux.dev>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, 
	Geoff Levand <geoff@infradead.org>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

I encountered the following build warnings/errors while compiling the powerpc
kernel on Linux next-20240208 .. next-20240212 tag with clang toolchain.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

powerpc64le-linux-gnu-ld: drivers/ps3/ps3av.o: in function `ps3av_probe':
ps3av.c:(.text+0x19e8): undefined reference to `video_get_options'
make[3]: *** [/builds/linux/scripts/Makefile.vmlinux:37: vmlinux] Error 1
make[3]: Target '__default' not remade because of errors.

Links:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2cFkli5H02fikrpga6PluAWLAMa/


--
Linaro LKFT
https://lkft.linaro.org
