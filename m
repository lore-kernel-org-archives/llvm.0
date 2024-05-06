Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FF7142E77
	for <llvm@lists.linux.dev>; Mon,  6 May 2024 23:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715038003; cv=none; b=VcgHbuEgs7Q4V0GEBeyhHqezq7vvNUpSpVLRY8sWjBYCtaS4meKjeDtXG6uWkKfHotIBGEUiTEM4cCFgrN84oqE23HE2s9ceXuBM0bXmXISg4s70Ly1R+eYzlefDeu+jtTEjaMQUHs6FDKwn5umV019MVFqjROeSBU0/OrCa2NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715038003; c=relaxed/simple;
	bh=cJ9hyxh3nF+1An19GSvXwAC4s8YrykB9K2WJtVoH5bk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oeDoRR7IKC+rzj+1/GXN7hzrkNUYFi8R82x0tK6w0TGtO9tohhkTR0/Q+etkmKAXT92NgAcuH5iRvhKJuxTuDrNAseCN9hwXhCkqD6k/btd04lfi0q68Un8IEzJNEtgJqj+gQoZxXSpMJC/g9gvDt8XYtfTLtiAOF0bHWI5u+X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zMftwAky; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zMftwAky"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-572f6c56cdaso8436a12.0
        for <llvm@lists.linux.dev>; Mon, 06 May 2024 16:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715037999; x=1715642799; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=arg5k9e4eumU/21NxDFCZ0styz6cWNXoQ5vyGJusoQ8=;
        b=zMftwAkyd21U6/CTtO39o4lEUgjx9Gp0rUXbwcupHd53VF9zYpIYx3NQrtZyPpbwun
         izhvjJYP9Xia2A7IklUntvyWRb3u+BhCCrVhQ1o+86P4kIf7TzVjBXYMjlEQTNW/LFJx
         tohmDAfMZG42exfjiBqZp/UFuOTi3LYxVzEDOcnyO6ACfPQ8DRZzqtYuBDeAfUgetZDR
         /EozGQbpIfgRMyC+QgKdtmubUMwwmBa1/aU2EXy/6sPjpS3lzqYpuSdeJuqoQS+DkZwj
         FsqbtK/zAzLCBWUthTsQQezzIkv9I+XqZ6ZBMD1lUTU1rdIlvYwC7OxSCABECszRFrQD
         X/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715037999; x=1715642799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=arg5k9e4eumU/21NxDFCZ0styz6cWNXoQ5vyGJusoQ8=;
        b=te5UpLHg1UjTwnXugvtogr5wba+FIMSZ1yuXokpBXg7eT2aeHtsx1VABa2vOiXiR1u
         i9mWMuV8qyBy+AHWKnca6XTjYLGnu6X4+sNhomPitwlc0GNB9IZOiCtt3NiK+ON3NdEH
         XcerFEMG9uSz+LpAewQf+2PLwBbiR0A4vK0pRzlXdj8JzJpUt7bdedeuu8b2psjTnbsk
         0BjvXvMeVNqiGq1aeB04jwMtDQu8z8AO130sr6qLf9UapA6udvXggk8L2oEEpO7pafHR
         oj9Xx+qD4McRFn+JB/gUkOezEzucEQggrEUiHzbbN/CPejN1cPqqbAu9Fg5mznSy1XFD
         A8aA==
X-Forwarded-Encrypted: i=1; AJvYcCVAEptoSVLRBUNLdTRYk6pWv3X7RM1xWD6kNhppNg8HGebNyiNjBfw1fSqvNsNB9Xw9vzKskPpb8aIv32vZTs0HTMufBA==
X-Gm-Message-State: AOJu0YyiFQfVNHQmoy1g9bWu4A9aZJoesYlzZqSkodvCBMkz8CnWnlP4
	EY819HTI8LvewfMfL1n6c6x6f7o7UkARi9TlM2F5EUmn7CCuCDDI5poWlZdIEHEDqP77UizGca+
	yQnley7B2R6pPoeCpPaW4rNBpm5155Q3RLS7W
X-Google-Smtp-Source: AGHT+IGJV7l8Y6VljzbpAT4oaU0i2MC2YKQ4WajhRPny/3d+aBTKQkE4NpCFTHY4NBSikNHOII7Lohs8MRKp9IuOFiI=
X-Received: by 2002:a05:6402:34ce:b0:573:1366:d196 with SMTP id
 4fb4d7f45d1cf-5731366d350mr39525a12.1.1715037999082; Mon, 06 May 2024
 16:26:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240501122918.3831734-1-usama.anjum@collabora.com>
In-Reply-To: <20240501122918.3831734-1-usama.anjum@collabora.com>
From: Fangrui Song <maskray@google.com>
Date: Mon, 6 May 2024 16:26:25 -0700
Message-ID: <CAFP8O3JkgQsH-4Lmr2W_teuvLjOCPi1htr9r3CO1O0yLyw=Azg@mail.gmail.com>
Subject: Re: [PATCH 0/8] selftests: x86: build suite with clang
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	"Mike Rapoport (IBM)" <rppt@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, "Chang S. Bae" <chang.seok.bae@intel.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 1, 2024 at 5:29=E2=80=AFAM Muhammad Usama Anjum
<usama.anjum@collabora.com> wrote:
>
> This series fixes build errors found by clang to allow the x86 suite to
> get built with the clang.
>
> Unfortunately, there is one bug [1] in the clang becuase of which
> extended asm isn't handled correctly by it and build fails for
> sysret_rip.c. Hence even after this series the build of this test would
> fail with clang. Should we disable this test for now when clang is used
> until the bug is fixed in clang? Not sure. Any opinions?
>
> [1] https://github.com/llvm/llvm-project/issues/53728

I've closed https://github.com/llvm/llvm-project/issues/53728
(constant expression folding for relocatable file output
(MCObjectStreamer)).

I've sent a patch to address https://github.com/llvm/llvm-project/issues/62=
520
(constant expression folding for relocatable file output  when inline
assembly is used).

(I am subscribed to llvm@lists.linux.dev but rarely read it. I noticed
this message accidentally :) )

> Muhammad Usama Anjum (8):
>   selftests: x86: Remove dependence of headers file
>   selftests: x86: check_initial_reg_state: remove -no-pie while using
>     -static
>   selftests: x86: test_vsyscall: remove unused function
>   selftests: x86: fsgsbase_restore: fix asm directive from =3Drm to =3Dr
>   selftests: x86: syscall_arg_fault_32: remove unused variable
>   selftests: x86: test_FISTTP: use fisttps instead of ambigous fisttp
>   selftests: x86: fsgsbase: Remove unused function and variable
>   selftests: x86: amx: Remove unused functions
>
>  tools/testing/selftests/x86/Makefile            |  9 +++++----
>  tools/testing/selftests/x86/amx.c               | 16 ----------------
>  tools/testing/selftests/x86/fsgsbase.c          |  6 ------
>  tools/testing/selftests/x86/fsgsbase_restore.c  |  2 +-
>  tools/testing/selftests/x86/syscall_arg_fault.c |  1 -
>  tools/testing/selftests/x86/test_FISTTP.c       |  8 ++++----
>  tools/testing/selftests/x86/test_vsyscall.c     |  5 -----
>  7 files changed, 10 insertions(+), 37 deletions(-)
>
> --
> 2.39.2
>
>


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
