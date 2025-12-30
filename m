Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3290213D638
	for <llvm@lists.linux.dev>; Tue, 30 Dec 2025 00:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767056355; cv=none; b=AkFzmfSpo6fdlC8KsC5sJDTD9pLu3quH/JCAmf19fKIjVmC3pbgdSEHk96RLPPzmUiX307yo140/o/W3506uVreSSbt7p0FzFgN3/mbX+4lvhV7ugHSQ9r+NLjJ0tMMQS5hh3H3S8yQE6mNexXwKtY/Kv0k+NaFCSyV9tS1rzu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767056355; c=relaxed/simple;
	bh=2lxDnwdsZekXe4NfDsKQJITWCMDUWP6xiRX5VchwVV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CAbWAbOTUS5tEeqVzdSagFJjs4YvsO8198deAcs07xe6p38r9qSpXArBUYlkxYuUwLSg0DKKiwcHkRtE7oBIPQvKAhBOhHtRX75tVrtbj6bxl8pJ623Wmiir90E+gzZ/73kSNHmqKSqGlFsv3MUtL6WOLxMd89/PyNfoR5v7Ki8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oLZ7OzKO; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oLZ7OzKO"
Message-ID: <26800836-3864-47ec-910b-aed571758f04@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767056351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TSyzvjl2It73lqYA6EDJUDBcvQxjHw4X7Zb7XrvQVUQ=;
	b=oLZ7OzKOpf4AbXx1p7wAm4IkLiVOcM7MnlHBnQYpYeKv2eymkHXiCpvQz03QcYr9tU4Bcc
	WO/jFUHfHLy+ol+q9jTWIiewXfC4ZhoMW2JWLqXm3jpqTCQ0vVgUq9r9RnZRw1hiOGyWHH
	FgosFZ8sEO9qw+v4wRKSoxAGCYXUflA=
Date: Mon, 29 Dec 2025 16:59:03 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [RFC PATCH v1] module: Fix kernel panic when a symbol st_shndx is
 out of bounds
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Luis Chamberlain
 <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-modules@vger.kernel.org, bpf <bpf@vger.kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 clang-built-linux <llvm@lists.linux.dev>
References: <20251224005752.201911-1-ihor.solodrai@linux.dev>
 <9edd1395-8651-446b-b056-9428076cd830@linux.dev>
 <af906e9e-8f94-41f5-9100-1a3b4526e220@linux.dev>
 <20251229212938.GA2701672@ax162>
 <6b87701b-98fb-4089-a201-a7b402e338f9@linux.dev>
 <CAADnVQ+X-a92LEgcd-HjTJUcw2zR_jtUmD9U-Z6OtNnvpVwfiw@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <CAADnVQ+X-a92LEgcd-HjTJUcw2zR_jtUmD9U-Z6OtNnvpVwfiw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 12/29/25 4:50 PM, Alexei Starovoitov wrote:
> On Mon, Dec 29, 2025 at 4:39 PM Ihor Solodrai <ihor.solodrai@linux.dev> wrote:
>>
>> [...]
>>
>>
>> From 7c3b9cce97cc76d0365d8948b1ca36c61faddde3 Mon Sep 17 00:00:00 2001
>> From: Ihor Solodrai <ihor.solodrai@linux.dev>
>> Date: Mon, 29 Dec 2025 15:49:51 -0800
>> Subject: [PATCH] BTF_OBJCOPY
>>
>> ---
>>  Makefile                             |  6 +++++-
>>  lib/Kconfig.debug                    |  1 +
>>  scripts/gen-btf.sh                   | 10 +++++-----
>>  scripts/link-vmlinux.sh              |  2 +-
>>  tools/testing/selftests/bpf/Makefile |  4 ++--
>>  5 files changed, 14 insertions(+), 9 deletions(-)
> 
> All the makefile hackery looks like overkill and wrong direction.
> 
> What's wrong with kernel/module/main.c change?
> 
> Module loading already does a bunch of sanity checks for ELF
> in elf_validity_cache_copy().
> 
> + if (sym[i].st_shndx >= info->hdr->e_shnum)
> is just one more.
> 
> Maybe it can be moved to elf_validity*() somewhere,
> but that's a minor detail.
> 
> iiuc llvm-objcopy affects only bpf testmod, so not a general
> issue that needs top level makefile changes.

AFAIU, the problem is that the llvm-objcopy bug is essentially
use-after-free [1], that may (or may not) corrupt st_shndx value of
some symbols when executing --update-section.

And so we can't trust this command anywhere in the kernel build, even
though it only manifested itself in a BPF test module.

With the gen-btf.sh changes ${OBJCOPY} --update-section is called for
all binaries with .BTF_ids: vmlinux and all modules.

The fix in module.c is an independent kernel bug, that is hopefully
fixed with the st_shndx check.

[1] https://github.com/llvm/llvm-project/issues/168060#issuecomment-3533552952

