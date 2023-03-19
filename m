Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03200E4E8
	for <llvm@lists.linux.dev>; Sun, 19 Mar 2023 17:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679247932; x=1710783932;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5JuP9/nP/ir9rJn1olix3yRaaoyjhgM9nbdfg9RKNxQ=;
  b=gWKKTIyBOybWPEU4ioCXqmPlD6EPsUb0Q7hGH5WsFbG5J9tFeU6vtVdg
   qeqObWDOBDrWwq/bStjgxWuIgHef7ukODUX/Xpevxpebiryxe83DkP1hq
   aQqEmMFEp815fLpCJ5tw2Bg2fQ0oI35B9Jcs7SbkmJitc6iiIv1k97iU6
   Slu/jd9QQQAl++LpnhnC4Hrn37M5Edm1K59GIU1zBYWVwP35rGeaT+mFc
   TNKiaSCFj323SJfmCsDeWhTn4atEbCB9dU8yi/4O4myJtbP7fJ7bAOlmL
   s/aMthBQlq4KRBCcxLaCiNJR097Z4cmA86Ic/jQXMAKTDFVaOkNZMkREv
   A==;
X-IronPort-AV: E=Sophos;i="5.98,274,1673938800"; 
   d="scan'208";a="206166099"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Mar 2023 10:45:26 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 19 Mar 2023 10:45:25 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Sun, 19 Mar 2023 10:45:25 -0700
Date: Sun, 19 Mar 2023 18:45:25 +0100
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: Tom Rix <trix@redhat.com>
CC: <rajur@chelsio.com>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <nathan@kernel.org>,
	<ndesaulniers@google.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: Re: [PATCH] net: cxgb3: remove unused fl_to_qset function
Message-ID: <20230319174525.kwhlxme7gh45b3un@soft-dev3-1>
References: <20230319172433.1708161-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230319172433.1708161-1-trix@redhat.com>

The 03/19/2023 13:24, Tom Rix wrote:

Hi Tom,

> 
> clang with W=1 reports
> drivers/net/ethernet/chelsio/cxgb3/sge.c:169:32: error: unused function
>   'fl_to_qset' [-Werror,-Wunused-function]
> static inline struct sge_qset *fl_to_qset(const struct sge_fl *q, int qidx)
>                                ^
> This function is not used, so remove it.

Don't forget to mention in the subject which tree is targeting this
patch.
Other than that looks OK.

Reviewed-by: Horatiu Vultur <horatiu.vultur@microchip.com>

> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/net/ethernet/chelsio/cxgb3/sge.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/chelsio/cxgb3/sge.c b/drivers/net/ethernet/chelsio/cxgb3/sge.c
> index 62dfbdd33365..efa7f401529e 100644
> --- a/drivers/net/ethernet/chelsio/cxgb3/sge.c
> +++ b/drivers/net/ethernet/chelsio/cxgb3/sge.c
> @@ -166,11 +166,6 @@ static u8 flit_desc_map[] = {
>  #endif
>  };
> 
> -static inline struct sge_qset *fl_to_qset(const struct sge_fl *q, int qidx)
> -{
> -       return container_of(q, struct sge_qset, fl[qidx]);
> -}
> -
>  static inline struct sge_qset *rspq_to_qset(const struct sge_rspq *q)
>  {
>         return container_of(q, struct sge_qset, rspq);
> --
> 2.27.0
> 

-- 
/Horatiu
