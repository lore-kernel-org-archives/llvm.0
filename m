Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE42626
	for <llvm@lists.linux.dev>; Thu, 13 Apr 2023 17:04:14 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id f2so7240024pjs.3
        for <llvm@lists.linux.dev>; Thu, 13 Apr 2023 10:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681405454; x=1683997454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ccsEwv5oO7NDzmy7DI9h+6ldasNA+QD8FggJsRLsgZk=;
        b=taQlQ7g87EtETw7950+oGC++35BjVH5z2ygGlMMbTo5I7kDps9cXFqUloS7mUgBPth
         di55++ydNmblfUOhmk6Mf0ZCpCc0mg7Vf6yYQEQso89+hO+DKYcj2CoCTaIJIn2Ue3HO
         //xsWAhOf3MiEmH9CtufeOoszfiO02siNSMA9WvEfdVh/fcgRPIFebc6BJPK1WkgL3tP
         87y3YtPmFMfzYiYYqk1EBz0a2F3HU71Xqg/99WsL1W85upYH9GyW5rt4Q6q7PQ2hqU9Z
         1mGZ4HIyPU+it7CmDLMyrPIXqht0YEywvU8X36Fw7a9okB6fZv/g78cDMlXq5Qn95K0W
         G4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681405454; x=1683997454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccsEwv5oO7NDzmy7DI9h+6ldasNA+QD8FggJsRLsgZk=;
        b=KRc0y1D80EOutm8/TBAJkHs+bAv5P72oiZcfZJks2jBxOeulGZkLPo5rSzsG6bP33K
         0x0qK8wdrFnmtk3XS8ZnH5hBrsITBPJ6uUnWzUCBk4IEl3kmJ9JzA14HmQO7bx7Cax/2
         CQmiGVjPT1AaCpBwebtGdUH+1fRX0ZBfrk0VZMmYQ/Z4XPda/yZQ8yxUqy0sNY68/9nx
         x8AdAoiUhk3fxXyqI3UgWTFq5CTQx83AkvErK3PflgcrMOFyYjxyH8HsuRmzBnB4Z8xd
         d0LQWtCybB2+tAiG5zlOcAQ5zd7R3jgPxva+gTPmXDiRJfbeZQ0JoNb9LC00YwxOP/al
         NeJA==
X-Gm-Message-State: AAQBX9dJdALq2r6RAzIC6VVhYPC30PCapcbItKsrGGmz12Z6N+hkfdUL
	ssAa51WMn9ic981jaO3tiiZnJg==
X-Google-Smtp-Source: AKy350b5uuL0C5Q4CRc+UyiuAgC6hHLZveLsP2IeaUlDAnqKlR0imLdZbqrkBwYOC8ijNZ09PqI46Q==
X-Received: by 2002:a05:6a20:66a1:b0:ea:fb53:4cb1 with SMTP id o33-20020a056a2066a100b000eafb534cb1mr2743042pzh.41.1681405453405;
        Thu, 13 Apr 2023 10:04:13 -0700 (PDT)
Received: from google.com ([2620:15c:2d1:203:fde9:d34:5ee3:d2e8])
        by smtp.gmail.com with ESMTPSA id l15-20020a654c4f000000b0051a3c744256sm1618060pgr.93.2023.04.13.10.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 10:04:12 -0700 (PDT)
Date: Thu, 13 Apr 2023 10:04:05 -0700
From: Nick Desaulniers <ndesaulniers@google.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: madvenka@linux.microsoft.com, jpoimboe@redhat.com, peterz@infradead.org,
	chenzhongjin@huawei.com, broonie@kernel.org,
	nobuta.keiya@fujitsu.com, sjitindarsingh@gmail.com,
	catalin.marinas@arm.com, will@kernel.org,
	jamorris@linux.microsoft.com, linux-arm-kernel@lists.infradead.org,
	live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
Subject: Re: [RFC PATCH v3 00/22] arm64: livepatch: Use ORC for dynamic frame
 pointer validation
Message-ID: <ZDg2BUL4uauG/w4T@google.com>
References: <0337266cf19f4c98388e3f6d09f590d9de258dc7>
 <20230202074036.507249-1-madvenka@linux.microsoft.com>
 <ZByJmnc/XDcqQwoZ@FVFF77S0Q05N.cambridge.arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZByJmnc/XDcqQwoZ@FVFF77S0Q05N.cambridge.arm.com>

On Thu, Mar 23, 2023 at 05:17:14PM +0000, Mark Rutland wrote:
> Hi Madhavan,
> 
> At a high-level, I think this still falls afoul of our desire to not reverse
> engineer control flow from the binary, and so I do not think this is the right
> approach. I've expanded a bit on that below.
> 
> I do think it would be nice to have *some* of the objtool changes, as I do
> think we will want to use objtool for some things in future (e.g. some
> build-time binary patching such as table sorting).
> 
> > Problem
> > =======
> > 
> > Objtool is complex and highly architecture-dependent. There are a lot of
> > different checks in objtool that all of the code in the kernel must pass
> > before livepatch can be enabled. If a check fails, it must be corrected
> > before we can proceed. Sometimes, the kernel code needs to be fixed.
> > Sometimes, it is a compiler bug that needs to be fixed. The challenge is
> > also to prove that all the work is complete for an architecture.
> > 
> > As such, it presents a great challenge to enable livepatch for an
> > architecture.
> 
> There's a more fundamental issue here in that objtool has to reverse-engineer
> control flow, and so even if the kernel code and compiled code generation is
> *perfect*, it's possible that objtool won't recognise the structure of the
> generated code, and won't be able to reverse-engineer the correct control flow.
> 
> We've seen issues where objtool didn't understand jump tables, so support for
> that got disabled on x86. A key objection from the arm64 side is that we don't
> want to disable compile code generation strategies like this. Further, as
> compiles evolve, their code generation strategies will change, and it's likely
> there will be other cases that crop up. This is inherently fragile.
> 
> The key objections from the arm64 side is that we don't want to
> reverse-engineer details from the binary, as this is complex, fragile, and
> unstable. This is why we've previously suggested that we should work with
> compiler folk to get what we need.

> This still requires reverse-engineering the forward-edge control flow in order
> to compute those offets, so the same objections apply with this approach. I do
> not think this is the right approach.
> 
> I would *strongly* prefer that we work with compiler folk to get the
> information that we need.

IDK if it's relevant here, but I did see a commit go by to LLVM that
seemed to include such info in a custom ELF section (for the purposes of
improving fuzzing, IIUC). Maybe such an encoding scheme could be tested
to see if it's reliable or usable?
- https://github.com/llvm/llvm-project/commit/3e52c0926c22575d918e7ca8369522b986635cd3
- https://clang.llvm.org/docs/SanitizerCoverage.html#tracing-control-flow

> 
> [...]
> 
> > 		FWIW, I have also compared the CFI I am generating with DWARF
> > 		information that the compiler generates. The CFIs match a
> > 		100% for Clang. In the case of gcc, the comparison fails
> > 		in 1.7% of the cases. I have analyzed those cases and found
> > 		the DWARF information generated by gcc is incorrect. The
> > 		ORC generated by my Objtool is correct.
> 
> 
> Have you reported this to the GCC folk, and can you give any examples?
> I'm sure they would be interested in fixing this, regardless of whether we end
> up using it.

Yeah, at least a bug report is good. "See something, say something."
