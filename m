Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338EA7E
	for <llvm@lists.linux.dev>; Wed,  7 Sep 2022 02:36:59 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id t14so10911167wrx.8
        for <llvm@lists.linux.dev>; Tue, 06 Sep 2022 19:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=JGQk4Yytf6Zg4zT4gEe/PL2ZkzZ8fPqkUsY9qVM+pqs=;
        b=RbYSUwdDs2C68JbvIHxEXs2vUhp1qhiqoa4K/9IEZcZonH3tlSWdevFewCl22OlVDS
         5aQxIEpvxo7MQfQuTxDjyq/vIFITZWPawPLV2tqEM+NS73R4MEuESsG8QQjvTELCnnDI
         f/fbQDc6sPrGu3BX2TPwjq5fZH3Hkxm57BdLCN+vJbKgTPDnEh0ui39pcfGGQl2uKlPQ
         SCstofc0gxWJc07XVhSNvl27saMWn2qfqpc7YhXJOmMYe+ac+IIg08XGNirQ/hx/xLA9
         ElMUMPoONnipjWdoorq49p0aYn0ucwAWu82x8w1DcplDou/pOulAYciYHk3fK4gWNOIM
         Fe/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=JGQk4Yytf6Zg4zT4gEe/PL2ZkzZ8fPqkUsY9qVM+pqs=;
        b=51WZf4PUxHXJ0Pzberp4c2iDeHIWtTyqw8K3npl567ekdtqACdCF7yuCF399bzIb1L
         Scpia2ceewH1VQisIf3jgBCXy2aVXVZEOsXvJypjr1ARgoUgjQ8HIDHePQgnTmFGYHLk
         8qC+5ctu6sPNMX0mMimSH98WXAxJ1cr9hLq+y4bDAvRdWtCM4ThqD/FJx0tgkfHQSt2S
         zy7qlP+J5Fdj+yBjQS64ojdsR05MABStrJx411jZ7DU1gIF2rtqzvReRLtwkLoGuoVhA
         IB52LBBj1VyoaI//vaC1wORTxjRrW8XDSXfVMp6cH5hhu0tdkC7E7g2b37mn0gxgirha
         DHNg==
X-Gm-Message-State: ACgBeo0rBrF8rMF6syUSB4ym5KS9GmbxsU9kol+2BXYIcJtzNmLswkQL
	FWF7FuJbGmOFS9vYnEhumtjisW48b6UI6kGr37ImEg==
X-Google-Smtp-Source: AA6agR6ZHmV5opBNE6+QYR8MCxikmETVbfAhDyULrVR6PaJX8J7kUYKWe3MS1oGyiPTUmdDCEW8xNpH+HI1qsoLZrZs=
X-Received: by 2002:a5d:6084:0:b0:228:67c1:e160 with SMTP id
 w4-20020a5d6084000000b0022867c1e160mr597899wrt.83.1662518217295; Tue, 06 Sep
 2022 19:36:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220902204351.2521805-1-keescook@chromium.org> <20220902204351.2521805-2-keescook@chromium.org>
In-Reply-To: <20220902204351.2521805-2-keescook@chromium.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 6 Sep 2022 19:36:46 -0700
Message-ID: <CAKwvOdmeaUQYkd9kZPgwK0kK5BRxFi8aszyFzw8TA4JFF6y8EQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] fortify: Fix __compiletime_strlen() under UBSAN_BOUNDS_LOCAL
To: Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, David Gow <davidgow@google.com>, 
	Yury Norov <yury.norov@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Sander Vanheule <sander@svanheule.net>, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Dan Williams <dan.j.williams@intel.com>, 
	Isabella Basso <isabbasso@riseup.net>, Eric Dumazet <edumazet@google.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Eric Biggers <ebiggers@google.com>, 
	Hannes Reinecke <hare@suse.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 2, 2022 at 1:43 PM Kees Cook <keescook@chromium.org> wrote:
>
> Co-developed-by: Nick Desaulniers <ndesaulniers@google.com>

That's overly generous of you!

Anyways, the disassembly LGTM and the bot also came back green.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Android Treehugger Robot
Link: https://android-review.googlesource.com/c/kernel/common/+/2206839

Another thought, Nikita suggested that you could also compare mode 1 vs mode 3:
https://github.com/llvm/llvm-project/issues/57510#issuecomment-1235126343

That said, since mode 3 returns 0 for "unknown" I'd imagine that
wouldn't be pretty since it wouldn't be a direct comparison against
__p_size.

Thanks again for the patch!

> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  include/linux/fortify-string.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/fortify-string.h b/include/linux/fortify-string.h
> index eed2119b23c5..07d5d1921eff 100644
> --- a/include/linux/fortify-string.h
> +++ b/include/linux/fortify-string.h
> @@ -19,7 +19,8 @@ void __write_overflow_field(size_t avail, size_t wanted) __compiletime_warning("
>         unsigned char *__p = (unsigned char *)(p);              \
>         size_t __ret = (size_t)-1;                              \
>         size_t __p_size = __builtin_object_size(p, 1);          \
> -       if (__p_size != (size_t)-1) {                           \
> +       if (__p_size != (size_t)-1 &&                           \
> +           __builtin_constant_p(*__p)) {                       \
>                 size_t __p_len = __p_size - 1;                  \
>                 if (__builtin_constant_p(__p[__p_len]) &&       \
>                     __p[__p_len] == '\0')                       \
> --
> 2.34.1
>


-- 
Thanks,
~Nick Desaulniers
