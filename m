Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FEB4ABB
	for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 22:51:48 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id q5so9140960ljb.11
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 15:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Ggl/MKy9XRVzUM8Rcs5TJdLd4Il3RiYZLoq63qTJK8=;
        b=aB/PPKlDrKRoBhLTrJwzPyuNJHKMZwzBoG0rWaX2qAOgQ9CjuDGv+hSVYksU8EpQTo
         YalzViobDb8KoaWEuWddyYckVjHqBPFi3+RgSCFumrPJ9guxgC5y4ez7ObNQBMEJugrz
         umyGFNVU7J5jZGcsHv0h4PyaKF6RxL69ELA78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Ggl/MKy9XRVzUM8Rcs5TJdLd4Il3RiYZLoq63qTJK8=;
        b=q0ceDgcF9gUCdTQVt1aBnRcveXYN8W0PU+r7VgWDKDzXZw5ZXNwBhRlSy84FZG7y2J
         DGsbg9KYTRqo+JxJndoZ5P2xWwGcG2i4wofKD1lQISKIpSsFJD5lJebXfHH12xSqO879
         a04A7y2WbN8FOnhO2ht/ZraIks0RQ2xqkHmyK/EdSrO4djDpSiYTQmcdAFsv8ZLQ1ZmW
         Kqul51I2dFLwdYAi8l1kZStRSmEA5QoljbMVO7JW9FaGZePwLnIPiEFYxcZocVT5FKKu
         ITjIM/W5q4pQxwfNInZZfKuX4ZqmwjuuyYoX78CVXagB18jLkx0H3LQcQ47k5AxqCWdB
         4S4g==
X-Gm-Message-State: AOAM532yh9JrkZ9ZvvAHUz0N3pUYmXTUd1e4NvxF1plmf1UCbFsHYJ19
	tbcU+KWTX7T63v1CZcbYsoE5IHg/n/qfO5SjAcw=
X-Google-Smtp-Source: ABdhPJwpqrg2F9WR2g1oy2OrrZqBfM70dfJcH50B7lvL9j2Uf9npcVByccEUjkLw+ZbIAO4lSDFWgw==
X-Received: by 2002:a2e:910e:0:b0:247:e33b:cbee with SMTP id m14-20020a2e910e000000b00247e33bcbeemr4358489ljg.256.1647557506158;
        Thu, 17 Mar 2022 15:51:46 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id bp19-20020a056512159300b00448b37c6f4csm571406lfb.12.2022.03.17.15.51.45
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 15:51:45 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id s29so11381576lfb.13
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 15:51:45 -0700 (PDT)
X-Received: by 2002:ac2:4f92:0:b0:448:7eab:c004 with SMTP id
 z18-20020ac24f92000000b004487eabc004mr4172510lfs.27.1647557504973; Thu, 17
 Mar 2022 15:51:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220210223134.233757-1-morbo@google.com> <20220301201903.4113977-1-morbo@google.com>
 <CAGG=3QWh90r5C3gmTj9zxiJb-mwD=PGqGwZZTjAfyi1NCb1_9w@mail.gmail.com>
 <AC3D873E-A28B-41F1-8BF4-2F6F37BCEEB4@zytor.com> <CAGG=3QVu5QjQK8m2FWiYn-XQuVBjUGXcbznSbK22jVMB5GAutw@mail.gmail.com>
 <F5296439-4CA3-4F31-BD91-5ED1510BC382@zytor.com> <CAKwvOdkk-C8HMemKs4+yoxvNDgTLmvZG1rmwjVXBqhsQ-cED5g@mail.gmail.com>
 <CAHk-=whJfKN8Jag=8DS=pbZR3TY90znUOP6Km+TLRJ9dZEgNqw@mail.gmail.com>
 <CAGG=3QW2ey2w91TxqJ6tzfJOswhTce2e0QTW7kAWyvxeiO+VNg@mail.gmail.com>
 <CAHk-=whn3iYE7gZM4vHx1kFhWBD2P9Wvmcyj8OOqv=y_7nemGQ@mail.gmail.com>
 <CAGG=3QWC9VS9RdGFTwY8VGqujDnFYnRTT1dQ6kkVr+0SRk6COg@mail.gmail.com>
 <CAHk-=wh=x7oCk05JD1=6XNsvvgpsidRWupoqySw1zODmvNy9Ug@mail.gmail.com> <CAGG=3QWcKof_NXrC0kznM2ikwTA00AgUJrcWhKBTitmjCuOxqw@mail.gmail.com>
In-Reply-To: <CAGG=3QWcKof_NXrC0kznM2ikwTA00AgUJrcWhKBTitmjCuOxqw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 17 Mar 2022 15:51:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj=aK2T+h=rRJL4jDDTgV2U533E_duroCoVSUfkvYd0OQ@mail.gmail.com>
Message-ID: <CAHk-=wj=aK2T+h=rRJL4jDDTgV2U533E_duroCoVSUfkvYd0OQ@mail.gmail.com>
Subject: Re: [PATCH v5] x86: use builtins to read eflags
To: Bill Wendling <morbo@google.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, llvm@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, 
	linux-toolchains <linux-toolchains@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 17, 2022 at 2:45 PM Bill Wendling <morbo@google.com> wrote:
>
> I'm NOT saying that it WILL change or that it SHOULD change. I'm also
> not saying that your concern isn't justified. What I am saying is that
> unless you're using a compiler feature that's DEFINED as having a
> certain effect, then you are not using that feature correctly,
> regardless of how it's acted in the past. And it has the potential to
> bite you in the ass sooner or later. We've all seen such things happen
> before.

So I think most of inline asm constraints are fairly well defined.
Certainly "memory" clobbers are.

The unfortunate exception to this is, I think, "volatile".  It has
always had somewhat undefined semantics (iirc originally gcc talked
about it not being "moved significantly" etc), and it ends up getting
mixed reasons for existing.

The *natural* semantics would be to literally make it have the same
rules as volatile data accesses: something like "'volatile' marks the
asm as having visible side effects in the virtual machine".

So I think natural semantics for "asm volatile" - and the ones that
would be simple to document - would literally be to compare it to
those volatile memory accesses, and say that it can't be optimized
away, and it's ordered wrt other volatile operations (whether volatile
data accesses or other volatile asm instructions).

But that is, afaik, not what it ever did, so it always had somewhat
random semantics, the main being "it can't be removed even if its
outputs are never used". So the "cannot be optimized away" ends up
being the central part of the definition, but without the conceptual
sense.

And then we in the kernel have then also co-opted 'asm volatile' to
just fix some compiler bugs, so we end up using "asm volatile goto"
because of

      http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58670

although *that* particular issue is probably historical now that we
require more modern compiler versions.

I still think that from a sanity standpoint, it would be good to
actually strengthen the semantics of "asm volatile" to literally act
as - and be ordered with - volatile memory accesses.

But I guess that's water under the bridge.

                  Linus
