Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2C52C9D
	for <llvm@lists.linux.dev>; Fri,  5 Nov 2021 20:01:41 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id y8so16816122ljm.4
        for <llvm@lists.linux.dev>; Fri, 05 Nov 2021 13:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xwqxqNONZ3nCcXRzI2pRNIMYNqvPW1JqDX8ccOMQAOo=;
        b=cNTdYA8k53vnPjLAG/Ja74NhguL/6mBPtbcxEWWpKkZOBcFlUWJ0F+o3AqrSfaredo
         UmHsK6489n7iftCUHjEpEvQ64Is/sdNcBf+nZay45joT1Nb5Zgp0PZfjG/zyf2fNdwie
         eywGZl6+wInFHO+ISbNXtW1BOJSsUlWjrlvJHsz960+Lm/26ydNIJpE76HWYW8RWYcBe
         g7yXDPCSx6IdGGlckfRhL6WL4YdEjK73jm4DaxSLsAk+a39i6dESjUG8L8++dl/PzvgF
         ewKD0EEnk+4+bYlGwNBx2+q1dRQii9yetfdW5MpSmRklqQbvH1VyX4G6VDKrPM4HVkVs
         AT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xwqxqNONZ3nCcXRzI2pRNIMYNqvPW1JqDX8ccOMQAOo=;
        b=1CuxCquLEBR7/q0Eq36nb4WA4uq4CIPTa0BKdLgsuQPXk6qPgOhDDzrtsV//Hgc1Wf
         jisuYQ9h+OFqSobah0eqFMumgSSC8a2yqhImFVDZKYKSAgBFnGOjCZKMKhrBakXAnpdm
         a1ljYFvZrSVajgx4QxxlJPHPOFYLmy5t7odasuO9Pv4NIAinF6CE39CLkPn7dS+dwjzh
         jNO3861/tW3Hjxvl//a5KE0D/NYduMm/mnHZoMFEBBmS2vV6h5s+Lgt9sN/DDGLETRim
         6LHiZeR8va75TsfyxGQ3t5tiL+EvMlGCDvlzVQ0+lwfCwvNKOuGeyvPoR7wUKbBG4rXZ
         11PQ==
X-Gm-Message-State: AOAM531XcNiH8uTjR9wRgnG/cYWXXHDsFS29CAxG0ei0AXIxfuhro93n
	mBla4J4Ne4nDJ33V5J7ccm+tlbNId8mLXAhmQG6SDg==
X-Google-Smtp-Source: ABdhPJxnvx97oqO4dIcK7JFQQMoCaYKM9aEVRtH3xs/Z7YbqDBrU4HID2OT/pLc1k4htBHp2XbsPNTItWa1k8539ZE4=
X-Received: by 2002:a2e:3102:: with SMTP id x2mr7143024ljx.62.1636142499158;
 Fri, 05 Nov 2021 13:01:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211105155704.3293957-1-nathan@kernel.org>
In-Reply-To: <20211105155704.3293957-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 5 Nov 2021 13:01:27 -0700
Message-ID: <CAKwvOdkGArbV+EPJkZjEn2eOdU8JRbADp9nD7dGpKyBkCpT89A@mail.gmail.com>
Subject: Re: [PATCH] NFS: Avoid using error uninitialized in nfs_lookup()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Trond Myklebust <trond.myklebust@hammerspace.com>, 
	Anna Schumaker <anna.schumaker@netapp.com>, linux-nfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 5, 2021 at 8:57 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Clang warns:
>
> fs/nfs/dir.c:1772:6: error: variable 'error' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
>         if (fhandle == NULL || fattr == NULL)
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> fs/nfs/dir.c:1801:44: note: uninitialized use occurs here
>         trace_nfs_lookup_exit(dir, dentry, flags, error);
>                                                   ^~~~~
> fs/nfs/dir.c:1772:2: note: remove the 'if' if its condition is always false
>         if (fhandle == NULL || fattr == NULL)
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> fs/nfs/dir.c:1772:6: error: variable 'error' is used uninitialized whenever '||' condition is true [-Werror,-Wsometimes-uninitialized]
>         if (fhandle == NULL || fattr == NULL)
>             ^~~~~~~~~~~~~~~
> fs/nfs/dir.c:1801:44: note: uninitialized use occurs here
>         trace_nfs_lookup_exit(dir, dentry, flags, error);
>                                                   ^~~~~
> fs/nfs/dir.c:1772:6: note: remove the '||' if its condition is always false
>         if (fhandle == NULL || fattr == NULL)
>             ^~~~~~~~~~~~~~~~~~
> fs/nfs/dir.c:1754:11: note: initialize the variable 'error' to silence this warning
>         int error;
>                  ^
>                   = 0
> 2 errors generated.
>
> Add a label to skip the call to trace_nfs_lookup_exit() when the call to
> nfs_alloc_fhandle() or nfs_alloc_fattr_with_label() fails because
> trace_nfs_lookup_enter() has not been called at that point so tracing
> the exit does not make sense.
>
> Fixes: 8d3df1d0387e ("NFS: Remove the label from the nfs4_lookup_res struct")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1498
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  fs/nfs/dir.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
> index 8de99f426183..1c978a7cf730 100644
> --- a/fs/nfs/dir.c
> +++ b/fs/nfs/dir.c
> @@ -1770,7 +1770,7 @@ struct dentry *nfs_lookup(struct inode *dir, struct dentry * dentry, unsigned in
>         fhandle = nfs_alloc_fhandle();
>         fattr = nfs_alloc_fattr_with_label(NFS_SERVER(dir));
>         if (fhandle == NULL || fattr == NULL)
> -               goto out;
> +               goto out_no_trace;
>
>         dir_verifier = nfs_save_change_attribute(dir);
>         trace_nfs_lookup_enter(dir, dentry, flags);
> @@ -1799,6 +1799,7 @@ struct dentry *nfs_lookup(struct inode *dir, struct dentry * dentry, unsigned in
>         nfs_set_verifier(dentry, dir_verifier);
>  out:
>         trace_nfs_lookup_exit(dir, dentry, flags, error);
> +out_no_trace:
>         nfs_free_fattr(fattr);
>         nfs_free_fhandle(fhandle);
>         return res;
>
> base-commit: cb66e0e973daa668dadd43441f877377a1b7b1ff
> --
> 2.34.0.rc0
>
>


-- 
Thanks,
~Nick Desaulniers
