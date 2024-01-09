Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F43E2E650
	for <llvm@lists.linux.dev>; Tue,  9 Jan 2024 09:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ViMLpuOO"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-466fb1cbfe9so323844137.0
        for <llvm@lists.linux.dev>; Tue, 09 Jan 2024 01:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704792976; x=1705397776; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2kvtwERabor0ovhKcasBi1QrG566y9gSjsPmQwcCohY=;
        b=ViMLpuOOu5WapigXWw/77oIErtjul628S6BfVOvztsZWraMWTyGseOuZVsAwRKBMPg
         9/Ty7cnVkxTjvqJgCLFL5ZPKY8nvvHzSIqSSrZ0NK9gEyEGBmiDeAiXJ53bJanncVnVu
         gBe+YS+IBe+lOa8ierNgXVoZi+vHl9Lp6cV/3vTnkumy0dLBpLqu++kqm7//rN52xD8S
         0AmB9shjbgiC3YqJlrFPzVN2g80SXZLFG7UOMlgVlCs+FsIHR43E8VmdTcZx1sRFF82P
         wcez/TwF0qmPCNUj6kjLNaOfKzGwIWulgDXWRp1zlYCJQpuZ1k36Ec/jmTWL40SKG1UI
         Oa3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704792976; x=1705397776;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2kvtwERabor0ovhKcasBi1QrG566y9gSjsPmQwcCohY=;
        b=wJOi7r1QAU0lhHR8CL8el27DiUqjtJH9u83QJnCL4fOi8dxCCKr7F+X3oDLy40KJWk
         OTSrGHHlTEvJ4LyN+5xq0ZHFmkEMN2uz1bZ/lq/8xncRz1cozGzkLwVpLy7luYS+ih9R
         FqAh5mTGg6/ugWRg3E42g6ImnYN8DhnTGVHdNYzhXyifqSc3On5Qklz8gbpRtVgsB3ro
         1tnzNjX1Pg1vJcJ680P4cei35XcXTozf3JpbEFP6OYzmkns6BpfT8dtT/ljK34WpStDw
         UZ98merxkYoPF9uZ5zpTn00hM57nr6c9HgFV4XtxT7CxBqkdgqUXbQ23OZNUU9B9MLEu
         xfjw==
X-Gm-Message-State: AOJu0Yy4Q10NuN1L3rSQ+tITfiXmc8303qoFeKzYoynrER4rWr3NwaRD
	gpOPu8QSRwZpkk7qfs9ApgWeG4OA+ZsvV6nhTvGu5C53Xv+xZA==
X-Google-Smtp-Source: AGHT+IHarpJCgQaUpefGQAx4VwLOqfsSHwF2QlLzvgIw/HF2yUfCVvYOt4SIRnJcsxEI4QHmR+B6B7wxmNlm1J9w9Oo=
X-Received: by 2002:a05:6102:3f09:b0:467:bf0a:a0b2 with SMTP id
 k9-20020a0561023f0900b00467bf0aa0b2mr1690491vsv.21.1704792975829; Tue, 09 Jan
 2024 01:36:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 9 Jan 2024 15:06:04 +0530
Message-ID: <CA+G9fYtbTSVtYQF4gdKK_SjibEZAV5KXFOtbC0YK9QF9Z8gSRw@mail.gmail.com>
Subject: riscv: clang-nightly-allmodconfig: failed on stable-rc 6.6 and 6.1
To: linux-stable <stable@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	lkft-triage@lists.linaro.org
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"

The clang nightly build failures are noticed on stable-rc 6.6 and 6.1 for
riscv allmodconfig builds.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Logs:
=====
 arch/riscv/kernel -I ./arch/riscv/kernel -dwarf-version=4 -mrelocation-model
  static -target-abi lp64 -mllvm -riscv-add-build-attributes
   -o arch/riscv/kernel/kexec_relocate.o /tmp/kexec_relocate-28089a.s

 #0 0x00007f5039e1667a llvm::sys::PrintStackTrace(llvm::raw_ostream&,
int) (/lib/x86_64-linux-gnu/libLLVM-18.so.1+0xd6d67a)
 #1 0x00007f5039e146a4 llvm::sys::RunSignalHandlers()
(/lib/x86_64-linux-gnu/libLLVM-18.so.1+0xd6b6a4)
 #2 0x00007f5039e16d3b (/lib/x86_64-linux-gnu/libLLVM-18.so.1+0xd6dd3b)
 #3 0x00007f5038ba8510 (/lib/x86_64-linux-gnu/libc.so.6+0x3c510)
 #4 0x00007f503c8f50c8 (/lib/x86_64-linux-gnu/libLLVM-18.so.1+0x384c0c8)
 #5 0x00007f503b492cf5 (/lib/x86_64-linux-gnu/libLLVM-18.so.1+0x23e9cf5)
 #6 0x00007f503b492607 (/lib/x86_64-linux-gnu/libLLVM-18.so.1+0x23e9607)
 #7 0x00007f503b492300
llvm::MCExpr::evaluateAsRelocatableImpl(llvm::MCValue&,
llvm::MCAssembler const*, llvm::MCAsmLayout const*, llvm::MCFixup
const*, llvm::DenseMap<llvm::MCSection const*, unsigned long,
llvm::DenseMapInfo<llvm::MCSection const*, void>,
llvm::detail::DenseMapPair<llvm::MCSection const*, unsigned long>>
const*, bool) const (/lib/x86_64-linux-gnu/libLLVM-18.so.1+0x23e9300)
 #8 0x00007f503b492536
llvm::MCExpr::evaluateAsRelocatable(llvm::MCValue&, llvm::MCAsmLayout
const*, llvm::MCFixup const*) const
(/lib/x86_64-linux-gnu/libLLVM-18.so.1+0x23e9536)
 #9 0x00007f503b46d51a
llvm::MCAssembler::evaluateFixup(llvm::MCAsmLayout const&,
llvm::MCFixup const&, llvm::MCFragment const*, llvm::MCValue&,
llvm::MCSubtargetInfo const*, unsigned long&, bool&) const
(/lib/x86_64-linux-gnu/libLLVM-18.so.1+0x23c451a)
#10 0x00007f503b46f8d2 llvm::MCAssembler::layout(llvm::MCAsmLayout&)
(/lib/x86_64-linux-gnu/libLLVM-18.so.1+0x23c68d2)
#11 0x00007f503b46fbeb llvm::MCAssembler::Finish()
(/lib/x86_64-linux-gnu/libLLVM-18.so.1+0x23c6beb)
#12 0x00007f503b48e43c llvm::MCELFStreamer::finishImpl()
(/lib/x86_64-linux-gnu/libLLVM-18.so.1+0x23e543c)
#13 0x00007f503b4ec410 (/lib/x86_64-linux-gnu/libLLVM-18.so.1+0x2443410)
#14 0x000055b46ddce675 cc1as_main(llvm::ArrayRef<char const*>, char
const*, void*) (/usr/lib/llvm-18/bin/clang+0x18675)
#15 0x000055b46ddc6285 (/usr/lib/llvm-18/bin/clang+0x10285)
#16 0x000055b46ddc53a8 clang_main(int, char**, llvm::ToolContext
const&) (/usr/lib/llvm-18/bin/clang+0xf3a8)
#17 0x000055b46ddd3016 main (/usr/lib/llvm-18/bin/clang+0x1d016)
#18 0x00007f5038b936ca (/lib/x86_64-linux-gnu/libc.so.6+0x276ca)
#19 0x00007f5038b93785 __libc_start_main
(/lib/x86_64-linux-gnu/libc.so.6+0x27785)
#20 0x000055b46ddc2b11 _start (/usr/lib/llvm-18/bin/clang+0xcb11)
clang: error: unable to execute command: Segmentation fault (core dumped)
clang: error: clang integrated assembler command failed due to signal
(use -v to see invocation)
Debian clang version 18.0.0
(++20240107111313+2835be82db20-1~exp1~20240107111423.1804)
Target: riscv64-unknown-linux-gnu
Thread model: posix
InstalledDir: /usr/local/bin
clang: note: diagnostic msg:
********************

PLEASE ATTACH THE FOLLOWING FILES TO THE BUG REPORT:
Preprocessed source(s) and associated run script(s) are located at:
clang: note: diagnostic msg: /tmp/kexec_relocate-53192a.S
clang: note: diagnostic msg: /tmp/kexec_relocate-53192a.sh
clang: note: diagnostic msg:

********************
make[4]: *** [scripts/Makefile.build:382:
arch/riscv/kernel/kexec_relocate.o] Error 1

Links:
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.6.10-125-gc52463eb66c8/testrun/22017748/suite/build/test/clang-nightly-allmodconfig/details/
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.1.y/build/v6.1.71-151-g28e6ce52ce18/testrun/22017752/suite/build/test/clang-nightly-allmodconfig/details/

Test history link:
 - https://qa-reports.linaro.org/_/comparetest/?project=1597&project=1971&suite=build&test=clang-nightly-allmodconfig


--
Linaro LKFT
https://lkft.linaro.org
