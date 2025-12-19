Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E106D32D443
	for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 21:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766179733; cv=none; b=jK/+dR1mWtXFYcXIhu1x177R8ZLvnuLjtuPAR71ml9GKhRm+BwcX9aBn09yPZ7j72SFcHWhDdzK4d3vCYxJASsK2BpD0ypyOJH3MkYTmPcIE8vcTDVzcmErlOc0MiVVhwM0KhqsMserMAj2BBz2pxW01XO+ZpN0BX5pbq4QZhIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766179733; c=relaxed/simple;
	bh=9qdyLYhk6D9KpgNEc9lTRHJNMgr66Y5zIziSEMCrXTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FC0ObD/bn5XcN7D6g7oS06NCmHlr+kt0VHZ4g9Nh1rW1otETMjkd6umTfWqHGGQRv9c50c5CIwl2Xj/Fb2YNU4eJiJ/lGbt1wTPvT4pbjuMzDwivF4E46ZLK0sjLY05kzzEbU98W6Y83fvsXri4+HBMvmcMzXAWT6M+25iak8bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QaSOo55P; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QaSOo55P"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-7ade456b6abso1926617b3a.3
        for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 13:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766179731; x=1766784531; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9qdyLYhk6D9KpgNEc9lTRHJNMgr66Y5zIziSEMCrXTM=;
        b=QaSOo55PIr4wrAfLCP/CvTsJia/dA4rUrefvOSVh7wKtt8E1gGhrNJCYYCHZmbYLoH
         Y5gowYlOCfThYvimADdntF391HWWOi4sTDeTw5dS5WVaQZvxCRAjJkHpsh+OENyTneZT
         RvVsLzbq1RG/daaEsqv7QlL3BxCVZxS4dyFTmc+MkXfUll67IwBBz9ziFi5/tyTaXGb2
         T7iHkKZ2L4Tw7W0SUZ2qFC2j6BRvPBBfc08hTqqRM4yXoZ0w1q7NoLPvLiId+n9E7Tri
         JruplZh+I/Oi2id/JqsXQ3pj//qBHvVcsXQ//wPPqKE2l2YxMlB1Xy2dy8Er8Mp5/2O0
         MdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766179731; x=1766784531;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qdyLYhk6D9KpgNEc9lTRHJNMgr66Y5zIziSEMCrXTM=;
        b=PYN4B9J+ocTq85MdY0Q0Z2NtRLHdZiqB60wbsvzsRC2NovqZL0C3Vno3o5TENgFjNk
         AAXT9J62DOYrtEoiL6nmOmFjTzrwaZptbqjLyF5fGCT31AKUeJ7GoCYCDbseHl2dGfd8
         fYjXCp664mbafpYuDE85PGiMPPZJ9279hrkBbF+Hgg+zUJ9lMYQwM6um7maDNCMoCx8z
         PIpoPgL+SwNY2RTMdn9vIyaUv+JCGYe7jsH+MFLHr+7frwLs+oK/CpZ0mjbTHw8eEmgT
         vpm4E3qaUqKsHdoNtsUy9t0nSRfJ1dqvI9NOki002trAchNxAU/CgQqAIgvdbKZvx0j2
         XLLg==
X-Forwarded-Encrypted: i=1; AJvYcCWoPlIeYSrq7c+h8J7sgh36SQAd+pn863PsbjMpoBMm8LchWvcKurDPcnIz8HB3VboMFwZp@lists.linux.dev
X-Gm-Message-State: AOJu0YztUFYG7YYHUYnrHFq19Y4iTV3AkrY2KS84O85qLHNMSMUgWyI2
	HqmkMlnIK5LiL98vyNeFQKgcbKMmVOSChBDiy7MpCsgjsZy2IJ3iOdJ1
X-Gm-Gg: AY/fxX65cIP1Wu+RxE+JcB9le4IrK21FALf4J1pnqVfiIeEWE/fIpL85DLArWNgHE8z
	vD40Dk/cGOi+9xfGsLQPRmI2Qg4ey7229f5Ac3wdqvJUttVTLDggFeppAERhQxrzf/WeNeYVtRP
	dug8DByWiGiGobAMXCalpc/0rIcUU/8prr/0QpdXIyGJtModl5yAz7nUcXI1wWpUKeGxbUGpYmQ
	fNcDnCD5JDfm+7yrSbd0BQwnHTOavB3+kGk1TDYooqtutAFKA6MClX4erW39h9sRowlyDIuoYem
	KHSpPf8/L+u12CvVrFIXfs7LEOj7U3dnIE/FPhM+m9+5ufBm0Lk8C9kzf897sZICEUr1u1JKPLA
	/Y6h79yiY2Ms0XEEAGhC2iqJLlo2FhzedDjbm4DGzQM4zUmAp6EstZ0gxjHEiLdxXRgYXVfE5yV
	zyPC8r9PN4+5CQEYebDDASgoYr4CcvnUPz10RuyED8NqAsSZu7yodJfiEiutIZQiuc4ZgFcdep3
	3Jyy6laPZrtffor/Zpx8ABP/9Gs11LqEv8rcpESJySDEMFjGdfWx96qAw4LjMXnLrWw+Uc6A/yf
	C9o=
X-Google-Smtp-Source: AGHT+IFntC97OMoIKW8iak4Csi+Sa/wJHZS2qz46SkDovenEuEnw3BILL/ha2LHm12T/rhrLMeYBbA==
X-Received: by 2002:a05:7022:6988:b0:119:e56b:91ed with SMTP id a92af1059eb24-121722e01c2mr4354548c88.30.1766179731046;
        Fri, 19 Dec 2025 13:28:51 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:5874:79f3:80da:a7a3? ([2a00:79e0:2e7c:8:5874:79f3:80da:a7a3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254cd77sm12305503c88.14.2025.12.19.13.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 13:28:50 -0800 (PST)
Message-ID: <ecb35204-ea13-488b-8d60-e21d4812902a@gmail.com>
Date: Fri, 19 Dec 2025 14:28:48 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/36] lockdep: Annotate lockdep assertions for context
 analysis
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Chris Li <sparse@chrisli.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>,
 Eric Dumazet <edumazet@google.com>, Frederic Weisbecker
 <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>,
 Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Johannes Berg <johannes.berg@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Josh Triplett <josh@joshtriplett.org>, Justin Stitt
 <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mark Rutland
 <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Thomas Gleixner <tglx@linutronix.de>, Thomas Graf <tgraf@suug.ch>,
 Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>,
 kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
References: <20251219154418.3592607-1-elver@google.com>
 <20251219154418.3592607-8-elver@google.com>
 <cdde6c60-7f6f-4715-a249-5aab39438b57@acm.org>
 <CANpmjNPJXVtZgT96PP--eNAkHNOvw1MrYzWt5f2aA0LUeK8iGA@mail.gmail.com>
Content-Language: en-US
From: Bart Van Assche <bart.vanassche@gmail.com>
In-Reply-To: <CANpmjNPJXVtZgT96PP--eNAkHNOvw1MrYzWt5f2aA0LUeK8iGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/19/25 2:16 PM, Marco Elver wrote:
> It's basically an escape hatch to defer to dynamic analysis where the
> limits of the static analysis are reached.

That's not how lockdep_assert_held() is used in the kernel. This macro
is more often than not used to document assumptions that can be verified
at compile time.

This patch seems like a step in the wrong direction to me because it
*suppresses* compile time analysis compile-time analysis is useful. I
think that this patch either should be dropped or that the __assume()
annotations should be changed into __must_hold() annotations.

Bart.
