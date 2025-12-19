Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E594221F15
	for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 23:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766187100; cv=none; b=HlV0SQQnt+UuUpBzrAu9UhsPDoRiTy5JnMjNN7cMRcD5ulqb70763KM+j0peFjfKwM+/SwK3TpZYVGjZWlciCJOgb1Q45jI5a6uau6JItY0nUl2x8KziefKZUdfIPZ4UJM0NW7z1rwbeiENpcY214YKv175jN8a5QAPPZ8HjccI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766187100; c=relaxed/simple;
	bh=kqYAQZ609rJygFWC7CbHOEHNatKsPADzGjHUdHPU3XE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MgbsxiHmsmiVV8kwYUcwMuaMu/ZTlFIPyma6jTnPbPb/ZxgVilsrsk8X6dC/G6TY4NnxRm1iuIw/kEEH2kukJKYc/UOoOAPpHzF+dorNeCkeZPBPpcCix2iQ3up5SIr/emMIRNMYzG0rM8rkk1fGeMwfGWo/pHl++ctuehaASRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHeBACN0; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHeBACN0"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-c05d66dbab2so2355463a12.0
        for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 15:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766187098; x=1766791898; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xjhz9NvSIj1nkwStS3EsBbpnWvjG3hzX9yFNjSmaNpQ=;
        b=MHeBACN06JyjWrvGbZS3MVPwRz+tKTK1HXp0H0lG6kzQgKWtKfnqiOCj+qn32sriPw
         foYPFOyhdCzUKtwFjn2SHb8pYGCG4F7cA2eSRrYBcoCQTz38m4gOYIgoU0YFxPoQ9P6H
         RehejMN6ciy3t1MtdElugqxz0aWiahucsrxqZFJ/NK0Ag+G0wDRM5xFp7Zz8b9zFAgG4
         Y0n4wHRmoHb5kmrj0qFExUvZkXh4LMFSL8o02zpYO93avmYVBd+kDGzyEZooes4jxVyX
         Cqsizrgv/7MM6+yDxBGUQVIlKMJMRz3gI4BypGECZHB12BrQgELAkmMg68XcZI7aG18R
         POeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766187098; x=1766791898;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xjhz9NvSIj1nkwStS3EsBbpnWvjG3hzX9yFNjSmaNpQ=;
        b=PHFAjcoIv/AuHaUDUV242POiG9wfaSkNy0WC1tW7FHOwcwFAk6Mk2aCeAUNGupRQbv
         QqNdvBV8XT7c9C4ECEDcYLeNQCu2Q4Qq+XByYHwdTAbJAillE0ZuqGREfE41mjJTUiir
         GleiQrzbGHjXQhOsrNn0Y1tTsMhYdOwFjMXlS4Dfaj/whGFm905Yu9nM/HeeDpwaDRuZ
         09bK1WTzJa47Gjwa9aCXI0KwAgClc8l/VHrK+RmUBaX3mUvWKZT+gJ1sraUH0uMPThZf
         HsOd70dfBU5iwc7YoJvpDsNhm4sJwKPlFGJBGotjnCiCAmfCi8nAXGxMuL0ExV5Axllk
         u1QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrvFwgYYjHPWJjKF8gHmxwj3DeeEt0pil23WBvsWx3ycXsd/u0UDY1ZIzUAWK5pfMgNauo@lists.linux.dev
X-Gm-Message-State: AOJu0YzO4y1lHpotwQixsgTDWzxdXHapQiIKwTEJN9Tsc1VaQZaO6+jF
	4qPCxZDLYmTlreeC3b17QKgsVyx+3vDLjkjG+nHaZxvMATFYgoPCaVP3
X-Gm-Gg: AY/fxX4sJA7HnWmBJ363ZxvRq5gGLCVjSjryx3cnftAsMNa2BN1UF6UeUX+Som+hR+m
	1NQF4iVFW3/so+1EtfImg2HmoENnb/88XJx+Sx/HxkGTmVaHYepKlahZ2kXlz65dtFRO9viSmQX
	FeMexUd/4iuWh0XefLoF2U6XV10AAh8KIcO3gb2KynBMWy+eJtcrgqjTizdIKRih1cn96BZF0Dm
	AH9qfkuQfGOTzWhNXcqcj2/989VtBVokcZaq6Zop2wEZVpdOqvw9sNpdjdVAYBojx/fhBHvTe9s
	tXD4W8K2MrjdHPMAN4j8anfXcYj1IATg+K9AdWa23selaGyOMws7metFoY6+/nZmjvlbxPxgcym
	wYXjU3lfH8gUC5HmQEs/h2bBiNolXDOpovBnGv86tY6WO2Zk3YBsC6XCja4HmKR0/YStWbQUCa4
	7RiuI8yVjlNA9GJEh/TFd0FgDNR3FnpakivN03B2WRc+rcDWgc3y4r1Qplnqyr4K+hsCqbFaahl
	0e9aclMTWcwgjQ7pK8zjwmDuXRbWz378epZzM0+8nTt8d+mIKtwJtswhw6rWb4r1kdRmLnSFLfU
	JeM=
X-Google-Smtp-Source: AGHT+IFD9VEfhTkWGAUJ+KrkgUpiheofAxrSZVwNtEffu0+8gx+hrdlGu9tKXSDKwQO+mDr4xt9mXg==
X-Received: by 2002:a05:7022:3a83:b0:11c:b397:2657 with SMTP id a92af1059eb24-121722be81emr4954809c88.22.1766180747284;
        Fri, 19 Dec 2025 13:45:47 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:5874:79f3:80da:a7a3? ([2a00:79e0:2e7c:8:5874:79f3:80da:a7a3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fe99410sm10260116eec.2.2025.12.19.13.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 13:45:46 -0800 (PST)
Message-ID: <ae957ee5-cb47-433f-b0b3-f4ac8ec7116b@gmail.com>
Date: Fri, 19 Dec 2025 14:45:45 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Bart Van Assche <bart.vanassche@gmail.com>
Subject: Re: [PATCH v5 08/36] locking/rwlock, spinlock: Support Clang's
 context analysis
To: Peter Zijlstra <peterz@infradead.org>, Marco Elver <elver@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>,
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
 <20251219154418.3592607-9-elver@google.com>
 <17723ae6-9611-4731-905c-60dab9fb7102@acm.org>
 <CANpmjNO0B_BBse12kAobCRBK0D2pKkSu7pKa5LQAbdzBZa2xcw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANpmjNO0B_BBse12kAobCRBK0D2pKkSu7pKa5LQAbdzBZa2xcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/19/25 1:02 PM, Marco Elver wrote:
> On Fri, 19 Dec 2025 at 21:26, Bart Van Assche <bvanassche@acm.org> wrote:
>> On 12/19/25 7:39 AM, Marco Elver wrote:
>>> - extern void do_raw_read_lock(rwlock_t *lock) __acquires(lock);
>>> + extern void do_raw_read_lock(rwlock_t *lock) __acquires_shared(lock);
>>
>> Given the "one change per patch" rule, shouldn't the annotation fixes
>> for rwlock operations be moved into a separate patch?
>>
>>> -typedef struct {
>>> +context_lock_struct(rwlock) {
>>>        arch_rwlock_t raw_lock;
>>>    #ifdef CONFIG_DEBUG_SPINLOCK
>>>        unsigned int magic, owner_cpu;
>>> @@ -31,7 +31,8 @@ typedef struct {
>>>    #ifdef CONFIG_DEBUG_LOCK_ALLOC
>>>        struct lockdep_map dep_map;
>>>    #endif
>>> -} rwlock_t;
>>> +};
>>> +typedef struct rwlock rwlock_t;
>>
>> This change introduces a new globally visible "struct rwlock". Although
>> I haven't found any existing "struct rwlock" definitions, maybe it's a
>> good idea to use a more unique name instead.
> 
> This doesn't actually introduce a new globally visible "struct
> rwlock", it's already the case before.
> An inlined struct definition in a typedef is available by its struct
> name, so this is not introducing a new name
> (https://godbolt.org/z/Y1jf66e1M).

Please take another look. The godbolt example follows the pattern
"typedef struct name { ... } name_t;". The "name" part is missing from
the rwlock_t definition. This is why I wrote that the above code
introduces a new global struct name.

Bart.
