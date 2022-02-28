Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729727C
	for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 22:42:26 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id p20so19519647ljo.0
        for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 14:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=izAQUggyP+5/oVhiuZDs8c+/hcOxRl41iBfO6/Va0lE=;
        b=gdhZ7E6qyVixQYbKXVG63vM2xxb0swnRwsBzKeIqWG+fvd2iqhAyhIGljd7cmjcZk+
         VR0ScDUTHEHFo886kC5m1yLaFtBCSaxGF8GxeWo+jc9QYY+zeoG6JzMqgBDKYVLOvOLh
         RDcjCrs31LKoUs+2CZ4lKeaBV+t9lou9IkWaXm01N/ieXDUWpXKj1+GKvYSSTn/ucwiQ
         xOQy2ZQ4KfSJOuJq6Dwvy59kumfzDJGCNtAzV9eaVqcqkKkDbvvh9EzYgF2XkstDB/44
         6af2uolk/7inaQ8fKQLIbomP/hHrh1kyhBCozZUGBlNhuQrEEX4Z8CusUwLIcUxSxIzt
         6ppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=izAQUggyP+5/oVhiuZDs8c+/hcOxRl41iBfO6/Va0lE=;
        b=51RkNxrYAwg3xa2oY9dB5+7hUcO1gKQKweKf0GMZoQbXxpWFPacJynoTMBkjYihJkI
         QBvjlQcefmhPaBI186T+G3F1aMbS9mLEihTzPEuwapLLLKp18C0sFv1CMkE8aQ+yGXU/
         xLQIDFyIG+yhghkF4D2v6E7B5hQb9hP6naPrwD2qvz91JPH/sjZWx0XvT/p29g89d9HY
         Z9Fw8NLGxXwXGKUhp2hqIrDq3iycWrH2Fts5yaCf3Io+Lec/TNxjllT9S7+JlSTq485b
         C+obMe7mFeI7J2YfP+ZqCHXkZCV8RrhwL43zPul4l2Jg42LOUKczRcAhuhoP9S6tJMeW
         Qidg==
X-Gm-Message-State: AOAM530QMWFRLva7Vc7lLvJnOIepULbFFaOd38ZE6mmB/nA66wIPc9ET
	7uEEpdsC6vPAZwrBlzrsS/gKfeCyPtrdQTGDOXQE9g==
X-Google-Smtp-Source: ABdhPJzvQ1kr0rlRYJB1BEesLr5I7VO9esTcIjTZCi65uc18521AsP4dIy+Ihsbg2tS+cZ/NY2TvWS6w4S+ZilQ+PiA=
X-Received: by 2002:a2e:bf24:0:b0:246:801e:39d3 with SMTP id
 c36-20020a2ebf24000000b00246801e39d3mr8704495ljr.472.1646088144327; Mon, 28
 Feb 2022 14:42:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220225221625.3531852-1-keescook@chromium.org>
In-Reply-To: <20220225221625.3531852-1-keescook@chromium.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 28 Feb 2022 14:42:12 -0800
Message-ID: <CAKwvOdm5pRtyf8W2c4q_xt353Kp+BSsC7qo5OE6VOEfOLCOJZQ@mail.gmail.com>
Subject: Re: [PATCH] mm: Handle ksize() vs __alloc_size by forgetting size
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, Marco Elver <elver@google.com>, 
	Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, 
	Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org, stable@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Nathan Chancellor <nathan@kernel.org>, Daniel Micay <danielmicay@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 25, 2022 at 2:16 PM Kees Cook <keescook@chromium.org> wrote:
>
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index 37bde99b74af..a14f3bfa2f44 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -182,8 +182,32 @@ int kmem_cache_shrink(struct kmem_cache *s);
>  void * __must_check krealloc(const void *objp, size_t new_size, gfp_t flags) __alloc_size(2);
>  void kfree(const void *objp);
>  void kfree_sensitive(const void *objp);
> +
> +/**
> + * ksize - get the actual amount of memory allocated for a given object
> + * @objp: Pointer to the object
> + *
> + * kmalloc may internally round up allocations and return more memory
> + * than requested. ksize() can be used to determine the actual amount of
> + * memory allocated. The caller may use this additional memory, even though
> + * a smaller amount of memory was initially specified with the kmalloc call.
> + * The caller must guarantee that objp points to a valid object previously
> + * allocated with either kmalloc() or kmem_cache_alloc(). The object
> + * must not be freed during the duration of the call.
> + *
> + * Return: size of the actual memory used by @objp in bytes
> + */
> +#define ksize(objp) ({                                                 \
> +       /*                                                              \
> +        * Getting the actual allocation size means the __alloc_size    \
> +        * hints are no longer valid, and the compiler needs to         \
> +        * forget about them.                                           \
> +        */                                                             \
> +       OPTIMIZER_HIDE_VAR(objp);                                       \
> +       _ksize(objp);                                                   \
> +})
>  size_t __ksize(const void *objp);
> -size_t ksize(const void *objp);
> +size_t _ksize(const void *objp);

If you wanted to discourage others from calling _ksize, you could hide
its declaration within the scope of statement expression within ksize:
https://godbolt.org/z/e4sd4nE6q
-- 
Thanks,
~Nick Desaulniers
