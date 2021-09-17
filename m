Received: from smtp2.emailarray.com (smtp.emailarray.com [69.28.212.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652633FC0
	for <llvm@lists.linux.dev>; Fri, 17 Sep 2021 05:47:57 +0000 (UTC)
Received: (qmail 46522 invoked by uid 89); 17 Sep 2021 05:41:16 -0000
Received: from unknown (HELO localhost) (amxlbW9uQGZsdWdzdmFtcC5jb21AMTYzLjExNC4xMzIuMQ==) (POLARISLOCAL)  
  by smtp2.emailarray.com with SMTP; 17 Sep 2021 05:41:16 -0000
Date: Thu, 16 Sep 2021 22:41:14 -0700
From: Jonathan Lemon <jonathan.lemon@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Richard Cochran <richardcochran@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v2] ptp: ocp: Avoid operator precedence warning
 in ptp_ocp_summary_show()
Message-ID: <20210917054114.u7ivmjfdsw7ta72m@bsd-mbp.dhcp.thefacebook.com>
References: <20210917045204.1385801-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210917045204.1385801-1-nathan@kernel.org>

On Thu, Sep 16, 2021 at 09:52:05PM -0700, Nathan Chancellor wrote:
> Clang warns twice:
> 
> drivers/ptp/ptp_ocp.c:2065:16: error: operator '?:' has lower precedence
> than '&'; '&' will be evaluated first
> [-Werror,-Wbitwise-conditional-parentheses]
>                            on & map ? " ON" : "OFF", src);
>                            ~~~~~~~~ ^
> drivers/ptp/ptp_ocp.c:2065:16: note: place parentheses around the '&'
> expression to silence this warning
>                            on & map ? " ON" : "OFF", src);
>                                     ^
>                            (       )
> drivers/ptp/ptp_ocp.c:2065:16: note: place parentheses around the '?:'
> expression to evaluate it first
>                            on & map ? " ON" : "OFF", src);
>                                     ^
> 
> on and map are both booleans so this should be a logical AND, which
> clears up the operator precedence issue.
> 
> Fixes: a62a56d04e63 ("ptp: ocp: Enable 4th timestamper / PPS generator")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1457
> Suggested-by: Jonathan Lemon <jonathan.lemon@gmail.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Jonathan Lemon <jonathan.lemon@gmail.com>
