Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16AE200D2
	for <llvm@lists.linux.dev>; Fri, 17 May 2024 11:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715943642; cv=none; b=qabTpvzHhwxqyT1ZLR7UiYnx0+2yI+TRtEk7OCw7nnvSaM6WDhhNnpbZHyqBm7VTTc/yhrjZcI9FGigEsT0AdN0RWEwo52JyE22tIZuwwhewU51IWcR6pYuSVucVpfbmsUMsJz+2V5BjC86MiS3lDXSzepOHDJYJZtFSpa2r9Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715943642; c=relaxed/simple;
	bh=7EEC64SS9Fi698JqjKcaoeII5qyUxMCkfT/0NkvGVLo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=A96iDgqIVpWXFbuLhRB5YpdADNs2H0q7JQ7kQOm6XxFbwcRwOVyuXyIP6mWZ/QohFTTSOiDS3FbvifAErHW795WJslb6LDOg81A0Zf72c68MT2GSbOk69A85fH5oHTKY4IAYkoeLO6CjW5InWEKs+bkd1YWs/zUAl02Sw0eRHwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KN8tM8r/; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KN8tM8r/"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-572baf393ddso6531011a12.1
        for <llvm@lists.linux.dev>; Fri, 17 May 2024 04:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715943639; x=1716548439; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qNOVue41hqxQ8m+b+AVJiBo42I4XisayKzHkj86Mjb4=;
        b=KN8tM8r/6YsDz57It69ZQaz7WF17c2PkZyM1KqAuHEiM02HZhZ5/F3RpizUalMADtr
         PH8XkC7Sp7eBgFO3QtpC8S5F2pp3lvTVtfzC8qXOIqvUXwgMUgvuzfzQr4UkOQwjkS11
         V2dDELEYX9apqGPhHYpktBGilibQMFFmWbOJZhjWtyNCpqgBu4fvEruaKIhWDW0oE1dG
         VTUNTuSZhn0XYydoHxmBII6gN0fKHfovGmGWi+b+5NSPm3eYw4kd1KAsHQYEIddfLlVX
         MikVhY1u7QH+N5LL8e7yNBc84UJ91HbQU1O6pE7h7vKljWELBqTCrItpwIIiWyInU644
         PAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715943639; x=1716548439;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qNOVue41hqxQ8m+b+AVJiBo42I4XisayKzHkj86Mjb4=;
        b=KYYlGit3jBaQFkWk2xduKzC1dpTigxrV1HMvuRA1YQVIEBWkjsyj/cMKD6kc7PiR18
         Ifh9X1EidFkkxThdwQtOxqiIp0rUXJauyntNRaZA3W8pfAKgX7dug4/PINz+kh3v7yMi
         EM3AUKborvu3k6Me8DZW4bJN3q1Svnn+3wps9A0D35S4m8cX4FoSUXpJ8TdFGOtxhq4D
         nggl1WpRfC0LprETH1SI0C+fBvt9UI6Ql5A61O0kkxKT0oEU2jnAFV+ba6fBgUWv/TMi
         j+hlRjL7EYyAPsqWBRyoLUmSNRpkiSK1UPVQOCSGCuzWcjjGYq+ebJ03B80J8FkuHGzI
         C2xA==
X-Forwarded-Encrypted: i=1; AJvYcCVoMLFHKP/Ay7gTVGyiapGUw5LneDgJBPiHi232gyaaUggr/utOwHpfzrlqKrTXpASltdlU+0ybUlXw1y3tYhhAR72Pjg==
X-Gm-Message-State: AOJu0YwAJh6syaaLznb33sZ/A/v5hAVvMjoOG0vFvH2VZR6tHTHMdy9k
	lJRxXKhLMBvg1BnezrPFO//b8kdSVvfw9Zc1FVHGyu2RxcVOYvgxSyvD60nQkGbzOFTtYM3Octs
	VrU16kjIagKVEU3XURQGwHYVFqxGrGudKGa9WhQ==
X-Google-Smtp-Source: AGHT+IHIImsL921tTTC6eatZ7SLL8Yqy2JoDfWbe97SkkDBCfuoHgNHRicDxspmiNsu4E21WbigzJYVQ83mzmvaMVmg=
X-Received: by 2002:a50:ab19:0:b0:574:ec3d:262a with SMTP id
 4fb4d7f45d1cf-574ec3d28d3mr8234840a12.5.1715943639134; Fri, 17 May 2024
 04:00:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 17 May 2024 13:00:25 +0200
Message-ID: <CA+G9fYuyPFBVyqqg0RVhaz4c0S+H4TMm1apxgwyTUOkge9NY7A@mail.gmail.com>
Subject: clang: arch/x86/boot/printf.c:257:3: error: unannotated fall-through
 between switch labels [-Werror,-Wimplicit-fallthrough]
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	clang-built-linux <llvm@lists.linux.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Borislav Petkov <bp@suse.de>, Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following x86 build failed on Linux next-20240517 tag due to following
warnings / errors only seen with clang builds.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build errors:
----
arch/x86/boot/printf.c:257:3: error: unannotated fall-through between
switch labels [-Werror,-Wimplicit-fallthrough]
  257 |                 case 'u':
      |                 ^
arch/x86/boot/printf.c:257:3: note: insert 'break;' to avoid fall-through
  257 |                 case 'u':
      |                 ^
      |                 break;
1 error generated.

The suspected patch,
x86/boot: Add a fallthrough annotation

metadata:
---
  git_describe: next-20240517
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: c75962170e49f24399141276ae119e6a879f36dc
  git_short_log: c75962170e49 ("Add linux-next specific files for 20240517")
  build_name: clang-18-lkftconfig


Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240517/testrun/23951572/suite/build/test/clang-18-lkftconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240517/testrun/23951572/suite/build/test/clang-18-lkftconfig/details/
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2gZwb1q4GHgVCuOfQIMCJ6tqMFn/


--
Linaro LKFT
https://lkft.linaro.org
