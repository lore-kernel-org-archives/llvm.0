Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062287C
	for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 14:48:57 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id x193so13464266oix.0
        for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 06:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VlG4fI6bBYkPpFcbAcTm6hy8fXOzxdf1xdGq3BMqoYc=;
        b=IW8WA+AHr1t9GtRiZH0kfoy7+BwA7nt0t5LtGYYh6UC7qVANOORD8+NYp2VDFEaLih
         69yLwp5vFOImHYnnHKAJmqMXiOYpYu5K40FCN6EVsxs4NDhi/NAR/kMTupV72PHmZj8/
         s27FvOXqNvosbqWAjlfjIbTZCj7XHNIYPS+keTAhKiZKucS6GFOq3Td2UarGICuQcZSE
         vqSzUttCvRBlCk/2ueOnGTzX4Ij7/hC0cHKg2S1zkjYzwbz8VRaOZ+6asW17dU8XAoxZ
         vE0GBKMiItHZd6MXyzf1WiDykJme8psjV0JdWoqGlPVDq4XSWEeLUmH3g6knc+e9oczC
         JmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VlG4fI6bBYkPpFcbAcTm6hy8fXOzxdf1xdGq3BMqoYc=;
        b=OQj+9GLrH4E4mpUPay4e+52+QnCcnJCKhbiEI5Nb5NNj/vqtykv1LVdxKzN+y+07IV
         Erbys1R80zq/DNXsXMSpge3neryBcFvBkAu4Uvd8nd9CIg5xuKbtwoh2BJBswu+nfN2M
         RhztApTrU/yfjUnUONGiVpth+gxYew1cxUcTgOqeA4UPDSb2FWalpefKYA+3nA3MdTca
         98w9ckwE/LfcGgal8NZq5KvAdxdwUThfX9bcRBoJoFKdts76gPPT4B0ATmodiPYIRx+i
         dAdK1wiXyO/wx7ojV1/ddwc6mdzsw+FfPjymN5uCz6RVauQKCion5VJN9TTY7oNPSDbm
         99jA==
X-Gm-Message-State: AOAM533knWsdgnSNo1gIw0NE2qehHrfB+EP4x+nkJAc8Q+ZnCNc8VrwJ
	cW83w7gcnSySISNXhbL0fOAgFqXez9l6uRDIAeI=
X-Google-Smtp-Source: ABdhPJxyeCNuUoc7Rc3If7ObB7hMpxFXHG9BXhesgjQMW03kyvafsvGo0AMIsg//K2PlG2nzgM4LsOSq+L/xbj8gEgI=
X-Received: by 2002:a05:6808:124d:b0:2d7:f6e:74b0 with SMTP id
 o13-20020a056808124d00b002d70f6e74b0mr10939977oiv.141.1646059737002; Mon, 28
 Feb 2022 06:48:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220225221625.3531852-1-keescook@chromium.org> <CANpmjNOup5JCjRpRkhsF3Z+dPX6_MQE5u6WhnMit84c1TyRK+A@mail.gmail.com>
In-Reply-To: <CANpmjNOup5JCjRpRkhsF3Z+dPX6_MQE5u6WhnMit84c1TyRK+A@mail.gmail.com>
From: Daniel Micay <danielmicay@gmail.com>
Date: Mon, 28 Feb 2022 09:48:41 -0500
Message-ID: <CA+DvKQ+PYtDyejaUoBj51D_Y7muYaR1_FhQGWGWvgQawCbp31Q@mail.gmail.com>
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

There aren't many calls to ksize in the entire Linux kernel source
tree. Most use cases are using the memory as some kind of (chunked)
dynamic array, where they either need to realloc or kmalloc a new
chunk when it runs out of space. Changing the approach to this API
would be both more efficient and fully compatible with alloc_size
since it would simply not be added to these functions:

    kmalloc_size(size, &result_size)
    krealloc_size(p, new_size, &result_size)

Nearly every use of ksize could be easily phased out this way. There
are probably a few which are harder to remove. It can be gradually
phased out by keeping around ksize temporarily but documenting that
it's only correct to use it on memory allocated with
kmalloc_size/krealloc_size. I think it can be phased out quite quickly
though. Look at how many calls there are to it. It's really not a lot,
especially if you filter out the uses of the identifier 'ksize' for
variables rather than calls to that function.

I brought this up when I originally submitted CONFIG_FORTIFY_SOURCE.
It's the main reason that I didn't bother trying to submit the
alloc_size attributes myself. The most important ones are for kmalloc
and it isn't technically correct to use it.
