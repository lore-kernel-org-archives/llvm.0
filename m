Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11D113698F
	for <llvm@lists.linux.dev>; Mon,  7 Oct 2024 19:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728330561; cv=none; b=sGncSptKr5z5HSEvuSrI4yMWnULcv0r7oCuKokDyxQgZsgCbjZFof9ujZTBgO3I4e8gRKdEVje3DWqaWIgGr/dGipBnaSLozaLkhARWn755hZmp0SQ2WnSa/T6KR6xKiuFZG0hU1NS4w4odgvlDbgxg1SS9IVk3XKD64pJWGgsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728330561; c=relaxed/simple;
	bh=8Gd7Yh9ugiHZGI075EwyVrZd+y8pLDwH4ULUlmcIRI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ls+MFA/I5mRzUp4jCN69rk83U5mptSbv/zPfr1QED2mGUVcSEF+8Ujx7zEPzI4F8MvLUmffU+6KA4KhWf2eyTD/Dtlmfn9hV0M3lbILBNNNY5qgBoBJzYVxS93m7XOPX3zEhgTX9axTnc2amT77GMFO2mDkaIlwVUQoQtjWKaVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RCDLYKwh; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RCDLYKwh"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37cfff59d04so3849277f8f.1
        for <llvm@lists.linux.dev>; Mon, 07 Oct 2024 12:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728330558; x=1728935358; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5U+djHkbGH9bmYxBFYhi152wGofyCvQbCOoPJ1yEabY=;
        b=RCDLYKwhtk54UeQv4XDDH9ImBlSNuaEHUrUceAgMaWHiVvFsr+XusHJKmdIp6wWNTX
         G5NApn25e5vFtrD3MjljLUnJndPGCChKrK5ja2HxmAYoFqCur2VHKI71XoTfYQ68WCkj
         uNK88h38A/DF23WDhqtrCbuug4BKXfYV+9as9k2vwfqaT8b8RVe0ZA9g9ZZoOtnYVliO
         oC8GeVu4XHiDv5GCl+7Fpl2wrQGLVkfvw+/R/KtOXrp/PLer50x8/dSTFmCRXX+D9+dO
         cSYApldVbNxTFpyUMyWelLiJUBB7t8F672jqbNjoKBapKWZMeHBgpgrxit/LXnBzYVx3
         42pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728330558; x=1728935358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5U+djHkbGH9bmYxBFYhi152wGofyCvQbCOoPJ1yEabY=;
        b=UM5N3W+03VHfX1lNeH99OkalC7SJahpB5WBmq0KGzoP0GTjTOfLJ8j36p4XYyZhVt+
         iDz2djDD/lVwi4qxcSx09aAM0wK5UTMs4Pbo56wd3qKa4P301HJuVhUWVqQMkxNl4kZz
         wwoUAV0/13aiUtiKS6BokIqANILCcHymvUlBb7lICqVUWpusDLPA1MYTXxIzTdloeR4e
         Lscqc/evqTOS8IDL4XnVX1qhjTFqvoph4+I66loO63a1rfN+N+zDXQVZR0y2G8a62QxH
         CQ4mXsP1z+GqEEROWSN+TE8oZlEdK64S0ccUKcqIy6TFjynNPwFJdyV3JXWFcpkAPgBL
         9E9A==
X-Forwarded-Encrypted: i=1; AJvYcCUlmZqap5eo0SFwW0H/0eioTbaHF/wyRhVHdQhOtCtl9IqX/OSewYtZ+L0uyH8oqf+crrgg@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/PSImUBazkU2gbETzHtjzvjpZZQ0G9jDQLX1oexZYndEyjP/M
	uZYOvKvYfW4P1gapt0Yqff8n2hhiYrAIPUNXFawHHsr10d0/mudTGiLDgQHfMA==
X-Google-Smtp-Source: AGHT+IGcAcEr2n2rg8KXWEoPTFoKO80/Kp6//QIp86lKGKaEhpv3dW0YGd+GSZ54auwEKCkehsqIKA==
X-Received: by 2002:a5d:410a:0:b0:374:c4c2:5ad5 with SMTP id ffacd0b85a97d-37d29316b33mr536273f8f.27.1728330558237;
        Mon, 07 Oct 2024 12:49:18 -0700 (PDT)
Received: from localhost (110.121.148.146.bc.googleusercontent.com. [146.148.121.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1690f34asm6400754f8f.3.2024.10.07.12.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 12:49:17 -0700 (PDT)
Date: Mon, 7 Oct 2024 19:49:15 +0000
From: Aleksei Vetrov <vvvvvv@google.com>
To: Andrej Shadura <andrew.shadura@collabora.co.uk>
Cc: linux-bluetooth@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev,
	kernel@collabora.com, George Burgess <gbiv@chromium.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: Fix type of len in
 rfcomm_sock_{bind,getsockopt_old}()
Message-ID: <ZwQ7OzSSWZHM4XqS@google.com>
References: <20241002141217.663070-1-andrew.shadura@collabora.co.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002141217.663070-1-andrew.shadura@collabora.co.uk>

Hi Andrej,

On Wed, Oct 02, 2024 at 04:12:17PM +0200, Andrej Shadura wrote:
> Change the type of len to size_t in both rfcomm_sock_bind and
> rfcomm_sock_getsockopt_old and replace min_t() with min().

rfcomm_sock_bind doesn't use copy_to_user, are you sure it has the same
issue?

> @@ -328,14 +328,15 @@ static int rfcomm_sock_bind(struct socket *sock, struct sockaddr *addr, int addr
>  {
>  	struct sockaddr_rc sa;
>  	struct sock *sk = sock->sk;
> -	int len, err = 0;
> +	int err = 0;
> +	size_t len;
>  
>  	if (!addr || addr_len < offsetofend(struct sockaddr, sa_family) ||
>  	    addr->sa_family != AF_BLUETOOTH)
>  		return -EINVAL;
>  
>  	memset(&sa, 0, sizeof(sa));
> -	len = min_t(unsigned int, sizeof(sa), addr_len);
> +	len = min(sizeof(sa), addr_len);
>  	memcpy(&sa, addr, len);
>  
>  	BT_DBG("sk %p %pMR", sk, &sa.rc_bdaddr);

This change produces a compilation error around min expression, as
"kernel test robot" notices below. And I think rfcomm_sock_bind
shouldn't be touched at all, it doesn't use copy_to_user and doesn't
produce compile errors with latest Clang.

> @@ -729,7 +730,8 @@ static int rfcomm_sock_getsockopt_old(struct socket *sock, int optname, char __u
>  	struct sock *l2cap_sk;
>  	struct l2cap_conn *conn;
>  	struct rfcomm_conninfo cinfo;
> -	int len, err = 0;
> +	int err = 0;
> +	size_t len;
>  	u32 opt;
>  
>  	BT_DBG("sk %p", sk);
> @@ -783,7 +785,7 @@ static int rfcomm_sock_getsockopt_old(struct socket *sock, int optname, char __u
>  		cinfo.hci_handle = conn->hcon->handle;
>  		memcpy(cinfo.dev_class, conn->hcon->dev_class, 3);
>  
> -		len = min_t(unsigned int, len, sizeof(cinfo));
> +		len = min(len, sizeof(cinfo));
>  		if (copy_to_user(optval, (char *) &cinfo, len))
>  			err = -EFAULT;
>  

This looks ok. But there is the same pattern in rfcomm_sock_getsockopt
(without old prefix) and it also uses copy_to_user and produces compile
error with latest Clang.

Could you remove rfcomm_sock_bind patch and apply it to
rfcomm_sock_getsockopt instead? Or I can send my version of the patch:
we've encountered the same compile errors in rfcomm_sock_getsockopt and
rfcomm_sock_getsockopt_old after updating Clang and would like to get it
fixed.
