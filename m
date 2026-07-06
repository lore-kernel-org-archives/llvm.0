Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85C23AFCEE
	for <llvm@lists.linux.dev>; Mon,  6 Jul 2026 17:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783358467; cv=none; b=rtUXBv8t7EWFJUyRZvE+S/TjSznygfENCsJWBnI/LePuEwUzmu0c/E2PI2O1xAIObbsIm7D4nZy0dxDZSRtTPK73fijfeQwoINm6kSGU/5xOMyG6RPjCbh0WnIu1GvsiKFuHjaWXqnR0AohVQoVhbUiBZP8r5BPt/Y32mW5KrvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783358467; c=relaxed/simple;
	bh=1gH8j5okrpqIA0iLWhjcokSK0dlKOpJ+lgKuf6n1R68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=YzhSkTlRCF/d/mZSmsLawbkdY/YbBproJGaFy0RC4qwW6fq2uHU5Y1DtbiQ/c8/3/dV+t1fzL2FahP8iKtfyGo7MlGZ8FllJa/MPHY20UvslqHUlauSVcR2pCXdy9WmrOFZ1OAq/UykMX2BO1nZViRnTqw/1rVHYjg8QSLfbrXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Sic9t3ry; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Sic9t3ry"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783358465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LcdPITzALTLRlqq4s+4MTvnfbA8hSOqu2xInA+fGf3o=;
	b=Sic9t3ryAlcI0MrychRfcW25G3Eid/WCjLQQD6GaeVdkxRwCN0BWxGRrGGos+sOzLXc4L8
	u0V266NOV3cZ//b6ETQI3ZPM6v0XtpEdSpOoqBMArf/86VQdo+2mOApYJ7mYzaAZ6SUwHi
	gmUtJbEzkYTOWl4Wusqnvt6qUakaNmc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-OpFsPIw_OmC059DDeW03ww-1; Mon, 06 Jul 2026 13:21:02 -0400
X-MC-Unique: OpFsPIw_OmC059DDeW03ww-1
X-Mimecast-MFC-AGG-ID: OpFsPIw_OmC059DDeW03ww_1783358462
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91ed0e140c5so593871785a.0
        for <llvm@lists.linux.dev>; Mon, 06 Jul 2026 10:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358462; x=1783963262;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LcdPITzALTLRlqq4s+4MTvnfbA8hSOqu2xInA+fGf3o=;
        b=hxqvF342jDXf9gneuNc3X4wraVv3flm1XgVn7eP+gldRZsNyFRTx8zhSrLIhACn6eD
         tkv7vibVhAuzpdDokKYnFRGl7DYK3apSEk7hEwunGSLDmGHTZ+KENvFWfkO45x4F2vxV
         dKbsVahSmhjynHbC5jxzr/qyBugq/mtrb31HhqVAgBG013TjaYCP+VyrjidzJVhUrrWx
         VaJ+FsfwSnSPagKg/LaKPT6pTgnAGy5KOMKemAuWN7425mslgvbgsk3CebFf7LOwRWpU
         WOPeK0cf0oAPKNGaCE6Q7n6U1a79cSBsNmOjBL/pOxwRW9fPayCgcQ3i6SiK8kp0nQ2u
         oJ5g==
X-Forwarded-Encrypted: i=1; AHgh+RrueqFlfknAKxc4KlbnoEPPSpNeUeY/3vKALnVdV1ne8Oe7LLkqtVRPnxDQFj9WbMMIlgEl@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3ctFHAH2U3WIny0R+nnu/yQiuaVgaYR8iaNHu+qYLhzT3ejQd
	s8TXxurXi5lODk7cxxrxSQwKoNuj6yD5+aG7m04TcLU2HzW7zBHPX7mDsw+iJMmSlcFPAfS0gCq
	xraNGJqtoqaqRlcW3c8SnE9IKtRVxDSG0w5GMzwPLQHo7w0Icb5si3Jg=
X-Gm-Gg: AfdE7cnyNrNrfsmcEJRtdBzw4WMbaSr+QvOhgdF6OOE60vncXGizeT5jiIuIO3lM5t8
	EBgz291DrQbg+vuYcPj0UX7ojoRTwl7cTk4mZRGUR5dOvO06fw+KqW3wFvQqySeJVVa5WTsqrB/
	WLNrt3wj2xMpXeeTVzOcACHbpq8O+fvENllAMLbLfYKgaYurkv8TRw3OZ+RvIC2sHbRewEIW1tN
	akXKD+e953/6bC3uvF+pU2KvJ0+Pd+nUDkIWlnRo7kR/1nP00vWYz3tXF8HZsO8ArRdSjiJifYI
	UWPUkSpHYdHkBirdPi5LDU5oDPw6A0Pb7CKDgvrq4y0yPwTckF0tD4y77zTimLt87PGx+dBXOXB
	b1cgYCyWweHhlh3GkHwuF2Jazn80PA2b+I2CxMpDDjLKTMg==
X-Received: by 2002:a05:620a:31a3:b0:92e:5b92:98bb with SMTP id af79cd13be357-92ebb4b571dmr216558185a.14.1783358461610;
        Mon, 06 Jul 2026 10:21:01 -0700 (PDT)
X-Received: by 2002:a05:620a:31a3:b0:92e:5b92:98bb with SMTP id af79cd13be357-92ebb4b571dmr216552185a.14.1783358461159;
        Mon, 06 Jul 2026 10:21:01 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90ccde4fsm991108485a.39.2026.07.06.10.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:20:58 -0700 (PDT)
Date: Mon, 6 Jul 2026 13:20:53 -0400
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
Subject: Re: [PATCH] clk: thead: allow COMPILE_TEST builds
Message-ID: <akvj9WXsHJw5-n2p@redhat.com>
References: <20260629032814.2344879-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260629032814.2344879-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: huk5upPmw9lkQO80a9LXoQjLXJxGF1mL49eqvsapxYU_1783358462
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rosen,

On Sun, Jun 28, 2026 at 08:28:14PM -0700, Rosen Penev wrote:
> CLK_THEAD_TH1520_AP already allows COMPILE_TEST, but the parent clock
> Makefile only descends into drivers/clk/thead for ARCH_THEAD.  Use the
> TH1520 AP clock symbol for the directory gate instead.
> 
> This lets the driver build on other 64-bit architectures selected for
> compile testing without selecting the T-HEAD platform.
> 
> Tested with:
> make LLVM=1 ARCH=loongarch drivers/clk/thead/
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/clk/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 68145ad91035..d651e4ed3462 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -157,7 +157,7 @@ obj-$(CONFIG_ARCH_SUNXI)		+= sunxi/
>  obj-y					+= sunxi-ng/
>  obj-$(CONFIG_CLK_TEGRA)			+= tegra/
>  obj-y					+= tenstorrent/
> -obj-$(CONFIG_ARCH_THEAD)		+= thead/
> +obj-$(CONFIG_CLK_THEAD_TH1520_AP)	+= thead/

Right now, CLK_THEAD_TH1520_AP is the only Kconfig defined in the thead
subdirectory. What about when/if someone adds a second Kconfig, and
that's the only one that's enabled?

Would it be better to have this as obj-y?

Brian

