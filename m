Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89F86102
	for <llvm@lists.linux.dev>; Fri, 21 Oct 2022 17:39:51 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id b12so8608852edd.6
        for <llvm@lists.linux.dev>; Fri, 21 Oct 2022 10:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jf/Eb/CewThpJ/hWTbFyMXRlobZKi0EOll0w249IASg=;
        b=FjP2s6nGxVS8vSbGwtA3KWSHKhXX8uLMMdG+La4JzzyBHW4NHjGGaQnizz3lVooFie
         IzVyvdcrTpQendS3OohqZkGPSatE52FV8Ug+S6d6WNP+VoYS8NVpX4vfrcaeZpOld4y+
         CQDkL7FZGdYjOHxLKjFVRrTIaoYWXb/oBNAPCs6g0/zbE8cdMQTsd8PQAr/o7ND2yytX
         D9Q4/uv6BI89n2p7DXRIFEsAY9SlP4uayCt2MSuUx+emK3UPqMfmc1EQ4zGSadbIfkfi
         ULPEiSeiXEQhHFkkNtAyJB9I9WPzMLs+d3pfqQIxO+nUVeFrnO6wtr8CMsv1zCns2h5l
         jtNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jf/Eb/CewThpJ/hWTbFyMXRlobZKi0EOll0w249IASg=;
        b=6EuY9WD/py30SIwtyC2O+hUfn4ci5VxuBSoEJOF/aIkyQFr4l++OeN6NmKDOySGSbu
         JsYpCPHMFW6tYm2jBkwTUKhpIf08ydwCddT5GztLKym0cJtRNaCssejGjA+KmcdzLF1D
         MVVqtqrGV7aqmoB8n64KYw1IUGtTegW/ce2yQb+KAFdr8q5AAL1ATXOfd6dbgB8Bem+G
         uX1b3u6rL/0Z75cg7oay8UDbr0yVhNhItFjpi93M1CTmDHL30mHkytVzC1HEuzA/8O16
         AZ67E+tj/BPQ+cirZECS5o7WbE2y5oS5hXKk2pKYm31Wgc2hozTJnI4VsjYSlWKOkw08
         Kefg==
X-Gm-Message-State: ACrzQf2uviFDa04L0lLx1AiPwaU8egb6kVS3rrsEi7TMdrMQbGodGvtj
	y6h5CF5AuxnHmD4Q6aq1sv4sF5UbP+Mbo9Kv5dx4vA==
X-Google-Smtp-Source: AMsMyM5vRLF1pjmsZkk6dWKKdTQUxxi+xL34Z05v4VMrgP/GcxHM3uShCJNvXK4HE4rhr9H9xKahQA33esiY3op/I/g=
X-Received: by 2002:a17:907:3f1e:b0:78d:f198:fd00 with SMTP id
 hq30-20020a1709073f1e00b0078df198fd00mr16066742ejc.730.1666373989777; Fri, 21
 Oct 2022 10:39:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y1LBGZPMfCZ8A1bl@FVFF77S0Q05N>
In-Reply-To: <Y1LBGZPMfCZ8A1bl@FVFF77S0Q05N>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 21 Oct 2022 10:39:13 -0700
Message-ID: <CABCJKuf=OB_3ZR_rwaG3H5kHKmTTDk+sihjJXYmyWgZjUX2yTQ@mail.gmail.com>
Subject: Re: kCFI && patchable-function-entry=M,N
To: Mark Rutland <mark.rutland@arm.com>, Fangrui Song <maskray@google.com>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Joao Moreira <joao@overdrivepizza.com>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 21, 2022 at 8:56 AM Mark Rutland <mark.rutland@arm.com> wrote:
>
> Hi,
>
> For arm64, I'd like to use -fatchable-function-entry=M,N (where N > 0), for our
> ftrace implementation, which instruments *some* but not all functions.
> Unfortuntately, this doesn't play nicely with -fsanitize=kcfi, as instrumented
> and non-instrumented functions don't agree on where the type hash should live
> relative to the function entry point, making them incompatible with one another.

Yes, the current implementation assumes that if prefix nops are used,
all functions have the same number of them.

> Is there any mechanism today that we could use to solve this, or could we
> extend clang to have some options to control this behaviour?

I don't think there's a mechanism to work around the issue right now,
but we could just change where the hash is emitted on arm64.

> It would also be helpful to have a symbol before both the hash and pre-function
> NOPs so that we can filter those out of probes patching (I see that x86 does
> this with the __cfi_function symbol).

Adding a symbol before the hash isn't a problem, but if we move the
hash and want the symbol to be placed before the prefix nops as well,
we might need a flag to control this. Fangrui, what do you think?

Sami
