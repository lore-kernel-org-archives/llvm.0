Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850851FC8
	for <llvm@lists.linux.dev>; Fri, 27 May 2022 19:32:46 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id a23so5926257ljd.9
        for <llvm@lists.linux.dev>; Fri, 27 May 2022 12:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YbNlXe87qNc6h67+KP/ggEhHQmBaOtSGUnOsKzPXQyw=;
        b=cQJY+P6rcRGZZ5r3c7oRqG5V7iGSoJNJfKBfuZfO15LxSEWMkzAtA54lu7Hp/tYWBV
         wWSVEi3BgDrSqtNbmMqXIV9tPidA0qwutEe5J6bEx6R78si5RkSYCzVzWoyTDMtRlldU
         DZy13KPSObcqjZC20xf9UDfblSOqjoP6xPruYdMlBDSh/Rj/CWl+4G4TkODCM2vsTIjW
         Ofqstgp/HJlVo9uKP1+4DyCRvGnLZkps8yxzz07y6GsvLCzo5o1FfyVqKcEq21v9Fywx
         8WPNqYNKpyUzjKwQImhtgUQ2Dag5bdTNucqQQFvxEtU5kZuVoVNmllkponQWwR+Ri0Sb
         71Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YbNlXe87qNc6h67+KP/ggEhHQmBaOtSGUnOsKzPXQyw=;
        b=q5MARtGQB8XEJoUQlrb/Qxo/mFT1i01/HaMXAm6cpCL0G/AEXWdCBnqjathLL7/jFG
         thFMwTmK6JIyDDKuxhAFm3S0C7qhDfflMe/YSMcgcDL/DBPQlkDyZuUDOZ83RLqBjajN
         gqKbzBPyt1Apx2SziG9bTdAjXv0l38U//fpuIYfOxpXV1+NabmfCCV5xwkjs2587E73X
         xoAR2+24GU/reb0ZwMe36dtDyBtxO5/7VgXWsrI5K8wtOBfrH55K5XFpTb+M8u4/P7Wi
         gZi6/c8aRx3alwYc+F6kY+cJsW1Cc9VKrsuz5jeJpyqBB4VZG8LHGW2svIR/uyOvrAi6
         lf0w==
X-Gm-Message-State: AOAM533OYe6lEI+mIIyiBqIjhBO2LrrJ383WPRU8rJ4JmPM6IVBmGQWr
	VK5FnYIBksvJZdhEgF9mZWzR2Pf29rKkjygA6hC8KA==
X-Google-Smtp-Source: ABdhPJzAxhlMSalFK9CVX5KwiMg/9AV2qQCnCCuSa8PGqm8A4zOvp5d8SiUYeHr7aft7fDHizNRyejsH6FF624ole3c=
X-Received: by 2002:a2e:b98f:0:b0:254:1e41:6aae with SMTP id
 p15-20020a2eb98f000000b002541e416aaemr5939903ljp.493.1653679964237; Fri, 27
 May 2022 12:32:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220526140226.2648689-1-trix@redhat.com>
In-Reply-To: <20220526140226.2648689-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 27 May 2022 12:32:32 -0700
Message-ID: <CAKwvOdmPZXiMZRKyMfZVMmw-95XVocSZn3VVi3yJh0Bx1ONbJQ@mail.gmail.com>
Subject: Re: [PATCH] cifs: set length when cifs_copy_pages_to_iter is successful
To: Steve French <stfrench@microsoft.com>
Cc: nathan@kernel.org, dhowells@redhat.com, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Tom Rix <trix@redhat.com>, sfrench@samba.org
Content-Type: text/plain; charset="UTF-8"

+ Steve's @microsoft.com email addr.

On Thu, May 26, 2022 at 7:02 AM Tom Rix <trix@redhat.com> wrote:
>
> clang build fails with
> fs/cifs/smb2ops.c:4984:7: error: variable 'length' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>   if (rdata->result != 0) {
>       ^~~~~~~~~~~~~~~~~~
>
> handle_read_data() returns the number of bytes handled by setting the length variable.
> This only happens in the copy_to_iter() branch, it needs to also happen in the
> cifs_copy_pages_to_iter() branch.  When cifs_copy_pages_to_iter() is successful,
> its parameter data_len is how many bytes were handled, so set length to data_len.
>
> Fixes: 67fd8cff2b0f ("cifs: Change the I/O paths to use an iterator rather than a page list")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  fs/cifs/smb2ops.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
> index 3630e132781f..bfad482ec186 100644
> --- a/fs/cifs/smb2ops.c
> +++ b/fs/cifs/smb2ops.c
> @@ -4988,7 +4988,7 @@ handle_read_data(struct TCP_Server_Info *server, struct mid_q_entry *mid,
>                                 dequeue_mid(mid, rdata->result);
>                         return 0;
>                 }
> -               rdata->got_bytes = pages_len;
> +               length = rdata->got_bytes = pages_len;
>
>         } else if (buf_len >= data_offset + data_len) {
>                 /* read response payload is in buf */
> --
> 2.27.0
>


-- 
Thanks,
~Nick Desaulniers
