Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D2E2C82
	for <llvm@lists.linux.dev>; Fri, 15 Oct 2021 08:11:19 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id u21so35116794lff.8
        for <llvm@lists.linux.dev>; Fri, 15 Oct 2021 01:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JRDPxtfCq50zpyNDk7SIx0iGGT8HaQBw5rSfPbd7iTQ=;
        b=QNsjF+pJTWOMZhjw7rFcipU7+h2s5KpOHgBrwm6lH/lqGMk7OaZ2hTRTKef3yg0Py5
         aRoWZeR6BPcNBmWvduX/SdxCL2fe7yZzctVtpd+8igSsQ9oQ9QeEn4vOtP9nNF0j3Tai
         hYuIzFUkRVI4QOmnPsStgrRgLrxmQ6ob6x8cA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JRDPxtfCq50zpyNDk7SIx0iGGT8HaQBw5rSfPbd7iTQ=;
        b=J3eFiCbZUcOgx/cWxUOd8W7JBCmJdD/qBtmiXsRESUstBS8YAeAeDFJn7QpyWBhUtZ
         haWHZq3KG+Gl+PWRtqNbdhzqC3p4o2qXxTa6m1A1r28oJQovGjj3Yy+4aYR9j+7+WHgv
         RxqxWCHrJaMVys2Et/O92dbxoYfwPJReotRk+rFb/yj4n/BH5eFShXPYF40/Nh13PLyJ
         MdJVagRNvlRhCJuVC60MnJBiZwbxihN2+9ADBjoV6spyjcZhdbYhnub0+2CkAzBQxlU6
         Uas+/vGBADbru2qkN81MNfEJhd9NMd7CgQ7HjJwnyMXcEnEGNYqsj/dJc4QZPS0ZPi3h
         uHMw==
X-Gm-Message-State: AOAM531yrzz10L671MhApFFERlIx6LYRYD+j7D6yrWrLhIihi6wHY/b+
	621RQSdEVVbrAQ+M6prHGZDWtQ==
X-Google-Smtp-Source: ABdhPJzQn7X944scb3wsOleSNv4N/ilxR7afsW+PZ7Qx7j1bzP8X26noc9+mXwwjYASdZLAcuR/gqQ==
X-Received: by 2002:ac2:57db:: with SMTP id k27mr10179209lfo.674.1634285477914;
        Fri, 15 Oct 2021 01:11:17 -0700 (PDT)
Received: from [172.16.11.1] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id m27sm437151lfc.178.2021.10.15.01.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Oct 2021 01:11:17 -0700 (PDT)
Subject: Re: [PATCH] compiler_types: mark __compiletime_assert failure as
 __noreturn
To: Nick Desaulniers <ndesaulniers@google.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Linus Torvalds <torvalds@linux-foundation.org>
References: <20211014132331.GA4811@kernel.org>
 <YWhGQLHnA9BIVBpr@hirez.programming.kicks-ass.net>
 <CAKwvOdnkDUfRKzmLThQGW02Ew6x=KM0MQyHge7=kc673NYxo2g@mail.gmail.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <d1c957c4-a2df-935c-2992-3540f05fb110@rasmusvillemoes.dk>
Date: Fri, 15 Oct 2021 10:11:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAKwvOdnkDUfRKzmLThQGW02Ew6x=KM0MQyHge7=kc673NYxo2g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 14/10/2021 19.48, Nick Desaulniers wrote:
> On Thu, Oct 14, 2021 at 8:02 AM Peter Zijlstra <peterz@infradead.org> wrote:
>>

> I'm not sure how worthwhile that yakshave would be, 

A yakshave that would be worthwhile is to kill off the macro
compiletime_assert() completely - three is a crowd. It sounds like it
would be implemented in terms of _Static_assert, but it's actually
__attribute__(error). We can fold the definition of compiletime_assert
into BUILD_BUG_ON_MSG.

The users in rwonce.h should just be changed to static_assert, and then
there are very few random users left, which can either be static_assert
or BUILD_BUG_ON_MSG.

Why do we even have a no-op version if !__OPTIMIZE__? AFAIK there's no
CONFIG_O0 option, and such a build wouldn't be interesting at all - it
can't be expected to boot, and it would likely throw warnings left and
right.

Rasmus
