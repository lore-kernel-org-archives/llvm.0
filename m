Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3E215B540
	for <llvm@lists.linux.dev>; Wed, 15 May 2024 22:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715811624; cv=none; b=EAUWO3v6u7+bBDGlFpshhrVotx4pA2VeeQ9ikXucfdcFOk4q8CleRawnCltL40APZYWU3APH6TbTpLzpEFT2dTUWhnKSpHL9NsBxWnNSM+t7PN10Ql+Kc8HT7Hrl2qIspaxi93KAHc3ZsuMz+9WXWGqlj+6hvmHZz/2snxHGi7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715811624; c=relaxed/simple;
	bh=zHDyKDJHC6NugxP4s4BCf1sMZ+O+QoU46wnbbwkXAfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hA7/kneHtW8Ez+ppHGDtCklbqmli+bgTfX/Z1Jq1TcSq3AMayebYbhgvj3wGAcMzSX198RzhCyqiYE/BNw6k+VDNg8DjuFBBqxm9kM8pvvpVUrs3GHr1ewAXdiKePbv9OZY4wTYvfdqE/cFLG0Psf5VvMdxlAPMfRysH1RIOONA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DqIQApFK; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DqIQApFK"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-572f6c56cdaso46205a12.0
        for <llvm@lists.linux.dev>; Wed, 15 May 2024 15:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715811621; x=1716416421; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/JjCgBiQoM5fCyA+EXfpGyLzGnNJOcvDx0VjNNMaI6A=;
        b=DqIQApFKc8UnOKzK9+jFK5Uvb7qJQpWA3xgKFwqm2z+l2Rzi3QHM1iHdqjSX9LnW3Y
         NUcSXHqzr0IGEws3n1VN83CyUzivfo6QqHtN8t3I6d8Cj+fFpsj7U7S2oaNnKC9MrbyZ
         9FHutZ4kL0IdzGfX9ZE+5dk5Z1jgi673GLXDV5ZfAFZQ/amaF+bi0PJ+LUXPcI5uQqYy
         SWm87eJ18RqugW5Uc5mhMpXzo7fnyVPlkLuITaBQ0guWhXqqeYh5pA7dwj+U2Drw/u8O
         fMGgfL5kG/l8IBKYu45o4VHlOf+Dpa/Uc3VyrD7izqQflVK+cN/Yy5DvlidlHfCO2KVZ
         Fm5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715811621; x=1716416421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/JjCgBiQoM5fCyA+EXfpGyLzGnNJOcvDx0VjNNMaI6A=;
        b=D2yICu0xKcPhrUkPaSmtYcVtSMvkwrd5x4axKlL7Z9635HtWJUqwxqlyXiFCrsM+Hw
         +WlEbml06gi3/KvPck3MQiueGjsMkvYjAzuvgPy8TuE2UgWTQQu6a7X7wkYepeauehJu
         iLCFHomYoSnexsWZnPsUjERMEMyk6lKFmAg9qc1OuzAQ4f8d9l1ohSD1NxCvm4kB8/EH
         4w1r8qZYTVa9ht6xNtGeleQnD7EQpZnlxkT+2OQwJEN2AMTZIoq9i5RYCmPolfxv1NjT
         tbHvDxo61oF+9kbRAarOHxxcZLB4rH8m+kCbp6PgAghkeHCwrZCvDFJvLVV/81FUbA8N
         MOlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVebn2vNMr8vp9FmPC6p7doSJOEUBII+B8xiYK1AFp4P//32f66+U7xK/Z26+M1/TXp2ZaTM5SqSqdfq5IVfdmKqzvZ0A==
X-Gm-Message-State: AOJu0YxC2ki/T2F75eZdZ1WCiVFZeaNMWPxGuqyvp9h5o8yhmrdGJu72
	RnQPXQGSpv/pdQqD+qwo+I/8gYOVuzxz5no0pTfpcAg0D7szTc+e3TrS/1ghCu269bao6j+L8wg
	fE+XbNGGYO2zHv1d/sXBuIzRMlTed/OQQp5TN7PyFUb8ZBFpNH4Vb
X-Google-Smtp-Source: AGHT+IGZ3GJvtzMop9dwqIvXre4rgfTZO15wpGDTxHvaHQ7WHetdGZHHg53H8t3pQXebBpag/n52DXaZ7drKVOiwJFA=
X-Received: by 2002:a50:c943:0:b0:573:4a04:619 with SMTP id
 4fb4d7f45d1cf-57443d30f6cmr899677a12.4.1715811618461; Wed, 15 May 2024
 15:20:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240501122918.3831734-1-usama.anjum@collabora.com> <CAFP8O3JkgQsH-4Lmr2W_teuvLjOCPi1htr9r3CO1O0yLyw=Azg@mail.gmail.com>
In-Reply-To: <CAFP8O3JkgQsH-4Lmr2W_teuvLjOCPi1htr9r3CO1O0yLyw=Azg@mail.gmail.com>
From: Fangrui Song <maskray@google.com>
Date: Wed, 15 May 2024 15:20:04 -0700
Message-ID: <CAFP8O3LaEAuUtEERr_Loxazw1wDO1ufVL_-g+XoBsZgseT3QCQ@mail.gmail.com>
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

On Mon, May 6, 2024 at 4:26=E2=80=AFPM Fangrui Song <maskray@google.com> wr=
ote:
>
> On Wed, May 1, 2024 at 5:29=E2=80=AFAM Muhammad Usama Anjum
> <usama.anjum@collabora.com> wrote:
> >
> > This series fixes build errors found by clang to allow the x86 suite to
> > get built with the clang.
> >
> > Unfortunately, there is one bug [1] in the clang becuase of which
> > extended asm isn't handled correctly by it and build fails for
> > sysret_rip.c. Hence even after this series the build of this test would
> > fail with clang. Should we disable this test for now when clang is used
> > until the bug is fixed in clang? Not sure. Any opinions?
> >
> > [1] https://github.com/llvm/llvm-project/issues/53728
>
> I've closed https://github.com/llvm/llvm-project/issues/53728
> (constant expression folding for relocatable file output
> (MCObjectStreamer)).
>
> I've sent a patch to address https://github.com/llvm/llvm-project/issues/=
62520
> (constant expression folding for relocatable file output  when inline
> assembly is used).
>
> (I am subscribed to llvm@lists.linux.dev but rarely read it. I noticed
> this message accidentally :) )

On the LLVM/Clang side, I've landed
https://github.com/llvm/llvm-project/pull/91082 to make the following
.if directive work for clang -c. clang -S still doesn't work
(https://discourse.llvm.org/t/rfc-clang-assembly-object-equivalence-for-fil=
es-with-inline-assembly/78841/4?u=3Dmaskray)
but people can probably live with that

```
% cat b.cc
asm(R"(
.pushsection .text,"ax"
.globl _start; _start: ret
.if . -_start =3D=3D 1
  ret
.endif
.popsection
)");

% clang -c b.cc     # succeeded with this patch
% clang -S b.cc     # still failed
<inline asm>:4:5: error: expected absolute expression
    4 | .if . -_start =3D=3D 1
      |     ^
1 error generated.
```


> > Muhammad Usama Anjum (8):
> >   selftests: x86: Remove dependence of headers file
> >   selftests: x86: check_initial_reg_state: remove -no-pie while using
> >     -static
> >   selftests: x86: test_vsyscall: remove unused function
> >   selftests: x86: fsgsbase_restore: fix asm directive from =3Drm to =3D=
r
> >   selftests: x86: syscall_arg_fault_32: remove unused variable
> >   selftests: x86: test_FISTTP: use fisttps instead of ambigous fisttp
> >   selftests: x86: fsgsbase: Remove unused function and variable
> >   selftests: x86: amx: Remove unused functions
> >
> >  tools/testing/selftests/x86/Makefile            |  9 +++++----
> >  tools/testing/selftests/x86/amx.c               | 16 ----------------
> >  tools/testing/selftests/x86/fsgsbase.c          |  6 ------
> >  tools/testing/selftests/x86/fsgsbase_restore.c  |  2 +-
> >  tools/testing/selftests/x86/syscall_arg_fault.c |  1 -
> >  tools/testing/selftests/x86/test_FISTTP.c       |  8 ++++----
> >  tools/testing/selftests/x86/test_vsyscall.c     |  5 -----
> >  7 files changed, 10 insertions(+), 37 deletions(-)
> >
> > --
> > 2.39.2
> >
> >
