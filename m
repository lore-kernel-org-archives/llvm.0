Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FE82F21
	for <llvm@lists.linux.dev>; Fri, 11 Feb 2022 01:20:24 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id u6so13674812lfc.3
        for <llvm@lists.linux.dev>; Thu, 10 Feb 2022 17:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p20Mnkh2w9fHFzqQS240a6Li74kH9AJpNbVo4YqzCTM=;
        b=muUwC1dkv3stGMotFKnvE8Qz9eFh2FcXMX+VRGDLc7hwU3znP5MNvzjTpkRPpsf2dH
         sOFo678SZ/qYn/VDuxWnsMOz0flJtziwoLc8AHdZqr4geurwy+406IjoH+8lc5tiRExY
         E5YJPGkuu+Gk0+v3T9hJXON3IKeHGX7hId+YNJaxWhDJgnL6zYiNGsEU9fkhoPqXOMAq
         DzAa/V5QRL1hFBvunZlxEel3O4n/8KSUuleXNm/4vawDjkXpwGsLf3ogsHdHZc16GkYU
         6bSWH8ISB6Lq7CW55tA9crfpJCRzP9MoRHr4SyPWEKFfG5OmjTxApwXfxSh9gFde80Km
         qGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p20Mnkh2w9fHFzqQS240a6Li74kH9AJpNbVo4YqzCTM=;
        b=B1q3IVPHFvNzuvJaQ+dQG24se9kBodKtYvogYKW5Ut5uuGbwTlrP4pNqf94oX82ZS0
         QrDDFoQoZoViLLb4Sv8/Muy6LZO9uUi7CyYn9snu/qRMo45hUizdUQXFVAuf7VVx6/lx
         IXcpRl0+8/jotnSapne9Y3qSRJss5/hrYZqYGJMOwiCRfJ4vsHUBunzo2y+rOnuCKNX1
         B6lUAiY+503miUW3q3i4crsaUZK20V7EgyOPLoGb8+xXdX6+6dShTzlGauUm777NJ112
         LPUVjdp2DW+/+w5zidyoMaM4YRVwuKeL+YSqndm19ld2DTbA0xsf6feyCT3AL+7JjN2Y
         /oBw==
X-Gm-Message-State: AOAM532ZnibWgq0Cqbi43Gh9Gdk/iv/9WSmd223fpuRmrG9E7DywhI1l
	dDLcpyugSU4piJuVlcQyCUmfRqPpPdUt0kbO2VvlHg==
X-Google-Smtp-Source: ABdhPJxg4mMwdgYMDoe7+u/+SFYFaScNg4KRbuYQdxOANLojmsumlh2QdGPGUC9Qd0iLQOKPq42g0emjDbKZCX2/Zyw=
X-Received: by 2002:ac2:5627:: with SMTP id b7mr7108700lff.489.1644542422012;
 Thu, 10 Feb 2022 17:20:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220125113200.3829108-1-mark.rutland@arm.com>
 <20220125113200.3829108-3-mark.rutland@arm.com> <YgUmvuJYfycnhODA@FVFF77S0Q05N>
In-Reply-To: <YgUmvuJYfycnhODA@FVFF77S0Q05N>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 10 Feb 2022 17:20:10 -0800
Message-ID: <CAKwvOdmWV6AL2RM2SQNYQ7fu3kQwPf+W57LZ_szrfZm2eLtBcw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] linkage: add SYM_{ENTRY,START,END}_AT()
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, acme@redhat.com, 
	ardb@kernel.org, bp@alien8.de, broonie@kernel.org, catalin.marinas@arm.com, 
	dave.hansen@linux.intel.com, jpoimboe@redhat.com, jslaby@suse.cz, 
	linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk, mingo@redhat.com, 
	peterz@infradead.org, tglx@linutronix.de, will@kernel.org, 
	llvm@lists.linux.dev, James Y Knight <jyknight@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 10, 2022 at 6:52 AM Mark Rutland <mark.rutland@arm.com> wrote:
>
> Both GCC and clang are happy to treat labels as constant expressions:
>
> | [mark@lakrids:~/asm-test]% cat test-label.S
> |         .text
> |
> | start:
> |         nop
> | end:
> |
> |         .if (end - start) == 0
> |         .err
> |         .endif
> |
> | [mark@lakrids:~/asm-test]% usekorg 11.1.0 aarch64-linux-gcc -c test-label.S
> | [mark@lakrids:~/asm-test]% usellvm 13.0.0 clang --target=aarch64-linux -c test-label.S
>
> ... but only GCC is happy to treat symbol definitions as constants:
>
> | [mark@lakrids:~/asm-test]% cat test-symbol.S
> |         .text
> |
> | .set start, .;
> |         nop
> | .set end, .;
> |
> |         .if (end - start) == 0
> |         .err
> |         .endif
> |
> | [mark@lakrids:~/asm-test]% usekorg 11.1.0 aarch64-linux-gcc -c test-symbol.S
> | [mark@lakrids:~/asm-test]% usellvm 13.0.0 clang --target=aarch64-linux -c test-symbol.S
> | test-symbol.S:7:6: error: expected absolute expression
> |  .if (end - start) == 0
> |      ^
> | test-symbol.S:8:2: error: .err encountered
> |  .err
> |  ^
>
> This is obviously a behavioural difference, but I'm not sure whether it's
> intentional, or just an artifact of the differing implementation of GNU as and
> LLVM's integrated assembler. Nich, Nathan, any thoughts on that?
>
> Does clang have any mechanism other than labels to define location constants
> that can be used as absolute expressions? e.g. is there any mechanism to alias
> a label which results in the alias also being a constant?

s/constant/absolute/

Nothing off the top of my head comes to mind as a substitute that will
work as expected today.

I've filed https://github.com/llvm/llvm-project/issues/53728 to
discuss more with folks that understand our AsmParser better.

From what I can tell, our AsmParser is falling down because the
operands of the binary expression themselves are not considered
absolute.

I doubt we will be able to handle the general case of symbol
differencing; the symbol reference operands could refer to symbols in
different sections that haven't been laid out yet (or whose order
could be shuffled by the linker).  But if they're in the same section
(or "fragment" of a section), we might be able to special case this.

For the expression

> .if (qwerty_fiqin_end - qwerty_fiqin_start) > (0x200 - 0x1c)

can you use local labels (`.L` prefix) rather than symbolic
references? or is there a risk of them not being unique per TU?
-- 
Thanks,
~Nick Desaulniers
