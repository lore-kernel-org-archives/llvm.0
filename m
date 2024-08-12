Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B145516F0DD
	for <llvm@lists.linux.dev>; Mon, 12 Aug 2024 10:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723459267; cv=none; b=WwU9fzpuqKjCob8kqnEUYd0flBZzyUEVOPaz2ecMH+oS42Yc9zQl5LDd6dJ4JhhFU6MxxXoVbj1vvgSt1U482bc1icni7vXJ9kcv86CvkoqLPKhBpimFDoj+wcBgSf+QDHVAwYIbaDq8MtRVjmuOQt3c4oZATk2YwphLEIPOOa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723459267; c=relaxed/simple;
	bh=mrKMVI6736FaMlR2FwpVoV8uktYgiiLL5X46u7/zEVs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gYEHVIl1ukeq467wcJggQFou2owgN7cvd0McH83JeFCydn8QvzVndoueMhE6L6wGJBdkuoDIXmXKf3CP6F70aR6iliTa3W3Y/hnBPMmIskY9JbyKBvoWleEUvtEtpO8lTfGmXlB28a6z1ychfWhxKVqRDi879hI9/Jz0RQtcVWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Alexei Starovoitov <ast@kernel.org>,  Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>,  Martin
 KaFai Lau <martin.lau@linux.dev>,  Eduard Zingerman <eddyz87@gmail.com>,
  Song Liu <song@kernel.org>,  Yonghong Song <yonghong.song@linux.dev>,
  John Fastabend <john.fastabend@gmail.com>,  KP Singh
 <kpsingh@kernel.org>,  Stanislav Fomichev <sdf@fomichev.me>,  Hao Luo
 <haoluo@google.com>,  Jiri Olsa <jolsa@kernel.org>,  Nathan Chancellor
 <nathan@kernel.org>,  Nick Desaulniers <ndesaulniers@google.com>,  Bill
 Wendling <morbo@google.com>,  Justin Stitt <justinstitt@google.com>,
  "Jose E . Marchesi" <jose.marchesi@oracle.com>,  Andrew Pinski
 <quic_apinski@quicinc.com>,  Kacper =?utf-8?B?U8WCb21pxYRza2k=?=
 <kacper.slominski72@gmail.com>,  Arsen =?utf-8?Q?Arsenovi=C4=87?=
 <arsen@gentoo.org>,
  bpf@vger.kernel.org,  linux-kernel@vger.kernel.org,  llvm@lists.linux.dev
Subject: Re: [PATCH v2] libbpf: workaround -Wmaybe-uninitialized false positive
In-Reply-To: <3c9e6cbe-f768-48b1-9e37-779971fd1146@oracle.com> (Alan Maguire's
	message of "Fri, 9 Aug 2024 18:48:32 +0100")
Organization: Gentoo
References: <8f5c3b173e4cb216322ae19ade2766940c6fbebb.1723224401.git.sam@gentoo.org>
	<3c9e6cbe-f768-48b1-9e37-779971fd1146@oracle.com>
Date: Mon, 12 Aug 2024 11:40:58 +0100
Message-ID: <87mslija6d.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Alan Maguire <alan.maguire@oracle.com> writes:

> On 09/08/2024 18:26, Sam James wrote:
>> In `elf_close`, we get this with GCC 15 -O3 (at least):
> [...]
>
> Would just initializing struct elf_fd be enough to silence the error
> perhaps, i.e.

Yeah, that WFM. Thanks, sent v3.
