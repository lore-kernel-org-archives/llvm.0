Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BDA8F60
	for <llvm@lists.linux.dev>; Thu,  2 Feb 2023 19:00:49 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id s13so385022pgc.10
        for <llvm@lists.linux.dev>; Thu, 02 Feb 2023 11:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p3ZYbtaIavkAf5aV8P1noUyCGHCi0NGSeVESNHvFnYY=;
        b=tERd3yuEcFjOGwSs1S4VXGdkVqpN6d4UcJwqaiEYucEdFffjmVwx6IDBVLa7XV4kOY
         nkeXbAEzLNpaYr3MNTHiUQ8AU6tUR3k35WlLLOUxlKQYXW1vs7nUDrTUnF75dZCDdl3o
         Vgb3Jmf8Oj2ZVHxRhbmUPbn+Wq6fNVwAlOjMd2lxhqQwYZsk471YYelimQvNaCIsbFtR
         97gVJnMI13LURT+JSYWHTIWHKmrVE0AkyLru+Y6TE74DiYtQBmSakWGDyIk6aOfMhCTv
         ZcAes6tsNcN4zMcgAOcWyvVFf1+5DdwWbLSuazZCgEA3RdGPwAcIUl50DbZA5YxsBPnw
         Jx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p3ZYbtaIavkAf5aV8P1noUyCGHCi0NGSeVESNHvFnYY=;
        b=vPSjaSJnH09+Nd5iIQLrob3VPe5e8LMqw+mj9mNoRAGXbSHitpigDutj9hoDLjXukG
         aWbudE0vUZpn8d3TDSIYW6BGaw1TdCjCbYQdwTnhrhvJrFl/cRtfEbcdBfblKnYlsP9Z
         6D6ggANCk0tsDMPR2zBvXv6wWPU9m2jnTo4ruW4KGUBWtT3CsRpFbD36ISEZZHCc4tPF
         dcL8/IaNZBLdFRr/oQqtCbuoIB52AK+iwtr+CM0r9XPGismvn3yBKYtmcTAWSCjeDv/k
         aFhygEesmcKM+/RNIBOGk/CwRo8lEV04TTD+fwt8SfsVcDP6E7p9Yd63Wti6EG+P8D9J
         cN9w==
X-Gm-Message-State: AO0yUKX9ftBaCV45aGFa2Hg3J+klxFoGdPM87yQUFYE3o3oHGMhBZZn6
	IVXg9HfKdIUT/LNAADHSWeat7ABsONkubPcaKxex/w==
X-Google-Smtp-Source: AK7set8NvDoA9gf4AicHigBtu9UpVuZVLhwEfuP2Vzy2j1FjpsC9TsZ1y3DDjZctSawx3/ctiEaprHJ0rsQLVFXvU3g=
X-Received: by 2002:a63:dd43:0:b0:4da:af6:ed with SMTP id g3-20020a63dd43000000b004da0af600edmr1187478pgj.30.1675364449073;
 Thu, 02 Feb 2023 11:00:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230202-dm-parenthesis-warning-v1-1-ebdee213eeb9@kernel.org>
In-Reply-To: <20230202-dm-parenthesis-warning-v1-1-ebdee213eeb9@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 2 Feb 2023 11:00:37 -0800
Message-ID: <CAKwvOdnffHbU4ObT2jDr_iASEC==CUsX2FfqdA-+iLU4y5Ma=g@mail.gmail.com>
Subject: Re: [PATCH] dm flakey: Fix clang -Wparentheses-equality in flakey_map()
To: Nathan Chancellor <nathan@kernel.org>
Cc: agk@redhat.com, snitzer@kernel.org, trix@redhat.com, 
	sweettea-kernel@dorminy.me, mpatocka@redhat.com, dm-devel@redhat.com, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 2, 2023 at 9:00 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Clang warns:
>
>   ../drivers/md/dm-flakey.c:369:28: error: equality comparison with extraneous parentheses [-Werror,-Wparentheses-equality]
>                           if ((fc->corrupt_bio_rw == WRITE)) {
>                                ~~~~~~~~~~~~~~~~~~~^~~~~~~~
>   ../drivers/md/dm-flakey.c:369:28: note: remove extraneous parentheses around the comparison to silence this warning
>                           if ((fc->corrupt_bio_rw == WRITE)) {
>                               ~                   ^       ~
>   ../drivers/md/dm-flakey.c:369:28: note: use '=' to turn this equality comparison into an assignment
>                           if ((fc->corrupt_bio_rw == WRITE)) {
>                                                   ^~
>                                                   =
>   1 error generated.
>
> GCC only warns when one set of parentheses are used for assignment
> expressions, whereas clang additionally warns when two sets of
> parentheses are used for equality comparisons. Remove the extra set of
> parentheses to silence the warning as it suggests, as this is obviously
> supposed to be an equality comparison.
>
> Fixes: 0e766389cedc ("dm flakey: fix logic when corrupting a bio")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1798
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> I do not mind this change being squashed with the offending commit, as I
> noticed it was Cc'd for stable, which would minimize the chance for
> breakage.
> ---
>  drivers/md/dm-flakey.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/md/dm-flakey.c b/drivers/md/dm-flakey.c
> index 08f9aa476d97..335684a1aeaa 100644
> --- a/drivers/md/dm-flakey.c
> +++ b/drivers/md/dm-flakey.c
> @@ -366,7 +366,7 @@ static int flakey_map(struct dm_target *ti, struct bio *bio)
>                  * Corrupt matching writes.
>                  */
>                 if (fc->corrupt_bio_byte) {
> -                       if ((fc->corrupt_bio_rw == WRITE)) {
> +                       if (fc->corrupt_bio_rw == WRITE) {
>                                 if (all_corrupt_bio_flags_match(bio, fc))
>                                         corrupt_bio_data(bio, fc);
>                         }
>
> ---
> base-commit: 6f30cc248507ee96c22ff4c3cbc86099ff12b7a9
> change-id: 20230202-dm-parenthesis-warning-6139f4b5020b
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>


-- 
Thanks,
~Nick Desaulniers
