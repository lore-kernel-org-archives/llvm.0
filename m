Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45FB27C171
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 14:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741100077; cv=none; b=CwHGLHB0ssCanr+c6Xnbn45apUEPh85NJqAQQmgK6uTVMxBIZH8uwR1JXPpZ3XiVSMYck719DOfgiditTKATPZYGVU8mcXo6UCuT+b3G/VcYuvda84LAeO9w3/muL1kBWaoNaH75Vz95xzFFR6aKhYh6THNOWcNyOfN+lcUWUFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741100077; c=relaxed/simple;
	bh=6sXLqOGwJPjjQ1mrwjcKafFgt74IfGmcKaUYu1Vea1Y=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=VjqTgYcPnqAwC0n0n+ZnNUH9trv28K/EDvig1zH/NK67DGuXr+2wdhn118RZ5kjhS/4k7nhyQTOtFuyuqujhLEFSe3703SzAksMxDye1V+DeSA71+Ojfejpze8l9v0vUCB97HkC+RESiSDJnrzWK/XQiALFLCKR4PMAg9hZH3+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=HsBac2XW; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="HsBac2XW"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 524Eqsmu2303478
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 4 Mar 2025 06:52:55 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 524Eqsmu2303478
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1741099977;
	bh=6sXLqOGwJPjjQ1mrwjcKafFgt74IfGmcKaUYu1Vea1Y=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=HsBac2XWWG8JTb5veE6LuaAtOLLvQu+vBFWgoKJItDg2FR2nOr9Ue8lryfQJFNb5X
	 ojvI2P5MCIyrjDnZDpX41nGdlho2yRe4glo+hru+12GUQ7NBtdvcBedZZUsuJAWMmd
	 N1yfFPWJ9WTY4SudzJVAuXk+ooFW+J2KOOkX3rNtdkndtmyJKXCfOOPoNoEFrEvYyS
	 l+SyUMQ+mbWmrFpz4qKD1NBiUxnxzQF3eOYkhvJKEwllwoiSYqGIWHFHl+eS6oQqxV
	 mHa7p//gFjY/UXuPZ99CFf8KpquSyK6rWISD0Qpt03vNg4h+TUDKnvTetXzksGMPfD
	 /cUCOphcQnqWw==
Date: Tue, 04 Mar 2025 06:52:53 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Peter Zijlstra <peterz@infradead.org>,
        Menglong Dong <menglong8.dong@gmail.com>
CC: rostedt@goodmis.org, mark.rutland@arm.com, alexei.starovoitov@gmail.com,
        catalin.marinas@arm.com, will@kernel.org, mhiramat@kernel.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, ast@kernel.org,
        daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
        eddyz87@gmail.com, yonghong.song@linux.dev, john.fastabend@gmail.com,
        kpsingh@kernel.org, sdf@fomichev.me, jolsa@kernel.org,
        davem@davemloft.net, dsahern@kernel.org,
        mathieu.desnoyers@efficios.com, nathan@kernel.org,
        nick.desaulniers+lkml@gmail.com, morbo@google.com,
        samitolvanen@google.com, kees@kernel.org, dongml2@chinatelecom.cn,
        akpm@linux-foundation.org, riel@surriel.com, rppt@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org,
        netdev@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v4 1/4] x86/ibt: factor out cfi and fineibt offset
User-Agent: K-9 Mail for Android
In-Reply-To: <20250304094220.GC11590@noisy.programming.kicks-ass.net>
References: <20250303132837.498938-1-dongml2@chinatelecom.cn> <20250303132837.498938-2-dongml2@chinatelecom.cn> <20250303165454.GB11590@noisy.programming.kicks-ass.net> <CADxym3aVtKx_mh7aZyZfk27gEiA_TX6VSAvtK+YDNBtuk_HigA@mail.gmail.com> <20250304053853.GA7099@noisy.programming.kicks-ass.net> <20250304061635.GA29480@noisy.programming.kicks-ass.net> <CADxym3bS_6jpGC3vLAAyD20GsR+QZofQw0_GgKT8nN3c-HqG-g@mail.gmail.com> <20250304094220.GC11590@noisy.programming.kicks-ass.net>
Message-ID: <6F9EF5C3-4CAE-4C5E-B70E-F73462AC7CA0@zytor.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 4, 2025 1:42:20 AM PST, Peter Zijlstra <peterz@infradead=2Eorg> wr=
ote:
>On Tue, Mar 04, 2025 at 03:47:45PM +0800, Menglong Dong wrote:
>> We don't have to select FUNCTION_ALIGNMENT_32B, so the
>> worst case is to increase ~2=2E2%=2E
>>=20
>> What do you think?
>
>Well, since I don't understand what you need this for at all, I'm firmly
>on the side of not doing this=2E
>
>What actual problem is being solved with this meta data nonsense? Why is
>it worth blowing up our I$ footprint over=2E
>
>Also note, that if you're going to be explaining this, start from
>scratch, as I have absolutely 0 clues about BPF and such=2E

I would appreciate such information as well=2E The idea seems dubious on t=
he surface=2E
