Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4FD5A7C
	for <llvm@lists.linux.dev>; Fri, 30 Sep 2022 16:43:39 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id s26so4619786pgv.7
        for <llvm@lists.linux.dev>; Fri, 30 Sep 2022 09:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=bsd0Z4BBhM7Ch09POH37+LOvSTGUvuf/hXwL96S/REQ=;
        b=myU24/86ibLxLmheNjBfWjX5LgM0eddArBW/+Q+BITGiD1A8K4kRbVv9B1lPfVH1o1
         Oj7xtMHs8tottc7saHhuUkj5pzYmny8OqrA/fGdif0kkxTvm484ZVeOOxZjB5n5SzY8o
         T6ZSiTayWcLrkmAJhI/Qu3cBBiElwIUvl5LOU2W9UH5SzUBPtU1jsq9k7JUn4ij3PLFJ
         Dfmh//YNBOXnENrUm8NZHM2AkGUHOUIE84puM8T392QFLV6y+1iDWAOQdlq6IVYDyslc
         8V1D4+Ma+wAthCBAxvThO7qL8D/EamgAuNBnQzJpqWK5Onu2UdYwiIwphF1EEv7FZiaF
         yuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=bsd0Z4BBhM7Ch09POH37+LOvSTGUvuf/hXwL96S/REQ=;
        b=dVOIarDMgcdnbrTlUdkpdu2pSeHyABXlwRxx4T1QQ0zaN1ZmVbo/AxtCigFHkWr8fR
         fhNVeg0LPuih1pskMgjm4Po1fsPuAOG1VU6CpsqgCXbhnMMc7AvPfWzY3cx+yT3N5NVD
         jNhfnMxduz5WTa0jZOop+8dJM+ggJzoSY8nfQHHrKq3Q9u+wlU1H3Q6+i+VcLnGIYXI3
         METGi05QsJ4UJCctdXUJ8QYv5+ml6tCePZu2BijOxELeGia300flqv7I7Chh+BQvkHx1
         niaLMgrhWG+EKKrXNd/a21jpw5f60p5S8czbTotRo3muayPtNkw4weSOrZaVOJBHXScb
         qS5Q==
X-Gm-Message-State: ACrzQf25PV8hw4CMpITk//gLuX8VmRKrlhVvQyQm8TmnmDMxHFHQin+c
	CfJRPLKP1zQi1DlUEsHkmtIjXHhKJF87JVYMrldlvw==
X-Google-Smtp-Source: AMsMyM6maCc05NRZH/ztoF2+9Ke0YJa7WnQh0ThBhaX7R2rZhWITniCQz909Jxl0QDHkmSJywdFSHrY+3PrjQgQZRQk=
X-Received: by 2002:a05:6a00:4c11:b0:53e:4f07:fce9 with SMTP id
 ea17-20020a056a004c1100b0053e4f07fce9mr10192779pfb.66.1664556218944; Fri, 30
 Sep 2022 09:43:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdkaKTa2aiA90VzFrChNQM6O_ro+b7VWs=op70jx-DKaXA@mail.gmail.com>
 <20220928210512.642594-1-ndesaulniers@google.com> <5672845ec66744df9ee0f0c56031ab00@AcuMS.aculab.com>
In-Reply-To: <5672845ec66744df9ee0f0c56031ab00@AcuMS.aculab.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 30 Sep 2022 09:43:27 -0700
Message-ID: <CAKwvOd=QsUGZ2ZF_3xHb0dG0JF=f9e3_vHvU+rsj0eXfAQP86g@mail.gmail.com>
Subject: Re: [PATCH v4] x86, mem: move memmove to out of line assembler
To: David Laight <David.Laight@aculab.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"H . Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Kees Cook <keescook@chromium.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, Andy Lutomirski <luto@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 30, 2022 at 2:55 AM David Laight <David.Laight@aculab.com> wrote:
>
> Oh - and why do all the labels have 'byteswap' in them?

.Lbyteswap is swapping single bytes at a time.
.L4_byteswap is swapping 4 bytes at a time.
.L8_byteswap is swapping 8 bytes at a time.
.L16_byteswap, .L16_byteswap_backwards_loop, and
.L16_byteswap_forwards_loop are swapping 16 bytes at a time.

When doing a move that has to be delicate with respect to overlap, I
thought it was helpful to know how many bytes are being swapped in a
given run of instructions. The names were chosen were based on the
comparison/guards/conditional jmps.

---

Linus pointed out that this 32b memmove looks similar to 64b
memcpy_orig.  Would you prefer me use those labels?

s/.Lbyteswap/.Lstore_1byte/
s/.L4_byteswap/.Lless_3bytes/
s/.L8_byteswap/.Lless_8bytes/
s/.L16_byteswap/.Lless_16bytes/
s/.L16_byteswap_backwards_loop/.Lcopy_backward_loop/
s/.L16_byteswap_forwards_loop/.Lcopy_forward_loop/

or something else?
-- 
Thanks,
~Nick Desaulniers
