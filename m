Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAAA230FA
	for <llvm@lists.linux.dev>; Fri, 23 Jun 2023 11:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=D0ozaDmhNyFK25SoDuRwst2ICRzooGIruMu1J/0UTdw=; b=e1VU5HupzKjPk3tMn37weKC8T1
	Df1rHFJLyS3VCJbM9W9xH+rDHA24BxaSXm97nyn8vtwSmOLplRM2ZDCtGw+4a6TjR7AjmkoE7e3WM
	IeNesvLOTnPILGjPWBqyUEq2PniAppsVbh3FrVT29eidMgR7UlyvrLrj4qR3c/QZntS3HScTq2sLX
	x1HLlKfB1VC8ypOT+frAyYy08Ax0GAZxV93p6Kbjl2H7UH8cgYjVKV1D8pIYVXY7pXyu3b8jEhSC5
	LhQtrKd4nRYZKTNDsfWIx0mOmSHJ/gGRl96XDvwWvaGYx9AgEM8MaoWTZ0pZT7NMFtNipd6FQ4gk9
	dvEdDP0w==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1qCezJ-0000a8-PL; Fri, 23 Jun 2023 13:30:01 +0200
Received: from [85.1.206.226] (helo=linux.home)
	by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <daniel@iogearbox.net>)
	id 1qCezJ-000G0O-7d; Fri, 23 Jun 2023 13:30:01 +0200
Subject: Re: [PATCH] bpf: Replace deprecated -target with --target= for Clang
To: Quentin Monnet <quentin@isovalent.com>, Fangrui Song
 <maskray@google.com>, Alexei Starovoitov <ast@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, bpf@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230623020908.1410959-1-maskray@google.com>
 <a5d419e4-f2ea-27f6-9259-a7b6486ab616@isovalent.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <bab57007-ddf6-7134-cefd-dfd1c8be17be@iogearbox.net>
Date: Fri, 23 Jun 2023 13:30:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <a5d419e4-f2ea-27f6-9259-a7b6486ab616@isovalent.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.8/26948/Fri Jun 23 09:28:15 2023)

On 6/23/23 10:51 AM, Quentin Monnet wrote:
> 2023-06-23 02:09 UTC+0000 ~ Fangrui Song <maskray@google.com>
>> -target has been deprecated since Clang 3.4 in 2013. Use the preferred
>> --target=bpf form instead. This matches how we use --target= in
>> scripts/Makefile.clang.
> 
> This seems to be the relevant commit, for reference:
> 
> https://github.com/llvm/llvm-project/commit/274b6f0c87a6a1798de0a68135afc7f95def6277
> 
>>
>> Signed-off-by: Fangrui Song <maskray@google.com>
>> ---
>>   Documentation/bpf/bpf_devel_QA.rst              | 10 +++++-----
>>   Documentation/bpf/btf.rst                       |  4 ++--
>>   Documentation/bpf/llvm_reloc.rst                |  6 +++---
>>   drivers/hid/bpf/entrypoints/Makefile            |  2 +-
>>   kernel/bpf/preload/iterators/Makefile           |  2 +-
>>   samples/bpf/Makefile                            |  6 +++---
>>   samples/bpf/gnu/stubs.h                         |  3 ++-
>>   samples/bpf/test_lwt_bpf.sh                     |  2 +-
>>   samples/hid/Makefile                            |  6 +++---
>>   tools/bpf/bpftool/Documentation/bpftool-gen.rst |  4 ++--
>>   tools/bpf/bpftool/Makefile                      |  2 +-
>>   tools/bpf/runqslower/Makefile                   |  2 +-
>>   tools/build/feature/Makefile                    |  2 +-
>>   tools/perf/Documentation/perf-config.txt        |  2 +-
>>   tools/perf/Makefile.perf                        |  4 ++--
>>   tools/perf/util/llvm-utils.c                    |  4 ++--
>>   tools/testing/selftests/bpf/Makefile            |  6 +++---
>>   tools/testing/selftests/bpf/gnu/stubs.h         |  3 ++-
>>   tools/testing/selftests/hid/Makefile            |  6 +++---
>>   tools/testing/selftests/net/Makefile            |  4 ++--
>>   tools/testing/selftests/tc-testing/Makefile     |  2 +-
>>   21 files changed, 42 insertions(+), 40 deletions(-)
>>
> 
>> diff --git a/samples/bpf/gnu/stubs.h b/samples/bpf/gnu/stubs.h
>> index 719225b16626..cc37155fbfa5 100644
>> --- a/samples/bpf/gnu/stubs.h
>> +++ b/samples/bpf/gnu/stubs.h
>> @@ -1 +1,2 @@
>> -/* dummy .h to trick /usr/include/features.h to work with 'clang -target bpf' */
>> +/* SPDX-License-Identifier: GPL-2.0 */
> 
> Are these necessary, seeing that the files only contain this single-line
> comment?

Yeah, lets drop that one. Otherwise looks good. Could you split out the tools/perf/
changes into a separate commit? I would assume that Arnaldo wants to take these
changes via perf tree instead.

>> +/* dummy .h to trick /usr/include/features.h to work with 'clang --target=bpf' */
> 
> Other than this, the change looks good, thanks. Although it should
> probably target bpf-next rather than bpf?
> 
> Acked-by: Quentin Monnet <quentin@isovalent.com>
