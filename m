Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3E033A014
	for <llvm@lists.linux.dev>; Wed,  9 Sep 2026 15:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968652; cv=none; b=tNFLaga/yqWSfdDx5LfTvR+PUA+EyPEWp6lKmMhO1rNRra6cK4Dtdt/glNJFatKUEqK/l3nTyeJvD6pGt6LFBlV1u/+KEZDBSGcXfnwyndB/y58QvvHKQ6yvpCaVtWP5BHsWtSVydCPcZTKKMQZ5j7F+098Uawow034FR/jAjXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968652; c=relaxed/simple;
	bh=tlXMq73KJhLbqOa3sBQb6U+eAptv38yQqOaGm+TCraA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o+Lml+t+JgpDXUcP8AM5I6IGp+iqo3Mm+/xPfTSv3X8TOf8m+bSTwpZ8LphYfz18FVOsCZot34a//hQPalpJECp1yMJRY3SEEWejLoXuE7fQ9u4dmikyuNyrrWjj1earw88ncE3NVF7bHS+diPL9LDN+QGuTu4dqsmYQnBP8iws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=XvyPkywX; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XvyPkywX"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f12so1197167e87.1
        for <llvm@lists.linux.dev>; Wed, 09 Sep 2026 08:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788968648; x=1789573448; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7MDRo1IEz0/ztB5k2AgA6IiU/moC5VF/pQ54TqLA70=;
        b=XvyPkywX8K/rkqHcDLMoN0Wl3QkJQo1sXCLdUGea8Nw89ovCiQZPO03mR7VD88AK+s
         MDeTK7v8NGeV4dehhQSaBlBHg/CCivcxjJI5oYM2hby4cT0XJFLqQ1vpV0cdP6zZXn9G
         w0mIe1yH+RVqKDpX3xwxx1QulCxrQIithbC3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968648; x=1789573448;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B7MDRo1IEz0/ztB5k2AgA6IiU/moC5VF/pQ54TqLA70=;
        b=r0c79OQCibn67Ag3arhCh0lemsgysV7lfpjS9uPlMO2sgNFg2trAXBTYru5bADGvNw
         aUPHMa2Sh7tenVkwi5nazA8rgsDVnZHKYzbOoefhgOMCph8lS1v9b8yEY+Yb4SpBG0NC
         FwqBvU9IZXQE4koJV5E+ZN+5JRsJ9i3+nr8+BE1wC4dg9ri8NZr1b8RUOOnq4sKIbSog
         2cCze4sydCPAbwgnf0hi1iOvGm0bPjGsAqHAqJSCESpWjfJRWYtiDkDIuIFho0G6wkWO
         62bFjJMomCcfOyppQv8LOLCExQkGYEKsFUsfH+z5HVvMZK23nSa7p6gTaRhmT713jq0D
         ol2g==
X-Forwarded-Encrypted: i=1; AKwUvBwvKwSksXUxp73mj4JVcoVQAaMkKRLC1OS2E1K37crJIxl5oGAZS3vRSFyymbJ9I0hVu9Xl@lists.linux.dev
X-Gm-Message-State: AFuF++n56cF61znhYycV1S3NY9z1uVKQsw1rgKAUer7F6Kiqytadia72
	hU9eWQxPwAC0CqY/nct/ItLxm6pE+o3fLR/ZL++AxIlXkSmTEpf7hzvAujm9rPCDPbmMph0+Mkv
	dhEAnVNUdN6H8
X-Gm-Gg: AYBFou0kAV4w/rM5D19fnPlUKTmiQeYxb+etES9E1WnuiBbt1v8Z7pL/KlfrsoQF6XW
	ojhY/DUiWaklBPAygFsPOYl/UePf3o4fzYHSbypTxqXuvVahBHuE2/L2SXNHy3q5t2T6Sowg2s3
	FFklWiM4nvtkn0C74sHVTOsxu+Aw3WG9pxBu0B7GyoL0OF8J3GkjPINtLlTal/9i6URA2d3OJJj
	yVBx8LP3lVSzU2r9fCA5xD3X3PnOqoZYNNKqSWHuIAPR5Sauh8CF4/2EOFsIxvNsOQAQXy4qn+I
	Wh6n8QpTwj/Y2m0Hj3+Vi6t3C0Xsi0j8omsGJoCvZkEGUMGY8v/zFlDAZFCjPY5EKhEIPpf9yDW
	zscD5KnP//NK8MAniUMH6/wmhyFffA0Tb1jJuHRz4GKEmAopTziD+ovjZYXm+/NRr9TzVbXRvMH
	TBlrXXteP3hOD6krC8pjKJB7ER6udsWPhhyIUP2FICRrys9kwA3fdmrTc8KpvuRGxKBvWxkRkHH
	d8OffeQFTcdwz1vvUCqtfVAbZg2blaB0kBwhNCmHYQqXgEuz7txbGx4Qat/
X-Received: by 2002:a17:906:9f8c:b0:c25:58e:83ff with SMTP id a640c23a62f3a-c292af1f9c8mr478950866b.10.1788968249221;
        Wed, 09 Sep 2026 08:37:29 -0700 (PDT)
Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com. [74.125.228.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d55b306sm795338766b.36.2026.09.09.08.37.27
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:37:27 -0700 (PDT)
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae52so1920425a12.0
        for <llvm@lists.linux.dev>; Wed, 09 Sep 2026 08:37:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBysfKryCLHjjlMtgMRWrwKUK5pOUchHA+xaF/+1WyAfoTVJ0ouz8a6OReqBn+jBcOqcUbwN@lists.linux.dev
X-Received: by 2002:a05:6402:3817:b0:6a6:58e:f84b with SMTP id
 4fb4d7f45d1cf-6a98dfd77b1mr5256449a12.9.1788968246832; Wed, 09 Sep 2026
 08:37:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Sep 2026 08:37:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wieaheq8rXSps3xRZpNNMQMEj9BH5gU+Dh4q_ZgokO51Q@mail.gmail.com>
X-Gm-Features: AcwNN1XKEJS_S8eITIntw19v_mcHyut1QfPlZfjowWaI1qZq5Mivgkqwhzm7f_s
Message-ID: <CAHk-=wieaheq8rXSps3xRZpNNMQMEj9BH5gU+Dh4q_ZgokO51Q@mail.gmail.com>
Subject: Re: [PATCH 00/23] kbuild: significantly speed up kernel builds
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Sept 2026 at 13:55, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> A typical kernel build consists of a frustratingly large amount of time

.. you're preaching to the choir.

>                 == allmodconfig FULL build ==
>
>                         before    after     delta
>                       ----------------------------------
> Threadripper, gcc       345.3s   275.2s    -70.1s (-20%)

Well, that's certainly very encouraging. We should do this. I sent out
some emails as just reactions to individual patches, but I have no
numbers to back any of those emails up, and I never actually applied
this series to my tree - they were all based on reading the patches
themselves.

That said:

> An LLM was used to first determine where the bottlenecks were then to
> figure out how to improve them.
>
> It generated a lot of code, much of it hideous.

This made me scared to look at the patches originally, and I held off
in fear that the patches would be horrible and this build time
improvement would be hugely controversial garbage code.

But:

> I extensively audited and rewrote a lot of it, and heavily edited commit
> messages, the cover letter and comments.

None of the patches look at all horrible to me. You clearly excised
the hideous parts. All of my reactions were of the type "this could
probably be taken _further_" rather than me throwing my hands up in
disgust.

So the Rust parallelism thing clearly isn't ready based on feedback
from that quarter, but the rest looked safe and innocuous. I'm all for
merging this, although it should obviously go in through the right
channels. Mostly the kbuild tree, although some of it clearly would be
other cases - the objtool change in particular is fairly substantial
and needsobjtool people to approve. It didn't look all that
contentious, but still..

Anyway, I'd love for this all to go in. Build times are a pet peeve of mine.

              Linus
