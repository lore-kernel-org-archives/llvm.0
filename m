Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29158173
	for <llvm@lists.linux.dev>; Wed, 19 Jan 2022 09:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642583815; x=1674119815;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T5k5+aL/Td18XDwN5Hgq2WXf3US5aHXEp9ssQzoBTQA=;
  b=PDyUQHDF6SL78ub9w59FDyAFJTna80cNeZ5qffudTIScQEYvmQVpbPi1
   yKnWksK1HohVVnbzBrEU50lNhbNF/T4JnAQkjBxwrutBWJKMTDoixwRCG
   tpUguRKnAeyXUFcK9VWpfQhxaIMqWLkmtFSvGYqjhOPNh0N+sww30po+J
   AmGieYLtKjwdnUFsMtt8jh4puO3omVjUZiLtT7bYro/p4zHMAGpJb9YoM
   ffGjzI7Ri2he6nDpu5Loo23iEYUgvWIkmvlatyqrTrNtWNQBlkLwdLFOu
   MSyfzUBddu54vT/wXPfFq9e6dR6eGXMyQ/vtPSDsQ+xmlyXmBOL6G/d8K
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="308365007"
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; 
   d="scan'208";a="308365007"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2022 01:16:54 -0800
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; 
   d="scan'208";a="475070518"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2022 01:16:53 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 0112E203C8;
	Wed, 19 Jan 2022 11:16:51 +0200 (EET)
Date: Wed, 19 Jan 2022 11:16:50 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Tu, ShawnX" <shawnx.tu@intel.com>
Cc: lkp <lkp@intel.com>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [sailus-media-tree:master 15/16]
 drivers/media/i2c/hi847.c:2700:35: error: incompatible pointer types passing
 'struct v4l2_subdev_pad_config *' to parameter of type 'struct
 v4l2_subdev_state *'
Message-ID: <YefXAutAzAtffdpf@paasikivi.fi.intel.com>
References: <202201141739.Q7kFIE7g-lkp@intel.com>
 <3e680a691f9543fabf4b2cdc5de2bf6d@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e680a691f9543fabf4b2cdc5de2bf6d@intel.com>

Hi Shawn,

On Wed, Jan 19, 2022 at 03:06:09AM +0000, Tu, ShawnX wrote:
> Hi Sakari,
> 
> It has uploaded fixed V2 patch to the server.
> * [PATCH v2] media: hi847: Add support for Hi-847 sensor
> https://github.com/0day-ci/linux/commits/Shawnx-Tu/media-hi847-Add-support-for-Hi-847-sensor/20220113-120102
> 
> But I still see the lkp build error message and use previous V1 patch to build.
> Could you help to check? If needs to fix the driver, I'll upload new one.

I've replaced the earlier one by v2 in my tree.

-- 
Sakari Ailus
