Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22E31AA786
	for <llvm@lists.linux.dev>; Mon, 14 Oct 2024 12:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728910426; cv=none; b=V2E14DDDN3ovV+EhOlgdAJIQKzFBkSsBB90CvLpe9Zt1n+OgmSXDyeDSyMh0j7pSUqu8xpRooAAG5wNu9DUcxe/1YiOMI1yABBKgLyUivKyNqj61pF1vNVpZzJ0S8AYEC5xm84/0+aBdi7+DY2dqofzRgr9NxxFE7g6Ua0wMKS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728910426; c=relaxed/simple;
	bh=+pcu92eMqg+NHXSehZfy3gPTkISBMTAQR/PVez1N+qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kFWZ43UdC6dDQMT2V40qkIyA+6AehzuY26asacsnb8uGHredm1LnbkLy+D+J8Y1LJPRQ7yTkIYejo4Kut0aetnlRm3ITQwIPntlE87XFtVgMAuAN1YaT9PsSHSgNnl4fC3eu/cUSk8U0veuG2Eg1rzdEOHl47U3DeHPAW46j4xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g+plPr0S; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g+plPr0S"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a994ecf79e7so668263566b.0
        for <llvm@lists.linux.dev>; Mon, 14 Oct 2024 05:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728910423; x=1729515223; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SyCHsuV/E8d70gfcK9ip53tgwN234YxCxe5zH8xLMPY=;
        b=g+plPr0SMZ7MnLS8GqslsgbnbKg0AbR1x+cz5f3Ho72Dpeq76oW8+58cHT5u+jUZ17
         qztDan0hliIRZAdS00MwRVYQN3gBi4dxh47E2U7zJsON8tMwc66rmyYQ3cdZcB6zTdGk
         4ykkJfuYuWuuASh0HB4qcVc7T4D8mPwVzntAwP2U0x9eKrtEdSLhXYvt8rnEJpLivopv
         +WQ0resir75iYhaxGX5i+dqac3Q1CpJRhnYiLLCeE55tG8DRyvCt+2n8FVGuKgPRrdWv
         +y9LlrXSHOZi3J0FugHwcso0ybGd6tG1KhQlhe5YtvNzwrlPte0IC9irSwF0Fb07qZRG
         KF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728910423; x=1729515223;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SyCHsuV/E8d70gfcK9ip53tgwN234YxCxe5zH8xLMPY=;
        b=Q32pFNeP1RLXWttwsCj4LKpr4xnHlTq75a0HHorsCwduPZnBxI4Vncof0E0klO1eyq
         8oUDj6ZFA3ojHJxWT3gcDo1ZNfEOnYu/4I7vGHkGpy3f6Rhfjq7NPdXzFQSvCGHEpwGt
         M1IBydg8zl8s5hPdQys8uKv1nwI4UyXKjilR4gMT3WaPlG0+TlxHBTlZbtkmODyxWNKB
         ZElD3Q+5CbBzgKNCTcJP31+ykOYKcbfs+t0pji7HrfqfoWAzj24/c33bMZAvT1gexIXD
         bA1sHMrPIx8G1BhxDLGb0bPkIVCIuQUjFPYC6p9XdWXJH/Aw/I6mrprRSc8X78fbkY02
         7JIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWU1N927wAsXnHcWzJ1KRjFnn4FiSow9htvA9WelHm2dzz1K/ysfbyUuqu+eepp/uos+vcw@lists.linux.dev
X-Gm-Message-State: AOJu0YyklKJ8JV1dFWMnSdHWIGQDkb9/hFetFYh3eVReuCXN0bjrvVfj
	VNsh3ATNYommDmr33IgcbaQknAHcOtEdBtKHQ8P2l9iKIG6mL51yuUdHhXET6UE=
X-Google-Smtp-Source: AGHT+IHqHcsA+FZtp+v7kI5pgeIQE8uQgQTumNO5wX6KZkk6/bkHGwus6vrXYrx9c73EQIuXhgDQGA==
X-Received: by 2002:a17:906:c14c:b0:a99:6163:d4f8 with SMTP id a640c23a62f3a-a99b966b148mr1069583166b.58.1728910422787;
        Mon, 14 Oct 2024 05:53:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99f375db53sm303654866b.113.2024.10.14.05.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 05:53:42 -0700 (PDT)
Date: Mon, 14 Oct 2024 15:53:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: sfrench@samba.org, pc@manguebit.com, ronniesahlberg@gmail.com,
	sprasad@microsoft.com, stfrench@microsoft.com, tom@talpey.com,
	bharathsm@microsoft.com, nathan@kernel.org, ndesaulniers@google.com,
	morbo@google.com, justinstitt@google.com,
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] smb: client: fix possible double free in smb2_set_ea()
Message-ID: <8bd0fae3-82fe-41c4-a4e8-3c28aa2b1826@stanley.mountain>
References: <20241014113416.2280986-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241014113416.2280986-1-suhui@nfschina.com>

On Mon, Oct 14, 2024 at 07:34:17PM +0800, Su Hui wrote:
> Clang static checker(scan-build) warning：
> fs/smb/client/smb2ops.c:1304:2: Attempt to free released memory.
>  1304 |         kfree(ea);
>       |         ^~~~~~~~~
> 
> There is a double free in such case:
> 'ea is initialized to NULL' -> 'first successful memory allocation for
> ea' -> 'something failed, goto sea_exit' -> 'first memory release for ea'
> -> 'goto replay_again' -> 'second goto sea_exit before allocate memory
> for ea' -> 'second memory release for ea resulted in double free'.
> 
> Assign NULL value to 'ea' after 'kfree(ea)', it can fix this double free
> problem.
> 
> Fixes: 4f1fffa23769 ("cifs: commands that are retried should have replay flag set")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  fs/smb/client/smb2ops.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
> index 6b385fce3f2a..5b42b352b703 100644
> --- a/fs/smb/client/smb2ops.c
> +++ b/fs/smb/client/smb2ops.c
> @@ -1302,6 +1302,7 @@ smb2_set_ea(const unsigned int xid, struct cifs_tcon *tcon,
>  
>   sea_exit:
>  	kfree(ea);
> +	ea = NULL;

That's very clever.  But I think that it would be better to do the "ea = NULL"
near to the replay_again label.  There are some lines where we re-initialize
resp_buftype[], utf16_path and vars etc.

	ea = NULL;
	resp_buftype[0] = resp_buftype[1] = resp_buftype[2] = CIFS_NO_BUFFER;

regards,
dan carpenter

