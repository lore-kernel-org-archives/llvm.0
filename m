Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0553217;
	Thu,  8 Dec 2022 18:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A1B8C433F0;
	Thu,  8 Dec 2022 18:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670522758;
	bh=LcUc6vIGzM7qLxwzZfCmF429Ev9PHuS1tGR3YI4qEdI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QWr+6i9XmeU8jFODBTFCkwViF5GsmDG8AOQIsUGUq2V7cb9UFcj9j2Ik0YIPsiCtS
	 Q0QkHQcAUjWR/9QJ02zYNJ0GrUEXY2c3++SWl0p7mTDuFmAKEoMIjWKQ1G1+xAGkQA
	 Q56mlppzFwE0l91532vHILGqMG/p/lJLGvzSxYHRc/nTb9iTRyN2s8L2us/BYcv8pn
	 aHgDBoa+9USYL7mZj6U58fw8fpzZuPXcNtVMiiEjls8W1wrFmEQsO1hyrZOWhh20gG
	 KWwyWIlTmPZc7wPeQ++Q01oSL1RsX3TfkH5WLig1owaN2nM+WlUuZNCkQ8ARAUXpTc
	 zrpAe1utJBFjQ==
Received: by mail-lf1-f41.google.com with SMTP id j4so3290186lfk.0;
        Thu, 08 Dec 2022 10:05:58 -0800 (PST)
X-Gm-Message-State: ANoB5pmW/lJe3YDGpZ8T5wKuVjkECZXTzG9i9qe+8zvP0ayHFeh3aDBl
	vWgw7Us/WzIU0BUCmvoj/6KbVQrnHqzpmrbKlUo=
X-Google-Smtp-Source: AA0mqf7iF6zAnK2GD/yJ+MVH25N0dT0eelPZbqVPPbatxILofsLbcbgIzB4qlMmW63iOzBEA57tkGHLYX5W1TavqjdU=
X-Received: by 2002:a05:6512:3082:b0:4b5:964d:49a4 with SMTP id
 z2-20020a056512308200b004b5964d49a4mr1861580lfd.637.1670522756618; Thu, 08
 Dec 2022 10:05:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202211041904.f9S5gAGL-lkp@intel.com> <Y5FvChDBD/+uaFy8@gondor.apana.org.au>
In-Reply-To: <Y5FvChDBD/+uaFy8@gondor.apana.org.au>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 8 Dec 2022 19:05:45 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGkdp_cwOWeX_49Y5xTCH8Y7X-LnM8pJufCH3yw7anBWQ@mail.gmail.com>
Message-ID: <CAMj1kXGkdp_cwOWeX_49Y5xTCH8Y7X-LnM8pJufCH3yw7anBWQ@mail.gmail.com>
Subject: Re: arch/arm/crypto/sha1_glue.c:34:8: warning: cast from 'void
 (*)(u32 *, const unsigned char *, unsigned int)' (aka 'void (*)(unsigned int
 *, const unsigned char *, unsigned int)') to 'sha1_block_fn *' (aka 'void
 (*)(struct sha1_state *, const unsigned char ...
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: kernel test robot <lkp@intel.com>, Robert Elliott <elliott@hpe.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Dec 2022 at 05:59, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Fri, Nov 04, 2022 at 07:33:43PM +0800, kernel test robot wrote:
> >
> > vim +34 arch/arm/crypto/sha1_glue.c
> >
> > f0be44f4fb1fae David McCullough 2012-09-07  23
> > 1f8673d31a999e Jussi Kivilinna  2014-07-29  24  asmlinkage void sha1_block_data_order(u32 *digest,
> > f0be44f4fb1fae David McCullough 2012-09-07  25                const unsigned char *data, unsigned int rounds);
> > f0be44f4fb1fae David McCullough 2012-09-07  26
> > 604682551aa511 Jussi Kivilinna  2014-07-29  27  int sha1_update_arm(struct shash_desc *desc, const u8 *data,
> > f0be44f4fb1fae David McCullough 2012-09-07  28                    unsigned int len)
> > f0be44f4fb1fae David McCullough 2012-09-07  29  {
> > 90451d6bdb787e Ard Biesheuvel   2015-04-09  30        /* make sure casting to sha1_block_fn() is safe */
> > 90451d6bdb787e Ard Biesheuvel   2015-04-09  31        BUILD_BUG_ON(offsetof(struct sha1_state, state) != 0);
> > f0be44f4fb1fae David McCullough 2012-09-07  32
> > 90451d6bdb787e Ard Biesheuvel   2015-04-09  33        return sha1_base_do_update(desc, data, len,
> > 90451d6bdb787e Ard Biesheuvel   2015-04-09 @34                                   (sha1_block_fn *)sha1_block_data_order);
> > f0be44f4fb1fae David McCullough 2012-09-07  35  }
> > 604682551aa511 Jussi Kivilinna  2014-07-29  36  EXPORT_SYMBOL_GPL(sha1_update_arm);
> > f0be44f4fb1fae David McCullough 2012-09-07  37
>
> So clan doesn't like the cast on the assembly function.
>
> Ard, why can't we just change the signature of the assembly
> function instead of casting?
>

We can, as the BUILD_BUG() will catch it if struct sha1_state gets
modified in an incompatible way.
