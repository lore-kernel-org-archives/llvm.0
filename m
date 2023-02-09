Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC57863A
	for <llvm@lists.linux.dev>; Thu,  9 Feb 2023 05:32:18 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id j23so673442wra.0
        for <llvm@lists.linux.dev>; Wed, 08 Feb 2023 21:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w6z3lxwnln7Ypie34pRxdCgfXQDUlJU7iUw2s4xeNCQ=;
        b=hbv+iUmy8sb7UTevXZXSzxz4aaIUDG/plNczLQrgAbId4wPVrQ+MkUcq3aY+CY5S+3
         rjawt/atll9AOMzPTfCwmorE8mJ0IW4ExC+pOffnmttwon2NgCXsQXAHNH70+CqH4Yet
         b6oLh+gnKxDrXWJ+sVkEhlEAuMsgo82g7kQbD0bRtom8ONxlwBf6CsHrI8kEQQPSr8cE
         02FslNpxxsQJnKXlRV77g9pOv1nepBqVy0+lQY1q5jHCyV3MZ1/poYrNBSof/aw2ifvB
         XBsmv3sQsOevFgU/eI4a8Lch+EluHrUqqffry2uORieqI42qXv+KNAZGRuXumHYaK8Mh
         FeiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w6z3lxwnln7Ypie34pRxdCgfXQDUlJU7iUw2s4xeNCQ=;
        b=SMdmsfoX5sb3bAzyiq913Z/zCFv58Qe1WVn9m5dOISrWY16lscjMg/y4Mo95d3MGKC
         HCuTOyac5/K0C20eR3vmufyRqoefmqsmtE0B7suFPkMtziboO2wVwmj/T4xapj3CC2Od
         w/Wte7FDl54yMPN/5MhQdZeeeOu29vpIVPwTs7RiyXq11hzALVKlcWO9Ui92jfWhtGME
         YcfrSV6ccy5lUTxI5E4Zt6pry5Uu4xP7FbtlWXLSxNoDiEw3A1K98HQZt/P/rBIV84Ky
         HpdESCnQo+VHDr1fejs4+K+JRmgEXJQU5vmMQvIq88uaFPWmc/t7WIEhJIA5k991E+LD
         oZ6g==
X-Gm-Message-State: AO0yUKVDWMSfYY2+zFo46ChPlde12gEMzdBvD5AIQV44cOiSDYcPbEyX
	LUpmyNkHQzLflMdXv0/ZZN+LLVkAkBg0YryafjgUTA==
X-Google-Smtp-Source: AK7set9YGa7NCNq2wHzwRqe7rRW1StB4rmp4kgxLGJELsL8k4ez/VaGVQujKbNDfKlqQkG5awGCGVr1ELO1GQ8rpFMA=
X-Received: by 2002:a5d:4247:0:b0:2bf:b264:6bf7 with SMTP id
 s7-20020a5d4247000000b002bfb2646bf7mr251486wrr.427.1675920736829; Wed, 08 Feb
 2023 21:32:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221219055431.22596-1-ashimida.1990@gmail.com>
In-Reply-To: <20221219055431.22596-1-ashimida.1990@gmail.com>
From: Peter Collingbourne <pcc@google.com>
Date: Wed, 8 Feb 2023 21:32:03 -0800
Message-ID: <CAMn1gO6hwaSDCqigwoH981ffVbU8OvgJhrGh997kGseCSbpAJA@mail.gmail.com>
Subject: Re: [RFC/RFT 0/3] Add compiler support for Control Flow Integrity
To: Dan Li <ashimida.1990@gmail.com>
Cc: gcc-patches@gcc.gnu.org, Richard Sandiford <richard.sandiford@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, 
	Nick Desaulniers <ndesaulniers@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>, 
	Marco Elver <elver@google.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Song Liu <song@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Uros Bizjak <ubizjak@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Juergen Gross <jgross@suse.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Borislav Petkov <bp@suse.de>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Aaron Tomlin <atomlin@redhat.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Yuntao Wang <ytcoode@gmail.com>, 
	Changbin Du <changbin.du@intel.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 18, 2022 at 10:06 PM Dan Li <ashimida.1990@gmail.com> wrote:
>
> This series of patches is mainly used to support the control flow
> integrity protection of the linux kernel [1], which is similar to
> -fsanitize=kcfi in clang 16.0 [2,3].
>
> I hope that this feature will also support user-mode CFI in the
> future (at least for developers who can recompile the runtime),
> so I use -fsanitize=cfi as a compilation option here.

Please don't. The various CFI-related build flags are confusing enough
without also having this inconsistency between Clang and GCC.

Peter
