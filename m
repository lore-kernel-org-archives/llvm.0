Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6A63FF8B6
	for <llvm@lists.linux.dev>; Mon, 11 May 2026 14:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778511024; cv=none; b=hfXdYB4lHbZmOSPRecS0iBOZXgTfomYU4/maAwt5TuainBiVcSVAoum8Q0EZGeGBTrjEyvJ5OSV2PGbhkho5l1kMV0a7snObNQMHqKnkwiXdm41VJHZUGQood9hi9zRnmJ6BB/7krN+geSmyzlY+tqYVNuWQAx5JPblFRMNs4HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778511024; c=relaxed/simple;
	bh=fOUrQa8a/QDDUgkEhNreHMWABSJfDyt7tmdq34/bNjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Sy1K7GkWaW+FBuK8XkUwKUOLE2ezh8o/FkATqn5GJpI8FngephMwMf42oZAF4NvKyeB1B+7ZDwzNEKtZZfOQbYS8+UHvPjUwC1N/HQ+gOL69U2kmAOSgSr9KKviLkSB+HOMV68QDV/o5TkhBmLtaTwKgAoQYgxIQ4GzUoj7StTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PRDXFDch; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PRDXFDch"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778511019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ffz+WS/kwatrVzg+MFiCHc5tqdSu3w6k7GM/epuJ1A=;
	b=PRDXFDchhEMHXXxFmKnshK2j1jFgX+xL5e1LVCYstyrFC45jGTlgmxZ3UXTVv7yrb3AiiX
	yO3bJNH82oGqxd53U+BGvBdsZEurRkIpsiz/FWeHDnfr0lgHGtf06jLMnFUTXdAp+yWCxU
	7Q9OO86M6UYnkRcBnmBXjlBPeZdS1o0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-k-btEv8TOO69GF6MFP9IcQ-1; Mon, 11 May 2026 10:50:18 -0400
X-MC-Unique: k-btEv8TOO69GF6MFP9IcQ-1
X-Mimecast-MFC-AGG-ID: k-btEv8TOO69GF6MFP9IcQ_1778511018
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fb3403e99so76050321cf.2
        for <llvm@lists.linux.dev>; Mon, 11 May 2026 07:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778511018; x=1779115818;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8ffz+WS/kwatrVzg+MFiCHc5tqdSu3w6k7GM/epuJ1A=;
        b=EyaQ3ABHGo0OxTqjW+wr4If4MHzZUy38QJQxFjwJZEeaT8voWYGl4b1iXilV7yIEdP
         IRmjEKFcOz2zU1PNiDgz9qfSilE8f2kPNp17ngqpI7aHihtUojh5b6Rj+Js/ayvPHeWw
         31Z+ms/bhxeai2Nb0Y49ptYOYzqak09e2396DX+9pWHcPh6bY88zpdPr6hzEGSJcq+2F
         fk9ZnvXrvZiynY34wUW/JN3P4OATfLeWxZKZtGk9G9Jl6dGUHLqAXA2wSZonGcaGy5Tj
         ddrrvZHc+uZIMb824KyPEgkJBX6dLxppDHWE8aLFFqh/2jAnnL2EkITkwFv9y1swGiFw
         aumA==
X-Forwarded-Encrypted: i=1; AFNElJ8AjDhWCgMSdtEkkXUm0MQx2hOXClRsDVkhnwegOBGtQ+IXqalkuZZDvQVpouFV41JAdIbm@lists.linux.dev
X-Gm-Message-State: AOJu0YyOyWTImQ3rzrHxcu5RJo4YGuicXVWTnV7EY7IxwKgLGPik1QM7
	oczcqHnsWWf4wX7e8vVf872tCSrOJlWPlCgNasTKL7Zmx3C8YiOLytBVMfEjMIUn0WXnlykyQMg
	6a2zxPa0LcAUOHLEuxI3W7uh4eiROO3usY3O6tpPLq52qy/24SzKfKgw=
X-Gm-Gg: Acq92OHg97vi0eJ6qD2tLome3wtX4YoyzX0B7gp2P5KwzbA4QN6i5GwJPTMCJSfzXd8
	x3b4mx541/nEAvlY5SC/VA534rOPzo+qEF8Kauf/kyHNfD1S9lLICuEmZPwmJxK4OgUCGJuLyyH
	6gZ3IQURIBL7oSZLxU3ZDnpAiEDBVBy2yxA1lIa0EQ6DxqopaOtjdCv3066oHxe8AhER4ph9LyN
	2L+8ee5ZcQiWcRNKsdwu3gPyJj26ppRyNv7oQUtsVza3b+3wSbf+vZMcQCEqPbSLaBOhErqTiPg
	F2yElm9nohmkAXVIGQFJvDExW7CyDNX10ROUqoN98X3LYoVbqUFd1WE6gXPZ0g3g+QspW27nbmU
	G79GbTrOIbZEWKZwm0HB/SNfyNqXyC5+E+8mCyxu5nPGyz2/NrkwENd0pGPF8IhSZFDc=
X-Received: by 2002:a05:622a:1b1a:b0:50d:8c8f:f94d with SMTP id d75a77b69052e-514621eef47mr364491171cf.52.1778511017840;
        Mon, 11 May 2026 07:50:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1b1a:b0:50d:8c8f:f94d with SMTP id d75a77b69052e-514621eef47mr364490501cf.52.1778511017330;
        Mon, 11 May 2026 07:50:17 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3a906e25sm95748686d6.14.2026.05.11.07.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:50:16 -0700 (PDT)
Date: Mon, 11 May 2026 10:50:14 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-rockchip@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] clk: rockchip: allow COMPILE_TEST builds
Message-ID: <agHspp1KZHZmMeOy@redhat.com>
References: <20260509003602.956186-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260509003602.956186-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HgqcW-xxstn85VXI8uKo27FY1ESWR4_NyY2UgZzbTno_1778511018
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 08, 2026 at 05:36:02PM -0700, Rosen Penev wrote:
> COMMON_CLK_ROCKCHIP already gates the Rockchip clock objects inside the
> Rockchip clock Makefile.  Allow selecting it for COMPILE_TEST and use it
> for the parent Makefile descent instead of ARCH_ROCKCHIP.
> 
> The per-SoC Rockchip clock symbols already have COMPILE_TEST dependencies,
> so this exposes the existing build coverage to other architectures without
> selecting the Rockchip platform.
> 
> Tested with:
> make LLVM=1 ARCH=loongarch drivers/clk/rockchip/
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

