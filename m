Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA324A11
	for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 17:13:15 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id u59-20020a17090a51c100b00205d3c44162so3182136pjh.2
        for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 10:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=d6n7vVcWWAUhY50nx1oX+SjTLgFqeY1Yq8iTalyfqd0=;
        b=lIRHIZiWHITqRmakxRZHSG2SU2bpWinoR3Swar+fPYJBmT1qOO/MT6WnWN5yBDlhGu
         /lQXgjvlz0O4V2+hnYy+98Yh09p4wB3YUjZ22bnBWEa9dMSwUm7gVI6Ae5kXcacwBn8L
         BoOjiPYblWsCdJGhH6goLGXzHmU5/JoB80oyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=d6n7vVcWWAUhY50nx1oX+SjTLgFqeY1Yq8iTalyfqd0=;
        b=Ijptx+dZYigwaMD78wKIsSGRe6s1LL5CSj9Q+cxEF19TRbJMcbGQv0FWUK4Lmvy55K
         hJVpouMFe7eoALdhCBF5zNZ08k4S6v/Xst8nyDKnZJLxYDrJEnQrKG9/gdkfI7/AMiHh
         lyZ1eZHfwl+UmDv/7d9Cm2cJxZ/r7xe9pNvUwk9Zc6RjYDL28WIiSLYpG82q1DOT1kMd
         FcPyeqDHPlbbnIjbBjvDffhRpxaxwb+QN8FUTQJ6jEIsN+ns/JtsaSDXSE/qgiCF3htC
         CF/tBR0ACR/F6P3mIg7TpsnDjLPj2s6C/5uxpJ65owQmISQ7iMkYn7aCwLw5JGSotCua
         QZvg==
X-Gm-Message-State: ACrzQf3exW39prST2eKSgec8PXZZ0FRsgVePxZz2eU7LZdi+HVjw3ZXZ
	arpoTjWKCif8AkZD3Duknz1YbQ==
X-Google-Smtp-Source: AMsMyM6sCBBdOCLg/ekAp2unP2+2il2GSYEdTvWU2WPyIonTKW/L3Ua/pLmu7ZGbcH4WrqStMgqaPQ==
X-Received: by 2002:a17:902:db08:b0:176:d40e:4b57 with SMTP id m8-20020a170902db0800b00176d40e4b57mr799977plx.172.1664385194575;
        Wed, 28 Sep 2022 10:13:14 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q3-20020a170902dac300b00177faf558b5sm4082449plx.250.2022.09.28.10.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 10:13:13 -0700 (PDT)
Date: Wed, 28 Sep 2022 10:13:12 -0700
From: Kees Cook <keescook@chromium.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Christoph Lameter <cl@linux.com>,
	Pekka Enberg <penberg@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, Marco Elver <elver@google.com>,
	linux-mm@kvack.org, "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Alex Elder <elder@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	David Sterba <dsterba@suse.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Daniel Micay <danielmicay@gmail.com>, Yonghong Song <yhs@fb.com>,
	Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org, dev@openvswitch.org,
	x86@kernel.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 01/16] slab: Remove __malloc attribute from realloc
 functions
Message-ID: <202209281011.66DD717D@keescook>
References: <20220923202822.2667581-1-keescook@chromium.org>
 <20220923202822.2667581-2-keescook@chromium.org>
 <CAMuHMdXK+UN1YVZm9DenuXAM8hZRUZJwp=SXsueP7sWiVU3a9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXK+UN1YVZm9DenuXAM8hZRUZJwp=SXsueP7sWiVU3a9A@mail.gmail.com>

On Wed, Sep 28, 2022 at 09:26:15AM +0200, Geert Uytterhoeven wrote:
> Hi Kees,
> 
> On Fri, Sep 23, 2022 at 10:35 PM Kees Cook <keescook@chromium.org> wrote:
> > The __malloc attribute should not be applied to "realloc" functions, as
> > the returned pointer may alias the storage of the prior pointer. Instead
> > of splitting __malloc from __alloc_size, which would be a huge amount of
> > churn, just create __realloc_size for the few cases where it is needed.
> >
> > Additionally removes the conditional test for __alloc_size__, which is
> > always defined now.
> >
> > Cc: Christoph Lameter <cl@linux.com>
> > Cc: Pekka Enberg <penberg@kernel.org>
> > Cc: David Rientjes <rientjes@google.com>
> > Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Vlastimil Babka <vbabka@suse.cz>
> > Cc: Roman Gushchin <roman.gushchin@linux.dev>
> > Cc: Hyeonggon Yoo <42.hyeyoo@gmail.com>
> > Cc: Marco Elver <elver@google.com>
> > Cc: linux-mm@kvack.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> Thanks for your patch, which is now commit 63caa04ec60583b1 ("slab:
> Remove __malloc attribute from realloc functions") in next-20220927.
> 
> Noreply@ellerman.id.au reported all gcc8-based builds to fail
> (e.g. [1], more at [2]):
> 
>     In file included from <command-line>:
>     ./include/linux/percpu.h: In function ‘__alloc_reserved_percpu’:
>     ././include/linux/compiler_types.h:279:30: error: expected
> declaration specifiers before ‘__alloc_size__’
>      #define __alloc_size(x, ...) __alloc_size__(x, ## __VA_ARGS__) __malloc
>                                   ^~~~~~~~~~~~~~
>     ./include/linux/percpu.h:120:74: note: in expansion of macro ‘__alloc_size’
>     [...]
> 
> It's building fine with e.g. gcc-9 (which is my usual m68k cross-compiler).
> Reverting this commit on next-20220927 fixes the issue.
> 
> [1] http://kisskb.ellerman.id.au/kisskb/buildresult/14803908/
> [2] http://kisskb.ellerman.id.au/kisskb/head/1bd8b75fe6adeaa89d02968bdd811ffe708cf839/

Eek! Thanks for letting me know. I'm confused about this --
__alloc_size__ wasn't optional in compiler_attributes.h -- but obviously
I broke something! I'll go figure this out.

-Kees

-- 
Kees Cook
