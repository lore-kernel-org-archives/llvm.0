Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB3A21A447;
	Mon,  1 Dec 2025 20:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764620614; cv=none; b=T9cC45k6NFTRmw/JCj1qqd02ejrCtBn60xsqruFCIcyirNzoQui/eJ5f+j/vBNbL4ODp0wasS9f9y3J4yV4gXI6T/guhRBIwguyfsAys43L2Zl8JpmarFoZ9j9Kqd9zN7pUz7KvIXu8CxLV6nqvqkEkVB/sk2Y0k5YL+XeumDGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764620614; c=relaxed/simple;
	bh=QggAT6MMTWOS3pjCWycWyPnxE1D+eh+mGZMtYCFxq00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/4nvS5tuOd76h+E79k9R2xxhfoRalk3afqE6GNwqbByFhv94wpMwZIsEUINjJRd9p3vXo2+pmjHs3vg/1zimClWF3NlXzT5jDC2Di2MmLkPXDPJ9W2MKiELtBClQClpryJJcsZiZQQqQ+dv4+tFT1gxgcGneTVtAaYNPSkNRSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=horVFvIo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="horVFvIo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FD18C4CEF1;
	Mon,  1 Dec 2025 20:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764620614;
	bh=QggAT6MMTWOS3pjCWycWyPnxE1D+eh+mGZMtYCFxq00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=horVFvIokfSCf+ijIoUNLTLRWZrDwyfPmvUcI+UgUwahcT955K2gofTwadUsWZXxx
	 EgtrGBEbRbUelB3V0sF4OqHVBl00v7u+iY4n2rYSjBKyH/6f1d/9sNLhaEaiwBv3w9
	 7FxAfzpymYHs3a7h3OpAtkdW27+W9Mq4S79vv5VV0rSERxdvYxKM22L2q14mgr39p2
	 w0sU1BWVHCBpPhNf4kEx/WTodJ/ZCzJt80ov/fxKWMXfqRq66jHN60m4u/n9TwbK0L
	 kEAiCxjNw0qkvfyzJq0fkk//bdOG/dfQFEfjja60bsqGaDcpXHycU2Ouc7yZkdMf1P
	 wHQKPRHBA9XuA==
Date: Mon, 1 Dec 2025 13:23:29 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alexandre Chartre <alexandre.chartre@oracle.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
	peterz@infradead.org, david.laight.linux@gmail.com,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6 11/30] objtool: Trace instruction state changes during
 function validation
Message-ID: <20251201202329.GA3225984@ax162>
References: <20251121095340.464045-1-alexandre.chartre@oracle.com>
 <20251121095340.464045-12-alexandre.chartre@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251121095340.464045-12-alexandre.chartre@oracle.com>

Hi Alexandre,

On Fri, Nov 21, 2025 at 10:53:21AM +0100, Alexandre Chartre wrote:
> During function validation, objtool maintains a per-instruction state,
> in particular to track call frame information. When tracing validation,
> print any instruction state changes.
> 
> Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>

I am seeing a segfault after this change in -next as commit fcb268b47a2f
("objtool: Trace instruction state changes during function validation")
when building allmodconfig with clang 21.1.6 [1] (I did not check
earlier versions).

  $ clang --version | head -1
  ClangBuiltLinux clang version 21.1.6 (https://github.com/llvm/llvm-project.git a832a5222e489298337fbb5876f8dcaf072c5cca)

  $ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 clean allmodconfig drivers/scsi/qla2xxx/qla2xxx.o
  make[7]: *** [scripts/Makefile.build:503: drivers/scsi/qla2xxx/qla2xxx.o] Error 139
  ...

  $ ld.lld -m elf_x86_64 --fatal-warnings -z noexecstack -r -o drivers/scsi/qla2xxx/qla2xxx.o @drivers/scsi/qla2xxx/qla2xxx.mod

  $ tools/objtool/objtool --hacks=jump_label --hacks=noinstr --hacks=skylake --ibt --cfi --mcount --mnop --orc --retpoline --rethunk --sls --static-call --uaccess --no-unreachable --link --module drivers/scsi/qla2xxx/qla2xxx.o
  fish: Job 1, 'tools/objtool/objtool --hacks=j…' terminated by signal SIGSEGV (Address boundary error)

If there is any other information I can provide or patches I can test, I
am more than happy to do so.

[1]: https://mirrors.edge.kernel.org/pub/tools/llvm/files/llvm-21.1.6-x86_64.tar.xz

Cheers,
Nathan

# bad: [95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a] Add linux-next specific files for 20251201
# good: [e69c7c175115c51c7f95394fc55425a395b3af59] Merge tag 'timers_urgent_for_v6.18_rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect start '95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a' 'e69c7c175115c51c7f95394fc55425a395b3af59'
# good: [87d5c4addc7e535618586e7205191a7f402288ba] Merge branch 'master' of https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
git bisect good 87d5c4addc7e535618586e7205191a7f402288ba
# good: [a4ad48eac682ccdc21e2f16b8f27abbf615d8d3d] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git
git bisect good a4ad48eac682ccdc21e2f16b8f27abbf615d8d3d
# bad: [b99f4ac0a6c7ccf37be14f5ef61b160b1c8a74b0] Merge branch 'driver-core-next' of https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
git bisect bad b99f4ac0a6c7ccf37be14f5ef61b160b1c8a74b0
# bad: [24cefd05bbf969c95fff3733da174e8a352c1cb2] Merge branch 'master' of https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
git bisect bad 24cefd05bbf969c95fff3733da174e8a352c1cb2
# bad: [4fa1e8d3340bc660d72a21fc8d4c566045e488fc] Merge branch into tip/master: 'timers/clocksource'
git bisect bad 4fa1e8d3340bc660d72a21fc8d4c566045e488fc
# good: [51446852de95594c02d6b3b700e15b7c886534d6] Merge branch into tip/master: 'core/bugs'
git bisect good 51446852de95594c02d6b3b700e15b7c886534d6
# good: [b032713af9475274762fa664ca2705372b414215] Merge branch into tip/master: 'locking/core'
git bisect good b032713af9475274762fa664ca2705372b414215
# good: [9929dffce5ed7e2988e0274f4db98035508b16d9] perf/x86/intel: Fix and clean up intel_pmu_drain_arch_pebs() type use
git bisect good 9929dffce5ed7e2988e0274f4db98035508b16d9
# bad: [59bfa6408214b6533d8691715cf5459e89b45b89] objtool: Build with disassembly can fail when including bdf.h
git bisect bad 59bfa6408214b6533d8691715cf5459e89b45b89
# bad: [350c7ab8577a32c101a097f4c072220d9ce64f3b] objtool: Improve tracing of alternative instructions
git bisect bad 350c7ab8577a32c101a097f4c072220d9ce64f3b
# good: [0bb080ba6469a573bc85122153d931334d10a173] objtool: Disassemble instruction on warning or backtrace
git bisect good 0bb080ba6469a573bc85122153d931334d10a173
# bad: [fcb268b47a2f4a497fdb40ef24bb9e06488b7213] objtool: Trace instruction state changes during function validation
git bisect bad fcb268b47a2f4a497fdb40ef24bb9e06488b7213
# good: [de0248fbbf999d0fd3ca2aa5ba515ab78703d129] objtool: Record symbol name max length
git bisect good de0248fbbf999d0fd3ca2aa5ba515ab78703d129
# good: [70589843b36fee0c6e73632469da4e5fd11f0968] objtool: Add option to trace function validation
git bisect good 70589843b36fee0c6e73632469da4e5fd11f0968
# first bad commit: [fcb268b47a2f4a497fdb40ef24bb9e06488b7213] objtool: Trace instruction state changes during function validation
