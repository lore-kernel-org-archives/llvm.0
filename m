Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473134C62
	for <llvm@lists.linux.dev>; Fri,  9 Sep 2022 17:06:29 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id j6-20020a170902da8600b00176a4279ba4so1618965plx.18
        for <llvm@lists.linux.dev>; Fri, 09 Sep 2022 10:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=+dBYz90mu90lIiOo6JMMkRfvVSiBxRyF6ljXVUnQrCw=;
        b=Py30OtJBq9XoSZQz8kw+7Sj58/fGxNwbWhBckzHo0L80w9/6JyTd8jbzYkJyzqqGoB
         aslp4sJfC2tdUW1z/zabgBigIThpPsfmSYCeFxjZtBmND2hgKHri7WcpXERnswiT9u4F
         UE3sRmTRJDRRZN4kHskX635YLnDbpepPp7SXMZdV9+qLOEXNV/nIEYRXcb1VW3ODygaN
         b1UGAR5QfYXLArqfWgd/EkqwnSZPx8mJdOsLEAUuGntOpvmUUvQPfAi9M8f9aFA+bfLO
         kR1X4XtB2IJeiULDEoe/LoCMFb72NWLbJR0stI0HSJnnJy3SkMLZYCbc+pPXuFjLLi5H
         e1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=+dBYz90mu90lIiOo6JMMkRfvVSiBxRyF6ljXVUnQrCw=;
        b=dJB03VGn/yYVSNFgBRzmAKvtfsvW0JJ4JmVh+KQCWbgWHqLTnO2Hgs2a4ibCjqWROC
         jBSkQambx/jyZTHDzOTeslrHTH2iurR4s+o6cxFT64WzxJ4GwcfqSBCVbab/tTtx7QUp
         ytushkK5YqyYo1ErlSqfPR04NjYwWa+RKws5tRjTmnWfPxiHYSa8C/U445seoZBO8hSx
         IldwLeibumxwVWothcOG8IFIiJ4+0xZ6PCqTz++6rb6JozN5IyfOG8fPGd2tFu7JamNE
         c3izxoHoboMCzBIDDUx6OMR7fDg4zZ8J1J7EchRNRPee2FOG+VxHyBincffiSdGCg+HJ
         v3FQ==
X-Gm-Message-State: ACgBeo3rBrqoWkDegc5OEFhD4z8xebcRuEi3zxUBmzeajajwHFyJde5g
	/oMZGSGpU1p1oc17YNM7yg5ef+U=
X-Google-Smtp-Source: AA6agR5PFY27vZflpYbySQhbsJcOn2PebC/wEqF5OfnfuYU2ZjUHxthLaXwx4TpzGMOFy5wgD/Wkn3s=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:a05:6a00:1909:b0:536:65dd:44ca with SMTP id
 y9-20020a056a00190900b0053665dd44camr15602323pfi.1.1662743188662; Fri, 09 Sep
 2022 10:06:28 -0700 (PDT)
Date: Fri, 9 Sep 2022 10:06:27 -0700
In-Reply-To: <1662702346-29665-1-git-send-email-wangyufen@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <1662702346-29665-1-git-send-email-wangyufen@huawei.com>
Message-ID: <Yxtyk/Sxr0L7S22D@google.com>
Subject: Re: [bpf-next 1/2] libbpf: Add make_path_and_pin() helper for bpf_xxx__pin()
From: sdf@google.com
To: Wang Yufen <wangyufen@huawei.com>
Cc: andrii@kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	martin.lau@linux.dev, song@kernel.org, yhs@fb.com, john.fastabend@gmail.com, 
	kpsingh@kernel.org, haoluo@google.com, jolsa@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	davem@davemloft.net, kuba@kernel.org, hawk@kernel.org, nathan@kernel.org, 
	ndesaulniers@google.com, trix@redhat.com, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

On 09/09, Wang Yufen wrote:
> Move make path, check path and pin to the common helper  
> make_path_and_pin() to make
> the code simpler.

Idk, I guess I'll defer to Andrii here; I won't really call it simpler.
The code just looks different and looses some observability (see below).

> Signed-off-by: Wang Yufen <wangyufen@huawei.com>
> ---
>   tools/lib/bpf/libbpf.c | 56  
> ++++++++++++++++++++++----------------------------
>   1 file changed, 24 insertions(+), 32 deletions(-)

> diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> index 3ad1392..5854b92 100644
> --- a/tools/lib/bpf/libbpf.c
> +++ b/tools/lib/bpf/libbpf.c
> @@ -7755,16 +7755,11 @@ static int check_path(const char *path)
>   	return err;
>   }

> -int bpf_program__pin(struct bpf_program *prog, const char *path)
> +static int make_path_and_pin(int fd, const char *path)
>   {
>   	char *cp, errmsg[STRERR_BUFSIZE];
>   	int err;

> -	if (prog->fd < 0) {
> -		pr_warn("prog '%s': can't pin program that wasn't loaded\n",  
> prog->name);
> -		return libbpf_err(-EINVAL);
> -	}
> -
>   	err = make_parent_dir(path);
>   	if (err)
>   		return libbpf_err(err);
> @@ -7773,12 +7768,27 @@ int bpf_program__pin(struct bpf_program *prog,  
> const char *path)
>   	if (err)
>   		return libbpf_err(err);

> -	if (bpf_obj_pin(prog->fd, path)) {
> +	if (bpf_obj_pin(fd, path)) {
>   		err = -errno;
>   		cp = libbpf_strerror_r(err, errmsg, sizeof(errmsg));
> -		pr_warn("prog '%s': failed to pin at '%s': %s\n", prog->name, path,  
> cp);
> +		pr_warn("failed to pin at '%s': %s\n", path, cp);

This seems to be making logging worse?
We went from "can't pin 'program name' to 'path': ENOENT" to "can't pin
to 'path': ENOENT". You can deduce the program name from the path, but
why not keep the proper log message?

>   		return libbpf_err(err);
>   	}
> +	return 0;
> +}
> +
> +int bpf_program__pin(struct bpf_program *prog, const char *path)
> +{
> +	int err;
> +
> +	if (prog->fd < 0) {
> +		pr_warn("prog '%s': can't pin program that wasn't loaded\n",  
> prog->name);
> +		return libbpf_err(-EINVAL);
> +	}
> +
> +	err = make_path_and_pin(prog->fd, path);
> +	if (err)
> +		return libbpf_err(err);

>   	pr_debug("prog '%s': pinned at '%s'\n", prog->name, path);
>   	return 0;
> @@ -7838,32 +7848,20 @@ int bpf_map__pin(struct bpf_map *map, const char  
> *path)
>   		map->pin_path = strdup(path);
>   		if (!map->pin_path) {
>   			err = -errno;
> -			goto out_err;
> +			cp = libbpf_strerror_r(-err, errmsg, sizeof(errmsg));
> +			pr_warn("failed to pin map: %s\n", cp);
> +			return libbpf_err(err);
>   		}
>   	}

> -	err = make_parent_dir(map->pin_path);
> -	if (err)
> -		return libbpf_err(err);
> -
> -	err = check_path(map->pin_path);
> +	err = make_path_and_pin(map->fd, map->pin_path);
>   	if (err)
>   		return libbpf_err(err);

> -	if (bpf_obj_pin(map->fd, map->pin_path)) {
> -		err = -errno;
> -		goto out_err;
> -	}
> -
>   	map->pinned = true;
>   	pr_debug("pinned map '%s'\n", map->pin_path);

>   	return 0;
> -
> -out_err:
> -	cp = libbpf_strerror_r(-err, errmsg, sizeof(errmsg));
> -	pr_warn("failed to pin map: %s\n", cp);
> -	return libbpf_err(err);
>   }

>   int bpf_map__unpin(struct bpf_map *map, const char *path)
> @@ -9611,19 +9609,13 @@ int bpf_link__pin(struct bpf_link *link, const  
> char *path)

>   	if (link->pin_path)
>   		return libbpf_err(-EBUSY);
> -	err = make_parent_dir(path);
> -	if (err)
> -		return libbpf_err(err);
> -	err = check_path(path);
> -	if (err)
> -		return libbpf_err(err);

>   	link->pin_path = strdup(path);
>   	if (!link->pin_path)
>   		return libbpf_err(-ENOMEM);

> -	if (bpf_obj_pin(link->fd, link->pin_path)) {
> -		err = -errno;
> +	err = make_path_and_pin(link->fd, path);
> +	if (err) {
>   		zfree(&link->pin_path);
>   		return libbpf_err(err);
>   	}
> --
> 1.8.3.1

