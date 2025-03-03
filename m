Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F6D1F03EE
	for <llvm@lists.linux.dev>; Mon,  3 Mar 2025 21:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741038056; cv=none; b=lZRmoQAl4pgFd1etisd9w2OrBAPYxu/WUSKmEvGZCufjp9d3kkBIitEowPSu2pOnFzVcnyb1gBXkAWzWRDSTNU8Gp8vVWqN5hy4DmTsDL4Yt+e6uIKOoJRlu5PGuVEV3z+OJ8P9HpywoArmr9n1DaDMIZ65SXRdzpR8uPtxlcGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741038056; c=relaxed/simple;
	bh=t48prv4ltqZBgmpiT8R/ZTVb9z8qZJulguu49one7U4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IE4NgKq36k9wfG2UUuLjMPev7mEFwxsT+Prfqs1hbD51p25K1/yUiSt2UJb0hbejrIpPZBXssLsmBvjdYWB8l/4NHJmVY1OCTR87EH+8Vj+DlJO3awrz3cLf+NNEVQM7e06thL8/TOi31Ov8q5XHKmsgvpYmTQjXp5NMnHqheG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GA6bf3Pt; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GA6bf3Pt"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-223a0da61easo51025ad.0
        for <llvm@lists.linux.dev>; Mon, 03 Mar 2025 13:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741038054; x=1741642854; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=//CA4dP1gRO/1RNRixCqJrbqKaw0YXw5wU7J/MVaxKg=;
        b=GA6bf3Pt5cpmYgVUmGCDtOIzxICqTK3yhq+geXzHJDeKX/gQUeEdtPaixcayzGXcH4
         R1LqK11LUhE5J9Zj8ZIOM1cwOSyrpOnUTLa/gWM7zKHMY0ojp7DMAfFuILmRAhlQiluy
         s//dMF3wcYMMw+Cavliu0th1CdaFdmPwLIjymq0fqm5UU9Ikg0x6SLczsfOfkzZY2VMx
         15utfcXdVpw5LxVjqLMbxxVdjdrSIxQQ0B8k1m/3UMeQagoSV0jX6crbDQp/rb9PEPSD
         2Wyc+xtOVya7LRj8lCQ/L4sS4cmAkwsGK3/W2XUP6M3n+Amts5grmSfJAdJzN3GShXNy
         LO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741038054; x=1741642854;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//CA4dP1gRO/1RNRixCqJrbqKaw0YXw5wU7J/MVaxKg=;
        b=jVQhKyul5k3NNmFD3yEf7sKOsQVfSyXGuSUxKAEGvgAVqqXVRrXoDdK+9mErlT/zPS
         nDiE8I6RP+SLMD23SlKaEk4bAN2WRXGEiNliXMeapdxNp9hxJScPnE4rBAjs3NfbQI5W
         QDXDCTn+Z51JDPcgsyfFSPE9Mw0LJl95AyolKsdW1eRCpBGJg/HmO5yWjUdiEyUZ9GDU
         fDStq9G+bX1ih4nqMpRIa/AlD8DaGY5Grb7arqpHf/2oNXaiyGPTR+SEB2kCv/tg7N34
         GB5IZ27gYDkZMDHfxOq6an98Agam08BnK/g60johWGmzeJg7Ejzyha3ZhtFdbiJCgzry
         ARnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMI7OB71L8rMPU3tE1qqAWp5I+mFC9vPLGOIbgjNH2n4HvxgflAtfI8jAHRzNuCNF7Wo/x@lists.linux.dev
X-Gm-Message-State: AOJu0YwXETM9lNIQ0bs8MqikKjXI447/B0hdacvLU3DdwRln0x14RAd7
	JPi0WfomGzH90wJGCAjnrfNm4sgazd4zQoj0Mae+xkR6RAezXqXZmBuRWT8jSw==
X-Gm-Gg: ASbGncsXK7NR2RkPuLSkmqXWfhn5krojyXDG0sO4nZXkRE1VxVV8WqFHvANjXfPJxBS
	X35O7Xw7qbISBkTpvf/zzdNqiPvTMs+rTMofjnKpFRtlzhTAFADiSP2fhDoUZuGvMAMM8DdAXUc
	ko1+tCKmtK8cwx2e9/oDryCo1qIDwqtPaGfRww0lcrBQeZLmZBGaczKTLUvSNlxjVAFm/Mt/Wh2
	kg74oy1jrNy2DOUXFL2f3mA0z9uuJftYMxH2M6L8rzq56eF23cc1i+r68eH1gvLjkjGbmNC+Qux
	jDtCNEJwZDvPNNr11z6eDqIJbXFKG0h83X3PTWhRdUo1egoJujTuNV5mzyYjrqh6nR6/fh/eu3l
	WfFeKe1uBDEDSq4k=
X-Google-Smtp-Source: AGHT+IEwj6zn3l1n1mEvrRIOd0S1KGWs/bgL/3cFaL+tQsr/6cABYrLinWLfgT7M2GWCtuDNAUdgLA==
X-Received: by 2002:a17:903:2592:b0:223:2630:6b86 with SMTP id d9443c01a7336-223db3fdecdmr77895ad.7.1741038053846;
        Mon, 03 Mar 2025 13:40:53 -0800 (PST)
Received: from google.com (227.180.227.35.bc.googleusercontent.com. [35.227.180.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7349fe514besm9424721b3a.71.2025.03.03.13.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 13:40:53 -0800 (PST)
Date: Mon, 3 Mar 2025 21:40:48 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Menglong Dong <menglong8.dong@gmail.com>
Cc: peterz@infradead.org, rostedt@goodmis.org, mark.rutland@arm.com,
	alexei.starovoitov@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, mhiramat@kernel.org, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, ast@kernel.org, daniel@iogearbox.net,
	andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com,
	yonghong.song@linux.dev, john.fastabend@gmail.com,
	kpsingh@kernel.org, sdf@fomichev.me, jolsa@kernel.org,
	davem@davemloft.net, dsahern@kernel.org,
	mathieu.desnoyers@efficios.com, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, morbo@google.com, kees@kernel.org,
	dongml2@chinatelecom.cn, akpm@linux-foundation.org,
	riel@surriel.com, rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org,
	netdev@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v4 4/4] arm64: implement per-function metadata storage
 for arm64
Message-ID: <20250303214048.GA570570@google.com>
References: <20250303132837.498938-1-dongml2@chinatelecom.cn>
 <20250303132837.498938-5-dongml2@chinatelecom.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303132837.498938-5-dongml2@chinatelecom.cn>

On Mon, Mar 03, 2025 at 09:28:37PM +0800, Menglong Dong wrote:
> The per-function metadata storage is already used by ftrace if
> CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS is enabled, and it store the pointer
> of the callback directly to the function padding, which consume 8-bytes,
> in the commit
> baaf553d3bc3 ("arm64: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS").
> So we can directly store the index to the function padding too, without
> a prepending. With CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS enabled, the
> function is 8-bytes aligned, and we will compile the kernel with extra
> 8-bytes (2 NOPS) padding space. Otherwise, the function is 4-bytes
> aligned, and only extra 4-bytes (1 NOPS) is needed.
> 
> However, we have the same problem with Mark in the commit above: we can't
> use the function padding together with CFI_CLANG, which can make the clang
> compiles a wrong offset to the pre-function type hash. He said that he was
> working with others on this problem 2 years ago. Hi Mark, is there any
> progress on this problem?

I don't think there's been much progress since the previous
discussion a couple of years ago. The conclusion seemed to be
that adding a section parameter to -fpatchable-function-entry
would allow us to identify notrace functions while keeping a
consistent layout for functions:

https://lore.kernel.org/lkml/Y1QEzk%2FA41PKLEPe@hirez.programming.kicks-ass.net/

Sami
