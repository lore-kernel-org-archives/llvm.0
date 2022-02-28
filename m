Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1097C
	for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 15:16:16 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id l21-20020a056830239500b005afd2a7eaa2so6891574ots.9
        for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 07:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3erX1W/V8eKoqrAyYmfugbwLeZekQvkkVtHUA9NIwMk=;
        b=drpj1huI2zUtT9Wxsj1mWTLeR7td9jWzGtULueocDG5ZY8vkEnbQe+F9SxynenJPt9
         1YQxDabJkCDr9VRQRt+LIJ+ge7VwvhZRjkVtgccg8gg1LRTeEDZgCj/PK6o3zVxFqXSR
         IBubXJps1jrO7uwOlTm8tEda55t/VFR/omtiacO+Guj67wxrRfLIWSQuLJpafmaQRxM1
         MAAXm47q36VY3tKbW3bqVQY7pd89RN4ie8+Uw2s8ANxcipLCuNiptwD/uNMZZn2VwtpJ
         LM8YL9V9dzV97ahyiSPKTl6/TaeCbzxCj3cixXfjOrquBp3Q07y1oWvU/vmxBJg/U9Dg
         5QtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3erX1W/V8eKoqrAyYmfugbwLeZekQvkkVtHUA9NIwMk=;
        b=22HppmGRVbSIsX7a+BlCHmwkFULGWxWFBkmP/2qF2sODVHb4/Fp9+avWcZqSzDzqDa
         I273jgIlUmBqRmBBOg0OKqV00HlQxBWJw+JGrGivo6MOC4T0yoDC0q1VCgi4g+FlSl9S
         Ite0+BE5EY18sQrOdUzOtKTywVP/ZzawIOREeTLndWyK8vb9nm+M16VZI4CKWqVLCKo6
         Vngo2NAw+UWhLBR0WpsPCzmDWjJ9m1WQgwbCTaV7tqeAlalmlFzcPovC14staGsKuePa
         mANoEOUgQkd1PWpbokXfUES+/1QPDPTljBgDtAHPzR5PcFTbfzexIWAVAJNEQHspl8eX
         WTHw==
X-Gm-Message-State: AOAM5303AVzuZil4AhwLvr7MNs2mPawnG44NqbLdpeSdEufdaS+GYYPO
	3t7+mGsheZJWK75Q7X1QXMfbmVp9ChS5tYm2lWE=
X-Google-Smtp-Source: ABdhPJx9TTxxLNEwF+4nqK17T9MfrZryYcQnu8nF9wuFdmJwPKwtyAsHwaCtK/g+ns54aBxeRErB7ut9nPOPqMIGnK0=
X-Received: by 2002:a9d:7096:0:b0:5ad:ebf7:a225 with SMTP id
 l22-20020a9d7096000000b005adebf7a225mr9336023otj.370.1646061375645; Mon, 28
 Feb 2022 07:16:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220225221625.3531852-1-keescook@chromium.org>
 <CANpmjNOup5JCjRpRkhsF3Z+dPX6_MQE5u6WhnMit84c1TyRK+A@mail.gmail.com> <CA+DvKQ+PYtDyejaUoBj51D_Y7muYaR1_FhQGWGWvgQawCbp31Q@mail.gmail.com>
In-Reply-To: <CA+DvKQ+PYtDyejaUoBj51D_Y7muYaR1_FhQGWGWvgQawCbp31Q@mail.gmail.com>
From: Daniel Micay <danielmicay@gmail.com>
Date: Mon, 28 Feb 2022 10:15:59 -0500
Message-ID: <CA+DvKQ+bp7Y7gmaVhacjv9uF6Ar-o4tet872h4Q8RPYPJjcJQA@mail.gmail.com>
Subject: Re: [PATCH] mm: Handle ksize() vs __alloc_size by forgetting size
To: Marco Elver <elver@google.com>
Cc: Kees Cook <keescook@chromium.org>, llvm@lists.linux.dev, 
	Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, 
	Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org, stable@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Looked through them and nearly all seem easy to replace.

By the way, the call to ksize in arch/x86/kernel/cpu/microcode/amd.c
doesn't look right. It allocates the memory with kmemdup. I don't see
how it can assume that the padding is zero, and that seems to be a
requirement since it zeroes the destination before copying to it.
Seems far more reasonable to add a field with the size.
