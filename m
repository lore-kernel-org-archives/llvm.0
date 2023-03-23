Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F76B8C12
	for <llvm@lists.linux.dev>; Thu, 23 Mar 2023 12:03:47 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id l15-20020a05600c4f0f00b003ed58a9a15eso914033wmq.5
        for <llvm@lists.linux.dev>; Thu, 23 Mar 2023 05:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679573026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TeiulGRJuAG8oV3+nSxuU+e5BdoA3oJAm0zh1OHOoQY=;
        b=bnXNzBQwmOq0q/QSsr3o8zZd/0xdbYPBHZ59TxEv9j725JKXeofdx/aZeL1D8eCWaU
         WpIr6JBYOLWdXl1A+x28YtZq7kE5Ai3lL6mXIMZcWCAQWUqqROvn2j93rCjLu/OK7eL9
         tlHdemCXTusvbjoGWj332SUk1MGBmDSwBhApsVpOpuIJvvlPfCmGk3/lqZEBprxRE7sf
         ZgX4Y5HnfaFT+YOqj18DjFR4/MZwUBZvlpSeFsyL/NmKvzjQPD7l6hEzJX891MhOvt1i
         UcOnu1kiUVWLhONtILhLB5frJPVUTtJCyEDDh+8a/A148wmIgmwMIksaZSS3n5WRckPP
         fsmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679573026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeiulGRJuAG8oV3+nSxuU+e5BdoA3oJAm0zh1OHOoQY=;
        b=HSd17tzDi9R/60U+IByzGmXjllNDzfXLRl+aSope3uAn27mTe0U5PK5l1277u2q53D
         9iDILUbCN6zb8wgl7pYzfflMHLWK20U5eTxRN/iTegg5yxegE6SBPUnIOAK8SmZmExZh
         F0SAMwpgQEVSJ3PfzvsqEEzW+y3XPaLc5dWXIH/+XAU48pKug4Nj7nNHugESy3Tof4SF
         Iop+5sAObV3Mp7ZCEaf25e0ZIYanyAluNfGqFsdOcym8VaBJlpJtsZL/hGVeFSJIsFsz
         eapepexQSAYiRt1uxz0K3iIU+eYmc8cRiHLs2kZHb3IT/ubC1chOoZHqUNnfGRxdO0To
         FVRw==
X-Gm-Message-State: AO0yUKXM0Da3SFaBi/+Ju1kQJGK1IB4cHI7PDZVjWFqD2oulLX7bkpv9
	JM5UWT6paNeCuKxIkNXZmW0=
X-Google-Smtp-Source: AK7set/cQOWUea/d79eWNQjNG1Mc2o8W27XFk4hxmba5L79MsY8xd0cMreE4dc3uzSnvzx1xPhB7Sg==
X-Received: by 2002:a7b:c409:0:b0:3ee:2b04:e028 with SMTP id k9-20020a7bc409000000b003ee2b04e028mr2231927wmi.14.1679573026088;
        Thu, 23 Mar 2023 05:03:46 -0700 (PDT)
Received: from localhost (host86-156-84-164.range86-156.btcentralplus.com. [86.156.84.164])
        by smtp.gmail.com with ESMTPSA id s15-20020a05600c45cf00b003ee2a0d49dbsm1695390wmo.25.2023.03.23.05.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 05:03:45 -0700 (PDT)
Date: Thu, 23 Mar 2023 12:03:44 +0000
From: Lorenzo Stoakes <lstoakes@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 1/3] mm/mmap/vma_merge: actually set next to NULL if not
 applicable
Message-ID: <21236776-232e-4653-8bd0-8a2dcc6fe63c@lucifer.local>
References: <20230323115903.1483668-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323115903.1483668-1-arnd@kernel.org>

On Thu, Mar 23, 2023 at 12:58:34PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> As clang builds point out, the variable 'next' is now uninitialized
> in some conditions as a result of a previous patch that tried to
> rely on it being NULL here:
>
> mm/mmap.c:939:11: error: variable 'next' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>         else if (!curr)
>                  ^~~~~
> mm/mmap.c:952:15: note: uninitialized use occurs here
>         merge_next = next && mpol_equal(policy, vma_policy(next)) &&
>                      ^~~~
>
> Fixes: e887ecae997e ("mm/mmap/vma_merge: set next to NULL if not applicable")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  mm/mmap.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 54099a604cf8..c01d43bd694e 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -939,6 +939,8 @@ struct vm_area_struct *vma_merge(struct vma_iterator *vmi, struct mm_struct *mm,
>  	else if (!curr)
>  		/* Is there a VMA next to a hole (case 1 - 3) or prev (4)? */
>  		next = vma_lookup(mm, end);
> +	else
> +		next = NULL;
>
>  	/* Can we merge the predecessor? */
>  	if (prev && addr == prev->vm_end && mpol_equal(vma_policy(prev), policy)
> --
> 2.39.2
>

This was already fixed in a more recent series of this patch set (at
v3). Sorry for this reaching -next!

See https://lore.kernel.org/all/cover.1679516210.git.lstoakes@gmail.com/
