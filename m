Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863CA33C532
	for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 21:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766180065; cv=none; b=pAjG4ChXFW2NQxUtKS6oug3egbetfj6L/6KrDUqT/FlMEhlml380kZTyZniiOUuS4xmCbg10dt5H0yv2PmZiRWt5VZ3sxApGqes2RAuoJj4DldGV8pkk+FPgfK5XfRr1cht3LImSdTF9+C8PEYNEfXPiR3Q6DsyLbpPnuiTmRGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766180065; c=relaxed/simple;
	bh=nyd1g6CvIGlrKzYvOsHmwPnVPCn93E0wfS69PVJVpBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SU2YBI0fW8o5tiU0EezEd72uwqifrK69OQ+YRz8AWnrZ25kR0nDdlpZ28qJW1bbAMvxF08JUWFxFXQnDL/H0EcuEmzBRGlrpSmqxllTef82H6Z/rVONU6QW5nyQLr/YLTavj5xVy6OJbaE/4PDuPwK+mJogUrItK19o0/5wRbOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RFAr0qMc; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RFAr0qMc"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-c03ec27c42eso1251993a12.1
        for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 13:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766180063; x=1766784863; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t32XLNtILrSHOTsv1yzEwE7SsXS6lnNnHJdt9fn7tL4=;
        b=RFAr0qMcqcTOKPf4aQkDpW3NVaVHMffGkxxEgw8YJmTIae1G0MCgOBDHbtywW/Kl6B
         cbR6DcTiZxTlsUKonio9U/tvxnwlDnks0J4gfZOv84umWrNnLClMMm5YlYUg9OSbp9oT
         Od6JAwLEadzxF89tyAF7htsILHCFAms2n0UeK8pthzKBDrywQYsmWQAuMHm2eQwF4Our
         od+Is2Txzw5+G7Fl0yDPIJJEJdxNtX/EX/yXuI7sfOq1bmyjxdPqUUAwD8l0pV+3l1Yi
         dWGBstPfc1j0inTH/bVDisHmUrdIJawsyhpfiajV6TCwCOSmOODHfDggEiwB3vx0BzdJ
         U/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766180063; x=1766784863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t32XLNtILrSHOTsv1yzEwE7SsXS6lnNnHJdt9fn7tL4=;
        b=gTEzNX6HkifFLp7ULpREV6CaNv8tA2Qs4xpD4Eobq4dCk6f5KhanfP0eoQUa9AXECk
         nhOpqVfv7jUzm/G6ypeXkMdn0wuQKkCj2Ap0juLH/8GalURjfeAefemsV1/qwFr6MOWf
         CA+eXgGaipC+/EBL6e2IeETQN+TC4Et/sm3TpHpCAa2r/jQRCbK8Tt7kXa7weQEvUJVF
         7cIUl5v20P4RQ8ePaMMj972y08rPYFcJFscS/Vpvoir4yvEJcqV3yGCceH6Oei5QaF+i
         RKxMh4Ymu6IMp5geXV9mTc2+Snt4gSBzl2a5NfQ5oWrNHqhWS2B0QuvNUdE72CjoLpc6
         vU5A==
X-Forwarded-Encrypted: i=1; AJvYcCUEpIXdHDpQkTEyJDj3rXoEwHKoQQsan+Urwby/Pb1tz7ZDmy6NY3Udh1O6hrYxfQAf+76y@lists.linux.dev
X-Gm-Message-State: AOJu0YwQhJDlFxwvFH27Zd6phJJJBgJLE3oK4paL+lNl9CBrj0pksmqB
	fLPJCn5fa2TB6ohoPQP6ubZ10s078XcjVSgPNbvPyCgf6faQr8HeoWus
X-Gm-Gg: AY/fxX616qxRyjLetdDJKz4S3HQ12dzNDdGZVzmKLmuqZpvPPUhbv7dPIncgsORsL1V
	6BLh4ENeEftxLQ6bQ5SwA38T7RIUH9kWFz8G/4d9hW2ERlZnpqAvmUv1dRw9E2uTsUeT8C/u1Ln
	gTI9EcWX3Uph0U85BfmqZOyIYE5ukv/piTOgMxn4DWNbwRTgyel1QIE7RbmOylniaH6bODavYdn
	xBpwa0flAmmAGgmOrgmywh0JSvNZ5harXkkKBn838fGK9X9nY5Ughu+dzlVZMMxqrQ+dg7jmsNj
	BPQ7jKGwy5jmwM6+OmzOfW3Fgfh2tBiTGn62YCANtHYGUQct3+y31tAq8fJa/pq3A2VbbhoUHuK
	tTG28MKgzNWGlGqDFMg9UmvT2oJlqP4b5rlZsAUgbmkydDK0y3q/oRlCGGD+C6CTI+UrJJzc577
	GobSOEjBVu/Gxwz18+zc/EPMuhyXYxblCkWzRTtDCPvr3L534Ee3YFwdmENY42KanQiZBSRU9pH
	Y99n5xvWXe2226MBsqnSgpo2nApCZlUhd4Kx97DF9KOV1hRk9ffcjj1kEFmcuwHbw5taBRS4b1i
	4Bo=
X-Google-Smtp-Source: AGHT+IH/ZQYDLQv8GePcj2Vm99oLZ3hFWnPTlzcp7/sSDr5k1uCEDV2wgPs8dBIcnq4Eb4hflvIUSg==
X-Received: by 2002:a05:7300:b54b:b0:2b0:57ec:d1a1 with SMTP id 5a478bee46e88-2b05ec745e9mr4652797eec.25.1766180062475;
        Fri, 19 Dec 2025 13:34:22 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:5874:79f3:80da:a7a3? ([2a00:79e0:2e7c:8:5874:79f3:80da:a7a3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fe99410sm10155463eec.2.2025.12.19.13.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 13:34:21 -0800 (PST)
Message-ID: <0088cc8c-b395-4659-854f-a6cc5df626ed@gmail.com>
Date: Fri, 19 Dec 2025 14:34:19 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/36] locking/rwlock, spinlock: Support Clang's
 context analysis
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
 <20251219154418.3592607-9-elver@google.com>
 <17723ae6-9611-4731-905c-60dab9fb7102@acm.org>
 <CANpmjNO0B_BBse12kAobCRBK0D2pKkSu7pKa5LQAbdzBZa2xcw@mail.gmail.com>
Content-Language: en-US
From: Bart Van Assche <bart.vanassche@gmail.com>
In-Reply-To: <CANpmjNO0B_BBse12kAobCRBK0D2pKkSu7pKa5LQAbdzBZa2xcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/19/25 2:02 PM, Marco Elver wrote:
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
