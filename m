Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6077C;
	Wed, 30 Mar 2022 10:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648636400; x=1680172400;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kunbQGKDVh2bu6wOq3lgIjbrLwadGT8XyosrnqASPBE=;
  b=P4PLzPCBhlbNC5lG18GTxNEdtG30tQAZ6Ha5v8D70L8z/oqiUHVqLQZB
   9GlxQOjh7ALVqFnoWC9fAKHlcvotsJJqDfYW73OJoIDWy9l8cULKCufPd
   0IRY59zkXaJpCkTOgw7CFUktf2+UT6tweGM4mpdfc1me3sBLnElYH1AS2
   4QT5ZKtdvQeVBFi3buk9PwCCXVHHTisH4JgTaOVAjxqs3L/WWu0SZpoHD
   hgqWn8TI/GoBmj1PysvDzBhWBg8pRS3AdguNOC1lrl28BgkfdF3nm4t0M
   WIpSjHUxzAGvSv2FXJGIE+95iNNJf5J0Ivax0ueJFkrUAhPpdvzmfTgFW
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="239440159"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="239440159"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 03:33:19 -0700
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="618484605"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 03:33:16 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 9D1EA203C9;
	Wed, 30 Mar 2022 13:33:14 +0300 (EEST)
Date: Wed, 30 Mar 2022 13:33:14 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tom Rix <trix@redhat.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org, nathan@kernel.org,
	ndesaulniers@google.com, hverkuil-cisco@xs4all.nl, vrzh@vrzh.net,
	tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] media: staging: atomisp: rework reading the id and
 revision values
Message-ID: <YkQx6jk5V2/f5mye@paasikivi.fi.intel.com>
References: <20220326191853.2914552-1-trix@redhat.com>
 <YkN0w5NxLcBFes1b@paasikivi.fi.intel.com>
 <2ab474d8-ee4e-44b5-ab3c-38b72135a27f@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ab474d8-ee4e-44b5-ab3c-38b72135a27f@redhat.com>

Hi Tom,

On Tue, Mar 29, 2022 at 04:21:20PM -0700, Tom Rix wrote:
> I'll do a resend.
> 
> I use git send-mail, sooo not sure what went wrong.

The resent patch also has the same Content-type. I looked a bit further and
it seems that this is very probably added by our mail system somehow: it's
not present on the patch I received through a different route. Weird.

git format-patch only seems to add the header sometimes based on some
obscure criteria. It's the first time I see such a problem. It'd at least
help if the Content-type would always be there but that's certainly out of
scope of the patch.

-- 
Regards,

Sakari Ailus
