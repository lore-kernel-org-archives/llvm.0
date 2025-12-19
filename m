Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035A025487B
	for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 21:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766180563; cv=none; b=Smvafi9Rfo7aA8kU9ETcrXDaeeDn5tRHlCx2xX/NfCpgpwKaDR/IF1MbEEx83KtnvsR6ZP07q8rBUrzVkLheccTuxTS+uJ/ULuTjcGuz4BHHdMmUnknYBNvA4oZhsJn/9uOqp4gNBkOwdOe2X/4iD50vFnnUp1NyI1un+3sGctw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766180563; c=relaxed/simple;
	bh=XXvUIRo6jJ9ogO2QQaUCxttK8WosB2XGObI8UYH72+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lRohO8EhladWpIvXj7P2SapDOGAkrYYv1E/cS7u+8JUOx1YR4kK871jBTNsEIhddwvJrYRiesYL7y/oJhX0DswVpH43qLwAmIyg6iu0Pr1u00ukb6SzlIfyH1rBbSgGj4Sqerk3/wjeqVZTAMV6/imoTSOMo1No0PquoGT0Rkk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kh7w7pKJ; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kh7w7pKJ"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2a0c20ee83dso27393225ad.2
        for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 13:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766180561; x=1766785361; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xhB1Fco/aAscGV7BUmHv+KRyMsa6iylEkhRycjuIJTw=;
        b=Kh7w7pKJJWu7Th7HJKxlGLR3zQ3Tzxd5qDv+lHXHhwhAKpxgWAcKRSzdSfGn37z9Fv
         mFEYWYk2Nl3S7FKyatVe0s2hd71vs866h3a4fhPLyMhL+KFvs8QQk+2UmBzeH+OjalHc
         MHNH95ZN8ZsFIj5cxuFI64BQIcO0rDy9XWZl1Pa6hV4f/+jcOLoSKIv2I1hlmjPY+nLW
         GLnct4j11pvA1dzTyUDzHzLm0DUvPzr+F/ff0SKXS/iT8W4x4PPOC7tfpJvloyOILjQ0
         bPtL4UfLGye9MR8F4S3xgoJvcRFPUZLeHzwNRHclp9lJL6dbmVb+KPQWc4Iio6oPNITj
         zqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766180561; x=1766785361;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhB1Fco/aAscGV7BUmHv+KRyMsa6iylEkhRycjuIJTw=;
        b=ir+BGrRWygek5w4TB1flzUWrsuoSlKLvs21lGkiKYLrwZKh+w6Ab5M8fiIzn5XXcVh
         czoeLLgmmBT7zfrbTYWfXfvmtQDuAwNA40TOp2he/wob6K2rJ4arQPlO99CLVgi0DwMo
         C7s55ee3l2AS05OEDFvrE3maJ0/g39oHLKtp6NvMk/AjWU3VnyiqXkbsvdOV7mGZeavH
         A1lxKkdDSLsPayd5fpdoMtW/UCL7cI9JEq6o0lNA5e7W2wPNFaqrdFsuZjfEVnYq8JsR
         +z2Vi+yHqa1racZyRVO9ErKN5+NNVo6w3Jg/Sm+dTaXsdTnKJhd9AkMa0/tltVsGVrB3
         x9hQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJAJ/H7osXVNVJ3KnHa0F+LH6ja1FUI6b3xl6hqHIpMewP/+Dl6v80fTBZIK3cs9prjOHX@lists.linux.dev
X-Gm-Message-State: AOJu0YyOE3Q5NiJzkgP2h8FTQvKI73F0y6cakcuQ48LBiJwTUdRgrgTa
	adi0F8uzWqHjvLm7qYKS0oOcwp2qLH++xH4lBtKXVqHAttUUPwvV4h8T
X-Gm-Gg: AY/fxX7AHuYxf3qf2Jr427Vw8oBxI/bnaDL0tz6bLwnTcaj/C3+DF+QyMa1v3ourRTT
	TZT7/QCFZAzCcLPO1Tr/oqrLVVj9r7dEcoGgsrga1xZwiKt/mHkNSsHEQ39tIkE3SrL5Kfy4Hn4
	vcT57W6e5ENT6x6IUtevkmXQBoEPaYAZIElhm7FD7Pgs0p11J21BkHvvXZceIdaj9iCu8F8Ucgz
	gCo7NF4kPKC7V+GqVqCOKN36EiZMLgqzbK3QWIThxKU8NhC5moJ3fOnggnn182OBY7QmLlnY2eZ
	T1WNzWmcrFXdI6P9vZrMrydS4eOaOUzUwO5peAEDFiMAE0Yy8qYFX1iYVy27Ppw63s16iZ95LNc
	qGwdKhRHExm/a7c5tKMCcDxFmS0jGc2fX+ktjoXRUnyJaj1lVtI0IaDOFVLZr1Okn/o4BPAn6Wg
	IfGcC4U6X3KoK9pqql9Rf1a2/9XyEkttM1eKZXRwYbc+1EGUcjN0kcCwBSi5pr/t6LSyF5q29+D
	Ke/DQ/HWGt2Cg4tuTYrj6rhR/Z99LYdo/VhvqD/qexgSb7W5gqHnqW9jVVJfOdwCawCqoiqAHaY
	83U=
X-Google-Smtp-Source: AGHT+IGTM6mjPPfNhqA9HPe48U2bDECheHzAzGuJpcTxojW/wC3VfdWLu4jNEE4Msq7vw7t+QoPUtw==
X-Received: by 2002:a05:7022:62a9:b0:11b:78e6:8323 with SMTP id a92af1059eb24-121722fd212mr4438541c88.37.1766180561251;
        Fri, 19 Dec 2025 13:42:41 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:5874:79f3:80da:a7a3? ([2a00:79e0:2e7c:8:5874:79f3:80da:a7a3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254c734sm11636083c88.13.2025.12.19.13.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 13:42:40 -0800 (PST)
Message-ID: <9af0d949-45f5-45cd-b49d-d45d53f5d8f6@gmail.com>
Date: Fri, 19 Dec 2025 14:42:38 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 24/36] compiler-context-analysis: Remove __cond_lock()
 function-like helper
To: Marco Elver <elver@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Will Deacon <will@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
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
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Thomas Gleixner <tglx@linutronix.de>, Thomas Graf <tgraf@suug.ch>,
 Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>,
 kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
References: <20251219154418.3592607-1-elver@google.com>
 <20251219154418.3592607-25-elver@google.com>
Content-Language: en-US
From: Bart Van Assche <bart.vanassche@gmail.com>
In-Reply-To: <20251219154418.3592607-25-elver@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/19/25 8:40 AM, Marco Elver wrote:
>   Documentation/dev-tools/context-analysis.rst  |  2 -
>   Documentation/mm/process_addrs.rst            |  6 +-
>   .../net/wireless/intel/iwlwifi/iwl-trans.c    |  4 +-
>   .../net/wireless/intel/iwlwifi/iwl-trans.h    |  6 +-
>   .../intel/iwlwifi/pcie/gen1_2/internal.h      |  5 +-
>   .../intel/iwlwifi/pcie/gen1_2/trans.c         |  4 +-
>   include/linux/compiler-context-analysis.h     | 31 ----------
>   include/linux/lockref.h                       |  4 +-
>   include/linux/mm.h                            | 33 ++--------
>   include/linux/rwlock.h                        | 11 +---
>   include/linux/rwlock_api_smp.h                | 14 ++++-
>   include/linux/rwlock_rt.h                     | 21 ++++---
>   include/linux/sched/signal.h                  | 14 +----
>   include/linux/spinlock.h                      | 45 +++++---------
>   include/linux/spinlock_api_smp.h              | 20 ++++++
>   include/linux/spinlock_api_up.h               | 61 ++++++++++++++++---
>   include/linux/spinlock_rt.h                   | 26 ++++----
>   kernel/signal.c                               |  4 +-
>   kernel/time/posix-timers.c                    | 13 +---
>   lib/dec_and_lock.c                            |  8 +--
>   lib/lockref.c                                 |  1 -
>   mm/memory.c                                   |  4 +-
>   mm/pgtable-generic.c                          | 19 +++---
>   tools/include/linux/compiler_types.h          |  2 -

This patch should be split into one patch per subsystem or driver.
E.g. one patch for the iwlwifi driver, another patch for the mm
subsystem, one patch for the rwlock primitive, one patch for the
spinlock primitive, etc.

The tools/include/linux/compiler_types.h change probably should be
left out because it is user space code instead of kernel code and
the rest of the series applies to kernel code only.

Thanks,

Bart.
