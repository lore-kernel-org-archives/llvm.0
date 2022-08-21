Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D581963B
	for <llvm@lists.linux.dev>; Sun, 21 Aug 2022 10:11:49 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id gb36so16170519ejc.10
        for <llvm@lists.linux.dev>; Sun, 21 Aug 2022 03:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc;
        bh=8ith3DKWqelfwAhl4fXB2Zj3+XrRanGIkq2gbaZNWZg=;
        b=BVQpXwpBZgmCcpri72t9UYGSUWNIWbGX+mvKI914QY8tRVzJe+eeIW6Qh/v466eoXH
         fqtZ9qkt9kzrgFQw4vvsffJYWvxDWABGWdj72gGBl+UQVV0nFx/FqLnPInnnqSkwvZiz
         QAx3e/fFprENPZEkS4XD1h1f1dkIll6fgX8OBhc6HyYzEUEfBsScjnLGiqwELqIQJfdE
         CXpkfkItL/NTWXet387ZBCBynIWBmmn5KciXvLRb/KXwolyGql54ceQ8n2zKycvV0r3S
         RNr8UB6ykcmIvdBDzec7uUOA0eGooPOq6M9o5dvWGS520weyqQRDNqRik0CYBOTV/P1m
         j0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc;
        bh=8ith3DKWqelfwAhl4fXB2Zj3+XrRanGIkq2gbaZNWZg=;
        b=LdzGnV0cesDteGacvVAr98X109KafzgFRdqbTZRhmiqDvq27SeyuyXkzl7rPRxFR8X
         GzwuxG1YBKS69+Cln7OGjNQ9VILjI/nQ9r9LoiBt4jPSi6JGJ5Wz0rELbeb6oIHCndFQ
         o2+GVn2yLkG+BIwrJRryMFWB/FoNsgqj54XEZU3DEkavlT2gDsdkzgH7BLpfeiI+uXLs
         OEjU54loG8ViTsIfOu1ZdaALXiPMVOT1Yb2yHyFDDNLa8/NV7AhgN2o6F4u6k7oiIYt9
         mg2DHh7VcYKc55Ziu80RoBe3xzU/6pK030iPLd3XloRjnTO3NDG089wCvWdw5FwIjHG0
         5hkw==
X-Gm-Message-State: ACgBeo3QZv8rRJLQwUhH5l9lPM2VuM+JrMMpei1Zlg0fVhYxOrv/W3N3
	M+v5zk1W+gq2axVrv8nCcd8=
X-Google-Smtp-Source: AA6agR4kTu9YlV5YYbUUlwVhkyNFi6XbWVbAuGGc7J+qELenLCeL3rXs3jHQa/zJy5NHEabc6B1vAQ==
X-Received: by 2002:a17:907:288a:b0:730:7f77:9550 with SMTP id em10-20020a170907288a00b007307f779550mr9534282ejc.216.1661076708009;
        Sun, 21 Aug 2022 03:11:48 -0700 (PDT)
Received: from gmail.com (195-38-113-151.pool.digikabel.hu. [195.38.113.151])
        by smtp.gmail.com with ESMTPSA id j15-20020aa7c0cf000000b0043bbc9503ddsm6251027edp.76.2022.08.21.03.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Aug 2022 03:11:47 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Sun, 21 Aug 2022 12:11:45 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	kvm@vger.kernel.org, llvm@lists.linux.dev,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Borislav Petkov <bp@suse.de>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: [PATCH v2] asm goto: eradicate CC_HAS_ASM_GOTO
Message-ID: <YwIE4WDJXWK/LOR6@gmail.com>
References: <CAADnVQJFc9AnH_9CW+bSRotkKvOmkO9jq-RF6dmyPYOpq691Yg@mail.gmail.com>
 <20220819190640.2763586-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220819190640.2763586-1-ndesaulniers@google.com>


* Nick Desaulniers <ndesaulniers@google.com> wrote:

> GCC has supported asm goto since 4.5, and Clang has since version 9.0.0.
> The minimum supported versions of these tools for the build according to
> Documentation/process/changes.rst are 5.1 and 11.0.0 respectively.
> 
> Remove the feature detection script, Kconfig option, and clean up some
> fallback code that is no longer supported.
> 
> The removed script was also testing for a GCC specific bug that was
> fixed in the 4.7 release.
> 
> Also remove workarounds for bpftrace using clang older than 9.0.0, since
> other BPF backend fixes are required at this point.
> 
> Link: https://lore.kernel.org/lkml/CAK7LNATSr=BXKfkdW8f-H5VT_w=xBpT2ZQcZ7rm6JfkdE+QnmA@mail.gmail.com/
> Link: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48637
> Acked-by: Borislav Petkov <bp@suse.de>
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Suggested-by: Alexei Starovoitov <alexei.starovoitov@gmail.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Ingo Molnar <mingo@kernel.org>

Good riddance.

Thanks,

	Ingo
