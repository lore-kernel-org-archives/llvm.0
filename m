Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6233128E2;
	Tue, 29 Mar 2022 21:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648587978; x=1680123978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RzJHCbmjmJfFhs4f7385Z702T3TtRLJI9GtPCkU8DNQ=;
  b=Q6VNvHXcVWtboG5yGoBaoR6BgJF2uj9penarh3Ki2zwTbo6SIX89cC3Q
   gRtgb4AaL7ePOapHfC8EuZvr4VKJmE+Rj/FjDjYGXcZFn1sFaDwMYUObN
   WpwcbeiIXhYkkNSDrPDfziBNUK8asQovfIV5+XhrEpN1+MeBJbqKWrszb
   Zm3eD5YW3odNGWBU62Uuyv3WRGhrCtndWovoW9BROZC15wcjERuHE+Dl/
   ZYyFD4i1LRlsA8Ea3W/sSK3VxrUBPe96nhvlMe29LVS+npnRjkic3w5Tq
   Llv2LuPpxaS5afDsOwRJEJmArmmxzxGl8BAqLfoPDnl9m6Yw8dkkZnzrT
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="259560119"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="259560119"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 14:06:16 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="653283314"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 14:06:13 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 3CAD6203C9;
	Wed, 30 Mar 2022 00:06:11 +0300 (EEST)
Date: Wed, 30 Mar 2022 00:06:11 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: trix@redhat.com
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org, nathan@kernel.org,
	ndesaulniers@google.com, hverkuil-cisco@xs4all.nl, vrzh@vrzh.net,
	tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] media: staging: atomisp: rework reading the id and
 revision values
Message-ID: <YkN0w5NxLcBFes1b@paasikivi.fi.intel.com>
References: <20220326191853.2914552-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220326191853.2914552-1-trix@redhat.com>

On Sat, Mar 26, 2022 at 12:18:53PM -0700, trix@redhat.com wrote:

Hi Tom,

It seems that somehow the Content-type header of your patch  is
application/octet-stream. I.e. not text.

-- 
Sakari Ailus
