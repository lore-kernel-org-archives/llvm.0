Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B363D339844
	for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 21:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766180299; cv=none; b=AenSAq6ehGbb+zR4OvDQss1wyEWG8/KUkBshDkRyg6VRb/b0I4iGv60kvfIJpWDfMOfq8mxY6g1ukTU0glmxjimbIo7pg1mNuO6EHtYvV+s2V0QasAQwxmJ0vpvwMtsNDuBGVLv7UViiNmx/OUTqR71gfbLG/1kg9LGADkQhb+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766180299; c=relaxed/simple;
	bh=SBHXkRgMesGUJGSlI+YkckhHJhyJOUbeeY6s/H5FeUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r7HgIs7EHU1emPMsDMuz6qHeUfHbTlAlhQVn35K61XyqzH4JoMc3jSo0dsdO7pG8ayLOYKCgLRZJRCsi2t8Oxk+vvuELgqvs18VJFghhaSlIil2D1XuKAJOIpLRZlPtprfBINX7A7gpCNab7t7TVB60c7p3KddAitk9xdwNhwn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eaUfzkRh; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eaUfzkRh"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-34c84dc332cso1880908a91.0
        for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 13:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766180296; x=1766785096; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SBHXkRgMesGUJGSlI+YkckhHJhyJOUbeeY6s/H5FeUc=;
        b=eaUfzkRhCpIpudgs4lZLIy6HHDxVT8Tmb9XEL+9j68uNfloyWSz2eGdRVpDcUOpcQP
         JtGxT0G4tRzwOyN5KFdLwlJq1+OjYgsT1JJH2zYs16tpujGEFJVfFOWkvpJJf4TXgZh0
         y0QNo623IJnLfk8/4dIbdtpxQ7TE9XJ3qPDovLqts5JOXrIQOEhrcgesL81L8q6Jkz3+
         A4S6ZaJ84KIMhpkgloGR5P6nf1xjZWl3qy47Z4VsY7zJNbWIfP6CnuXEwh6n3qAi/wme
         e1/DQDVhQEfqXZ29k0XdvqKEsbTq4zmii1yxRugIgvk02/80+K+pJOEYLn4+6scp03Ge
         2GZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766180296; x=1766785096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SBHXkRgMesGUJGSlI+YkckhHJhyJOUbeeY6s/H5FeUc=;
        b=svUzfwEL7rUGRaOCOuxdgpSiex0fiJwbp1VikBiDyjZrEzgbcKNnUcjvU/tcJEfJZE
         xtBGo4l/tq/7faIgChnt1BfRToK3fMB54PeOtLqtAFmLATe/nVCeWZfFv1sm26hobSv7
         q7jyhKfKd+MlDw3MFDaoutjuTbma4X8NL8syXMSCEU+RypIqSzj57Q9McFlbHQ5DAZbv
         Hw/o1GdRNkCcwfrsCeOCptoBsyqwxTd45k+/9iNOTGzmkAX6jXxRP01KJQix8eCyfx4r
         dS7FHOX2lSQBjCJFW5fT6ch/WN53qpCbVkU3yhRBYC4gQ3nw8qtZbpt9vX26jZcIsBub
         JEkg==
X-Forwarded-Encrypted: i=1; AJvYcCVaJomyNqZAi3/IC7lOpMmn99shQuPxYhNbiM5Oc2RgeG2nt9XKOnidPaBdzj2LAIn6saY0@lists.linux.dev
X-Gm-Message-State: AOJu0YyQvUXvkHgKEDrwjpzjXPj3JN+pBK/wLzRbiKor3M42Kc/LpQ7V
	KVQLHK9CYlMLxAASF5ZwAQ6WErFmXqK6i5+jGFGAVclm7q10QloFHUmH
X-Gm-Gg: AY/fxX6VUDAE5X5XcT7WEcC6o8Z6y63CKCc/cBnk6Hq8EwgORpCpxrSsLBPfqODTcYU
	7KwW0WVbBNXsj4R/qydj6RyAOLItmvcs8lR/Hu2LhJyB2SoIuA8Yn9M7yWpMvSQ1MPHua6REKxX
	4uY6O1CCqOv5Cvrxpq38IhgdTfRA+wh5DEc6saYnd/rnZaCpHElkeCclgDyPw8/y5q7KA+JHhvR
	kA9Ly42q0YLXnRJGhjO7CiIykfdnt/FcoSwQZFuU4e6Qr0Fgh1rsY3EooPDw5MY7UmpymjWgS4I
	Vfh/4GW94MKV1bGZCSMpcDG60LiRe/iWIMcN2A8XEOYCVn631ZTxBR23GYzyOQKxVXkmHvejmDT
	+/Omyxx05f8hRwG+8e3o5BqUr2BMA/mHa+FBMSsBn/JFyZ0vHarJcjj3P9lHiGKmNo2pgKNtj/Q
	SSzbJhjOyI1XSFnki4+mSWPtKEVGRgUOUBIuCJxt6hyeO6GHMlWI67t5o0vV1ZTU7GLmpLwrYCs
	iwX4I3v6e32xAiN3LxVNtE6By93OhJyzCzDU7R8HfsiTiGUr9/W0VqPpF3GNUpW0d3Y9a1ymC4L
	OEo=
X-Google-Smtp-Source: AGHT+IGivulZwqOvq9TkwT/0JBobQprm3JRJ6VtJUw4ydSXEmlT/iKTWxEeMw8/Q4ZWRYLdEwZEKQQ==
X-Received: by 2002:a05:7022:e0c:b0:11a:f5e0:dc8 with SMTP id a92af1059eb24-121722f462emr3455845c88.28.1766180295388;
        Fri, 19 Dec 2025 13:38:15 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:5874:79f3:80da:a7a3? ([2a00:79e0:2e7c:8:5874:79f3:80da:a7a3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfd95sm12051531c88.1.2025.12.19.13.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 13:38:14 -0800 (PST)
Message-ID: <34cda24f-acdc-4049-9869-b666b08897d9@gmail.com>
Date: Fri, 19 Dec 2025 14:38:12 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/36] compiler-context-analysis: Remove Sparse support
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
 <20251219154418.3592607-24-elver@google.com>
Content-Language: en-US
From: Bart Van Assche <bart.vanassche@gmail.com>
In-Reply-To: <20251219154418.3592607-24-elver@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/19/25 8:40 AM, Marco Elver wrote:
> Remove Sparse support as discussed at [1].

Kernel patch descriptions should be self-contained. In other words, the
conclusion from [1] should be summarized in the patch description
instead of only referring to that discussion with a hyperlink.

Thanks,

Bart.
