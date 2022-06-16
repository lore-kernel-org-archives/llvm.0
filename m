Received: from gateway30.websitewelcome.com (gateway30.websitewelcome.com [192.185.194.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CCF6AA6
	for <llvm@lists.linux.dev>; Thu, 16 Jun 2022 22:47:33 +0000 (UTC)
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
	by gateway30.websitewelcome.com (Postfix) with ESMTP id D0584845C
	for <llvm@lists.linux.dev>; Thu, 16 Jun 2022 17:26:17 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with SMTP
	id 1xwPoCqtt7B0O1xwPonk9f; Thu, 16 Jun 2022 17:26:17 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=h5zz4gXmeyKQq141JoXnEndda8Y+1z5nbmNrA8Hh7GI=; b=ZddVWYugTRVwUQ9+xBSOwoZ69g
	hAnA0CIMArl+brdZzHTgR+mPlYeHw1d0B5EPigNcn+dKjHAtRTLm0jlubb5ZgclL3NcST+CaIYOWr
	WALaCQJOlvqogBmS8BKirX1Fp26FMgm3zAwdfT9+FvQeid7zjgA8h3AhSPXI8wKmTrgbubh+HwQkL
	WXAZblsgYOmmL/5vrFocIKlW7Q3wk9+J1pzO4Jx/5pGCiJ1znVKhOjEzvGSH8J+Hr9x98IifLjIO+
	BdhaEx5H9GjmhnXzpvSyUI4V+x6Es9Ijs0m/KwG01A958+VsnmKwsJTFrcpOhwvy3vHZqG1slFvI2
	1V0sqDhw==;
Received: from 193.254.29.93.rev.sfr.net ([93.29.254.193]:36014 helo=[192.168.0.101])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <gustavo@embeddedor.com>)
	id 1o1xwN-002J6q-Me;
	Thu, 16 Jun 2022 17:26:16 -0500
Message-ID: <1a60b867-1551-5301-f6f4-19bd93420d36@embeddedor.com>
Date: Fri, 17 Jun 2022 00:26:05 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] hinic: Replace memcpy() with direct assignment
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Tom Rix <trix@redhat.com>, Leon Romanovsky <leon@kernel.org>,
 Jiri Pirko <jiri@nvidia.com>, Vladimir Oltean <olteanv@gmail.com>,
 Simon Horman <simon.horman@corigine.com>, netdev@vger.kernel.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20220616052312.292861-1-keescook@chromium.org>
 <YqtmIIAOH7uRNAZ5@dev-arch.thelio-3990X>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <YqtmIIAOH7uRNAZ5@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 93.29.254.193
X-Source-L: No
X-Exim-ID: 1o1xwN-002J6q-Me
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 193.254.29.93.rev.sfr.net ([192.168.0.101]) [93.29.254.193]:36014
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes



On 6/16/22 19:19, Nathan Chancellor wrote:

> Tested-by: Nathan Chancellor <nathan@kernel.org> # build

I think in this case the tag should be "Build-tested-by" instead.

Thanks
--
Gustavo
