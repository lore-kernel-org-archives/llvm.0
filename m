Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA853749F1
	for <llvm@lists.linux.dev>; Tue,  7 Jul 2026 14:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783436280; cv=none; b=aBbAoU1XFMx9r3tALtNaG2FQjAud4kIMQbSoExRh1GDuSF0h+bCwwa9HFTk5OrGMbXwT3qG2t66NG2Ih/1OoJ4kooVTcStDByY+gncl+3pNTeTUfovvup3zb1VXCEXFDioxkQT2x8YTaU618hw5WR+qymmp7MagG2Uo5WUy4EqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783436280; c=relaxed/simple;
	bh=34cmiOT4AUQDB6/wgRLO9dq+0zBHPmY/oLQ2eesmocI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=S8yPCO8X3HvuhzARdyEQGs3MTPJsM+8c7SFjvqLIyW7PCP3MQKU5XN3CRHeKUPsXc5LASf7SG/xFo8cLDcwXn2zQej0XaO42zfXzJaT1Y4bu6uEYalSvQt6J1YSuMJlYsCdk2+5hNPxWrx/axO8c46fr1U1X0hLMjDDRGO1Tjxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E9SVT7vi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E9SVT7vi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783436278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mFGcKpezQc2FdGn9v+N6oSZlIFNYCsG+Imjq35hvLSI=;
	b=E9SVT7vi6Lww6EGIh/IKrxH0o9lrkI36Hk5zNvITsgEwMXfnS4NLfzG1vRJPsNpsbHXMA8
	bQQLdu/23SjjdkRHtlLHIcJWa4aSm+o7ywC06qZGbKQmduzKFIFtL2VkEDo1vFVQuYCbI4
	H4aGd2XzLiIEtKrNXfZvdvYAsuz1WIM=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-fFFQ5pzZNbaREBivR5Spcg-1; Tue, 07 Jul 2026 10:57:56 -0400
X-MC-Unique: fFFQ5pzZNbaREBivR5Spcg-1
X-Mimecast-MFC-AGG-ID: fFFQ5pzZNbaREBivR5Spcg_1783436276
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e9fa2cd5c9so5608910a34.2
        for <llvm@lists.linux.dev>; Tue, 07 Jul 2026 07:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783436276; x=1784041076;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mFGcKpezQc2FdGn9v+N6oSZlIFNYCsG+Imjq35hvLSI=;
        b=Vi7ooWwai71fmKMdxED8ciRpbYGEqRVq35TDkUN2ux7Myw62h12CENsQT4n9YiWrYY
         3Jowa3V989/wySVm7BMb7JXkkPAPGroGsrAQvL84IYlkrtyPR5bUIK+1hClvAaA1ic/+
         9GVSa/kae1tacAb4bxtgUze1UzvxZTqi6w6frYegNi2nFdIoyXN6fo5sBbJwrrkKWWZr
         NOWVDTcMbIeTdt1c490b8hHDI79qybdj/aDxBxbB0IRB/BkojqvBxIIH8g/FauFHxsAC
         AUm6cCE9L9keRNOZAT6X9usctBDF/d2teCd0Db8SWvHr8jF07fzpU9mHO5XWKDEC5zST
         gHzg==
X-Forwarded-Encrypted: i=1; AFNElJ/1BrxpvhNTnfBnVIPP7cSim2wJ9zeG+vwExDF+rio9eSNB8DBUHjg/YjkHkqeyT0ihUBlk@lists.linux.dev
X-Gm-Message-State: AOJu0YyNhLmH0rYPjpZhA2OK+g6KNOjoq3nNx3fSsr36FbhemaPJ7psR
	zqyDYVq5Nl49TModQWlpmXeujuuHr5app15uMnTGGyRtEga19WoqxTJBk52hNiMVbogsaxKEojm
	vVzxkaxBiuHoXJNjK2P4y+CtrdCaSC5DTJ/39fomZcXJvoicNUiHYZhg=
X-Gm-Gg: AfdE7cnIDfzQY8065l3GR7FkieYOjzzYoCYCLwL4UV2o6gsJALi2wbnKUn2cNOMjEtE
	qPiN6VAJElle0r2AGpBJUAUKxZo/10Uh6bQZfGif4UGCx1PuMTx9eI80HKHAjfm0sqglyz+WKN+
	3oJtkFwHSmdCyP6aI+2JVrujvloxTKarjedUV5A8+MRNYuaQPckUbcihjdaFffn8t3E56/RqWZv
	f8UkFDRRJ9d5hxV+u+fSZblCJpruz1D/+0bUJdZJLbs3kDAG4/fgfKJmVs6+XjgkBb+5QTC5hYC
	vAuYHM3nPwFmq9gHEXQSCUu+9RBYqPcvZ5s+S/bAV1NfLOlz6n7iwNSTqefcK8iPYgQ/jEnk5vv
	o5PUEOeC3
X-Received: by 2002:a05:6830:660a:b0:7e9:f8e8:d8fb with SMTP id 46e09a7af769-7ebb231d6c0mr3396723a34.21.1783436275986;
        Tue, 07 Jul 2026 07:57:55 -0700 (PDT)
X-Received: by 2002:a05:6830:660a:b0:7e9:f8e8:d8fb with SMTP id 46e09a7af769-7ebb231d6c0mr3396674a34.21.1783436274867;
        Tue, 07 Jul 2026 07:57:54 -0700 (PDT)
Received: from redhat.com ([2600:382:850a:55b4:731e:b0d4:e0cc:410])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb542d017csm14082217a34.8.2026.07.07.07.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:57:54 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:57:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCHv2] clk: thead: allow COMPILE_TEST builds
Message-ID: <ak0T7zxwwSn_L57X@redhat.com>
References: <20260707005619.1229238-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260707005619.1229238-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dQXmvz4rnTHSkKfANVY_sqD9RrpV8KRruBsW09XvrJc_1783436276
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 06, 2026 at 05:56:19PM -0700, Rosen Penev wrote:
> Follow the pattern of many other directories in this Makefile (sunxi-ng,
> tenstorrent, ti, etc.) by using obj-y. This allows COMPILE_TEST to
> select the driver without having CONFIG_ARCH_THEAD enabled
> 
> Tested with:
> make LLVM=1 ARCH=loongarch drivers/clk/thead/
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

