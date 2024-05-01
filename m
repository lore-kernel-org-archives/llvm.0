Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5160B1474B1
	for <llvm@lists.linux.dev>; Wed,  1 May 2024 20:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714593857; cv=none; b=JX+KckDOMM4IRNBBDm/P1jK/kNCxaCq3ekguGZ4/phO5VNXTFQ9Bp7zxiUpV/eGzMJYyml3cKfkfE9kjjOyOUmgHM2WR8QVd9SnwIShWEpV+uI1VCV5kss7h1qV83CbPshPM863ayIJU9K7mJE/IiWIKSZR5vfRbu3x6O3D4JcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714593857; c=relaxed/simple;
	bh=goFmT9k+2JBPJZfg9ckRb9nR9k6bSBMAukkNNw6B6Hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KOo8uZEQb7EleHtlRZhgYJL8Fmwm3z8GlLHSsaIa4rTllTbKlR7cNdJ0QJSDYac50MiCVCJioSe79JveUkrpVIHMw3WkquPwbMVoTOCwxm++4qgfBBYgy0EZckHAIzmj5FCqr2nFK4NNNIPj90x6mVq23xjVQyYKQywWc2XEgwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VR5sNKaD; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VR5sNKaD"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7dee8d177e1so44395239f.2
        for <llvm@lists.linux.dev>; Wed, 01 May 2024 13:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714593854; x=1715198654; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=la4DlPMR/LfwCzRSAUSsTV1pUfLPTBPpS3kAQ67eY88=;
        b=VR5sNKaDTq2lkTidpzn4ljv2dOeLTdZgoFrgO6gUOVm4PknmU9Bb1yET86jhK+ElQI
         FJ8aSweH8pXYDS72R4uHIx2m/MDp1pKJdwAznleSUzjZGpQzJ3uRfvgTvRbDoWDuwZpa
         DljAXmbhGV3QSssTDtYQtT6LFIrrKsktR+3r6aEzl+ivw5KDEc8PjuRv8BjXI/zC4E3j
         6k3zU3/OGjLAnpSU2YJBarz1a16F2eMXdDBxRa7MRgTqNwfpFeDzfRAjoq/pKjIZTQLn
         qoIp217WHkLfe1kkyzpwFSNuJsMARwDktlfEdlxz8P4d/HXQ/bX8OnW+FSRoNlJ3aq8C
         edLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714593854; x=1715198654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=la4DlPMR/LfwCzRSAUSsTV1pUfLPTBPpS3kAQ67eY88=;
        b=bRJ/3wBeFhA6KUuCBPqj0HziPjbAkBdw5229HAfyuthM17tZUkkNhOKuk2TTZZfSgS
         epa8EAFkaud/pGTZ371fEAEliwUFlJaZ5tFr1o7BST8pfbimFk1qQido0JFk9mXJgvhz
         OdkwLgTVNURpDhEfN1M1P0tRNz+khsnWFvvEsu78Sn5sicVUMVbioFkgoaHUFrDtKMQZ
         z3p4d5iOOXvFf8fP6PmmYjs/oSMLWSVRj+FtYKnBv0u8Y0RHgt58iDbUclBibKCvMzI7
         +epWd4HD+2QIUj7Jnv9UddNBGl6PKBgZhy+EsVqgxFS/qvxCu5H2ObL5gK921sN5RsYH
         yRIw==
X-Forwarded-Encrypted: i=1; AJvYcCVfM3FtKqhIyBw6cOhSbif5AN2wLN011TXpdTy5hwuJkQ6yU3V+22UEteAyS/sU5n+8psdNP1Mg+J5/680/3/52CjLwxQ==
X-Gm-Message-State: AOJu0YzKKDHoTbG+pTmALlhuTYk2zqZXy+4Bor6XZyJAaBl4hpBjLA5u
	7gJtroxphTb4NnRSbY0Y1zg+wbL8Jx8OaP5PNAQCtYGNVOp++OMTbBHiPhDHvA==
X-Google-Smtp-Source: AGHT+IEEEQZDWGpMnb8dlVbqbwAhZplRKDs07yBgDxjFH/4t0U8l/v9WICZttfLVrjYYi7DRpJYwqQ==
X-Received: by 2002:a5e:c80c:0:b0:7de:ca48:4fab with SMTP id y12-20020a5ec80c000000b007deca484fabmr4120481iol.2.1714593854425;
        Wed, 01 May 2024 13:04:14 -0700 (PDT)
Received: from google.com (195.121.66.34.bc.googleusercontent.com. [34.66.121.195])
        by smtp.gmail.com with ESMTPSA id f3-20020a056638168300b00487bf7fcf5csm1925536jat.179.2024.05.01.13.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 13:04:13 -0700 (PDT)
Date: Wed, 1 May 2024 20:04:11 +0000
From: Justin Stitt <justinstitt@google.com>
To: Erick Archer <erick.archer@outlook.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, 
	Xin Long <lucien.xin@gmail.com>, Kees Cook <keescook@chromium.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, linux-sctp@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] sctp: annotate struct sctp_assoc_ids with __counted_by()
Message-ID: <jtcun2xb3ekurqekt4ckgvu2a2hgqyidkno5a5wwy4br54cqdo@riyxzf3kxtn6>
References: <AS8PR02MB723728DA244A82D97342D6498B192@AS8PR02MB7237.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR02MB723728DA244A82D97342D6498B192@AS8PR02MB7237.eurprd02.prod.outlook.com>

Hi,

On Wed, May 01, 2024 at 07:01:22PM +0200, Erick Archer wrote:
> Prepare for the coming implementation by GCC and Clang of the
> __counted_by attribute. Flexible array members annotated with
> __counted_by can have their accesses bounds-checked at run-time via
> CONFIG_UBSAN_BOUNDS (for array indexing) and CONFIG_FORTIFY_SOURCE
> (for strcpy/memcpy-family functions).
> 
> Suggested-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Erick Archer <erick.archer@outlook.com>
> ---
>  include/uapi/linux/sctp.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/sctp.h b/include/uapi/linux/sctp.h
> index b7d91d4cf0db..836173e73401 100644
> --- a/include/uapi/linux/sctp.h
> +++ b/include/uapi/linux/sctp.h
> @@ -1007,7 +1007,7 @@ enum sctp_sstat_state {
>   */
>  struct sctp_assoc_ids {
>  	__u32		gaids_number_of_ids;
> -	sctp_assoc_t	gaids_assoc_id[];
> +	sctp_assoc_t	gaids_assoc_id[] __counted_by(gaids_number_of_ids);

Crucially, gaids_number_of_ids is assigned before any accesses to
gaids_assoc_id[] are made.

|	ids->gaids_number_of_ids = num;
|	num = 0;
|	list_for_each_entry(asoc, &(sp->ep->asocs), asocs) {
|		ids->gaids_assoc_id[num++] = asoc->assoc_id;
|	}

So this looks good to me.

Reviewed-by: Justin Stitt <justinstitt@google.com>

>  };
>  
>  /*
> -- 
> 2.25.1
> 

Thanks
Justin
